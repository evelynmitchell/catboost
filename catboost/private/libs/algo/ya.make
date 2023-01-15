LIBRARY()



SRCS(
    apply.cpp
    approx_calcer.cpp
    approx_calcer_helpers.cpp
    approx_delta_calcer_multi.cpp
    approx_calcer_querywise.cpp
    approx_dimension.cpp
    approx_updater_helpers.cpp
    build_subset_in_leaf.cpp
    bin_tracker.cpp
    calc_score_cache.cpp
    ctr_helper.cpp
    data.cpp
    estimated_features.cpp
    feature_penalties_calcer.cpp
    features_data_helpers.cpp
    fold.cpp
    full_model_saver.cpp
    greedy_tensor_search.cpp
    helpers.cpp
    index_calcer.cpp
    index_hash_calcer.cpp
    leafwise_scoring.cpp
    learn_context.cpp
    model_quantization_adapter.cpp
    monotonic_constraint_utils.cpp
    mvs.cpp
    nonsymmetric_index_calcer.cpp
    online_ctr.cpp
    plot.cpp
    preprocess.cpp
    projection.cpp
    score_calcers.cpp
    scoring.cpp
    split.cpp
    target_classifier.cpp
    tensor_search_helpers.cpp
    train.cpp
    tree_print.cpp
    pairwise_scoring.cpp
    rand_score.cpp
    roc_curve.cpp
    yetirank_helpers.cpp
    confusion_matrix.cpp
)

PEERDIR(
    catboost/private/libs/algo/approx_calcer
    catboost/private/libs/algo_helpers
    catboost/libs/cat_feature
    catboost/libs/data
    catboost/private/libs/data_types
    catboost/libs/eval_result
    catboost/private/libs/feature_estimator
    catboost/private/libs/functools
    catboost/libs/helpers
    catboost/private/libs/index_range
    catboost/private/libs/labels
    catboost/private/libs/lapack
    catboost/libs/loggers
    catboost/libs/logging
    catboost/libs/metrics
    catboost/libs/model
    catboost/private/libs/target
    catboost/private/libs/text_features
    catboost/private/libs/options
    catboost/libs/overfitting_detector
    library/cpp/binsaver
    library/cpp/containers/2d_array
    library/cpp/containers/dense_hash
    library/cpp/containers/stack_vector
    library/cpp/digest/crc32c
    library/cpp/digest/md5
    library/cpp/dot_product
    library/cpp/fast_exp
    library/cpp/fast_log
    library/cpp/grid_creator
    library/cpp/json
    library/cpp/malloc/api
    library/object_factory
    library/cpp/sse
    library/cpp/svnversion
    library/cpp/threading/local_executor
)

END()
