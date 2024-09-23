Return-Path: <linux-kbuild+bounces-3679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7197F06F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 20:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A7E3B21ABF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 18:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F215101DE;
	Mon, 23 Sep 2024 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3dug4bp8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A61A305C
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115569; cv=none; b=b1NMD99XEOoFt+jimerMFHqIF53u+rGRbYlJkfs9ISU0vWCUpXtTpz5i/925k8tt/3SG+wX61FroVDGXGNqCsFZrbIFOI+kceahZsFULiRgnei4zkZ7zeBfZgYcE7oaWy35Pjtymz8X/KSeJQjeqvtY7oPYBZXE/ofY0/+PSwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115569; c=relaxed/simple;
	bh=F+Slq6plceRzR9rmq0FI3V1NpzM62BS5pOj+D4AGsN4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CxM3x39t8TG8Tm14rV87JmzT+0JEt0sJA1A7oTtIzufEwrBlG+PMcuwvsLg/JwGxJImOYwXh86/dqT4V62nYr6+WmRk2z6FTdekrP7OE+UQDSRhAN7w7HXteop1NpQORLBJsEjQa8mtpYq046KWrXOycxLJGIiKBRQ4nasRIcvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3dug4bp8; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so17623657b3.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115566; x=1727720366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DB+9TXTkpzmpJhLs8qE2orQTUzZeD2kPnUO93xvC9pc=;
        b=3dug4bp8tvUYOx46NOIX/g3cceqG5Fpqr7i6d8ZAO1VtLxzwXMDGFqYrElDCZ4fvc0
         MFMS1knxgr/+yCMF5zHdjbvvjss6U2nTQGnVFxd2017yh+XPX6XHSPEbxPEYCnT2ZJF3
         o1jyqFuM0MxteU4xoBKJAoTo41PzGfHWkF1RrL1TtNxCl2cyAJ5aBhayFcdkq57T9WEI
         2yNb24af6cwwZ3oeqcMu3s1TChGRnEIBc1AKywIUe/lrsavXrNAfoNysfEmbEjDn8diG
         fBvLEsH2iSPJ+u9FHepaLyZRMvUSon6lxxELyJjyvKbWIFPnuexBD2ZLmPnpDfYMfMIO
         TQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115566; x=1727720366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DB+9TXTkpzmpJhLs8qE2orQTUzZeD2kPnUO93xvC9pc=;
        b=Kyotuq5Fry6woYRViF7xwmY7VADmyq4HqfHxIoTKA5V+vLryDzepgbq64i2S0coO7e
         01v4erheURGghpuGEcR4DuVGUQrdegmtd2OnY7PYAyv93+DcuAgHLi6kZsmj7+PzdjeH
         hyRqCGR3gKRqsXpRsp3OY0MIiU8L4NzkNKMqF6VWZ1/IbaNK5G47OluYih9jBlZhcccz
         RT5iLGdi6uQ1IcBsnurLRAc9lStWViCFEpTKMzMJYvQnuFY7ZTf7N4ZjlkSoDTt2ccDf
         kAAuwj0zqb+ju71cv3c2Cqwo+K3dCqqM+khE/dah7HWld3+p8ABjq0FxHlkRsIboEBSf
         j/QA==
X-Forwarded-Encrypted: i=1; AJvYcCXoCKw6Fz5tcTQRAY4e1hQOfVVfvMPufNWbV4xMnZQ7qCm7hDSllVzIJGxJBB8cH8Pv3uBEf6GJq4oLTtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWbu6hviY12K785/gBtBH6x4/Lclbde4Yg29BmGYBYtKeF6Yp2
	QjsMM4bMoK3CaqzuSE3jxbMm1cwOT9v3gWxn/lA36Wca4y6eg4MH9ujC9N7Y1qppYCbfe0r+Esa
	m9SoOqaSsDRAeLLSlZHd+WOQwQA==
X-Google-Smtp-Source: AGHT+IEptnJIfoI+HL/ej56BOwTnghewlaOMrPmw+bwPxXE+r6Tu/6fUqGd9RSHzZXz7q+UHJQ4Am7epXYilKK/Kka0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:688a:b0:6dd:bcce:7cd4 with
 SMTP id 00721157ae682-6dff270dc8cmr1011377b3.2.1727115565857; Mon, 23 Sep
 2024 11:19:25 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:57 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10094; i=samitolvanen@google.com;
 h=from:subject; bh=F+Slq6plceRzR9rmq0FI3V1NpzM62BS5pOj+D4AGsN4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN3LrGnDeL+04zlnxt7DqX5fZ9PW3lPOfL48srGW+E
 LY065lDRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjI0xWMDB8X9J0PK+QIazj+
 13+ZM/duKaG599flO0w0qS/9ESAgq8vIsJ3vitaBZO41iX1z9W83fTl0/Gjb1vez7GceNK4/cH3 VWnYA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-33-samitolvanen@google.com>
Subject: [PATCH v3 11/20] gendwarfksyms: Limit structure expansion
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
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/cache.c         |  44 +++++++++++
 scripts/gendwarfksyms/dwarf.c         | 107 ++++++++++++++++++++++++--
 scripts/gendwarfksyms/gendwarfksyms.h |  37 +++++++++
 4 files changed, 181 insertions(+), 8 deletions(-)
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
index b7f1dc29cb9c..5fb9eadd782c 100644
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
@@ -452,19 +460,28 @@ static void __process_structure_type(struct state *state, struct die *cache,
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
+		cache_mark_expanded(&state->expansion_cache, die->addr);
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
@@ -549,6 +566,42 @@ static void process_cached(struct state *state, struct die *cache,
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
@@ -556,18 +609,52 @@ static void process_cached(struct state *state, struct die *cache,
 
 static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 {
+	enum die_state want_state = DIE_COMPLETE;
 	struct die *cache;
+	struct expansion_state saved;
 	int tag = dwarf_tag(die);
 
+	expansion_state_save(&state->expand, &saved);
+
+	/*
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
+	if (state->expand.ptr_depth > 0 && is_expanded_type(tag)) {
+		if (state->expand.ptr_expansion_depth >=
+			    MAX_POINTER_EXPANSION_DEPTH ||
+		    cache_was_expanded(&state->expansion_cache, die->addr))
+			state->expand.expand = false;
+
+		if (state->expand.expand)
+			state->expand.ptr_expansion_depth++;
+	}
+
 	/*
-	 * If we have the DIE already cached, use it instead of walking
+	 * If we have want_state already cached, use it instead of walking
 	 * through DWARF.
 	 */
-	cache = die_map_get(die, DIE_COMPLETE);
+	if (!state->expand.expand && is_expanded_type(tag))
+		want_state = DIE_UNEXPANDED;
+
+	cache = die_map_get(die, want_state);
+
+	if (cache->state == want_state) {
+		if (want_state == DIE_COMPLETE && is_expanded_type(tag))
+			cache_mark_expanded(&state->expansion_cache, die->addr);
 
-	if (cache->state == DIE_COMPLETE) {
 		process_cached(state, cache, die);
 		die_map_add_die(parent, cache);
+
+		expansion_state_restore(&state->expand, &saved);
 		return 0;
 	}
 
@@ -608,9 +695,10 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 
 	/* Update cache state and append to the parent (if any) */
 	cache->tag = tag;
-	cache->state = DIE_COMPLETE;
+	cache->state = want_state;
 	die_map_add_die(parent, cache);
 
+	expansion_state_restore(&state->expand, &saved);
 	return 0;
 }
 
@@ -672,11 +760,14 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
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
index ad50e35e3351..16d4746aaef9 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -104,6 +104,7 @@ struct symbol *symbol_get(const char *name);
 
 enum die_state {
 	DIE_INCOMPLETE,
+	DIE_UNEXPANDED,
 	DIE_COMPLETE,
 	DIE_LAST = DIE_COMPLETE
 };
@@ -134,6 +135,7 @@ static inline const char *die_state_name(enum die_state state)
 	switch (state) {
 	default:
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
+	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
 	}
 }
@@ -154,9 +156,40 @@ void die_map_add_linebreak(struct die *pd, int linebreak);
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
@@ -164,6 +197,10 @@ struct state {
 
 	/* List expansion */
 	bool first_list_item;
+
+	/* Structure expansion */
+	struct expansion_state expand;
+	struct expansion_cache expansion_cache;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.46.0.792.g87dc391469-goog


