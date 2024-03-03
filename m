Return-Path: <linux-kbuild+bounces-1118-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F1186F881
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9AB01C2084B
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6129E15B7;
	Mon,  4 Mar 2024 02:21:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C9015D1
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518875; cv=none; b=EUfOAkNxGRJBohB7/o+2LeipCvZdFfqQgMJp+p1hRHiLkRtaVL/DE3DlznigYke7HnoPMDjLJR3j32fUPkfc8YMqnN+myIAht4BjixXBn9X50wuIqDcGBq605IyKmke4Rn7IoWOMEZRBXylDPLf8dypJsD9hms35GDuOiqVz3yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518875; c=relaxed/simple;
	bh=JTITSqUrOWcYFaPZdYQcszIM02W5zfh3bSuJ8rO9azA=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=T9qgdV/hm8WIf6W/KKHP6dFL4RAlTI86ZVyHJ+2RFVd90E0aOo9KoIdUgoBP6cn+WqCZgQkL5C09YxrA6Voh5xmjumWEHfs3fLhXnGucbhUMxzxP/U5VwUBvS/nyYhbR498dIucBj5hQmgFwjkTHLmvtFMSk8b1lzLbo5Pgo+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242Kbr0021895
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:20:42 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242KawP021894;
	Sun, 3 Mar 2024 18:20:36 -0800 (PST)
	(envelope-from ehem)
Message-Id: <179e4f317aad411889187c01037becff85ba937f.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 10/30] scripts: modify uses of $(srctree) to assume
 trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Date: Tue, 20 Feb 2024 09:13:37 -0800

This isn't much more than `find | sed` to adjust all uses of $(srctree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:

find . -name Makefile\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 scripts/Makefile                    |  6 +++---
 scripts/Makefile.asm-generic        |  8 ++++----
 scripts/Makefile.build              | 22 +++++++++++-----------
 scripts/Makefile.clean              |  2 +-
 scripts/Makefile.defconf            | 16 ++++++++--------
 scripts/Makefile.dtbinst            |  2 +-
 scripts/Makefile.headersinst        | 10 +++++-----
 scripts/Makefile.lib                | 22 +++++++++++-----------
 scripts/Makefile.modfinal           |  4 ++--
 scripts/Makefile.modinst            |  6 +++---
 scripts/Makefile.modpost            |  4 ++--
 scripts/Makefile.package            | 26 +++++++++++++-------------
 scripts/Makefile.vdsoinst           |  2 +-
 scripts/Makefile.vmlinux            |  6 +++---
 scripts/Makefile.vmlinux_o          |  8 ++++----
 scripts/basic/Makefile              |  2 +-
 scripts/dtc/Makefile                |  6 +++---
 scripts/gcc-plugins/Makefile        |  2 +-
 scripts/gdb/linux/Makefile          |  2 +-
 scripts/genksyms/Makefile           |  4 ++--
 scripts/kconfig/Makefile            | 22 +++++++++++-----------
 scripts/selinux/genheaders/Makefile |  4 ++--
 scripts/selinux/mdp/Makefile        |  4 ++--
 23 files changed, 95 insertions(+), 95 deletions(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 576cf64be667..458d88fdb29a 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -23,9 +23,9 @@ generate_rust_target-rust := y
 rustdoc_test_builder-rust := y
 rustdoc_test_gen-rust := y
 
-HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
+HOSTCFLAGS_sorttable.o = -I$(srctree)tools/include
 HOSTLDLIBS_sorttable = -lpthread
-HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
+HOSTCFLAGS_asn1_compiler.o = -I$(srctree)include
 HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
 HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
 
@@ -33,7 +33,7 @@ ifdef CONFIG_UNWINDER_ORC
 ifeq ($(ARCH),x86_64)
 ARCH := x86
 endif
-HOSTCFLAGS_sorttable.o += -I$(srctree)/tools/arch/x86/include
+HOSTCFLAGS_sorttable.o += -I$(srctree)tools/arch/x86/include
 HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
 endif
 
diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index 8d01b37b7677..e11512d92e4e 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -11,23 +11,23 @@ all:
 
 src := $(subst /generated,,$(obj))
 
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 -include $(kbuild-file)
 
 # $(generic)/Kbuild lists mandatory-y. Exclude um since it is a special case.
 ifneq ($(SRCARCH),um)
-include $(srctree)/$(generic)/Kbuild
+include $(srctree)$(generic)/Kbuild
 endif
 
 redundant := $(filter $(mandatory-y) $(generated-y), $(generic-y))
-redundant += $(foreach f, $(generic-y), $(if $(wildcard $(srctree)/$(src)/$(f)),$(f)))
+redundant += $(foreach f, $(generic-y), $(if $(wildcard $(srctree)$(src)/$(f)),$(f)))
 redundant := $(sort $(redundant))
 $(if $(redundant),\
 	$(warning redundant generic-y found in $(src)/Kbuild: $(redundant)))
 
 # If arch does not implement mandatory headers, fallback to asm-generic ones.
 mandatory-y := $(filter-out $(generated-y), $(mandatory-y))
-generic-y   += $(foreach f, $(mandatory-y), $(if $(wildcard $(srctree)/$(src)/$(f)),,$(f)))
+generic-y   += $(foreach f, $(mandatory-y), $(if $(wildcard $(srctree)$(src)/$(f)),,$(f)))
 
 generic-y   := $(addprefix $(obj)/, $(generic-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index dae447a1ad30..176e1909b055 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -36,23 +36,23 @@ subdir-ccflags-y :=
 # Read auto.conf if it exists, otherwise ignore
 -include include/config/auto.conf
 
-include $(srctree)/scripts/Kbuild.include
-include $(srctree)/scripts/Makefile.compiler
+include $(srctree)scripts/Kbuild.include
+include $(srctree)scripts/Makefile.compiler
 include $(kbuild-file)
-include $(srctree)/scripts/Makefile.lib
+include $(srctree)scripts/Makefile.lib
 
 # Do not include hostprogs rules unless needed.
 # $(sort ...) is used here to remove duplicated words and excessive spaces.
 hostprogs := $(sort $(hostprogs))
 ifneq ($(hostprogs),)
-include $(srctree)/scripts/Makefile.host
+include $(srctree)scripts/Makefile.host
 endif
 
 # Do not include userprogs rules unless needed.
 # $(sort ...) is used here to remove duplicated words and excessive spaces.
 userprogs := $(sort $(userprogs))
 ifneq ($(userprogs),)
-include $(srctree)/scripts/Makefile.userprogs
+include $(srctree)scripts/Makefile.userprogs
 endif
 
 ifndef obj
@@ -101,7 +101,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
 endif
 
 ifneq ($(KBUILD_EXTRA_WARN),)
-  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
+  cmd_checkdoc = $(srctree)scripts/kernel-doc -none $(KDOCFLAGS) \
         $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
         $<
 endif
@@ -194,16 +194,16 @@ sub_cmd_record_mcount =					\
 	if [ $(@) != "scripts/mod/empty.o" ]; then	\
 		$(objtree)/scripts/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)";	\
 	fi;
-recordmcount_source := $(srctree)/scripts/recordmcount.c \
-		    $(srctree)/scripts/recordmcount.h
+recordmcount_source := $(srctree)scripts/recordmcount.c \
+		    $(srctree)scripts/recordmcount.h
 else
-sub_cmd_record_mcount = perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
+sub_cmd_record_mcount = perl $(srctree)scripts/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
 	"$(if $(CONFIG_64BIT),64,32)" \
 	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS)" \
 	"$(LD) $(KBUILD_LDFLAGS)" "$(NM)" "$(RM)" "$(MV)" \
 	"$(if $(part-of-module),1,0)" "$(@)";
-recordmcount_source := $(srctree)/scripts/recordmcount.pl
+recordmcount_source := $(srctree)scripts/recordmcount.pl
 endif # BUILD_C_RECORDMCOUNT
 cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),	\
 	$(sub_cmd_record_mcount))
@@ -253,7 +253,7 @@ $(obj)/%.mod: FORCE
 
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
-		     $(CONFIG_SHELL) $(srctree)/scripts/makelst $*.o \
+		     $(CONFIG_SHELL) $(srctree)scripts/makelst $*.o \
 				     System.map $(OBJDUMP) > $@
 
 $(obj)/%.lst: $(src)/%.c FORCE
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index f2cb4d7ffd96..9eed7d7fe60f 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -8,7 +8,7 @@ src := $(obj)
 PHONY := __clean
 __clean:
 
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 include $(kbuild-file)
 
 # Figure out what we need to build from the various variables
diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
index 226ea3df3b4b..ff6a8345d1bf 100644
--- a/scripts/Makefile.defconf
+++ b/scripts/Makefile.defconf
@@ -8,10 +8,10 @@
 #
 # Input config fragments without '.config' suffix
 define merge_into_defconfig
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
-	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/kconfig/merge_config.sh \
+		-m -O $(objtree) $(srctree)arch/$(SRCARCH)/configs/$(1) \
+		$(foreach config,$(2),$(srctree)arch/$(SRCARCH)/configs/$(config).config)
+	+$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 endef
 
 
@@ -22,8 +22,8 @@ endef
 #
 # Input config fragments without '.config' suffix
 define merge_into_defconfig_override
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-Q -m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
-	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/kconfig/merge_config.sh \
+		-Q -m -O $(objtree) $(srctree)arch/$(SRCARCH)/configs/$(1) \
+		$(foreach config,$(2),$(srctree)arch/$(SRCARCH)/configs/$(config).config)
+	+$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 endef
diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 4405d5b67578..228b8187cd97 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -14,7 +14,7 @@ PHONY := __dtbs_install
 __dtbs_install:
 
 include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 include $(kbuild-file)
 
 dtbs    := $(addprefix $(dst)/, $(dtb-y) $(if $(CONFIG_OF_ALL_DTBS),$(dtb-)))
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 029d85bb0b23..a6423d395c02 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -12,9 +12,9 @@
 PHONY := __headers
 __headers:
 
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
-src := $(srctree)/$(obj)
+src := $(srctree)$(obj)
 gen := $(objtree)/$(subst include/,include/generated/,$(obj))
 dst := usr/include
 
@@ -57,12 +57,12 @@ $(if $(new-dirs), $(shell mkdir -p $(new-dirs)))
 
 # Rules
 quiet_cmd_install = HDRINST $@
-      cmd_install = $(CONFIG_SHELL) $(srctree)/scripts/headers_install.sh $< $@
+      cmd_install = $(CONFIG_SHELL) $(srctree)scripts/headers_install.sh $< $@
 
-$(src-headers): $(dst)/%.h: $(src)/%.h $(srctree)/scripts/headers_install.sh FORCE
+$(src-headers): $(dst)/%.h: $(src)/%.h $(srctree)scripts/headers_install.sh FORCE
 	$(call if_changed,install)
 
-$(gen-headers): $(dst)/%.h: $(gen)/%.h $(srctree)/scripts/headers_install.sh FORCE
+$(gen-headers): $(dst)/%.h: $(gen)/%.h $(srctree)scripts/headers_install.sh FORCE
 	$(call if_changed,install)
 
 quiet_cmd_remove = REMOVE  $(unwanted)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd5b181060f1..1c77fc1185e5 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -200,13 +200,13 @@ _c_flags += $(if $(patsubst n%,, \
 	-D__KCSAN_INSTRUMENT_BARRIERS__)
 endif
 
-# $(srctree)/$(src) for including checkin headers from generated source files
+# $(srctree)$(src) for including checkin headers from generated source files
 # $(objtree)/$(obj) for including generated headers from checkin source files
 ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
-_c_flags   += -I $(srctree)/$(src) -I $(objtree)/$(obj)
-_a_flags   += -I $(srctree)/$(src) -I $(objtree)/$(obj)
-_cpp_flags += -I $(srctree)/$(src) -I $(objtree)/$(obj)
+_c_flags   += -I $(srctree)$(src) -I $(objtree)/$(obj)
+_a_flags   += -I $(srctree)$(src) -I $(objtree)/$(obj)
+_cpp_flags += -I $(srctree)$(src) -I $(objtree)/$(obj)
 endif
 endif
 
@@ -228,7 +228,7 @@ modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
 
 c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
-		 -include $(srctree)/include/linux/compiler_types.h       \
+		 -include $(srctree)include/linux/compiler_types.h       \
 		 $(_c_flags) $(modkern_cflags)                           \
 		 $(basename_flags) $(modname_flags)
 
@@ -242,7 +242,7 @@ cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 
 ld_flags       = $(KBUILD_LDFLAGS) $(ldflags-y) $(LDFLAGS_$(@F))
 
-DTC_INCLUDE    := $(srctree)/scripts/dtc/include-prefixes
+DTC_INCLUDE    := $(srctree)scripts/dtc/include-prefixes
 
 dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
 		 $(addprefix -I,$(DTC_INCLUDE))                          \
@@ -409,7 +409,7 @@ DT_BINDING_DIR := Documentation/devicetree/bindings
 DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
 
 quiet_cmd_dtb =	DTC_CHK $@
-      cmd_dtb =	$(cmd_dtc) ; $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
+      cmd_dtb =	$(cmd_dtc) ; $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
 else
 quiet_cmd_dtb = $(quiet_cmd_dtc)
       cmd_dtb = $(cmd_dtc)
@@ -431,7 +431,7 @@ dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 size_append = printf $(shell						\
 dec_size=0;								\
 for F in $(real-prereqs); do					\
-	fsize=$$($(CONFIG_SHELL) $(srctree)/scripts/file-size.sh $$F);	\
+	fsize=$$($(CONFIG_SHELL) $(srctree)scripts/file-size.sh $$F);	\
 	dec_size=$$(expr $$dec_size + $$fsize);				\
 done;									\
 printf "%08x\n" $$dec_size |						\
@@ -477,7 +477,7 @@ quiet_cmd_lz4_with_size = LZ4     $@
 # U-Boot mkimage
 # ---------------------------------------------------------------------------
 
-MKIMAGE := $(srctree)/scripts/mkuboot.sh
+MKIMAGE := $(srctree)scripts/mkuboot.sh
 
 # SRCARCH just happens to match slightly more than ARCH (on sparc), so reduces
 # the number of overrides in arch makefiles
@@ -514,10 +514,10 @@ quiet_cmd_uimage = UIMAGE  $@
 # big dictionary would increase the memory usage too much in the multi-call
 # decompression mode. A BCJ filter isn't used either.
 quiet_cmd_xzkern = XZKERN  $@
-      cmd_xzkern = cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh > $@
+      cmd_xzkern = cat $(real-prereqs) | sh $(srctree)scripts/xz_wrap.sh > $@
 
 quiet_cmd_xzkern_with_size = XZKERN  $@
-      cmd_xzkern_with_size = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh; \
+      cmd_xzkern_with_size = { cat $(real-prereqs) | sh $(srctree)scripts/xz_wrap.sh; \
                      $(size_append); } > $@
 
 quiet_cmd_xzmisc = XZMISC  $@
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 8568d256d6fb..0d9f44cb8247 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -7,10 +7,10 @@ PHONY := __modfinal
 __modfinal:
 
 include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 # for c_flags
-include $(srctree)/scripts/Makefile.lib
+include $(srctree)scripts/Makefile.lib
 
 # find all modules listed in modules.order
 modules := $(call read-file, $(MODORDER))
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679..7a955be3e033 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -7,7 +7,7 @@ PHONY := __modinst
 __modinst:
 
 include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 install-y :=
 
@@ -96,7 +96,7 @@ endif
 # Don't stop modules_install even if we can't sign external modules.
 #
 ifeq ($(filter pkcs11:%, $(CONFIG_MODULE_SIG_KEY)),)
-sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(srctree)/)$(CONFIG_MODULE_SIG_KEY)
+sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(srctree))$(CONFIG_MODULE_SIG_KEY)
 else
 sig-key := $(CONFIG_MODULE_SIG_KEY)
 endif
@@ -128,7 +128,7 @@ depmod: $(install-y)
 	$(call cmd,depmod)
 
 quiet_cmd_depmod = DEPMOD  $(MODLIB)
-      cmd_depmod = $(srctree)/scripts/depmod.sh $(KERNELRELEASE)
+      cmd_depmod = $(srctree)scripts/depmod.sh $(KERNELRELEASE)
 endif
 
 else
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 739402f45509..6bb347348822 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -36,7 +36,7 @@ PHONY := __modpost
 __modpost:
 
 include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 MODPOST = scripts/mod/modpost
 
@@ -94,7 +94,7 @@ targets += .vmlinux.objs
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 ksym-wl := $(CONFIG_UNUSED_KSYMS_WHITELIST)
-ksym-wl := $(if $(filter-out /%, $(ksym-wl)),$(srctree)/)$(ksym-wl)
+ksym-wl := $(if $(filter-out /%, $(ksym-wl)),$(srctree))$(ksym-wl)
 modpost-args += -t $(addprefix -u , $(ksym-wl))
 modpost-deps += $(ksym-wl)
 endif
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index a81dfb1f5181..269f4918d72c 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Makefile for the different targets used to generate full packages of a kernel
 
-include $(srctree)/scripts/Kbuild.include
-include $(srctree)/scripts/Makefile.lib
+include $(srctree)scripts/Kbuild.include
+include $(srctree)scripts/Makefile.lib
 
 # Git
 # ---------------------------------------------------------------------------
 
-filechk_HEAD = git -C $(srctree) rev-parse --verify HEAD 2>/dev/null
+filechk_HEAD = git -C $(srctree:%/=%) rev-parse --verify HEAD 2>/dev/null
 
 .tmp_HEAD: check-git FORCE
 	$(call filechk,HEAD)
 
 PHONY += check-git
 check-git:
-	@if ! $(srctree)/scripts/check-git; then \
+	@if ! $(srctree)scripts/check-git; then \
 		echo >&2 "error: creating source package requires git repository"; \
 		false; \
 	fi
@@ -26,7 +26,7 @@ git-config-tar.xz   = -c tar.tar.xz.command="$(XZ)"
 git-config-tar.zst  = -c tar.tar.zst.command="$(ZSTD)"
 
 quiet_cmd_archive = ARCHIVE $@
-      cmd_archive = git -C $(srctree) $(git-config-tar$(suffix $@)) archive \
+      cmd_archive = git -C $(srctree:%/=%) $(git-config-tar$(suffix $@)) archive \
                     --output=$$(realpath $@) $(archive-args)
 
 suffix-gzip  := .gz
@@ -48,7 +48,7 @@ $(linux-tarballs): .tmp_HEAD FORCE
 # ---------------------------------------------------------------------------
 
 quiet_cmd_mkspec = GEN     $@
-      cmd_mkspec = $(srctree)/scripts/package/mkspec $@
+      cmd_mkspec = $(srctree)scripts/package/mkspec $@
 
 rpmbuild/SPECS/kernel.spec: FORCE
 	$(call cmd,mkspec)
@@ -58,7 +58,7 @@ rpm-sources: linux.tar.gz
 	$(Q)mkdir -p rpmbuild/SOURCES
 	$(Q)ln -f linux.tar.gz rpmbuild/SOURCES/linux.tar.gz
 	$(Q)cp $(KCONFIG_CONFIG) rpmbuild/SOURCES/config
-	$(Q)$(srctree)/scripts/package/gen-diff-patch rpmbuild/SOURCES/diff.patch
+	$(Q)$(srctree)scripts/package/gen-diff-patch rpmbuild/SOURCES/diff.patch
 
 PHONY += rpm-pkg srcrpm-pkg binrpm-pkg
 
@@ -92,7 +92,7 @@ debian-orig-suffix := \
     $(suffix-$(KDEB_SOURCE_COMPRESS)),.unsupported-deb-src-compress))
 
 quiet_cmd_debianize = GEN     $@
-      cmd_debianize = $(srctree)/scripts/package/mkdebian $(mkdebian-opts)
+      cmd_debianize = $(srctree)scripts/package/mkdebian $(mkdebian-opts)
 
 debian: FORCE
 	$(call cmd,debianize)
@@ -136,7 +136,7 @@ snap-pkg:
 	$(MAKE) clean
 	sed "s@KERNELRELEASE@$(KERNELRELEASE)@; \
 		s@SRCTREE@$(abs_srctree)@" \
-		$(srctree)/scripts/package/snapcraft.template > \
+		$(srctree)scripts/package/snapcraft.template > \
 		$(objtree)/snap/snapcraft.yaml
 	cd $(objtree)/snap && \
 	snapcraft --target-arch=$(UTS_MACHINE)
@@ -145,8 +145,8 @@ snap-pkg:
 # ---------------------------------------------------------------------------
 
 tar-install: FORCE
-	$(Q)$(MAKE) -f $(srctree)/Makefile
-	+$(Q)$(srctree)/scripts/package/buildtar $@
+	$(Q)$(MAKE) -f $(srctree)Makefile
+	+$(Q)$(srctree)scripts/package/buildtar $@
 
 compress-tar.gz  = -I "$(KGZIP)"
 compress-tar.bz2 = -I "$(KBZIP2)"
@@ -182,12 +182,12 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
 	$(call cmd,copy)
 
 quiet_cmd_perf_version_file = GEN     $@
-      cmd_perf_version_file = cd $(srctree)/tools/perf; util/PERF-VERSION-GEN $(dir $(abspath $@))
+      cmd_perf_version_file = cd $(srctree)tools/perf; util/PERF-VERSION-GEN $(dir $(abspath $@))
 
 # PERF-VERSION-FILE and .tmp_HEAD are independent, but this avoids updating the
 # timestamp of PERF-VERSION-FILE.
 # The best is to fix tools/perf/util/PERF-VERSION-GEN.
-.tmp_perf/PERF-VERSION-FILE: .tmp_HEAD $(srctree)/tools/perf/util/PERF-VERSION-GEN | .tmp_perf
+.tmp_perf/PERF-VERSION-FILE: .tmp_HEAD $(srctree)tools/perf/util/PERF-VERSION-GEN | .tmp_perf
 	$(call cmd,perf_version_file)
 
 perf-archive-args = --add-file=$$(realpath $(word 2, $^)) \
diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
index c477d17b0aa5..bd9fbfb6e0ff 100644
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@ -7,7 +7,7 @@ PHONY := __default
 __default:
 	@:
 
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 install-dir := $(MODLIB)/vdso
 
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index c9f3e03124d7..42174d0174f8 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -4,10 +4,10 @@ PHONY := __default
 __default: vmlinux
 
 include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 # for c_flags
-include $(srctree)/scripts/Makefile.lib
+include $(srctree)scripts/Makefile.lib
 
 targets :=
 
@@ -25,7 +25,7 @@ targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
 endif
 
-ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
+ARCH_POSTLINK := $(wildcard $(srctree)arch/$(SRCARCH)/Makefile.postlink)
 
 # Final link of vmlinux with optional arch pass after final link
 cmd_link_vmlinux =							\
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 25b3b587d37c..aaff4cb7ca45 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -4,20 +4,20 @@ PHONY := __default
 __default: vmlinux.o modules.builtin.modinfo modules.builtin
 
 include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 # for objtool
-include $(srctree)/scripts/Makefile.lib
+include $(srctree)scripts/Makefile.lib
 
 # Generate a linker script to ensure correct ordering of initcalls for Clang LTO
 # ---------------------------------------------------------------------------
 
 quiet_cmd_gen_initcalls_lds = GEN     $@
       cmd_gen_initcalls_lds = \
-	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
+	$(PYTHON3) $(srctree)scripts/jobserver-exec \
 	$(PERL) $(real-prereqs) > $@
 
-.tmp_initcalls.lds: $(srctree)/scripts/generate_initcall_order.pl \
+.tmp_initcalls.lds: $(srctree)scripts/generate_initcall_order.pl \
 		vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
 	$(call if_changed,gen_initcalls_lds)
 
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index dd289a6725ac..ea7b56fd3700 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -6,7 +6,7 @@ hostprogs-always-y	+= fixdep
 
 # randstruct: the seed is needed before building the gcc-plugin or
 # before running a Clang kernel build.
-gen-randstruct-seed	:= $(srctree)/scripts/gen-randstruct-seed.sh
+gen-randstruct-seed	:= $(srctree)scripts/gen-randstruct-seed.sh
 quiet_cmd_create_randstruct_seed = GENSEED $@
 cmd_create_randstruct_seed = \
 	$(CONFIG_SHELL) $(gen-randstruct-seed) \
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 4d32b9497da9..3386b44b1761 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -16,12 +16,12 @@ libfdt		= $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
-HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
+HOST_EXTRACFLAGS += -I $(srctree)$(src)/libfdt
 HOST_EXTRACFLAGS += -DNO_YAML
 
 # Generated files need one more search path to include headers in source tree
-HOSTCFLAGS_dtc-lexer.lex.o := -I $(srctree)/$(src)
-HOSTCFLAGS_dtc-parser.tab.o := -I $(srctree)/$(src)
+HOSTCFLAGS_dtc-lexer.lex.o := -I $(srctree)$(src)
+HOSTCFLAGS_dtc-parser.tab.o := -I $(srctree)$(src)
 
 # dependencies on generated files need to be listed explicitly
 $(obj)/dtc-lexer.lex.o: $(obj)/dtc-parser.tab.h
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index 320afd3cf8e8..2b3a1890f742 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -27,7 +27,7 @@ always-y += $(GCC_PLUGIN)
 GCC_PLUGINS_DIR = $(shell $(CC) -print-file-name=plugin)
 
 plugin_cxxflags	= -Wp,-MMD,$(depfile) $(KBUILD_HOSTCXXFLAGS) -fPIC \
-		  -include $(srctree)/include/linux/compiler-version.h \
+		  -include $(srctree)include/linux/compiler-version.h \
 		  -DPLUGIN_VERSION=$(call stringify,$(KERNELVERSION)) \
 		  -I $(GCC_PLUGINS_DIR)/include -I $(obj) \
 		  -fno-rtti -fno-exceptions -fasynchronous-unwind-tables \
diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
index 52b5c961a6b1..c71480b746ef 100644
--- a/scripts/gdb/linux/Makefile
+++ b/scripts/gdb/linux/Makefile
@@ -2,7 +2,7 @@
 
 ifdef building_out_of_srctree
 
-symlinks := $(patsubst $(srctree)/$(src)/%,%,$(wildcard $(srctree)/$(src)/*.py))
+symlinks := $(patsubst $(srctree)$(src)/%,%,$(wildcard $(srctree)$(src)/*.py))
 
 quiet_cmd_symlink = SYMLINK $@
       cmd_symlink = ln -fsn $(patsubst $(obj)/%,$(abs_srctree)/$(src)/%,$@) $@
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index d6a422a63b6a..58c0caf5ae53 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -23,8 +23,8 @@ $(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
 endif
 
 # -I needed for generated C source to include headers in source tree
-HOSTCFLAGS_parse.tab.o := -I $(srctree)/$(src)
-HOSTCFLAGS_lex.lex.o := -I $(srctree)/$(src)
+HOSTCFLAGS_parse.tab.o := -I $(srctree)$(src)
+HOSTCFLAGS_lex.lex.o := -I $(srctree)$(src)
 
 # dependencies on generated files need to be listed explicitly
 $(obj)/lex.lex.o: $(obj)/parse.tab.h
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ea1bf3b3dbde..54ba3a011016 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -57,7 +57,7 @@ $(foreach c, config menuconfig nconfig gconfig xconfig, $(eval $(call config_rul
 
 PHONY += localmodconfig localyesconfig
 localyesconfig localmodconfig: $(obj)/conf
-	$(Q)$(PERL) $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
+	$(Q)$(PERL) $(srctree)$(src)/streamline_config.pl --$@ $(srctree:%/=%) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 				\
 		cmp -s .tmp.config .config ||			\
 		(mv -f .config .config.old.1;			\
@@ -90,35 +90,35 @@ savedefconfig: $(obj)/conf
 	$(Q)$< $(silent) --$@=defconfig $(Kconfig)
 
 defconfig: $(obj)/conf
-ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
+ifneq ($(wildcard $(srctree)arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
 	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 else
 	@$(kecho) "*** Default configuration is based on target '$(KBUILD_DEFCONFIG)'"
-	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
+	$(Q)$(MAKE) -f $(srctree)Makefile $(KBUILD_DEFCONFIG)
 endif
 
 %_defconfig: $(obj)/conf
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
 
-configfiles = $(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARCH)/configs/$(1))
+configfiles = $(wildcard $(srctree)kernel/configs/$(1) $(srctree)arch/$(SRCARCH)/configs/$(1))
 all-config-fragments = $(call configfiles,*.config)
 config-fragments = $(call configfiles,$@)
 
 %.config: $(obj)/conf
 	$(if $(config-fragments),, $(error $@ fragment does not exists on this architecture))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(config-fragments)
-	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(config-fragments)
+	$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 
 PHONY += tinyconfig
 tinyconfig:
-	$(Q)KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config $(MAKE) -f $(srctree)/Makefile allnoconfig
-	$(Q)$(MAKE) -f $(srctree)/Makefile tiny.config
+	$(Q)KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config $(MAKE) -f $(srctree)Makefile allnoconfig
+	$(Q)$(MAKE) -f $(srctree)Makefile tiny.config
 
 # CHECK: -o cache_dir=<path> working?
 PHONY += testconfig
 testconfig: $(obj)/conf
-	$(Q)$(PYTHON3) -B -m pytest $(srctree)/$(src)/tests \
+	$(Q)$(PYTHON3) -B -m pytest $(srctree)$(src)/tests \
 	-o cache_dir=$(abspath $(obj)/tests/.cache) \
 	$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=no)
 clean-files += tests/.cache
@@ -165,8 +165,8 @@ common-objs	:= confdata.o expr.o lexer.lex.o menu.o parser.tab.o \
 		   preprocess.o symbol.o util.o
 
 $(obj)/lexer.lex.o: $(obj)/parser.tab.h
-HOSTCFLAGS_lexer.lex.o	:= -I $(srctree)/$(src)
-HOSTCFLAGS_parser.tab.o	:= -I $(srctree)/$(src)
+HOSTCFLAGS_lexer.lex.o	:= -I $(srctree)$(src)
+HOSTCFLAGS_parser.tab.o	:= -I $(srctree)$(src)
 
 # conf: Used for defconfig, oldconfig and related targets
 hostprogs	+= conf
diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
index 1faf7f07e8db..bf9d90d509f0 100644
--- a/scripts/selinux/genheaders/Makefile
+++ b/scripts/selinux/genheaders/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 hostprogs-always-y += genheaders
 HOST_EXTRACFLAGS += \
-	-I$(srctree)/include/uapi -I$(srctree)/include \
-	-I$(srctree)/security/selinux/include
+	-I$(srctree)include/uapi -I$(srctree)include \
+	-I$(srctree)security/selinux/include
diff --git a/scripts/selinux/mdp/Makefile b/scripts/selinux/mdp/Makefile
index d61058ddd15c..f1b64cc46d47 100644
--- a/scripts/selinux/mdp/Makefile
+++ b/scripts/selinux/mdp/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 hostprogs-always-y += mdp
 HOST_EXTRACFLAGS += \
-	-I$(srctree)/include/uapi -I$(srctree)/include \
-	-I$(srctree)/security/selinux/include -I$(objtree)/include
+	-I$(srctree)include/uapi -I$(srctree)include \
+	-I$(srctree)security/selinux/include -I$(objtree)/include
 
 clean-files	:= policy.* file_contexts
-- 
2.39.2


