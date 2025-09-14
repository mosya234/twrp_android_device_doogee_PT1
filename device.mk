#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure gsi_keys.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
#Adds GSI keys to allow booting of GSIs with AVB

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs - SDCard replacement functionality
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
#This sets some vendor properties, doesn't install any packages

# vendor_boot
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
#Sets PRODUCT_VIRTUAL_AB_OTA to true and ro.virtual_ab.enabled=true
#Installs linker.vendor_ramdisk, e2fsck.vendor_ramdisk and fsck.f2fs.vendor_ramdisk

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
#Install init_first_stage, snapuserd_ramdisk

# Enabling this property, will improve OTA install time
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

LOCAL_PATH := device/doogee/PT1

# API
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 32

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    vendor_boot \
    dtbo \
    system \
    product \
    vendor \
    vendor_dlkm \
    odm \
    odm_dlkm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# Update engine
PRODUCT_PACKAGES += \
    checkpoint_gc \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \
    bootctrl

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh
      
PRODUCT_PACKAGES += \
	linker.vendor_ramdisk \
	e2fsck.vendor_ramdisk \
	resize2fs.vendor_ramdisk \
	fsck.vendor_ramdisk \
	tune2fs.vendor_ramdisk \

# Fastbootd stuff
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mtk \
    android.hardware.fastboot@1.0-impl-mtk.recovery \
    android.hardware.fastboot@1.1-impl-mock \
    android.hardware.fastboot@1.1-impl-mock.recovery \
    fastbootd

# # Build MT-PL-Utils
 PRODUCT_PACKAGES += \
     mtk_plpath_utils \
     mtk_plpath_utils.recovery

# Product characteristics
PRODUCT_CHARACTERISTICS := tablet

# Hide Reflash TWRP
PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
