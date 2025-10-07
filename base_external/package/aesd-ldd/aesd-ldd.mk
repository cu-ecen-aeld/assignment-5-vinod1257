##############################################################
#
# aesd-ldd
#
##############################################################

# Reference the same git repository and commit as your aesd-assignments
AESD_LDD_VERSION = b663fa89254d48595e33b6eb2e3eb165efc09c73
AESD_LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-vinod1257.git
AESD_LDD_SITE_METHOD = git
AESD_LDD_GIT_SUBMODULES = YES
AESD_LDD_LICENSE = BSD-3-Clause
AESD_LDD_LICENSE_FILES = LICENSE

# Specify the subdirectories containing the kernel module Makefiles.
# Buildroot's kernel-module infrastructure will handle the rest.
AESD_LDD_MODULE_SUBDIRS = misc-modules scull

# The kernel modules (*.ko files) are installed automatically.
# This define is used to install the helper scripts.
define AESD_LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))