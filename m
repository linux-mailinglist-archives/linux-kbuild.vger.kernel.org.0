Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6022541E731
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239025AbhJAFfS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:18 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25307 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351941AbhJAFfH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:07 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVT000646;
        Fri, 1 Oct 2021 14:32:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVT000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066379;
        bh=Hk86knQX+FtOEwvSmj6Z1Ht+3JjaU0RyCPMk1FsbiQ4=;
        h=From:To:Cc:Subject:Date:From;
        b=lun/CgpTky5j/eZSDZ+5f342kVpZDv0t2wywGZSkmkmNDWrqguhh+V/AQvowk4Y8e
         Ly94RaVa1zs/okD/jIO2Tz2Ziw1zebGPgBSyZSVbhssDK114DxUS6NBPXMS7gPYt5m
         nEYK+QVdxUGiVkgdmUbBM/d9ujBx6OA/P9YEpLnKabhhdJ/4kKl2BV6CWqEqgbiN6a
         pOpwMftH5dyRBnrvaNb+Eid59c0E4YpEzmhIen4rDtFDxXXQ+nfMTGRL8kXcoiSG9t
         /4ZGkrvGXcPE9DH7S6IZK1OQxz/+4zipBlSpeLpCIdoT5swz/5KVPYwsOwwyLoxQOq
         fT5pnUzGDDkTg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] kconfig: remove 'const' from the return type of sym_escape_string_value()
Date:   Fri,  1 Oct 2021 14:32:44 +0900
Message-Id: <20211001053253.1223316-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

sym_escape_string_value() returns a malloc'ed memory, but as
(const char *). So, it must be casted to (void *) when it is free'd.
This is odd.

The return type of sym_escape_string_value() should be (char *).

I exploited that free(NULL) has no effect.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c      | 15 +++++++--------
 scripts/kconfig/confdata.c  | 27 ++++++++++++++-------------
 scripts/kconfig/lkc_proto.h |  2 +-
 scripts/kconfig/symbol.c    |  3 ++-
 4 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5d84b44a2a2a..310fdd408793 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -647,17 +647,16 @@ static void check_conf(struct menu *menu)
 		switch (input_mode) {
 		case listnewconfig:
 			if (sym->name) {
-				const char *str;
+				const char *val = sym_get_string_value(sym);
+				char *escaped = NULL;
 
 				if (sym->type == S_STRING) {
-					str = sym_get_string_value(sym);
-					str = sym_escape_string_value(str);
-					printf("%s%s=%s\n", CONFIG_, sym->name, str);
-					free((void *)str);
-				} else {
-					str = sym_get_string_value(sym);
-					printf("%s%s=%s\n", CONFIG_, sym->name, str);
+					escaped = sym_escape_string_value(val);
+					val = escaped;
 				}
+
+				printf("%s%s=%s\n", CONFIG_, sym->name, val);
+				free(escaped);
 			}
 			break;
 		case helpnewconfig:
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index cf72680cd769..9b2271eb43d6 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -728,21 +728,22 @@ static struct conf_printer header_printer_cb =
 static void conf_write_symbol(FILE *fp, struct symbol *sym,
 			      struct conf_printer *printer, void *printer_arg)
 {
-	const char *str;
+	const char *val;
+	char *escaped = NULL;
 
-	switch (sym->type) {
-	case S_UNKNOWN:
-		break;
-	case S_STRING:
-		str = sym_get_string_value(sym);
-		str = sym_escape_string_value(str);
-		printer->print_symbol(fp, sym, str, printer_arg);
-		free((void *)str);
-		break;
-	default:
-		str = sym_get_string_value(sym);
-		printer->print_symbol(fp, sym, str, printer_arg);
+	if (sym->type == S_UNKNOWN)
+		return;
+
+	val = sym_get_string_value(sym);
+
+	if (sym->type == S_STRING) {
+		escaped = sym_escape_string_value(val);
+		val = escaped;
 	}
+
+	printer->print_symbol(fp, sym, val, printer_arg);
+
+	free(escaped);
 }
 
 static void
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index a11626bdc421..e6955df49973 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -18,7 +18,7 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
 
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
-const char * sym_escape_string_value(const char *in);
+char *sym_escape_string_value(const char *in);
 struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
 void sym_calc_value(struct symbol *sym);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 5844d636d38f..6bf8665a6a0f 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -871,7 +871,8 @@ struct symbol *sym_find(const char *name)
 	return symbol;
 }
 
-const char *sym_escape_string_value(const char *in)
+/* The returned pointer must be freed on the caller side */
+char *sym_escape_string_value(const char *in)
 {
 	const char *p;
 	size_t reslen;
-- 
2.30.2

