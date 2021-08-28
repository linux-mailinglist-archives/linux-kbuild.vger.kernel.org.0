Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84D33FA4D7
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Aug 2021 11:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhH1Jw0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Aug 2021 05:52:26 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60789 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbhH1JwZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Aug 2021 05:52:25 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17S9p5iF032486;
        Sat, 28 Aug 2021 18:51:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17S9p5iF032486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630144266;
        bh=mRdXYx53Ji2/IwMqep6Hxid/WThE4ltfaxnWAzlMAhQ=;
        h=From:To:Cc:Subject:Date:From;
        b=lhlCIiIfoXwRomlDHsW3jf0v7yyIhSc6Zx3jeFUIaaECtQBkNftF9etBKH0Klev6X
         uKD95i8Ei3/MUrC65GKCYhoOeJF+swARxtmtGWmVMnnR9JIR8b3tHROOo3i+nVsK7B
         WCV1pamoDGTY79j5EGiVbn8tz+P7i8OnIC6uPmVRTz746RCrWfDQ7U75GklIHcdsU5
         Gg0RFPuqUXoojmj67xYWCsGH6vc8vQLtKX5tZ/FCAr9EH5kR/AOFRDF+nR/gYbXiN2
         h6GtJMWT8i4aLaAiDjz6ShB7Ha/eQ9K0zK9rAlgEXU0qwQYFg7N5aIW4EqascLITNP
         ADKaacFYNfH2g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] modpost: get the *.mod file path more simply
Date:   Sat, 28 Aug 2021 18:50:59 +0900
Message-Id: <20210828095103.2617393-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

get_src_version() strips 'o' or 'lto.o' from the end of the object file
path (so, postfixlen is 1 or 5), then adds 'mod'.

If you look at the code closely, mod->name already holds the base path
with the extension stripped.

Most of the code changes made by commit 7ac204b545f2 ("modpost: lto:
strip .lto from module names") was actually unneeded.

sumversion.c does not need strends(), so it can get back local in
modpost.c again.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c    | 11 ++++++++++-
 scripts/mod/modpost.h    |  9 ---------
 scripts/mod/sumversion.c |  7 +------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 270a7df898e2..a26139aa57fd 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -17,6 +17,7 @@
 #include <ctype.h>
 #include <string.h>
 #include <limits.h>
+#include <stdbool.h>
 #include <errno.h>
 #include "modpost.h"
 #include "../../include/linux/license.h"
@@ -89,6 +90,14 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...)
 		error_occurred = true;
 }
 
+static inline bool strends(const char *str, const char *postfix)
+{
+	if (strlen(str) < strlen(postfix))
+		return false;
+
+	return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
+}
+
 void *do_nofail(void *ptr, const char *expr)
 {
 	if (!ptr)
@@ -2060,7 +2069,7 @@ static void read_symbols(const char *modname)
 	if (!mod->is_vmlinux) {
 		version = get_modinfo(&info, "version");
 		if (version || all_versions)
-			get_src_version(modname, mod->srcversion,
+			get_src_version(mod->name, mod->srcversion,
 					sizeof(mod->srcversion) - 1);
 	}
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index c1a895c0d682..0c47ff95c0e2 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -2,7 +2,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdarg.h>
-#include <stdbool.h>
 #include <string.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -178,14 +177,6 @@ static inline unsigned int get_secindex(const struct elf_info *info,
 	return info->symtab_shndx_start[sym - info->symtab_start];
 }
 
-static inline bool strends(const char *str, const char *postfix)
-{
-	if (strlen(str) < strlen(postfix))
-		return false;
-
-	return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
-}
-
 /* file2alias.c */
 extern unsigned int cross_build;
 void handle_moddevtable(struct module *mod, struct elf_info *info,
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 760e6baa7eda..905c0ec291e1 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -391,14 +391,9 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 	struct md4_ctx md;
 	char *fname;
 	char filelist[PATH_MAX + 1];
-	int postfix_len = 1;
-
-	if (strends(modname, ".lto.o"))
-		postfix_len = 5;
 
 	/* objects for a module are listed in the first line of *.mod file. */
-	snprintf(filelist, sizeof(filelist), "%.*smod",
-		 (int)strlen(modname) - postfix_len, modname);
+	snprintf(filelist, sizeof(filelist), "%s.mod", modname);
 
 	buf = read_text_file(filelist);
 
-- 
2.30.2

