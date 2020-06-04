#!/system/bin/sh

if [ ! -e /persist/WCNSS_qcom_wlan_nv.bin ]; then 
    echo "persist WCNSS_qcom_wlan_nv.bin does not exist"
    cat /system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_orig.bin >/persist/WCNSS_qcom_wlan_nv.bin
    chmod 644 /persist/WCNSS_qcom_wlan_nv.bin
fi
