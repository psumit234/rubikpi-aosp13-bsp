# Device product configuration for Rubik Pi.
# This file is where Android packages and board-specific product settings are defined.

LOCAL_PATH := device/mirafra/rubikpi

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_NAME := aosp_rubikpi
PRODUCT_DEVICE := rubikpi
PRODUCT_BRAND := rubikpi
PRODUCT_MODEL := RubikPi
PRODUCT_MANUFACTURER := Mirafra

# The vendor image is the verified Rubik Pi FlatBuild prebuilt. Keep its HAL,
# init, VINTF, firmware, and SELinux contents intact.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel/Image:kernel \
    $(LOCAL_PATH)/fstab.rubikpi:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(PRODUCT_DEVICE) \
    $(LOCAL_PATH)/prebuilt/vendor_ramdisk/first_stage_ramdisk/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default \
    $(LOCAL_PATH)/prebuilt/vendor_ramdisk/first_stage_ramdisk/fstab.emmc:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.emmc

# Include hardware overlays and default packages.
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    Launcher3 \
    Camera2 \
    librs_jni

# Hardware HAL services are supplied by the prebuilt vendor image. Do not add
# placeholder services here; a service absent from vendor.img can block boot.
