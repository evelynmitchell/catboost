#include "train.h"
#include "fold.h"
#include "logger.h"

#include <catboost/libs/logging/profile_info.h>
#include "error_functions.h"
#include "online_ctr.h"
#include "score_calcer.h"
#include "approx_calcer.h"
#include "greedy_tensor_search.h"

#include <catboost/libs/helpers/interrupt.h>

namespace {

void NormalizeLeafValues(const TVector<TIndexType>& indices, int learnSampleCount, TVector<TVector<double>>* treeValues) {
    TVector<int> weights((*treeValues)[0].ysize());
    for (int docIdx = 0; docIdx < learnSampleCount; ++docIdx) {
        ++weights[indices[docIdx]];
    }

    double avrg = 0;
    for (int i = 0; i < weights.ysize(); ++i) {
        avrg += weights[i] * (*treeValues)[0][i];
    }

    int sumWeight = 0;
    for (int w : weights) {
        sumWeight += w;
    }
    avrg /= sumWeight;

    for (auto& value : (*treeValues)[0]) {
        value -= avrg;
    }
}

template <typename TError>
TError BuildError(const NCatboostOptions::TCatBoostOptions& params, const TMaybe<TCustomObjectiveDescriptor>&) {
    return TError(IsStoreExpApprox(params));
}

template <>
inline TQuantileError BuildError<TQuantileError>(const NCatboostOptions::TCatBoostOptions& params, const TMaybe<TCustomObjectiveDescriptor>&) {
    auto lossParams = params.LossFunctionDescription->GetLossParams();
    if (lossParams.empty()) {
        return TQuantileError(IsStoreExpApprox(params));
    } else {
        CB_ENSURE(lossParams.begin()->first == "alpha", "Invalid loss description" << ToString(params.LossFunctionDescription.Get()));
        return TQuantileError(FromString<float>(lossParams["alpha"]), IsStoreExpApprox(params));
    }
}

template <>
inline TLogLinQuantileError BuildError<TLogLinQuantileError>(const NCatboostOptions::TCatBoostOptions& params, const TMaybe<TCustomObjectiveDescriptor>&) {
    auto lossParams = params.LossFunctionDescription->GetLossParams();
    if (lossParams.empty()) {
        return TLogLinQuantileError(IsStoreExpApprox(params));
    } else {
        CB_ENSURE(lossParams.begin()->first == "alpha", "Invalid loss description" << ToString(params.LossFunctionDescription.Get()));
        return TLogLinQuantileError(FromString<float>(lossParams["alpha"]), IsStoreExpApprox(params));
    }
}

template <>
inline TCustomError BuildError<TCustomError>(const NCatboostOptions::TCatBoostOptions& params,
    const TMaybe<TCustomObjectiveDescriptor>& descriptor) {
    Y_ASSERT(descriptor.Defined());
    return TCustomError(params, descriptor);
}

template <>
inline TUserDefinedPerObjectError BuildError<TUserDefinedPerObjectError>(const NCatboostOptions::TCatBoostOptions& params, const TMaybe<TCustomObjectiveDescriptor>&) {
    return TUserDefinedPerObjectError(params.LossFunctionDescription->GetLossParams(), IsStoreExpApprox(params));
}

template <>
inline TUserDefinedQuerywiseError BuildError<TUserDefinedQuerywiseError>(const NCatboostOptions::TCatBoostOptions& params, const TMaybe<TCustomObjectiveDescriptor>&) {
    return TUserDefinedQuerywiseError(params.LossFunctionDescription->GetLossParams(), IsStoreExpApprox(params));
}

template <typename TError>
void CalcWeightedDerivatives(const TVector<TVector<double>>& approx,
    const TVector<float>& target,
    const TVector<float>& weight,
    const TVector<ui32>& queriesId,
    const THashMap<ui32, ui32>& queriesSize,
    const TVector<TVector<TCompetitor>>& competitors,
    const TError& error,
    int tailFinish,
    TLearnContext* ctx,
    TVector<TVector<double>>* derivatives) {
    if (error.GetErrorType() == EErrorType::QuerywiseError) {
        TVector<TDer1Der2> ders((*derivatives)[0].ysize());
        error.CalcDersForQueries(0, tailFinish, approx[0], target, weight, queriesId, queriesSize, &ders);
        for (int docId = 0; docId < ders.ysize(); ++docId) {
            (*derivatives)[0][docId] = ders[docId].Der1;
        }
    } else if (error.GetErrorType() == EErrorType::PairwiseError) {
        error.CalcDersPairs(approx[0], competitors, 0, tailFinish, &(*derivatives)[0]);
    } else {
        int approxDimension = approx.ysize();
        NPar::TLocalExecutor::TExecRangeParams blockParams(0, tailFinish);
        blockParams.SetBlockSize(1000);

        Y_ASSERT(error.GetErrorType() == EErrorType::PerObjectError);
        if (approxDimension == 1) {
            ctx->LocalExecutor.ExecRange([&](int blockId) {
                const int blockOffset = blockId * blockParams.GetBlockSize();
                error.CalcFirstDerRange(blockOffset, Min<int>(blockParams.GetBlockSize(), tailFinish - blockOffset),
                    approx[0].data(),
                    nullptr, // no approx deltas
                    target.data(),
                    weight.data(),
                    (*derivatives)[0].data());
            }, 0, blockParams.GetBlockCount(), NPar::TLocalExecutor::WAIT_COMPLETE);
        } else {
            ctx->LocalExecutor.ExecRange([&](int blockId) {
                TVector<double> curApprox(approxDimension);
                TVector<double> curDelta(approxDimension);
                NPar::TLocalExecutor::BlockedLoopBody(blockParams, [&](int z) {
                    for (int dim = 0; dim < approxDimension; ++dim) {
                        curApprox[dim] = approx[dim][z];
                    }
                    error.CalcDersMulti(curApprox, target[z], weight.empty() ? 1 : weight[z], &curDelta, nullptr);
                    for (int dim = 0; dim < approxDimension; ++dim) {
                        (*derivatives)[dim][z] = curDelta[dim];
                    }
                })(blockId);
            }, 0, blockParams.GetBlockCount(), NPar::TLocalExecutor::WAIT_COMPLETE);
        }
    }
}

template <typename TError>
void TrainOneIter(const TTrainData& data,
    TLearnContext* ctx) {
    TError error = BuildError<TError>(ctx->Params, ctx->ObjectiveDescriptor);
    TProfileInfo& profile = ctx->Profile;

    const auto sampleCount = data.GetSampleCount();
    const int approxDimension = ctx->LearnProgress.AvrgApprox.ysize();

    const auto& metricOptions = ctx->Params.MetricOptions.Get();
    TVector<THolder<IMetric>> errors = CreateMetrics(metricOptions.EvalMetric,
        ctx->EvalMetricDescriptor,
        metricOptions.CustomMetrics,
        approxDimension);

    auto splitCounts = CountSplits(ctx->LearnProgress.FloatFeatures);

    const int foldCount = ctx->LearnProgress.Folds.ysize();
    const int currentIteration = ctx->LearnProgress.TreeStruct.ysize();

    MATRIXNET_NOTICE_LOG << currentIteration << ": ";
    profile.StartNextIteration();

    CheckInterrupted(); // check after long-lasting operation

    double modelLength = currentIteration * ctx->Params.BoostingOptions->LearningRate;

    TSplitTree bestSplitTree;
    {
        TFold* takenFold = &ctx->LearnProgress.Folds[ctx->Rand.GenRand() % foldCount];
        ctx->LocalExecutor.ExecRange([&](int bodyTailId) {
            TFold::TBodyTail& bt = takenFold->BodyTailArr[bodyTailId];
            CalcWeightedDerivatives<TError>(bt.Approx,
                takenFold->LearnTarget,
                takenFold->LearnWeights,
                takenFold->LearnQueryId,
                takenFold->LearnQuerySize,
                bt.Competitors,
                error,
                bt.TailFinish,
                ctx,
                &bt.Derivatives);
        }, 0, takenFold->BodyTailArr.ysize(), NPar::TLocalExecutor::WAIT_COMPLETE);
        profile.AddOperation("Calc derivatives");

        GreedyTensorSearch(
            data,
            splitCounts,
            modelLength,
            profile,
            takenFold,
            ctx,
            &bestSplitTree);
    }
    CheckInterrupted(); // check after long-lasting operation
    {
        TVector<TFold*> trainFolds;
        for (int foldId = 0; foldId < foldCount; ++foldId) {
            trainFolds.push_back(&ctx->LearnProgress.Folds[foldId]);
        }

        TrimOnlineCTRcache(trainFolds);
        TrimOnlineCTRcache({ &ctx->LearnProgress.AveragingFold });
        {
            TVector<TFold*> allFolds = trainFolds;
            allFolds.push_back(&ctx->LearnProgress.AveragingFold);

            TVector<TCalcOnlineCTRsBatchTask> parallelJobsData;
            for (const auto& split : bestSplitTree.Splits) {
                if (split.Type != ESplitType::OnlineCtr) {
                    continue;
                }

                auto& proj = split.Ctr.Projection;
                for (auto* foldPtr : allFolds) {
                    if (!foldPtr->GetCtrs(proj).has(proj)) {
                        parallelJobsData.emplace_back(TCalcOnlineCTRsBatchTask{ proj, foldPtr, &foldPtr->GetCtrRef(proj) });
                    }
                }
            }
            CalcOnlineCTRsBatch(parallelJobsData, data, ctx);
        }
        profile.AddOperation("ComputeOnlineCTRs for tree struct (train folds and test fold)");
        CheckInterrupted(); // check after long-lasting operation

        TVector<TVector<TVector<TVector<double>>>> approxDelta;
        CalcApproxForLeafStruct(
            data,
            error,
            trainFolds,
            bestSplitTree,
            ctx,
            &approxDelta);
        profile.AddOperation("CalcApprox tree struct");
        CheckInterrupted(); // check after long-lasting operation

        const double learningRate = ctx->Params.BoostingOptions->LearningRate;

        for (int foldId = 0; foldId < foldCount; ++foldId) {
            TFold& ff = ctx->LearnProgress.Folds[foldId];

            for (int bodyTailId = 0; bodyTailId < ff.BodyTailArr.ysize(); ++bodyTailId) {
                TFold::TBodyTail& bt = ff.BodyTailArr[bodyTailId];
                for (int dim = 0; dim < approxDimension; ++dim) {
                    double* approxDeltaData = approxDelta[foldId][bodyTailId][dim].data();
                    double* approxData = bt.Approx[dim].data();
                    ctx->LocalExecutor.ExecRange([=](int z) {
                        approxData[z] = UpdateApprox<TError::StoreExpApprox>(approxData[z], ApplyLearningRate<TError::StoreExpApprox>(approxDeltaData[z], learningRate));
                    }, NPar::TLocalExecutor::TExecRangeParams(0, bt.TailFinish).SetBlockSize(10000)
                        , NPar::TLocalExecutor::WAIT_COMPLETE);
                }
            }
        }
        profile.AddOperation("Update tree structure approx");
        CheckInterrupted(); // check after long-lasting operation

        TVector<TIndexType> indices;
        TVector<TVector<double>> treeValues;
        CalcLeafValues(data,
            bestSplitTree,
            error,
            ctx,
            &treeValues,
            &indices);

        // TODO(nikitxskv): if this will be a bottleneck, we can use precalculated counts.
        if (IsPairwiseError(ctx->Params.LossFunctionDescription->GetLossFunction())) {
            NormalizeLeafValues(indices, data.LearnSampleCount, &treeValues);
        }

        TVector<TVector<double>> expTreeValues;
        expTreeValues.yresize(approxDimension);
        for (int dim = 0; dim < approxDimension; ++dim) {
            for (auto& leafVal : treeValues[dim]) {
                leafVal *= learningRate;
            }
            expTreeValues[dim] = treeValues[dim];
            ExpApproxIf(TError::StoreExpApprox, &expTreeValues[dim]);
        }

        profile.AddOperation("CalcApprox result leafs");
        CheckInterrupted(); // check after long-lasting operation

        Y_ASSERT(ctx->LearnProgress.AveragingFold.BodyTailArr.ysize() == 1);
        TFold::TBodyTail& bt = ctx->LearnProgress.AveragingFold.BodyTailArr[0];

        const int tailFinish = bt.TailFinish;
        const int learnSampleCount = data.LearnSampleCount;
        const int* learnPermutationData = ctx->LearnProgress.AveragingFold.LearnPermutation.data();
        const TIndexType* indicesData = indices.data();
        for (int dim = 0; dim < approxDimension; ++dim) {
            const double* expTreeValuesData = expTreeValues[dim].data();
            const double* treeValuesData = treeValues[dim].data();
            double* approxData = bt.Approx[dim].data();
            double* avrgApproxData = ctx->LearnProgress.AvrgApprox[dim].data();
            ctx->LocalExecutor.ExecRange([=](int docIdx) {
                const int permutedDocIdx = docIdx < learnSampleCount ? learnPermutationData[docIdx] : docIdx;
                if (docIdx < tailFinish) {
                    approxData[docIdx] = UpdateApprox<TError::StoreExpApprox>(approxData[docIdx], expTreeValuesData[indicesData[docIdx]]);
                }
                avrgApproxData[permutedDocIdx] += treeValuesData[indicesData[docIdx]];
            }, NPar::TLocalExecutor::TExecRangeParams(0, sampleCount).SetBlockSize(10000)
                , NPar::TLocalExecutor::WAIT_COMPLETE);
        }

        ctx->LearnProgress.LeafValues.push_back(treeValues);
        ctx->LearnProgress.TreeStruct.push_back(bestSplitTree);

        profile.AddOperation("Update final approxes");
        CheckInterrupted(); // check after long-lasting operation
    }
}
}

TErrorTracker BuildErrorTracker(bool isMaxOptimal, bool hasTest, TLearnContext* ctx) {
    const auto& odOptions = ctx->Params.BoostingOptions->OverfittingDetector;
    return TErrorTracker(odOptions->OverfittingDetectorType,
                         isMaxOptimal,
                         odOptions->AutoStopPValue,
                         odOptions->IterationsWait,
                         true,
                         hasTest);
}

TTrainOneIterationFunc GetOneIterationFunc(ELossFunction lossFunction) {
    switch (lossFunction) {
        case ELossFunction::Logloss:
            return TrainOneIter<TLoglossError>;
            break;
        case ELossFunction::CrossEntropy:
            return TrainOneIter<TCrossEntropyError>;
            break;
        case ELossFunction::RMSE:
            return TrainOneIter<TRMSEError>;
            break;
        case ELossFunction::MAE:
        case ELossFunction::Quantile:
            return TrainOneIter<TQuantileError>;
            break;
        case ELossFunction::LogLinQuantile:
            return TrainOneIter<TLogLinQuantileError>;
            break;
        case ELossFunction::MAPE:
            return TrainOneIter<TMAPError>;
            break;
        case ELossFunction::Poisson:
            return TrainOneIter<TPoissonError>;
            break;
        case ELossFunction::MultiClass:
            return TrainOneIter<TMultiClassError>;
            break;
        case ELossFunction::MultiClassOneVsAll:
            return TrainOneIter<TMultiClassOneVsAllError>;
            break;
        case ELossFunction::PairLogit:
            return TrainOneIter<TPairLogitError>;
            break;
        case ELossFunction::QueryRMSE:
            return TrainOneIter<TQueryRmseError>;
            break;
        case ELossFunction::Custom:
            return TrainOneIter<TCustomError>;
            break;
        case ELossFunction::UserPerObjErr:
            return TrainOneIter<TUserDefinedPerObjectError>;
            break;
        case ELossFunction::UserQuerywiseErr:
            return TrainOneIter<TUserDefinedQuerywiseError>;
            break;
        default:
            CB_ENSURE(false, "provided error function is not supported");
    }
}
