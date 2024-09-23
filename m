Return-Path: <linux-kbuild+bounces-3682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4D797F079
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 20:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F861B227E4
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 18:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA921A4AA6;
	Mon, 23 Sep 2024 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3gv0IYaF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF811A08C4
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115574; cv=none; b=lO6SesurWyaEwb5eGZbArrUy3Qn29QnDaGj4z7zkhEiXG2fj1Llz0iaoizp+B+hh+DAFM2P0YzQbPXwT/+fUFTkZWfjwk/7G860mWcMGlbTLKPrFdJqOdFqmxWfi+274xEOirQlen5u8N8BMDi/Pub3mmaNqJsUEeZWFhpSMgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115574; c=relaxed/simple;
	bh=NyQMJW8xoyRkaDj9KuuEnvX2h4eDKw1AvcUUXqq6aaU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AsRBcopuD3OvI+CtC+SslvLo9omfM0eb0ai93DBmhFpaDRb7QvJjvU+gDEZOT+/EmySnCpKQh9Nnkj4fl64gpknoJSimZAL0wA84FgVb1rzYDK7KPZ9lQox0FMdHZsO0CsM28p1CfJkJK4VKruVbbeCJLBA9b2d0gujTvA0Pxwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3gv0IYaF; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2daa02872c1so4275046a91.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115571; x=1727720371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQDh+AQxocSUIORA7y8NGTKu8fBAIKbAEgaeqYm4RPQ=;
        b=3gv0IYaFfXRoSIXMbxHH1fMoxSsKOfZL7pEYQHjykfRsGI3OEpaUSX4rMjeciwP+KJ
         CUkaRkdm/Twni01hRFCjhgS20Ed2PImnDo3MOl/vhhV92vnUKIAPftg7kIJdf7BekOuo
         5W8FvBNFmUboMCcEW506b4L8bo6yVB0MWKAkuRx6HyEIojLgxX7VmPKzY1fo2RgBd8Yp
         w9ypf3te/bUhxBFTZ4PDGzAvP/C6Oj/9vQL95E978fbMhybxHHb9PJ7MgVtPTrvqh3H9
         XJSG+zHRJ82GN++agvV0Cw1afsT1lJJrDsatAHpWW6UQiWZATRXn3vSLOy6gveFLyYlv
         odXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115571; x=1727720371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQDh+AQxocSUIORA7y8NGTKu8fBAIKbAEgaeqYm4RPQ=;
        b=b0wZc5IqIiqi8kAws0wYJghXVdIplC4W5qagwGUx0Vs4ld92QVSD7w2AWRxQwzpsv6
         mAXuovdLLWnH1xBQBYVVeI4RGldceOUMpBAw3NJwI5F6LBHjxGS2CAwg4byoImTxidqg
         x+Yxr8Vk5H2KqYC2c62NHGj1I9Rayxk/YR0hBtSNcx75PVYvvO9TxBiX8ZJ6cbXy43qw
         8DXoclr6F4VTGcwyWeMQs5fatBSPMhSAdbvP/7pHzUAxINBJv8UwqDLP0ZtcuKRfEE2O
         XLLsDF1yLwVO2rHkogCrMC6SMsBwyjiCkO9TeQgG5sXXO5hWdEAP49bLtZydE8f1zhh7
         cUfg==
X-Forwarded-Encrypted: i=1; AJvYcCW4ArhqDWlZbUBiVFh/v32jZ24qXmOrsLoGOgivpKPj3mhuogg01cs8SDrXdWXV8FsGdT8K8O1wsWMCduA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHj9L76vLrI2MwsU7YXbwKBwCtjJDAt0Ju4C0vja0WRU2SaMdy
	alS0vA5ha0eeQn4VtIaNCF7r8ruWkL1CO1wKJCoJU5mkiQi0M4EBaPlt6O7fn6h88Pf342hodlR
	n0phPJrMJqTKRpIeJvmVKhxSZCA==
X-Google-Smtp-Source: AGHT+IHDCpMMeDju4PawTIDwF7TntYE+Y3rH7ZsGT9ME5cBiLIfyubQG1RPL/WTp7CVLxceXz5aEd8YUOuFXqZPV3bo=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90b:4a8e:b0:2d8:e4f9:259e with
 SMTP id 98e67ed59e1d1-2dd7f7527f5mr15155a91.3.1727115571325; Mon, 23 Sep 2024
 11:19:31 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:19:00 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=12492; i=samitolvanen@google.com;
 h=from:subject; bh=NyQMJW8xoyRkaDj9KuuEnvX2h4eDKw1AvcUUXqq6aaU=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN/Iqf2m7JL/4+fTbnRtf6E0/8L7j2dJjc5f2KVQaz
 fd1ND97paOUhUGMg0FWTJGl5evqrbu/O6W++lwkATOHlQlkCAMXpwBMZPN3RoYJghy/JvlOvOj0
 w3l36lUXL9HrIuskXna/6FNdvfPGh/OqDH/FD/0okb7szcL5uaktcPljhdd/p32sTlcWbd8uVOo 1iY0VAA==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-36-samitolvanen@google.com>
Subject: [PATCH v3 14/20] gendwarfksyms: Add symbol versioning
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Calculate symbol versions from the fully expanded type strings in
type_map, and output the versions in a genksyms-compatible format.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c         |  25 +++++-
 scripts/gendwarfksyms/gendwarfksyms.c |  11 ++-
 scripts/gendwarfksyms/gendwarfksyms.h |  13 ++-
 scripts/gendwarfksyms/symbols.c       |  59 +++++++++++++
 scripts/gendwarfksyms/types.c         | 122 +++++++++++++++++++++++++-
 5 files changed, 222 insertions(+), 8 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 2f80c78e356e..8d1a7d808413 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -720,12 +720,33 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
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
index c077c4c1d346..7fb17bf81e02 100644
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
@@ -175,5 +180,7 @@ int main(int argc, char **argv)
 	if (symfile)
 		check(fclose(symfile));
 
+	symbol_print_versions();
+
 	return 0;
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 9fff30699d15..db9b4964ed8a 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -26,6 +26,7 @@ extern int debug;
 extern int dump_dies;
 extern int dump_die_map;
 extern int dump_types;
+extern int dump_versions;
 extern int symtypes;
 
 /*
@@ -98,6 +99,7 @@ static inline unsigned int addr_hash(uintptr_t addr)
 enum symbol_state {
 	SYMBOL_UNPROCESSED,
 	SYMBOL_MAPPED,
+	SYMBOL_PROCESSED
 };
 
 struct symbol_addr {
@@ -112,6 +114,7 @@ struct symbol {
 	struct hlist_node name_hash;
 	enum symbol_state state;
 	uintptr_t die_addr;
+	unsigned long crc;
 };
 
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);
@@ -119,6 +122,10 @@ typedef void (*symbol_callback_t)(struct symbol *, void *arg);
 void symbol_read_exports(FILE *file);
 void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
+void symbol_set_die(struct symbol *sym, Dwarf_Die *die);
+void symbol_set_crc(struct symbol *sym, unsigned long crc);
+void symbol_for_each(symbol_callback_t func, void *arg);
+void symbol_print_versions(void);
 
 /*
  * die.c
@@ -128,7 +135,8 @@ enum die_state {
 	DIE_INCOMPLETE,
 	DIE_UNEXPANDED,
 	DIE_COMPLETE,
-	DIE_LAST = DIE_COMPLETE
+	DIE_SYMBOL,
+	DIE_LAST = DIE_SYMBOL
 };
 
 enum die_fragment_type {
@@ -159,6 +167,7 @@ static inline const char *die_state_name(enum die_state state)
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
 	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
+	CASE_CONST_TO_STR(DIE_SYMBOL)
 	}
 }
 
@@ -244,6 +253,6 @@ void process_cu(Dwarf_Die *cudie);
  * types.c
  */
 
-void generate_symtypes(FILE *file);
+void generate_symtypes_and_versions(FILE *file);
 
 #endif /* __GENDWARFKSYMS_H */
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index a89e4869925a..924f52ee4acd 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -66,6 +66,36 @@ static int for_each(const char *name, bool name_only, symbol_callback_t func,
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
+	if (checkp(for_each(sym->name, false, set_crc, &crc)) == 0)
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
+	if (checkp(for_each(sym->name, false, set_die, die)) == 0)
+		error("no matching symbols: '%s'", sym->name);
+}
+
 static bool is_exported(const char *name)
 {
 	return checkp(for_each(name, true, NULL, NULL)) > 0;
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
 
@@ -229,3 +269,22 @@ void symbol_read_symtab(int fd)
 {
 	elf_for_each_global(fd, elf_set_symbol_addr, NULL);
 }
+
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
+
+		free((void *)sym->name);
+		free(sym);
+	}
+
+	hash_init(symbol_addrs);
+	hash_init(symbol_names);
+}
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index c05811299eba..08886063363c 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <crc32.h>
 #include "gendwarfksyms.h"
 
 static struct expansion_cache expansion_cache;
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
+	version->crc = 0xffffffff;
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
+	version->crc = partial_crc32(s, version->crc);
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
+	cache_clear_expanded(&expansion_cache);
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
 	hash_init(expansion_cache.cache);
 
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
2.46.0.792.g87dc391469-goog


