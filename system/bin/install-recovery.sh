#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:29072684:f35df76a0449b5cfb143130f29425e8e40b19140; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:25498920:ea2c6402c920dce709752d5938938f3d266953b1 EMMC:/dev/block/bootdevice/by-name/recovery f35df76a0449b5cfb143130f29425e8e40b19140 29072684 ea2c6402c920dce709752d5938938f3d266953b1:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
