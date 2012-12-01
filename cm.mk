# Release name
PRODUCT_RELEASE_NAME := OptimusV

TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)
$(call inherit-product, vendor/cm/config/cdma.mk)

# Inherit device configuration
$(call inherit-product, device/lge/VM670/VM670.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := VM670
PRODUCT_NAME := cm_VM670
PRODUCT_BRAND := Virgin_Mobile
PRODUCT_MODEL := LG-VM670
PROUDCT_MANUFACTURER := LGE
PRODUCT_CHARACTERISTICS := phone
