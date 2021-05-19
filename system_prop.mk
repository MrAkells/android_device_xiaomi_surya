# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter=everything \
    dalvik.vm.image-dex2oat-filter=everything

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

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=440

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.mm.enable.qcom_parser=131071983

# Netflix
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q6150-17263-1

# ZRAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.mark_idle_delay_mins=60 \
    ro.zram.first_wb_delay_mins=180 \
    ro.zram.periodic_wb_delay_hours=24

# Zygote
PRODUCT_PROPERTY_OVERRIDES += \
    persist.device_config.runtime_native.usap_pool_enabled=true
