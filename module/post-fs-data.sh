#!/system/bin/sh
MODDIR=${0%/*}
MODPATH=$MODDIR
CAMERA_DIR=/odm/etc/camera

# Setting access permissions
set_perm_recursive $MODPATH 0 0 0755 0644

# Mounting folders
mount --bind $MODDIR/odm/etc/camera/config /odm/etc/camera/config
mount --bind $MODDIR/odm/etc/power_profile /odm/etc/power_profile
mount --bind $MODDIR/odm/lib64/camera/ /odm/lib64/camera/
mount --bind $MODDIR/odm/firmware/fastchg /odm/firmware/fastchg

# Mounting files
mount --bind $MODDIR/odm/etc/camera/singleblur/personseg.bin /odm/etc/camera/singleblur/personseg.bin
mount --bind $MODDIR/odm/etc/camera/singleblur/preview_seg.json /odm/etc/camera/singleblur/preview_seg.json
# mount --bind $MODDIR/odm/etc/camera/arcsat_fusion.config /odm/etc/camera/arcsat_fusion.config
# mount --bind $MODDIR/odm/etc/camera/arcsoft_eis_configure /odm/etc/camera/arcsoft_eis_configure
mount --bind $MODDIR/odm/etc/camera/camera_engmode.xml /odm/etc/camera/camera_engmode.xml
mount --bind $MODDIR/odm/etc/camera/CameraHWConfiguration.config /odm/etc/camera/CameraHWConfiguration.config
# mount --bind $MODDIR/odm/etc/camera/CameraOemConfiguration.config /odm/etc/camera/CameraOemConfiguration.config
mount --bind $MODDIR/odm/etc/camera/eis_camera.vcfg /odm/etc/camera/eis_camera.vcfg
mount --bind $MODDIR/odm/etc/camera/main_inv_mapxy_33x25.bin /odm/etc/camera/main_inv_mapxy_33x25.bin
mount --bind $MODDIR/odm/etc/camera/main_mapxy_33x25.bin /odm/etc/camera/main_mapxy_33x25.bin
mount --bind $MODDIR/odm/etc/camera/mvg_sat_config.json /odm/etc/camera/mvg_sat_config.json
mount --bind $MODDIR/odm/etc/camera/oplus_eis_camera.vcfg /odm/etc/camera/oplus_eis_camera.vcfg
mount --bind $MODDIR/odm/etc/camera/salient2_seg.bin /odm/etc/camera/salient2_seg.bin
mount --bind $MODDIR/odm/etc/camera/settings_fdc_lite.txt /odm/etc/camera/settings_fdc_lite.txt
mount --bind $MODDIR/odm/etc/camera/settings_fdc.txt /odm/etc/camera/settings_fdc.txt
mount --bind $MODDIR/odm/etc/camera/wide_inv_padding_mapxy_33x25.bin /odm/etc/camera/wide_inv_padding_mapxy_33x25.bin
mount --bind $MODDIR/odm/etc/camera/wide_padding_mapxy_33x25.bin /odm/etc/camera/wide_padding_mapxy_33x25.bin
mount --bind $MODDIR/odm/lib/rfsa/adsp/libQnnHtpV79.so /odm/lib/rfsa/adsp/libQnnHtpV79.so
mount --bind $MODDIR/odm/lib64/hw/camera.oemlayer.so /odm/lib64/hw/camera.oemlayer.so

# Changing SELinux context
chcon -R u:object_r:vendor_configs_file:s0 /odm/etc/camera
chcon -R u:object_r:vendor_file:s0 /odm/lib64/camera
chcon -R u:object_r:vendor_configs_file:s0 /odm/etc/power_profile
chcon -R u:object_r:vendor_configs_file:s0 /odm/firmware/fastchg

chcon u:object_r:same_process_hal_file:s0 /odm/lib/rfsa/adsp/libQnnHtpV75.so
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
