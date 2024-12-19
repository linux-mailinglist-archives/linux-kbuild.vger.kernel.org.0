Return-Path: <linux-kbuild+bounces-5203-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C129F869C
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9E8C18970F8
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE611FD7B7;
	Thu, 19 Dec 2024 21:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WWyKPs7D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C01FC0F8
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642489; cv=none; b=SVRyp8K5OsQwy2GcbubUZ+yFGT9imBZWPtEkk5r062LRKvH+cvkZQdiwVqFD5N9sJm5TtAa+i9vGpWCK5+psYVKXrADRXJ+Hh4bMNr1fR22LC6p4WsI4f8ALct7ouwyChj1+uAW05Koq4jZyMBMOEJs50vlbDp078vJSCYLSgfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642489; c=relaxed/simple;
	bh=dvuUA3B6USfgxNyOUC1rE7HluY9N6X+YJCbsWpYa2eA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F0xGslIYu10pxpqp+lGk8aK6L+MQ1JCs6B4D2aX7tX5/f2oXOOUe/MvOS+FrYswu4lOFOh6ACiN8dH2xncdsT/SIXuVnK4Z9ib+fCr60jTdz7eJjq7t7lX5B7ZjeXS62Wjs4O6U1eectMn08sdPNJwSMDbUcNmpqphW97DiVQfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WWyKPs7D; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-218ad674181so20819785ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642485; x=1735247285; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rUUeBhr/XftIxo5nShGbrucXNy5piFLfIDtOuXUslzs=;
        b=WWyKPs7DsU7J6ywYVQHikdGn0/Rl35K+ol9SpHaYYUlfrytVhEY9yJQqh42PBYkYvr
         RsNZChwDjYWZsaPlLzHpH1SKmZerAjslvXwm/nzrotn+jr7CK5faAR+qw8ufniLQkkg0
         0tfEhOOe4JaRpCGODCYRpfgi2Agxbo9qesLY8JrKhsvmoi5VXC9a+xdaP3bVzfaZqTGD
         utpJpuXhkK1A3OPnQcWPZW6PQ8XLAY9mPH3Sn+nzfmdtvpuy+wPQBLIofsWCt5i18t7b
         axykmnP52X3HyvSVcdJSb+3x2QCmZNVTbCG0TOcDU/r1RMz+d1+VcgFMBk9FMnoau1x8
         PmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642485; x=1735247285;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUUeBhr/XftIxo5nShGbrucXNy5piFLfIDtOuXUslzs=;
        b=NJqKEtj8MEdKdf+w9lQPgCKPZC7nJEifeAJr7pVD694aRG6/8BHDJNKBqXNdCh1MvR
         6ibhFAVdk0VUTccsl0+STiwthg4bFj9rGs6J5ONCrR3Kf/noa9gJ0wnv71kKmohzLnk/
         IhpNjYUOZXEEwcT2M2Ds3nW6qHY28T131YRREnLujoKCT/xfRdV1oa13lHyTiwXLW6eJ
         SGUK2Mg64nfA/WV+Qppa+siVq8LzIsbsgYyuSIMXrnM9gBaK9/ZdcsBa0c4bHxskBLXO
         1vMSL4znrsXCz782nMrWr/2YCAIsaX1v7Dt2kkwzBXI1tbY6Og8sWt0WDau+Iqperd99
         X9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUaqzQNnYJZb7L0tSV+nnZbwuSLjGrwwDM+I5NpyqkTcq+ygaXXp4PPFPDu/xb4pz8siQrWlcD0/DjE7dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJZePAxY6pux3znPdE8rQnn9CIDwkVK1FL6GqKfNwVZVqx568
	HeCkqTmy8f1E1tvLdRj45rI5V6dH5bhsqBgEQ2py9ru1Kq7kiDuo9FvzwOTtGfLKND0DxEmrhRO
	k4mygRXPDmHDSFh2RYzVszRsknQ==
X-Google-Smtp-Source: AGHT+IE10v7BuiQHjG3YQtc/VKxJidE1ZQf77DGZGzuzCHodyvU4Ihqpe4MxDy0iYufVOwWkvBXFnyBeLI1pN4n+9dU=
X-Received: from pjd7.prod.google.com ([2002:a17:90b:54c7:b0:2ef:78ff:bc3b])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:191:b0:216:6be9:fd48 with SMTP id d9443c01a7336-219da5b9c45mr60633335ad.3.1734642485300;
 Thu, 19 Dec 2024 13:08:05 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:46 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10472; i=samitolvanen@google.com;
 h=from:subject; bh=dvuUA3B6USfgxNyOUC1rE7HluY9N6X+YJCbsWpYa2eA=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3bLzNs0sEN0ftHWF6T0puYx9W+4vfj8vjLv+5d0rU
 XEuWUkbOkpZGMQ4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBEpoQw/NNpuJAw0TrwmFfH
 rvWsb1pLld0a63zL5zWteZTSvl/dJJPhr2ztJINvfW+k9gtt3bQ34MWNrXcD+DZFZLy11vooaFV sxgwA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-29-samitolvanen@google.com>
Subject: [PATCH v7 09/18] gendwarfksyms: Limit structure expansion
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

Expand each structure type only once per exported symbol. This
is necessary to support self-referential structures, which would
otherwise result in infinite recursion, and it's sufficient for
catching ABI changes.

Types defined in .c files are opaque to external users and thus
cannot affect the ABI. Consider type definitions in .c files to
be declarations to prevent opaque types from changing symbol
versions.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/cache.c         |  51 +++++++++++
 scripts/gendwarfksyms/dwarf.c         | 125 ++++++++++++++++++++++++--
 scripts/gendwarfksyms/gendwarfksyms.h |  46 ++++++++++
 4 files changed, 215 insertions(+), 8 deletions(-)
 create mode 100644 scripts/gendwarfksyms/cache.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index c0d4ce50fc27..c06145d84df8 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -2,6 +2,7 @@
 hostprogs-always-y += gendwarfksyms
 
 gendwarfksyms-objs += gendwarfksyms.o
+gendwarfksyms-objs += cache.o
 gendwarfksyms-objs += die.o
 gendwarfksyms-objs += dwarf.o
 gendwarfksyms-objs += symbols.o
diff --git a/scripts/gendwarfksyms/cache.c b/scripts/gendwarfksyms/cache.c
new file mode 100644
index 000000000000..c9c19b86a686
--- /dev/null
+++ b/scripts/gendwarfksyms/cache.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+struct cache_item {
+	unsigned long key;
+	int value;
+	struct hlist_node hash;
+};
+
+void cache_set(struct cache *cache, unsigned long key, int value)
+{
+	struct cache_item *ci;
+
+	ci = xmalloc(sizeof(struct cache_item));
+	ci->key = key;
+	ci->value = value;
+	hash_add(cache->cache, &ci->hash, hash_32(key));
+}
+
+int cache_get(struct cache *cache, unsigned long key)
+{
+	struct cache_item *ci;
+
+	hash_for_each_possible(cache->cache, ci, hash, hash_32(key)) {
+		if (ci->key == key)
+			return ci->value;
+	}
+
+	return -1;
+}
+
+void cache_init(struct cache *cache)
+{
+	hash_init(cache->cache);
+}
+
+void cache_free(struct cache *cache)
+{
+	struct hlist_node *tmp;
+	struct cache_item *ci;
+
+	hash_for_each_safe(cache->cache, ci, tmp, hash) {
+		free(ci);
+	}
+
+	hash_init(cache->cache);
+}
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 6ec1138c459f..6b30e45a4e82 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -27,6 +27,7 @@ static void process_linebreak(struct die *cache, int n)
 		       !dwarf_form##attr(&da, value);                  \
 	}
 
+DEFINE_GET_ATTR(flag, bool)
 DEFINE_GET_ATTR(udata, Dwarf_Word)
 
 static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
@@ -80,6 +81,55 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
 	return !!state->sym;
 }
 
+/* DW_AT_decl_file -> struct srcfile */
+static struct cache srcfile_cache;
+
+static bool is_definition_private(Dwarf_Die *die)
+{
+	Dwarf_Word filenum;
+	Dwarf_Files *files;
+	Dwarf_Die cudie;
+	const char *s;
+	int res;
+
+	/*
+	 * Definitions in .c files cannot change the public ABI,
+	 * so consider them private.
+	 */
+	if (!get_udata_attr(die, DW_AT_decl_file, &filenum))
+		return false;
+
+	res = cache_get(&srcfile_cache, filenum);
+	if (res >= 0)
+		return !!res;
+
+	if (!dwarf_cu_die(die->cu, &cudie, NULL, NULL, NULL, NULL, NULL, NULL))
+		error("dwarf_cu_die failed: '%s'", dwarf_errmsg(-1));
+
+	if (dwarf_getsrcfiles(&cudie, &files, NULL))
+		error("dwarf_getsrcfiles failed: '%s'", dwarf_errmsg(-1));
+
+	s = dwarf_filesrc(files, filenum, NULL, NULL);
+	if (!s)
+		error("dwarf_filesrc failed: '%s'", dwarf_errmsg(-1));
+
+	s = strrchr(s, '.');
+	res = s && !strcmp(s, ".c");
+	cache_set(&srcfile_cache, filenum, res);
+
+	return !!res;
+}
+
+static bool is_kabi_definition(Dwarf_Die *die)
+{
+	bool value;
+
+	if (get_flag_attr(die, DW_AT_declaration, &value) && value)
+		return false;
+
+	return !is_definition_private(die);
+}
+
 /*
  * Type string processing
  */
@@ -456,19 +506,27 @@ static void __process_structure_type(struct state *state, struct die *cache,
 				     die_callback_t process_func,
 				     die_match_callback_t match_func)
 {
+	bool expand;
+
 	process(cache, type);
 	process_fqn(cache, die);
 	process(cache, " {");
 	process_linebreak(cache, 1);
 
-	check(process_die_container(state, cache, die, process_func,
-				    match_func));
+	expand = state->expand.expand && is_kabi_definition(die);
+
+	if (expand) {
+		check(process_die_container(state, cache, die, process_func,
+					    match_func));
+	}
 
 	process_linebreak(cache, -1);
 	process(cache, "}");
 
-	process_byte_size_attr(cache, die);
-	process_alignment_attr(cache, die);
+	if (expand) {
+		process_byte_size_attr(cache, die);
+		process_alignment_attr(cache, die);
+	}
 }
 
 #define DEFINE_PROCESS_STRUCTURE_TYPE(structure)                        \
@@ -553,6 +611,30 @@ static void process_cached(struct state *state, struct die *cache,
 	}
 }
 
+static void state_init(struct state *state)
+{
+	state->expand.expand = true;
+	cache_init(&state->expansion_cache);
+}
+
+static void expansion_state_restore(struct expansion_state *state,
+				    struct expansion_state *saved)
+{
+	state->expand = saved->expand;
+}
+
+static void expansion_state_save(struct expansion_state *state,
+				 struct expansion_state *saved)
+{
+	expansion_state_restore(saved, state);
+}
+
+static bool is_expanded_type(int tag)
+{
+	return tag == DW_TAG_class_type || tag == DW_TAG_structure_type ||
+	       tag == DW_TAG_union_type || tag == DW_TAG_enumeration_type;
+}
+
 #define PROCESS_TYPE(type)                                \
 	case DW_TAG_##type##_type:                        \
 		process_##type##_type(state, cache, die); \
@@ -560,18 +642,39 @@ static void process_cached(struct state *state, struct die *cache,
 
 static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 {
+	enum die_state want_state = DIE_COMPLETE;
 	struct die *cache;
+	struct expansion_state saved;
 	int tag = dwarf_tag(die);
 
+	expansion_state_save(&state->expand, &saved);
+
 	/*
-	 * If we have the DIE already cached, use it instead of walking
+	 * Structures and enumeration types are expanded only once per
+	 * exported symbol. This is sufficient for detecting ABI changes
+	 * within the structure.
+	 */
+	if (is_expanded_type(tag)) {
+		if (cache_was_expanded(&state->expansion_cache, die->addr))
+			state->expand.expand = false;
+
+		if (state->expand.expand)
+			cache_mark_expanded(&state->expansion_cache, die->addr);
+		else
+			want_state = DIE_UNEXPANDED;
+	}
+
+	/*
+	 * If we have want_state already cached, use it instead of walking
 	 * through DWARF.
 	 */
-	cache = die_map_get(die, DIE_COMPLETE);
+	cache = die_map_get(die, want_state);
 
-	if (cache->state == DIE_COMPLETE) {
+	if (cache->state == want_state) {
 		process_cached(state, cache, die);
 		die_map_add_die(parent, cache);
+
+		expansion_state_restore(&state->expand, &saved);
 		return 0;
 	}
 
@@ -612,9 +715,10 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 
 	/* Update cache state and append to the parent (if any) */
 	cache->tag = tag;
-	cache->state = DIE_COMPLETE;
+	cache->state = want_state;
 	die_map_add_die(parent, cache);
 
+	expansion_state_restore(&state->expand, &saved);
 	return 0;
 }
 
@@ -676,11 +780,14 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
 		if (!match_export_symbol(&state, die))
 			return 0;
 
+		state_init(&state);
+
 		if (tag == DW_TAG_subprogram)
 			process_subprogram(&state, &state.die);
 		else
 			process_variable(&state, &state.die);
 
+		cache_free(&state.expansion_cache);
 		return 0;
 	}
 	default:
@@ -692,4 +799,6 @@ void process_cu(Dwarf_Die *cudie)
 {
 	check(process_die_container(NULL, NULL, cudie, process_exported_symbols,
 				    match_all));
+
+	cache_free(&srcfile_cache);
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 1796f71b3a34..941c4134da8e 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -102,6 +102,7 @@ void symbol_free(void);
 
 enum die_state {
 	DIE_INCOMPLETE,
+	DIE_UNEXPANDED,
 	DIE_COMPLETE,
 	DIE_LAST = DIE_COMPLETE
 };
@@ -131,6 +132,7 @@ static inline const char *die_state_name(enum die_state state)
 {
 	switch (state) {
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
+	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
 	}
 
@@ -153,16 +155,60 @@ void die_map_add_linebreak(struct die *pd, int linebreak);
 void die_map_add_die(struct die *pd, struct die *child);
 void die_map_free(void);
 
+/*
+ * cache.c
+ */
+
+#define CACHE_HASH_BITS 10
+
+/* A cache for addresses we've already seen. */
+struct cache {
+	HASHTABLE_DECLARE(cache, 1 << CACHE_HASH_BITS);
+};
+
+void cache_set(struct cache *cache, unsigned long key, int value);
+int cache_get(struct cache *cache, unsigned long key);
+void cache_init(struct cache *cache);
+void cache_free(struct cache *cache);
+
+static inline void __cache_mark_expanded(struct cache *cache, uintptr_t addr)
+{
+	cache_set(cache, addr, 1);
+}
+
+static inline bool __cache_was_expanded(struct cache *cache, uintptr_t addr)
+{
+	return cache_get(cache, addr) == 1;
+}
+
+static inline void cache_mark_expanded(struct cache *cache, void *addr)
+{
+	__cache_mark_expanded(cache, (uintptr_t)addr);
+}
+
+static inline bool cache_was_expanded(struct cache *cache, void *addr)
+{
+	return __cache_was_expanded(cache, (uintptr_t)addr);
+}
+
 /*
  * dwarf.c
  */
 
+struct expansion_state {
+	bool expand;
+};
+
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
 
 	/* List expansion */
 	bool first_list_item;
+
+	/* Structure expansion */
+	struct expansion_state expand;
+	struct cache expansion_cache;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.1.613.gc27f4b7a9f-goog


