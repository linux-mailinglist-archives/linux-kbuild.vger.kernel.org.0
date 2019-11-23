Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25987107F38
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfKWQFR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:17 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49447 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5S019106;
        Sun, 24 Nov 2019 01:04:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5S019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525093;
        bh=L3zUH6rFXSpzUIwhA4bPRr4LzEsUQo/+LU2wclGFUeM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=koLs9OL+iw4m7NwJ6DHSqxM62gT4jNuvHmeGX23Vg7wCLnclSKzxlEAWgjIYuujuy
         BWhtpWvMNEKpaEKJrUITq4FMLLGjwMmNW2In+pUb2qqlDrn3kssQp5qRwpkXxgIUZZ
         1lZCFo2T51boOVR5lDFjTczRLrMTpYJbsSyLysKKN51m8AgndwEPgJJzSvR7hwfUuH
         6MZuCAxBRQGT2IyyCrtVfjlUKvxTJcFouhhzyrpQ4kUWx8q+pf7rE5WaCYrsX+ZWA0
         r+A6/G0fmPxkmD5HJGC+ndc+FLTubwnuuUONKND/gyjoOhOkOKmRuzBWMH9oHUkyyE
         JH+umBKBAvA+A==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] scripts/kallsyms: skip ignored symbols very early
Date:   Sun, 24 Nov 2019 01:04:39 +0900
Message-Id: <20191123160444.11251-12-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Unless the address range matters, symbols can be ignored earlier,
which avoids unneeded memory allocation.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 113 +++++++++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 51 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 056bde436540..843615c1d384 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -18,6 +18,7 @@
  *
  */
 
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -79,6 +80,64 @@ static char *sym_name(const struct sym_entry *s)
 	return (char *)s->sym + 1;
 }
 
+static bool is_ignored_symbol(const char *name, char type)
+{
+	static const char * const ignored_symbols[] = {
+		/*
+		 * Symbols which vary between passes. Passes 1 and 2 must have
+		 * identical symbol lists. The kallsyms_* symbols below are
+		 * only added after pass 1, they would be included in pass 2
+		 * when --all-symbols is specified so exclude them to get a
+		 * stable symbol list.
+		 */
+		"kallsyms_addresses",
+		"kallsyms_offsets",
+		"kallsyms_relative_base",
+		"kallsyms_num_syms",
+		"kallsyms_names",
+		"kallsyms_markers",
+		"kallsyms_token_table",
+		"kallsyms_token_index",
+		/* Exclude linker generated symbols which vary between passes */
+		"_SDA_BASE_",		/* ppc */
+		"_SDA2_BASE_",		/* ppc */
+		NULL
+	};
+
+	static const char * const ignored_prefixes[] = {
+		"__crc_",		/* modversions */
+		"__efistub_",		/* arm64 EFI stub namespace */
+		NULL
+	};
+
+	static const char * const ignored_suffixes[] = {
+		"_from_arm",		/* arm */
+		"_from_thumb",		/* arm */
+		"_veneer",		/* arm */
+		NULL
+	};
+
+	const char * const *p;
+
+	/* Exclude symbols which vary between passes. */
+	for (p = ignored_symbols; *p; p++)
+		if (!strcmp(name, *p))
+			return true;
+
+	for (p = ignored_prefixes; *p; p++)
+		if (!strncmp(name, *p, strlen(*p)))
+			return true;
+
+	for (p = ignored_suffixes; *p; p++) {
+		int l = strlen(name) - strlen(*p);
+
+		if (l >= 0 && !strcmp(name + l, *p))
+			return true;
+	}
+
+	return false;
+}
+
 static int check_symbol_range(const char *sym, unsigned long long addr,
 			      struct addr_range *ranges, int entries)
 {
@@ -118,6 +177,9 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 		return -1;
 	}
 
+	if (is_ignored_symbol(sym, stype))
+		return -1;
+
 	/* Ignore most absolute/undefined (?) symbols. */
 	if (strcmp(sym, "_text") == 0)
 		_text = s->addr;
@@ -188,38 +250,6 @@ static int symbol_in_range(const struct sym_entry *s,
 
 static int symbol_valid(const struct sym_entry *s)
 {
-	/* Symbols which vary between passes.  Passes 1 and 2 must have
-	 * identical symbol lists.  The kallsyms_* symbols below are only added
-	 * after pass 1, they would be included in pass 2 when --all-symbols is
-	 * specified so exclude them to get a stable symbol list.
-	 */
-	static const char * const special_symbols[] = {
-		"kallsyms_addresses",
-		"kallsyms_offsets",
-		"kallsyms_relative_base",
-		"kallsyms_num_syms",
-		"kallsyms_names",
-		"kallsyms_markers",
-		"kallsyms_token_table",
-		"kallsyms_token_index",
-
-	/* Exclude linker generated symbols which vary between passes */
-		"_SDA_BASE_",		/* ppc */
-		"_SDA2_BASE_",		/* ppc */
-		NULL };
-
-	static const char * const special_prefixes[] = {
-		"__crc_",		/* modversions */
-		"__efistub_",		/* arm64 EFI stub namespace */
-		NULL };
-
-	static const char * const special_suffixes[] = {
-		"_veneer",		/* arm */
-		"_from_arm",		/* arm */
-		"_from_thumb",		/* arm */
-		NULL };
-
-	int i;
 	const char *name = sym_name(s);
 
 	/* if --all-symbols is not specified, then symbols outside the text
@@ -241,25 +271,6 @@ static int symbol_valid(const struct sym_entry *s)
 			return 0;
 	}
 
-	/* Exclude symbols which vary between passes. */
-	for (i = 0; special_symbols[i]; i++)
-		if (strcmp(name, special_symbols[i]) == 0)
-			return 0;
-
-	for (i = 0; special_prefixes[i]; i++) {
-		int l = strlen(special_prefixes[i]);
-
-		if (strncmp(name, special_prefixes[i], l) == 0)
-			return 0;
-	}
-
-	for (i = 0; special_suffixes[i]; i++) {
-		int l = strlen(name) - strlen(special_suffixes[i]);
-
-		if (l >= 0 && strcmp(name + l, special_suffixes[i]) == 0)
-			return 0;
-	}
-
 	return 1;
 }
 
-- 
2.17.1

