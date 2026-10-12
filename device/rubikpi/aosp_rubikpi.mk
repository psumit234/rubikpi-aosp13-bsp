# Product definition for the Rubik Pi AOSP target.
# This is the top-level product makefile referenced by AndroidProducts.mk.

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_NAME := aosp_rubikpi
PRODUCT_DEVICE := rubikpi
PRODUCT_BRAND := rubikpi
PRODUCT_MODEL := RubikPi
PRODUCT_MANUFACTURER := Rubik Pi
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_PRODUCT_IMAGE := true
PRODUCT_BUILD_SYSTEM_EXT_IMAGE := true
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_EXTRA_VNDK_VERSIONS := 30
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := device/rubikpi/framework_compatibility_matrix.xml

# Bring in the device-specific config.
$(call inherit-product, device/rubikpi/device.mk)
