Return-Path: <linux-kbuild+bounces-5198-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B77CC9F8688
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 437C616D7FB
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1211DE3D7;
	Thu, 19 Dec 2024 21:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R8G0boFv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF691D6DD4
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642480; cv=none; b=cShvnsfqv+bVw9ocNMCYQ5Wl6f+3NMNfq6l9FwC4ynk87CnPfDgF7zHx+zhpBHUt+XzVqORy6qYL8WeBoVylpcY6kjwyqmbwKGPHEWQHlMlZ9O1g8yREms86eWCyJNybTIc8gzOw5Urr8FzUAWr8AxM3y+Zn5tjghfXC7m74fQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642480; c=relaxed/simple;
	bh=ojPHM4TdRJoPL09uxHNafq3Z6qYR3Fl2hZHkfw7C90s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sT5aK+c7eikckf55KAIBmkKUMTfXIC1kB0HuoNP6ogkPf5xcN6cWHE6TiQk3z92G0zpB6BXNYPUdG39Jw4ddTzWD2MVIhxRDbrXhDkZFELIZtOcAp7ZjRa/+ekCBr5oavEd2Inf0JsisEcdn1LqjqWzG02vaGuKKji9OnKzHNA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R8G0boFv; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-728eda1754eso1691627b3a.2
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642477; x=1735247277; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sZeTEVoU9eMu65xvxr+TzfCvkY1WGDct1gC44nB7igY=;
        b=R8G0boFvEqyQxy2jYMTzjPOXtarL2WT6cAxHkIF+Y3B4bAG8sniTlyVQY5t8GzEnOb
         V1mKR4HAHQwS2aoO4+msYAWD2t8E5zYPuHdu1L0Qs4EWUmfGZ7lW2YXRM1kZi8xW5jqb
         9mFjJXqNUEam4N+HgKh6LPy9eS0whLOW8bQFw4nke2AjIA6EnJSWiDyIy+BUWkAYGzQ6
         Q8IC5ArIw4Wd30oJhteDp7iHc819qhmH7PSkEHlsn/CK59nb43STcKMav4VHxEZsjBPi
         ZUB8ZeYAkkhimn7M6p8ikiBgopVq2yFC/JPebAtlCZCh2qAmx9avHcZzNoNokzV78GV2
         yEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642477; x=1735247277;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZeTEVoU9eMu65xvxr+TzfCvkY1WGDct1gC44nB7igY=;
        b=UAyyPWlBiKa+VdiYyuR0oYO90+eRqOC5gBbtBwJEunqGH3ezT59FruZfpVN5phUOGU
         lqAlbShd7ywrIhkmHi8HXGmlSmpxi3O9CRF14yK44LGr+Sq50ntbl5gkgiQhlfHitW05
         YooL9GPC5YXpZRuVW/xCQnqcvfrLZBIt3rzfHVb0g6ckUN26bvnPxq4fzVmSf3EZml59
         WIQb/giqNxBmYVuZF1pycmZ3HILwWyHKArhE/nC75pw1Uydsd66E2XL67snLxvwp8RWy
         IjkuOTIVG/rG7S5HUP61xVam+RqKq3j26c2sAHgUaNu6ekWje7CmV1eaflGmKygphhl2
         zY0g==
X-Forwarded-Encrypted: i=1; AJvYcCWV/6R7bxChYEhHQH1atGkutZ7u4XxhRhDZ0ZPYP91tvjQCmSCHxNr9jqDz9rSb0nbb0DBaAJZqYf1ME98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKSihs8crQBULQAffBXnG9qVXkNL3yYQHB/6ThhPu5tz4hOKrL
	9bf0qGS8T1yPy2F3TjMKKneGOJNsEKLd6NFCUqm1teWljZ634WVy4i2faPBJs5ldYzGaKE6blYW
	CQybgEyCK8SHjPx5BDN0rBW3gZA==
X-Google-Smtp-Source: AGHT+IH2yVOIxDOfFhNUksJYr+R7sAFJ9w+dsz4GakGwGDv4Cl/xUUow3RZ0UbkILOHU3rexcNwxwHJftIU+tQ4Js4g=
X-Received: from pfbct11.prod.google.com ([2002:a05:6a00:f8b:b0:725:ceac:b484])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a91:b0:726:c23f:4e5c with SMTP id d2e1a72fcca58-72abdd20f88mr268222b3a.1.1734642477322;
 Thu, 19 Dec 2024 13:07:57 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:41 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=15460; i=samitolvanen@google.com;
 h=from:subject; bh=ojPHM4TdRJoPL09uxHNafq3Z6qYR3Fl2hZHkfw7C90s=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3VJPEktf7s+4Jfl6wwRLtkVSS/k2F3pNF16+SKngg
 FWzhUxZRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjI6f8Mf0Wc+b7OMN96h91g
 2983n2WO3ou83231fI+odn6u1P6UfZ8Z/md/0T8Y2zqrp4OhJfls0yytUBYjqYT7U9+8E37Mssj oNScA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-24-samitolvanen@google.com>
Subject: [PATCH v7 04/18] gendwarfksyms: Add a cache for processed DIEs
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

Basic types in DWARF repeat frequently and traversing the DIEs using
libdw is relatively slow. Add a simple hashtable based cache for the
processed DIEs.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/die.c           | 143 ++++++++++++++++++++++++++
 scripts/gendwarfksyms/dwarf.c         | 136 +++++++++++++++++-------
 scripts/gendwarfksyms/gendwarfksyms.c |   6 ++
 scripts/gendwarfksyms/gendwarfksyms.h |  63 +++++++++++-
 5 files changed, 308 insertions(+), 41 deletions(-)
 create mode 100644 scripts/gendwarfksyms/die.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index 9f8fec4fd39b..c0d4ce50fc27 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -2,6 +2,7 @@
 hostprogs-always-y += gendwarfksyms
 
 gendwarfksyms-objs += gendwarfksyms.o
+gendwarfksyms-objs += die.o
 gendwarfksyms-objs += dwarf.o
 gendwarfksyms-objs += symbols.o
 
diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
new file mode 100644
index 000000000000..b7d900c6a9c8
--- /dev/null
+++ b/scripts/gendwarfksyms/die.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <string.h>
+#include "gendwarfksyms.h"
+
+#define DIE_HASH_BITS 15
+
+/* {die->addr, state} -> struct die * */
+static HASHTABLE_DEFINE(die_map, 1 << DIE_HASH_BITS);
+
+static unsigned int map_hits;
+static unsigned int map_misses;
+
+static inline unsigned int die_hash(uintptr_t addr, enum die_state state)
+{
+	return hash_32(addr_hash(addr) ^ (unsigned int)state);
+}
+
+static void init_die(struct die *cd)
+{
+	cd->state = DIE_INCOMPLETE;
+	cd->fqn = NULL;
+	cd->tag = -1;
+	cd->addr = 0;
+	INIT_LIST_HEAD(&cd->fragments);
+}
+
+static struct die *create_die(Dwarf_Die *die, enum die_state state)
+{
+	struct die *cd;
+
+	cd = xmalloc(sizeof(struct die));
+	init_die(cd);
+	cd->addr = (uintptr_t)die->addr;
+
+	hash_add(die_map, &cd->hash, die_hash(cd->addr, state));
+	return cd;
+}
+
+int __die_map_get(uintptr_t addr, enum die_state state, struct die **res)
+{
+	struct die *cd;
+
+	hash_for_each_possible(die_map, cd, hash, die_hash(addr, state)) {
+		if (cd->addr == addr && cd->state == state) {
+			*res = cd;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+struct die *die_map_get(Dwarf_Die *die, enum die_state state)
+{
+	struct die *cd;
+
+	if (__die_map_get((uintptr_t)die->addr, state, &cd) == 0) {
+		map_hits++;
+		return cd;
+	}
+
+	map_misses++;
+	return create_die(die, state);
+}
+
+static void reset_die(struct die *cd)
+{
+	struct die_fragment *tmp;
+	struct die_fragment *df;
+
+	list_for_each_entry_safe(df, tmp, &cd->fragments, list) {
+		if (df->type == FRAGMENT_STRING)
+			free(df->data.str);
+		free(df);
+	}
+
+	if (cd->fqn && *cd->fqn)
+		free(cd->fqn);
+	init_die(cd);
+}
+
+void die_map_free(void)
+{
+	struct hlist_node *tmp;
+	unsigned int stats[DIE_LAST + 1];
+	struct die *cd;
+	int i;
+
+	memset(stats, 0, sizeof(stats));
+
+	hash_for_each_safe(die_map, cd, tmp, hash) {
+		stats[cd->state]++;
+		reset_die(cd);
+		free(cd);
+	}
+	hash_init(die_map);
+
+	if (map_hits + map_misses > 0)
+		debug("hits %u, misses %u (hit rate %.02f%%)", map_hits,
+		      map_misses,
+		      (100.0f * map_hits) / (map_hits + map_misses));
+
+	for (i = 0; i <= DIE_LAST; i++)
+		debug("%s: %u entries", die_state_name(i), stats[i]);
+}
+
+static struct die_fragment *append_item(struct die *cd)
+{
+	struct die_fragment *df;
+
+	df = xmalloc(sizeof(struct die_fragment));
+	df->type = FRAGMENT_EMPTY;
+	list_add_tail(&df->list, &cd->fragments);
+	return df;
+}
+
+void die_map_add_string(struct die *cd, const char *str)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return;
+
+	df = append_item(cd);
+	df->data.str = xstrdup(str);
+	df->type = FRAGMENT_STRING;
+}
+
+void die_map_add_die(struct die *cd, struct die *child)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return;
+
+	df = append_item(cd);
+	df->data.addr = child->addr;
+	df->type = FRAGMENT_DIE;
+}
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 74e75b8ec891..f40e23a547da 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -72,17 +72,19 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
 /*
  * Type string processing
  */
-static void process(const char *s)
+static void process(struct die *cache, const char *s)
 {
 	s = s ?: "<null>";
 
 	if (dump_dies)
 		fputs(s, stderr);
+
+	die_map_add_string(cache, s);
 }
 
 #define MAX_FMT_BUFFER_SIZE 128
 
-static void process_fmt(const char *fmt, ...)
+static void process_fmt(struct die *cache, const char *fmt, ...)
 {
 	char buf[MAX_FMT_BUFFER_SIZE];
 	va_list args;
@@ -92,7 +94,7 @@ static void process_fmt(const char *fmt, ...)
 	if (checkp(vsnprintf(buf, sizeof(buf), fmt, args)) >= sizeof(buf))
 		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
 
-	process(buf);
+	process(cache, buf);
 	va_end(args);
 }
 
@@ -165,18 +167,28 @@ static char *get_fqn(Dwarf_Die *die)
 	return fqn;
 }
 
-static void process_fqn(Dwarf_Die *die)
+static void update_fqn(struct die *cache, Dwarf_Die *die)
+{
+	if (!cache->fqn)
+		cache->fqn = get_fqn(die) ?: "";
+}
+
+static void process_fqn(struct die *cache, Dwarf_Die *die)
 {
-	process(" ");
-	process(get_fqn(die) ?: "");
+	update_fqn(cache, die);
+	if (*cache->fqn)
+		process(cache, " ");
+	process(cache, cache->fqn);
 }
 
-#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                           \
-	static void process_##attribute##_attr(Dwarf_Die *die)              \
-	{                                                                   \
-		Dwarf_Word value;                                           \
-		if (get_udata_attr(die, DW_AT_##attribute, &value))         \
-			process_fmt(" " #attribute "(%" PRIu64 ")", value); \
+#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                          \
+	static void process_##attribute##_attr(struct die *cache,          \
+					       Dwarf_Die *die)             \
+	{                                                                  \
+		Dwarf_Word value;                                          \
+		if (get_udata_attr(die, DW_AT_##attribute, &value))        \
+			process_fmt(cache, " " #attribute "(%" PRIu64 ")", \
+				    value);                                \
 	}
 
 DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
@@ -188,8 +200,9 @@ bool match_all(Dwarf_Die *die)
 	return true;
 }
 
-int process_die_container(struct state *state, Dwarf_Die *die,
-			  die_callback_t func, die_match_callback_t match)
+int process_die_container(struct state *state, struct die *cache,
+			  Dwarf_Die *die, die_callback_t func,
+			  die_match_callback_t match)
 {
 	Dwarf_Die current;
 	int res;
@@ -198,7 +211,7 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	while (!res) {
 		if (match(&current)) {
 			/* <0 = error, 0 = continue, >0 = stop */
-			res = checkp(func(state, &current));
+			res = checkp(func(state, cache, &current));
 			if (res)
 				return res;
 		}
@@ -209,39 +222,78 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	return 0;
 }
 
-static int process_type(struct state *state, Dwarf_Die *die);
+static int process_type(struct state *state, struct die *parent,
+			Dwarf_Die *die);
 
-static void process_type_attr(struct state *state, Dwarf_Die *die)
+static void process_type_attr(struct state *state, struct die *cache,
+			      Dwarf_Die *die)
 {
 	Dwarf_Die type;
 
 	if (get_ref_die_attr(die, DW_AT_type, &type)) {
-		check(process_type(state, &type));
+		check(process_type(state, cache, &type));
 		return;
 	}
 
 	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
-	process("base_type void");
+	process(cache, "base_type void");
+}
+
+static void process_base_type(struct state *state, struct die *cache,
+			      Dwarf_Die *die)
+{
+	process(cache, "base_type");
+	process_fqn(cache, die);
+	process_byte_size_attr(cache, die);
+	process_encoding_attr(cache, die);
+	process_alignment_attr(cache, die);
 }
 
-static void process_base_type(struct state *state, Dwarf_Die *die)
+static void process_cached(struct state *state, struct die *cache,
+			   Dwarf_Die *die)
 {
-	process("base_type");
-	process_fqn(die);
-	process_byte_size_attr(die);
-	process_encoding_attr(die);
-	process_alignment_attr(die);
+	struct die_fragment *df;
+	Dwarf_Die child;
+
+	list_for_each_entry(df, &cache->fragments, list) {
+		switch (df->type) {
+		case FRAGMENT_STRING:
+			process(NULL, df->data.str);
+			break;
+		case FRAGMENT_DIE:
+			if (!dwarf_die_addr_die(dwarf_cu_getdwarf(die->cu),
+						(void *)df->data.addr, &child))
+				error("dwarf_die_addr_die failed");
+			check(process_type(state, NULL, &child));
+			break;
+		default:
+			error("empty die_fragment");
+		}
+	}
 }
 
-#define PROCESS_TYPE(type)                         \
-	case DW_TAG_##type##_type:                 \
-		process_##type##_type(state, die); \
+#define PROCESS_TYPE(type)                                \
+	case DW_TAG_##type##_type:                        \
+		process_##type##_type(state, cache, die); \
 		break;
 
-static int process_type(struct state *state, Dwarf_Die *die)
+static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 {
+	struct die *cache;
 	int tag = dwarf_tag(die);
 
+	/*
+	 * If we have the DIE already cached, use it instead of walking
+	 * through DWARF.
+	 */
+	cache = die_map_get(die, DIE_COMPLETE);
+
+	if (cache->state == DIE_COMPLETE) {
+		process_cached(state, cache, die);
+		die_map_add_die(parent, cache);
+		return 0;
+	}
+
 	switch (tag) {
 	PROCESS_TYPE(base)
 	default:
@@ -249,6 +301,11 @@ static int process_type(struct state *state, Dwarf_Die *die)
 		break;
 	}
 
+	/* Update cache state and append to the parent (if any) */
+	cache->tag = tag;
+	cache->state = DIE_COMPLETE;
+	die_map_add_die(parent, cache);
+
 	return 0;
 }
 
@@ -259,14 +316,15 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 			   die_callback_t process_func)
 {
 	debug("%s", state->sym->name);
-	check(process_func(state, die));
+	check(process_func(state, NULL, die));
 	if (dump_dies)
 		fputs("\n", stderr);
 }
 
-static int __process_subprogram(struct state *state, Dwarf_Die *die)
+static int __process_subprogram(struct state *state, struct die *cache,
+				Dwarf_Die *die)
 {
-	process("subprogram");
+	process(cache, "subprogram");
 	return 0;
 }
 
@@ -275,10 +333,11 @@ static void process_subprogram(struct state *state, Dwarf_Die *die)
 	process_symbol(state, die, __process_subprogram);
 }
 
-static int __process_variable(struct state *state, Dwarf_Die *die)
+static int __process_variable(struct state *state, struct die *cache,
+			      Dwarf_Die *die)
 {
-	process("variable ");
-	process_type_attr(state, die);
+	process(cache, "variable ");
+	process_type_attr(state, cache, die);
 	return 0;
 }
 
@@ -287,7 +346,8 @@ static void process_variable(struct state *state, Dwarf_Die *die)
 	process_symbol(state, die, __process_variable);
 }
 
-static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
+static int process_exported_symbols(struct state *unused, struct die *cache,
+				    Dwarf_Die *die)
 {
 	int tag = dwarf_tag(die);
 
@@ -297,7 +357,7 @@ static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
 	case DW_TAG_class_type:
 	case DW_TAG_structure_type:
 		return check(process_die_container(
-			NULL, die, process_exported_symbols, match_all));
+			NULL, cache, die, process_exported_symbols, match_all));
 
 	/* Possible exported symbols */
 	case DW_TAG_subprogram:
@@ -321,6 +381,6 @@ static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
 
 void process_cu(Dwarf_Die *cudie)
 {
-	check(process_die_container(NULL, cudie, process_exported_symbols,
+	check(process_die_container(NULL, NULL, cudie, process_exported_symbols,
 				    match_all));
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 1763234b6329..7552fde495ef 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -43,6 +43,10 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
 	debug("%s", name);
 	dbg = dwfl_module_getdwarf(mod, &dwbias);
 
+	/*
+	 * Look for exported symbols in each CU, follow the DIE tree, and add
+	 * the entries to die_map.
+	 */
 	do {
 		res = dwarf_get_units(dbg, cu, &cu, NULL, NULL, &cudie, NULL);
 		if (res < 0)
@@ -53,6 +57,8 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
 		process_cu(&cudie);
 	} while (cu);
 
+	die_map_free();
+
 	return DWARF_CB_OK;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index cb9fd78a58da..601f877bc8ca 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -87,6 +87,61 @@ void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
 void symbol_free(void);
 
+/*
+ * die.c
+ */
+
+enum die_state {
+	DIE_INCOMPLETE,
+	DIE_COMPLETE,
+	DIE_LAST = DIE_COMPLETE
+};
+
+enum die_fragment_type {
+	FRAGMENT_EMPTY,
+	FRAGMENT_STRING,
+	FRAGMENT_DIE
+};
+
+struct die_fragment {
+	enum die_fragment_type type;
+	union {
+		char *str;
+		uintptr_t addr;
+	} data;
+	struct list_head list;
+};
+
+#define CASE_CONST_TO_STR(name) \
+	case name:              \
+		return #name;
+
+static inline const char *die_state_name(enum die_state state)
+{
+	switch (state) {
+	CASE_CONST_TO_STR(DIE_INCOMPLETE)
+	CASE_CONST_TO_STR(DIE_COMPLETE)
+	}
+
+	error("unexpected die_state: %d", state);
+}
+
+struct die {
+	enum die_state state;
+	char *fqn;
+	int tag;
+	uintptr_t addr;
+	struct list_head fragments;
+	struct hlist_node hash;
+};
+
+int __die_map_get(uintptr_t addr, enum die_state state, struct die **res);
+struct die *die_map_get(Dwarf_Die *die, enum die_state state);
+void die_map_add_string(struct die *pd, const char *str);
+void die_map_add_linebreak(struct die *pd, int linebreak);
+void die_map_add_die(struct die *pd, struct die *child);
+void die_map_free(void);
+
 /*
  * dwarf.c
  */
@@ -96,12 +151,14 @@ struct state {
 	Dwarf_Die die;
 };
 
-typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
+typedef int (*die_callback_t)(struct state *state, struct die *cache,
+			      Dwarf_Die *die);
 typedef bool (*die_match_callback_t)(Dwarf_Die *die);
 bool match_all(Dwarf_Die *die);
 
-int process_die_container(struct state *state, Dwarf_Die *die,
-			  die_callback_t func, die_match_callback_t match);
+int process_die_container(struct state *state, struct die *cache,
+			  Dwarf_Die *die, die_callback_t func,
+			  die_match_callback_t match);
 
 void process_cu(Dwarf_Die *cudie);
 
-- 
2.47.1.613.gc27f4b7a9f-goog


