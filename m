Return-Path: <linux-kbuild+bounces-7018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F350AAAED7A
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 22:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D0B74644A5
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 20:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB6828FA93;
	Wed,  7 May 2025 20:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Hjs416t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45D28C032
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746651311; cv=none; b=kSosZcs8Z6UDLh1KgVEn/qYwQN6KQHvQq2P1AJiz1kgwVsAn2v7YoH/1QdQrVJgtWQXCGa4kMA1TAQwB3ppuSUSQ6K9YKMJDDfW2OWbvZgSq1jua39+siHvgxdBSbLulAfUe0mkTIwYpBf/+QfqlLIyEJ9/ZGl8TVZi9XFFuR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746651311; c=relaxed/simple;
	bh=ZY1u7qt8tMklUWTTqEyWmrmHUiD/u1Q9xouiNAkfGuw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tRTm8DlT7gUJqVTOj7vA0PLAEltGBxR+ODJM1BtpuM40TYHyj24C8wC3HwEojHcBLnBE636k0Imn7LQ8OQrLvS/pLP0AH+w+bByVu1vtFu5eCnN72tJEtfrOEOxEA050O3EsLtLhVm3gjwPw5jlaJGsQbp3T5jYstpmPeO0KHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Hjs416t; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30ad1e374e2so351921a91.0
        for <linux-kbuild@vger.kernel.org>; Wed, 07 May 2025 13:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746651309; x=1747256109; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tDe69Fa/kduEZce7WFRjGTWy43T3WMZmkU4MxoQNxyQ=;
        b=1Hjs416t4H+hX1MLr24huk6vz7sTxcDA/m9HpfSZdKQmw0UFF6vU8Yo+kLffIu1808
         oXVM3x0jxuh+2fqtgqamvEZo++WAo7niksjDRVYUVALm4qsKJ1hnwFfTklKPyxlH+JYw
         OAAyde8OYKpeN3J/CabCxjQjDsgvtYxCo3i/BobYDZWiwTqMc/Zet9p1yxLb9MJ+7cHr
         HbCwNZnUPZb3TFSq34p6E5+QfOjGcdRDCcV3Mhx3oYXEq9kki5RGJK70+F7KC5pNS+YM
         zNGQD94ODENBkhLMNNVXevNXu2YR+ebiR7w0AFSSWcKgj11sjiropyCaJwwnKUfb9xFd
         OVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746651309; x=1747256109;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDe69Fa/kduEZce7WFRjGTWy43T3WMZmkU4MxoQNxyQ=;
        b=AM1Cifo803wtCjaYNV/eEUqrv9/nm8fp49hUyegsti8IOB7oYJmsStHfyGZumMe7UX
         mwqz2abKrtAEorUHW9s8DsBr6i42Lib+716qdst3k6ra/M0A9Qf1q6W+vHXoxYM2gK0Q
         PjvCatU/oXyV232B10gxfmIX83GNF/DSvuK7uDLfD6DwY+uBGUYmnCQEr9oK3m84VsW2
         Gp1Q/owAyIhIpjvdeTDm9TygZGfFvfx7L6PJhkRE4zaphq8sGx9gSSDKRP95njeOSPGh
         mVxw/G1cSHjlJCzoLAklGF8avui+idsgEEzg5N1SQfDGdDPCz/iWyvpYJ1be6P36vG/D
         nQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU41UW/N82ZbxP8yw8neqrQtaTa5bZvUYM7bQ4pN1CvCGGSXj35a39AJ8rwgazEaXasJmDf0KrIRfvk9m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJwFW9DGJvHz3RThnVkmFnJ7HnFzsfhbLrRWGLqPLQ/ilF82B
	GmvAV9sRh0K4BwdF7HmQPDL415G2uGVTd0kN794zXatJeaNasFAlhrAcTazk6sh64g==
X-Google-Smtp-Source: AGHT+IFMzY2T+8LpJ55GlOrnlLtU9Z0I87rC+F9B1/t07fFaoQ2SEek/BXdaBjhPs9PgxucB5Tk+LUY=
X-Received: from pjbpb5.prod.google.com ([2002:a17:90b:3c05:b0:30a:8ffa:9154])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:278e:b0:2fa:1a23:c01d
 with SMTP id 98e67ed59e1d1-30aac1b407amr7237008a91.21.1746651308886; Wed, 07
 May 2025 13:55:08 -0700 (PDT)
Date: Wed,  7 May 2025 13:55:04 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250507205504.2017028-1-xur@google.com>
Subject: [PATCH v2] kbuild: distributed build support for Clang ThinLTO
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
Changelog since v1:
- Updated the description in arch/Kconfig based on feedback
  from Nathan Chancellor
- Revised file suffixes: .final_o -> .o.thinlto.native, and
  .final_a -> .a.thinlto.native
- Updated list of ignored files in .gitignore
---
 .gitignore                        |  2 ++
 MAINTAINERS                       |  5 +++
 Makefile                          | 40 ++++++++++++++++++++---
 arch/Kconfig                      | 19 +++++++++++
 scripts/Makefile.build            | 52 +++++++++++++++++++++++++++---
 scripts/Makefile.lib              |  7 +++-
 scripts/Makefile.vmlinux_o        | 16 +++++++---
 scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++++
 scripts/head-object-list.txt      |  1 +
 9 files changed, 180 insertions(+), 15 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_thinlink

diff --git a/.gitignore b/.gitignore
index f2f63e47fb886..4ac41950311c8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -12,6 +12,7 @@
 #
 .*
 *.a
+*.a.thinlto_native
 *.asn1.[ch]
 *.bin
 *.bz2
@@ -64,6 +65,7 @@ modules.order
 /vmlinux
 /vmlinux.32
 /vmlinux.map
+/vmlinux.thinlink
 /vmlinux.symvers
 /vmlinux.unstripped
 /vmlinux-gdb.py
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f8688630c014..a492f92c4574b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5790,6 +5790,11 @@ F:	scripts/Makefile.clang
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
index b29cc321ffd9c..212e093fc7411 100644
--- a/Makefile
+++ b/Makefile
@@ -298,7 +298,8 @@ no-dot-config-targets := $(clean-targets) \
 			 outputmakefile rustavailable rustfmt rustfmtcheck
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
-single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
+single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.o.thinlto.native \
+	          %.a.thinlto.native %.o.thinlto.bc %/
 
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
 
@@ -1214,8 +1215,34 @@ vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
 	$(call if_changed,ar_vmlinux.a)
 
 PHONY += vmlinux_o
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+vmlinux.thinlink: vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_thinlink
+targets += vmlinux.thinlink
+
+vmlinux.a.thinlto.native := $(patsubst %.a,%.a.thinlto.native,$(KBUILD_VMLINUX_OBJS))
+quiet_cmd_ar_vmlinux.a.thinlto.native = AR      $@
+      cmd_ar_vmlinux.a.thinlto.native = \
+	rm -f $@; \
+	$(AR) cDPrST $@ $(vmlinux.a.thinlto.native); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+
+define rule_gen_vmlinux.a.thinlto.native
+	+$(Q)$(MAKE) $(build)=. need-builtin=1 thinlto_final_pass=1 need-modorder=1 built-in.a.thinlto.native
+	$(call cmd_and_savecmd,ar_vmlinux.a.thinlto.native)
+endef
+
+vmlinux.a.thinlto.native: vmlinux.thinlink scripts/head-object-list.txt FORCE
+	$(call if_changed_rule,gen_vmlinux.a.thinlto.native)
+
+targets += vmlinux.a.thinlto.native
+
+vmlinux_o: vmlinux.a.thinlto.native
+	$(Q)$(MAKE) thinlto_final_pass=1 -f $(srctree)/scripts/Makefile.vmlinux_o
+else
 vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_o
+endif
 
 vmlinux.o modules.builtin.modinfo modules.builtin: vmlinux_o
 	@:
@@ -1573,7 +1600,8 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
-               .builtin-dtbs-list .builtin-dtb.S
+	       .builtin-dtbs-list .builtin-dtb.S \
+	       .vmlinux_thinlto_bc_files vmlinux.thinlink
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
@@ -2024,6 +2052,8 @@ clean: $(clean-dirs)
 		-o -name '*.symtypes' -o -name 'modules.order' \
 		-o -name '*.c.[012]*.*' \
 		-o -name '*.ll' \
+		-o -name '*.a.thinlto.native' -o -name '*.o.thinlto.native' \
+		-o -name '*.o.thinlto.bc' \
 		-o -name '*.gcno' \
 		\) -type f -print \
 		-o -name '.tmp_*' -print \
diff --git a/arch/Kconfig b/arch/Kconfig
index b0adb665041f1..5ed243ded6efa 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -810,6 +810,25 @@ config LTO_CLANG_THIN
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
+	  and pre-linked IR objects. The resulting native object files
+	  are with the .o.thinlto.native suffix.
+
+	  This build mode offers improved visibility into the ThinLTO
+	  process through explicit subcommand exposure. It also makes
+	  final native object files directly available, benefiting
+	  tools like objtool and kpatch. Additionally, it provides
+	  crucial granular control over back-end options, enabling
+	  module-specific compiler options, and simplifies debugging.
 endchoice
 
 config ARCH_SUPPORTS_AUTOFDO_CLANG
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 13dcd86e74ca8..49ea3934e80bc 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -50,18 +50,23 @@ endif
 
 # ===========================================================================
 
+builtin_suffix := $(if $(filter %.a.thinlto.native, $(MAKECMDGOALS)),.a.thinlto.native,.a)
+ifeq ($(thinlto_final_pass),1)
+builtin_suffix :=.a.thinlto.native
+endif
+
 # subdir-builtin and subdir-modorder may contain duplications. Use $(sort ...)
-subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
+subdir-builtin := $(sort $(filter %/built-in$(builtin_suffix), $(real-obj-y)))
 subdir-modorder := $(sort $(filter %/modules.order, $(obj-m)))
 
 targets-for-builtin := $(extra-y)
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
-targets-for-builtin += $(obj)/lib.a
+targets-for-builtin += $(obj)/lib$(builtin_suffix)
 endif
 
 ifdef need-builtin
-targets-for-builtin += $(obj)/built-in.a
+targets-for-builtin += $(obj)/built-in$(builtin_suffix)
 endif
 
 targets-for-modules := $(foreach x, o mod, \
@@ -337,6 +342,10 @@ $(obj)/%.o: $(obj)/%.S FORCE
 targets += $(filter-out $(subdir-builtin), $(real-obj-y))
 targets += $(filter-out $(subdir-modorder), $(real-obj-m))
 targets += $(lib-y) $(always-y)
+ifeq ($(builtin_suffix),.a.thinlto.native)
+native_targets = $(patsubst,%.o,%.o.thinlto.native,$(targets))
+targets += $(native_targets)
+endif
 
 # Linker scripts preprocessor (.lds.S -> .lds)
 # ---------------------------------------------------------------------------
@@ -347,6 +356,24 @@ quiet_cmd_cpp_lds_S = LDS     $@
 $(obj)/%.lds: $(src)/%.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+# Generate .o.thinlto.native (obj) from .o (bitcode) file
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
+$(obj)/%.o.thinlto.native: $(obj)/%.o FORCE
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
+$(subdir-builtin): $(obj)/%/built-in$(builtin_suffix): $(obj)/% ;
 $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 
 #
@@ -377,6 +404,12 @@ quiet_cmd_ar_builtin = AR      $@
 $(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+# Rule to compile a set of .o.thinlto.native files into one .a.thinlto.native file.
+$(obj)/built-in.a.thinlto.native: $(patsubst %.o,%.o.thinlto.native,$(real-obj-y)) FORCE
+	$(call if_changed,ar_builtin)
+endif
+
 # This is a list of build artifacts from the current Makefile and its
 # sub-directories. The timestamp should be updated when any of the member files.
 
@@ -394,6 +427,14 @@ $(obj)/modules.order: $(obj-m) FORCE
 $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+quiet_cmd_ar_native = AR      $@
+      cmd_ar_native = rm -f $@; $(AR) cDPrsT $@ $(patsubst %.o,%.o.thinlto.native,$(real-prereqs))
+
+$(obj)/lib.a.thinlto.native: $(patsubst %.o,%.o.thinlto.native,$(lib-y)) FORCE
+	$(call if_changed,ar_native)
+endif
+
 quiet_cmd_ld_multi_m = LD [M]  $@
       cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool)
 
@@ -459,7 +500,8 @@ $(single-subdir-goals): $(single-subdirs)
 PHONY += $(subdir-ym)
 $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
-	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
+	need-builtin=$(if $(filter $@/built-in$(builtin_suffix), $(subdir-builtin)),1) \
+	thinlto_final_pass=$(if $(filter .a.thinlto.native, $(builtin_suffix)),1) \
 	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
 	$(filter $@/%, $(single-subdir-goals))
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 2fe73cda0bddb..8e146367f7d16 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -34,8 +34,13 @@ else
 obj-m := $(filter-out %/, $(obj-m))
 endif
 
+builtin_suffix := $(if $(filter %.a.thinlto.native, $(MAKECMDGOALS)),.a.thinlto.native,.a)
+ifeq ($(thinlto_final_pass),1)
+        builtin_suffix :=.a.thinlto.native
+endif
+
 ifdef need-builtin
-obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
+obj-y		:= $(patsubst %/, %/built-in$(builtin_suffix), $(obj-y))
 else
 obj-y		:= $(filter-out %/, $(obj-y))
 endif
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 938c7457717ea..0330cf8e0a8c5 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -9,6 +9,14 @@ include $(srctree)/scripts/Kbuild.include
 # for objtool
 include $(srctree)/scripts/Makefile.lib
 
+ifeq ($(thinlto_final_pass),1)
+vmlinux_a := vmlinux.a.thinlto.native
+vmlinux_libs := $(patsubst %.a,%.a.thinlto.native,$(KBUILD_VMLINUX_LIBS))
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
index 7274dfc65af60..094a4e7c07559 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -18,6 +18,7 @@ arch/arm/kernel/head.o
 arch/csky/kernel/head.o
 arch/hexagon/kernel/head.o
 arch/loongarch/kernel/head.o
+arch/loongarch/kernel/head.o.thinlto.native
 arch/m68k/68000/head.o
 arch/m68k/coldfire/head.o
 arch/m68k/kernel/head.o
-- 
2.49.0.987.g0cc8ee98dc-goog


