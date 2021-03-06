# Benzo Rom 
# 
# See config/optimizations/optimizations.mk to set build optimizations
# See config/common_versions.mk to set build numbers and OTA info

# Inherit build optimizations
include vendor/benzo/config/optimizations/optimizations.mk

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=1 \
    persist.debug.wfd.enable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.root_access=3

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0

# Enable MTP by default
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb \
    persist.sys.usb.config=mtp,adb

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/benzo/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions

# Density Backup
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/addon.d/95-backup.sh:system/addon.d/95-backup.sh \
    vendor/benzo/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# init.d support
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/benzo/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# init file
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/init.benzo.rc:root/init.benzo.rc

# Google DNS server
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/benzo/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Layers backup
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/addon.d/71-layers.sh:system/addon.d/71-layers.sh

# SuperSU
PRODUCT_COPY_FILES += \
   vendor/benzo/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
   vendor/benzo/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Assertive Disaply
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/media/display/calib.cfg:system/media/display/calib.cfg
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qcom.ad=1 \
    ro.qcom.ad.sensortype=1 \
    ro.qcom.ad.calib.data=/system/media/display/calib.cfg \
    persist.radio.add_power_save=1 \
    persist.radio.data_no_toggle=1

# Extra packages
PRODUCT_PACKAGES += \
    BenzoBlock \
    Browser \
    Gallery2 \
    KernelAdiutor \
    Launcher3 \
    LayersManager \
    LMT \
    OmniJaws \
    OmniStyle \
    OmniSwitch

# Busybox
PRODUCT_PACKAGES += \
    Busybox

PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay/common

include vendor/benzo/config/optimizations/sm.mk

# Inherit common product build prop overrides
-include vendor/benzo/config/common_versions.mk
