Return-Path: <linux-kbuild+bounces-7793-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC92AEE0AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 16:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BFB17A225C
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 14:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B660130A54;
	Mon, 30 Jun 2025 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IfLPrwPR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04428C5D5
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2025 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293653; cv=none; b=NHlehKC2DPYMnnINvxshBE8cinfhfJ68MvLdXuVYDxab9SBfISLjA0wEg2rj1uBbfAqGLmoE47/uLhf+FZvhYE4ZarRJ3VPXwTX+JzD0BGpONdRtef9puS6euANgEdWFe8Rd4nj2y/XxliUaC0K8A0Dgq/mhXVdXrl5QYb0Ubrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293653; c=relaxed/simple;
	bh=9db6x0EMOe6E9j32qrzyr5EJwVkIl5FELxN4JFxD+Vo=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=KJnpjWHDQW4pRzY1BVmmMTuWf+P4aThsCf8Nv9+qyBwZHoNzs4Jgd2seumxZfs22WYFI1FSAVUrm/nRzq2SVHA4OakLJetZ59d8pAOE8HFzKx/q6+S/VBxxhAsFsi3/A11uj5vwWDr5dGB5wIRzpznZ1J/dPYX801glWzfaN2l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IfLPrwPR; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-452ff9e054eso21158925e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2025 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751293649; x=1751898449; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jA1+PqXVtq5JGGyS5bMqoIcyAvEWva/WB/dyQOqqHmU=;
        b=IfLPrwPRiBhes0PPyY2Z+uhQ9sKwhWI+TXfxpkv5rwO7JCpwn6QypgH6sTl0omM1fY
         gIUnGkvMaOegAnpBn9JoVXLKeF7MB1GvHXrlUFpzodjYRJaSiWjm3kgIS5E+qaIT12e9
         D5AkvFWARNa+5I4Z/FNhnibreqd0OC4u8dq7264Da7kD7ohT4h+vMm8TyVAvYYIn8Mcg
         99EMvWKgG9tiaeqcswUaocwqOBypDeM9WL3M0wcYyo9X+ffDNwe1IvtpCxviT8sUZc2S
         aJ3p68ROTlJbSnuM7Lw8eKtRj3FdBBcZ/HwkenMJZWH48trBjucz0SEvctHiLoy87v8w
         V90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293649; x=1751898449;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jA1+PqXVtq5JGGyS5bMqoIcyAvEWva/WB/dyQOqqHmU=;
        b=KrBQZRONIrKl8+Bz63OvUdb5IjNB9PAe0yYSjkb7Tc2UdWgaNt/bpkdr+RDKuwrrbF
         yQ7IfHZL/+AKJUxWZs5BGrR7GPqfsbB9e6LMJcwppE6Cs5qwAhiB04DNf9s8TxRa03+e
         tPCqp4lklWPX7truccns15iAsJ36FdlMcwoDBzU0PPXcGxnJIsStkwnNFoEdsD7C9kIi
         S/EFykn+OU7yjvDKQ7qKLVlN91NbyBX6lIvM3gaDRA8eKHXuP8Ct7szaR9yOTNvVnVzq
         lAHv3T5TEdppSYfG+smjIJNNTfxHHeVv6ztbeJ2LwC7qPJGSbGUN3dlkeu63Y2/rpQ9V
         dGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2hVVSNrsUSZj10LpoTSwn1IDdzWyrRE0DDvWMrD8gghIYxj3XQFV3H57/CHEcH+9loq6f/MtQH/yH/Dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhJQzhVRlqtoPzZAj18UMAJhCnXU7LvtegO1ArOfBCAPNpwxV9
	q1tSJm2NODSUitreScjXaCb2uNw54/0DddiG4ia00fjAV0VtA5J7IzRj7Dvm+p0HhXJAeD0Zqwq
	RISZT5IvwYQhMkg==
X-Google-Smtp-Source: AGHT+IGBSz5ftj1hVRQWPOaVGaFLmn6ZsnaOVoP8vhVwAtD0CuhsE+mmDdNHq577mQqHbTmGbmGPqxLU19jd1Q==
X-Received: from wmbay32.prod.google.com ([2002:a05:600c:1e20:b0:453:910:1a18])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c10c:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-4538ef7f8d3mr97825305e9.7.1751293649607;
 Mon, 30 Jun 2025 07:27:29 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:27:02 +0100
In-Reply-To: <CAGvU0HkKacQKB1q9NWcqChLGoMB+1vu9UdqYc+tBRbTTc3++GQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250630142713.1816049-1-gprocida@google.com>
Subject: [PATCH] gendwarfksyms: use preferred form of sizeof for allocation
From: Giuliano Procida <gprocida@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Giuliano Procida <gprocida@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The preferred form is to supply the variable being allocated to rather
than an explicit type name which might become stale.

Also do this for memset and qsort arguments.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 scripts/gendwarfksyms/cache.c   | 2 +-
 scripts/gendwarfksyms/die.c     | 4 ++--
 scripts/gendwarfksyms/dwarf.c   | 2 +-
 scripts/gendwarfksyms/kabi.c    | 2 +-
 scripts/gendwarfksyms/symbols.c | 2 +-
 scripts/gendwarfksyms/types.c   | 8 ++++----
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/gendwarfksyms/cache.c b/scripts/gendwarfksyms/cache.c
index c9c19b86a686..1c640db93db3 100644
--- a/scripts/gendwarfksyms/cache.c
+++ b/scripts/gendwarfksyms/cache.c
@@ -15,7 +15,7 @@ void cache_set(struct cache *cache, unsigned long key, int value)
 {
 	struct cache_item *ci;
 
-	ci = xmalloc(sizeof(struct cache_item));
+	ci = xmalloc(sizeof(*ci));
 	ci->key = key;
 	ci->value = value;
 	hash_add(cache->cache, &ci->hash, hash_32(key));
diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index 6183bbbe7b54..052f7a3f975a 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -33,7 +33,7 @@ static struct die *create_die(Dwarf_Die *die, enum die_state state)
 {
 	struct die *cd;
 
-	cd = xmalloc(sizeof(struct die));
+	cd = xmalloc(sizeof(*cd));
 	init_die(cd);
 	cd->addr = (uintptr_t)die->addr;
 
@@ -123,7 +123,7 @@ static struct die_fragment *append_item(struct die *cd)
 {
 	struct die_fragment *df;
 
-	df = xmalloc(sizeof(struct die_fragment));
+	df = xmalloc(sizeof(*df));
 	df->type = FRAGMENT_EMPTY;
 	list_add_tail(&df->list, &cd->fragments);
 	return df;
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 13ea7bf1ae7d..3538a7d9cb07 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -634,7 +634,7 @@ static int get_union_kabi_status(Dwarf_Die *die, Dwarf_Die *placeholder,
 	 * Note that the user of this feature is responsible for ensuring
 	 * that the structure actually remains ABI compatible.
 	 */
-	memset(&state.kabi, 0, sizeof(struct kabi_state));
+	memset(&state.kabi, 0, sizeof(state.kabi));
 
 	res = checkp(process_die_container(&state, NULL, die,
 					   check_union_member_kabi_status,
diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
index b3ade713778f..e3c2a3ccf51a 100644
--- a/scripts/gendwarfksyms/kabi.c
+++ b/scripts/gendwarfksyms/kabi.c
@@ -228,7 +228,7 @@ void kabi_read_rules(int fd)
 		if (type == KABI_RULE_TYPE_UNKNOWN)
 			error("unsupported kABI rule type: '%s'", field);
 
-		rule = xmalloc(sizeof(struct rule));
+		rule = xmalloc(sizeof(*rule));
 
 		rule->type = type;
 		rule->target = xstrdup(get_rule_field(&rule_str, &left));
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 327f87389c34..35ed594f0749 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -146,7 +146,7 @@ void symbol_read_exports(FILE *file)
 			continue;
 		}
 
-		sym = xcalloc(1, sizeof(struct symbol));
+		sym = xcalloc(1, sizeof(*sym));
 		sym->name = name;
 		sym->addr.section = SHN_UNDEF;
 		sym->state = SYMBOL_UNPROCESSED;
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 51c1471e8684..9c3b053bf061 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -45,7 +45,7 @@ static int type_list_append(struct list_head *list, const char *s, void *owned)
 	if (!s)
 		return 0;
 
-	entry = xmalloc(sizeof(struct type_list_entry));
+	entry = xmalloc(sizeof(*entry));
 	entry->str = s;
 	entry->owned = owned;
 	list_add_tail(&entry->list, list);
@@ -122,7 +122,7 @@ static struct type_expansion *type_map_add(const char *name,
 	struct type_expansion *e;
 
 	if (__type_map_get(name, &e)) {
-		e = xmalloc(sizeof(struct type_expansion));
+		e = xmalloc(sizeof(*e));
 		type_expansion_init(e);
 		e->name = xstrdup(name);
 
@@ -202,11 +202,11 @@ static void type_map_write(FILE *file)
 
 	hash_for_each_safe(type_map, e, tmp, hash)
 		++count;
-	es = xmalloc(count * sizeof(struct type_expansion *));
+	es = xmalloc(count * sizeof(*es));
 	hash_for_each_safe(type_map, e, tmp, hash)
 		es[i++] = e;
 
-	qsort(es, count, sizeof(struct type_expansion *), cmp_expansion_name);
+	qsort(es, count, sizeof(*es), cmp_expansion_name);
 
 	for (i = 0; i < count; ++i) {
 		checkp(fputs(es[i]->name, file));
-- 
2.50.0.727.gbf7dc18ff4-goog


