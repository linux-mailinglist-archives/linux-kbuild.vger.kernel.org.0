Return-Path: <linux-kbuild+bounces-3674-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A350497F060
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 20:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 329341F21BFE
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 18:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9F51A2652;
	Mon, 23 Sep 2024 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0kAvS+SF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC41A257A
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115559; cv=none; b=eAVVEepwaxN/56tY1WMQY4h2+aco0zdY7bdfutnXBU3KIxTmK6CPhflqtsJf9zJ3e9exXTeVZq+UX2yP7DbRlhgsF5Ud4j4CgiUPVVGkMFmddYkFSMLeGey7cSh3JHd8vI/imIKKyBV9+x66Tz3yKHltGw+MxoxPgteeXe3p08Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115559; c=relaxed/simple;
	bh=lXq6lP22aY/tuXV5y+BvfZowtiMxW5xohBBULQJYl3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uBYFoidniFf/Q5Nla9PQKalyvbGdDCZerNXMAKjozuR5Efkfx7nPUYE4WXGEyDOP8hmT0tz1bqGU94824zfw6NEypbwA6VeP2Hadax+xC/mHMa0h6Pkp2TIlIG3ddN42Xg/FTDWOLvmIVKHyXnn+ifFo4HU+l/WkMrP2YMCHgqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0kAvS+SF; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7d5a54dcaefso4249947a12.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 11:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115557; x=1727720357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SghQU1lZYz69X9HH/FZ13dE1oo0DdF62r/uN8ZVxVYU=;
        b=0kAvS+SFIuJmcAipppEtgVJ6Uq/lnN1doxqey8a/CFr+o6NKCp+yEZ/O7veEb/J6zU
         BjdDsDg1AmLX7HILPCKSwD7lC3WAVrN3UwNQAKhCzcKExRaNVFuzXaAJTyGjLKKKzCkq
         HL7azt8/ZWlaNlec2nAM064e6NEI9bzS4+1A4tgCIvy1/BhdD6GFYsltnVXop6AcdUwC
         jP2vi6vCXxAIEfWkk79grFPe1+vUClnN2hbHrlg+mm6nEjS0m/qfUpuM4RjSAW1w4zbu
         TczcI+fJIExmlhUBg8F72S7MFB3ogHHHmWEutB6mRgYkcharGYi3qwYaIJAWtJzFMsPY
         PuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115557; x=1727720357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SghQU1lZYz69X9HH/FZ13dE1oo0DdF62r/uN8ZVxVYU=;
        b=M45UUbsx07J4McMlof9tMxYdH6k/7XZWXAtxFFg9P2STW1s4w3ndF6lloXNeL3SO7Q
         5kHw/ZUxNeLrh7x08eQvV8r6X377LAvpyBE9DXpzneYQUITTyrS8csFxyUPDHE9PkCNa
         k2YUay6yht3cJOHN0uA1bj/NnJRHokXXXcU5nBembNUdpaGDb3uGt1VZng1ushmwyKF+
         ze9tclsm9s1agCZMyS9eJrTZOJ/HmtlMwNWE1pbdYnbJ0RZNnXz1cxwsn23sC5HzZVqf
         IiZDhfsrVTHz0K3mEt1uCWx+xpx2529WgfPFf3jUDCBVIV2lKlFOqBl0yr6edw9v91rR
         1WEA==
X-Forwarded-Encrypted: i=1; AJvYcCWRQq85IsB+1zkQF0jTpJooyR60tY7ZxvlMfrjIUrb1YoldhQxbCZISZGInJfKIrA/ZBz/KOpSzo1x95Qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnGUfN+3e92SWurlABcs/FBjD2VtY1b+f9D9N5djFC31zKe1i
	muHGfRuCamFTI1kKnbTfN6W3RlNZni1hRdu2xtIFUJ8gyahWalGXhs4NCtngxc4viwUxU2uhdsQ
	FZe19PW+GiYcNaSlShwDW5Cmv8g==
X-Google-Smtp-Source: AGHT+IFo33Eyj6lwns2SzW35RxXeSuXBaoS1fJIRiAgdIunvV4zCbZ1y+iJh7dWbvswKZAxhiaU7qYxPBdXsG/3EuAw=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:380c:0:b0:6e5:62bf:f905 with SMTP
 id 41be03b00d2f7-7dcc69b7e9cmr10388a12.10.1727115556762; Mon, 23 Sep 2024
 11:19:16 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:52 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=15390; i=samitolvanen@google.com;
 h=from:subject; bh=lXq6lP22aY/tuXV5y+BvfZowtiMxW5xohBBULQJYl3o=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN3IunKSzejsDp3qNPq+N4HzvGQkpP7bYBq1wS2LWF
 e2ZdPJ0RykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIn2BGhlvpzWaCsU45awNU
 Fk64cCdfpGTrlVOcx2y+nc+Znpi9t43hf+HFObYJvD9/HmQz43JQu7N3WQBT757rHie3pb+O5M6 KYAYA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-28-samitolvanen@google.com>
Subject: [PATCH v3 06/20] gendwarfksyms: Add a cache for processed DIEs
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

Basic types in DWARF repeat frequently and traversing the DIEs using
libdw is relatively slow. Add a simple hashtable based cache for the
processed DIEs.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/die.c           | 143 ++++++++++++++++++++++++++
 scripts/gendwarfksyms/dwarf.c         | 136 +++++++++++++++++-------
 scripts/gendwarfksyms/gendwarfksyms.c |   6 ++
 scripts/gendwarfksyms/gendwarfksyms.h |  62 ++++++++++-
 5 files changed, 307 insertions(+), 41 deletions(-)
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
index 000000000000..28d89fce89fc
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
+#define DIE_HASH_BITS 20
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
index 3e9e8500f448..f0c881bef026 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -71,17 +71,19 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
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
@@ -91,7 +93,7 @@ static void process_fmt(const char *fmt, ...)
 	if (checkp(vsnprintf(buf, sizeof(buf), fmt, args)) >= sizeof(buf))
 		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
 
-	process(buf);
+	process(cache, buf);
 	va_end(args);
 }
 
@@ -162,18 +164,28 @@ static char *get_fqn(Dwarf_Die *die)
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
@@ -185,8 +197,9 @@ bool match_all(Dwarf_Die *die)
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
@@ -195,7 +208,7 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	while (!res) {
 		if (match(&current)) {
 			/* <0 = error, 0 = continue, >0 = stop */
-			res = checkp(func(state, &current));
+			res = checkp(func(state, cache, &current));
 			if (res)
 				return res;
 		}
@@ -206,39 +219,78 @@ int process_die_container(struct state *state, Dwarf_Die *die,
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
@@ -246,6 +298,11 @@ static int process_type(struct state *state, Dwarf_Die *die)
 		break;
 	}
 
+	/* Update cache state and append to the parent (if any) */
+	cache->tag = tag;
+	cache->state = DIE_COMPLETE;
+	die_map_add_die(parent, cache);
+
 	return 0;
 }
 
@@ -256,14 +313,15 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
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
 
@@ -272,10 +330,11 @@ static void process_subprogram(struct state *state, Dwarf_Die *die)
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
 
@@ -284,7 +343,8 @@ static void process_variable(struct state *state, Dwarf_Die *die)
 	process_symbol(state, die, __process_variable);
 }
 
-static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
+static int process_exported_symbols(struct state *unused, struct die *cache,
+				    Dwarf_Die *die)
 {
 	int tag = dwarf_tag(die);
 
@@ -294,7 +354,7 @@ static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
 	case DW_TAG_class_type:
 	case DW_TAG_structure_type:
 		return check(process_die_container(
-			NULL, die, process_exported_symbols, match_all));
+			NULL, cache, die, process_exported_symbols, match_all));
 
 	/* Possible exported symbols */
 	case DW_TAG_subprogram:
@@ -318,6 +378,6 @@ static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
 
 void process_cu(Dwarf_Die *cudie)
 {
-	check(process_die_container(NULL, cudie, process_exported_symbols,
+	check(process_die_container(NULL, NULL, cudie, process_exported_symbols,
 				    match_all));
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 5032ec487626..66806b0936e4 100644
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
index a058647e2361..7df270429c21 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -89,6 +89,60 @@ void symbol_read_exports(FILE *file);
 void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
 
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
+	default:
+	CASE_CONST_TO_STR(DIE_INCOMPLETE)
+	CASE_CONST_TO_STR(DIE_COMPLETE)
+	}
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
@@ -98,12 +152,14 @@ struct state {
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
2.46.0.792.g87dc391469-goog


