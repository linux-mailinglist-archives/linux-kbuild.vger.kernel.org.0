Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBA024E05A
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 21:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgHUTDT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 15:03:19 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:62809 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgHUTCz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 15:02:55 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07LJ23ea027595;
        Sat, 22 Aug 2020 04:02:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07LJ23ea027595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598036530;
        bh=26iv8Vo38bEZsN9JC9hkPbfrSIwsHcG4pPwd2iyyik8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fLoTGKzp7HhBBEu4xn5YsKz+XP8ADr2yCdaGHVALRHvkbrXv01PebtantswMQZxiq
         KxGRHJvp+PX5wtwGJaXbSGin4m/TgIjy4FkAQPs+Qwpo/Py4HZadfphrwIHPP7TZWP
         HUzYDSKOxNSDaPMtY9p7FEkqU/ydl2rWL3Ytv42Y4BMcvZOTeZdnCVYf1wUb/dKB+3
         wYVv14tGWgzcqSZLG/n6WjjcS5XO+MrzqZleQsLFw1iRXtiVNGY2r7BbdRiEnjvmsB
         bplFkNadslS+4vLrR9l02QIE2VyzuT7jULfnpyXfx1WB0WMQTJTktbvwT9tpgk5Wsk
         bhyvcDQEGDZDw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] kbuild: wire up the build rule of compile_commands.json to Makefile
Date:   Sat, 22 Aug 2020 04:01:58 +0900
Message-Id: <20200821190159.1033740-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821190159.1033740-1-masahiroy@kernel.org>
References: <20200821190159.1033740-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, you need to manually run scripts/gen_compile_commands.py
to create compile_commands.json. It parses all the .*.cmd files found
under the specified directory.

If you rebuild the kernel over again without 'make clean',
.*.cmd files from older builds will create stale entries in
compile_commands.json.

This commit wires up the compile_commands.json rule to Makefile, and
makes it parse only the .*.cmd files involved in the current build.

Pass $(KBUILD_VMLINUX_OBJS), $(KBUILD_VMLINUX_LIBS), and modules.order
to the script. The objects or archives linked to vmlinux are listed in
$(KBUILD_VMLINUX_OBJS) or $(KBUILD_VMLINUX_LIBS). All the modules are
listed in modules.order.

You can create compile_commands.json from Make:

  $ make -j$(nproc) CC=clang compile_commands.json

You can also build vmlinux, modules, and compile_commands.json all
together in a single command:

  $ make -j$(nproc) CC=clang all compile_commands.json

It works for M= builds as well. In this case, compile_commands.json
is created in the top directory of the external module.

This is convenient, but it has a drawback; the coverage of the
compile_commands.json is reduced because only the objects linked to
vmlinux or modules are handled. For example, the following C files are
not included in the compile_commands.json:

 - Decompressor source files (arch/*/boot/)
 - VDSO source files
 - C files used to generate intermediates (e.g. kernel/bounds.c)
 - Standalone host programs

I think it is fine for most developers because our main interest is
the kernel-space code.

If you want to cover all the compiled C files, please build the kernel
then run the script manually as before:

  $ make clean    # if you want to delete stale .cmd files [optional]
  $ make -j$(nproc) CC=clang
  $ scripts/gen_compile_commands.json

Here is a note for out-of-tree builds. 'make compile_commands.json'
works with O= option, but please notice compile_commands.json is
created in the object tree instead of the source tree.

Some people may want to have compile_commands.json in the source tree
because Clang Tools searches for it through all parent paths of the
first input source file.

However, you cannot do this for O= builds. Kbuild should never generate
any build artifact in the source tree when O= is given because the
source tree might be read-only. Any write attempt to the source tree
is monitored and the violation may be reported. See the commit log of
8ef14c2c41d9.

So, the only possible way is to create compile_commands.json in the
object tree, then specify '-p <build-path>' when you use clang-check,
clang-tidy, etc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 Makefile | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9cac6fde3479..65ed336a6de1 100644
--- a/Makefile
+++ b/Makefile
@@ -635,7 +635,7 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps,$(MAKECMDGOALS)),)
+ifneq ($(filter all modules nsdeps %compile_commands.json,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
 endif
 
@@ -1464,7 +1464,8 @@ endif # CONFIG_MODULES
 
 # Directories & files removed with 'make clean'
 CLEAN_FILES += include/ksym vmlinux.symvers \
-	       modules.builtin modules.builtin.modinfo modules.nsdeps
+	       modules.builtin modules.builtin.modinfo modules.nsdeps \
+	       compile_commands.json
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
@@ -1698,9 +1699,12 @@ KBUILD_MODULES := 1
 
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
-modules: descend
+modules: $(MODORDER)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
+$(MODORDER): descend
+	@:
+
 PHONY += modules_install
 modules_install: _emodinst_ _emodinst_post
 
@@ -1714,8 +1718,12 @@ PHONY += _emodinst_post
 _emodinst_post: _emodinst_
 	$(call cmd,depmod)
 
+compile_commands.json: $(extmod-prefix)compile_commands.json
+PHONY += compile_commands.json
+
 clean-dirs := $(KBUILD_EXTMOD)
-clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps
+clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps \
+	$(KBUILD_EXTMOD)/compile_commands.json
 
 PHONY += help
 help:
@@ -1828,6 +1836,19 @@ nsdeps: export KBUILD_NSDEPS=1
 nsdeps: modules
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
 
+# Clang Tooling
+# ---------------------------------------------------------------------------
+
+quiet_cmd_gen_compile_commands = GEN     $@
+      cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
+
+$(extmod-prefix)compile_commands.json: scripts/gen_compile_commands.py \
+	$(if $(KBUILD_EXTMOD),,$(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)) \
+	$(if $(CONFIG_MODULES), $(MODORDER)) FORCE
+	$(call if_changed,gen_compile_commands)
+
+targets += $(extmod-prefix)compile_commands.json
+
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
-- 
2.25.1

