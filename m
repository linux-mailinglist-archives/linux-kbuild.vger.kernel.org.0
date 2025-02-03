Return-Path: <linux-kbuild+bounces-5608-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D80A26584
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2025 22:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D09E63A29F2
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2025 21:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F72A20F089;
	Mon,  3 Feb 2025 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T6U9qiRe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A620E71F
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Feb 2025 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738617997; cv=none; b=ckt4ufBQnQrkG/OtyEv11cAZ0BPGYyn/Xjo1pm34NAiKr6liJtAcHLBSkQA8zbq+8Tw5cA/VTRTGyLW9QWYYRO4J+V+RaeMbvz+aQ+lvBkUNCabQLjIDzDO2KcS69m5/aic0vXyU2MotSEl9BblNevFPHx+UHxteOzH/CEdjEFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738617997; c=relaxed/simple;
	bh=JeDac0q7kV6pCKlgWMuLm1akLXt+s+WKT6IT+w2VOew=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KnnsPfovxfoV1Px3VvhFSe9wnuxsE0nYCH7Q8zb6GJZqmngbvuaPytXAvGl4F57hc6FwYSXpvilfZ7FcsoQamPpefFZ/ju5ZOJBsA+PJYCMxdBsK7WckW2i1sCT/Un75nOObXPgBPe1RGxVJpoyKCQtPV/o5kcvt9CMP9ET6n5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T6U9qiRe; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21655569152so106796555ad.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2025 13:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738617995; x=1739222795; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xjzG1KpOB33WO7MG4/hnojjzcuAojKCRhLZ9X+LEtag=;
        b=T6U9qiReiV9A1GVTwHgWeFB7H3+8Sv13EzJXP3NcC59QcclvEBRba2KBLmvlIjNtBk
         fzlSvW+s803cNkM8er694Bwx6dk3MPE4485DT+eJfbLFFAn9/VSgN7yuhsE0PihnICMT
         ZDRLYsIb2HNQBhhIwYRHcO014dFnL8ux1bFqe8fZFub32MlXnXP9VlV8mAwRjars1sQc
         B6m7zilFTMnL0gCZVDssPKJULL2rJMeXc8kPSIt9bce/p+OwMTjPUNl1iAmh4ZjCDXoN
         pjpm4+ukp3zWqV6m6ok2gc2SH3tJZWR2PJ6kDJcHy30f21bPGAG2oUg+BZaF+C6+zsFL
         qNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738617995; x=1739222795;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjzG1KpOB33WO7MG4/hnojjzcuAojKCRhLZ9X+LEtag=;
        b=bq3QgSDwaAFGzsKQ4jOTkU22xTrHO6g64B42LOUR8n0Iq2FEBqI+JZC/kGXyIGAVcU
         92OPSXnUP9A/XZxCU9IlveCe2nyDg9p/3xZQRBcmUL4WQ2kdr7uGA+fgR9EPakLa8+CF
         ag+u4jbK6T6in4ReTnTDwBQNZQajdY3tHa2WOQW/jhZDyYlgHMc3StnVj02r5P1lIfCz
         1EhA7+MOq+0ecv+ympWe7ZfWikchJAIGDq+HKpwPnUpk0qBUQlp2jk8KGZh9jmYgFKOe
         I5M4YK+up7yqw0HUfrVof1ntyBvm6ZYErb//lyCLvF/Qw2i/eLFNUinqS0Yv6z5wc/wK
         yBZw==
X-Forwarded-Encrypted: i=1; AJvYcCUY9dLguH20J31djgVmdMYzd1IDuzZqf/aSkXD7+JNByOtsPEYLx4zzXNWZA2gJ8JeB536qILTgZsRX42g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJ0qlPQgJOascJexjYChOAOXZCKd7QeNwZ3x0dbbgaUwRznG9
	etqv77bQvnhky8pB9kRs+NcIC3co4le3kzAbrGYy83iZE3U3BIO2cYO4RXMBpFDnX5+mRqaKNnc
	u6ITTYTCVZFwaOBHfWRWV/S1Kkw==
X-Google-Smtp-Source: AGHT+IFp8Bb1uts8l0ivJKmHnFfAT/7nzBCLJaIOvCG8JcYD0WSwRz844mjcXsBSV6UmkLE4IXKqBJ2dFLizO3GXShk=
X-Received: from pfbik10.prod.google.com ([2002:a05:6a00:8d0a:b0:72b:ccb:c99b])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e88:b0:725:df1a:288 with SMTP id d2e1a72fcca58-72fd0c74f49mr37105211b3a.24.1738617994983;
 Mon, 03 Feb 2025 13:26:34 -0800 (PST)
Date: Mon,  3 Feb 2025 21:26:32 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=8722; i=samitolvanen@google.com;
 h=from:subject; bh=JeDac0q7kV6pCKlgWMuLm1akLXt+s+WKT6IT+w2VOew=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkLTdpPikoo/T7Vf3b7ZPFZ8dkdAeH/J8trcKxRl+sXP
 mjcE7iko5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEykyI7hr1x8j3Yj5+52gziL
 jIn8a78dnuehxTixh22uB2fupqveqgz/DNeevHjKdQpLxy2Zu+Ih/q9W9RUXfbTQM/nluW7O/e1 tfAA=
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250203212631.565818-2-samitolvanen@google.com>
Subject: [PATCH] gendwarfksyms: Add a separate pass to resolve FQNs
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

Using dwarf_getscopes_die to resolve fully-qualified names turns out to
be rather slow, and also results in duplicate scopes being processed,
which doesn't help. Simply adding an extra pass to resolve names for all
DIEs before processing exports is noticeably faster.

For the object files with the most exports in a defconfig+Rust build,
the performance improvement is consistently >50%:

rust/bindings.o: 1038 exports
    before: 9.5980 +- 0.0183 seconds time elapsed  ( +-  0.19% )
     after: 4.3116 +- 0.0287 seconds time elapsed  ( +-  0.67% )

rust/core.o: 424 exports
    before: 5.3584 +- 0.0204 seconds time elapsed  ( +-  0.38% )
     after: 0.05348 +- 0.00129 seconds time elapsed  ( +-  2.42% )
            ^ Not a mistake.

net/core/dev.o: 190 exports
    before: 9.0507 +- 0.0297 seconds time elapsed  ( +-  0.33% )
     after: 3.2882 +- 0.0165 seconds time elapsed  ( +-  0.50% )

rust/kernel.o: 129 exports
    before: 6.8571 +- 0.0317 seconds time elapsed  ( +-  0.46% )
     after: 2.9096 +- 0.0316 seconds time elapsed  ( +-  1.09% )

net/core/skbuff.o: 120 exports
    before: 5.4805 +- 0.0291 seconds time elapsed  ( +-  0.53% )
     after: 2.0339 +- 0.0231 seconds time elapsed  ( +-  1.14% )

drivers/gpu/drm/display/drm_dp_helper.o: 101 exports
    before: 1.7877 +- 0.0187 seconds time elapsed  ( +-  1.05% )
     after: 0.69245 +- 0.00994 seconds time elapsed  ( +-  1.44% )

net/core/sock.o: 97 exports
    before: 5.8327 +- 0.0653 seconds time elapsed  ( +-  1.12% )
     after: 2.0784 +- 0.0291 seconds time elapsed  ( +-  1.40% )

drivers/net/phy/phy_device.o: 95 exports
    before: 3.0671 +- 0.0371 seconds time elapsed  ( +-  1.21% )
     after: 1.2127 +- 0.0207 seconds time elapsed  ( +-  1.70% )

drivers/pci/pci.o: 93 exports
    before: 1.1130 +- 0.0113 seconds time elapsed  ( +-  1.01% )
     after: 0.4848 +- 0.0127 seconds time elapsed  ( +-  2.63% )

kernel/sched/core.o: 83 exports
    before: 3.5092 +- 0.0223 seconds time elapsed  ( +-  0.64% )
     after: 1.1231 +- 0.0145 seconds time elapsed  ( +-  1.29% )

Overall, a defconfig+DWARF5 build with gendwarfksyms and Rust is 14.8%
faster with this patch applied on my test system. Without Rust, there's
still a 10.4% improvement in build time when gendwarfksyms is used.

Note that symbol versions are unchanged with this patch.

Suggested-by: Giuliano Procida <gprocida@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/die.c           |   2 +-
 scripts/gendwarfksyms/dwarf.c         | 152 ++++++++++++++------------
 scripts/gendwarfksyms/gendwarfksyms.h |   2 +
 scripts/gendwarfksyms/types.c         |   2 +-
 4 files changed, 86 insertions(+), 72 deletions(-)

diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index 66bd4c9bc952..6183bbbe7b54 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -6,7 +6,7 @@
 #include <string.h>
 #include "gendwarfksyms.h"
 
-#define DIE_HASH_BITS 15
+#define DIE_HASH_BITS 16
 
 /* {die->addr, state} -> struct die * */
 static HASHTABLE_DEFINE(die_map, 1 << DIE_HASH_BITS);
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 534d9aa7c114..eed247d8abfc 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#define _GNU_SOURCE
 #include <assert.h>
 #include <inttypes.h>
 #include <stdarg.h>
@@ -193,79 +194,17 @@ static void process_fmt(struct die *cache, const char *fmt, ...)
 	va_end(args);
 }
 
-#define MAX_FQN_SIZE 64
-
-/* Get a fully qualified name from DWARF scopes */
-static char *get_fqn(Dwarf_Die *die)
+static void update_fqn(struct die *cache, Dwarf_Die *die)
 {
-	const char *list[MAX_FQN_SIZE];
-	Dwarf_Die *scopes = NULL;
-	bool has_name = false;
-	char *fqn = NULL;
-	char *p;
-	int count = 0;
-	int len = 0;
-	int res;
-	int i;
-
-	res = checkp(dwarf_getscopes_die(die, &scopes));
-	if (!res) {
-		list[count] = get_name_attr(die);
-
-		if (!list[count])
-			return NULL;
-
-		len += strlen(list[count]);
-		count++;
-
-		goto done;
-	}
-
-	for (i = res - 1; i >= 0 && count < MAX_FQN_SIZE; i--) {
-		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
-			continue;
-
-		list[count] = get_name_attr(&scopes[i]);
-
-		if (list[count]) {
-			has_name = true;
-		} else {
-			list[count] = "<anonymous>";
-			has_name = false;
-		}
+	struct die *fqn;
 
-		len += strlen(list[count]);
-		count++;
-
-		if (i > 0) {
-			list[count++] = "::";
-			len += 2;
-		}
+	if (!cache->fqn) {
+		if (!__die_map_get((uintptr_t)die->addr, DIE_FQN, &fqn) &&
+		    *fqn->fqn)
+			cache->fqn = xstrdup(fqn->fqn);
+		else
+			cache->fqn = "";
 	}
-
-	free(scopes);
-
-	if (count == MAX_FQN_SIZE)
-		warn("increase MAX_FQN_SIZE: reached the maximum");
-
-	/* Consider the DIE unnamed if the last scope doesn't have a name */
-	if (!has_name)
-		return NULL;
-done:
-	fqn = xmalloc(len + 1);
-	*fqn = '\0';
-
-	p = fqn;
-	for (i = 0; i < count; i++)
-		p = stpcpy(p, list[i]);
-
-	return fqn;
-}
-
-static void update_fqn(struct die *cache, Dwarf_Die *die)
-{
-	if (!cache->fqn)
-		cache->fqn = get_fqn(die) ?: "";
 }
 
 static void process_fqn(struct die *cache, Dwarf_Die *die)
@@ -1148,8 +1087,81 @@ static void process_symbol_ptr(struct symbol *sym, void *arg)
 	cache_free(&state.expansion_cache);
 }
 
+static int resolve_fqns(struct state *parent, struct die *unused,
+			Dwarf_Die *die)
+{
+	struct state state;
+	struct die *cache;
+	const char *name;
+	bool use_prefix;
+	char *prefix = NULL;
+	char *fqn = "";
+	int tag;
+
+	if (!__die_map_get((uintptr_t)die->addr, DIE_FQN, &cache))
+		return 0;
+
+	tag = dwarf_tag(die);
+
+	/*
+	 * Only namespaces and structures need to pass a prefix to the next
+	 * scope.
+	 */
+	use_prefix = tag == DW_TAG_namespace || tag == DW_TAG_class_type ||
+		     tag == DW_TAG_structure_type;
+
+	state.expand.current_fqn = NULL;
+	name = get_name_attr(die);
+
+	if (parent && parent->expand.current_fqn && (use_prefix || name)) {
+		/*
+		 * The fqn for the current DIE, and if needed, a prefix for the
+		 * next scope.
+		 */
+		if (asprintf(&prefix, "%s::%s", parent->expand.current_fqn,
+			     name ? name : "<anonymous>") < 0)
+			error("asprintf failed");
+
+		if (use_prefix)
+			state.expand.current_fqn = prefix;
+
+		/*
+		 * Use fqn only if the DIE has a name. Otherwise fqn will
+		 * remain empty.
+		 */
+		if (name) {
+			fqn = prefix;
+			/* prefix will be freed by die_map. */
+			prefix = NULL;
+		}
+	} else if (name) {
+		/* No prefix from the previous scope. Use only the name. */
+		fqn = xstrdup(name);
+
+		if (use_prefix)
+			state.expand.current_fqn = fqn;
+	}
+
+	/* If the DIE has a non-empty name, cache it. */
+	if (*fqn) {
+		cache = die_map_get(die, DIE_FQN);
+		/* Move ownership of fqn to die_map. */
+		cache->fqn = fqn;
+		cache->state = DIE_FQN;
+	}
+
+	check(process_die_container(&state, NULL, die, resolve_fqns,
+				    match_all));
+
+	free(prefix);
+	return 0;
+}
+
 void process_cu(Dwarf_Die *cudie)
 {
+	check(process_die_container(NULL, NULL, cudie, resolve_fqns,
+				    match_all));
+
 	check(process_die_container(NULL, NULL, cudie, process_exported_symbols,
 				    match_all));
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 197a1a8123c6..2feec168bf73 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -139,6 +139,7 @@ void symbol_free(void);
 
 enum die_state {
 	DIE_INCOMPLETE,
+	DIE_FQN,
 	DIE_UNEXPANDED,
 	DIE_COMPLETE,
 	DIE_SYMBOL,
@@ -170,6 +171,7 @@ static inline const char *die_state_name(enum die_state state)
 {
 	switch (state) {
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
+	CASE_CONST_TO_STR(DIE_FQN)
 	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
 	CASE_CONST_TO_STR(DIE_SYMBOL)
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 6c03265f4d10..6f37289104ff 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -248,7 +248,7 @@ static char *get_type_name(struct die *cache)
 		warn("found incomplete cache entry: %p", cache);
 		return NULL;
 	}
-	if (cache->state == DIE_SYMBOL)
+	if (cache->state == DIE_SYMBOL || cache->state == DIE_FQN)
 		return NULL;
 	if (!cache->fqn || !*cache->fqn)
 		return NULL;

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1.362.g079036d154-goog


