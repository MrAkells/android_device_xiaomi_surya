#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Include pixelgapps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/surya/surya-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

-include $(LOCAL_PATH)/system_prop.mk
-include $(LOCAL_PATH)/product_prop.mk

PRODUCT_BUILD_SUPER_PARTITION := false
BOARD_BUILD_PRODUCT_IMAGE := true
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# AAPT config
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti \
    libbtconfigstore

# Camera
PRODUCT_PACKAGES += \
    Snap
    
#Lawnchair
PRODUCT_PACKAGES += \
    Lawnchair
    
# OPScreenRecord
PRODUCT_PACKAGES += \
    OPScreenRecord
    
#Prebuilts
PRODUCT_PACKAGES += \
    RemovePackages

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-lawnchair.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-lawnchair.xml \
    $(LOCAL_PATH)/configs/lawnchair-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Device Settings
PRODUCT_PACKAGES += \
    XiaomiParts

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/parts/privapp-permissions-parts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-parts.xml

# Dex
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
    
# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

#FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# GPU Firmware
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/a618_gmu.bin:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/firmware/a618_gmu.bin

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 

# Init
PRODUCT_PACKAGES += \
    init.mi_thermald.rc \
    init.device.rc \
    init.qcom.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/sm6150-wcd9375-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sm6150-wcd9375-snd-card_Button_Jack.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_surya

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# Notch style overlay
PRODUCT_PACKAGES += \
    NotchNoFillOverlay

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Overlays - override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.wifi.rtt.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.surya

# Product init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor-overlay/etc/init.qcom.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.qcom.rc

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \

PRODUCT_BOOT_JARS += \
    telephony-ext

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/thermal/lib/android.hardware.thermal@1.0.so:$(TARGET_COPY_OUT_SYSTEM)/lib/android.hardware.thermal@1.0.so \
    $(LOCAL_PATH)/prebuilt/thermal/lib64/android.hardware.thermal@1.0.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/android.hardware.thermal@1.0.so \
    $(LOCAL_PATH)/prebuilt/thermal/vendor/bin/thermal-engine:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/bin/thermal-engine \
    $(LOCAL_PATH)/prebuilt/thermal/vendor/bin/hw/android.hardware.thermal@1.0-service:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/hw/android.hardware.thermal@1.0-service \
    $(LOCAL_PATH)/prebuilt/thermal/vendor/etc/thermal-engine.conf:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/thermal-engine.conf \
    $(LOCAL_PATH)/prebuilt/thermal/vendor/etc/init/android.hardware.thermal@1.0-service.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init/android.hardware.thermal@1.0-service.rc \
    $(LOCAL_PATH)/prebuilt/thermal/vendor/lib/hw/android.hardware.thermal@1.0-impl.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/lib/hw/android.hardware.thermal@1.0-impl.so \
    $(LOCAL_PATH)/prebuilt/thermal/vendor/lib/hw/thermal.sm6150.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/lib/hw/thermal.sm6150.so \
    $(LOCAL_PATH)/prebuilt/thermal/vendor/lib64/hw/android.hardware.thermal@1.0-impl.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/lib64/hw/android.hardware.thermal@1.0-impl.so \
    $(LOCAL_PATH)/prebuilt/thermal/vendor/lib64/hw/thermal.sm6150.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/lib64/hw/thermal.sm6150.so

# Vendor overlay
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor-overlay/etc/qdcm_calib_data_nt36672c_huaxing_fhd_video_mode_dsi_panel.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/qdcm_calib_data_nt36672c_huaxing_fhd_video_mode_dsi_panel.xml \
    $(LOCAL_PATH)/vendor-overlay/etc/qdcm_calib_data_nt36672c_tianma_fhd_video_mode_dsi_panel.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/qdcm_calib_data_nt36672c_tianma_fhd_video_mode_dsi_panel.xml \
    $(LOCAL_PATH)/vendor-overlay/lib/rfsa/adsp/tas25xx_TI_0.bin:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/lib/rfsa/adsp/tas25xx_TI_0.bin

# WiFi Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libnl \
    libqdMetaData \
    libqdMetaData.system

PRODUCT_BOOT_JARS += \
    WfdCommon

PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
