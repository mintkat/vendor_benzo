export USE_HOST_LEX := yes
export USE_ORACLE_JAVA := 1
export USE_CCACHE := 1
export USE_SYSTEM_CCACHE := 1
export BLOCK_BUILD := true
export DISABLE_OPTIMIZATIONS := false
ifneq ($(DISABLE_OPTIMIZATIONS),true)
export USE_O3_OPTIMIZATIONS := true
export FORCE_DISABLE_DEBUGGING := true
export ENABLE_GOLD_LINKER := true
export TARGET_USE_PIPE := true
export KRAIT_TUNINGS := true
export ENABLE_PTHREAD := false
export ENABLE_GOMP := true
export GRAPHITE_OPTS := true
export ENABLE_EXTRAGCC := true
endif
export TARGET_NDK_GCC_VERSION := 5.2
export TARGET_GCC_VERSION_EXP := 5.2
export TARGET_GCC_VERSION := 5.2
export TARGET_GCC_VERSION_KERNEL := 6.0
export KBUILD_BUILD_USER := xanaxdroid
export KBUILD_BUILD_HOST := benzo
export TARGET_DEVICE := shamu
