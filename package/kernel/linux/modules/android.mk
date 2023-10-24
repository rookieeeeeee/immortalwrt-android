ANDROID_MENU:=Android modules

define KernelPackage/android
	SUBMENU:=$(ANDROID_MENU)
	TITLE:=Android Support
	KCONFIG:=ANDROID
	FILES:= \
		$(LINUX_DIR)/drivers/android/binderfs.ko \
		$(LINUX_DIR)/drivers/staging/android/ashmem.ko
	AUTOLOADD:=$(call AutoProbe,binderfs,ashmem)
endef

define KernelPackage/android/description
	Kernel module for android(binderfs,ashmem)
endef

$(eval $(call KernelPackage,android))
