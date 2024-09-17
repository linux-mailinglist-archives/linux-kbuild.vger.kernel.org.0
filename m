Return-Path: <linux-kbuild+bounces-3605-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012B97B152
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E80282E20
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6165A194147;
	Tue, 17 Sep 2024 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sg+Cbsfg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C6D1940AB;
	Tue, 17 Sep 2024 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582691; cv=none; b=c0zCsz8fV8ByVHzsVmISyRHxOfnMXfrijYxLUUA0UBzYkbBLOfazy5ON8kdpp6OUGx07LHgqzLfGsxraybgqXGcpaC4YlgCciZOrKXpEJsJGs8x3PMOER7IdGBE5ChXE9hRqTkhDiWHskEHiBy4ed2xsiHozBOw15VE9ZttBiWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582691; c=relaxed/simple;
	bh=v3F59l//1EQnAHqTp5K6zCSernv13ZDiW1k6H5qe7cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOltvXPiFHGUY42sCf2+icpJY8EsfvzR5inQ9GFG1StBDNVqTQZDIOD6rGTLOlGCLaXNj2Tb3cmUMu0A3AtIdxU1CLpc9t31q72+nuQ2BlfJXsjskwRUKbP9W8ZgUTPUoarfsH+nX/A+ysVutVdpIoaNMuIKuOEf6LqkGwT17qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sg+Cbsfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240A4C4CECF;
	Tue, 17 Sep 2024 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582690;
	bh=v3F59l//1EQnAHqTp5K6zCSernv13ZDiW1k6H5qe7cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sg+CbsfggQ1DwMg5dmajZbso8K5l8nvl3ZItaOU6Z/GnNbKX3B1OGxrhm2zG5P+Rv
	 LdbUYnWXbqCgz4yCJ9D5cChgx6Eml8/vTG4FDf2Ls5cCzWGL9WlJ1GdqODA1cfrdWl
	 X9WtC97VOAsg0qfZaV+ypgo2nzHcLZ1qmOIyow7gSjUkHuo7hGEuzF0wJKxtE3iyvw
	 YoNiE9+mOqDhtatkb3OP5ar8TbcsGvnpSYHMMqTtBWzQqIvA7xUTwskROG6KynkZbe
	 m1bm4eZN/hvPTMEInvxhx3jYdbluKV39HnRIHMMWBTsjG8XtYMiqRbGgUjuiZbl4rp
	 yypdw+vYWigMQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 18/23] kbuild: remove extmod_prefix, MODORDER, MODULES_NSDEPS variables
Date: Tue, 17 Sep 2024 23:16:46 +0900
Message-ID: <20240917141725.466514-19-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
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
---

 Makefile                  | 22 +++++++++-------------
 scripts/Makefile.modfinal |  2 +-
 scripts/Makefile.modinst  |  2 +-
 scripts/Makefile.modpost  |  6 +++---
 scripts/nsdeps            |  2 +-
 5 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/Makefile b/Makefile
index 4db22c3a8555..9fbf7ef6e394 100644
--- a/Makefile
+++ b/Makefile
@@ -1102,10 +1102,6 @@ export MODLIB
 
 PHONY += prepare0
 
-export extmod_prefix =
-export MODORDER := $(extmod_prefix)modules.order
-export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
-
 ifeq ($(KBUILD_EXTMOD),)
 
 build-dir	:= .
@@ -1862,7 +1858,7 @@ endif
 
 ifdef CONFIG_MODULES
 
-$(MODORDER): $(build-dir)
+modules.order: $(build-dir)
 	@:
 
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
@@ -1873,7 +1869,7 @@ ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 endif
 
 PHONY += modules_check
-modules_check: $(MODORDER)
+modules_check: modules.order
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh $<
 
 else # CONFIG_MODULES
@@ -1914,15 +1910,15 @@ $(single-ko): single_modules
 $(single-no-ko): $(build-dir)
 	@:
 
-# Remove MODORDER when done because it is not the real one.
+# Remove modules.order when done because it is not the real one.
 PHONY += single_modules
 single_modules: $(single-no-ko) modules_prepare
-	$(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$(m:%.ko=%.o);) } > $(MODORDER)
+	$(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$(m:%.ko=%.o);) } > modules.order
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
 endif
-	$(Q)rm -f $(MODORDER)
+	$(Q)rm -f modules.order
 
 single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
 
@@ -1999,12 +1995,12 @@ nsdeps: modules
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
 
@@ -2012,7 +2008,7 @@ ifdef CONFIG_CC_IS_CLANG
 quiet_cmd_clang_tools = CHECK   $<
       cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
 
-clang-tidy clang-analyzer: $(extmod_prefix)compile_commands.json
+clang-tidy clang-analyzer: compile_commands.json
 	$(call cmd,clang_tools)
 else
 clang-tidy clang-analyzer:
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 6d8aa3059ee2..1d787b867c6d 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -13,7 +13,7 @@ include $(srctree)/scripts/Kbuild.include
 include $(srctree)/scripts/Makefile.lib
 
 # find all modules listed in modules.order
-modules := $(call read-file, $(MODORDER))
+modules := $(call read-file, modules.order)
 
 __modfinal: $(modules:%.o=%.ko)
 	@:
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 2d39d452c49e..1ec739d138b3 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -40,7 +40,7 @@ $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.
 
 endif
 
-modules := $(call read-file, $(MODORDER))
+modules := $(call read-file, modules.order)
 
 ifeq ($(KBUILD_EXTMOD),)
 dst := $(MODLIB)/kernel
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index ccca705bc389..586456c72e6d 100644
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
index 8b4db63838ce..3192a3945871 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -57,4 +57,4 @@ generate_deps() {
 while read line
 do
 	generate_deps $line
-done < $MODULES_NSDEPS
+done < modules.nsdeps
-- 
2.43.0


