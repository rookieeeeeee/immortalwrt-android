include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

ANDROID_MENU:=Android Drivers


define KernelPackage/android
  SUBMENU:=$(ANDROID_MENU)
  TITLE:=$(ANDROID_MENU)
  KCONFIG:=CONFIG_ANDROID=y \
	   CONFIG_ANDROID_BINDERFS=y \
	   CONFIG_ANDROID_BINDER_IPC=y \
	   CONFIG_ASHMEM=y \
	   CONFIG_ANDROID_BINDER_IPC_SELFTEST=n \
	   CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
  FILES:= \
    $(LINUX_DIR)/drivers/android/binderfs.ko \
    $(LINUX_DIR)/drivers/staging/android/ashmem.ko
  AUTOLOAD:=$(call AutoLoad,30,binderfs,ashmem)
endef

define KernelPackage/android/description
 Kernel module for android(binderfs,ashmem)
endef


$(eval $(call KernelPackage,android))
