#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

#add_lunch_combo omni_PT1-user
#add_lunch_combo omni_PT1-userdebug
#add_lunch_combo omni_PT1-eng

export ALLOW_MISSING_DEPENDENCIES=true
export FOX_BUILD_DEVICE=PT1
export LC_ALL="C"
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
export FOX_AB_DEVICE=1
export FOX_DISABLE_UPDATEZIP=1
export FOX_VANILLA_BUILD=1
export FOX_NO_SAMSUNG_SPECIAL=1
export FOX_VIRTUAL_AB_DEVICE=1
export OF_NO_REFLASH_CURRENT_ORANGEFOX=1
export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
export OF_DEFAULT_KEYMASTER_VERSION=4.1
export FOX_VENDOR_BOOT_RECOVERY=1
export OF_USE_MAGISKBOOT=0
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=0
export FOX_DELETE_MAGISK_ADDON=1
