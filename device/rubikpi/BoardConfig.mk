# Board configuration for the Rubik Pi AOSP target.
# Board values are taken from the Rubik Pi 3 FlatBuild UFS layout.

DEVICE_PATH := device/rubikpi

# Real board data from the Rubik Pi Yocto BSP / device tree:
# - MACHINE family: qcm6490 / qcs6490
# - DT model: Thundercomm, Inc. RUBIK Pi 3
# - DTS: qcs6490-thundercomm-rubikpi3.dts
# - BSP config: qcm6490-idp.conf and qcs6490-rb3gen2-core-kit.conf

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_BOARD_PLATFORM := qcom
TARGET_BOOTLOADER_BOARD_NAME := rubikpi3
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_64_BIT_BINDER := true
BOARD_USES_QCOM_HARDWARE := true
QCOM_BOARD_PLATFORMS := qcom
TARGET_SOC := qcm6490

# Kernel configuration.
# These values are based on the Rubik Pi BSP and Linux DTS, not a generic placeholder.
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel/Image
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += $(DEVICE_PATH)/prebuilt/vendor_ramdisk/lib/modules/msm_drm.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD += $(DEVICE_PATH)/prebuilt/vendor_ramdisk/lib/modules/msm_drm.ko

# Partition layout.
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1006579712
BOARD_VENDORIMAGE_PARTITION_SIZE := 980066304
BOARD_PREBUILT_VENDORIMAGE := vendor/rubikpi/prebuilt/vendor.img
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 346476544
BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE := 782012416
BOARD_ODMIMAGE_PARTITION_SIZE := 1253376
BOARD_PREBUILT_ODMIMAGE := vendor/rubikpi/prebuilt/odm.img
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12884901888
BOARD_FLASH_BLOCK_SIZE := 131072

# Dynamic super layout from the Rubik Pi FlatBuild partition metadata.
BOARD_SUPER_PARTITION_SIZE := 6442450944
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 6438256640
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product system_ext odm
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_ODM := odm

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# FlatBuild uses the standard AOSP userdebug test keys. Generate vbmeta images
# for the AOSP system/product/system_ext images for Qualcomm packaging.
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM := system product system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
# Matches the FlatBuild vbmeta_system rollback index (2023-06-05).
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 1685923200
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Recovery and fstab.
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/fstab.rubikpi

# SELinux policy.
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Optional platform-specific settings.
BOARD_VENDOR := rubikpi
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Keep this minimal and replace with final BSP values as your board is refined.
