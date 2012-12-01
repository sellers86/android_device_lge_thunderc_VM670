# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

-include vendor/lge/thunderc/BoardConfigVendor.mk
-include device/lge/common/BoardConfigCommon.mk

BOARD_KERNEL_CMDLINE := mem=471M console=ttyMSM2,115200n8 androidboot.hardware=thunderc no_console_suspend

TARGET_BOOTLOADER_BOARD_NAME := thunderc
TARGET_OTA_ASSERT_DEVICE := thunderc,VM670,thunderc_VM670,LG-VM670,LS670,thunderc_LS670,LG-LS670

# Enable ICS-backwards compatibility
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT
# Disable PIE since it breaks ICS camera blobs
TARGET_DISABLE_ARM_PIE := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DFORCE_CPU_UPLOAD
COMMON_GLOBAL_CFLAGS += -DMISSING_JB_EGL
COMMON_GLOBAL_CFLAGS += -DUSES_LEGACY_GRAPHICS
BOARD_USES_LEGACY_GRAPHICS := true
