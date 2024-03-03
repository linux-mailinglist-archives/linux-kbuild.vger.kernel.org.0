Return-Path: <linux-kbuild+bounces-1122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C286F88C
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A649F1C209E3
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD2A138A;
	Mon,  4 Mar 2024 02:26:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DFA15B7
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519215; cv=none; b=P8uTfZz8O0TcEPKjxRGUGwJSSMxBi6upjXQ12dC2L/I0oi/4RWGxfIvKS4BrG/VxKpBgcDEyMylHVclO4kZ8jZgwOgeEoshvxG89+jqeqp8EdOkBzfFTT2N05N2+A+xSgH8JAG00o/hs5KYLw0BfJEJpz6DPNGkNnG7AAqvBBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519215; c=relaxed/simple;
	bh=DS3tdStKeVV5GgPx4dYKlELG1quNAcnmhcG3RmA/fUM=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=AhTbbd/F1HwDXr7ZAJ7x6nJHr0xTjLIsjhZWjC2K3cvo6U79D/Vmgm4fBNiwQom5uNVnRPJWqznK5xFSjzPjIZGvvK4Qw5JiVqP69aW/g75yK99MUCEeGKF6wE5Po3pq+zZaOb4vHxQB0DFvA3UysXOhBpgqKCZOeehaPwLvKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242PXHw021928
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:25:38 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242PVoT021927;
	Sun, 3 Mar 2024 18:25:31 -0800 (PST)
	(envelope-from ehem)
Message-Id: <491ac1cbd85474eff9e189d0a64945f2f79cc8cc.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 13/30] scripts: modify uses of $(objtree) to assume
 trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
X-Spam-Level: *
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Date: Tue, 20 Feb 2024 09:13:37 -0800

This isn't much more than `find | sed` to adjust all uses of $(objtree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:
find . -name Makefile\* -print0 | xargs -0 sed -i -e's,$(objtree)$,$(objtree:%/=%),' -e's,$(objtree)\([^,/]\),$(objtree:%/=%)\1,g' -es',$(objtree)/,$(objtree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 scripts/Makefile.build       |  8 ++++----
 scripts/Makefile.defconf     |  4 ++--
 scripts/Makefile.gcc-plugins |  2 +-
 scripts/Makefile.headersinst |  2 +-
 scripts/Makefile.host        |  6 +++---
 scripts/Makefile.kcov        |  2 +-
 scripts/Makefile.lib         | 18 +++++++++---------
 scripts/Makefile.package     |  8 ++++----
 scripts/Makefile.randstruct  |  4 ++--
 scripts/basic/Makefile       |  2 +-
 scripts/gcc-plugins/Makefile |  2 +-
 scripts/selinux/mdp/Makefile |  2 +-
 12 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 176e1909b055..46fc6f2efe1a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -192,7 +192,7 @@ endif
 # files, including recordmcount.
 sub_cmd_record_mcount =					\
 	if [ $(@) != "scripts/mod/empty.o" ]; then	\
-		$(objtree)/scripts/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)";	\
+		$(objtree)scripts/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)";	\
 	fi;
 recordmcount_source := $(srctree)scripts/recordmcount.c \
 		    $(srctree)scripts/recordmcount.h
@@ -273,7 +273,7 @@ rust_common_cmd = \
 	-Zcrate-attr=no_std \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
 	--extern alloc --extern kernel \
-	--crate-type rlib -L $(objtree)/rust/ \
+	--crate-type rlib -L $(objtree)rust/ \
 	--crate-name $(basename $(notdir $@)) \
 	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
@@ -376,10 +376,10 @@ $(obj)/%.lds: $(src)/%.lds.S FORCE
 # ASN.1 grammar
 # ---------------------------------------------------------------------------
 quiet_cmd_asn1_compiler = ASN.1   $(basename $@).[ch]
-      cmd_asn1_compiler = $(objtree)/scripts/asn1_compiler $< \
+      cmd_asn1_compiler = $(objtree)scripts/asn1_compiler $< \
 				$(basename $@).c $(basename $@).h
 
-$(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
+$(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)scripts/asn1_compiler
 	$(call cmd,asn1_compiler)
 
 # Build the compiled-in targets
diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
index ff6a8345d1bf..51d27001abf3 100644
--- a/scripts/Makefile.defconf
+++ b/scripts/Makefile.defconf
@@ -9,7 +9,7 @@
 # Input config fragments without '.config' suffix
 define merge_into_defconfig
 	$(Q)$(CONFIG_SHELL) $(srctree)scripts/kconfig/merge_config.sh \
-		-m -O $(objtree) $(srctree)arch/$(SRCARCH)/configs/$(1) \
+		-m -O $(objtree:%/=%) $(srctree)arch/$(SRCARCH)/configs/$(1) \
 		$(foreach config,$(2),$(srctree)arch/$(SRCARCH)/configs/$(config).config)
 	+$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 endef
@@ -23,7 +23,7 @@ endef
 # Input config fragments without '.config' suffix
 define merge_into_defconfig_override
 	$(Q)$(CONFIG_SHELL) $(srctree)scripts/kconfig/merge_config.sh \
-		-Q -m -O $(objtree) $(srctree)arch/$(SRCARCH)/configs/$(1) \
+		-Q -m -O $(objtree:%/=%) $(srctree)arch/$(SRCARCH)/configs/$(1) \
 		$(foreach config,$(2),$(srctree)arch/$(SRCARCH)/configs/$(config).config)
 	+$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 endef
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index e4deaf5fa571..f335e0d1399e 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -44,7 +44,7 @@ export DISABLE_ARM_SSP_PER_TASK_PLUGIN
 
 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
-GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
+GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
 export GCC_PLUGINS_CFLAGS
 
 # Add the flags to the build!
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index a6423d395c02..bafb60333e47 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -15,7 +15,7 @@ __headers:
 include $(srctree)scripts/Kbuild.include
 
 src := $(srctree)$(obj)
-gen := $(objtree)/$(subst include/,include/generated/,$(obj))
+gen := $(objtree)$(subst include/,include/generated/,$(obj))
 dst := usr/include
 
 -include $(src)/Kbuild
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 08d83d9db31a..7c6ebbe9c728 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -96,11 +96,11 @@ hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
 
-# $(objtree)/$(obj) for including generated headers from checkin source files
+# $(objtree)$(obj) for including generated headers from checkin source files
 ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
-hostc_flags   += -I $(objtree)/$(obj)
-hostcxx_flags += -I $(objtree)/$(obj)
+hostc_flags   += -I $(objtree)$(obj)
+hostcxx_flags += -I $(objtree)$(obj)
 endif
 endif
 
diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67e8cfe3474b..5d3d3d711b7a 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
-kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
+kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)scripts/gcc-plugins/sancov_plugin.so
 
 export CFLAGS_KCOV := $(kcov-flags-y)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1c77fc1185e5..34aa26fe54f8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -201,12 +201,12 @@ _c_flags += $(if $(patsubst n%,, \
 endif
 
 # $(srctree)$(src) for including checkin headers from generated source files
-# $(objtree)/$(obj) for including generated headers from checkin source files
+# $(objtree)$(obj) for including generated headers from checkin source files
 ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
-_c_flags   += -I $(srctree)$(src) -I $(objtree)/$(obj)
-_a_flags   += -I $(srctree)$(src) -I $(objtree)/$(obj)
-_cpp_flags += -I $(srctree)$(src) -I $(objtree)/$(obj)
+_c_flags   += -I $(srctree)$(src) -I $(objtree)$(obj)
+_a_flags   += -I $(srctree)$(src) -I $(objtree)$(obj)
+_cpp_flags += -I $(srctree)$(src) -I $(objtree)$(obj)
 endif
 endif
 
@@ -232,7 +232,7 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_c_flags) $(modkern_cflags)                           \
 		 $(basename_flags) $(modname_flags)
 
-rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
+rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)include/generated/rustc_cfg
 
 a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_a_flags) $(modkern_aflags)
@@ -250,7 +250,7 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
 
 ifdef CONFIG_OBJTOOL
 
-objtool := $(objtree)/tools/objtool/objtool
+objtool := $(objtree)tools/objtool/objtool
 
 objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
 objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
@@ -339,7 +339,7 @@ quiet_cmd_gzip = GZIP    $@
 
 # DTC
 # ---------------------------------------------------------------------------
-DTC ?= $(objtree)/scripts/dtc/dtc
+DTC ?= $(objtree)scripts/dtc/dtc
 DTC_FLAGS += -Wno-interrupt_provider \
 	-Wno-unique_unit_address
 
@@ -396,7 +396,7 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
 quiet_cmd_fdtoverlay = DTOVL   $@
-      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(real-prereqs)
+      cmd_fdtoverlay = $(objtree)scripts/dtc/fdtoverlay -o $@ -i $(real-prereqs)
 
 $(multi-dtb-y): FORCE
 	$(call if_changed,fdtoverlay)
@@ -406,7 +406,7 @@ ifneq ($(CHECK_DTBS)$(CHECK_DT_BINDING),)
 DT_CHECKER ?= dt-validate
 DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)
 DT_BINDING_DIR := Documentation/devicetree/bindings
-DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
+DT_TMP_SCHEMA := $(objtree)$(DT_BINDING_DIR)/processed-schema.json
 
 quiet_cmd_dtb =	DTC_CHK $@
       cmd_dtb =	$(cmd_dtc) ; $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 269f4918d72c..c3234b26e6dc 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -131,14 +131,14 @@ deb-pkg srcdeb-pkg bindeb-pkg:
 # ---------------------------------------------------------------------------
 PHONY += snap-pkg
 snap-pkg:
-	rm -rf $(objtree)/snap
-	mkdir $(objtree)/snap
+	rm -rf $(objtree)snap
+	mkdir $(objtree)snap
 	$(MAKE) clean
 	sed "s@KERNELRELEASE@$(KERNELRELEASE)@; \
 		s@SRCTREE@$(abs_srctree)@" \
 		$(srctree)scripts/package/snapcraft.template > \
-		$(objtree)/snap/snapcraft.yaml
-	cd $(objtree)/snap && \
+		$(objtree)snap/snapcraft.yaml
+	cd $(objtree)snap && \
 	snapcraft --target-arch=$(UTS_MACHINE)
 
 # dir-pkg tar*-pkg - tarball targets
diff --git a/scripts/Makefile.randstruct b/scripts/Makefile.randstruct
index 24e283e89893..38fde99a580c 100644
--- a/scripts/Makefile.randstruct
+++ b/scripts/Makefile.randstruct
@@ -4,12 +4,12 @@ randstruct-cflags-y += -DRANDSTRUCT
 
 ifdef CONFIG_GCC_PLUGIN_RANDSTRUCT
 randstruct-cflags-y	\
-	+= -fplugin=$(objtree)/scripts/gcc-plugins/randomize_layout_plugin.so
+	+= -fplugin=$(objtree)scripts/gcc-plugins/randomize_layout_plugin.so
 randstruct-cflags-$(CONFIG_RANDSTRUCT_PERFORMANCE)		\
 	+= -fplugin-arg-randomize_layout_plugin-performance-mode
 else
 randstruct-cflags-y	\
-	+= -frandomize-layout-seed-file=$(objtree)/scripts/basic/randstruct.seed
+	+= -frandomize-layout-seed-file=$(objtree)scripts/basic/randstruct.seed
 endif
 
 export RANDSTRUCT_CFLAGS := $(randstruct-cflags-y)
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index ea7b56fd3700..47856f8ceefe 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -10,7 +10,7 @@ gen-randstruct-seed	:= $(srctree)scripts/gen-randstruct-seed.sh
 quiet_cmd_create_randstruct_seed = GENSEED $@
 cmd_create_randstruct_seed = \
 	$(CONFIG_SHELL) $(gen-randstruct-seed) \
-		$@ $(objtree)/include/generated/randstruct_hash.h
+		$@ $(objtree)include/generated/randstruct_hash.h
 $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
 	$(call if_changed,create_randstruct_seed)
 always-$(CONFIG_RANDSTRUCT) += randstruct.seed
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index 2b3a1890f742..9cd2b18b9715 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -9,7 +9,7 @@ cmd_create_randomize_layout_seed = \
 	echo ' * Exposing this value will expose the layout of randomized structures.' >> $@; \
 	echo ' */' >> $@; \
 	echo "const char *randstruct_seed = \"$$SEED\";" >> $@
-$(obj)/randomize_layout_seed.h: $(objtree)/scripts/basic/randstruct.seed FORCE
+$(obj)/randomize_layout_seed.h: $(objtree)scripts/basic/randstruct.seed FORCE
 	$(call if_changed,create_randomize_layout_seed)
 targets += randomize_layout_seed.h
 
diff --git a/scripts/selinux/mdp/Makefile b/scripts/selinux/mdp/Makefile
index f1b64cc46d47..5ee0837ee78d 100644
--- a/scripts/selinux/mdp/Makefile
+++ b/scripts/selinux/mdp/Makefile
@@ -2,6 +2,6 @@
 hostprogs-always-y += mdp
 HOST_EXTRACFLAGS += \
 	-I$(srctree)include/uapi -I$(srctree)include \
-	-I$(srctree)security/selinux/include -I$(objtree)/include
+	-I$(srctree)security/selinux/include -I$(objtree)include
 
 clean-files	:= policy.* file_contexts
-- 
2.39.2


