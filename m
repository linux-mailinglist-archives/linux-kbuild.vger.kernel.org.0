Return-Path: <linux-kbuild+bounces-3011-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A5953925
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 19:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 861ADB21551
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7A71B5818;
	Thu, 15 Aug 2024 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LAahV7jA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AAF13CFAA
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743567; cv=none; b=Yr9Xwq0gVyM5/OHVOYFBnmxVUP97a/3fg+qjB0j1lK8TJyFsLKQL33oZdokchWdHGO1di7V3yDEPe5rL2Cly2Ls3dXLXBtxJck4zz+8PFfaFTaSQu519HXCO5w7RYNEjkOKLGGAoxaEm+9JbnhaRyCZhLH9I+JqPerz2arc8ATA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743567; c=relaxed/simple;
	bh=WcDCaJXjW0f2JTquZj6OPQ/VcqwyCDdlHz/KUsXci2w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XuivHzV34gtBpFNZ4f+IVS8O96IxdFRMdusMBhz1J4y3I+Nmj5NzOmsv1fpOGH3VYZgy/HUGmU9EWz39bcAE4sEQFfeegxkpPfuOHiqupVilB9lYzniU6KVGV4r8Ho9+v7e8PQEcto3yGBGhMVx01MYJ+RLlHaocnVHGWxt/jzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LAahV7jA; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-71065f49b10so1154626b3a.0
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743564; x=1724348364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wSWLELxvFuyu6zxWt/XqlJxl649JinucJ0xWmbt0ecA=;
        b=LAahV7jA0+uz+vzP1+XcH6o8pzMs9c3pvY9D3SZbpGR2fZj95lk9n11a/5iREbJwmA
         xnh0OqutyHoAXZbRShp7VS783QpTS/T+WF4LE/pIM9xwhuYvvo7R5LZ6xl0ASNHww/wr
         LWJWJAJUASI2r3iOGTC2V3INNsSZ+UKrJ59/NOZZ0c2ih/7lTPhK+ilfNWWc2jntTNu3
         vv2tPS1hBHBYett82DZ7Os5YVhP5K+S9PNWlKGtBxJIplGo+La17Wl6GkDvBVX+JHHNd
         T2uifsG43LM2KZDBufWwmOnaeF91sMvjg9Fmx2JQHvt2K/mv2jNsfnzmhJ4fLJYAdGqh
         k6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743564; x=1724348364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSWLELxvFuyu6zxWt/XqlJxl649JinucJ0xWmbt0ecA=;
        b=XgVmbcfAyqXTcMBFWw1iRF5th1aVQpSywcc3xukWfoIlavPEZyjfQ5u52b44QkAwKZ
         5oocNKMUbiVouDyJH4ZiArwwBWo5roDGg+zrcFLGQCAgZ1WWEYyS1BecCttrQ/mvYd+l
         fGI3NJldHvCzUh/aXLbpUzEOr8Ww615IL+klI2TpgRNHyDHGk5KYQGB+XWzJPPoVDcJm
         Fz7mq4gvqydgjWugOyMyeyfLfPP0lwJAO8M7gX2+V1OBs6Op+ZqkI1hAV5tI68PMWE/1
         FYGjiODOC4QwiOYNTI02QL743h4SXxmlRTXqf1OXIPRzMH6/g5Lp9aQV0y1vYceZi7pD
         /MgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVctfgovegBTG77//xdcSJvaIQLgc+3ATgfYwGHOGoVzudahUA24lQhF+iztjX0GkBdZbtNKRFDcGN92Q8yOrYXopkyIy7gniAin+kz
X-Gm-Message-State: AOJu0YwYf3nJYPqq5dzSx/5FjP6v4nuoLLkDAWNe2r/UnRPQq2yPCYZG
	SZfrPTqTCRWcXbrbr5Gi5B9kgjTuIZUJv33tmmxDHOpxtUM6B61kwF/hAV78INQXKAhkjxct5QG
	egKH1k9HY+fImkVYyLligosHWVg==
X-Google-Smtp-Source: AGHT+IHR6SAt2JifNMS5dTXYZGoY8TilzPCnRBOfdyHIVDp2HaKQ+8Ln/k+YWaDzQ008IaORCtagkkX5o2KpaUIG5WQ=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:66d0:b0:710:5836:1a24 with
 SMTP id d2e1a72fcca58-713c534fffbmr936b3a.6.1723743563850; Thu, 15 Aug 2024
 10:39:23 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:10 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=17055; i=samitolvanen@google.com;
 h=from:subject; bh=WcDCaJXjW0f2JTquZj6OPQ/VcqwyCDdlHz/KUsXci2w=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04qdDtzVZLUBt/GmJyPrnJD8K2Ja+yO/fMy
 /bXS7xsnZuJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7pHhC/9FA6n54b79gRbgatKd3AW9gR5zZ8WIzyDerNT7r275dzEfQNMrcU7cZOtJNIXv4K2tAgC
 p8IC9m2EitARAwPAymS+fGJwjj9T6k1mfFiGhCkYWbi5kxOO+lYw4pEOFLKbVZmbWJUPwEEtnkR
 VvWJBmzgL8Edbc7kqCLMEM5SOcxRIVjhEXrnQ5hHdxYpxtn7WYtj1ygo8kzFnstqgUeEYF/duZj
 GpaPiYVD+AFNb4xWa/sv+r5ddkQZgUTDCiZP9HT594bEzlLvq5rwGLo+g5WAN9AJiVM1VNXrw9c
 zaxGfZoi5Nx3cQBmzLmaP3+/vNW/ol6m3pUNFQ27RtY13ONWWHr0rQ9wX16urPzCEYd7ZTUO9bT
 BCssKCWQHdqrrLIGhiV+A5k7+CuGdLrYKHxe2rCmzskHZtoiEyeEmxbduFT9vnilFT+TDrQ78dY 6jsUzCnXOojqkafkNPn1pqLjU5a/ax/GoD+MsrSiWhaLDX0SN/6LWvxTv90vGWPO0r66M=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-27-samitolvanen@google.com>
Subject: [PATCH v2 06/19] gendwarfksyms: Add a cache for processed DIEs
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

Basic types in DWARF repeat frequently and traversing the DIEs using
libdw is relatively slow. Add a simple hashtable based cache for the
processed DIEs.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/die.c           | 170 +++++++++++++++++++++++
 scripts/gendwarfksyms/dwarf.c         | 192 ++++++++++++++++++++------
 scripts/gendwarfksyms/gendwarfksyms.c |   6 +
 scripts/gendwarfksyms/gendwarfksyms.h |  58 +++++++-
 5 files changed, 382 insertions(+), 45 deletions(-)
 create mode 100644 scripts/gendwarfksyms/die.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index 623f8fc975ea..fcbac52ca00a 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -1,6 +1,7 @@
 hostprogs-always-y += gendwarfksyms
 
 gendwarfksyms-objs += gendwarfksyms.o
+gendwarfksyms-objs += die.o
 gendwarfksyms-objs += dwarf.o
 gendwarfksyms-objs += symbols.o
 
diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
new file mode 100644
index 000000000000..ad6ba435d9dd
--- /dev/null
+++ b/scripts/gendwarfksyms/die.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <string.h>
+#include "gendwarfksyms.h"
+
+#define DIE_HASH_BITS 20
+
+/* uintptr_t die->addr -> struct die * */
+static DEFINE_HASHTABLE(die_map, DIE_HASH_BITS);
+
+static unsigned int map_hits;
+static unsigned int map_misses;
+
+static int create_die(Dwarf_Die *die, struct die **res)
+{
+	struct die *cd;
+
+	cd = malloc(sizeof(struct die));
+	if (!cd) {
+		error("malloc failed");
+		return -1;
+	}
+
+	cd->state = INCOMPLETE;
+	cd->mapped = false;
+	cd->fqn = NULL;
+	cd->tag = -1;
+	cd->addr = (uintptr_t)die->addr;
+	cd->list = NULL;
+
+	hash_add(die_map, &cd->hash, addr_hash(cd->addr));
+	*res = cd;
+	return 0;
+}
+
+int __die_map_get(uintptr_t addr, enum die_state state, struct die **res)
+{
+	struct die *cd;
+
+	hash_for_each_possible(die_map, cd, hash, addr_hash(addr)) {
+		if (cd->addr == addr && cd->state == state) {
+			*res = cd;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+int die_map_get(Dwarf_Die *die, enum die_state state, struct die **res)
+{
+	if (__die_map_get((uintptr_t)die->addr, state, res) == 0) {
+		map_hits++;
+		return 0;
+	}
+
+	map_misses++;
+	return check(create_die(die, res));
+}
+
+static void reset_die(struct die *cd)
+{
+	struct die_fragment *tmp;
+	struct die_fragment *df = cd->list;
+
+	while (df) {
+		if (df->type == STRING)
+			free(df->data.str);
+
+		tmp = df->next;
+		free(df);
+		df = tmp;
+	}
+
+	cd->state = INCOMPLETE;
+	cd->mapped = false;
+	if (cd->fqn)
+		free(cd->fqn);
+	cd->fqn = NULL;
+	cd->tag = -1;
+	cd->addr = 0;
+	cd->list = NULL;
+}
+
+void die_map_free(void)
+{
+	struct hlist_node *tmp;
+	unsigned int stats[LAST + 1];
+	struct die *cd;
+	int i;
+
+	memset(stats, 0, sizeof(stats));
+
+	hash_for_each_safe(die_map, i, tmp, cd, hash) {
+		stats[cd->state]++;
+		reset_die(cd);
+		free(cd);
+	}
+	hash_init(die_map);
+
+	if ((map_hits + map_misses > 0))
+		debug("hits %u, misses %u (hit rate %.02f%%)", map_hits,
+		      map_misses,
+		      (100.0f * map_hits) / (map_hits + map_misses));
+
+	for (i = 0; i <= LAST; i++)
+		debug("%s: %u entries", die_state_name(i), stats[i]);
+}
+
+static int append_item(struct die *cd, struct die_fragment **res)
+{
+	struct die_fragment *prev;
+	struct die_fragment *df;
+
+	df = malloc(sizeof(struct die_fragment));
+	if (!df) {
+		error("malloc failed");
+		return -1;
+	}
+
+	df->type = EMPTY;
+	df->next = NULL;
+
+	prev = cd->list;
+	while (prev && prev->next)
+		prev = prev->next;
+
+	if (prev)
+		prev->next = df;
+	else
+		cd->list = df;
+
+	*res = df;
+	return 0;
+}
+
+int die_map_add_string(struct die *cd, const char *str)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return 0;
+
+	check(append_item(cd, &df));
+
+	df->data.str = strdup(str);
+	if (!df->data.str) {
+		error("strdup failed");
+		return -1;
+	}
+
+	df->type = STRING;
+	return 0;
+}
+
+int die_map_add_die(struct die *cd, struct die *child)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return 0;
+
+	check(append_item(cd, &df));
+	df->data.addr = child->addr;
+	df->type = DIE;
+	return 0;
+}
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index a37c9049d18e..82b966269acd 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -61,19 +61,20 @@ static bool is_export_symbol(struct state *state, Dwarf_Die *die)
 /*
  * Type string processing
  */
-static int process(struct state *state, const char *s)
+static int process(struct state *state, struct die *cache, const char *s)
 {
 	s = s ?: "<null>";
 
 	if (debug)
 		fputs(s, stderr);
 
-	return 0;
+	return check(die_map_add_string(cache, s));
 }
 
 #define MAX_FMT_BUFFER_SIZE 128
 
-static int process_fmt(struct state *state, const char *fmt, ...)
+static int process_fmt(struct state *state, struct die *cache, const char *fmt,
+		       ...)
 {
 	char buf[MAX_FMT_BUFFER_SIZE];
 	va_list args;
@@ -86,50 +87,103 @@ static int process_fmt(struct state *state, const char *fmt, ...)
 		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
 		res = -1;
 	} else {
-		res = check(process(state, buf));
+		res = check(process(state, cache, buf));
 	}
 
 	va_end(args);
 	return res;
 }
 
-/* Process a fully qualified name from DWARF scopes */
-static int process_fqn(struct state *state, Dwarf_Die *die)
+#define MAX_FQN_SIZE 64
+
+/* Get a fully qualified name from DWARF scopes */
+static int get_fqn(struct state *state, Dwarf_Die *die, char **fqn)
 {
+	const char *list[MAX_FQN_SIZE];
 	Dwarf_Die *scopes = NULL;
-	const char *name;
+	int count = 0;
+	int len = 0;
 	int res;
 	int i;
 
+	*fqn = NULL;
+
 	res = checkp(dwarf_getscopes_die(die, &scopes));
 	if (!res) {
-		name = get_name(die);
-		name = name ?: "<unnamed>";
-		return check(process(state, name));
+		list[count] = get_name(die);
+
+		if (!list[count])
+			return 0;
+
+		len += strlen(list[count]);
+		count++;
+
+		goto done;
 	}
 
-	for (i = res - 1; i >= 0; i--) {
+	for (i = res - 1; i >= 0 && count < MAX_FQN_SIZE; i--) {
 		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
 			continue;
 
-		name = get_name(&scopes[i]);
-		name = name ?: "<unnamed>";
-		check(process(state, name));
-		if (i > 0)
-			check(process(state, "::"));
+		/*
+		 * If any of the DIEs in the scope is missing a name, consider
+		 * the DIE to be unnamed.
+		 */
+		list[count] = get_name(&scopes[i]);
+
+		if (!list[count]) {
+			free(scopes);
+			return 0;
+		}
+
+		len += strlen(list[count]);
+		count++;
+
+		if (i > 0) {
+			list[count++] = "::";
+			len += 2;
+		}
 	}
 
+	if (count == MAX_FQN_SIZE)
+		warn("increase MAX_FQN_SIZE: reached the maximum");
+
 	free(scopes);
+
+done:
+	*fqn = malloc(len + 1);
+	if (!*fqn) {
+		error("malloc failed");
+		return -1;
+	}
+
+	**fqn = '\0';
+
+	for (i = 0; i < count; i++)
+		strcat(*fqn, list[i]);
+
 	return 0;
 }
 
+static int process_fqn(struct state *state, struct die *cache, Dwarf_Die *die)
+{
+	const char *fqn;
+
+	if (!cache->fqn)
+		check(get_fqn(state, die, &cache->fqn));
+
+	fqn = cache->fqn;
+	fqn = fqn ?: "<unnamed>";
+	return check(process(state, cache, fqn));
+}
+
 #define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                         \
-	static int process_##attribute##_attr(struct state *state,        \
-					      Dwarf_Die *die)             \
+	static int process_##attribute##_attr(                            \
+		struct state *state, struct die *cache, Dwarf_Die *die)   \
 	{                                                                 \
 		Dwarf_Word value;                                         \
 		if (get_udata_attr(die, DW_AT_##attribute, &value))       \
-			check(process_fmt(state,                          \
+			check(process_fmt(state, cache,                   \
 					  " " #attribute "(%" PRIu64 ")", \
 					  value));                        \
 		return 0;                                                 \
@@ -144,8 +198,9 @@ bool match_all(Dwarf_Die *die)
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
@@ -153,48 +208,99 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	res = checkp(dwarf_child(die, &current));
 	while (!res) {
 		if (match(&current))
-			check(func(state, &current));
+			check(func(state, cache, &current));
 		res = checkp(dwarf_siblingof(&current, &current));
 	}
 
 	return 0;
 }
 
-static int process_type(struct state *state, Dwarf_Die *die);
+static int process_type(struct state *state, struct die *parent,
+			Dwarf_Die *die);
 
-static int process_type_attr(struct state *state, Dwarf_Die *die)
+static int process_type_attr(struct state *state, struct die *cache,
+			     Dwarf_Die *die)
 {
 	Dwarf_Die type;
 
 	if (get_ref_die_attr(die, DW_AT_type, &type))
-		return check(process_type(state, &type));
+		return check(process_type(state, cache, &type));
 
 	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
-	return check(process(state, "base_type void"));
+	return check(process(state, cache, "base_type void"));
 }
 
-static int process_base_type(struct state *state, Dwarf_Die *die)
+static int process_base_type(struct state *state, struct die *cache,
+			     Dwarf_Die *die)
 {
-	check(process(state, "base_type "));
-	check(process_fqn(state, die));
-	check(process_byte_size_attr(state, die));
-	check(process_encoding_attr(state, die));
-	return check(process_alignment_attr(state, die));
+	check(process(state, cache, "base_type "));
+	check(process_fqn(state, cache, die));
+	check(process_byte_size_attr(state, cache, die));
+	check(process_encoding_attr(state, cache, die));
+	return check(process_alignment_attr(state, cache, die));
 }
 
-static int process_type(struct state *state, Dwarf_Die *die)
+static int process_cached(struct state *state, struct die *cache,
+			  Dwarf_Die *die)
 {
+	struct die_fragment *df = cache->list;
+	Dwarf_Die child;
+
+	while (df) {
+		switch (df->type) {
+		case STRING:
+			check(process(state, NULL, df->data.str));
+			break;
+		case DIE:
+			if (!dwarf_die_addr_die(state->dbg,
+						(void *)df->data.addr,
+						&child)) {
+				error("dwarf_die_addr_die failed");
+				return -1;
+			}
+			check(process_type(state, NULL, &child));
+			break;
+		default:
+			error("empty die_fragment");
+			return -1;
+		}
+		df = df->next;
+	}
+
+	return 0;
+}
+
+static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
+{
+	struct die *cache = NULL;
 	int tag = dwarf_tag(die);
 
+	/*
+	 * If we have the DIE already cached, use it instead of walking
+	 * through DWARF.
+	 */
+	check(die_map_get(die, COMPLETE, &cache));
+
+	if (cache->state == COMPLETE) {
+		check(process_cached(state, cache, die));
+		check(die_map_add_die(parent, cache));
+		return 0;
+	}
+
 	switch (tag) {
 	case DW_TAG_base_type:
-		check(process_base_type(state, die));
+		check(process_base_type(state, cache, die));
 		break;
 	default:
 		debug("unimplemented type: %x", tag);
 		break;
 	}
 
+	/* Update cache state and append to the parent (if any) */
+	cache->tag = tag;
+	cache->state = COMPLETE;
+	check(die_map_add_die(parent, cache));
+
 	return 0;
 }
 
@@ -203,14 +309,14 @@ static int process_type(struct state *state, Dwarf_Die *die)
  */
 static int process_subprogram(struct state *state, Dwarf_Die *die)
 {
-	return check(process(state, "subprogram;\n"));
+	return check(process(state, NULL, "subprogram;\n"));
 }
 
 static int process_variable(struct state *state, Dwarf_Die *die)
 {
-	check(process(state, "variable "));
-	check(process_type_attr(state, die));
-	return check(process(state, ";\n"));
+	check(process(state, NULL, "variable "));
+	check(process_type_attr(state, NULL, die));
+	return check(process(state, NULL, ";\n"));
 }
 
 static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
@@ -235,7 +341,8 @@ static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
 		return check(process_variable(state, &ptr_type));
 }
 
-static int process_exported_symbols(struct state *state, Dwarf_Die *die)
+static int process_exported_symbols(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
 {
 	int tag = dwarf_tag(die);
 
@@ -244,8 +351,9 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
 	case DW_TAG_namespace:
 	case DW_TAG_class_type:
 	case DW_TAG_structure_type:
-		return check(process_die_container(
-			state, die, process_exported_symbols, match_all));
+		return check(process_die_container(state, cache, die,
+						   process_exported_symbols,
+						   match_all));
 
 	/* Possible exported symbols */
 	case DW_TAG_subprogram:
@@ -273,5 +381,5 @@ int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie)
 	struct state state = { .mod = mod, .dbg = dbg };
 
 	return check(process_die_container(
-		&state, cudie, process_exported_symbols, match_all));
+		&state, NULL, cudie, process_exported_symbols, match_all));
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index e2f8ee5a4bf3..55a7fc902bf4 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -78,6 +78,10 @@ static int process_modules(Dwfl_Module *mod, void **userdata, const char *name,
 	debug("%s", name);
 	dbg = dwfl_module_getdwarf(mod, &dwbias);
 
+	/*
+	 * Look for exported symbols in each CU, follow the DIE tree, and add
+	 * the entries to die_map.
+	 */
 	do {
 		res = dwarf_get_units(dbg, cu, &cu, NULL, NULL, &cudie, NULL);
 		if (res < 0) {
@@ -90,6 +94,8 @@ static int process_modules(Dwfl_Module *mod, void **userdata, const char *name,
 		check(process_module(mod, dbg, &cudie));
 	} while (cu);
 
+	die_map_free();
+
 	return DWARF_CB_OK;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 8f6acd1b8f8f..b280acceb114 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -76,6 +76,11 @@ static inline u32 name_hash(const char *name)
 	return jhash(name, strlen(name), 0);
 }
 
+static inline u32 addr_hash(uintptr_t addr)
+{
+	return jhash(&addr, sizeof(addr), 0);
+}
+
 struct symbol {
 	const char *name;
 	struct symbol_addr addr;
@@ -88,6 +93,52 @@ extern int symbol_read_exports(FILE *file);
 extern int symbol_read_symtab(int fd);
 extern struct symbol *symbol_get(const char *name);
 
+/*
+ * die.c
+ */
+
+enum die_state { INCOMPLETE, COMPLETE, LAST = COMPLETE };
+enum die_fragment_type { EMPTY, STRING, DIE };
+
+struct die_fragment {
+	enum die_fragment_type type;
+	union {
+		char *str;
+		uintptr_t addr;
+	} data;
+	struct die_fragment *next;
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
+	CASE_CONST_TO_STR(INCOMPLETE)
+	CASE_CONST_TO_STR(COMPLETE)
+	}
+}
+
+struct die {
+	enum die_state state;
+	bool mapped;
+	char *fqn;
+	int tag;
+	uintptr_t addr;
+	struct die_fragment *list;
+	struct hlist_node hash;
+};
+
+extern int __die_map_get(uintptr_t addr, enum die_state state,
+			 struct die **res);
+extern int die_map_get(Dwarf_Die *die, enum die_state state, struct die **res);
+extern int die_map_add_string(struct die *pd, const char *str);
+extern int die_map_add_die(struct die *pd, struct die *child);
+extern void die_map_free(void);
+
 /*
  * dwarf.c
  */
@@ -99,12 +150,13 @@ struct state {
 	Dwarf_Die die;
 };
 
-typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
+typedef int (*die_callback_t)(struct state *state, struct die *cache,
+			      Dwarf_Die *die);
 typedef bool (*die_match_callback_t)(Dwarf_Die *die);
 extern bool match_all(Dwarf_Die *die);
 
-extern int process_die_container(struct state *state, Dwarf_Die *die,
-				 die_callback_t func,
+extern int process_die_container(struct state *state, struct die *cache,
+				 Dwarf_Die *die, die_callback_t func,
 				 die_match_callback_t match);
 
 extern int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie);
-- 
2.46.0.184.g6999bdac58-goog


