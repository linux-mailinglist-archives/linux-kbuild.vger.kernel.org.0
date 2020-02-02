Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68BF914FB8C
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Feb 2020 06:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgBBFJh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Feb 2020 00:09:37 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:58016 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgBBFJg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Feb 2020 00:09:36 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 01259SCa026546;
        Sun, 2 Feb 2020 14:09:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 01259SCa026546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580620169;
        bh=FpjGoOTnJWwYFpKXRxvhi50aKfy5TP5wYDQpTxXJcJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GDXhjbdEQtbIIJ/NdixYN+61yLFuljjfkVdbLVfyH6kmreSFEIQAnFLCRmZn3mwVZ
         vo6wrMRhgzN40SQDAjLNXat0aaQ0o/SwZq9xEFsCLViUJ+hRsZUFQaKEQCwZiKgxYd
         Ut5d/W+ECZWdQL21RPu8wLSGb6o6ZYk0Q7IE7SdTK4rPb8/cJHFx+KuASShdaqz5DH
         0qTRSj2znmRTa4GhzQrjkXUKupjJJM5+n5F4wu95h5hOoxjRaqJAFvboDx15HxYnQZ
         P08La33mOXK8O/+qktPLbxWWtA6TGkqy6H6FjnZoeGPag8NgSUrHpIs8/1IUBCyUlw
         7/3JGm+xFfMTg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] scripts/kallsyms: change table to store (strcut sym_entry *)
Date:   Sun,  2 Feb 2020 14:09:21 +0900
Message-Id: <20200202050922.12402-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200202050922.12402-1-masahiroy@kernel.org>
References: <20200202050922.12402-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The symbol table is extended every 10000 addition by using realloc(),
where data copy might occur to the new buffer.

To decrease the amount of possible data copy, let's change the table
to store the pointer.

The symbol type + symbol name part is appended at the end of
(struct sym_entry), and allocated together with the struct body.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 121 ++++++++++++++++++++++++---------------------
 1 file changed, 65 insertions(+), 56 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 5c34edd98b3e..a566d8201b56 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -33,8 +33,8 @@ struct sym_entry {
 	unsigned long long addr;
 	unsigned int len;
 	unsigned int start_pos;
-	unsigned char *sym;
 	unsigned int percpu_absolute;
+	unsigned char sym[0];
 };
 
 struct addr_range {
@@ -55,7 +55,7 @@ static struct addr_range percpu_range = {
 	"__per_cpu_start", "__per_cpu_end", -1ULL, 0
 };
 
-static struct sym_entry *table;
+static struct sym_entry **table;
 static unsigned int table_size, table_cnt;
 static int all_symbols;
 static int absolute_percpu;
@@ -174,49 +174,55 @@ static void check_symbol_range(const char *sym, unsigned long long addr,
 	}
 }
 
-static int read_symbol(FILE *in, struct sym_entry *s)
+static struct sym_entry *read_symbol(FILE *in)
 {
 	char name[500], type;
+	unsigned long long addr;
+	unsigned int len;
+	struct sym_entry *sym;
 	int rc;
 
-	rc = fscanf(in, "%llx %c %499s\n", &s->addr, &type, name);
+	rc = fscanf(in, "%llx %c %499s\n", &addr, &type, name);
 	if (rc != 3) {
 		if (rc != EOF && fgets(name, 500, in) == NULL)
 			fprintf(stderr, "Read error or end of file.\n");
-		return -1;
+		return NULL;
 	}
 	if (strlen(name) >= KSYM_NAME_LEN) {
 		fprintf(stderr, "Symbol %s too long for kallsyms (%zu >= %d).\n"
 				"Please increase KSYM_NAME_LEN both in kernel and kallsyms.c\n",
 			name, strlen(name), KSYM_NAME_LEN);
-		return -1;
+		return NULL;
 	}
 
 	if (is_ignored_symbol(name, type))
-		return -1;
+		return NULL;
 
 	/* Ignore most absolute/undefined (?) symbols. */
 	if (strcmp(name, "_text") == 0)
-		_text = s->addr;
+		_text = addr;
 
-	check_symbol_range(name, s->addr, text_ranges, ARRAY_SIZE(text_ranges));
-	check_symbol_range(name, s->addr, &percpu_range, 1);
+	check_symbol_range(name, addr, text_ranges, ARRAY_SIZE(text_ranges));
+	check_symbol_range(name, addr, &percpu_range, 1);
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-	s->len = strlen(name) + 1;
-	s->sym = malloc(s->len + 1);
-	if (!s->sym) {
+
+	len = strlen(name) + 1;
+
+	sym = malloc(sizeof(*sym) + len);
+	if (!sym) {
 		fprintf(stderr, "kallsyms failure: "
 			"unable to allocate required amount of memory\n");
 		exit(EXIT_FAILURE);
 	}
-	strcpy(sym_name(s), name);
-	s->sym[0] = type;
-
-	s->percpu_absolute = 0;
+	sym->addr = addr;
+	sym->len = len;
+	sym->sym[0] = type;
+	memcpy(sym_name(sym), name, len);
+	sym->percpu_absolute = 0;
 
-	return 0;
+	return sym;
 }
 
 static int symbol_in_range(const struct sym_entry *s,
@@ -268,12 +274,12 @@ static void shrink_table(void)
 
 	pos = 0;
 	for (i = 0; i < table_cnt; i++) {
-		if (symbol_valid(&table[i])) {
+		if (symbol_valid(table[i])) {
 			if (pos != i)
 				table[pos] = table[i];
 			pos++;
 		} else {
-			free(table[i].sym);
+			free(table[i]);
 		}
 	}
 	table_cnt = pos;
@@ -287,7 +293,15 @@ static void shrink_table(void)
 
 static void read_map(FILE *in)
 {
+	struct sym_entry *sym;
+
 	while (!feof(in)) {
+		sym = read_symbol(in);
+		if (!sym)
+			continue;
+
+		sym->start_pos = table_cnt;
+
 		if (table_cnt >= table_size) {
 			table_size += 10000;
 			table = realloc(table, sizeof(*table) * table_size);
@@ -296,10 +310,8 @@ static void read_map(FILE *in)
 				exit (1);
 			}
 		}
-		if (read_symbol(in, &table[table_cnt]) == 0) {
-			table[table_cnt].start_pos = table_cnt;
-			table_cnt++;
-		}
+
+		table[table_cnt++] = sym;
 	}
 }
 
@@ -387,27 +399,27 @@ static void write_src(void)
 			int overflow;
 
 			if (!absolute_percpu) {
-				offset = table[i].addr - relative_base;
+				offset = table[i]->addr - relative_base;
 				overflow = (offset < 0 || offset > UINT_MAX);
-			} else if (symbol_absolute(&table[i])) {
-				offset = table[i].addr;
+			} else if (symbol_absolute(table[i])) {
+				offset = table[i]->addr;
 				overflow = (offset < 0 || offset > INT_MAX);
 			} else {
-				offset = relative_base - table[i].addr - 1;
+				offset = relative_base - table[i]->addr - 1;
 				overflow = (offset < INT_MIN || offset >= 0);
 			}
 			if (overflow) {
 				fprintf(stderr, "kallsyms failure: "
 					"%s symbol value %#llx out of range in relative mode\n",
-					symbol_absolute(&table[i]) ? "absolute" : "relative",
-					table[i].addr);
+					symbol_absolute(table[i]) ? "absolute" : "relative",
+					table[i]->addr);
 				exit(EXIT_FAILURE);
 			}
 			printf("\t.long\t%#x\n", (int)offset);
-		} else if (!symbol_absolute(&table[i])) {
-			output_address(table[i].addr);
+		} else if (!symbol_absolute(table[i])) {
+			output_address(table[i]->addr);
 		} else {
-			printf("\tPTR\t%#llx\n", table[i].addr);
+			printf("\tPTR\t%#llx\n", table[i]->addr);
 		}
 	}
 	printf("\n");
@@ -437,12 +449,12 @@ static void write_src(void)
 		if ((i & 0xFF) == 0)
 			markers[i >> 8] = off;
 
-		printf("\t.byte 0x%02x", table[i].len);
-		for (k = 0; k < table[i].len; k++)
-			printf(", 0x%02x", table[i].sym[k]);
+		printf("\t.byte 0x%02x", table[i]->len);
+		for (k = 0; k < table[i]->len; k++)
+			printf(", 0x%02x", table[i]->sym[k]);
 		printf("\n");
 
-		off += table[i].len + 1;
+		off += table[i]->len + 1;
 	}
 	printf("\n");
 
@@ -496,7 +508,7 @@ static void build_initial_tok_table(void)
 	unsigned int i;
 
 	for (i = 0; i < table_cnt; i++)
-		learn_symbol(table[i].sym, table[i].len);
+		learn_symbol(table[i]->sym, table[i]->len);
 }
 
 static unsigned char *find_token(unsigned char *str, int len,
@@ -520,15 +532,15 @@ static void compress_symbols(const unsigned char *str, int idx)
 
 	for (i = 0; i < table_cnt; i++) {
 
-		len = table[i].len;
-		p1 = table[i].sym;
+		len = table[i]->len;
+		p1 = table[i]->sym;
 
 		/* find the token on the symbol */
 		p2 = find_token(p1, len, str);
 		if (!p2) continue;
 
 		/* decrease the counts for this symbol's tokens */
-		forget_symbol(table[i].sym, len);
+		forget_symbol(table[i]->sym, len);
 
 		size = len;
 
@@ -547,10 +559,10 @@ static void compress_symbols(const unsigned char *str, int idx)
 
 		} while (p2);
 
-		table[i].len = len;
+		table[i]->len = len;
 
 		/* increase the counts for this symbol's new tokens */
-		learn_symbol(table[i].sym, len);
+		learn_symbol(table[i]->sym, len);
 	}
 }
 
@@ -606,8 +618,8 @@ static void insert_real_symbols_in_table(void)
 	unsigned int i, j, c;
 
 	for (i = 0; i < table_cnt; i++) {
-		for (j = 0; j < table[i].len; j++) {
-			c = table[i].sym[j];
+		for (j = 0; j < table[i]->len; j++) {
+			c = table[i]->sym[j];
 			best_table[c][0]=c;
 			best_table_len[c]=1;
 		}
@@ -660,13 +672,10 @@ static int may_be_linker_script_provide_symbol(const struct sym_entry *se)
 
 static int compare_symbols(const void *a, const void *b)
 {
-	const struct sym_entry *sa;
-	const struct sym_entry *sb;
+	const struct sym_entry *sa = *(const struct sym_entry **)a;
+	const struct sym_entry *sb = *(const struct sym_entry **)b;
 	int wa, wb;
 
-	sa = a;
-	sb = b;
-
 	/* sort by address first */
 	if (sa->addr > sb->addr)
 		return 1;
@@ -697,7 +706,7 @@ static int compare_symbols(const void *a, const void *b)
 
 static void sort_symbols(void)
 {
-	qsort(table, table_cnt, sizeof(struct sym_entry), compare_symbols);
+	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
 static void make_percpus_absolute(void)
@@ -705,14 +714,14 @@ static void make_percpus_absolute(void)
 	unsigned int i;
 
 	for (i = 0; i < table_cnt; i++)
-		if (symbol_in_range(&table[i], &percpu_range, 1)) {
+		if (symbol_in_range(table[i], &percpu_range, 1)) {
 			/*
 			 * Keep the 'A' override for percpu symbols to
 			 * ensure consistent behavior compared to older
 			 * versions of this tool.
 			 */
-			table[i].sym[0] = 'A';
-			table[i].percpu_absolute = 1;
+			table[i]->sym[0] = 'A';
+			table[i]->percpu_absolute = 1;
 		}
 }
 
@@ -722,12 +731,12 @@ static void record_relative_base(void)
 	unsigned int i;
 
 	for (i = 0; i < table_cnt; i++)
-		if (!symbol_absolute(&table[i])) {
+		if (!symbol_absolute(table[i])) {
 			/*
 			 * The table is sorted by address.
 			 * Take the first non-absolute symbol value.
 			 */
-			relative_base = table[i].addr;
+			relative_base = table[i]->addr;
 			return;
 		}
 }
-- 
2.17.1

