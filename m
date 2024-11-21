Return-Path: <linux-kbuild+bounces-4778-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 407199D5435
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5C92B246A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BF31DF255;
	Thu, 21 Nov 2024 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3/EQsi60"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F921DED78
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221779; cv=none; b=bCrv4Cp0kS2hEc+d6+3vQgcnK2qn+rNejAOmoiIcJ88xRo9XOexEHYMjZxZrFMMZWssQ0F683JNh8yVqXyUt8u7VtgbCYR1nqDLxl+QKOQE13TrfqbQ8/vthT8bDSqHLo3vMCzEwcZ3nQAM0KE8CFBF7G+x6TiiYAQ3E7dPxgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221779; c=relaxed/simple;
	bh=d61WNq/I69SxlkMnqNFV2qlrhf/2SXHOZM1SrnlAnY0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mnfQpZvropK2/Nsjx+xkqNTMZgx62AgCats06XfM7Grm8A3HUaGFgSYWPff09X9Tt5Yxarbup6RUh02JlqJ4K3VZH52vYrhfkbDFv/q9GkaNN9An4AXZFSOwJLr9gt2OKhTbQToIJOmtfkq+bxG60gLnQt4d9IO6itS+ElEmrJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3/EQsi60; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6eea70c89cbso16214787b3.1
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221776; x=1732826576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CA7kZhd6lCBwuA638WTbbaGGt/3ZtUV9FFVcc8mA6YY=;
        b=3/EQsi60cshZLN2x3NVzBY0E9afWaeY39IuiJ4jOdQYB2Z2pR5OrNTB8DrZd/YmogA
         6saauw1SocblquyNcLSjAbeTORHD43xahn1dgq8pk8DEePUYakl1Sl3M/AufHcsYcAwS
         fSOA+TbgnjxvY19w7Ca89kiuSUS4lkmoSInEl1REcCwkFAGK3aNtr2uz0WmrTjOQ06+J
         qaYfQdP5OaivK8OtpPu1PDJsy3xpqhJaTkILCbchfLWnxY1dA9Q5/k9CfViqF3ypEKTm
         2GdT2rcwLhgMM9PtFVxvdcLVGheeCgZOb3rFrUwSOXoXhNOzIwyz+k8Fh/yT4QmHaGcl
         N9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221776; x=1732826576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CA7kZhd6lCBwuA638WTbbaGGt/3ZtUV9FFVcc8mA6YY=;
        b=phMcJkJKm2nmPE675yMU/h1PT9Vv96+FKVJ1GZXPF8p1tM8aw1JNEupDJplvae/1GQ
         0KYqVn78VVC2uQaTIMhwWW8D8t73/TZMtHeqolaEe7XAGiBJQlEoT91qLBHPQGh3LQ91
         aGhKiSYra53YaPdFCikxFK2aLmL6hs8bkRKm8pDVawN3dfxK4hogFsjd5OrVXXZ8nIjr
         LAyvrbPLpCr6A3FS9gIvUwQHGGS8/IM2/INwwJvo9CSpQAPo+CW3NNOj2cmH4pWZ8mLn
         cZJE1TR4XLw4Xu7zTnPH3bQh9UwjiJ04Dl2jaD8LiB83S0QeIUpSv/yDY3mLSCFP8wDe
         sCQg==
X-Forwarded-Encrypted: i=1; AJvYcCXw4dOZzv3wOMH0HLMLSjZ1JQeTTqVIEL0mI1mVQtTsMtNam4iljku7CGy1lzjrOIncOqyGuexnKErn1YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmi+HXTYCWnpFHkKow1yGX5OTt5l1RS6SNze1ZCWGv859/Y3c/
	z80YQBi5nPmNZxEwXHkweke6AANM3GZwC/y75L1THRGLCoKHiwXeM0cO2jMREAI/OhMvxrW02Vl
	oV2a9idJ94bqncEkiFM0HXigiMw==
X-Google-Smtp-Source: AGHT+IGIStUYQFtNfnZeiVXqDFo80Ip7WtFIXyK4N4MXRIGGeS6hxLMBaHs6zF3f1OjEbxIyOQ+1lv7QOLz3Oqf1xgk=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:2b90:b0:6ee:61ea:a40e with
 SMTP id 00721157ae682-6eecd2d1508mr356447b3.2.1732221776432; Thu, 21 Nov 2024
 12:42:56 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:33 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=12899; i=samitolvanen@google.com;
 h=from:subject; bh=d61WNq/I69SxlkMnqNFV2qlrhf/2SXHOZM1SrnlAnY0=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s42DA3iFb1wX75nIVs3l9+5wFZPyvY+vk7NYC7SYV
 1h5JXzqKGVhEONgkBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABNh+83wTyfy/rvbHy02Lu7Y
 Kb7mdpD7uQmSL72XHalVeR+RGrl43xFGhp09nT8bOj7f3dgcvtoy5CNL/asvk9WZFlrxi8rfZWU S5wAA
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-32-samitolvanen@google.com>
Subject: [PATCH v6 12/18] gendwarfksyms: Add symbol versioning
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Calculate symbol versions from the fully expanded type strings in
type_map, and output the versions in a genksyms-compatible format.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/Makefile        |   2 +-
 scripts/gendwarfksyms/dwarf.c         |  25 +++++-
 scripts/gendwarfksyms/gendwarfksyms.c |  10 ++-
 scripts/gendwarfksyms/gendwarfksyms.h |  13 ++-
 scripts/gendwarfksyms/symbols.c       |  53 +++++++++++
 scripts/gendwarfksyms/types.c         | 122 +++++++++++++++++++++++++-
 6 files changed, 216 insertions(+), 9 deletions(-)

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index 6540282dc746..e889b958957b 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -8,4 +8,4 @@ gendwarfksyms-objs += dwarf.o
 gendwarfksyms-objs += symbols.o
 gendwarfksyms-objs += types.o
 
-HOSTLDLIBS_gendwarfksyms := -ldw -lelf
+HOSTLDLIBS_gendwarfksyms := -ldw -lelf -lz
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 18e42dbbfa3c..a35c351391ad 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -739,12 +739,33 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 /*
  * Exported symbol processing
  */
+static struct die *get_symbol_cache(struct state *state, Dwarf_Die *die)
+{
+	struct die *cache;
+
+	cache = die_map_get(die, DIE_SYMBOL);
+
+	if (cache->state != DIE_INCOMPLETE)
+		return NULL; /* We already processed a symbol for this DIE */
+
+	cache->tag = dwarf_tag(die);
+	return cache;
+}
+
 static void process_symbol(struct state *state, Dwarf_Die *die,
 			   die_callback_t process_func)
 {
+	struct die *cache;
+
+	symbol_set_die(state->sym, die);
+
+	cache = get_symbol_cache(state, die);
+	if (!cache)
+		return;
+
 	debug("%s", state->sym->name);
-	check(process_func(state, NULL, die));
-	state->sym->state = SYMBOL_MAPPED;
+	check(process_func(state, cache, die));
+	cache->state = DIE_SYMBOL;
 	if (dump_dies)
 		fputs("\n", stderr);
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 76a38b733ad2..fd2429ea198f 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -23,6 +23,8 @@ int dump_dies;
 int dump_die_map;
 /* Print out type strings (i.e. type_map) */
 int dump_types;
+/* Print out expanded type strings used for symbol versions */
+int dump_versions;
 /* Write a symtypes file */
 int symtypes;
 static const char *symtypes_file;
@@ -35,6 +37,7 @@ static void usage(void)
 	      "      --dump-dies      Dump DWARF DIE contents\n"
 	      "      --dump-die-map   Print debugging information about die_map changes\n"
 	      "      --dump-types     Dump type strings\n"
+	      "      --dump-versions  Dump expanded type strings used for symbol versions\n"
 	      "  -T, --symtypes file  Write a symtypes file\n"
 	      "  -h, --help           Print this message\n"
 	      "\n",
@@ -69,9 +72,10 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
 	} while (cu);
 
 	/*
-	 * Use die_map to expand type strings and write them to `symfile`.
+	 * Use die_map to expand type strings, write them to `symfile`, and
+	 * calculate symbol versions.
 	 */
-	generate_symtypes(symfile);
+	generate_symtypes_and_versions(symfile);
 	die_map_free();
 
 	return DWARF_CB_OK;
@@ -92,6 +96,7 @@ int main(int argc, char **argv)
 				 { "dump-dies", 0, &dump_dies, 1 },
 				 { "dump-die-map", 0, &dump_die_map, 1 },
 				 { "dump-types", 0, &dump_types, 1 },
+				 { "dump-versions", 0, &dump_versions, 1 },
 				 { "symtypes", 1, NULL, 'T' },
 				 { "help", 0, NULL, 'h' },
 				 { 0, 0, NULL, 0 } };
@@ -164,6 +169,7 @@ int main(int argc, char **argv)
 	if (symfile)
 		check(fclose(symfile));
 
+	symbol_print_versions();
 	symbol_free();
 
 	return 0;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 7b35043d28ff..4fd166908cbc 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -28,6 +28,7 @@ extern int debug;
 extern int dump_dies;
 extern int dump_die_map;
 extern int dump_types;
+extern int dump_versions;
 extern int symtypes;
 
 /*
@@ -100,6 +101,7 @@ static inline unsigned int addr_hash(uintptr_t addr)
 enum symbol_state {
 	SYMBOL_UNPROCESSED,
 	SYMBOL_MAPPED,
+	SYMBOL_PROCESSED
 };
 
 struct symbol_addr {
@@ -114,6 +116,7 @@ struct symbol {
 	struct hlist_node name_hash;
 	enum symbol_state state;
 	uintptr_t die_addr;
+	unsigned long crc;
 };
 
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);
@@ -121,6 +124,10 @@ typedef void (*symbol_callback_t)(struct symbol *, void *arg);
 void symbol_read_exports(FILE *file);
 void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
+void symbol_set_die(struct symbol *sym, Dwarf_Die *die);
+void symbol_set_crc(struct symbol *sym, unsigned long crc);
+void symbol_for_each(symbol_callback_t func, void *arg);
+void symbol_print_versions(void);
 void symbol_free(void);
 
 /*
@@ -131,7 +138,8 @@ enum die_state {
 	DIE_INCOMPLETE,
 	DIE_UNEXPANDED,
 	DIE_COMPLETE,
-	DIE_LAST = DIE_COMPLETE
+	DIE_SYMBOL,
+	DIE_LAST = DIE_SYMBOL
 };
 
 enum die_fragment_type {
@@ -161,6 +169,7 @@ static inline const char *die_state_name(enum die_state state)
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
 	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
+	CASE_CONST_TO_STR(DIE_SYMBOL)
 	}
 
 	error("unexpected die_state: %d", state);
@@ -257,6 +266,6 @@ void process_cu(Dwarf_Die *cudie);
  * types.c
  */
 
-void generate_symtypes(FILE *file);
+void generate_symtypes_and_versions(FILE *file);
 
 #endif /* __GENDWARFKSYMS_H */
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 6ed0c4769e6f..e0c9007f7250 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -66,6 +66,36 @@ static unsigned int for_each(const char *name, symbol_callback_t func,
 	return 0;
 }
 
+static void set_crc(struct symbol *sym, void *data)
+{
+	unsigned long *crc = data;
+
+	if (sym->state == SYMBOL_PROCESSED && sym->crc != *crc)
+		warn("overriding version for symbol %s (crc %lx vs. %lx)",
+		     sym->name, sym->crc, *crc);
+
+	sym->state = SYMBOL_PROCESSED;
+	sym->crc = *crc;
+}
+
+void symbol_set_crc(struct symbol *sym, unsigned long crc)
+{
+	if (for_each(sym->name, set_crc, &crc) == 0)
+		error("no matching symbols: '%s'", sym->name);
+}
+
+static void set_die(struct symbol *sym, void *data)
+{
+	sym->die_addr = (uintptr_t)((Dwarf_Die *)data)->addr;
+	sym->state = SYMBOL_MAPPED;
+}
+
+void symbol_set_die(struct symbol *sym, Dwarf_Die *die)
+{
+	if (for_each(sym->name, set_die, die) == 0)
+		error("no matching symbols: '%s'", sym->name);
+}
+
 static bool is_exported(const char *name)
 {
 	return for_each(name, NULL, NULL) > 0;
@@ -120,6 +150,16 @@ struct symbol *symbol_get(const char *name)
 	return sym;
 }
 
+void symbol_for_each(symbol_callback_t func, void *arg)
+{
+	struct hlist_node *tmp;
+	struct symbol *sym;
+
+	hash_for_each_safe(symbol_names, sym, tmp, name_hash) {
+		func(sym, arg);
+	}
+}
+
 typedef void (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
 				      Elf32_Word xndx, void *arg);
 
@@ -244,6 +284,19 @@ void symbol_read_symtab(int fd)
 	elf_for_each_global(fd, elf_set_symbol_addr, NULL);
 }
 
+void symbol_print_versions(void)
+{
+	struct hlist_node *tmp;
+	struct symbol *sym;
+
+	hash_for_each_safe(symbol_names, sym, tmp, name_hash) {
+		if (sym->state != SYMBOL_PROCESSED)
+			warn("no information for symbol %s", sym->name);
+
+		printf("#SYMVER %s 0x%08lx\n", sym->name, sym->crc);
+	}
+}
+
 void symbol_free(void)
 {
 	struct hlist_node *tmp;
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 57ef5cbcfd40..f4dbd21b83e6 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <zlib.h>
 #include "gendwarfksyms.h"
 
 static struct cache expansion_cache;
@@ -174,6 +175,33 @@ static void type_map_free(void)
 	hash_init(type_map);
 }
 
+/*
+ * CRC for a type, with an optional fully expanded type string for
+ * debugging.
+ */
+struct version {
+	struct type_expansion type;
+	unsigned long crc;
+};
+
+static void version_init(struct version *version)
+{
+	version->crc = crc32(0, NULL, 0);
+	type_expansion_init(&version->type);
+}
+
+static void version_free(struct version *version)
+{
+	type_expansion_free(&version->type);
+}
+
+static void version_add(struct version *version, const char *s)
+{
+	version->crc = crc32(version->crc, (void *)s, strlen(s));
+	if (dump_versions)
+		type_expansion_append(&version->type, s, NULL);
+}
+
 /*
  * Type reference format: <prefix>#<name>, where prefix:
  * 	s -> structure
@@ -183,6 +211,12 @@ static void type_map_free(void)
  *
  * Names with spaces are additionally wrapped in single quotes.
  */
+static inline bool is_type_prefix(const char *s)
+{
+	return (s[0] == 's' || s[0] == 'u' || s[0] == 'e' || s[0] == 't') &&
+	       s[1] == '#';
+}
+
 static char get_type_prefix(int tag)
 {
 	switch (tag) {
@@ -210,6 +244,8 @@ static char *get_type_name(struct die *cache)
 		warn("found incomplete cache entry: %p", cache);
 		return NULL;
 	}
+	if (cache->state == DIE_SYMBOL)
+		return NULL;
 	if (!cache->fqn || !*cache->fqn)
 		return NULL;
 
@@ -227,6 +263,39 @@ static char *get_type_name(struct die *cache)
 	return name;
 }
 
+static void __calculate_version(struct version *version, struct list_head *list)
+{
+	struct type_list_entry *entry;
+	struct type_expansion *e;
+
+	/* Calculate a CRC over an expanded type string */
+	list_for_each_entry(entry, list, list) {
+		if (is_type_prefix(entry->str)) {
+			check(type_map_get(entry->str, &e));
+
+			/*
+			 * It's sufficient to expand each type reference just
+			 * once to detect changes.
+			 */
+			if (cache_was_expanded(&expansion_cache, e)) {
+				version_add(version, entry->str);
+			} else {
+				cache_mark_expanded(&expansion_cache, e);
+				__calculate_version(version, &e->expanded);
+			}
+		} else {
+			version_add(version, entry->str);
+		}
+	}
+}
+
+static void calculate_version(struct version *version, struct list_head *list)
+{
+	version_init(version);
+	__calculate_version(version, list);
+	cache_free(&expansion_cache);
+}
+
 static void __type_expand(struct die *cache, struct type_expansion *type,
 			  bool recursive);
 
@@ -333,7 +402,49 @@ static void expand_type(struct die *cache, void *arg)
 	free(name);
 }
 
-void generate_symtypes(FILE *file)
+static void expand_symbol(struct symbol *sym, void *arg)
+{
+	struct type_expansion type;
+	struct version version;
+	struct die *cache;
+
+	/*
+	 * No need to expand again unless we want a symtypes file entry
+	 * for the symbol. Note that this means `sym` has the same address
+	 * as another symbol that was already processed.
+	 */
+	if (!symtypes && sym->state == SYMBOL_PROCESSED)
+		return;
+
+	if (__die_map_get(sym->die_addr, DIE_SYMBOL, &cache))
+		return; /* We'll warn about missing CRCs later. */
+
+	type_expand(cache, &type, false);
+
+	/* If the symbol already has a version, don't calculate it again. */
+	if (sym->state != SYMBOL_PROCESSED) {
+		calculate_version(&version, &type.expanded);
+		symbol_set_crc(sym, version.crc);
+		debug("%s = %lx", sym->name, version.crc);
+
+		if (dump_versions) {
+			checkp(fputs(sym->name, stderr));
+			checkp(fputs(" ", stderr));
+			type_list_write(&version.type.expanded, stderr);
+			checkp(fputs("\n", stderr));
+		}
+
+		version_free(&version);
+	}
+
+	/* These aren't needed in type_map unless we want a symtypes file. */
+	if (symtypes)
+		type_map_add(sym->name, &type);
+
+	type_expansion_free(&type);
+}
+
+void generate_symtypes_and_versions(FILE *file)
 {
 	cache_init(&expansion_cache);
 
@@ -351,7 +462,14 @@ void generate_symtypes(FILE *file)
 	die_map_for_each(expand_type, NULL);
 
 	/*
-	 *   2. If a symtypes file is requested, write type_map contents to
+	 *   2. For each exported symbol, expand the die_map type, and use
+	 *      type_map expansions to calculate a symbol version from the
+	 *      fully expanded type string.
+	 */
+	symbol_for_each(expand_symbol, NULL);
+
+	/*
+	 *   3. If a symtypes file is requested, write type_map contents to
 	 *      the file.
 	 */
 	type_map_write(file);
-- 
2.47.0.371.ga323438b13-goog


