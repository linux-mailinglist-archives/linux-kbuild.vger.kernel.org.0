Return-Path: <linux-kbuild+bounces-3513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56C9750A6
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 13:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 683471F23547
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 11:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD152185946;
	Wed, 11 Sep 2024 11:20:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD6D14F100;
	Wed, 11 Sep 2024 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053647; cv=none; b=Mj0IBlqcE6hCGV2ee2VFz//wte0VgOSNkOF7j84T1RTsCj5F9Y2sza5HYnJGjyUnhkT8aP+YfvCylORnbzCwOvcQaLhTNbcoSAaTNsiJ+z72bRFao+CO2kDfkzq1bJk98BClbHuB/W5ZHhRL8WKAmEGpZzXduca1GB9WqT4lvNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053647; c=relaxed/simple;
	bh=eOeEXhR/D3r6Et4VUun3u9IlDKVMTqf8dBO/vduBUQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fuuCXWo8NEI9vDMw3gJdfWrN99lemL/bucivusyR540Yrx0UDH0ArCuuZTRaGBo7jNSK6rozdah64fhfNKzH+0TS/0Dn1ZJw7ZOhf8BnOqIVVUaXNNrbsYoJiLlh19L3BbO/wWbYZIy+P2cpHvYPD1fTCxhOE4tn53akTgVG3Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from lengjing.localdomain (unknown [119.131.118.192])
	by mail-app2 (Coremail) with SMTP id by_KCgC3O4zzfOFmyAk_AA--.3999S2;
	Wed, 11 Sep 2024 19:20:19 +0800 (CST)
From: Jing Leng <3090101217@zju.edu.cn>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	corbet@lwn.net
Cc: linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jing Leng <3090101217@zju.edu.cn>
Subject: [PATCH] kbuild: Support separating source and output of the external module
Date: Wed, 11 Sep 2024 19:20:17 +0800
Message-Id: <20240911112017.14427-1-3090101217@zju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:by_KCgC3O4zzfOFmyAk_AA--.3999S2
X-Coremail-Antispam: 1UD129KBjvJXoW3CrW7Zw1rWrW3WF17urW5GFg_yoWDKF1Dpr
	ykGryxCrWqy34qg3WrJF1UWF10q34Dtw4F9a1FqF1rJFsxJF42gF42qF45WF12kryfCrW2
	gr15CFW5Aa18J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb2XdUUUUUU==
X-CM-SenderInfo: qtqziiyqrsilo62m3hxhgxhubq/1tbiAwQRBWbCCEQBMAAnst

Revert commit "9a0ebe5011f4", originally when compiling external modules,
the compiled output can be separated from the source code with the
following command:
    make -C <kernel_src> O=<kernel_out> src=<module_src> M=<module_out>
It is used to https://github.com/lengjingzju/cbuild-ng (inc.mod.mk).

But "src" is an internal variable, so this patch adds a variable "S"
which is specifically used to change the default value of "src".

Fixes: 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common pattern rules")
Signed-off-by: Jing Leng <3090101217@zju.edu.cn>
---
 Documentation/kbuild/modules.rst | 45 +++++++++++++++++++++++---------
 scripts/Makefile.build           | 28 ++++++++++----------
 scripts/Makefile.clean           |  2 +-
 scripts/Makefile.host            |  6 ++---
 scripts/Makefile.lib             |  2 +-
 scripts/Makefile.modpost         |  2 +-
 6 files changed, 52 insertions(+), 33 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 131863142cbb..1c4d3810b1dd 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -72,14 +72,23 @@ executed to make module versioning work.
 2.1 Command Syntax
 ==================
 
-	The command to build an external module is::
+	The full command to build an external module is::
 
-		$ make -C <path_to_kernel_src> M=$PWD
+		$ make -C <kernel_src> O=<kernel_out> S=<module_src> M=<module_out>
 
-	The kbuild system knows that an external module is being built
-	due to the "M=<dir>" option given in the command.
+	If <kernel_out> is the same as <kernel_src>, "O=" can be omitted::
 
-	To build against the running kernel use::
+		$ make -C <kernel_src> S=<module_src> M=<module_out>
+
+	If <module_out> is the same as <module_src>, "S=" can be omitted::
+
+		$ make -C <kernel_src> O=<kernel_out> M=<module_src>
+
+	If both of the above are satisfied, the command is::
+
+		$ make -C <kernel_src> M=<module_src>
+
+	So to build against the running kernel can use::
 
 		$ make -C /lib/modules/`uname -r`/build M=$PWD
 
@@ -91,20 +100,29 @@ executed to make module versioning work.
 2.2 Options
 ===========
 
-	($KDIR refers to the path of the kernel source directory.)
-
-	make -C $KDIR M=$PWD
+	make -C <kernel_src> O=<kernel_out> S=<module_src> M=<module_out>
 
-	-C $KDIR
+	-C <kernel_src>
 		The directory where the kernel source is located.
 		"make" will actually change to the specified directory
 		when executing and will change back when finished.
 
-	M=$PWD
+	O=<kernel_out>
+		The value given to "O" is the absolute path of the
+		directory where the kernel output (.config file) is located.
+		If <kernel_out> is the same as <kernel_src>,
+		"O=<kernel_out>" can be omitted.
+
+	S=<module_src>
+		The value given to "S" is the absolute path of the
+		directory where the external module source (kbuild file)
+		is located. If <module_out> is the same as <module_src>,
+		"S=<module_src>" can be omitted.
+
+	M=<module_out>
 		Informs kbuild that an external module is being built.
 		The value given to "M" is the absolute path of the
-		directory where the external module (kbuild file) is
-		located.
+		directory where the external module output is located.
 
 2.3 Targets
 ===========
@@ -112,7 +130,7 @@ executed to make module versioning work.
 	When building an external module, only a subset of the "make"
 	targets are available.
 
-	make -C $KDIR M=$PWD [target]
+	make -C <kernel_src> O=<kernel_out> S=<module_src> M=<module_out> [target]
 
 	The default will build the module(s) located in the current
 	directory, so a target does not need to be specified. All
@@ -151,6 +169,7 @@ executed to make module versioning work.
 		make -C $KDIR M=$PWD foo.ko
 		make -C $KDIR M=$PWD ./
 
+	($KDIR refers to the path of the kernel source directory.)
 
 3. Creating a Kbuild File for an External Module
 ================================================
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a5ac8ed1936f..44b38cdb76df 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -3,7 +3,7 @@
 # Building
 # ==========================================================================
 
-src := $(if $(VPATH),$(VPATH)/)$(obj)
+src := $(if $(S),$(S),$(if $(VPATH),$(VPATH)/)$(obj))
 
 PHONY := $(obj)/
 $(obj)/:
@@ -113,13 +113,13 @@ endif
 quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
       cmd_cc_s_c = $(CC) $(filter-out $(DEBUG_CFLAGS) $(CC_FLAGS_LTO), $(c_flags)) -fverbose-asm -S -o $@ $<
 
-$(obj)/%.s: $(obj)/%.c FORCE
+$(obj)/%.s: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_s_c)
 
 quiet_cmd_cpp_i_c = CPP $(quiet_modtag) $@
 cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 
-$(obj)/%.i: $(obj)/%.c FORCE
+$(obj)/%.i: $(src)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
 genksyms = scripts/genksyms/genksyms		\
@@ -133,7 +133,7 @@ cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.c FORCE
+$(obj)/%.symtypes : $(src)/%.c FORCE
 	$(call cmd,cc_symtypes_c)
 
 # LLVM assembly
@@ -141,7 +141,7 @@ $(obj)/%.symtypes : $(obj)/%.c FORCE
 quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
       cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -fno-discard-value-names -o $@ $<
 
-$(obj)/%.ll: $(obj)/%.c FORCE
+$(obj)/%.ll: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_ll_c)
 
 # C (.c) files
@@ -240,7 +240,7 @@ define rule_as_o_S
 endef
 
 # Built-in and composite module parts
-$(obj)/%.o: $(obj)/%.c $(recordmcount_source) FORCE
+$(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
 	$(call if_changed_rule,cc_o_c)
 	$(call cmd,force_checksrc)
 
@@ -257,7 +257,7 @@ quiet_cmd_cc_lst_c = MKLST   $@
 		     $(CONFIG_SHELL) $(srctree)/scripts/makelst $*.o \
 				     System.map $(OBJDUMP) > $@
 
-$(obj)/%.lst: $(obj)/%.c FORCE
+$(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
 # Compile Rust sources (.rs)
@@ -290,7 +290,7 @@ rust_common_cmd = \
 quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
       cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $<
 
-$(obj)/%.o: $(obj)/%.rs FORCE
+$(obj)/%.o: $(src)/%.rs FORCE
 	+$(call if_changed_dep,rustc_o_rs)
 
 quiet_cmd_rustc_rsi_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
@@ -298,19 +298,19 @@ quiet_cmd_rustc_rsi_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 	$(rust_common_cmd) -Zunpretty=expanded $< >$@; \
 	command -v $(RUSTFMT) >/dev/null && $(RUSTFMT) $@
 
-$(obj)/%.rsi: $(obj)/%.rs FORCE
+$(obj)/%.rsi: $(src)/%.rs FORCE
 	+$(call if_changed_dep,rustc_rsi_rs)
 
 quiet_cmd_rustc_s_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
       cmd_rustc_s_rs = $(rust_common_cmd) --emit=asm=$@ $<
 
-$(obj)/%.s: $(obj)/%.rs FORCE
+$(obj)/%.s: $(src)/%.rs FORCE
 	+$(call if_changed_dep,rustc_s_rs)
 
 quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
       cmd_rustc_ll_rs = $(rust_common_cmd) --emit=llvm-ir=$@ $<
 
-$(obj)/%.ll: $(obj)/%.rs FORCE
+$(obj)/%.ll: $(src)/%.rs FORCE
 	+$(call if_changed_dep,rustc_ll_rs)
 
 # Compile assembler sources (.S)
@@ -336,14 +336,14 @@ cmd_gensymtypes_S =                                                         \
 quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_S = $(call cmd_gensymtypes_S,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.S FORCE
+$(obj)/%.symtypes : $(src)/%.S FORCE
 	$(call cmd,cc_symtypes_S)
 
 
 quiet_cmd_cpp_s_S = CPP $(quiet_modtag) $@
 cmd_cpp_s_S       = $(CPP) $(a_flags) -o $@ $<
 
-$(obj)/%.s: $(obj)/%.S FORCE
+$(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
@@ -358,7 +358,7 @@ cmd_gen_symversions_S = $(call gen_symversions,S)
 
 endif
 
-$(obj)/%.o: $(obj)/%.S FORCE
+$(obj)/%.o: $(src)/%.S FORCE
 	$(call if_changed_rule,as_o_S)
 
 targets += $(filter-out $(subdir-builtin), $(real-obj-y))
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 4fcfab40ed61..6ce7514aefc8 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -3,7 +3,7 @@
 # Cleaning up
 # ==========================================================================
 
-src := $(if $(VPATH),$(VPATH)/)$(obj)
+src := $(if $(S),$(S),$(if $(VPATH),$(VPATH)/)$(obj))
 
 PHONY := __clean
 __clean:
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index e85be7721a48..3c17e6ba421c 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -112,7 +112,7 @@ endif
 quiet_cmd_host-csingle 	= HOSTCC  $@
       cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(KBUILD_HOSTLDFLAGS) -o $@ $< \
 		$(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
-$(host-csingle): $(obj)/%: $(obj)/%.c FORCE
+$(host-csingle): $(obj)/%: $(src)/%.c FORCE
 	$(call if_changed_dep,host-csingle)
 
 # Link an executable based on list of .o files, all plain c
@@ -129,7 +129,7 @@ $(call multi_depend, $(host-cmulti), , -objs)
 # host-cobjs -> .o
 quiet_cmd_host-cobjs	= HOSTCC  $@
       cmd_host-cobjs	= $(HOSTCC) $(hostc_flags) -c -o $@ $<
-$(host-cobjs): $(obj)/%.o: $(obj)/%.c FORCE
+$(host-cobjs): $(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_dep,host-cobjs)
 
 # Link an executable based on list of .o files, a mixture of .c and .cc
@@ -146,7 +146,7 @@ $(call multi_depend, $(host-cxxmulti), , -objs -cxxobjs)
 # Create .o file from a single .cc (C++) file
 quiet_cmd_host-cxxobjs	= HOSTCXX $@
       cmd_host-cxxobjs	= $(HOSTCXX) $(hostcxx_flags) -c -o $@ $<
-$(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
+$(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
 	$(call if_changed_dep,host-cxxobjs)
 
 # Create executable from a single Rust crate (which may consist of
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 207325eaf1d1..6f961aa5790d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -430,7 +430,7 @@ DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
 dtb-check-enabled = $(if $(filter %.dtb, $@),y)
 endif
 
-$(obj)/%.dtb: $(obj)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
+$(obj)/%.dtb: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
 	$(call if_changed_dep,dtc)
 
 $(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 44936ebad161..12afe2acbe05 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -112,7 +112,7 @@ else
 
 # set src + obj - they may be used in the modules's Makefile
 obj := $(KBUILD_EXTMOD)
-src := $(if $(VPATH),$(VPATH)/)$(obj)
+src := $(if $(S),$(S),$(if $(VPATH),$(VPATH)/)$(obj))
 
 # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
 include $(kbuild-file)
-- 
2.25.1


