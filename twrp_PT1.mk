#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from P3Pro device
$(call inherit-product, device/doogee/PT1/device.mk)

PRODUCT_DEVICE := PT1
PRODUCT_NAME := twrp_PT1
PRODUCT_BRAND := DOOGEE
PRODUCT_MODEL := R10
PRODUCT_MANUFACTURER := doogee

PRODUCT_GMS_CLIENTID_BASE := android-doogee

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="PT1_EEA-user 13 TP1A.220624.014 1689669966 release-keys"

BUILD_FINGERPRINT := DOOGEE/PT1_EEA/PT1:13/TP1A.220624.014/1689669966:user/release-keys
