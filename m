Return-Path: <linux-kbuild+bounces-6705-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E940A94627
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Apr 2025 03:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1EC71898B2B
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Apr 2025 01:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D3712E5D;
	Sun, 20 Apr 2025 01:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pkHgMAoF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF56FC0A
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Apr 2025 01:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745110945; cv=none; b=rvxbrYBGZUb8u3L5mVPl3BrlyKfhsDAnS9nXedpCsl78JfnRbTYX2vYAECKqQWJkE/qLrBYWQEkNrYWjkrBXL6JAieuquoONi7UDDjfJtAcpSd18K0J46/ToA7wjK0F9uYt43ECsEtx4FhufPIzo5G4akidMd4qR0XHp43JB/f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745110945; c=relaxed/simple;
	bh=hcDHy3RRkkxSRHE71LwU0gYRMWTOzVCWRzx7Mqh2GgE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fIfdylhMmPEDQZU+2jKZyTNh6CEo4O+9UMAtfuy3JnHZJB7H+06McaEgLFhMbY4cbBlSlRNwqq0hv5qB3GTFYhVOcuPxILzfRQsLjXJ1B5Ib2OCg4oU3x9tsP60LLrMZhd31/+w1G6cmrzZXz/qTxeQWjQw5b8LFDNUIS2xkxzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pkHgMAoF; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2d50f1673ddso1930684fac.3
        for <linux-kbuild@vger.kernel.org>; Sat, 19 Apr 2025 18:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745110942; x=1745715742; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9dM0SBRmys2RLUq/tk1n2JC3AAy1W8EAIPREZH+YITI=;
        b=pkHgMAoF/jBaEQuuO0iHPeB/DnpxKG8UijoOST+oJxvHsvz1e1gmU/pt9LHNgnd4O5
         PhARrBh08/RkESRBLOZjamqvDVVjql0TBYuhaeEKg6mrte7aqEzwd+kCbkN+4Oezyy1Q
         /48LQgmjeI1pCFq1c4mhGrr3SGELyf7SWvFS98E2FU61Yu7kxGBOjvS78Wr4P5xQtTbd
         R8mwZzyWPKL8jcOl8gxB7mCzQw7C4HAGspV2/TZSvqId0XX2geVXgKUIVjMLv6GJIS1+
         b4FXg2U2hbgxRGXjF1NdkWIua+VNd4NVwo+VIh5clCmsuwtH6xmQCjyS86zY1cB3kVd3
         4nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745110942; x=1745715742;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dM0SBRmys2RLUq/tk1n2JC3AAy1W8EAIPREZH+YITI=;
        b=wWZGafb9nQUze3Yy2Vm03w7VZyB+/gbQfB/ZnlsWM1whc+S8raqRAO8BdrjpAbmPXd
         JT9MCDrmRu5TNfeNvX3ovXkY+In+uTQppuSGsZrSzCUSB7TtcZHUSrCA0ZhMoqhbEWsX
         vi1gQFrONtwl8CH4UhF2PA23DVNpevFqW5km1EghMdDh+VZV3x+7LX2QBmiXq21jRY59
         m4kYdhSE1C967b7Qqb48kzMip0YtYOofgqMKyYwvvDx2+cl737TD6yqe0CqIIuRSyvSx
         ewbqym0eVclxtgP9LeoyG9a6TzdJhXSa0HX3wU5GSKDJKdIgkB7ZDO7glRLx+D4cW2x3
         Zltw==
X-Forwarded-Encrypted: i=1; AJvYcCVuo/9wBWQU3yvKXSsKLNcZrYB01hY0C26DIuHdEN2ZDZQJhv3c1IrGf7Lpqx/lOFTOkZwO8MRnF8AoMKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHHLYa6di1P8ov5pAo+r3v7ImyxlhpAeG+nfUhQeR6BfDyURf
	ngsaSCptFE1snSExSwfV+YgkC4+H4gXfVY2eSY40k6vQ2Cs0j/pags9BfRVW8QLyEg==
X-Google-Smtp-Source: AGHT+IHgA3IgZuOy7Yd35q6GE2aaBWD0CMY7zESiHQJzLUaA6ln8kosbYqa8XQia5YeEV+DkVgQiPbc=
X-Received: from oacqc13.prod.google.com ([2002:a05:6871:e7cd:b0:2b8:e401:9c8d])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:5e06:b0:287:471:41eb
 with SMTP id 586e51a60fabf-2d526985e2amr4447769fac.6.1745110942537; Sat, 19
 Apr 2025 18:02:22 -0700 (PDT)
Date: Sat, 19 Apr 2025 18:02:14 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250420010214.1963979-1-xur@google.com>
Subject: [PATCH] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rong Xu <xur@google.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

Add distributed ThinLTO build support for the Linux kernel.
This new mode offers several advantages: (1) Increased
flexibility in handling user-specified build options.
(2) Improved user-friendliness for developers. (3) Greater
convenience for integrating with objtool and livepatch.

Note that "distributed" in this context refers to a term
that differentiates in-process ThinLTO builds by invoking
backend compilation through the linker, not necessarily
building in distributed environments.

Distributed ThinLTO is enabled via the
`CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
 > make LLVM=1 defconfig
 > scripts/config -e LTO_CLANG_THIN_DIST
 > make LLVM=1 oldconfig
 > make LLVM=1 vmlinux -j <..>

The implementation changes the top-level Makefile with a
macro for generating `vmlinux.o` for distributed ThinLTO
builds. It uses the existing Kbuild infrastructure to
perform two recursive passes through the subdirectories.
The first pass generates LLVM IR object files, similar to
in-process ThinLTO. Following the thin-link stage, a second
pass compiles these IR files into the final native object
files. The build rules and actions for this two-pass process
are primarily implemented in `scripts/Makefile.build`.

Currently, this patch focuses on building the main kernel
image (`vmlinux`) only. Support for building kernel modules
using this method is planned for a subsequent patch.

Tested on the following arch: x86, arm64, loongarch, and
riscv.

Some implementation details can be found here:
https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/85934

Signed-off-by: Rong Xu <xur@google.com>
---
 MAINTAINERS                       |  5 +++
 Makefile                          | 40 ++++++++++++++++++++---
 arch/Kconfig                      | 12 +++++++
 scripts/Makefile.build            | 52 +++++++++++++++++++++++++++---
 scripts/Makefile.lib              |  7 +++-
 scripts/Makefile.vmlinux_o        | 16 +++++++---
 scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++++
 scripts/head-object-list.txt      |  1 +
 8 files changed, 171 insertions(+), 15 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_thinlink

diff --git a/MAINTAINERS b/MAINTAINERS
index c966e71ea60bb..40d3bc223e4b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5782,6 +5782,11 @@ F:	scripts/Makefile.clang
 F:	scripts/clang-tools/
 K:	\b(?i:clang|llvm)\b
 
+CLANG/LLVM THINLTO DISTRIBUTED BUILD
+M:	Rong Xu <xur@google.com>
+S:	Supported
+F:	scripts/Makefile.vmlinux_thinlink
+
 CLK API
 M:	Russell King <linux@armlinux.org.uk>
 L:	linux-clk@vger.kernel.org
diff --git a/Makefile b/Makefile
index e65f8735c7bf6..18da9a40dd2c8 100644
--- a/Makefile
+++ b/Makefile
@@ -298,7 +298,8 @@ no-dot-config-targets := $(clean-targets) \
 			 outputmakefile rustavailable rustfmt rustfmtcheck
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
-single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
+single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.final_o \
+	          %.final_a %.o.thinlto.bc %/
 
 config-build	:=
 mixed-build	:=
@@ -991,10 +992,10 @@ export CC_FLAGS_SCS
 endif
 
 ifdef CONFIG_LTO_CLANG
-ifdef CONFIG_LTO_CLANG_THIN
-CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
-else
+ifdef CONFIG_LTO_CLANG_FULL
 CC_FLAGS_LTO	:= -flto
+else # for CONFIG_LTO_CLANG_THIN or CONFIG_LTO_CLANG_THIN_DIST
+CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
 endif
 CC_FLAGS_LTO	+= -fvisibility=hidden
 
@@ -1218,8 +1219,34 @@ vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
 	$(call if_changed,ar_vmlinux.a)
 
 PHONY += vmlinux_o
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+vmlinux.thinlink: vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_thinlink
+targets += vmlinux.thinlink
+
+vmlinux_final_a := $(patsubst %.a,%.final_a,$(KBUILD_VMLINUX_OBJS))
+quiet_cmd_ar_vmlinux.final_a = AR      $@
+      cmd_ar_vmlinux.final_a = \
+	rm -f $@; \
+	$(AR) cDPrST $@ $(vmlinux_final_a); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+
+define rule_gen_vmlinux_final_a
+	+$(Q)$(MAKE) $(build)=. need-builtin=1 thinlto_final_pass=1 need-modorder=1 built-in.final_a
+	$(call cmd_and_savecmd,ar_vmlinux.final_a)
+endef
+
+vmlinux.final_a: vmlinux.thinlink scripts/head-object-list.txt FORCE
+	$(call if_changed_rule,gen_vmlinux_final_a)
+
+targets += vmlinux.final_a
+
+vmlinux_o: vmlinux.final_a
+	$(Q)$(MAKE) thinlto_final_pass=1 -f $(srctree)/scripts/Makefile.vmlinux_o
+else
 vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_o
+endif
 
 vmlinux.o modules.builtin.modinfo modules.builtin: vmlinux_o
 	@:
@@ -1577,7 +1604,8 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
-               .builtin-dtbs-list .builtin-dtb.S
+	       .builtin-dtbs-list .builtin-dtb.S \
+	       .vmlinux_thinlto_bc_files vmlinux.thinlink
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
@@ -2028,6 +2056,8 @@ clean: $(clean-dirs)
 		-o -name '*.symtypes' -o -name 'modules.order' \
 		-o -name '*.c.[012]*.*' \
 		-o -name '*.ll' \
+		-o -name '*.final_a' -o -name '*.final_o' \
+		-o -name '*.o.thinlto.bc' \
 		-o -name '*.gcno' \
 		\) -type f -print \
 		-o -name '.tmp_*' -print \
diff --git a/arch/Kconfig b/arch/Kconfig
index b0adb665041f1..cbeeeb9b076d8 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -810,6 +810,18 @@ config LTO_CLANG_THIN
 	    https://clang.llvm.org/docs/ThinLTO.html
 
 	  If unsure, say Y.
+
+config LTO_CLANG_THIN_DIST
+	bool "Clang ThinLTO in distributed mode (EXPERIMENTAL)"
+	depends on HAS_LTO_CLANG && ARCH_SUPPORTS_LTO_CLANG_THIN
+	select LTO_CLANG
+	help
+	  This option enables Clang's ThinLTO in distributed build mode.
+	  In this mode, the linker performs the thin-link, generating
+	  ThinLTO index files. Subsequently, the build system explicitly
+	  invokes ThinLTO backend compilation using these index files
+	  and pre-linked IR objects. The resulting final object files
+	  are with the .final_o suffix.
 endchoice
 
 config ARCH_SUPPORTS_AUTOFDO_CLANG
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 13dcd86e74ca8..87259b0e2bfc8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -50,18 +50,23 @@ endif
 
 # ===========================================================================
 
+builtin_suffix := $(if $(filter %.final_a, $(MAKECMDGOALS)),final_a,a)
+ifeq ($(thinlto_final_pass),1)
+builtin_suffix := final_a
+endif
+
 # subdir-builtin and subdir-modorder may contain duplications. Use $(sort ...)
-subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
+subdir-builtin := $(sort $(filter %/built-in.$(builtin_suffix), $(real-obj-y)))
 subdir-modorder := $(sort $(filter %/modules.order, $(obj-m)))
 
 targets-for-builtin := $(extra-y)
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
-targets-for-builtin += $(obj)/lib.a
+targets-for-builtin += $(obj)/lib.$(builtin_suffix)
 endif
 
 ifdef need-builtin
-targets-for-builtin += $(obj)/built-in.a
+targets-for-builtin += $(obj)/built-in.$(builtin_suffix)
 endif
 
 targets-for-modules := $(foreach x, o mod, \
@@ -337,6 +342,10 @@ $(obj)/%.o: $(obj)/%.S FORCE
 targets += $(filter-out $(subdir-builtin), $(real-obj-y))
 targets += $(filter-out $(subdir-modorder), $(real-obj-m))
 targets += $(lib-y) $(always-y)
+ifeq ($(builtin_suffix), final_a)
+final_o_targets = $(patsubst,%.o,%.final_o,$(targets))
+targets += $(final_targets)
+endif
 
 # Linker scripts preprocessor (.lds.S -> .lds)
 # ---------------------------------------------------------------------------
@@ -347,6 +356,24 @@ quiet_cmd_cpp_lds_S = LDS     $@
 $(obj)/%.lds: $(src)/%.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+# Generate .final_o (obj) from .o (bitcode) file
+# ---------------------------------------------------------------------------
+quiet_cmd_cc_o_bc = CC $(quiet_modtag) $@
+
+cmd_cc_o_bc      = $(if $(filter bitcode, $(shell file -b $<)),$(CC) \
+		   $(filter-out -Wp% $(LINUXINCLUDE) %.h.gch %.h -D% \
+		   -flto=thin, $(c_flags)) \
+		   -Wno-unused-command-line-argument \
+		   -x ir -fthinlto-index=$<.thinlto.bc -c -o $@ \
+		   $(if $(findstring ../,$<), \
+		   $$(realpath --relative-to=$(srcroot) $<), $<), \
+		   cp $< $@)
+
+$(obj)/%.final_o: $(obj)/%.o FORCE
+	$(call if_changed,cc_o_bc)
+endif
+
 # ASN.1 grammar
 # ---------------------------------------------------------------------------
 quiet_cmd_asn1_compiler = ASN.1   $(basename $@).[ch]
@@ -360,7 +387,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 # ---------------------------------------------------------------------------
 
 # To build objects in subdirs, we need to descend into the directories
-$(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
+$(subdir-builtin): $(obj)/%/built-in.$(builtin_suffix): $(obj)/% ;
 $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 
 #
@@ -377,6 +404,12 @@ quiet_cmd_ar_builtin = AR      $@
 $(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+# Rule to compile a set of .final_o files into one .final_a file.
+$(obj)/built-in.final_a: $(patsubst %.o,%.final_o,$(real-obj-y)) FORCE
+	$(call if_changed,ar_builtin)
+endif
+
 # This is a list of build artifacts from the current Makefile and its
 # sub-directories. The timestamp should be updated when any of the member files.
 
@@ -394,6 +427,14 @@ $(obj)/modules.order: $(obj-m) FORCE
 $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+quiet_cmd_ar_final = AR      $@
+      cmd_ar_final = rm -f $@; $(AR) cDPrsT $@ $(patsubst %.o,%.final_o,$(real-prereqs))
+
+$(obj)/lib.final_a: $(patsubst %.o,%.final_o,$(lib-y)) FORCE
+	$(call if_changed,ar_final)
+endif
+
 quiet_cmd_ld_multi_m = LD [M]  $@
       cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool)
 
@@ -459,7 +500,8 @@ $(single-subdir-goals): $(single-subdirs)
 PHONY += $(subdir-ym)
 $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
-	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
+	need-builtin=$(if $(filter $@/built-in.$(builtin_suffix), $(subdir-builtin)),1) \
+	thinlto_final_pass=$(if $(filter final_a, $(builtin_suffix)),1) \
 	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
 	$(filter $@/%, $(single-subdir-goals))
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 2fe73cda0bddb..ce341ed8d1df3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -34,8 +34,13 @@ else
 obj-m := $(filter-out %/, $(obj-m))
 endif
 
+builtin_suffix := $(if $(filter %.final_a, $(MAKECMDGOALS)),final_a,a)
+ifeq ($(thinlto_final_pass),1)
+        builtin_suffix := final_a
+endif
+
 ifdef need-builtin
-obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
+obj-y		:= $(patsubst %/, %/built-in.$(builtin_suffix), $(obj-y))
 else
 obj-y		:= $(filter-out %/, $(obj-y))
 endif
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 938c7457717ea..4f04eb2c11412 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -9,6 +9,14 @@ include $(srctree)/scripts/Kbuild.include
 # for objtool
 include $(srctree)/scripts/Makefile.lib
 
+ifeq ($(thinlto_final_pass),1)
+vmlinux_a := vmlinux.final_a
+vmlinux_libs := $(patsubst %.a,%.final_a,$(KBUILD_VMLINUX_LIBS))
+else
+vmlinux_a := vmlinux.a
+vmlinux_libs := $(KBUILD_VMLINUX_LIBS)
+endif
+
 # Generate a linker script to ensure correct ordering of initcalls for Clang LTO
 # ---------------------------------------------------------------------------
 
@@ -18,7 +26,7 @@ quiet_cmd_gen_initcalls_lds = GEN     $@
 	$(PERL) $(real-prereqs) > $@
 
 .tmp_initcalls.lds: $(srctree)/scripts/generate_initcall_order.pl \
-		vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
+		$(vmlinux_a) $(vmlinux_libs) FORCE
 	$(call if_changed,gen_initcalls_lds)
 
 targets := .tmp_initcalls.lds
@@ -59,8 +67,8 @@ quiet_cmd_ld_vmlinux.o = LD      $@
 	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
 	$(vmlinux-o-ld-args-y) \
 	$(addprefix -T , $(initcalls-lds)) \
-	--whole-archive vmlinux.a --no-whole-archive \
-	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
+	--whole-archive $(vmlinux_a) --no-whole-archive \
+	--start-group $(vmlinux_libs) --end-group \
 	$(cmd_objtool)
 
 define rule_ld_vmlinux.o
@@ -68,7 +76,7 @@ define rule_ld_vmlinux.o
 	$(call cmd,gen_objtooldep)
 endef
 
-vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
+vmlinux.o: $(initcalls-lds) $(vmlinux_a) $(vmlinux_libs) FORCE
 	$(call if_changed_rule,ld_vmlinux.o)
 
 targets += vmlinux.o
diff --git a/scripts/Makefile.vmlinux_thinlink b/scripts/Makefile.vmlinux_thinlink
new file mode 100644
index 0000000000000..13e4026c7d45b
--- /dev/null
+++ b/scripts/Makefile.vmlinux_thinlink
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+PHONY := __default
+__default: vmlinux.thinlink
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+
+
+# Generate a linker script to ensure correct ordering of initcalls for Clang LTO
+# ---------------------------------------------------------------------------
+
+quiet_cmd_gen_initcalls_lds = GEN     $@
+      cmd_gen_initcalls_lds = \
+	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
+	$(PERL) $(real-prereqs) > $@
+
+.tmp_initcalls_thinlink.lds: $(srctree)/scripts/generate_initcall_order.pl \
+		vmlinux.a FORCE
+	$(call if_changed,gen_initcalls_lds)
+
+targets := .tmp_initcalls_thinlink.lds
+
+initcalls-lds := .tmp_initcalls_thinlink.lds
+
+quiet_cmd_ld_vmlinux.thinlink = LD      $@
+      cmd_ld_vmlinux.thinlink = \
+	$(AR) t vmlinux.a > .vmlinux_thinlto_bc_files; \
+	$(LD) ${KBUILD_LDFLAGS} -r $(addprefix -T , $(initcalls-lds)) \
+	--thinlto-index-only @.vmlinux_thinlto_bc_files; \
+	touch vmlinux.thinlink
+
+vmlinux.thinlink: vmlinux.a $(initcalls-lds) FORCE
+	$(call if_changed,ld_vmlinux.thinlink)
+
+targets += vmlinux.thinlink
+
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
+# ---------------------------------------------------------------------------
+
+PHONY += FORCE
+FORCE:
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+.PHONY: $(PHONY)
diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index 7274dfc65af60..b300222e99a6b 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -18,6 +18,7 @@ arch/arm/kernel/head.o
 arch/csky/kernel/head.o
 arch/hexagon/kernel/head.o
 arch/loongarch/kernel/head.o
+arch/loongarch/kernel/head.final_o
 arch/m68k/68000/head.o
 arch/m68k/coldfire/head.o
 arch/m68k/kernel/head.o
-- 
2.49.0.805.g082f7c87e0-goog


