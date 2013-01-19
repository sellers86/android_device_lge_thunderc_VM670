SUB_MODEL := VM670

PRODUCT_AAPT_CONFIG := normal mdpi 
PRODUCT_AAPT_PREF_CONFIG := mdpi 

$(call inherit-product-if-exists, vendor/lge/thunderc/thunderc-vendor.mk)
$(call inherit-product-if-exists, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)
$(call inherit-product, device/lge/common/device.mk)

# Full-featured build of the Open-Source
$(call inherit-product, build/target/product/full.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/VM670/overlay

# XXX: this is non-standard
LOCAL_KERNEL_DIR := device/lge/VM670/kernels/BobZ
LOCAL_KERNEL_MODULES := tun.ko wireless.ko cifs.ko
	
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL_DIR)/zImage:kernel

PRODUCT_COPY_FILES += \
    $(foreach f,$(LOCAL_KERNEL_MODULES),$(LOCAL_KERNEL_DIR)/$(f):system/lib/modules/$(f))

# thunderc init
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/init.thunderc.rc:root/init.thunderc.rc \

# Live wallpapers
PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni \
    libqdutils

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=BobZ_mr1-staging
PRODUCT_NAME := full_thunderc
PRODUCT_DEVICE := VM670
PRODUCT_BRAND := Virgin_Mobile
PRODUCT_MODEL := LG-VM670
PRODUCT_MANUFACTURER := LGE

CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)
