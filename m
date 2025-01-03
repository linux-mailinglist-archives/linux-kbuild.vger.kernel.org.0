Return-Path: <linux-kbuild+bounces-5358-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1CA00F00
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 21:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88021646EE
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 20:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D5A1C5F05;
	Fri,  3 Jan 2025 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cvVBfpc7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2011C3F3B
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jan 2025 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937161; cv=none; b=BJ0vjpffLWrvmIeTh9mBX/IJxmDvqyvzeY4ljE+Plo/yR7ZCfXcHCihCMoYyEXle9Vc8/2ift3d84mNUJLm65l6utWvhsMwgQKafYyeMCSLxqciBJZSpu38sXtsodzlOISUcEbxTNJ/7E8cBhnmtR1tPgdKZkocwb+9vYRW3MGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937161; c=relaxed/simple;
	bh=dvuUA3B6USfgxNyOUC1rE7HluY9N6X+YJCbsWpYa2eA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DAmdOuB2P1n+6MKpgWOpSxz2XOB52mL4ICkdYP9lf05RSJdQCRjkE65Z3ED67bRTtc4v6xbqeLYP4CAuNhitRVeYDPkHQBgw0GGz58DNpReKRKTX32J3+wlhi5sv6HW/rfcimf7TStWH7t+PzDgy6pM5tI1VwjwTs8+gCXUp33g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cvVBfpc7; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2164861e1feso172414135ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jan 2025 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937149; x=1736541949; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rUUeBhr/XftIxo5nShGbrucXNy5piFLfIDtOuXUslzs=;
        b=cvVBfpc7MjPb897b0NuX0e1MGuu6Vm5c+vy0rc0OrnXWzr4EisZvI8JAw8tUe3PdSO
         EUpR5wAM2FpLvwocSXeZgUbXGtO9iL79FttdJZnm0BVDFZmFj9IuseW35FQpXSaHSUuQ
         hpmtNLAiLrnxigBhuYzsQROFSdVGbMBKX5Wn9LjFvaFazWmXJNA10ZHiG6OCbK/vMeZK
         NMGF0eAONVzxp67CnqUcxoTftakX+91s5tE7pk39/KUJme1CzQ70I9BIlOXMqBmf7L5u
         4fGmtk3/3h6MzlQnI+v6+lWakwu08YRbLTpAv7x0RAmd6TYd3o+uY0JEB+L3T98FC9iE
         BYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937149; x=1736541949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUUeBhr/XftIxo5nShGbrucXNy5piFLfIDtOuXUslzs=;
        b=NqlvNCb3EgOGmlRMd599Q6PMNUm/41WtXT+T2pszhNQp1QoeJNPzCCAbUF9DdB4bDl
         d6pEgxd7Sk+srte1U9mAa52QfMvXUpSJPilmdm5+TfUdFt3gcHxdlDDp4yslO1prl1C7
         iX0ZjVsU9tjGgPzYPlilRWjR5zJKLpFxy9hmj3FA+MWcRvdn+geV/Xm43JPNtRC//yD9
         VAAgW1hoQLB29+2/jEF6tGqrdImQV6wvnP8vQ7pEXR7snSgn7uTFamYgO8UZJGHYykaV
         zkHAubaZMNkEdlxQdHP7ZetwBm05yhzfB3vM7bewFrh8iUO/I9MPxAY39GAb2V/gJHYB
         uXgg==
X-Forwarded-Encrypted: i=1; AJvYcCVdQvpDab1SyqffE7IbAkPae7+eDHdX639Uxj38FCibDhAVVfoYISKALXTXTgobJXxwURTl0FqsxgLhMVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNKbbynG0HY2M4JpHwY5WPxBiFiGHH40CMjCNgBEIZ+b6S/Uw2
	YAn99/M1okD0rQTSWakmZV5LF9E421YdemVJeJcjcb7pv4gkIpzXr/1SM0PraIY2K938zTTXwnH
	ruZcteZTd/c1WU269atP2qwGsMQ==
X-Google-Smtp-Source: AGHT+IF+10y6rqNXDeGj0m1YrtSQXHRmyx79tS7JdQus6ha0m1FuNpZf9fG4NII1ks8ONYLP3DKwg/5764GrVj3jjA0=
X-Received: from pfaw12.prod.google.com ([2002:a05:6a00:ab8c:b0:728:e1a0:2e73])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:6f0b:b0:72a:bc6a:3a87 with SMTP id d2e1a72fcca58-72abdbd6e05mr66050996b3a.0.1735937149255;
 Fri, 03 Jan 2025 12:45:49 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:31 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10472; i=samitolvanen@google.com;
 h=from:subject; bh=dvuUA3B6USfgxNyOUC1rE7HluY9N6X+YJCbsWpYa2eA=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPmnzNs0sEN0ftHWF6T0puYx9W+4vfj8vjLv+5d0rU
 XEuWUkbOkpZGMQ4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBEzuUzMtzPfab/bat3a/6T
 mVG3dpfMPOq3sb06KmdP/m23RRtXds5gZJj0fu1T7/zVy9KDbdW2v93+0Ky5/MPkrNWG86L/sHb v+sIEAA==
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-29-samitolvanen@google.com>
Subject: [PATCH v8 09/18] gendwarfksyms: Limit structure expansion
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


