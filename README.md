# Rubik Pi 3 Android 13 device and vendor configuration

This repository groups the Rubik Pi Android device tree and Mirafra vendor
configuration under the same paths expected by the AOSP build:

- `device/mirafra/rubikpi`
- `vendor/mirafra/rubikpi`

## Use in an AOSP checkout

Copy these two directories into the root of the AOSP checkout, preserving the
paths above. Then select `aosp_rubikpi-userdebug` with `lunch`.

## Prebuilt images

No `*.img` files are committed. This excludes `vendor.img` (approximately
934 MiB), as well as `odm.img` and `dtbo.img`. The `.gitignore` rule keeps all
image files out of future commits. For local builds, obtain the matching image
files from the Rubik Pi FlatBuild and place them at the paths expected by the
device configuration.

Before redistributing vendor-derived binaries, confirm their applicable
redistribution terms.
