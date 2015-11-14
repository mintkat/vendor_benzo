# Inherit additional stuff
ifneq ($(filter benzo_shamu,$(TARGET_PRODUCT)),)
$(call inherit-product, vendor/benzo/config/common.mk)
else
$(call inherit-product, vendor/benzo/config/common64.mk)
endif

# Optional packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    PhaseBeam

