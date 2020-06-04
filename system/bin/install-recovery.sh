#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:32558380:4acce89d79c5eef1bd334ebc123a1ee673a5160c; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:28882216:6dec29e1cf44fa672a63db59140ea3cc4cc10f21 EMMC:/dev/block/bootdevice/by-name/recovery 4acce89d79c5eef1bd334ebc123a1ee673a5160c 32558380 6dec29e1cf44fa672a63db59140ea3cc4cc10f21:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
