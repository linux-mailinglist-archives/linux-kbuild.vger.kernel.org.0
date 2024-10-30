Return-Path: <linux-kbuild+bounces-4419-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE49B6A6A
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214041C20CB0
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29205229B26;
	Wed, 30 Oct 2024 17:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2oVjH8tL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B47229129
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307708; cv=none; b=fvzWMFtm/63hSxqdS5igpgj3+JqjbvzlneSQnxWZBo/vncW6e8x8K1UaIVNOWSipk9P6DWMNXM8WRr3kU7ixeW6uEknFck7cAasTf9ZFjDr8OiCWA3qRkLZjTvSzj5HPhGi/CGCYrQl4KPm7ihRUhHraUIBi0gOYTbnQSbfvFzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307708; c=relaxed/simple;
	bh=ULVD14UhFWrKBgWJ82QyUDIxrZeB/yU4oVPv996NyMc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RKtE4Ds/2rZhqiI4op/6foIybFukDuVsJcgCTuhXHI2dB9N3gfX4iNbXSUN6kVF1WGbMs2s+pcaGBLUZoMD18HmaWLK1Pw2Jhv8bCX5Ow0KWyO3zyd7OwW4eBiAAQzHBriKAlZ5o057VWM3zrXlG01LiAGlWP2G9N11eSmFljWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2oVjH8tL; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e0082c1dd0so144525667b3.3
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307703; x=1730912503; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uHPxti40Pa3O/FF3tFUMygBRCK3aFRnGLDB8IawbpbQ=;
        b=2oVjH8tLp4RyIYboEfjzYzrDWH3n43BfpyS8HuHL4a3zPGZohINnBLo5DQrpklSSGO
         sqrsTeVncZ7W2w4X/Tn2ldE/IIfsWEmVekt5mIo8zE50/R/uZnYuvYMNJrnzcnjf+UFU
         xlg5sfHUwcrIfcM3mIBg/vNt3wBNCNxBkg+/hGoN5fpYXQfP03pLOBVnoSvyDkg9ODrw
         txj5kpaKUjscPFKvymrMIx1gq+X3PI+i2Fc77o6xECIUTKrP+DhjaqGz6zJbukenZ/y0
         qBcavYDc4H888ZedxAUuK7RH9r0wpVttDY9RwKq+VxsHfuHQiUJYp/fzBGCqxFu5RB/n
         vDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307703; x=1730912503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHPxti40Pa3O/FF3tFUMygBRCK3aFRnGLDB8IawbpbQ=;
        b=SL8bzfjPstp97WComPwH3H69yAxQF7lhaAuPhTVK3gM/O38+ON17lT60WUei62OYQH
         vG3KwlPIu51XMPHAks3TmYg5BjyNs3foT0XwFClOqgN3nwFVEgufRZz4S+uaxIBDQ8BQ
         wZdBqxOkDl/3Jpm50E8mhEq/wBreKXj6UYPeRafck/AsC97FxcLGABRxWjZeTG/tzRKy
         GukjpHRi2pe6rNEgwfZLHQYStYT897JYJPMv5u7I1Q35KRLuhHGBUEwA+4KX1abf9kGs
         jWsX20qwaeTr1VDuv0Ho5T7QRKHyfuExMuuKVtUFjLyRsQb9PPBtdezFamlDgL/jUZe8
         hekQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAeMtELTfbkK0kuPzhDcmUX56VxLBP1YnfMK6YbCNsDpG2KKrETWjsqN050YoWzLFE7Des0/Jh5WZ2eNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzI4ofU64dJ9xWvXGPPjR8VVN22tNQNBo8ECQ8oeAqhdUfnz8x
	7RYI+No/e2mQgbL/Nw6aojg4CfiERso0GxNliIQFQNx08t/7cZuwWD6LL7apknHL2Km6SYZ+RUf
	WZqXjtjy8Md/4Py2qZSBVqQFAQg==
X-Google-Smtp-Source: AGHT+IHMAeDT9wUrhm+yjUNA1HubFx8Wx8Ce4e57F+B3a2I8qbE/N2QhYes/kFqK/rdTQMy3bjDMymYhB0yJZkgDXKs=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:6f06:b0:6e3:2f0b:b595 with
 SMTP id 00721157ae682-6ea3b968a7bmr1886597b3.5.1730307703602; Wed, 30 Oct
 2024 10:01:43 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:19 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=16963; i=samitolvanen@google.com;
 h=from:subject; bh=ULVD14UhFWrKBgWJ82QyUDIxrZeB/yU4oVPv996NyMc=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaREC5Us/GDobvW5jPFDNrdX9dr7Mep/pPWmLbILPm
 z8Q6OPvKGVhEONgkBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABMpDmH4Z3F2i06ZU7/My6qJ
 xfse6WZL3rFd1fZG+FEEb9r66/++L2D4K7+lZOelWCa9gn8NatNXbGdvjpnJIv1K82m1rlzuK91 6ZgA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-33-samitolvanen@google.com>
Subject: [PATCH v5 12/19] gendwarfksyms: Add symtypes output
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

Add support for producing genksyms-style symtypes files. Process
die_map to find the longest expansions for each type, and use symtypes
references in type definitions. The basic file format is similar to
genksyms, with two notable exceptions:

  1. Type names with spaces (common with Rust) in references are
     wrapped in single quotes. E.g.:

     s#'core::result::Result<u8, core::num::error::ParseIntError>'

  2. The actual type definition is the simple parsed DWARF format we
     output with --dump-dies, not the preprocessed C-style format
     genksyms produces.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/die.c           |  11 +
 scripts/gendwarfksyms/dwarf.c         |   1 +
 scripts/gendwarfksyms/gendwarfksyms.c |  33 ++-
 scripts/gendwarfksyms/gendwarfksyms.h |  19 ++
 scripts/gendwarfksyms/symbols.c       |   4 +-
 scripts/gendwarfksyms/types.c         | 359 ++++++++++++++++++++++++++
 7 files changed, 425 insertions(+), 3 deletions(-)
 create mode 100644 scripts/gendwarfksyms/types.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index c06145d84df8..6540282dc746 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -6,5 +6,6 @@ gendwarfksyms-objs += cache.o
 gendwarfksyms-objs += die.o
 gendwarfksyms-objs += dwarf.o
 gendwarfksyms-objs += symbols.o
+gendwarfksyms-objs += types.o
 
 HOSTLDLIBS_gendwarfksyms := -ldw -lelf
diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index 2829387fd815..df1ca3a032bb 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -22,6 +22,7 @@ static inline unsigned int die_hash(uintptr_t addr, enum die_state state)
 static void init_die(struct die *cd)
 {
 	cd->state = DIE_INCOMPLETE;
+	cd->mapped = false;
 	cd->fqn = NULL;
 	cd->tag = -1;
 	cd->addr = 0;
@@ -83,6 +84,16 @@ static void reset_die(struct die *cd)
 	init_die(cd);
 }
 
+void die_map_for_each(die_map_callback_t func, void *arg)
+{
+	struct hlist_node *tmp;
+	struct die *cd;
+
+	hash_for_each_safe(die_map, cd, tmp, hash) {
+		func(cd, arg);
+	}
+}
+
 void die_map_free(void)
 {
 	struct hlist_node *tmp;
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 513f37d1798a..3d2c1aa24960 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -730,6 +730,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 {
 	debug("%s", state->sym->name);
 	check(process_func(state, NULL, die));
+	state->sym->state = SYMBOL_MAPPED;
 	if (dump_dies)
 		fputs("\n", stderr);
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index ed6d8c585268..76a38b733ad2 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -21,6 +21,11 @@ int debug;
 int dump_dies;
 /* Print debugging information about die_map changes */
 int dump_die_map;
+/* Print out type strings (i.e. type_map) */
+int dump_types;
+/* Write a symtypes file */
+int symtypes;
+static const char *symtypes_file;
 
 static void usage(void)
 {
@@ -29,6 +34,8 @@ static void usage(void)
 	      "  -d, --debug          Print debugging information\n"
 	      "      --dump-dies      Dump DWARF DIE contents\n"
 	      "      --dump-die-map   Print debugging information about die_map changes\n"
+	      "      --dump-types     Dump type strings\n"
+	      "  -T, --symtypes file  Write a symtypes file\n"
 	      "  -h, --help           Print this message\n"
 	      "\n",
 	      stderr);
@@ -41,6 +48,7 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
 	Dwarf_Die cudie;
 	Dwarf_CU *cu = NULL;
 	Dwarf *dbg;
+	FILE *symfile = arg;
 	int res;
 
 	debug("%s", name);
@@ -60,6 +68,10 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
 		process_cu(&cudie);
 	} while (cu);
 
+	/*
+	 * Use die_map to expand type strings and write them to `symfile`.
+	 */
+	generate_symtypes(symfile);
 	die_map_free();
 
 	return DWARF_CB_OK;
@@ -72,22 +84,29 @@ static const Dwfl_Callbacks callbacks = {
 
 int main(int argc, char **argv)
 {
+	FILE *symfile = NULL;
 	unsigned int n;
 	int opt;
 
 	struct option opts[] = { { "debug", 0, NULL, 'd' },
 				 { "dump-dies", 0, &dump_dies, 1 },
 				 { "dump-die-map", 0, &dump_die_map, 1 },
+				 { "dump-types", 0, &dump_types, 1 },
+				 { "symtypes", 1, NULL, 'T' },
 				 { "help", 0, NULL, 'h' },
 				 { 0, 0, NULL, 0 } };
 
-	while ((opt = getopt_long(argc, argv, "dh", opts, NULL)) != EOF) {
+	while ((opt = getopt_long(argc, argv, "dT:h", opts, NULL)) != EOF) {
 		switch (opt) {
 		case 0:
 			break;
 		case 'd':
 			debug = 1;
 			break;
+		case 'T':
+			symtypes = 1;
+			symtypes_file = optarg;
+			break;
 		case 'h':
 			usage();
 			return 0;
@@ -107,6 +126,13 @@ int main(int argc, char **argv)
 
 	symbol_read_exports(stdin);
 
+	if (symtypes_file) {
+		symfile = fopen(symtypes_file, "w");
+		if (!symfile)
+			error("fopen failed for '%s': %s", symtypes_file,
+			      strerror(errno));
+	}
+
 	for (n = optind; n < argc; n++) {
 		Dwfl *dwfl;
 		int fd;
@@ -129,12 +155,15 @@ int main(int argc, char **argv)
 
 		dwfl_report_end(dwfl, NULL, NULL);
 
-		if (dwfl_getmodules(dwfl, &process_module, NULL, 0))
+		if (dwfl_getmodules(dwfl, &process_module, symfile, 0))
 			error("dwfl_getmodules failed for '%s'", argv[n]);
 
 		dwfl_end(dwfl);
 	}
 
+	if (symfile)
+		check(fclose(symfile));
+
 	symbol_free();
 
 	return 0;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 72912c6b6e64..835ebcea6e97 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -25,6 +25,8 @@
 extern int debug;
 extern int dump_dies;
 extern int dump_die_map;
+extern int dump_types;
+extern int symtypes;
 
 /*
  * Output helpers
@@ -93,6 +95,11 @@ static inline unsigned int addr_hash(uintptr_t addr)
 	return hash_ptr((const void *)addr);
 }
 
+enum symbol_state {
+	SYMBOL_UNPROCESSED,
+	SYMBOL_MAPPED,
+};
+
 struct symbol_addr {
 	uint32_t section;
 	Elf64_Addr address;
@@ -103,6 +110,8 @@ struct symbol {
 	struct symbol_addr addr;
 	struct hlist_node addr_hash;
 	struct hlist_node name_hash;
+	enum symbol_state state;
+	uintptr_t die_addr;
 };
 
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);
@@ -157,6 +166,7 @@ static inline const char *die_state_name(enum die_state state)
 
 struct die {
 	enum die_state state;
+	bool mapped;
 	char *fqn;
 	int tag;
 	uintptr_t addr;
@@ -164,10 +174,13 @@ struct die {
 	struct hlist_node hash;
 };
 
+typedef void (*die_map_callback_t)(struct die *, void *arg);
+
 int __die_map_get(uintptr_t addr, enum die_state state, struct die **res);
 struct die *die_map_get(Dwarf_Die *die, enum die_state state);
 void die_map_add_string(struct die *pd, const char *str);
 void die_map_add_linebreak(struct die *pd, int linebreak);
+void die_map_for_each(die_map_callback_t func, void *arg);
 void die_map_add_die(struct die *pd, struct die *child);
 void die_map_free(void);
 
@@ -229,4 +242,10 @@ int process_die_container(struct state *state, struct die *cache,
 
 void process_cu(Dwarf_Die *cudie);
 
+/*
+ * types.c
+ */
+
+void generate_symtypes(FILE *file);
+
 #endif /* __GENDWARFKSYMS_H */
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index e7343394248b..6ed0c4769e6f 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -92,6 +92,7 @@ void symbol_read_exports(FILE *file)
 		sym = xcalloc(1, sizeof(struct symbol));
 		sym->name = name;
 		sym->addr.section = SHN_UNDEF;
+		sym->state = SYMBOL_UNPROCESSED;
 
 		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
 		++nsym;
@@ -107,7 +108,8 @@ static void get_symbol(struct symbol *sym, void *arg)
 {
 	struct symbol **res = arg;
 
-	*res = sym;
+	if (sym->state == SYMBOL_UNPROCESSED)
+		*res = sym;
 }
 
 struct symbol *symbol_get(const char *name)
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
new file mode 100644
index 000000000000..c05811299eba
--- /dev/null
+++ b/scripts/gendwarfksyms/types.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+static struct expansion_cache expansion_cache;
+
+/*
+ * A simple linked list of shared or owned strings to avoid copying strings
+ * around when not necessary.
+ */
+struct type_list_entry {
+	const char *str;
+	void *owned;
+	struct list_head list;
+};
+
+static void type_list_free(struct list_head *list)
+{
+	struct type_list_entry *entry;
+	struct type_list_entry *tmp;
+
+	list_for_each_entry_safe(entry, tmp, list, list) {
+		if (entry->owned)
+			free(entry->owned);
+		free(entry);
+	}
+
+	INIT_LIST_HEAD(list);
+}
+
+static int type_list_append(struct list_head *list, const char *s, void *owned)
+{
+	struct type_list_entry *entry;
+
+	if (!s)
+		return 0;
+
+	entry = xmalloc(sizeof(struct type_list_entry));
+	entry->str = s;
+	entry->owned = owned;
+	list_add_tail(&entry->list, list);
+
+	return strlen(entry->str);
+}
+
+static void type_list_write(struct list_head *list, FILE *file)
+{
+	struct type_list_entry *entry;
+
+	list_for_each_entry(entry, list, list) {
+		if (entry->str)
+			checkp(fputs(entry->str, file));
+	}
+}
+
+/*
+ * An expanded type string in symtypes format.
+ */
+struct type_expansion {
+	char *name;
+	size_t len;
+	struct list_head expanded;
+	struct hlist_node hash;
+};
+
+static void type_expansion_init(struct type_expansion *type)
+{
+	type->name = NULL;
+	type->len = 0;
+	INIT_LIST_HEAD(&type->expanded);
+}
+
+static inline void type_expansion_free(struct type_expansion *type)
+{
+	free(type->name);
+	type->name = NULL;
+	type->len = 0;
+	type_list_free(&type->expanded);
+}
+
+static void type_expansion_append(struct type_expansion *type, const char *s,
+				  void *owned)
+{
+	type->len += type_list_append(&type->expanded, s, owned);
+}
+
+/*
+ * type_map -- the longest expansions for each type.
+ *
+ * const char *name -> struct type_expansion *
+ */
+#define TYPE_HASH_BITS 16
+static HASHTABLE_DEFINE(type_map, 1 << TYPE_HASH_BITS);
+
+static int type_map_get(const char *name, struct type_expansion **res)
+{
+	struct type_expansion *e;
+
+	hash_for_each_possible(type_map, e, hash, hash_str(name)) {
+		if (!strcmp(name, e->name)) {
+			*res = e;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+static void type_map_add(const char *name, struct type_expansion *type)
+{
+	struct type_expansion *e;
+
+	if (type_map_get(name, &e)) {
+		e = xmalloc(sizeof(struct type_expansion));
+		type_expansion_init(e);
+		e->name = xstrdup(name);
+
+		hash_add(type_map, &e->hash, hash_str(e->name));
+
+		if (dump_types)
+			debug("adding %s", e->name);
+	} else {
+		/* Use the longest available expansion */
+		if (type->len <= e->len)
+			return;
+
+		type_list_free(&e->expanded);
+
+		if (dump_types)
+			debug("replacing %s", e->name);
+	}
+
+	/* Take ownership of type->expanded */
+	list_replace_init(&type->expanded, &e->expanded);
+	e->len = type->len;
+
+	if (dump_types) {
+		checkp(fputs(e->name, stderr));
+		checkp(fputs(" ", stderr));
+		type_list_write(&e->expanded, stderr);
+		checkp(fputs("\n", stderr));
+	}
+}
+
+static void type_map_write(FILE *file)
+{
+	struct type_expansion *e;
+	struct hlist_node *tmp;
+
+	if (!file)
+		return;
+
+	hash_for_each_safe(type_map, e, tmp, hash) {
+		checkp(fputs(e->name, file));
+		checkp(fputs(" ", file));
+		type_list_write(&e->expanded, file);
+		checkp(fputs("\n", file));
+	}
+}
+
+static void type_map_free(void)
+{
+	struct type_expansion *e;
+	struct hlist_node *tmp;
+
+	hash_for_each_safe(type_map, e, tmp, hash) {
+		type_expansion_free(e);
+		free(e);
+	}
+
+	hash_init(type_map);
+}
+
+/*
+ * Type reference format: <prefix>#<name>, where prefix:
+ * 	s -> structure
+ * 	u -> union
+ * 	e -> enum
+ * 	t -> typedef
+ *
+ * Names with spaces are additionally wrapped in single quotes.
+ */
+static char get_type_prefix(int tag)
+{
+	switch (tag) {
+	case DW_TAG_class_type:
+	case DW_TAG_structure_type:
+		return 's';
+	case DW_TAG_union_type:
+		return 'u';
+	case DW_TAG_enumeration_type:
+		return 'e';
+	case DW_TAG_typedef_type:
+		return 't';
+	default:
+		return 0;
+	}
+}
+
+static char *get_type_name(struct die *cache)
+{
+	const char *quote;
+	char prefix;
+	char *name;
+
+	if (cache->state == DIE_INCOMPLETE) {
+		warn("found incomplete cache entry: %p", cache);
+		return NULL;
+	}
+	if (!cache->fqn || !*cache->fqn)
+		return NULL;
+
+	prefix = get_type_prefix(cache->tag);
+	if (!prefix)
+		return NULL;
+
+	/* Wrap names with spaces in single quotes */
+	quote = strstr(cache->fqn, " ") ? "'" : "";
+
+	/* <prefix>#<type_name>\0 */
+	if (asprintf(&name, "%c#%s%s%s", prefix, quote, cache->fqn, quote) < 0)
+		error("asprintf failed for '%s'", cache->fqn);
+
+	return name;
+}
+
+static void __type_expand(struct die *cache, struct type_expansion *type,
+			  bool recursive);
+
+static void type_expand_child(struct die *cache, struct type_expansion *type,
+			      bool recursive)
+{
+	struct type_expansion child;
+	char *name;
+
+	name = get_type_name(cache);
+	if (!name) {
+		__type_expand(cache, type, recursive);
+		return;
+	}
+
+	if (recursive && !__cache_was_expanded(&expansion_cache, cache->addr)) {
+		__cache_mark_expanded(&expansion_cache, cache->addr);
+		type_expansion_init(&child);
+		__type_expand(cache, &child, true);
+		type_map_add(name, &child);
+		type_expansion_free(&child);
+	}
+
+	type_expansion_append(type, name, name);
+}
+
+static void __type_expand(struct die *cache, struct type_expansion *type,
+			  bool recursive)
+{
+	struct die_fragment *df;
+	struct die *child;
+
+	list_for_each_entry(df, &cache->fragments, list) {
+		switch (df->type) {
+		case FRAGMENT_STRING:
+			type_expansion_append(type, df->data.str, NULL);
+			break;
+		case FRAGMENT_DIE:
+			/* Use a complete die_map expansion if available */
+			if (__die_map_get(df->data.addr, DIE_COMPLETE,
+					  &child) &&
+			    __die_map_get(df->data.addr, DIE_UNEXPANDED,
+					  &child))
+				error("unknown child: %" PRIxPTR,
+				      df->data.addr);
+
+			type_expand_child(child, type, recursive);
+			break;
+		case FRAGMENT_LINEBREAK:
+			/*
+			 * Keep whitespace in the symtypes format, but avoid
+			 * repeated spaces.
+			 */
+			if (list_is_last(&df->list, &cache->fragments) ||
+			    list_next_entry(df, list)->type !=
+				    FRAGMENT_LINEBREAK)
+				type_expansion_append(type, " ", NULL);
+			break;
+		default:
+			error("empty die_fragment in %p", cache);
+		}
+	}
+}
+
+static void type_expand(struct die *cache, struct type_expansion *type,
+			bool recursive)
+{
+	type_expansion_init(type);
+	__type_expand(cache, type, recursive);
+	cache_clear_expanded(&expansion_cache);
+}
+
+static void expand_type(struct die *cache, void *arg)
+{
+	struct type_expansion type;
+	char *name;
+
+	if (cache->mapped)
+		return;
+
+	cache->mapped = true;
+
+	/*
+	 * Skip unexpanded die_map entries if there's a complete
+	 * expansion available for this DIE.
+	 */
+	if (cache->state == DIE_UNEXPANDED &&
+	    !__die_map_get(cache->addr, DIE_COMPLETE, &cache)) {
+		if (cache->mapped)
+			return;
+
+		cache->mapped = true;
+	}
+
+	name = get_type_name(cache);
+	if (!name)
+		return;
+
+	debug("%s", name);
+	type_expand(cache, &type, true);
+	type_map_add(name, &type);
+
+	type_expansion_free(&type);
+	free(name);
+}
+
+void generate_symtypes(FILE *file)
+{
+	hash_init(expansion_cache.cache);
+
+	/*
+	 * die_map processing:
+	 *
+	 *   1. die_map contains all types referenced in exported symbol
+	 *      signatures, but can contain duplicates just like the original
+	 *      DWARF, and some references may not be fully expanded depending
+	 *      on how far we processed the DIE tree for that specific symbol.
+	 *
+	 *      For each die_map entry, find the longest available expansion,
+	 *      and add it to type_map.
+	 */
+	die_map_for_each(expand_type, NULL);
+
+	/*
+	 *   2. If a symtypes file is requested, write type_map contents to
+	 *      the file.
+	 */
+	type_map_write(file);
+	type_map_free();
+}
-- 
2.47.0.163.g1226f6d8fa-goog


