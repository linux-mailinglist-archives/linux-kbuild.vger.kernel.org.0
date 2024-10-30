Return-Path: <linux-kbuild+bounces-4417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E99B6A64
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00DEB2817D8
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9BB229134;
	Wed, 30 Oct 2024 17:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tb0JE01M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684DB228B58
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307704; cv=none; b=sJD1yrdcRWaDT0H82qMKyznd2dmNdgcpsifaUz3pLHKtGM7P/YE+5LTqTTmZ1FjmjRDp/hntVqHsAs5tb2Qi6WhHFlF3L5KckMqfNLP/8x3wJJZGIQrs5pehl6C47G2admx2C1GZTdf0dDwYIdGW2U2bwq2OE1oGkQRXwH5lJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307704; c=relaxed/simple;
	bh=jz4OqGSqdykaeaYVxTVMbv9ETE/RlcvzTo1yK+d3V8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hwssi/I+Ya0V3SUJA8pRqQc1WnMsL0YvVr3YNgDsrmkQxFwG2MAxKlOANckp02iWewFtJIg91MpWIXbHEUS74X8r1DsLqMcWNDSR4ozKmvttNEgWgMnn+40d34UibB9qg6T87bvXlFzBEwyI6T2ScETn5ep6bwtt+3STiKJLbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tb0JE01M; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea258fe4b6so51034607b3.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307700; x=1730912500; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ya57kHey92WdnN8H51ZJGBOKXIv+w0nzQyUSQYLXyU=;
        b=Tb0JE01MB73m/SlHC1bRRAmUA6fB9VGSDCLIVinv4fHa85dJRrQAWZVKOkcqqLIWXg
         xAZ18mw8PZoOscw2cNV/ctNg6qeVVyoM37isypVmIGrBYbaWBoX4F1vJTS7Qj9UUouLV
         lTfTu/ygJIqe/0dvS5ZwUlIq4TUWa8uZ8U4J1rMjWQ0pqWYoameS0HXFoZhOOHTFTIVp
         q2DH1+FbrIwSYwrv1+MVbyI5benoWUruPCKQ62JHfsjgtRePVTBJZzHXAhGL2wz8XbCw
         MEHiq215A7FaBJ5xfyRewd28Vc9039DRONJLVjAdSMHHiS/E/o6u8yolLVCvKD/az8eB
         Za/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307700; x=1730912500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ya57kHey92WdnN8H51ZJGBOKXIv+w0nzQyUSQYLXyU=;
        b=vgMUdj+ivRJ0euEkGLU1hoUfD4kRymM/zRSrVpT1X5PZL3e39qp6rXkCWk0UAoTY3q
         16nnH25UMnkR2MDvyybQqWfm/7ykKKQ4py1Js6VB3hBYxCWqD1TXFx8xVeRR1AktOYUv
         y5jJdtqs+MmgH7nv3IjE+3V5vqVOzW4yElaggpoHjaZSZM+3Y3tRrujEj1oKa5CSeZTM
         2zwtfM+GuK3gQWuTYAcDJy6uuHflIbRgKyCw9nZH85gfEwFnDufT6vU+1vLedzpEKzRP
         cng5bqfvLHR71g68u869lwaIFFQXCCOI4rFOl3ZhcsgLGvBHAUB5wgLTklV6L58FIvRK
         bLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqzYUHzo4BVBqDvq+dTuMb0Ama5vy5SrwsP7lyswSeROJ81QThikIz+f3XZI2o0Vo7Tkd+N1Vwo/v51Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmJTVb7zRhgf6q2Qc3EKh2q/re9Z4xnO9YoxRJkog+9kr50OJQ
	Y8U3LEQt5TyDyrM7yv8hRF/QHmcAiCs7it/78cAYxu244wyrCiBJouZeWjSCsIV9CHB+A+Hhvn8
	j+Ufd3INQIXNdxwEnGVf31UXuXg==
X-Google-Smtp-Source: AGHT+IHDRaW34vtNX5zSmYETpGcA+cCtNzN/UmXLNuslzxu6qN56j45I3hw8HDZrFE9QY01UGCp48ZzZHMdPvbhchAk=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:add3:0:b0:e30:cac7:5b70 with SMTP
 id 3f1490d57ef6-e30cc37c0a9mr4772276.11.1730307700388; Wed, 30 Oct 2024
 10:01:40 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:17 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10017; i=samitolvanen@google.com;
 h=from:subject; bh=jz4OqGSqdykaeaYVxTVMbv9ETE/RlcvzTo1yK+d3V8o=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaeEzbbnuK3mfWG1q4G2uY7bxL8sChuh74gv52S5P2
 LR59YvMjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRKWyMDIv4zrQ3lcdZG7H+
 2n7kPfd2+wMcj1/4Tj/LUqG5Lmh+pgvDP4sC07t8J/je6v2a6RrwieHrDvt/z47fyfpSdydoZoc 5HxcA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-31-samitolvanen@google.com>
Subject: [PATCH v5 10/19] gendwarfksyms: Limit structure expansion
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
otherwise result in infinite recursion, but is still sufficient for
catching ABI changes.

For pointers, limit structure expansion after the first pointer
in the symbol type. This should be plenty for detecting ABI
differences, but it stops us from pulling in half the kernel for
types that contain pointers to large kernel data structures, like
task_struct, for example.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/cache.c         |  44 +++++++++++
 scripts/gendwarfksyms/dwarf.c         | 109 ++++++++++++++++++++++++--
 scripts/gendwarfksyms/gendwarfksyms.h |  37 +++++++++
 4 files changed, 183 insertions(+), 8 deletions(-)
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
index 000000000000..2f1517133a20
--- /dev/null
+++ b/scripts/gendwarfksyms/cache.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+struct expanded {
+	uintptr_t addr;
+	struct hlist_node hash;
+};
+
+void __cache_mark_expanded(struct expansion_cache *ec, uintptr_t addr)
+{
+	struct expanded *es;
+
+	es = xmalloc(sizeof(struct expanded));
+	es->addr = addr;
+	hash_add(ec->cache, &es->hash, addr_hash(addr));
+}
+
+bool __cache_was_expanded(struct expansion_cache *ec, uintptr_t addr)
+{
+	struct expanded *es;
+
+	hash_for_each_possible(ec->cache, es, hash, addr_hash(addr)) {
+		if (es->addr == addr)
+			return true;
+	}
+
+	return false;
+}
+
+void cache_clear_expanded(struct expansion_cache *ec)
+{
+	struct hlist_node *tmp;
+	struct expanded *es;
+
+	hash_for_each_safe(ec->cache, es, tmp, hash) {
+		free(es);
+	}
+
+	hash_init(ec->cache);
+}
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 98191ca7cef0..cf929d6808be 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -26,6 +26,7 @@ static void process_linebreak(struct die *cache, int n)
 		       !dwarf_form##attr(&da, value);                  \
 	}
 
+DEFINE_GET_ATTR(flag, bool)
 DEFINE_GET_ATTR(udata, Dwarf_Word)
 
 static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
@@ -79,6 +80,13 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
 	return !!state->sym;
 }
 
+static bool is_declaration(Dwarf_Die *die)
+{
+	bool value;
+
+	return get_flag_attr(die, DW_AT_declaration, &value) && value;
+}
+
 /*
  * Type string processing
  */
@@ -455,19 +463,27 @@ static void __process_structure_type(struct state *state, struct die *cache,
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
@@ -552,6 +568,42 @@ static void process_cached(struct state *state, struct die *cache,
 	}
 }
 
+static void state_init(struct state *state)
+{
+	state->expand.expand = true;
+	state->expand.ptr_depth = 0;
+	state->expand.ptr_expansion_depth = 0;
+	hash_init(state->expansion_cache.cache);
+}
+
+static void expansion_state_restore(struct expansion_state *state,
+				    struct expansion_state *saved)
+{
+	state->expand = saved->expand;
+	state->ptr_depth = saved->ptr_depth;
+	state->ptr_expansion_depth = saved->ptr_expansion_depth;
+}
+
+static void expansion_state_save(struct expansion_state *state,
+				 struct expansion_state *saved)
+{
+	expansion_state_restore(saved, state);
+}
+
+static bool is_pointer_type(int tag)
+{
+	return tag == DW_TAG_pointer_type || tag == DW_TAG_reference_type;
+}
+
+static bool is_expanded_type(int tag)
+{
+	return tag == DW_TAG_class_type || tag == DW_TAG_structure_type ||
+	       tag == DW_TAG_union_type || tag == DW_TAG_enumeration_type;
+}
+
+/* The maximum depth for expanding structures in pointers */
+#define MAX_POINTER_EXPANSION_DEPTH 2
+
 #define PROCESS_TYPE(type)                                \
 	case DW_TAG_##type##_type:                        \
 		process_##type##_type(state, cache, die); \
@@ -559,18 +611,55 @@ static void process_cached(struct state *state, struct die *cache,
 
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
+	 *
+	 * We fully expand the first pointer reference in the exported
+	 * symbol, but limit the expansion of further pointer references
+	 * to at most MAX_POINTER_EXPANSION_DEPTH levels.
+	 */
+	if (is_pointer_type(tag))
+		state->expand.ptr_depth++;
+
+	if (is_expanded_type(tag)) {
+		if (cache_was_expanded(&state->expansion_cache, die->addr))
+			state->expand.expand = false;
+
+		if (state->expand.ptr_depth > 0) {
+			if (state->expand.ptr_expansion_depth >=
+			    MAX_POINTER_EXPANSION_DEPTH)
+				state->expand.expand = false;
+
+			if (state->expand.expand)
+				state->expand.ptr_expansion_depth++;
+		}
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
 
@@ -611,9 +700,10 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 
 	/* Update cache state and append to the parent (if any) */
 	cache->tag = tag;
-	cache->state = DIE_COMPLETE;
+	cache->state = want_state;
 	die_map_add_die(parent, cache);
 
+	expansion_state_restore(&state->expand, &saved);
 	return 0;
 }
 
@@ -675,11 +765,14 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
 		if (!match_export_symbol(&state, die))
 			return 0;
 
+		state_init(&state);
+
 		if (tag == DW_TAG_subprogram)
 			process_subprogram(&state, &state.die);
 		else
 			process_variable(&state, &state.die);
 
+		cache_clear_expanded(&state.expansion_cache);
 		return 0;
 	}
 	default:
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 8e087a5d58e2..da28a35d19b2 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -105,6 +105,7 @@ void symbol_free(void);
 
 enum die_state {
 	DIE_INCOMPLETE,
+	DIE_UNEXPANDED,
 	DIE_COMPLETE,
 	DIE_LAST = DIE_COMPLETE
 };
@@ -134,6 +135,7 @@ static inline const char *die_state_name(enum die_state state)
 {
 	switch (state) {
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
+	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
 	}
 
@@ -156,9 +158,40 @@ void die_map_add_linebreak(struct die *pd, int linebreak);
 void die_map_add_die(struct die *pd, struct die *child);
 void die_map_free(void);
 
+/*
+ * cache.c
+ */
+
+#define EXPANSION_CACHE_HASH_BITS 11
+
+/* A cache for addresses we've already seen. */
+struct expansion_cache {
+	HASHTABLE_DECLARE(cache, 1 << EXPANSION_CACHE_HASH_BITS);
+};
+
+void __cache_mark_expanded(struct expansion_cache *ec, uintptr_t addr);
+bool __cache_was_expanded(struct expansion_cache *ec, uintptr_t addr);
+
+static inline void cache_mark_expanded(struct expansion_cache *ec, void *addr)
+{
+	__cache_mark_expanded(ec, (uintptr_t)addr);
+}
+
+static inline bool cache_was_expanded(struct expansion_cache *ec, void *addr)
+{
+	return __cache_was_expanded(ec, (uintptr_t)addr);
+}
+
+void cache_clear_expanded(struct expansion_cache *ec);
+
 /*
  * dwarf.c
  */
+struct expansion_state {
+	bool expand;
+	unsigned int ptr_depth;
+	unsigned int ptr_expansion_depth;
+};
 
 struct state {
 	struct symbol *sym;
@@ -166,6 +199,10 @@ struct state {
 
 	/* List expansion */
 	bool first_list_item;
+
+	/* Structure expansion */
+	struct expansion_state expand;
+	struct expansion_cache expansion_cache;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.163.g1226f6d8fa-goog


