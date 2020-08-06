Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27FC23D80F
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 10:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgHFIjs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 04:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgHFIjr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 04:39:47 -0400
X-Greylist: delayed 375 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 06 Aug 2020 01:39:45 PDT
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ee9:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1A7C061574
        for <linux-kbuild@vger.kernel.org>; Thu,  6 Aug 2020 01:39:45 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by mailout2.hostsharing.net (Postfix) with ESMTPS id 18B42101899BB;
        Thu,  6 Aug 2020 10:33:22 +0200 (CEST)
Received: from localhost (unknown [87.130.102.138])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id CDBD762418F8;
        Thu,  6 Aug 2020 10:33:21 +0200 (CEST)
X-Mailbox-Line: From c744107b341e487cf37139597a7775f6f62e12e8 Mon Sep 17 00:00:00 2001
Message-Id: <c744107b341e487cf37139597a7775f6f62e12e8.1596702608.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 6 Aug 2020 10:33:22 +0200
Subject: [PATCH] kbuild: Cross-compile binaries to build modules on target
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org,
        kernel-team@fedoraproject.org, kernel@gentoo.org,
        opensuse-kernel@opensuse.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To build external modules, one needs executables such as fixdep and
modpost.  But when cross-compiling the kernel, those executables are
only generated for the host arch, not the target arch.

Distributions ship packages which users need to install in order to
build external modules.  These packages contain headers and Makefiles
from the kernel source tree as well as fixdep & friends.  Usually the
packages are cross-built on a single host arch for the multitude of
arches supported by the distribution.

But because fixdep & friends are only compiled for the host arch,
distributions are forced to duplicate these executables' Makefiles
in order to cross-compile them.  For instance, these are Debian's
duplicated Makefiles:

https://salsa.debian.org/kernel-team/linux/-/tree/master/debian/rules.d/scripts

Make distribution maintainers' lives easier by providing a new target
"make kbuild_install" which cross-compiles the required executables for
the target arch and installs them below $(INSTALL_KBUILD_PATH).

To avoid wasting compile time and disk space, compile only programs
which are essential for building external modules.  They are declared
essential by adding them to extmodprogs.  For now, these are:
recordmcount sign-file fixdep genksyms modpost

The rules to cross-compile the executables reside in Makefile.kbuildinst.
They are similar to the rules in Makefile.host, but I've left out rules
for C++ executables and shared libraries as they're not necessary.

The host versions of the executables are generated in $(obj) whereas
the cross-compiled versions are generated in $(obj)/.cross/ .  This
necessitates a modification of Makefile.lib because the multi_depend
macro creates rules which assume that the target and its dependencies
always reside in $(obj).  Refactor the macro to use $(dir $1) in lieu
of $(obj).  Likewise, the target-stem macro strips $(obj)/ instead
of $(obj)/.cross/.  Refactor it to use $(notdir $@).

In a future step, Makefile.kbuildinst may be extended to also install
headers and other bits necessary for building external modules.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/kbuild/kbuild.rst    |  9 ++++
 Documentation/kbuild/makefiles.rst | 15 ++++++
 Makefile                           | 23 ++++++++-
 scripts/Makefile                   |  3 ++
 scripts/Makefile.build             |  7 +++
 scripts/Makefile.clean             |  4 ++
 scripts/Makefile.kbuildinst        | 81 ++++++++++++++++++++++++++++++
 scripts/Makefile.lib               |  8 +--
 scripts/basic/Makefile             |  1 +
 scripts/genksyms/Makefile          |  1 +
 scripts/mod/Makefile               |  1 +
 11 files changed, 148 insertions(+), 5 deletions(-)
 create mode 100644 scripts/Makefile.kbuildinst

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 2d1fc03d346e..89658b8ce1a7 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -209,6 +209,15 @@ The output directory is often set using "O=..." on the commandline.
 
 The value can be overridden in which case the default value is ignored.
 
+INSTALL_KBUILD_PATH
+-------------------
+INSTALL_KBUILD_PATH specifies where to install a build environment for
+external modules.
+
+The default value is::
+
+    /usr/src/linux-headers-$(KERNELVERSION)
+
 KBUILD_ABS_SRCTREE
 --------------------------------------------------
 Kbuild uses a relative path to point to the tree when possible. For instance,
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index b81b8913a5a3..37de539a5b7c 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -756,6 +756,21 @@ Both possibilities are described in the following.
 	This will tell kbuild to build lxdialog even if not referenced in
 	any rule.
 
+4.6 Host programs necessary to build external modules
+-----------------------------------------------------
+
+	If a host program is necessary to build external modules,
+	it shall be added to extmodprogs in addition to hostprogs.
+
+	Example::
+
+		hostprogs     := fixdep
+		extmodprogs   := fixdep
+
+	This ensures that the host program is installed to a module build
+	environment with "make kbuild_install". It will be cross-compiled
+	for the target architecture if necessary.
+
 5 Userspace Program support
 ===========================
 
diff --git a/Makefile b/Makefile
index ebf4d3ce492c..6c463be070b6 100644
--- a/Makefile
+++ b/Makefile
@@ -644,6 +644,11 @@ endif
 
 export KBUILD_MODULES KBUILD_BUILTIN
 
+# Decide whether to install the build environment for external modules.
+ifneq ($(filter kbuild_install,$(MAKECMDGOALS)),)
+  export KBUILD_INSTALL=y
+endif
+
 ifdef need-config
 include include/config/auto.conf
 endif
@@ -1001,6 +1006,12 @@ export	INSTALL_PATH ?= /boot
 #
 export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)
 
+#
+# INSTALL_KBUILD_PATH specifies where to install the build environment for
+# external modules.  Can be overridden by passing it as an argument.
+#
+export INSTALL_KBUILD_PATH = /usr/src/linux-headers-$(KERNELVERSION)
+
 #
 # INSTALL_MOD_PATH specifies a prefix to MODLIB for module directory
 # relocations required by build roots.  This is not defined in the
@@ -1532,7 +1543,9 @@ help:
 	@echo  '  kernelversion	  - Output the version stored in Makefile (use with make -s)'
 	@echo  '  image_name	  - Output the image name (use with make -s)'
 	@echo  '  headers_install - Install sanitised kernel headers to INSTALL_HDR_PATH'; \
-	 echo  '                    (default: $(INSTALL_HDR_PATH))'; \
+	 echo  '                    (default: $(INSTALL_HDR_PATH))'
+	@echo  '  kbuild_install  - Install module build environment to INSTALL_KBUILD_PATH'; \
+	 echo  '                    (default: $(INSTALL_KBUILD_PATH))'; \
 	 echo  ''
 	@echo  'Static analysers:'
 	@echo  '  checkstack      - Generate a list of stack hogs'
@@ -1628,6 +1641,14 @@ PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
 
+# Module build environment target
+# ---------------------------------------------------------------------------
+PHONY += kbuild_install
+kbuild_install: asm-generic
+	$(Q)$(MAKE) $(build)=scripts/basic
+	$(Q)$(MAKE) $(build)=scripts/mod
+	$(Q)$(MAKE) $(build)=scripts
+
 # Misc
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile b/scripts/Makefile
index bc018e4b733e..c888b7dba0a5 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -29,6 +29,9 @@ endif
 # The following programs are only built on demand
 hostprogs += unifdef
 
+extmodprogs += recordmcount
+extmodprogs += sign-file
+
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a467b9323442..6cfc88331fcb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -59,6 +59,13 @@ ifneq ($(userprogs),)
 include scripts/Makefile.userprogs
 endif
 
+# Do not include kbuild install rules unless needed.
+ifneq ($(KBUILD_INSTALL),)
+ifneq ($(extmodprogs),)
+include scripts/Makefile.kbuildinst
+endif
+endif
+
 ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index d9e0ceace6a6..46d3141f17d5 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -37,6 +37,10 @@ __clean-files	:= \
 # deprecated
 __clean-files	+= $(always) $(hostprogs-y) $(hostprogs-m) $(hostprogs-)
 
+ifneq ($(extmodprogs),)
+__clean-files	+= .cross
+endif
+
 __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
 
 # clean-files is given relative to the current directory, unless it
diff --git a/scripts/Makefile.kbuildinst b/scripts/Makefile.kbuildinst
new file mode 100644
index 000000000000..0b5825f9787e
--- /dev/null
+++ b/scripts/Makefile.kbuildinst
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# only install extmodprogs whose hostprogs counterpart is enabled
+extmodprogs := $(sort $(filter $(extmodprogs),$(notdir $(always-y) $(always-m))))
+
+ifneq ($(extmodprogs),)
+
+extmodprogs-install := $(addprefix $(INSTALL_KBUILD_PATH)/$(obj)/, $(extmodprogs))
+
+ifneq ($(CROSS_COMPILE),)
+
+# ==========================================================================
+# Cross-build binaries necessary to build modules on the target
+
+# C executables compiled from a single .c file
+cross-csingle	:= $(foreach m,$(extmodprogs),$(if $($(m)-objs),,$(m)))
+
+# C executables linked from several .o files
+cross-cmulti	:= $(foreach m,$(extmodprogs),$(if $($(m)-objs),$(m)))
+
+# Object .o files compiled from .c files
+cross-cobjs	:= $(sort $(foreach m,$(cross-cmulti),$($(m)-objs)))
+
+cross-csingle	:= $(addprefix $(obj)/.cross/,$(cross-csingle))
+cross-cmulti	:= $(addprefix $(obj)/.cross/,$(cross-cmulti))
+cross-cobjs	:= $(addprefix $(obj)/.cross/,$(cross-cobjs))
+
+# Create executable from a single .c file
+# cross-csingle -> executable
+quiet_cmd_cross-csingle = CC      $@
+      cmd_cross-csingle = $(CC) $(hostc_flags) $(KBUILD_HOSTLDFLAGS) -o $@ $< \
+			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
+$(cross-csingle): $(obj)/.cross/%: $(src)/%.c FORCE
+	$(call if_changed_dep,cross-csingle)
+
+# Link executable based on list of .o files, all plain C
+# cross-cmulti -> executable
+quiet_cmd_cross-cmulti	= LD      $@
+      cmd_cross-cmulti	= $(CC) $(KBUILD_HOSTLDFLAGS) -o $@ \
+			  $(addprefix $(obj)/.cross/, $($(target-stem)-objs)) \
+			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
+$(cross-cmulti): FORCE
+	$(call if_changed,cross-cmulti)
+$(call multi_depend, $(cross-cmulti), , -objs)
+
+# Create .o file from a single .c file
+# cross-cobjs -> .o
+#
+# Some host-cobjs have special prerequisites.  Apply them to cross-cobjs
+# by letting the cross .o file depend on the host .o file.
+quiet_cmd_cross-cobjs	= CC      $@
+      cmd_cross-cobjs	= $(CC) $(hostc_flags) -c -o $@ $<
+$(cross-cobjs): $(obj)/.cross/%.o: $(src)/%.c $(obj)/%.o FORCE
+	$(call if_changed_dep,cross-cobjs)
+
+# ==========================================================================
+# Install module build environment to $(INSTALL_KBUILD_PATH)
+#
+# When cross-compiling, install cross-compiled versions of the hostprogs.
+# Else install the hostprogs directly.
+
+targets  += $(cross-csingle) $(cross-cmulti) $(cross-cobjs)
+always-y += $(cross-csingle) $(cross-cmulti) $(cross-cobjs)
+
+$(extmodprogs-install): $(INSTALL_KBUILD_PATH)/$(obj)/%: $(obj)/.cross/%
+	$(call cmd,extmodprogs_install,$(dir $@))
+
+else  # !CROSS_COMPILE
+
+$(extmodprogs-install): $(INSTALL_KBUILD_PATH)/$(obj)/%: $(obj)/%
+	$(call cmd,extmodprogs_install,$(dir $@))
+
+endif # !CROSS_COMPILE
+
+quiet_cmd_extmodprogs_install = INSTALL $<
+      cmd_extmodprogs_install = mkdir -p $(2); cp $< $(2)
+
+targets  += $(extmodprogs-install)
+always-y += $(extmodprogs-install)
+
+endif # extmodprogs
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 841ac038132b..260fbfbb3854 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -112,7 +112,7 @@ modname = $(subst $(space),:,$(__modname))
 modfile = $(addprefix $(obj)/,$(__modname))
 
 # target with $(obj)/ and its suffix stripped
-target-stem = $(basename $(patsubst $(obj)/%,%,$@))
+target-stem = $(basename $(notdir $@))
 
 # These flags are needed for modversions and compiling, so we define them here
 # $(modname_flags) defines KBUILD_MODNAME as the name of the module it will
@@ -220,9 +220,9 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
 # Usage:
 #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
 define multi_depend
-$(foreach m, $(notdir $1), \
-	$(eval $(obj)/$m: \
-	$(addprefix $(obj)/, $(foreach s, $3, $($(m:%$(strip $2)=%$(s)))))))
+$(foreach m, $1, \
+	$(eval $m: \
+	$(addprefix $(dir $m), $(foreach s, $3, $($(patsubst %$(strip $2),%$(s),$(notdir $m)))))))
 endef
 
 quiet_cmd_copy = COPY    $@
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index eeb6a38c5551..5dc33f054332 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -3,3 +3,4 @@
 # fixdep: used to generate dependency information during build process
 
 hostprogs-always-y	+= fixdep
+extmodprogs		+= fixdep
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index ce4f99935de5..4910b921e946 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 hostprogs-always-y	+= genksyms
+extmodprogs		+= genksyms
 
 genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 78071681d924..d50acbdeca61 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -2,6 +2,7 @@
 OBJECT_FILES_NON_STANDARD := y
 
 hostprogs-always-y	+= modpost mk_elfconfig
+extmodprogs		+= modpost
 always-y		+= empty.o
 
 modpost-objs	:= modpost.o file2alias.o sumversion.o
-- 
2.27.0

