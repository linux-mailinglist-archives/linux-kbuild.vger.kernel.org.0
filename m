Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8DE9107F35
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfKWQFM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:12 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49458 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5O019106;
        Sun, 24 Nov 2019 01:04:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5O019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525091;
        bh=5gU5mTeXomynZztjP51R9lorDaBP4CN8eEVudih4LaA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dhx5Vk9AJvt0Op2JB+kGtg0JPl6yuizFEzP+J8nR3M6CG2ZT56IpztMeEFwO6OOLf
         oJ6F/BApszEqr4AoIcxPwc29Hcnoiyqm/dTqaZT2pdozhZzjLUaA9M7S+3V5h/teJ1
         D/zZtLXvacAovXuzOf3QAD8EgXNUw7GVQOzZOUA04K/BdFZF04AF2md3VjV2sZMcNG
         M9nKpTZhatL0W7ztKYxo6dFd1/Sho4ayXi6hO4RQlVn9BOL8XWyaX52AnRuo+8Cz8r
         PbrifJL0hvV8kP5gHiwG3n/VDQT4eIs0th3hY4bxYiFo/khTfYWmcrk0qQZhnsfN6L
         ZQojm/CsRlllw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/16] scripts/kallsyms: add sym_name() to mitigate cast ugliness
Date:   Sun, 24 Nov 2019 01:04:35 +0900
Message-Id: <20191123160444.11251-8-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

sym_entry::sym is (unsigned char *) instead of (char *) because
kallsyms exploits the MSB for compression, and the characters are
used as the index of token_profit array.

However, it requires casting (unsigned char *) to (char *) in some
places since standard library functions such as strcmp(), strlen()
expect (char *).

Introduce a new helper, sym_name(), which advances the given pointer
by 1 and casts it to (char *).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index a57636c6f84f..baa2fa5692b0 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -74,6 +74,11 @@ static void usage(void)
 	exit(1);
 }
 
+static char *sym_name(const struct sym_entry *s)
+{
+	return (char *)s->sym + 1;
+}
+
 static int check_symbol_range(const char *sym, unsigned long long addr,
 			      struct addr_range *ranges, int entries)
 {
@@ -154,7 +159,7 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 			"unable to allocate required amount of memory\n");
 		exit(EXIT_FAILURE);
 	}
-	strcpy((char *)s->sym + 1, sym);
+	strcpy(sym_name(s), sym);
 	s->sym[0] = stype;
 
 	s->percpu_absolute = 0;
@@ -215,7 +220,7 @@ static int symbol_valid(struct sym_entry *s)
 		NULL };
 
 	int i;
-	char *sym_name = (char *)s->sym + 1;
+	const char *name = sym_name(s);
 
 	/* if --all-symbols is not specified, then symbols outside the text
 	 * and inittext sections are discarded */
@@ -230,30 +235,28 @@ static int symbol_valid(struct sym_entry *s)
 		 * rules.
 		 */
 		if ((s->addr == text_range_text->end &&
-				strcmp(sym_name,
-				       text_range_text->end_sym)) ||
+		     strcmp(name, text_range_text->end_sym)) ||
 		    (s->addr == text_range_inittext->end &&
-				strcmp(sym_name,
-				       text_range_inittext->end_sym)))
+		     strcmp(name, text_range_inittext->end_sym)))
 			return 0;
 	}
 
 	/* Exclude symbols which vary between passes. */
 	for (i = 0; special_symbols[i]; i++)
-		if (strcmp(sym_name, special_symbols[i]) == 0)
+		if (strcmp(name, special_symbols[i]) == 0)
 			return 0;
 
 	for (i = 0; special_prefixes[i]; i++) {
 		int l = strlen(special_prefixes[i]);
 
-		if (strncmp(sym_name, special_prefixes[i], l) == 0)
+		if (strncmp(name, special_prefixes[i], l) == 0)
 			return 0;
 	}
 
 	for (i = 0; special_suffixes[i]; i++) {
-		int l = strlen(sym_name) - strlen(special_suffixes[i]);
+		int l = strlen(name) - strlen(special_suffixes[i]);
 
-		if (l >= 0 && strcmp(sym_name + l, special_suffixes[i]) == 0)
+		if (l >= 0 && strcmp(name + l, special_suffixes[i]) == 0)
 			return 0;
 	}
 
@@ -626,7 +629,7 @@ static void optimize_token_table(void)
 /* guess for "linker script provide" symbol */
 static int may_be_linker_script_provide_symbol(const struct sym_entry *se)
 {
-	const char *symbol = (char *)se->sym + 1;
+	const char *symbol = sym_name(se);
 	int len = se->len - 1;
 
 	if (len < 8)
@@ -696,8 +699,8 @@ static int compare_symbols(const void *a, const void *b)
 		return wa - wb;
 
 	/* sort by the number of prefix underscores */
-	wa = prefix_underscores_count((const char *)sa->sym + 1);
-	wb = prefix_underscores_count((const char *)sb->sym + 1);
+	wa = prefix_underscores_count(sym_name(sa));
+	wb = prefix_underscores_count(sym_name(sb));
 	if (wa != wb)
 		return wa - wb;
 
-- 
2.17.1

