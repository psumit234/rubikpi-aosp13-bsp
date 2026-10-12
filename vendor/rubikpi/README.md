# Rubik Pi vendor blob staging

Use this tree for selected files extracted from the Rubik Pi Android vendor partition at `super_6.img`.
Keep any extraction workspace local; do not commit the full extracted vendor filesystem.

Copy only files needed by HAL services selected for this product. Preserve their vendor-relative paths under `proprietary/vendor/`:

- `bin/hw/`: HAL service executables
- `etc/init/`: init service definitions
- `etc/vintf/`: the selected device manifest and HAL manifest fragments
- `etc/selinux/`: vendor contexts needed by imported services; do not treat compiled `vendor_sepolicy.cil` as source policy
- `etc/permissions/`: hardware feature declarations required by selected services
- `firmware/`: firmware required by selected drivers or HALs
- `lib/`, `lib64/`: shared-library dependencies
- `lib/hw/`, `lib64/hw/`: hardware implementation libraries

`Android.bp` should declare prebuilt ELF services and libraries. `rubikpi-vendor.mk` should include those modules and install non-ELF configuration files. Keep the source-to-destination list in `proprietary-files.txt` if using a blob extraction helper.

Do not copy the entire extracted vendor filesystem blindly. Check each HAL against the QCS6490/Yupik manifest and verify VINTF compatibility with the Android 13 framework before enabling it.
