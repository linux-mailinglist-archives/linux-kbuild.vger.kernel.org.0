Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7C1107E8B
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 14:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKWN2R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 08:28:17 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39540 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfKWN2B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xANDRbki000733;
        Sat, 23 Nov 2019 22:27:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xANDRbki000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574515663;
        bh=A1pH5sFWnicqKcGRYR3bGaguX1Aj6aoTLBQi/Wtt0iA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OugDC2IkWj5dXOoQuC/L+F79/gvUzPwpxJyjnzD6xvV3KTS92nxGNS3atPMmCzanc
         ENMo/QgrCGu/Yc4KaGWo0qz8KIdWVXjVshT+RL2uQVSAT42s4Zux2T2huq3IXFdBSa
         4+Z5HlMTlLvaHEJRVqYCmVPgRzxyFrGJAr+mK4DXQzBI0pXYMV7LgXvlLHYk+IpJS3
         TuM4qfTtmrvKM807YZwZXMFvn9PfHdBNrSFlUkhs+6I9sIC5JP2mn3RcugGYKn/isx
         J/YZMMsYmyK0EOLRxwSyXZOc7xmok5PPlgy1sQaYIbKDaIIuxYbxdsySLjpXEf6KZ+
         TTfmHd0Sf1mCw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/16] scripts/kallsyms: add const qualifiers where possible
Date:   Sat, 23 Nov 2019 22:27:20 +0900
Message-Id: <20191123132727.30151-10-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add 'const' where a function does not write to the pointer dereferenes.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index c4f7f20ecfb7..d745fd2c7247 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -170,11 +170,11 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	return 0;
 }
 
-static int symbol_in_range(struct sym_entry *s, struct addr_range *ranges,
-			   int entries)
+static int symbol_in_range(const struct sym_entry *s,
+			   const struct addr_range *ranges, int entries)
 {
 	size_t i;
-	struct addr_range *ar;
+	const struct addr_range *ar;
 
 	for (i = 0; i < entries; ++i) {
 		ar = &ranges[i];
@@ -186,14 +186,14 @@ static int symbol_in_range(struct sym_entry *s, struct addr_range *ranges,
 	return 0;
 }
 
-static int symbol_valid(struct sym_entry *s)
+static int symbol_valid(const struct sym_entry *s)
 {
 	/* Symbols which vary between passes.  Passes 1 and 2 must have
 	 * identical symbol lists.  The kallsyms_* symbols below are only added
 	 * after pass 1, they would be included in pass 2 when --all-symbols is
 	 * specified so exclude them to get a stable symbol list.
 	 */
-	static char *special_symbols[] = {
+	static const char * const special_symbols[] = {
 		"kallsyms_addresses",
 		"kallsyms_offsets",
 		"kallsyms_relative_base",
@@ -208,12 +208,12 @@ static int symbol_valid(struct sym_entry *s)
 		"_SDA2_BASE_",		/* ppc */
 		NULL };
 
-	static char *special_prefixes[] = {
+	static const char * const special_prefixes[] = {
 		"__crc_",		/* modversions */
 		"__efistub_",		/* arm64 EFI stub namespace */
 		NULL };
 
-	static char *special_suffixes[] = {
+	static const char * const special_suffixes[] = {
 		"_veneer",		/* arm */
 		"_from_arm",		/* arm */
 		"_from_thumb",		/* arm */
@@ -281,7 +281,7 @@ static void read_map(FILE *in)
 	}
 }
 
-static void output_label(char *label)
+static void output_label(const char *label)
 {
 	printf(".globl %s\n", label);
 	printf("\tALGN\n");
@@ -290,7 +290,7 @@ static void output_label(char *label)
 
 /* uncompress a compressed symbol. When this function is called, the best table
  * might still be compressed itself, so the function needs to be recursive */
-static int expand_symbol(unsigned char *data, int len, char *result)
+static int expand_symbol(const unsigned char *data, int len, char *result)
 {
 	int c, rlen, total=0;
 
@@ -315,7 +315,7 @@ static int expand_symbol(unsigned char *data, int len, char *result)
 	return total;
 }
 
-static int symbol_absolute(struct sym_entry *s)
+static int symbol_absolute(const struct sym_entry *s)
 {
 	return s->percpu_absolute;
 }
@@ -453,7 +453,7 @@ static void write_src(void)
 /* table lookup compression functions */
 
 /* count all the possible tokens in a symbol */
-static void learn_symbol(unsigned char *symbol, int len)
+static void learn_symbol(const unsigned char *symbol, int len)
 {
 	int i;
 
@@ -462,7 +462,7 @@ static void learn_symbol(unsigned char *symbol, int len)
 }
 
 /* decrease the count for all the possible tokens in a symbol */
-static void forget_symbol(unsigned char *symbol, int len)
+static void forget_symbol(const unsigned char *symbol, int len)
 {
 	int i;
 
@@ -490,7 +490,7 @@ static void build_initial_tok_table(void)
 }
 
 static unsigned char *find_token(unsigned char *str, int len,
-				 unsigned char *token)
+				 const unsigned char *token)
 {
 	int i;
 
@@ -503,7 +503,7 @@ static unsigned char *find_token(unsigned char *str, int len,
 
 /* replace a given token in all the valid symbols. Use the sampled symbols
  * to update the counts */
-static void compress_symbols(unsigned char *str, int idx)
+static void compress_symbols(const unsigned char *str, int idx)
 {
 	unsigned int i, len, size;
 	unsigned char *p1, *p2;
-- 
2.17.1

