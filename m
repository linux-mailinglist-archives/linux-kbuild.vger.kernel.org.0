Return-Path: <linux-kbuild+bounces-2169-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D6D90B8C7
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 20:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C2B01C23715
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 18:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA30199E88;
	Mon, 17 Jun 2024 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iXz3uAKZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D519924D
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647129; cv=none; b=AO9NHb9wMNcNOfArKlpDX8lx2Hz5qo0s5qHapptg207KW1hevAseqIC9IC+fGiUIYxZDTLqLDqHEM23xYGLZVGZ0p3yvL4zmP/eAHhQet4/ANpuLsgfrYe2vxvpELi3cMQtyDw57+9j8HKtw18NxTy0cLoZZruoUdKKsaQ4ZsXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647129; c=relaxed/simple;
	bh=5QGYkwk/E4Q6+rrK8r8Qc7nJUUivw+COjNp3jkT0e4c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AXLQS4DBVDoLU1fqRKm+KLxFkaVuzrxp187SIYIvHwMHL/xSWSAfiy9ULyXeyDtCS23xXmuE8VaPEVOIwBH7jO9+M1PwGG7mOyEr5vXhlLg61A5Z1zx97Py8rXg+PIOaFkrA86XQTI0Y+z8XsoPlRk4X0Y4DxJPEkFtuppLD+3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iXz3uAKZ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1f6ea6afba0so41433685ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647125; x=1719251925; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJS2qGel4yduzddYByEwVYwl3lRWbRkhbTBiPKp6MJw=;
        b=iXz3uAKZCrCWghYIvjohFkJ6vRF9lz1mbVCpSKEB/Tkp+JB9LPaZYzcMsL7mKGAYRl
         WvxeMng4y/EdAHiAjPYJj46V6IjNlpzhZeINF+LNYCDmCKZJRJeUYF4edSQzXaH4yfDe
         srvIKKq3QTxL6CE38KCpIjzQJoV9kpiNXb/mM20ncgDmg53MlWZ/11UIITMtSLMHYYaI
         w0JglBiHwF+1Nc2kB8/rQMt55UD7zpCs9G6HY19fT9vwHGw7DJvH8tDwxQmXvbSsHo9n
         ft4guXJuG9ZaXzgOv3/6HpOPQDC+ZWaXt+EG/WjKlKfqciI9wiXAws3TegOge6bbLLt/
         Y70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647125; x=1719251925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJS2qGel4yduzddYByEwVYwl3lRWbRkhbTBiPKp6MJw=;
        b=aaNhJLVqrFPy3k5jyAmfnMVxiqPvUXHp9sGqnFsNKHI7ZEu/okrtILD5H5m08CmrRK
         x1Tqu8DKIZSOU27wnHbVfqi/wZEEUzIehUqvyOptx2CwiFurZeTvU35TQ0htTzjhjdSV
         MBdh3jRSHvbkEWxIKPd6AQIuXi2ePye/8bzxVfaHoIPJ2S/3NShhWXiYtM7k6fePGMda
         TxqsquFLMvZqc/MtEcoFcfmmzXlfZn1IKtniKEjK9sqr8BtHnmSjxKdD5fq0FxuF1H/b
         HcpY16kTOxqjL84M6oZ6VIY+I0IN8Lo8NFdrubVehgZDrKJt0LztS7m7vxkmf1LkqMAt
         S8EA==
X-Forwarded-Encrypted: i=1; AJvYcCVikpqh7vXJTBgrpcZiysM2gDbrZwT/Fidt7L1Z3o0BO5jlUiS1TLtU7N1NqxgRZ0oCbT4QRcc3RB4n+wYPvAxj233XOXj3aFmkbdKL
X-Gm-Message-State: AOJu0YzoiTx2yymQF8cvyos8tNj9RuuLMs0j0Ca3QhtrAhzPeXKWMLq7
	XgYR16TldBoUXroe3L1uH9vM/kqBeYoC+HgzHlV6qZ3VwinJX9qQ9GN8uppqqbyYk+LCFHkuEjE
	aYfTOcFR/QB0UdEQNBeRIQ6NMlg==
X-Google-Smtp-Source: AGHT+IHKjC0CX34pVUQa0Y9ornsY1/i5bBR74aqDPFW/EAbpIF5+uvTPtCpotMJonL0QUGth2SATiIUukrIzaTeaK4E=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:e844:b0:1f7:1046:d68e with
 SMTP id d9443c01a7336-1f98b2219aamr78555ad.2.1718647125429; Mon, 17 Jun 2024
 10:58:45 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:30 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7777; i=samitolvanen@google.com;
 h=from:subject; bh=5QGYkwk/E4Q6+rrK8r8Qc7nJUUivw+COjNp3jkT0e4c=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk74/KgDUBKZV1popDzLuA1ek3BXMxcD3VZW
 UgpxTvuAOaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5OwAKCRBMtfaEi7xW
 7lHEDACSFEate7TcAPTNQ4VH8+1rvGKNRy8wDm6Wogha8iHjE2xIT43/mQo3hROAVqmGPCSkE32
 hkohns20j3NH5LfafCAGjKGhxZsbj45Kdn7AFuTSnkGtl4ECfEJey22w+/nuN3REdRqgxfmMkHI
 NlPZ5EjzUbkbYis2utWtxpYVZqbp5nJE84yxMyRcAZ4soi5urhHbrfrxkf+NE+c8HoXYktaPLev
 sEJaOA0fhjb4SPvjB/ka5gKBzKfXWhtd/+lOnlH1PSh6cjOSISo/iOFrILp2qDT+xtd39yc5JVI
 WXNeKbYAfsXjEYmgoQ12w9P2p+2o4gWQFk//vt6oHF0+l7cqKt+qZsUxSWqwhgedNuqak6mVZ+N
 +feeicpA/NEz1AYhDPAsC2ntCbFFkZkE7USv6x6bsQc4juevI35vYQkzYS4NWHyc114AxKA81pL 3i/wGpEEuPNREU6RybCZiSy0wP5sDp335z1IXSkf2s03lrV2NzbhcWlcqZVpQRbaXbv4U=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-28-samitolvanen@google.com>
Subject: [PATCH 11/15] gendwarfksyms: Limit structure expansion
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Expand each structure type only once per exported symbol. This
is necessary to support self-referential structures, which would
otherwise result in infinite recursion. Expanding each structure type
just once is enough to catch ABI changes.

For pointers to structure types, limit expansion to three levels
inside the pointer. This should be plenty for catching ABI differences
and stops us from pulling in half the kernel for structs that contain
pointers to large structs like task_struct.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/gendwarfksyms/cache.c         | 49 ++++++++++++++++
 tools/gendwarfksyms/gendwarfksyms.h |  9 ++-
 tools/gendwarfksyms/types.c         | 87 ++++++++++++++++++++++++++---
 3 files changed, 136 insertions(+), 9 deletions(-)

diff --git a/tools/gendwarfksyms/cache.c b/tools/gendwarfksyms/cache.c
index 85a2adeb649d..1d6eb27d799d 100644
--- a/tools/gendwarfksyms/cache.c
+++ b/tools/gendwarfksyms/cache.c
@@ -158,3 +158,52 @@ int cache_add_die(struct cached_die *cd, Dwarf_Die *die)
 	ci->type = DIE;
 	return 0;
 }
+
+/* A list of structure types that were already expanded for the current symbol */
+struct expanded {
+	uintptr_t addr;
+	struct hlist_node hash;
+};
+
+/* die->addr -> struct expanded */
+DEFINE_HASHTABLE(expansion_cache, DIE_HASH_BITS);
+
+int cache_mark_expanded(Dwarf_Die *die)
+{
+	struct expanded *es;
+
+	es = malloc(sizeof(struct expanded));
+	if (!es) {
+		error("malloc failed");
+		return -1;
+	}
+
+	es->addr = (uintptr_t)die->addr;
+	hash_add(expansion_cache, &es->hash, es->addr);
+	return 0;
+}
+
+bool cache_was_expanded(Dwarf_Die *die)
+{
+	struct expanded *es;
+	uintptr_t addr = (uintptr_t)die->addr;
+
+	hash_for_each_possible(expansion_cache, es, hash, addr) {
+		if (es->addr == addr)
+			return true;
+	}
+
+	return false;
+}
+
+void cache_clear_expanded(void)
+{
+	struct hlist_node *tmp;
+	struct expanded *es;
+	int i;
+
+	hash_for_each_safe(expansion_cache, i, tmp, es, hash) {
+		free(es);
+	}
+	hash_init(expansion_cache);
+}
diff --git a/tools/gendwarfksyms/gendwarfksyms.h b/tools/gendwarfksyms/gendwarfksyms.h
index 4646eaf5c85e..568f3727017e 100644
--- a/tools/gendwarfksyms/gendwarfksyms.h
+++ b/tools/gendwarfksyms/gendwarfksyms.h
@@ -95,7 +95,7 @@ struct cached_item {
 	struct cached_item *next;
 };
 
-enum cached_die_state { INCOMPLETE, COMPLETE };
+enum cached_die_state { INCOMPLETE, UNEXPANDED, COMPLETE };
 
 struct cached_die {
 	enum cached_die_state state;
@@ -111,6 +111,10 @@ extern int cache_add_linebreak(struct cached_die *pd, int linebreak);
 extern int cache_add_die(struct cached_die *pd, Dwarf_Die *die);
 extern void cache_free(void);
 
+extern int cache_mark_expanded(Dwarf_Die *die);
+extern bool cache_was_expanded(Dwarf_Die *die);
+extern void cache_clear_expanded(void);
+
 /*
  * types.c
  */
@@ -120,6 +124,9 @@ struct state {
 	Dwarf *dbg;
 	struct symbol *sym;
 	Dwarf_Die origin;
+	unsigned int ptr_expansion_depth;
+	bool in_pointer_type;
+	bool expand;
 	unsigned long crc;
 };
 
diff --git a/tools/gendwarfksyms/types.c b/tools/gendwarfksyms/types.c
index fa74e6fc26e3..da3aa2ad9f57 100644
--- a/tools/gendwarfksyms/types.c
+++ b/tools/gendwarfksyms/types.c
@@ -381,14 +381,21 @@ static int __process_structure_type(struct state *state,
 	check(process(state, cache, " {"));
 	check(process_linebreak(cache, 1));
 
-	check(process_die_container(state, cache, die, process_func,
-				    match_func));
+	if (state->expand) {
+		check(cache_mark_expanded(die));
+		check(process_die_container(state, cache, die, process_func,
+					    match_func));
+	} else {
+		check(process(state, cache, "<unexpanded>"));
+	}
 
 	check(process_linebreak(cache, -1));
 	check(process(state, cache, "}"));
 
-	check(process_byte_size_attr(state, cache, die));
-	check(process_alignment_attr(state, cache, die));
+	if (state->expand) {
+		check(process_byte_size_attr(state, cache, die));
+		check(process_alignment_attr(state, cache, die));
+	}
 
 	return 0;
 }
@@ -475,9 +482,38 @@ static int process_cached(struct state *state, struct cached_die *cache,
 
 static void state_init(struct state *state)
 {
+	state->ptr_expansion_depth = 0;
+	state->in_pointer_type = false;
+	state->expand = true;
 	state->crc = 0xffffffff;
 }
 
+static void state_restore(struct state *state, struct state *saved)
+{
+	state->ptr_expansion_depth = saved->ptr_expansion_depth;
+	state->in_pointer_type = saved->in_pointer_type;
+	state->expand = saved->expand;
+}
+
+static void state_save(struct state *state, struct state *saved)
+{
+	state_restore(saved, state);
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
+#define MAX_POINTER_EXPANSION_DEPTH 3
+
 #define PROCESS_TYPE(type)                                       \
 	case DW_TAG_##type##_type:                               \
 		check(process_##type##_type(state, cache, die)); \
@@ -486,19 +522,52 @@ static void state_init(struct state *state)
 static int process_type(struct state *state, struct cached_die *parent,
 			Dwarf_Die *die)
 {
+	enum cached_die_state want_state = COMPLETE;
 	struct cached_die *cache = NULL;
+	struct state saved;
 	int tag = dwarf_tag(die);
 
+	state_save(state, &saved);
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
+	state->in_pointer_type = saved.in_pointer_type || is_pointer_type(tag);
+
+	if (state->in_pointer_type &&
+	    state->ptr_expansion_depth >= MAX_POINTER_EXPANSION_DEPTH)
+		state->expand = false;
+	else
+		state->expand = saved.expand && !cache_was_expanded(die);
+
+	/* Keep track of pointer expansion depth */
+	if (state->expand && state->in_pointer_type && is_expanded_type(tag))
+		state->ptr_expansion_depth++;
+
+	/*
+	 * If we have want_state already cached, use it instead of walking
 	 * through DWARF.
 	 */
 	if (!no_cache) {
-		check(cache_get(die, COMPLETE, &cache));
+		if (!state->expand && is_expanded_type(tag))
+			want_state = UNEXPANDED;
+
+		check(cache_get(die, want_state, &cache));
+
+		if (cache->state == want_state) {
+			if (want_state == COMPLETE && is_expanded_type(tag))
+				check(cache_mark_expanded(die));
 
-		if (cache->state == COMPLETE) {
 			check(process_cached(state, cache, die));
 			check(cache_add_die(parent, die));
+
+			state_restore(state, &saved);
 			return 0;
 		}
 	}
@@ -540,10 +609,11 @@ static int process_type(struct state *state, struct cached_die *parent,
 
 	if (!no_cache) {
 		/* Update cache state and append to the parent (if any) */
-		cache->state = COMPLETE;
+		cache->state = want_state;
 		check(cache_add_die(parent, die));
 	}
 
+	state_restore(state, &saved);
 	return 0;
 }
 
@@ -596,6 +666,7 @@ static int process_exported_symbols(struct state *state,
 		else
 			check(process_variable(state, die));
 
+		cache_clear_expanded();
 		return check(
 			symbol_set_crc(state->sym, state->crc ^ 0xffffffff));
 	default:
-- 
2.45.2.627.g7a2c4fd464-goog


