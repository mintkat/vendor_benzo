# Inherit additional stuff
$(call inherit-product, vendor/benzo/config/common.mk)

# Wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    PhaseBeam

# Optional packages
PRODUCT_PACKAGES += \
    libncurses \
    nano \
    Terminal
