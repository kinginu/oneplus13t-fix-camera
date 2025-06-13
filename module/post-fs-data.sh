#!/system/bin/sh
MODDIR=${0%/*}
MODPATH=$MODDIR
CAMERA_DIR=/odm/etc/camera


# Setting access permissions
set_perm_recursive $MODPATH 0 0 0755 0644


# Mounting /odm/etc/camera/
mount --bind $MODDIR/odm/etc/camera/config /odm/etc/camera/config
mount --bind $MODDIR/odm/etc/camera/CameraHWConfiguration.config /odm/etc/camera/CameraHWConfiguration.config
mount --bind $MODDIR/odm/etc/camera/Owl_Algo_model /odm/etc/camera/Owl_Algo_model
mount --bind $MODDIR/odm/etc/camera/camera_engmode.xml /odm/etc/camera/camera_engmode.xml
mount --bind $MODDIR/odm/etc/camera/dng /odm/etc/camera/dng
mount --bind $MODDIR/odm/etc/camera/eis_camera.vcfg /odm/etc/camera/eis_camera.vcfg
mount --bind $MODDIR/odm/etc/camera/facerestore /odm/etc/camera/facerestore
mount --bind $MODDIR/odm/etc/camera/fwk_config.json /odm/etc/camera/fwk_config.json
# mount --bind $MODDIR/odm/etc/omoji /odm/etc/omoji
mount --bind $MODDIR/odm/etc/camera/oplus_eis_camera.vcfg /odm/etc/camera/oplus_eis_camera.vcfg
mount --bind $MODDIR/odm/etc/camera/settings_fdc.txt /odm/etc/camera/settings_fdc.txt
mount --bind $MODDIR/odm/etc/camera/settings_fdc_lite.txt /odm/etc/camera/settings_fdc_lite.txt
mount --bind $MODDIR/odm/etc/camera/vainr_cfg.json /odm/etc/camera/vainr_cfg.json

# Mounting /odm/etc/power_profile
mount --bind $MODDIR/odm/etc/power_profile /odm/etc/power_profile

# Mounting /odm/firmware/fastchg
mount --bind $MODDIR/odm/firmware/fastchg /odm/firmware/fastchg

# # Mounting /odm/lib/rfsa/adsp/
# mount --bind $MODDIR/odm/lib/rfsa/adsp /odm/lib/rfsa/adsp

# Mounting /odm/lib64
mount --bind $MODDIR/odm/lib64/vendor.oplus.hardware.camera.aon-service-impl.so /odm/lib64/vendor.oplus.hardware.camera.aon-service-impl.so
mount --bind $MODDIR/odm/lib64/vendor.oplus.hardware.eid-V1-ndk.so /odm/lib64/vendor.oplus.hardware.esim-V1-ndk.so

# Mounting /odm/lib64/camera/
mount --bind $MODDIR/odm/lib64/camera /odm/lib64/camera

# Mounting /odm/lib64/hw/
mount --bind $MODDIR/odm/lib64/hw/camera.oemlayer.so /odm/lib64/hw/camera.oemlayer.so


# Changing SELinux context
chcon -R u:object_r:vendor_configs_file:s0 /odm/etc/camera
chcon -R u:object_r:vendor_file:s0 /odm/lib64/camera
chcon -R u:object_r:vendor_configs_file:s0 /odm/etc/power_profile
chcon -R u:object_r:vendor_configs_file:s0 /odm/firmware/fastchg

chcon u:object_r:vendor_file:s0 /odm/lib64/hw/camera.oemlayer.so


# Temporary folder for substitution
TMPDIR=/data/adb/tmp/empty_dir
mkdir -p $TMPDIR


# Removing files
touch $TMPDIR/oplus_camera_algo_traversal_config.json
mount --bind $TMPDIR/oplus_camera_algo_traversal_config.json $CAMERA_DIR/oplus_camera_algo_traversal_config.json

touch $TMPDIR/tele_inv_mapxy_33x25.bin
mount --bind $TMPDIR/tele_inv_mapxy_33x25.bin $CAMERA_DIR/tele_inv_mapxy_33x25.bin

touch $TMPDIR/tele_mapxy_33x25.bin
mount --bind $TMPDIR/tele_mapxy_33x25.bin $CAMERA_DIR/tele_mapxy_33x25.bin
