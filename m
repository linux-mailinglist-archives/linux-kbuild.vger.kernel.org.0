Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D66041E72B
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352024AbhJAFfJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:09 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25305 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241541AbhJAFfG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:06 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVV000646;
        Fri, 1 Oct 2021 14:33:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVV000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066380;
        bh=fQ8kuzKZhFdV66W9VpMSV4OyHXc8vSXpDVIuBoKabHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IZDaBStGJluPWW8kX5Jx91FTyB8BWmra6pY/KBedZ6yXMBivP9Sik9EuAYBJsqRmz
         IdlRhP/Zz+aGPN0PDqFolignpilGmU511TrkvVm6C2NhXq14ESSGSlJ9dE1phb3BjT
         Gc4wdrR8/ZQqvXfXTgqo657CYGO44ZjVpBkQOeUvkfpOX0ZSJB1ACKkGDQDcRbzmI0
         XO2Y85cEfwJiL4GsF7m30akxh144LP2NGIcwyWr7/OQgybJlJP4kEvsS90811KMIMK
         39WJYfg8j4X+d/t6ey844dzzYtQ01/rOV06CxrzOLHYMy+aJwBz/yV9V4QPnlySWFr
         EMJzgiSH+YdBw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] kconfig: refactor conf_write_symbol()
Date:   Fri,  1 Oct 2021 14:32:46 +0900
Message-Id: <20211001053253.1223316-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I do not think 'struct conf_printer' is so useful.

Add simple functions, print_symbol_for_*() to write out one symbol.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 136 ++++++++++++++++---------------------
 1 file changed, 57 insertions(+), 79 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index ed1bb8ba971b..ce11e7442d12 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -11,6 +11,7 @@
 #include <fcntl.h>
 #include <limits.h>
 #include <stdarg.h>
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -159,10 +160,6 @@ static int conf_touch_dep(const char *name)
 	return 0;
 }
 
-struct conf_printer {
-	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
-};
-
 static void conf_warning(const char *fmt, ...)
 	__attribute__ ((format (printf, 1, 2)));
 
@@ -629,91 +626,52 @@ static void conf_write_heading(FILE *fp, const struct comment_style *cs)
  * This printer is used when generating the resulting configuration after
  * kconfig invocation and `defconfig' files. Unset symbol might be omitted by
  * passing a non-NULL argument to the printer.
- *
  */
-static void
-kconfig_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
-{
-
-	switch (sym->type) {
-	case S_BOOLEAN:
-	case S_TRISTATE:
-		if (*value == 'n') {
-			bool skip_unset = (arg != NULL);
-
-			if (!skip_unset)
-				fprintf(fp, "# %s%s is not set\n",
-				    CONFIG_, sym->name);
-			return;
-		}
-		break;
-	default:
-		break;
-	}
-
-	fprintf(fp, "%s%s=%s\n", CONFIG_, sym->name, value);
-}
+enum output_n { OUTPUT_N, OUTPUT_N_AS_UNSET, OUTPUT_N_NONE };
 
-static struct conf_printer kconfig_printer_cb =
+static void __print_symbol(FILE *fp, struct symbol *sym, enum output_n output_n,
+			   bool escape_string)
 {
-	.print_symbol = kconfig_print_symbol,
-};
+	const char *val;
+	char *escaped = NULL;
 
-/*
- * Header printer
- *
- * This printer is used when generating the `include/generated/autoconf.h' file.
- */
-static void
-header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
-{
+	if (sym->type == S_UNKNOWN)
+		return;
 
-	switch (sym->type) {
-	case S_BOOLEAN:
-	case S_TRISTATE: {
-		const char *suffix = "";
+	val = sym_get_string_value(sym);
 
-		switch (*value) {
-		case 'n':
-			break;
-		case 'm':
-			suffix = "_MODULE";
-			/* fall through */
-		default:
-			fprintf(fp, "#define %s%s%s 1\n",
-			    CONFIG_, sym->name, suffix);
-		}
-		break;
+	if ((sym->type == S_BOOLEAN || sym->type == S_TRISTATE) &&
+	    output_n != OUTPUT_N && *val == 'n') {
+		if (output_n == OUTPUT_N_AS_UNSET)
+			fprintf(fp, "# %s%s is not set\n", CONFIG_, sym->name);
+		return;
 	}
-	case S_HEX: {
-		const char *prefix = "";
 
-		if (value[0] != '0' || (value[1] != 'x' && value[1] != 'X'))
-			prefix = "0x";
-		fprintf(fp, "#define %s%s %s%s\n",
-		    CONFIG_, sym->name, prefix, value);
-		break;
-	}
-	case S_STRING:
-	case S_INT:
-		fprintf(fp, "#define %s%s %s\n",
-		    CONFIG_, sym->name, value);
-		break;
-	default:
-		break;
+	if (sym->type == S_STRING && escape_string) {
+		escaped = sym_escape_string_value(val);
+		val = escaped;
 	}
 
+	fprintf(fp, "%s%s=%s\n", CONFIG_, sym->name, val);
+
+	free(escaped);
 }
 
-static struct conf_printer header_printer_cb =
+static void print_symbol_for_dotconfig(FILE *fp, struct symbol *sym)
 {
-	.print_symbol = header_print_symbol,
-};
+	__print_symbol(fp, sym, OUTPUT_N_AS_UNSET, true);
+}
+
+static void print_symbol_for_autoconf(FILE *fp, struct symbol *sym)
+{
+	__print_symbol(fp, sym, OUTPUT_N_NONE, true);
+}
 
-static void conf_write_symbol(FILE *fp, struct symbol *sym,
-			      struct conf_printer *printer, void *printer_arg)
+static void print_symbol_for_c(FILE *fp, struct symbol *sym)
 {
 	const char *val;
+	const char *sym_suffix = "";
+	const char *val_prefix = "";
 	char *escaped = NULL;
 
 	if (sym->type == S_UNKNOWN)
@@ -721,12 +679,32 @@ static void conf_write_symbol(FILE *fp, struct symbol *sym,
 
 	val = sym_get_string_value(sym);
 
-	if (sym->type == S_STRING) {
+	switch (sym->type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		switch (*val) {
+		case 'n':
+			return;
+		case 'm':
+			sym_suffix = "_MODULE";
+			/* fall through */
+		default:
+			val = "1";
+		}
+		break;
+	case S_HEX:
+		if (val[0] != '0' || (val[1] != 'x' && val[1] != 'X'))
+			val_prefix = "0x";
+		break;
+	case S_STRING:
 		escaped = sym_escape_string_value(val);
 		val = escaped;
+	default:
+		break;
 	}
 
-	printer->print_symbol(fp, sym, val, printer_arg);
+	fprintf(fp, "#define %s%s%s %s%s\n", CONFIG_, sym->name, sym_suffix,
+		val_prefix, val);
 
 	free(escaped);
 }
@@ -787,7 +765,7 @@ int conf_write_defconfig(const char *filename)
 						goto next_menu;
 				}
 			}
-			conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
+			print_symbol_for_dotconfig(out, sym);
 		}
 next_menu:
 		if (menu->list != NULL) {
@@ -874,7 +852,7 @@ int conf_write(const char *name)
 				need_newline = false;
 			}
 			sym->flags |= SYMBOL_WRITTEN;
-			conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
+			print_symbol_for_dotconfig(out, sym);
 		}
 
 next:
@@ -1060,8 +1038,8 @@ int conf_write_autoconf(int overwrite)
 			continue;
 
 		/* write symbols to auto.conf and autoconf.h */
-		conf_write_symbol(out, sym, &kconfig_printer_cb, (void *)1);
-		conf_write_symbol(out_h, sym, &header_printer_cb, NULL);
+		print_symbol_for_autoconf(out, sym);
+		print_symbol_for_c(out_h, sym);
 	}
 	fclose(out);
 	fclose(out_h);
-- 
2.30.2

