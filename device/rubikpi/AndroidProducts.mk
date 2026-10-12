# Register the product targets for this device.
# The actual product definition lives in aosp_rubikpi.mk.

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_rubikpi.mk

COMMON_LUNCH_CHOICES := \
    aosp_rubikpi-user \
    aosp_rubikpi-userdebug \
    aosp_rubikpi-eng
