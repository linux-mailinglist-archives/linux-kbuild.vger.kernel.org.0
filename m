Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8139E4194B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Sep 2021 15:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhI0NBu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Sep 2021 09:01:50 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:28823 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234525AbhI0NBu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Sep 2021 09:01:50 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 18RCxmY1008626;
        Mon, 27 Sep 2021 21:59:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 18RCxmY1008626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632747588;
        bh=FVRbPiKa9Q9U12bZidya5lMmin6Kd3S7T6He0P3mOBE=;
        h=From:To:Cc:Subject:Date:From;
        b=IzOHqc+NE4a3ybS6O2tukVGGzNpiguMWddgxxQjxbI6u480DhTY5tgfIwmg0t+5gn
         g94rJqImAeN2xU9f5VMW24FIrOh+Wnju5oZc6W+glBXqPf8KXdLnmsYPlBP02fBkye
         wf9mfynJcHjhH/gBkqlXP5WCfRNHyQrlQLTmBYLRxOtmw4bRIXfkjJiCdmHd1rjKAF
         k/U6sYau7tylbQO3Qk/tzt3W7Q8Dlspl4pIoGSBFypw5TGYGD6vQ41wjpD+zE6Bn0L
         H4NvUx3XTT1c8SvQiKurjmc7Fu9BWC66nYD/5WXDOZOyq5Ia5AKYBESa/LGSP2jvYQ
         XEVFk3c3Qn/kA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: remove 'const' from the return type of sym_escape_string()
Date:   Mon, 27 Sep 2021 21:59:44 +0900
Message-Id: <20210927125944.819010-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

sym_escape_string() returns a malloc'ed memory, so it must be freed
when it is done.

Currently, sym_escape_string() returns the malloc'ed memory as
(const char *), then it is casted to (void *) when it is passed to
free(). This is odd.

The return type of sym_escape_string() should be (char *).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c      | 10 +++++-----
 scripts/kconfig/confdata.c  |  8 ++++----
 scripts/kconfig/lkc_proto.h |  2 +-
 scripts/kconfig/symbol.c    |  3 ++-
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index a6dad4a2e7a2..d8e1994bfed0 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -647,15 +647,15 @@ static void check_conf(struct menu *menu)
 		switch (input_mode) {
 		case listnewconfig:
 			if (sym->name) {
-				const char *str;
-
 				if (sym->type == S_STRING) {
+					char *str;
+
 					str = sym_escape_string(sym);
 					printf("%s%s=%s\n", CONFIG_, sym->name, str);
-					free((void *)str);
+					free(str);
 				} else {
-					str = sym_get_string_value(sym);
-					printf("%s%s=%s\n", CONFIG_, sym->name, str);
+					printf("%s%s=%s\n", CONFIG_, sym->name,
+					       sym_get_string_value(sym));
 				}
 			}
 			break;
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 4e053f2477f9..f7eac4beb128 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -728,7 +728,7 @@ static struct conf_printer header_printer_cb =
 static void conf_write_symbol(FILE *fp, struct symbol *sym,
 			      struct conf_printer *printer, void *printer_arg)
 {
-	const char *str;
+	char *str;
 
 	switch (sym->type) {
 	case S_UNKNOWN:
@@ -736,11 +736,11 @@ static void conf_write_symbol(FILE *fp, struct symbol *sym,
 	case S_STRING:
 		str = sym_escape_string(sym);
 		printer->print_symbol(fp, sym, str, printer_arg);
-		free((void *)str);
+		free(str);
 		break;
 	default:
-		str = sym_get_string_value(sym);
-		printer->print_symbol(fp, sym, str, printer_arg);
+		printer->print_symbol(fp, sym, sym_get_string_value(sym),
+				      printer_arg);
 	}
 }
 
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 035cc522808b..7ce4b666bba8 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -18,7 +18,7 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
 
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
-const char * sym_escape_string(struct symbol *sym);
+char *sym_escape_string(struct symbol *sym);
 struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
 void sym_calc_value(struct symbol *sym);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 4a31bb943f79..57189a1ad797 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -871,7 +871,8 @@ struct symbol *sym_find(const char *name)
 	return symbol;
 }
 
-const char *sym_escape_string(struct symbol *sym)
+/* the returned pointer must be freed on the caller side */
+char *sym_escape_string(struct symbol *sym)
 {
 	const char *in, *p;
 	size_t reslen;
-- 
2.30.2

