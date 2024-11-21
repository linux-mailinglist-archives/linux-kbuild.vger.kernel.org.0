Return-Path: <linux-kbuild+bounces-4775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F79D542A
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4BFC1F215F5
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D35A1DE8A6;
	Thu, 21 Nov 2024 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SUl207io"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBFA1DE4C9
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221774; cv=none; b=OEwYLFMGTTIZAxEeA7SapDnxkYI1/x6p15lVp0HP+xyNWACmTvWoEW7JOdAwOXRF+c46I/xz5JRvR+vREiNVQaCZ6erDlgyvZDZp7v6AUVxLKR6PqzGWEyrlrNE5RwDRAoaMg5sEjJd11bzE91uF/LZ6hbxt6o2sm0BjIMnxe6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221774; c=relaxed/simple;
	bh=0Y8pkFmBKWKmkeXL7oR1i75uVUGXc1J2v0ihg0pFsvw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OPgi5XjGk8T9yg5X28VjJNyJGeIaaPp31jCE435Xbx9xJ+u+JF0pzVmF7q7kXs5NV6h9JT4FW2jYhd4soSZTtIRDVw4KGifv5ZBCWsvV9es4a9oQeDhiOUdaDj56eAzi/NYj6OfTCyHVySj1NKMIChmE7yt27JYaPBoha7hL+kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SUl207io; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2971589916so2255851276.3
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221771; x=1732826571; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q5azjlSatcsILNEOwLs19EdjKbFua2p8W1Y3HIRQJu0=;
        b=SUl207iobr0TdExLkbBlYo4JbM5fjUTBN2qihqmj0z2SeENMHhR8N7VTh8ZzMk0DqT
         dV3m38gGPm4R3ikmEQ3LgCIWXShzIS+yiZkZYq4Npkb3E6A+Xl9KW8xonlS5G3wS6JAU
         92GIacTSAWatZ6okC8tJVxTXJUpC+5YInP/mKGAkxhUMfNK2ajw09zTDi/7tJk491tUL
         humjjMcsAaK3FbOB+DeueHmYD1NLyMstKQpLbMPp8Ow2MmU2i1Il6bTeklmKX3aeRTM3
         hJz2CkuyKPI6lrBaHk2lPVW1Ds6CjKCpNzSuS8t+/dskQ43PxeCyX4rYcZM1ZeJn3J6l
         UCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221771; x=1732826571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5azjlSatcsILNEOwLs19EdjKbFua2p8W1Y3HIRQJu0=;
        b=V1DETTAAzLEHop6foDnB00pw1LmzhktOiUgNRK5CTgT8s6cmuv6WNDgqIrvuXlheQi
         YHG344m9EuwajHS9HcZ5KWZIsCnvvw/nwcI9mD7TMVsd/9uHedAX81XUKj4Wb6EHZ99z
         nDNkkqfqv2n/bsCBZ5LGLq5N2kU9ouBCJSxtQET6Z6U8wPzGw26R92xcTvRBMvz7MMZN
         oS/neqQahONUAArKBXKIKUKeA6lrYC9lU+EG5n5Mp46akXIJOHkrhXSC2ujE7H5sZDE0
         10Ceao/URrOauhadlLmrAsIwFKDrCcQY2W6R7/VvfEt4XYZLRpvFnO4MWyKRjsajlaRl
         Htcg==
X-Forwarded-Encrypted: i=1; AJvYcCVraer/bO/Q9sQjw4vjBE/5REHPtBrwJhDG8Qmzwh6t6KJ+rywg16vY2z1lAe4hIQ0IAaUvAY20FG+YLXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFAj4/Ch8s0MgKMiWcDv8+6URp62dmA28XfJLpfveEn7BKIDU
	3wMk4ybS7Z9cpruGqP77NYz6u6If7N/TRuZEQkyBeRNz1/NrBnBL4V1WiwwYz2tIbDp9joTt5rV
	5j5zsH4h8wg708WdKm/cpjvIk0Q==
X-Google-Smtp-Source: AGHT+IHgq9XpTMYQNtf/KX084e49hvq9rsLmljwkPdv6gNljLLB41fg1reynmmiE/vgiVbx4alCO7ISYrjluh72vaJI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:6984:0:b0:e2b:cd55:11b3 with SMTP
 id 3f1490d57ef6-e38f8b9e6e4mr101276.5.1732221771249; Thu, 21 Nov 2024
 12:42:51 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:30 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10445; i=samitolvanen@google.com;
 h=from:subject; bh=0Y8pkFmBKWKmkeXL7oR1i75uVUGXc1J2v0ihg0pFsvw=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2sw3v/87eLtjAPt03Juag7ZG9LVw6pdWrlv6YuHtHb
 HDFpDflHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAiHWqMDC+fyp/OPHaJhzFN
 fsfMjeULdnaoTUu+IPt53sNtRqbfzhcw/BX/b/vq4Lyqw52qU/culGV38E5Ubr5zI94xq76Eac7 SIj4A
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-29-samitolvanen@google.com>
Subject: [PATCH v6 09/18] gendwarfksyms: Limit structure expansion
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
index 98191ca7cef0..3ea7583e6c3f 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -26,6 +26,7 @@ static void process_linebreak(struct die *cache, int n)
 		       !dwarf_form##attr(&da, value);                  \
 	}
 
+DEFINE_GET_ATTR(flag, bool)
 DEFINE_GET_ATTR(udata, Dwarf_Word)
 
 static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
@@ -79,6 +80,55 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
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
+static bool is_declaration(Dwarf_Die *die)
+{
+	bool value;
+
+	if (get_flag_attr(die, DW_AT_declaration, &value) && value)
+		return true;
+
+	return is_definition_private(die);
+}
+
 /*
  * Type string processing
  */
@@ -455,19 +505,27 @@ static void __process_structure_type(struct state *state, struct die *cache,
 				     die_callback_t process_func,
 				     die_match_callback_t match_func)
 {
+	bool is_decl;
+
 	process(cache, type);
 	process_fqn(cache, die);
 	process(cache, " {");
 	process_linebreak(cache, 1);
 
-	check(process_die_container(state, cache, die, process_func,
-				    match_func));
+	is_decl = is_declaration(die);
+
+	if (!is_decl && state->expand.expand) {
+		check(process_die_container(state, cache, die, process_func,
+					    match_func));
+	}
 
 	process_linebreak(cache, -1);
 	process(cache, "}");
 
-	process_byte_size_attr(cache, die);
-	process_alignment_attr(cache, die);
+	if (!is_decl && state->expand.expand) {
+		process_byte_size_attr(cache, die);
+		process_alignment_attr(cache, die);
+	}
 }
 
 #define DEFINE_PROCESS_STRUCTURE_TYPE(structure)                        \
@@ -552,6 +610,30 @@ static void process_cached(struct state *state, struct die *cache,
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
@@ -559,18 +641,39 @@ static void process_cached(struct state *state, struct die *cache,
 
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
 
@@ -611,9 +714,10 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 
 	/* Update cache state and append to the parent (if any) */
 	cache->tag = tag;
-	cache->state = DIE_COMPLETE;
+	cache->state = want_state;
 	die_map_add_die(parent, cache);
 
+	expansion_state_restore(&state->expand, &saved);
 	return 0;
 }
 
@@ -675,11 +779,14 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
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
@@ -691,4 +798,6 @@ void process_cu(Dwarf_Die *cudie)
 {
 	check(process_die_container(NULL, NULL, cudie, process_exported_symbols,
 				    match_all));
+
+	cache_free(&srcfile_cache);
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 2646e11595ab..7b29d8f07aa0 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -107,6 +107,7 @@ void symbol_free(void);
 
 enum die_state {
 	DIE_INCOMPLETE,
+	DIE_UNEXPANDED,
 	DIE_COMPLETE,
 	DIE_LAST = DIE_COMPLETE
 };
@@ -136,6 +137,7 @@ static inline const char *die_state_name(enum die_state state)
 {
 	switch (state) {
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
+	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
 	}
 
@@ -158,16 +160,60 @@ void die_map_add_linebreak(struct die *pd, int linebreak);
 void die_map_add_die(struct die *pd, struct die *child);
 void die_map_free(void);
 
+/*
+ * cache.c
+ */
+
+#define CACHE_HASH_BITS 11
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
2.47.0.371.ga323438b13-goog


