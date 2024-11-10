Return-Path: <linux-kbuild+bounces-4609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712F9C3056
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC22A1F217B6
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D6B14D2AC;
	Sun, 10 Nov 2024 01:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWGrXmo3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D67219FC;
	Sun, 10 Nov 2024 01:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202629; cv=none; b=LSdUTSxBmPpICa2j80KVvKbI2TU7Ovo8WDKxeLdjMsE7teaF9w1NSRLcq5ToHwmhc5UyhsPzfP+wBhWxy7TdVbyUPfcbYPMsWqQOgWS778cWg/lMznntolMB50AtTh/gVdJCrcaUaKAG9inozkdUyVfXIoWlvQF40haXpk4G0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202629; c=relaxed/simple;
	bh=BhVBR2hhzdfNMnrLYX5uGVTvLEYjQ0ro7XBUDNN+P64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpgkyUTMEEwdawo8YapKIBbPG3mJqjGDFwpedNGiMxjERttVIWQuc1StD4NxN5fQkLJ7lJdm9xvIcOLe6o9ubqPOEKFWO6ZVKGiKiSNfrp7wEOQ1loYc3oFKfs95lw9amCip6G6z1mdNXbE7YrM7ms3hVJsanhLn69ABsKzDnQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWGrXmo3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FA1C4CED8;
	Sun, 10 Nov 2024 01:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202628;
	bh=BhVBR2hhzdfNMnrLYX5uGVTvLEYjQ0ro7XBUDNN+P64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uWGrXmo3OaqsolvcUncI7F8NnDPtJEviXVOkvhh9spAMVKgwDmrlTx4k67gb1Ona4
	 LQmgRk3eHiVymIGeYDdXZYuZiUQ4/vfIfAj6DVOBeLe2X2S92I2PWGq+I8DFFWwWo7
	 EMUCrGtRx6Ad60NUR8xsAsQqSJUVxylGwJ9Y/wytiKfc409BjIiuPEHVgfndW0BAKt
	 ne7TojjqzJgbE6QZAyZwDaNm8YweRLCSuumaxHRtSyi2YM7qpYRO+BHranSKc6F5KE
	 TQpKiSMi+NRiZNn6roJEixDxTODdAfT4dQh0hcWfNJ7kM7A5dLoJsyuw7d2JrKTXNq
	 /IrgL3rrdJtOw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 06/11] kbuild: remove extmod_prefix, MODORDER, MODULES_NSDEPS variables
Date: Sun, 10 Nov 2024 10:34:34 +0900
Message-ID: <20241110013649.34903-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110013649.34903-1-masahiroy@kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the previous changes, $(extmod_prefix), $(MODORDER), and
$(MODULES_NSDEPS) are constant. (empty, modules.order, and
modules.nsdeps, respectively).

Remove these variables and hard-code their values.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

Changes in v2:
 - More cleanups

 Makefile                  | 22 +++++++++-------------
 scripts/Makefile.modfinal |  8 ++++----
 scripts/Makefile.modinst  |  6 +++---
 scripts/Makefile.modpost  |  6 +++---
 scripts/nsdeps            |  2 +-
 5 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/Makefile b/Makefile
index e5f7ac7647a7..c7eeb10455b6 100644
--- a/Makefile
+++ b/Makefile
@@ -1122,10 +1122,6 @@ export MODLIB
 
 PHONY += prepare0
 
-export extmod_prefix =
-export MODORDER := $(extmod_prefix)modules.order
-export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
-
 ifeq ($(KBUILD_EXTMOD),)
 
 build-dir	:= .
@@ -1876,7 +1872,7 @@ endif
 
 ifdef CONFIG_MODULES
 
-$(MODORDER): $(build-dir)
+modules.order: $(build-dir)
 	@:
 
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
@@ -1887,7 +1883,7 @@ ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 endif
 
 PHONY += modules_check
-modules_check: $(MODORDER)
+modules_check: modules.order
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh $<
 
 else # CONFIG_MODULES
@@ -1928,15 +1924,15 @@ $(single-ko): single_modules
 $(single-no-ko): $(build-dir)
 	@:
 
-# Remove MODORDER when done because it is not the real one.
+# Remove modules.order when done because it is not the real one.
 PHONY += single_modules
 single_modules: $(single-no-ko) modules_prepare
-	$(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$(m:%.ko=%.o);) } > $(MODORDER)
+	$(Q){ $(foreach m, $(single-ko), echo $(m:%.ko=%.o);) } > modules.order
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
 endif
-	$(Q)rm -f $(MODORDER)
+	$(Q)rm -f modules.order
 
 single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
 
@@ -2013,12 +2009,12 @@ nsdeps: modules
 quiet_cmd_gen_compile_commands = GEN     $@
       cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
 
-$(extmod_prefix)compile_commands.json: $(srctree)/scripts/clang-tools/gen_compile_commands.py \
+compile_commands.json: $(srctree)/scripts/clang-tools/gen_compile_commands.py \
 	$(if $(KBUILD_EXTMOD),, vmlinux.a $(KBUILD_VMLINUX_LIBS)) \
-	$(if $(CONFIG_MODULES), $(MODORDER)) FORCE
+	$(if $(CONFIG_MODULES), modules.order) FORCE
 	$(call if_changed,gen_compile_commands)
 
-targets += $(extmod_prefix)compile_commands.json
+targets += compile_commands.json
 
 PHONY += clang-tidy clang-analyzer
 
@@ -2026,7 +2022,7 @@ ifdef CONFIG_CC_IS_CLANG
 quiet_cmd_clang_tools = CHECK   $<
       cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
 
-clang-tidy clang-analyzer: $(extmod_prefix)compile_commands.json
+clang-tidy clang-analyzer: compile_commands.json
 	$(call cmd,clang_tools)
 else
 clang-tidy clang-analyzer:
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 6d8aa3059ee2..bab53884f7e3 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -13,7 +13,7 @@ include $(srctree)/scripts/Kbuild.include
 include $(srctree)/scripts/Makefile.lib
 
 # find all modules listed in modules.order
-modules := $(call read-file, $(MODORDER))
+modules := $(call read-file, modules.order)
 
 __modfinal: $(modules:%.o=%.ko)
 	@:
@@ -30,7 +30,7 @@ quiet_cmd_cc_o_c = CC [M]  $@
 %.mod.o: %.mod.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
-$(extmod_prefix).module-common.o: $(srctree)/scripts/module-common.c FORCE
+.module-common.o: $(srctree)/scripts/module-common.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
 quiet_cmd_ld_ko_o = LD [M]  $@
@@ -57,13 +57,13 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
-%.ko: %.o %.mod.o $(extmod_prefix).module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
+%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
 	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
 
-targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) $(extmod_prefix).module-common.o
+targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
 
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 6fa9af4a25b4..f97c9926ed31 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -40,7 +40,7 @@ $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.
 
 endif
 
-modules := $(call read-file, $(MODORDER))
+modules := $(call read-file, modules.order)
 
 ifeq ($(KBUILD_EXTMOD),)
 dst := $(MODLIB)/kernel
@@ -59,7 +59,7 @@ suffix-$(CONFIG_MODULE_COMPRESS_XZ)	:= .xz
 suffix-$(CONFIG_MODULE_COMPRESS_ZSTD)	:= .zst
 endif
 
-modules := $(patsubst $(extmod_prefix)%.o, $(dst)/%.ko$(suffix-y), $(modules))
+modules := $(patsubst %.o, $(dst)/%.ko$(suffix-y), $(modules))
 install-$(CONFIG_MODULES) += $(modules)
 
 __modinst: $(install-y)
@@ -119,7 +119,7 @@ endif
 # Create necessary directories
 $(foreach dir, $(sort $(dir $(install-y))), $(shell mkdir -p $(dir)))
 
-$(dst)/%.ko: $(extmod_prefix)%.ko FORCE
+$(dst)/%.ko: %.ko FORCE
 	$(call cmd,install)
 	$(call cmd,strip)
 	$(call cmd,sign)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 78d2ca4f25f5..ab0e94ea6249 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -46,7 +46,7 @@ modpost-args =										\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w)							\
-	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))					\
+	$(if $(KBUILD_NSDEPS),-d modules.nsdeps)					\
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)	\
 	$(if $(findstring 1, $(KBUILD_EXTRA_WARN)),-W)					\
 	-o $@
@@ -61,8 +61,8 @@ endif
 # Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 ifdef KBUILD_MODULES
-modpost-args += -T $(MODORDER)
-modpost-deps += $(MODORDER)
+modpost-args += -T modules.order
+modpost-deps += modules.order
 endif
 
 ifeq ($(KBUILD_EXTMOD),)
diff --git a/scripts/nsdeps b/scripts/nsdeps
index 8ca12e2b5c03..bab4ec870e50 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -51,4 +51,4 @@ generate_deps() {
 while read line
 do
 	generate_deps $line
-done < $MODULES_NSDEPS
+done < modules.nsdeps
-- 
2.43.0


