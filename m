Return-Path: <linux-kbuild+bounces-3964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF01B9956E3
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F0C1C217A8
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C5D218D7D;
	Tue,  8 Oct 2024 18:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="muF1cMxq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024B2185A3
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412738; cv=none; b=l/W8YBPGDLphjjZ9HBY5R6umX9sM66uIthYpCabAFkICC4XpeyyKMqxjNMt/qvFFn+457Pm+diTvFuxtNjVpU83O1bW7ftJjWTNEwnrwfWTPOeDzj+NgMh8AEl2MRCxH1YJ2+pvHxa2gVh1sPmaQVVGVOROioJnH8qUpte3FeMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412738; c=relaxed/simple;
	bh=Gpj7JEsBTlGFIdj3OdN4lasC11o2stRy6hap+Dbg4ts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WXhaTGlH2ScGM6fmJFy7XbjDr4n9dMARpJoZT0MB66041bAS6xsmkx29CjhHMJTzWyTye/AyeR4Gr2Cs8HuXL4MOfABrlfm7RY/c4lfaI5ByQmMcGe/tJY9coxdd4JqjBug6dC5Qd0MbKqrXJqcdG09gqlnQCyLiu247nYLco0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=muF1cMxq; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so9521763276.2
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412735; x=1729017535; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VMEPli1l6MBGDJ/OEAGe+Qz5+9aaFjquQDP4ULAQ6b8=;
        b=muF1cMxqwwYioSUSmLVTLnYOV4dZGNXKiX/iNm7KfMqvBqVH+LS5L5TSAcCOq+MLpo
         uA24nWDv3MWKhB10ufahLB4FdzQ5tu9Wo7wWIarRJkJg4DkgH7QI3ZZ+RFtvz2etbGE1
         U9403p5sbU7ocs339rE37NIHObvujrXKC+dEoruIlglGou8rk1qFXEHYbZ8zl7AYIjNp
         dGfzQWlGwXRvSeFqnosz+m+Ri+bf2TvlMCj0hCEQ/LyJyH80Edj7oMuwduFdWMeIAhPc
         IOzhqgS7P5swd5nNXf+ows0/KksJS+HFkogTwWNfgm9stiNsjRWwNRHAICNa6pAT/Qoq
         s2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412735; x=1729017535;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMEPli1l6MBGDJ/OEAGe+Qz5+9aaFjquQDP4ULAQ6b8=;
        b=N9C47oZGll4uCjzu9S6KJ1SA7RJ/IH9OSlMQVVGGkHw8SxkUi+sH5rxeWnaUCICbYv
         G6dneAcy+lxFWnwadhOI9e1C0IIUu/oARvghaJIYhpGajLjoJ9pg1M1i0BYZj3rk7Qzw
         Oa1hs/VRp28QPPlPocZrVj8T41z0y//+p7ZY6qx0AoXDq6jNBP9dpieYJkPbIRw4y7ZZ
         3XadrCZIBwlTWZs6jWkwZiqGFiT10M5lZ/r1IbeCAB0bgh1xwS5Z4EtJR6Z9Qeunwrkd
         97Ttk/mWteUS19+28euAtUahFLHPWtC2sF5UG/pum6vwl93ukCNBGc2xBtKW9DmO8/qd
         7xcg==
X-Forwarded-Encrypted: i=1; AJvYcCVs7CsydEe3+rBy4aBs9MQ9x6UXtFbkQvzMTjmjemPtoj4i1hFaUQHWVDfCMMsUrZVUBOOLcJqEZ/MGrGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDWWxVjEw6Z8SIT4rO9BhiyKAj71e152ChkxKVuoJPpVXPWQT
	dvrSf8E4t+Ndfsi5qqJMqZ+nW/hF3B8U6AH08hmsQpJ0sqbeAVYb7t7RvsbKUm5HnFS8aND+ajk
	3/9lzXRqqu1kFlHaQDmKlG/kJUQ==
X-Google-Smtp-Source: AGHT+IGv62YsZO0lr1qcYP2143ECESrSbnTFI5nvZIA9vuAPPCeUKCv++zuF+N3AbUfwBBFTZQCNE/wVbuxsksfPTiw=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a5b:a4c:0:b0:e28:f454:7de5 with SMTP
 id 3f1490d57ef6-e28fe52740fmr6276.6.1728412734731; Tue, 08 Oct 2024 11:38:54
 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:34 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10495; i=samitolvanen@google.com;
 h=from:subject; bh=Gpj7JEsBTlGFIdj3OdN4lasC11o2stRy6hap+Dbg4ts=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNao/W2x8M+8fMKiK//jsfeebtA7NPfIbQq+dY2z5+
 pbp67HZHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAimqUM/5M+TurdaC4u7xkm
 +urkv0fbJGsZtFpjUz5+8HyWdTZQiI2R4TRvjqF2pH9BYMi2+4d3L2K2/nxuX3BNv9akJ/We02u vMwMA
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-31-samitolvanen@google.com>
Subject: [PATCH v4 10/19] gendwarfksyms: Limit structure expansion
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
 scripts/gendwarfksyms/dwarf.c         | 109 +++++++++++++++++++++++---
 scripts/gendwarfksyms/gendwarfksyms.h |  37 +++++++++
 4 files changed, 182 insertions(+), 9 deletions(-)
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
index f5cebbdcc212..51dd8e82f9e7 100644
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
@@ -455,19 +463,28 @@ static void __process_structure_type(struct state *state, struct die *cache,
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
@@ -520,7 +537,7 @@ static void process_unspecified_type(struct state *state, struct die *cache,
 				     Dwarf_Die *die)
 {
 	/*
-	 * These can be emitted for stand-elone assembly code, which means we
+	 * These can be emitted for stand-alone assembly code, which means we
 	 * might run into them in vmlinux.o.
 	 */
 	process(cache, "unspecified_type");
@@ -552,6 +569,42 @@ static void process_cached(struct state *state, struct die *cache,
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
@@ -559,18 +612,52 @@ static void process_cached(struct state *state, struct die *cache,
 
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
 
@@ -611,9 +698,10 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 
 	/* Update cache state and append to the parent (if any) */
 	cache->tag = tag;
-	cache->state = DIE_COMPLETE;
+	cache->state = want_state;
 	die_map_add_die(parent, cache);
 
+	expansion_state_restore(&state->expand, &saved);
 	return 0;
 }
 
@@ -675,11 +763,14 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
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
index f317de5b0653..6147859ae2af 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -104,6 +104,7 @@ struct symbol *symbol_get(const char *name);
 
 enum die_state {
 	DIE_INCOMPLETE,
+	DIE_UNEXPANDED,
 	DIE_COMPLETE,
 	DIE_LAST = DIE_COMPLETE
 };
@@ -133,6 +134,7 @@ static inline const char *die_state_name(enum die_state state)
 {
 	switch (state) {
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
+	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
 	}
 
@@ -155,9 +157,40 @@ void die_map_add_linebreak(struct die *pd, int linebreak);
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
@@ -165,6 +198,10 @@ struct state {
 
 	/* List expansion */
 	bool first_list_item;
+
+	/* Structure expansion */
+	struct expansion_state expand;
+	struct expansion_cache expansion_cache;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.rc0.187.ge670bccf7e-goog


