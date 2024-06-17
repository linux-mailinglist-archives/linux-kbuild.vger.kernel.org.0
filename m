Return-Path: <linux-kbuild+bounces-2163-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4783390B8B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 19:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7461C213B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 17:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC9719414E;
	Mon, 17 Jun 2024 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X1wbD0t2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCB198A06
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647117; cv=none; b=lDLm1GL0bWi/NG10ZD+KOhhCYR5QG97Swsl6Ym7eFu9As2FXchaQJSaedFbwCRX7Nqlnkhjbf/9MT72AZcxohfN0lZZ8PbJu2kZJs87uSVmERUYa8stypWbhF430PQXZ0AO2eP/cUrYRa0d28c+PnswOKZJPf91F+8hpUKb4EPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647117; c=relaxed/simple;
	bh=lgkFlLCBv/2kjHShQr9qX9TjxJu4hDPDlpEc+ceu+EI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tiZYe4Vi72OSJ2S4QhZZ89rg58FEq0/7kC1JujUR+O6wKm5FsrcNIoUiIyBGxX64gb0bhURSbYHVuFaoPf/6XHkyz8AoI43IxG96P5rFeu5ZU0cudEODuySOIlPQGmXxa5j3+46+z5g2LpDb3uYJWEdrtcAQ/BS1KyDyYA20Jus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X1wbD0t2; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6e67742bee6so2480519a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647115; x=1719251915; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nlJGUQdZTqvKu/ZrihS+0fg1MxLVhWfwa5Lrufl7K5s=;
        b=X1wbD0t25P3U4fhntGksHvDMR065Ob46rh2UUwaqemQY3lddQUUnC1G6/R+VT2JoRs
         5FDRDo6j9WABsieknb5uN1bBE28+wWyYSwzSYXWbDUFY/sz1W7vrNf8+Y3RyBp3VpnB7
         VnmOR/9ADM9/nD2Q/AMz1Ba2P/rKIBuDdE1Q+CovaW3VDlMQwgiguUEFBqzaSVruthQn
         O6jyEjlzYWWu3Bewan5siXmmHYzyZdwVETU1cHHv4JhF0RytBR1e6U01PBJGoEqJxRHh
         WosjSNDFwKCgaFhB/HFXO3HuMyrRmmZgUR+HsswKuHBOUmDqrw1Cpr78CMRloM+TLtvW
         QC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647115; x=1719251915;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlJGUQdZTqvKu/ZrihS+0fg1MxLVhWfwa5Lrufl7K5s=;
        b=vD9eIr/Z7yf8m1/6zsTlorcddXChSUCWOKQv8rBubJZoLILn+Vl1jqIEZvyMP/QAGF
         DPLrBbD6fyDcLF6294mj9P9OZ99kIqF8Q/tOkFhHWRTXW3u77w7x6mPg6zo3IRzWAe6t
         oYFr/h1mw1j5vub6Ra4d1jRYDPx4+dmY75RUpSY1Rp/DPHEdTXFsXNPO7gSAeN/+eZGn
         N/yej5aTLZAQ/vSdD466KcnGXbWz9V6c+3dvBpTTQ72SFKFUynx6MdvMKQigy4+9bbCs
         L9WazJMS/alaf7rEE8Tj6CgJW0MGZcbYlOE/Dk6zogK+QVcvuvsNp6g7aJvWeblUSi7U
         NnEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF1cfgxPVga93OYQIE8at+HEhLwc/v9W8fF3sYF7mnKdAdcCDLPDz+ojujFRDOtCdJI8qvzh8muU1oyRDEJnySfLiwmclJqnPzqhLt
X-Gm-Message-State: AOJu0Yz8daGel1IQsX+FEboFuk+yR6uLK/OOi3U5GUp2rCBtrvEIF/Qr
	oijjzOgzAt4BlxAw52vlpu19OFnutugewbsps3Wt231S88CCyBYtc+cjp8S98sKByGnohxvrsWj
	osKRuLxoMad0WgFUc8TTNvCiSgg==
X-Google-Smtp-Source: AGHT+IGZXIIl85hA263p5dvacYnsGHeuOOVXY79NbHJ/LEYBDyj4hhPBhCMZql7Bh18Iv9manizNAAKAMTGp4BOGF4U=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:6542:0:b0:6e8:7078:afa9 with SMTP
 id 41be03b00d2f7-70199a2a798mr28218a12.7.1718647114516; Mon, 17 Jun 2024
 10:58:34 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:24 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=15488; i=samitolvanen@google.com;
 h=from:subject; bh=lgkFlLCBv/2kjHShQr9qX9TjxJu4hDPDlpEc+ceu+EI=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk73d3Nc1tvR72KyrmVeSruYnNm0r/XQGyQZ
 PQlRI0tWraJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5OwAKCRBMtfaEi7xW
 7oZxC/9+kC89o9QxfqfhY9IP9ao1TrlWdtYUOBdAPZveGBnFQsmgXT7/OU7wWGi1fj1rEIh8j4o
 MMIsZSOT/9pTvQeyq+vnBTnW06fvBaRvVEphTiv5emwTbJAer8p4VU3JhETcznEcwl1LZ9XYhsb
 DSD9Iym/XgEt0ubDSLx5+avfYixUkYR6KwYlVsOgxWLeuggkl+fLYTJC3mxdbBboLX3rpIaKuU/
 WJjWWAnPjynDBFMHS6ONqpjxdm7g83Egpe1ry89zA93DqCmuH08invTACKiQPBMwfo35YTa5qcB
 GvxSN4NHNUJsT30oSLj+8zEKRK6S5fmjZF5E6A9NcStwgzI2hdo1xGVjQzo2cggXtWqoFV3+nob
 u5kkXgkQOnRYI0JWxyi2d8T/+3FK5IWqvXDSXMGZEBGH+UOzz2W9YRIk1B/xv96ZGdl+/EYyhet xEogreVjueWQdX0+3tZXR+jJgPzHj9vC9NJBtDjV+he72BPORtXDhnfU5xuD7Z4PPEOuM=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-22-samitolvanen@google.com>
Subject: [PATCH 05/15] gendwarfksyms: Add a cache
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Basic types in DWARF repeat frequently and traversing the DIEs using
libdw is relatively slow. Add a simple hashtable based cache for the
processed DIEs.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/gendwarfksyms/Build           |   1 +
 tools/gendwarfksyms/cache.c         | 147 ++++++++++++++++++++++++++++
 tools/gendwarfksyms/gendwarfksyms.c |   4 +
 tools/gendwarfksyms/gendwarfksyms.h |  37 ++++++-
 tools/gendwarfksyms/types.c         | 140 ++++++++++++++++++--------
 5 files changed, 286 insertions(+), 43 deletions(-)
 create mode 100644 tools/gendwarfksyms/cache.c

diff --git a/tools/gendwarfksyms/Build b/tools/gendwarfksyms/Build
index 518642c9b9de..220a4aa9b380 100644
--- a/tools/gendwarfksyms/Build
+++ b/tools/gendwarfksyms/Build
@@ -1,4 +1,5 @@
 gendwarfksyms-y += gendwarfksyms.o
+gendwarfksyms-y += cache.o
 gendwarfksyms-y += crc32.o
 gendwarfksyms-y += symbols.o
 gendwarfksyms-y += types.o
diff --git a/tools/gendwarfksyms/cache.c b/tools/gendwarfksyms/cache.c
new file mode 100644
index 000000000000..9adda113e0b6
--- /dev/null
+++ b/tools/gendwarfksyms/cache.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <string.h>
+#include "gendwarfksyms.h"
+
+#define DIE_HASH_BITS 10
+
+/* die->addr -> struct cached_die */
+DEFINE_HASHTABLE(die_cache, DIE_HASH_BITS);
+
+static unsigned int cache_hits;
+static unsigned int cache_misses;
+
+static int create_die(Dwarf_Die *die, struct cached_die **res)
+{
+	struct cached_die *cd;
+
+	cd = malloc(sizeof(struct cached_die));
+	if (!cd) {
+		error("malloc failed");
+		return -1;
+	}
+
+	cd->state = INCOMPLETE;
+	cd->addr = (uintptr_t)die->addr;
+	cd->list = NULL;
+
+	hash_add(die_cache, &cd->hash, cd->addr);
+	*res = cd;
+	return 0;
+}
+
+int cache_get(Dwarf_Die *die, enum cached_die_state state,
+	      struct cached_die **res)
+{
+	struct cached_die *cd;
+	uintptr_t addr = (uintptr_t)die->addr;
+
+	hash_for_each_possible(die_cache, cd, hash, addr) {
+		if (cd->addr == addr && cd->state == state) {
+			*res = cd;
+			cache_hits++;
+			return 0;
+		}
+	}
+
+	cache_misses++;
+	return check(create_die(die, res));
+}
+
+static void reset_die(struct cached_die *cd)
+{
+	struct cached_item *tmp;
+	struct cached_item *ci = cd->list;
+
+	while (ci) {
+		if (ci->type == STRING)
+			free(ci->data.str);
+
+		tmp = ci->next;
+		free(ci);
+		ci = tmp;
+	}
+
+	cd->state = INCOMPLETE;
+	cd->list = NULL;
+}
+
+void cache_free(void)
+{
+	struct cached_die *cd;
+	struct hlist_node *tmp;
+	int i;
+
+	hash_for_each_safe(die_cache, i, tmp, cd, hash) {
+		reset_die(cd);
+		free(cd);
+	}
+	hash_init(die_cache);
+
+	if ((cache_hits + cache_misses > 0))
+		debug("cache: hits %u, misses %u (hit rate %.02f%%)",
+		      cache_hits, cache_misses,
+		      (100.0f * cache_hits) / (cache_hits + cache_misses));
+}
+
+static int append_item(struct cached_die *cd, struct cached_item **res)
+{
+	struct cached_item *prev;
+	struct cached_item *ci;
+
+	ci = malloc(sizeof(struct cached_item));
+	if (!ci) {
+		error("malloc failed");
+		return -1;
+	}
+
+	ci->type = EMPTY;
+	ci->next = NULL;
+
+	prev = cd->list;
+	while (prev && prev->next)
+		prev = prev->next;
+
+	if (prev)
+		prev->next = ci;
+	else
+		cd->list = ci;
+
+	*res = ci;
+	return 0;
+}
+
+int cache_add_string(struct cached_die *cd, const char *str)
+{
+	struct cached_item *ci;
+
+	if (!cd)
+		return 0;
+
+	check(append_item(cd, &ci));
+
+	ci->data.str = strdup(str);
+	if (!ci->data.str) {
+		error("strdup failed");
+		return -1;
+	}
+
+	ci->type = STRING;
+	return 0;
+}
+
+int cache_add_die(struct cached_die *cd, Dwarf_Die *die)
+{
+	struct cached_item *ci;
+
+	if (!cd)
+		return 0;
+
+	check(append_item(cd, &ci));
+	ci->data.addr = (uintptr_t)die->addr;
+	ci->type = DIE;
+	return 0;
+}
diff --git a/tools/gendwarfksyms/gendwarfksyms.c b/tools/gendwarfksyms/gendwarfksyms.c
index 7938b7440674..38ccaeb72426 100644
--- a/tools/gendwarfksyms/gendwarfksyms.c
+++ b/tools/gendwarfksyms/gendwarfksyms.c
@@ -15,12 +15,15 @@
 
 /* Print type descriptions and debugging output to stderr */
 bool debug;
+/* Don't use caching */
+bool no_cache;
 
 static const struct {
 	const char *arg;
 	bool *flag;
 } options[] = {
 	{ "--debug", &debug },
+	{ "--no-cache", &no_cache },
 };
 
 static int usage(void)
@@ -126,6 +129,7 @@ int main(int argc, const char **argv)
 
 	dwfl_end(dwfl);
 	symbol_print_versions();
+	cache_free();
 
 	return 0;
 }
diff --git a/tools/gendwarfksyms/gendwarfksyms.h b/tools/gendwarfksyms/gendwarfksyms.h
index 7440f1c73500..ea5a9fbda66f 100644
--- a/tools/gendwarfksyms/gendwarfksyms.h
+++ b/tools/gendwarfksyms/gendwarfksyms.h
@@ -18,6 +18,7 @@
  * Options -- in gendwarfksyms.c
  */
 extern bool debug;
+extern bool no_cache;
 
 /*
  * Output helpers
@@ -69,6 +70,35 @@ extern int symbol_read_list(FILE *file);
 extern struct symbol *symbol_get(uintptr_t addr, const char *name);
 extern void symbol_print_versions(void);
 
+/*
+ * cache.c
+ */
+enum cached_item_type { EMPTY, STRING, DIE };
+
+struct cached_item {
+	enum cached_item_type type;
+	union {
+		char *str;
+		uintptr_t addr;
+	} data;
+	struct cached_item *next;
+};
+
+enum cached_die_state { INCOMPLETE, COMPLETE };
+
+struct cached_die {
+	enum cached_die_state state;
+	uintptr_t addr;
+	struct cached_item *list;
+	struct hlist_node hash;
+};
+
+extern int cache_get(Dwarf_Die *die, enum cached_die_state state,
+		     struct cached_die **res);
+extern int cache_add_string(struct cached_die *pd, const char *str);
+extern int cache_add_die(struct cached_die *pd, Dwarf_Die *die);
+extern void cache_free(void);
+
 /*
  * types.c
  */
@@ -81,12 +111,13 @@ struct state {
 	unsigned long crc;
 };
 
-typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
+typedef int (*die_callback_t)(struct state *state, struct cached_die *cache,
+			      Dwarf_Die *die);
 typedef bool (*die_match_callback_t)(Dwarf_Die *die);
 extern bool match_all(Dwarf_Die *die);
 
-extern int process_die_container(struct state *state, Dwarf_Die *die,
-				 die_callback_t func,
+extern int process_die_container(struct state *state, struct cached_die *cache,
+				 Dwarf_Die *die, die_callback_t func,
 				 die_match_callback_t match);
 
 extern int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie);
diff --git a/tools/gendwarfksyms/types.c b/tools/gendwarfksyms/types.c
index 7508d0fb8b80..78046c08be23 100644
--- a/tools/gendwarfksyms/types.c
+++ b/tools/gendwarfksyms/types.c
@@ -72,7 +72,7 @@ static Dwarf_Die *get_exported(struct state *state, Dwarf_Die *die)
 /*
  * Type string and CRC processing
  */
-static int process(struct state *state, const char *s)
+static int process(struct state *state, struct cached_die *cache, const char *s)
 {
 	s = s ?: "<null>";
 
@@ -80,12 +80,13 @@ static int process(struct state *state, const char *s)
 		fputs(s, stderr);
 
 	state->crc = partial_crc32(s, state->crc);
-	return 0;
+	return cache_add_string(cache, s);
 }
 
 #define MAX_FMT_BUFFER_SIZE 128
 
-static int process_fmt(struct state *state, const char *fmt, ...)
+static int process_fmt(struct state *state, struct cached_die *cache,
+		       const char *fmt, ...)
 {
 	char buf[MAX_FMT_BUFFER_SIZE];
 	va_list args;
@@ -98,7 +99,7 @@ static int process_fmt(struct state *state, const char *fmt, ...)
 		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
 		res = -1;
 	} else {
-		check(process(state, buf));
+		check(process(state, cache, buf));
 	}
 
 	va_end(args);
@@ -106,7 +107,8 @@ static int process_fmt(struct state *state, const char *fmt, ...)
 }
 
 /* Process a fully qualified name from DWARF scopes */
-static int process_fqn(struct state *state, Dwarf_Die *die)
+static int process_fqn(struct state *state, struct cached_die *cache,
+		       Dwarf_Die *die)
 {
 	Dwarf_Die *scopes = NULL;
 	const char *name;
@@ -117,7 +119,7 @@ static int process_fqn(struct state *state, Dwarf_Die *die)
 	if (!res) {
 		name = get_name(die);
 		name = name ?: "<unnamed>";
-		return check(process(state, name));
+		return check(process(state, cache, name));
 	}
 
 	for (i = res - 1; i >= 0; i--) {
@@ -126,25 +128,25 @@ static int process_fqn(struct state *state, Dwarf_Die *die)
 
 		name = get_name(&scopes[i]);
 		name = name ?: "<unnamed>";
-		check(process(state, name));
+		check(process(state, cache, name));
 		if (i > 0)
-			check(process(state, "::"));
+			check(process(state, cache, "::"));
 	}
 
 	free(scopes);
 	return 0;
 }
 
-#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                         \
-	static int process_##attribute##_attr(struct state *state,        \
-					      Dwarf_Die *die)             \
-	{                                                                 \
-		Dwarf_Word value;                                         \
-		if (get_udata_attr(die, DW_AT_##attribute, &value))       \
-			check(process_fmt(state,                          \
-					  " " #attribute "(%" PRIu64 ")", \
-					  value));                        \
-		return 0;                                                 \
+#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                              \
+	static int process_##attribute##_attr(                                 \
+		struct state *state, struct cached_die *cache, Dwarf_Die *die) \
+	{                                                                      \
+		Dwarf_Word value;                                              \
+		if (get_udata_attr(die, DW_AT_##attribute, &value))            \
+			check(process_fmt(state, cache,                        \
+					  " " #attribute "(%" PRIu64 ")",      \
+					  value));                             \
+		return 0;                                                      \
 	}
 
 DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
@@ -155,8 +157,9 @@ bool match_all(Dwarf_Die *die)
 	return true;
 }
 
-int process_die_container(struct state *state, Dwarf_Die *die,
-			  die_callback_t func, die_match_callback_t match)
+int process_die_container(struct state *state, struct cached_die *cache,
+			  Dwarf_Die *die, die_callback_t func,
+			  die_match_callback_t match)
 {
 	Dwarf_Die current;
 	int res;
@@ -164,32 +167,65 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	res = check(dwarf_child(die, &current));
 	while (!res) {
 		if (match(&current))
-			check(func(state, &current));
+			check(func(state, cache, &current));
 		res = check(dwarf_siblingof(&current, &current));
 	}
 
 	return 0;
 }
 
-static int process_type(struct state *state, Dwarf_Die *die);
+static int process_type(struct state *state, struct cached_die *parent,
+			Dwarf_Die *die);
 
-static int process_type_attr(struct state *state, Dwarf_Die *die)
+static int process_type_attr(struct state *state, struct cached_die *cache,
+			     Dwarf_Die *die)
 {
 	Dwarf_Die type;
 
 	if (get_ref_die_attr(die, DW_AT_type, &type))
-		return check(process_type(state, &type));
+		return check(process_type(state, cache, &type));
 
 	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
-	return check(process(state, "base_type void"));
+	return check(process(state, cache, "base_type void"));
+}
+
+static int process_base_type(struct state *state, struct cached_die *cache,
+			     Dwarf_Die *die)
+{
+	check(process(state, cache, "base_type "));
+	check(process_fqn(state, cache, die));
+	check(process_byte_size_attr(state, cache, die));
+	return check(process_alignment_attr(state, cache, die));
 }
 
-static int process_base_type(struct state *state, Dwarf_Die *die)
+static int process_cached(struct state *state, struct cached_die *cache,
+			  Dwarf_Die *die)
 {
-	check(process(state, "base_type "));
-	check(process_fqn(state, die));
-	check(process_byte_size_attr(state, die));
-	return check(process_alignment_attr(state, die));
+	struct cached_item *ci = cache->list;
+	Dwarf_Die child;
+
+	while (ci) {
+		switch (ci->type) {
+		case STRING:
+			check(process(state, NULL, ci->data.str));
+			break;
+		case DIE:
+			if (!dwarf_die_addr_die(state->dbg,
+						(void *)ci->data.addr,
+						&child)) {
+				error("dwarf_die_addr_die failed");
+				return -1;
+			}
+			check(process_type(state, NULL, &child));
+			break;
+		default:
+			error("empty cached_item");
+			return -1;
+		}
+		ci = ci->next;
+	}
+
+	return 0;
 }
 
 static void state_init(struct state *state)
@@ -197,19 +233,41 @@ static void state_init(struct state *state)
 	state->crc = 0xffffffff;
 }
 
-static int process_type(struct state *state, Dwarf_Die *die)
+static int process_type(struct state *state, struct cached_die *parent,
+			Dwarf_Die *die)
 {
+	struct cached_die *cache = NULL;
 	int tag = dwarf_tag(die);
 
+	/*
+	 * If we have the DIE already cached, use it instead of walking
+	 * through DWARF.
+	 */
+	if (!no_cache) {
+		check(cache_get(die, COMPLETE, &cache));
+
+		if (cache->state == COMPLETE) {
+			check(process_cached(state, cache, die));
+			check(cache_add_die(parent, die));
+			return 0;
+		}
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
 
+	if (!no_cache) {
+		/* Update cache state and append to the parent (if any) */
+		cache->state = COMPLETE;
+		check(cache_add_die(parent, die));
+	}
+
 	return 0;
 }
 
@@ -218,17 +276,18 @@ static int process_type(struct state *state, Dwarf_Die *die)
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
 
-static int process_exported_symbols(struct state *state, Dwarf_Die *die)
+static int process_exported_symbols(struct state *state,
+				    struct cached_die *cache, Dwarf_Die *die)
 {
 	int tag = dwarf_tag(die);
 
@@ -237,8 +296,9 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
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
@@ -271,5 +331,5 @@ int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie)
 	struct state state = { .mod = mod, .dbg = dbg };
 
 	return check(process_die_container(
-		&state, cudie, process_exported_symbols, match_all));
+		&state, NULL, cudie, process_exported_symbols, match_all));
 }
-- 
2.45.2.627.g7a2c4fd464-goog


