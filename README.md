# Rubik Pi 3 Android 13 device and vendor configuration

This repository groups the Rubik Pi Android device tree and Mirafra vendor
configuration under the same paths expected by the AOSP build:

- `device/mirafra/rubikpi`
- `vendor/mirafra/rubikpi`

## Use in an AOSP checkout

Copy these two directories into the root of the AOSP checkout, preserving the
paths above. Then select `aosp_rubikpi-userdebug` with `lunch`.

## Vendor image

`vendor/mirafra/rubikpi/prebuilt/vendor.img` is approximately 934 MiB. It is
not committed because GitHub rejects ordinary Git files larger than 100 MiB.
After cloning this repository, copy the matching vendor image from the Rubik Pi
FlatBuild into that path. The device build configuration expects it there.
The smaller ODM image and device prebuilts are included in this repository.

Before redistributing vendor-derived binaries, confirm their applicable
redistribution terms. The large vendor image is intentionally excluded.
