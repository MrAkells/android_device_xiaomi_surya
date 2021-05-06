# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter=everything \
    dalvik.vm.image-dex2oat-filter=everything \
    persist.vendor.bt.a2dp.aac_whitelist=false \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aptxadaptive-aac-ldac \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.enable.twsplus=true \
    persist.vendor.btstack.enable.twsplussho=true \
    ro.bluetooth.library_name=libbluetooth_qti.so \
    ro.sf.lcd_density=440 \
    vendor.bluetooth.soc=cherokee
