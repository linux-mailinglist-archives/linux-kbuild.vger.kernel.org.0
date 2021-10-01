Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F7541E733
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352106AbhJAFfT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:19 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25306 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351940AbhJAFfH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:07 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVU000646;
        Fri, 1 Oct 2021 14:32:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVU000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066379;
        bh=dDFYdiulkWQCG/5vLkVRQ/0UbsBnq2pxgy3dX8uzS1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X4nYFSsAWwlYPQcu4i6XZnWtvfC50yJj1fSP9JTSZ4IV5rohr1iAQKfbBRbLm69rJ
         qNHZxnHNcwf3vF6+XPJaRJ0d41ucJEEEfuYCaVeP6yKelmxPnx7l6w2EB+En3P8+Xr
         HDeEAr9ZXCXpvMd5st4EnSFE45WBqBnMnxmhKLMR+I5nyyzmuQ1KeK29Fb16cT/4GG
         ALf6v+3npomUhj3izg0fV6XxeY0BMRtghzTuUNIBVD5wJ2+pKkYymYFxjUiC74mssO
         KM2osbpPydV2dPEpPjR0gsoSyyhzRd0SjBh9GYmcXlX7qwiIygkjgn/1WJum43eFLP
         B6a/b7uCY9NqQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] kconfig: refactor conf_write_heading()
Date:   Fri,  1 Oct 2021 14:32:45 +0900
Message-Id: <20211001053253.1223316-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

All the call sites of conf_write_heading() pass NULL to the third
argument, and it is not used in the function.

Also, the print_comment hooks are doing much more complex than
needed.

Rewrite the code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 95 +++++++++++++-------------------------
 1 file changed, 33 insertions(+), 62 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 9b2271eb43d6..ed1bb8ba971b 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -161,7 +161,6 @@ static int conf_touch_dep(const char *name)
 
 struct conf_printer {
 	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
-	void (*print_comment)(FILE *, const char *, void *);
 };
 
 static void conf_warning(const char *fmt, ...)
@@ -594,6 +593,36 @@ int conf_read(const char *name)
 	return 0;
 }
 
+struct comment_style {
+	const char *comment_line;
+	const char *comment_block_begin;
+	const char *comment_block_end;
+};
+
+static const struct comment_style comment_style_pound = {
+	.comment_line = "#",
+	.comment_block_begin = "#",
+	.comment_block_end = "#",
+};
+
+static const struct comment_style comment_style_c = {
+	.comment_line = " *",
+	.comment_block_begin = "/*",
+	.comment_block_end = " */",
+};
+
+static void conf_write_heading(FILE *fp, const struct comment_style *cs)
+{
+	fprintf(fp, "%s\n", cs->comment_block_begin);
+
+	fprintf(fp, "%s Automatically generated file; DO NOT EDIT.\n",
+		cs->comment_line);
+
+	fprintf(fp, "%s %s\n", cs->comment_line, rootmenu.prompt->text);
+
+	fprintf(fp, "%s\n", cs->comment_block_end);
+}
+
 /*
  * Kconfig configuration printer
  *
@@ -625,30 +654,9 @@ kconfig_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 	fprintf(fp, "%s%s=%s\n", CONFIG_, sym->name, value);
 }
 
-static void
-kconfig_print_comment(FILE *fp, const char *value, void *arg)
-{
-	const char *p = value;
-	size_t l;
-
-	for (;;) {
-		l = strcspn(p, "\n");
-		fprintf(fp, "#");
-		if (l) {
-			fprintf(fp, " ");
-			xfwrite(p, l, 1, fp);
-			p += l;
-		}
-		fprintf(fp, "\n");
-		if (*p++ == '\0')
-			break;
-	}
-}
-
 static struct conf_printer kconfig_printer_cb =
 {
 	.print_symbol = kconfig_print_symbol,
-	.print_comment = kconfig_print_comment,
 };
 
 /*
@@ -697,32 +705,9 @@ header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 
 }
 
-static void
-header_print_comment(FILE *fp, const char *value, void *arg)
-{
-	const char *p = value;
-	size_t l;
-
-	fprintf(fp, "/*\n");
-	for (;;) {
-		l = strcspn(p, "\n");
-		fprintf(fp, " *");
-		if (l) {
-			fprintf(fp, " ");
-			xfwrite(p, l, 1, fp);
-			p += l;
-		}
-		fprintf(fp, "\n");
-		if (*p++ == '\0')
-			break;
-	}
-	fprintf(fp, " */\n");
-}
-
 static struct conf_printer header_printer_cb =
 {
 	.print_symbol = header_print_symbol,
-	.print_comment = header_print_comment,
 };
 
 static void conf_write_symbol(FILE *fp, struct symbol *sym,
@@ -746,20 +731,6 @@ static void conf_write_symbol(FILE *fp, struct symbol *sym,
 	free(escaped);
 }
 
-static void
-conf_write_heading(FILE *fp, struct conf_printer *printer, void *printer_arg)
-{
-	char buf[256];
-
-	snprintf(buf, sizeof(buf),
-	    "\n"
-	    "Automatically generated file; DO NOT EDIT.\n"
-	    "%s\n",
-	    rootmenu.prompt->text);
-
-	printer->print_comment(fp, buf, printer_arg);
-}
-
 /*
  * Write out a minimal config.
  * All values that has default values are skipped as this is redundant.
@@ -876,7 +847,7 @@ int conf_write(const char *name)
 	if (!out)
 		return 1;
 
-	conf_write_heading(out, &kconfig_printer_cb, NULL);
+	conf_write_heading(out, &comment_style_pound);
 
 	if (!conf_get_changed())
 		sym_clear_all_valid();
@@ -1080,8 +1051,8 @@ int conf_write_autoconf(int overwrite)
 		return 1;
 	}
 
-	conf_write_heading(out, &kconfig_printer_cb, NULL);
-	conf_write_heading(out_h, &header_printer_cb, NULL);
+	conf_write_heading(out, &comment_style_pound);
+	conf_write_heading(out_h, &comment_style_c);
 
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
-- 
2.30.2

