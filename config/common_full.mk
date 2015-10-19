# System
export USE_HOST_LEX := yes
export USE_JAVA8 := 1
export USE_CCACHE := 1
export USE_SYSTEM_CCACHE := 1
export BLOCK_BUILD := false

# Target device
export TARGET_DEVICE := angler

# Inherit additional stuff
$(call inherit-product, vendor/benzo/config/common.mk)

# Optional packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    PhaseBeam

