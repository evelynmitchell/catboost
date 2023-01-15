#pragma once

#include "meta_info.h"

#include <catboost/private/libs/options/feature_penalties_options.h>
#include <catboost/private/libs/options/json_helper.h>
#include <catboost/private/libs/options/load_options.h>
#include <catboost/private/libs/options/monotone_constraints.h>

#include <library/cpp/json/json_reader.h>

#include <util/generic/algorithm.h>
#include <util/string/split.h>
#include <util/string/type.h>


TMap<TString, ui32> MakeIndicesFromNames(const NCatboostOptions::TPoolLoadParams& poolLoadParams);
TMap<TString, ui32> MakeIndicesFromNames(const NCB::TDataMetaInfo& metaInfo);

inline ui32 ConvertToIndex(const TString& nameOrIndex, const TMap<TString, ui32>& indicesFromNames) {
    if (IsNumber(nameOrIndex)) {
        return FromString<ui32>(nameOrIndex);
    } else {
        CB_ENSURE(
            indicesFromNames.contains(nameOrIndex),
            "String " + nameOrIndex + " is not a feature name");
        return indicesFromNames.at(nameOrIndex);
    }
}

void ConvertPerFeatureOptionsFromStringToIndices(const TMap<TString, ui32>& indicesFromNames, NJson::TJsonValue* options);

template <typename TSource>
void ConvertAllFeaturePenaltiesFromStringToIndices(const TSource& matchingSource, NJson::TJsonValue* catBoostJsonOptions) {
    auto& treeOptions = (*catBoostJsonOptions)["tree_learner_options"];
    if (!treeOptions.Has("penalties")) {
        return;
    }

    auto& penaltiesRef = treeOptions["penalties"];
    const auto namesToIndicesMap = MakeIndicesFromNames(matchingSource);

    if (penaltiesRef.Has("feature_weights")) {
        ConvertPerFeatureOptionsFromStringToIndices(namesToIndicesMap, &penaltiesRef["feature_weights"]);
    }
    if (penaltiesRef.Has("first_feature_use_penalties")) {
        ConvertPerFeatureOptionsFromStringToIndices(namesToIndicesMap, &penaltiesRef["first_feature_use_penalties"]);
    }
    if (penaltiesRef.Has("per_object_feature_penalties")) {
        ConvertPerFeatureOptionsFromStringToIndices(namesToIndicesMap, &penaltiesRef["per_object_feature_penalties"]);
    }
}

void ConvertIgnoredFeaturesFromStringToIndices(const NCatboostOptions::TPoolLoadParams& poolLoadParams, NJson::TJsonValue* catBoostJsonOptions);
void ConvertIgnoredFeaturesFromStringToIndices(const NCB::TDataMetaInfo& metaInfo, NJson::TJsonValue* catBoostJsonOptions);
void ConvertMonotoneConstraintsFromStringToIndices(const NCB::TDataMetaInfo& metaInfo, NJson::TJsonValue* catBoostJsonOptions);
void ConvertMonotoneConstraintsFromStringToIndices(const NCatboostOptions::TPoolLoadParams& poolLoadParams, NJson::TJsonValue* catBoostJsonOptions);
void ConvertFeaturesToEvaluateFromStringToIndices(const NCatboostOptions::TPoolLoadParams& poolLoadParams, NJson::TJsonValue* catBoostJsonOptions);

template <typename TSource>
void ConvertFeaturesForSelectFromStringToIndices(const TSource& stringsToIndicesMatchingSource, NJson::TJsonValue* featuresSelectJsonOptions) {
    const auto& indicesFromNames = MakeIndicesFromNames(stringsToIndicesMatchingSource);
    const auto& featureNamesForSelect = (*featuresSelectJsonOptions)["features_for_select"].GetString();
    TVector<int> featuresForSelect;
    for (const auto& nameOrRange : StringSplitter(featureNamesForSelect).Split(',').SkipEmpty()) {
        const TString nameOrRangeAsString(nameOrRange);
        auto left = nameOrRangeAsString;
        auto right = nameOrRangeAsString;
        StringSplitter(nameOrRangeAsString).Split('-').TryCollectInto(&left, &right);
        for (ui32 idx : xrange(ConvertToIndex(left, indicesFromNames), ConvertToIndex(right, indicesFromNames) + 1)) {
            featuresForSelect.push_back(idx);
        }
    }
    Sort(featuresForSelect);
    NCatboostOptions::TJsonFieldHelper<TVector<int>>::Write(
        TVector<int>(featuresForSelect.begin(), Unique(featuresForSelect.begin(), featuresForSelect.end())),
        &(*featuresSelectJsonOptions)["features_for_select"]);
}

template <typename TSource>
void ConvertParamsToCanonicalFormat(const TSource& stringsToIndicesMatchingSource, NJson::TJsonValue* catBoostJsonOptions) {
    ConvertMonotoneConstraintsToCanonicalFormat(catBoostJsonOptions);
    ConvertMonotoneConstraintsFromStringToIndices(stringsToIndicesMatchingSource, catBoostJsonOptions);
    NCatboostOptions::ConvertAllFeaturePenaltiesToCanonicalFormat(catBoostJsonOptions);
    ConvertAllFeaturePenaltiesFromStringToIndices(stringsToIndicesMatchingSource, catBoostJsonOptions);
}

// feature names - dependent params are returned in result and removed from catBoostJsonOptions
NJson::TJsonValue ExtractFeatureNamesDependentParams(NJson::TJsonValue* catBoostJsonOptions);

// feature names - dependent params are added to catBoostJsonOptions
void AddFeatureNamesDependentParams(const NJson::TJsonValue& featureNamesDependentOptions, NJson::TJsonValue* catBoostJsonOptions);

