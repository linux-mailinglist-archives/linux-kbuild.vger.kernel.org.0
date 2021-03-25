Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01383499C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 19:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhCYSzH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 14:55:07 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:40714 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbhCYSy7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 14:54:59 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 12PIsD6V025746;
        Fri, 26 Mar 2021 03:54:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 12PIsD6V025746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616698454;
        bh=rh9G9lxLInAjsIJ5YF1Dh9a95r8V4/WiPgSc744DqMo=;
        h=From:To:Cc:Subject:Date:From;
        b=GIuES/rUkk/G3Bp7SSeHfTBzaHtDHM188n/MPmBFfESz8JRpFo+2r9/WCf22IoKVB
         N0qlfdMtWOi85sR9UhGbFsemzUmeM2m635Qtq24+u7ysoqrfb/Ioqo6iQWmV6PCUjv
         leKHS0iLY1WPJjZewaaTg+ZWFGVftk4RDuLleoARv+/lrEPcxIE50xJYkjifua7aZQ
         f3aBT0BvP77EGjR8jpbMk7rNbaatvFdZ9UWTaOtgsNTEBz82finths7plJofHNVJFt
         O7nRN18xQH35r9ftOh03hhG07W72Y/g9hmtQDMiwPXjZg5VovNoehjbEKLa+uWyJ3Y
         q37stbSXOkK3A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 1/3] kbuild: generate Module.symvers only when vmlinux exists
Date:   Fri, 26 Mar 2021 03:54:09 +0900
Message-Id: <20210325185412.2352951-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The external module build shows the following warning if Module.symvers
is missing in the kernel tree.

  WARNING: Symbol version dump "Module.symvers" is missing.
           Modules may not have dependencies or modversions.

I think this is an important heads-up because the resulting modules may
not work as expected. This happens when you did not build the entire
kernel tree, for example, you might have prepared the minimal setups
for external modules by 'make defconfig && make modules_preapre'.

A problem is that 'make modules' creates Module.symvers even without
vmlinux. In this case, that warning is suppressed since Module.symvers
already exists in spite of its incomplete content.

The incomplete (i.e. invalid) Module.symvers should not be created.

This commit changes the second pass of modpost to dump symbols into
modules-only.symvers. The final Module.symvers is created by
concatenating vmlinux.symvers and modules-only.symvers if both exist.

Module.symvers is supposed to contain all the symbols from both vmlinux
and modules. It might be a bit confusing, and I am not quite sure if it
is an official interface, but presumably it is difficult to rename it
because some projects (e.g. kmod) parse it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .gitignore               |  1 +
 Documentation/dontdiff   |  1 +
 Makefile                 |  2 +-
 scripts/Makefile.modpost | 15 ++++++++++++++-
 scripts/mod/modpost.c    | 15 +--------------
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/.gitignore b/.gitignore
index 3adea59847ce..df8d3146a43f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -57,6 +57,7 @@ modules.order
 /tags
 /TAGS
 /linux
+/modules-only.symvers
 /vmlinux
 /vmlinux.32
 /vmlinux.map
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index ac42ad8d430d..910b30a2a7d9 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -178,6 +178,7 @@ mktables
 mktree
 mkutf8data
 modpost
+modules-only.symvers
 modules.builtin
 modules.builtin.modinfo
 modules.nsdeps
diff --git a/Makefile b/Makefile
index 2b161f5a5a66..ed8bd815e8a3 100644
--- a/Makefile
+++ b/Makefile
@@ -1532,7 +1532,7 @@ endif # CONFIG_MODULES
 # make distclean Remove editor backup files, patch leftover files and the like
 
 # Directories & files removed with 'make clean'
-CLEAN_FILES += include/ksym vmlinux.symvers \
+CLEAN_FILES += include/ksym vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       compile_commands.json .thinlto-cache
 
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index df57e259fac3..3f5b09a09aef 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -68,7 +68,20 @@ else
 ifeq ($(KBUILD_EXTMOD),)
 
 input-symdump := vmlinux.symvers
-output-symdump := Module.symvers
+output-symdump := modules-only.symvers
+
+quiet_cmd_cat = GEN     $@
+      cmd_cat = cat $(real-prereqs) > $@
+
+ifneq ($(wildcard vmlinux.symvers),)
+
+__modpost: Module.symvers
+Module.symvers: vmlinux.symvers modules-only.symvers FORCE
+	$(call if_changed,cat)
+
+targets += Module.symvers
+
+endif
 
 else
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 24725e50c7b4..10c3fba26f03 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2423,19 +2423,6 @@ static void read_dump(const char *fname)
 	fatal("parse error in symbol dump file\n");
 }
 
-/* For normal builds always dump all symbols.
- * For external modules only dump symbols
- * that are not read from kernel Module.symvers.
- **/
-static int dump_sym(struct symbol *sym)
-{
-	if (!external_module)
-		return 1;
-	if (sym->module->from_dump)
-		return 0;
-	return 1;
-}
-
 static void write_dump(const char *fname)
 {
 	struct buffer buf = { };
@@ -2446,7 +2433,7 @@ static void write_dump(const char *fname)
 	for (n = 0; n < SYMBOL_HASH_SIZE ; n++) {
 		symbol = symbolhash[n];
 		while (symbol) {
-			if (dump_sym(symbol)) {
+			if (!symbol->module->from_dump) {
 				namespace = symbol->namespace;
 				buf_printf(&buf, "0x%08x\t%s\t%s\t%s\t%s\n",
 					   symbol->crc, symbol->name,
-- 
2.27.0

