# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2025 TeamWin Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Configure core_64_bit.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from our custom product configuration.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device specific configs.
$(call inherit-product, device/doogee/PT1/device.mk)

## Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := PT1
PRODUCT_NAME := twrp_PT1
PRODUCT_BRAND := DOOGEE
PRODUCT_MODEL := R10
PRODUCT_MANUFACTURER := DOOGEE
PRODUCT_RELEASE_NAME := DOOGEE R10

PRODUCT_GMS_CLIENTID_BASE := android-doogee

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="PT1_EEA-user 13 TP1A.220624.014 1689669966 release-keys"

BUILD_FINGERPRINT := DOOGEE/PT1_EEA/PT1:13/TP1A.220624.014/1689669966:user/release-keys
