#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/xiaomi/surya/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/rr/config/common_full_phone.mk)

# RR-Stuff
RR_BUILDTYPE := Unofficial
TARGET_FACE_UNLOCK_SUPPORTED := true
BUILD_RR_WALLPAPERS:= true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := rr_surya
PRODUCT_DEVICE := surya
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO X3
PRODUCT_MANUFACTURER := Xiaomi

# Fingerprint
BUILD_FINGERPRINT := google/redfin/redfin:11/RQ2A.210505.003/7255357:user/release-keys
BUILD_DESCRIPTION := redfin-user 11 RQ2A.210505.003 7255357 release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(BUILD_DESCRIPTION)"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
