Return-Path: <linux-kbuild+bounces-3016-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 448CC953936
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 19:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58DF1F21FF1
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF301BDA87;
	Thu, 15 Aug 2024 17:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJ/Q/NG2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411A1BD00C
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743576; cv=none; b=j08EzncExnvJHYmVPvHbDT34ZR1EkdsxQuQS5+23rCks+Idag4+1NSA7MjTvoiTKKNLMiVWcj5pBjYCqiSgCH11svBRXg5vhsKa0kG0rX9wSqnHgKKQcXLNuruvcMsq0WgRDuJnlLGrQ8Wggua3yD6p1uxU1TFLx8ZlKj5onl20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743576; c=relaxed/simple;
	bh=IoI4F3wObxGX4LgHQUFQQdoaz1TRyk0IHL+WJGOTKzw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RHYggb2dDoE/It2aszRjI+QkbmUHbbcNWgKVyoY4ak09HVXzKhGFTgWq8JMuVHSlNPmVfF8etoyHuGFsJzCpB2i/nzq449mv8v+V/y8gnllxOpcLkhcWliMzncM/U1zrcR6l7P2ckLy14xZPZ93CgvuH3/CYqJ6ODSBVwVc1AN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJ/Q/NG2; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fd8a1a75e7so11184445ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743573; x=1724348373; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T2I7FT7XC1CLS96AVMtQrrnQsP2LCK4IFkNimJHZT1k=;
        b=NJ/Q/NG23shoJgIH4MFnTUtlo/Wzb8dxs3MJxGTTwa4M3vs4LwXRvmXjsQtOdybzzN
         lrktVN3e+wrqXOxihQApH12PH2WUNHeAD3cN6uSjQ7B0BG9ipl5xfO43vYlxfFbQgaNf
         irmfXXH40uXFEviIq3hbzz96RDaEDdZwa2G69ELQkmQcaAzbsbeJCL6dAN80UTFDVtyD
         yTjX/fphPJaAWH1gTXj6aoqsJSv3z3YEGqpXSmbMOUQKkAVRsE7yvgVBGMw8wbS8uMCX
         JUJZCSK0iEJmHo08lSGiM+xdV4AE8xt/kpC0bWnPmYrIP4hfj+MzEXrcQ81r5pB4AAXb
         oHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743573; x=1724348373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2I7FT7XC1CLS96AVMtQrrnQsP2LCK4IFkNimJHZT1k=;
        b=PdxeAK0VaxcNUJJlBRmttl22FNt7QUTIqCgjrAtOI/Pcf7MU2szhAEj0odnjlvkYOf
         w/K/PYL0T59iABIDYSmd95EYKkDWiXZ930YAf0WkTAOJIz9f0bUN6ZaE8Vm+D+IYk6O3
         r5WkB5mpnURfwqX8Xjbkm52c1deFHzEZ35zMtwDD7CQMg0rRDK5orHpu0XOgFOPaILd8
         ysLX6isbpqR4FRTorC8vV8ZeNw6KzTRiZ/VlMj2G4x63qV7mraNxqch1dhxYmaQFNzZP
         /iPbpaOg+LUlwyzOn6i7thucviWM01a3WD1RXALLvsPVJROTf5b2qJxgaMxzHHuSKaGP
         XM1g==
X-Forwarded-Encrypted: i=1; AJvYcCVgv5qob43BT4oBKRnOXxztBPDLZOicPPIphwDFGLblr6pHJZj9QS9mdEsUZOb/GDeC4k3Po0E3U5HcHjq41bVT/UaqyKcMk+f+dJt7
X-Gm-Message-State: AOJu0YytO1d/k+ytSoQ5Fzto9iULbepdrqqAOJg1GVVKzI8mxhrg7XIG
	dZhSawIyzCsJ6U+t9Kk+NFpnzokVf4eJ4m8a4vgoX9UHpJUiVcWOZPQfeIShgrm5D2BPuWhcodk
	yqkfWJjnHst/6MVfFzSEuz2wHqw==
X-Google-Smtp-Source: AGHT+IGe9pliul9/TcQbfTFZYC3NvVraMnHCkZgqO0axZCCnb7OvgeE4/zJ34X3uG8qzfevmce3mUDn4mCzjbOC5sZU=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:110e:b0:1ff:4618:36b8 with
 SMTP id d9443c01a7336-20203f54191mr314165ad.11.1723743573052; Thu, 15 Aug
 2024 10:39:33 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:15 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10707; i=samitolvanen@google.com;
 h=from:subject; bh=IoI4F3wObxGX4LgHQUFQQdoaz1TRyk0IHL+WJGOTKzw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj05p/xVSrDsTqSQ6aJyo7Ou8bMUUGlmuI7/2
 cxH2uubobaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OQAKCRBMtfaEi7xW
 7tdFDACpBQFkUOEnk3TqYP/yswobNakprEz/Ru4ffXB9Dk7Jgct6Y9xTZt7Qj6esbqqaFSSo2XA
 p7+/ODjP/CSOZA8YwFF4tupQRUZLOYkbHPJrRrYSEQxGSnUyNZqF+a9mWMprBrnKCuznwjF2bDG
 8ejYX6mI99w0jD9wLF1jZCQGxyjWNs8fGLAOIoxvfgoF9cQtu4e76BA0mjc5M9KLT1jfTYtZ8Kb
 aimIyp+qwqNC9jz3uDLLntL4AOOerU49E7n1sfiwTzH0w8y+L+284Vdj8vkq03ax2VNKR4hnJlb
 g/a8dA5k+nKO+YFxaFIHPsm3DCmLXBeHJQ8nLpL+GwGJAfLDQnzJ5EzpgWyM0nuxQYWjy/LE2/C
 jjpXdaN0Sfzq9fVCGQfeiabKZG4yN2zL2LaLUGxSxtxavDLMoY2+8BiOk1zUUoA8PSdiKLzZMEZ Ssjzmf0xqIEwquRLsZhtz3/JFCmHkdAMlcv6lcj7rOG+PdOGvdAmkcff4Y6Ggu4EXHclM=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-32-samitolvanen@google.com>
Subject: [PATCH v2 11/19] gendwarfksyms: Limit structure expansion
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Expand each structure type only once per exported symbol. This
is necessary to support self-referential structures, which would
otherwise result in infinite recursion, but is still sufficient for
catching ABI changes.

For pointers to structure types, limit type expansion inside the
pointer to two levels. This should be plenty for detecting ABI
differences, but it stops us from pulling in half the kernel for
types that contain pointers to large kernel data structures, like
task_struct, for example.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/cache.c         |  51 ++++++++++++
 scripts/gendwarfksyms/dwarf.c         | 108 ++++++++++++++++++++++++--
 scripts/gendwarfksyms/gendwarfksyms.h |  38 ++++++++-
 4 files changed, 189 insertions(+), 9 deletions(-)
 create mode 100644 scripts/gendwarfksyms/cache.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index fcbac52ca00a..681b42441840 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -1,6 +1,7 @@
 hostprogs-always-y += gendwarfksyms
 
 gendwarfksyms-objs += gendwarfksyms.o
+gendwarfksyms-objs += cache.o
 gendwarfksyms-objs += die.o
 gendwarfksyms-objs += dwarf.o
 gendwarfksyms-objs += symbols.o
diff --git a/scripts/gendwarfksyms/cache.c b/scripts/gendwarfksyms/cache.c
new file mode 100644
index 000000000000..0a4efdcb8cda
--- /dev/null
+++ b/scripts/gendwarfksyms/cache.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
+int __cache_mark_expanded(struct expansion_cache *ec, uintptr_t addr)
+{
+	struct expanded *es;
+
+	es = malloc(sizeof(struct expanded));
+	if (!es) {
+		error("malloc failed");
+		return -1;
+	}
+
+	es->addr = addr;
+	hash_add(ec->cache, &es->hash, addr_hash(addr));
+	return 0;
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
+	int i;
+
+	hash_for_each_safe(ec->cache, i, tmp, es, hash) {
+		free(es);
+	}
+
+	hash_init(ec->cache);
+}
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 92b6ca4c5c91..2f1601015c4e 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -25,6 +25,7 @@ static int process_linebreak(struct die *cache, int n)
 		       !dwarf_form##attr(&da, value);                  \
 	}
 
+DEFINE_GET_ATTR(flag, bool)
 DEFINE_GET_ATTR(udata, Dwarf_Word)
 
 static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
@@ -69,6 +70,13 @@ static bool is_export_symbol(struct state *state, Dwarf_Die *die)
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
@@ -421,19 +429,26 @@ static int __process_structure_type(struct state *state, struct die *cache,
 				    die_callback_t process_func,
 				    die_match_callback_t match_func)
 {
+	bool is_decl = is_declaration(die);
+
 	check(process(state, cache, type));
 	check(process_fqn(state, cache, die));
 	check(process(state, cache, " {"));
 	check(process_linebreak(cache, 1));
 
-	check(process_die_container(state, cache, die, process_func,
-				    match_func));
+	if (!is_decl && state->expand.expand) {
+		check(cache_mark_expanded(&state->expansion_cache, die->addr));
+		check(process_die_container(state, cache, die, process_func,
+					    match_func));
+	}
 
 	check(process_linebreak(cache, -1));
 	check(process(state, cache, "}"));
 
-	check(process_byte_size_attr(state, cache, die));
-	check(process_alignment_attr(state, cache, die));
+	if (!is_decl && state->expand.expand) {
+		check(process_byte_size_attr(state, cache, die));
+		check(process_alignment_attr(state, cache, die));
+	}
 
 	return 0;
 }
@@ -519,6 +534,42 @@ static int process_cached(struct state *state, struct die *cache,
 	return 0;
 }
 
+static void state_init(struct state *state)
+{
+	state->expand.expand = true;
+	state->expand.in_pointer_type = false;
+	state->expand.ptr_expansion_depth = 0;
+	hash_init(state->expansion_cache.cache);
+}
+
+static void expansion_state_restore(struct expansion_state *state,
+				    struct expansion_state *saved)
+{
+	state->ptr_expansion_depth = saved->ptr_expansion_depth;
+	state->in_pointer_type = saved->in_pointer_type;
+	state->expand = saved->expand;
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
 #define PROCESS_TYPE(type)                                       \
 	case DW_TAG_##type##_type:                               \
 		check(process_##type##_type(state, cache, die)); \
@@ -526,18 +577,56 @@ static int process_cached(struct state *state, struct die *cache,
 
 static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 {
+	enum die_state want_state = COMPLETE;
 	struct die *cache = NULL;
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
+	 * If the exported symbol contains a pointer to a structure,
+	 * at most MAX_POINTER_EXPANSION_DEPTH levels are expanded into
+	 * the referenced structure.
+	 */
+	state->expand.in_pointer_type = saved.in_pointer_type ||
+					is_pointer_type(tag);
+
+	if (state->expand.in_pointer_type &&
+	    state->expand.ptr_expansion_depth >= MAX_POINTER_EXPANSION_DEPTH)
+		state->expand.expand = false;
+	else
+		state->expand.expand =
+			saved.expand &&
+			!cache_was_expanded(&state->expansion_cache, die->addr);
+
+	/* Keep track of pointer expansion depth */
+	if (state->expand.expand && state->expand.in_pointer_type &&
+	    is_expanded_type(tag))
+		state->expand.ptr_expansion_depth++;
+
+	/*
+	 * If we have want_state already cached, use it instead of walking
 	 * through DWARF.
 	 */
-	check(die_map_get(die, COMPLETE, &cache));
+	if (!state->expand.expand && is_expanded_type(tag))
+		want_state = UNEXPANDED;
+
+	check(die_map_get(die, want_state, &cache));
+
+	if (cache->state == want_state) {
+		if (want_state == COMPLETE && is_expanded_type(tag))
+			check(cache_mark_expanded(&state->expansion_cache,
+						  die->addr));
 
-	if (cache->state == COMPLETE) {
 		check(process_cached(state, cache, die));
 		check(die_map_add_die(parent, cache));
+
+		expansion_state_restore(&state->expand, &saved);
 		return 0;
 	}
 
@@ -578,9 +667,10 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 
 	/* Update cache state and append to the parent (if any) */
 	cache->tag = tag;
-	cache->state = COMPLETE;
+	cache->state = want_state;
 	check(die_map_add_die(parent, cache));
 
+	expansion_state_restore(&state->expand, &saved);
 	return 0;
 }
 
@@ -643,6 +733,7 @@ static int process_exported_symbols(struct state *state, struct die *cache,
 			return 0;
 
 		debug("%s", state->sym->name);
+		state_init(state);
 
 		if (is_symbol_ptr(get_name(&state->die)))
 			check(process_symbol_ptr(state, &state->die));
@@ -651,6 +742,7 @@ static int process_exported_symbols(struct state *state, struct die *cache,
 		else
 			check(process_variable(state, &state->die));
 
+		cache_clear_expanded(&state->expansion_cache);
 		return 0;
 	default:
 		return 0;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 7d32ccd590f8..6482503e7d6e 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -106,7 +106,7 @@ extern struct symbol *symbol_get(const char *name);
  * die.c
  */
 
-enum die_state { INCOMPLETE, COMPLETE, LAST = COMPLETE };
+enum die_state { INCOMPLETE, UNEXPANDED, COMPLETE, LAST = COMPLETE };
 enum die_fragment_type { EMPTY, STRING, LINEBREAK, DIE };
 
 struct die_fragment {
@@ -128,6 +128,7 @@ static inline const char *die_state_name(enum die_state state)
 	switch (state) {
 	default:
 	CASE_CONST_TO_STR(INCOMPLETE)
+	CASE_CONST_TO_STR(UNEXPANDED)
 	CASE_CONST_TO_STR(COMPLETE)
 	}
 }
@@ -150,15 +151,50 @@ extern int die_map_add_linebreak(struct die *pd, int linebreak);
 extern int die_map_add_die(struct die *pd, struct die *child);
 extern void die_map_free(void);
 
+/*
+ * cache.c
+ */
+
+#define EXPANSION_CACHE_HASH_BITS 11
+
+/* A cache for addresses we've already seen. */
+struct expansion_cache {
+	DECLARE_HASHTABLE(cache, EXPANSION_CACHE_HASH_BITS);
+};
+
+extern int __cache_mark_expanded(struct expansion_cache *ec, uintptr_t addr);
+extern bool __cache_was_expanded(struct expansion_cache *ec, uintptr_t addr);
+
+static inline int cache_mark_expanded(struct expansion_cache *ec, void *addr)
+{
+	return __cache_mark_expanded(ec, (uintptr_t)addr);
+}
+
+static inline bool cache_was_expanded(struct expansion_cache *ec, void *addr)
+{
+	return __cache_was_expanded(ec, (uintptr_t)addr);
+}
+
+extern void cache_clear_expanded(struct expansion_cache *ec);
+
 /*
  * dwarf.c
  */
+struct expansion_state {
+	bool expand;
+	bool in_pointer_type;
+	unsigned int ptr_expansion_depth;
+};
 
 struct state {
 	Dwfl_Module *mod;
 	Dwarf *dbg;
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* Structure expansion */
+	struct expansion_state expand;
+	struct expansion_cache expansion_cache;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.46.0.184.g6999bdac58-goog


