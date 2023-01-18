#define HAVE_ENDIAN_H 1
#define SIZEOF_PY_INTPTR_T 8
#define SIZEOF_OFF_T 8
#define SIZEOF_PY_LONG_LONG 8
#define MATHLIB m
#define HAVE_SIN 1
#define HAVE_COS 1
#define HAVE_TAN 1
#define HAVE_SINH 1
#define HAVE_COSH 1
#define HAVE_TANH 1
#define HAVE_FABS 1
#define HAVE_FLOOR 1
#define HAVE_CEIL 1
#define HAVE_SQRT 1
#define HAVE_LOG10 1
#define HAVE_LOG 1
#define HAVE_EXP 1
#define HAVE_ASIN 1
#define HAVE_ACOS 1
#define HAVE_ATAN 1
#define HAVE_FMOD 1
#define HAVE_MODF 1
#define HAVE_FREXP 1
#define HAVE_LDEXP 1
#define HAVE_RINT 1
#define HAVE_TRUNC 1
#define HAVE_EXP2 1
#define HAVE_LOG2 1
#define HAVE_HYPOT 1
#define HAVE_ATAN2 1
#define HAVE_POW 1
#define HAVE_COPYSIGN 1
#define HAVE_NEXTAFTER 1
#define HAVE_STRTOLL 1
#if !defined(__CYGWIN__)
#define HAVE_STRTOULL 1
#endif
#define HAVE_CBRT 1
#define HAVE_FALLOCATE 1
/* breake test_extension_incref_elide and test_extension_incref_elide_stack
#define HAVE_BACKTRACE 1
*/
#define HAVE_MADVISE 1
#if !defined(__aarch64__) && !defined(__powerpc__)
#define HAVE_XMMINTRIN_H 1
#define HAVE_EMMINTRIN_H 1
#define HAVE_IMMINTRIN_H 1
#endif
#define HAVE_FEATURES_H 1
#define HAVE_DLFCN_H 1
#define HAVE_EXECINFO_H 1
#define HAVE_SYS_MMAN_H 1
#define HAVE_STRTOLD_L 1
#define HAVE___BUILTIN_ISNAN 1
#define HAVE___BUILTIN_ISINF 1
#define HAVE___BUILTIN_ISFINITE 1
#define HAVE___BUILTIN_BSWAP32 1
#define HAVE___BUILTIN_BSWAP64 1
#define HAVE___BUILTIN_EXPECT 1
#define HAVE___BUILTIN_MUL_OVERFLOW 1
#if defined(_x86_64_)
#define HAVE__M_FROM_INT64 1
#define HAVE__MM_LOAD_PS 1
#define HAVE__MM_PREFETCH 1
#define HAVE__MM_LOAD_PD 1
#endif
#define HAVE___BUILTIN_PREFETCH 1
#if defined(_x86_64_)
#define HAVE_LINK_AVX 1
#define HAVE_LINK_AVX2 1
#define HAVE_LINK_AVX512F 1
#define HAVE_LINK_AVX512_SKX 1
#define HAVE_XGETBV 1
#endif
#define HAVE_ATTRIBUTE_OPTIMIZE_UNROLL_LOOPS 1
#define HAVE_ATTRIBUTE_OPTIMIZE_OPT_3 1
#define HAVE_ATTRIBUTE_OPTIMIZE_OPT_2 1
#define HAVE_ATTRIBUTE_NONNULL 1
#if defined(_x86_64_)
#define HAVE_ATTRIBUTE_TARGET_AVX 1
#define HAVE_ATTRIBUTE_TARGET_AVX2 1
#define HAVE_ATTRIBUTE_TARGET_AVX512F 1
#define HAVE_ATTRIBUTE_TARGET_AVX512_SKX 1
#define HAVE_ATTRIBUTE_TARGET_AVX2_WITH_INTRINSICS 1
#define HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS 1
#define HAVE_ATTRIBUTE_TARGET_AVX512_SKX_WITH_INTRINSICS 1
#endif
#define HAVE___THREAD 1
#define HAVE_SINF 1
#define HAVE_COSF 1
#define HAVE_TANF 1
#define HAVE_SINHF 1
#define HAVE_COSHF 1
#define HAVE_TANHF 1
#define HAVE_FABSF 1
#define HAVE_FLOORF 1
#define HAVE_CEILF 1
#define HAVE_RINTF 1
#define HAVE_TRUNCF 1
#define HAVE_SQRTF 1
#define HAVE_LOG10F 1
#define HAVE_LOGF 1
#define HAVE_LOG1PF 1
#define HAVE_EXPF 1
#define HAVE_EXPM1F 1
#define HAVE_ASINF 1
#define HAVE_ACOSF 1
#define HAVE_ATANF 1
#define HAVE_ASINHF 1
#define HAVE_ACOSHF 1
#define HAVE_ATANHF 1
#define HAVE_HYPOTF 1
#define HAVE_ATAN2F 1
#define HAVE_POWF 1
#define HAVE_FMODF 1
#define HAVE_MODFF 1
#define HAVE_FREXPF 1
#define HAVE_LDEXPF 1
#define HAVE_EXP2F 1
#define HAVE_LOG2F 1
#define HAVE_COPYSIGNF 1
#define HAVE_NEXTAFTERF 1
#define HAVE_CBRTF 1
#define HAVE_SINL 1
#define HAVE_COSL 1
#define HAVE_TANL 1
#define HAVE_SINHL 1
#define HAVE_COSHL 1
#define HAVE_TANHL 1
#define HAVE_FABSL 1
#define HAVE_FLOORL 1
#define HAVE_CEILL 1
#define HAVE_RINTL 1
#define HAVE_TRUNCL 1
#define HAVE_SQRTL 1
#define HAVE_LOG10L 1
#define HAVE_LOGL 1
#define HAVE_LOG1PL 1
#define HAVE_EXPL 1
#define HAVE_EXPM1L 1
#define HAVE_ASINL 1
#define HAVE_ACOSL 1
#define HAVE_ATANL 1
#define HAVE_ASINHL 1
#define HAVE_ACOSHL 1
#define HAVE_ATANHL 1
#define HAVE_HYPOTL 1
#define HAVE_ATAN2L 1
#define HAVE_POWL 1
#define HAVE_FMODL 1
#define HAVE_MODFL 1
#define HAVE_FREXPL 1
#define HAVE_LDEXPL 1
#define HAVE_EXP2L 1
#define HAVE_LOG2L 1
#define HAVE_COPYSIGNL 1
#define HAVE_NEXTAFTERL 1
#define HAVE_CBRTL 1
#define HAVE_DECL_ISNAN
#define HAVE_DECL_ISINF
#define HAVE_DECL_SIGNBIT
#define HAVE_DECL_ISFINITE
#define HAVE_COMPLEX_H 1
#define HAVE_CABS 1
#define HAVE_CACOS 1
#define HAVE_CACOSH 1
#define HAVE_CARG 1
#define HAVE_CASIN 1
#define HAVE_CASINH 1
#define HAVE_CATAN 1
#define HAVE_CATANH 1
#define HAVE_CCOS 1
#define HAVE_CCOSH 1
#define HAVE_CEXP 1
#define HAVE_CIMAG 1
#define HAVE_CLOG 1
#define HAVE_CONJ 1
#define HAVE_CPOW 1
#define HAVE_CPROJ 1
#define HAVE_CREAL 1
#define HAVE_CSIN 1
#define HAVE_CSINH 1
#define HAVE_CSQRT 1
#define HAVE_CTAN 1
#define HAVE_CTANH 1
#define HAVE_CABSF 1
#define HAVE_CACOSF 1
#define HAVE_CACOSHF 1
#define HAVE_CARGF 1
#define HAVE_CASINF 1
#define HAVE_CASINHF 1
#define HAVE_CATANF 1
#define HAVE_CATANHF 1
#define HAVE_CCOSF 1
#define HAVE_CCOSHF 1
#define HAVE_CEXPF 1
#define HAVE_CIMAGF 1
#define HAVE_CLOGF 1
#define HAVE_CONJF 1
#define HAVE_CPOWF 1
#define HAVE_CPROJF 1
#define HAVE_CREALF 1
#define HAVE_CSINF 1
#define HAVE_CSINHF 1
#define HAVE_CSQRTF 1
#define HAVE_CTANF 1
#define HAVE_CTANHF 1
#define HAVE_CABSL 1
#define HAVE_CACOSL 1
#define HAVE_CACOSHL 1
#define HAVE_CARGL 1
#define HAVE_CASINL 1
#define HAVE_CASINHL 1
#define HAVE_CATANL 1
#define HAVE_CATANHL 1
#define HAVE_CCOSL 1
#define HAVE_CCOSHL 1
#define HAVE_CEXPL 1
#define HAVE_CIMAGL 1
#define HAVE_CLOGL 1
#define HAVE_CONJL 1
#define HAVE_CPOWL 1
#define HAVE_CPROJL 1
#define HAVE_CREALL 1
#define HAVE_CSINL 1
#define HAVE_CSINHL 1
#define HAVE_CSQRTL 1
#define HAVE_CTANL 1
#define HAVE_CTANHL 1
#define NPY_RESTRICT restrict
#define NPY_RELAXED_STRIDES_DEBUG 0
#if defined(_x86_64_)
#define HAVE_LDOUBLE_INTEL_EXTENDED_16_BYTES_LE 1
#elif defined(_arm64_) || defined(__PPC64__)
#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
#endif
#ifndef __cplusplus
/* #undef inline */
#endif

#ifndef NUMPY_CORE_SRC_COMMON_NPY_CONFIG_H_
#error config.h should never be included directly, include npy_config.h instead
#endif
