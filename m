Return-Path: <linux-kbuild+bounces-7813-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C5AEFDEC
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 17:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA98F3BD2D6
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 15:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44142797A5;
	Tue,  1 Jul 2025 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pQRS+CO1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796827932B
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383228; cv=none; b=F9njyOVbuQ4pdbk7+PIKDltMKfpdabg2Q5HICUujkNs5rA0X8h1DlfIwyjyknN/5SRhpS7bFAyUzrsrG93cuFxe1qSmwXI/j4PcK2mhd5ulWeuZ1j3oeZYM7YOpiYj8mykl/nwkTFMTzXUqOua3ifFvMLxt3ZpeqFr6+ei8GEAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383228; c=relaxed/simple;
	bh=NfqJHrC70KrRvRT03h3FKFqjbqq4oRnI9qpYzXDWrLA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tTQj+ACbI+wFkn8OgWe0hyU/zH0dp7AFDuEOdgEiqc+Eqmh+v67fFbRnBBmQrhJ6HuEot1TNupeQD3Zv1VjMZvUOK4ZROsArvWqFcNV/nWtU6mujv0mdQKH84TB8eBwzws99MYNvYNvJedJuDxzISEqgIsrtF/kY02E91BSvWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pQRS+CO1; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so3713562f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jul 2025 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751383225; x=1751988025; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n9NaebKJibAgutzsepKI6CuTfNuoKinu08ccOPT+zBg=;
        b=pQRS+CO1S0OD4r2odSckvrFg9DVVUSd8xdiJOWeMGCR+55gqjWstJivQNJinQ4nzYZ
         27tNDv4lZx5DxRBgwCnd/vo4ZzMuRZ0UpTH42TSVo0sIbe3pAM9RM7EU+gJF29cZmcAs
         qA/GTXfd44U1Vrf+JnjU0dRil02iiIPZUIw9vdkAlGxwh0WFyRtIVn0poMT/2xoVIcMa
         tvhoH7sAMEUIvKMN67xAnPeyV+Wky9Fkfeo6RLu1kMEhXmzxrrhqUyYXE+pyxCPzn8YJ
         Q0OzGTIK7jL2Z9639Jrst9Lp91LqZV38zz+ILtPUtb28Xv6o/ZFVjV64sUQAm1FK82iE
         9fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383225; x=1751988025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9NaebKJibAgutzsepKI6CuTfNuoKinu08ccOPT+zBg=;
        b=Bm0q4P8hO/TedLcxOXD9RY1hzDkfHaWp55Sd+9zKgwJRvUS/C2QwMD7lxRGQ4T+moo
         yK9FSwPYa2DlhV1D0HWwQeHQbTQen/hXxoEC8IdYpa0Wc1ZsxhY5zRgpkVu18mRq4dzW
         pXDZk01T1wWG5AdXRFah+PESHEVMcvi2tyOJ+gvpJWg9ExI6hfNqcijFutjMtR1J/9qn
         oHobECLVRgoIez/7g36XP4jFAC5Iciwg0KfHatp4idLmvLDl/hEUjMg1ZaWclQNOjLUh
         8fyFBrrWlLYgqYAhDBhjlbkdaoYHS5WQQaXUOfuFn9x1mXnaRIL2fnpTjI6sWerROkUT
         zpkA==
X-Forwarded-Encrypted: i=1; AJvYcCU2mLIpM7y0lRNfTP0qLcRjBnsgNtxNi/qp1Z3WoeurP8+5a2Hcd73ceQ0LqsmBgBTPxxrEmYDeoQXbKfw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjd9C1kc8bBZI1TEjfumSSNCOZa5OBsl/uksvLwnFgxu+arc1a
	+fZ+TpSJiWVg+aZXmpABLAXBSNQ1NxjsFlAX4grI5Hz9gV68yejn1NGqFPrEmhQnqHpwvEfcLcg
	wB5k6KpRuTDY2Hw==
X-Google-Smtp-Source: AGHT+IHo0j0lmY49uISfqEt+SitHSrRX1NBmaGQGIgieiSEQyVwJA5vANI9q18/ygoSYgZtGRGtj2Nb+JtjrBQ==
X-Received: from wmbds5.prod.google.com ([2002:a05:600c:6285:b0:451:d70f:eb87])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:4a01:0:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a90d5a7e61mr14137301f8f.16.1751383225629;
 Tue, 01 Jul 2025 08:20:25 -0700 (PDT)
Date: Tue,  1 Jul 2025 16:19:10 +0100
In-Reply-To: <20250701152000.2477659-1-gprocida@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAK7LNASzE1CtRo9T4byPXJtB-HtuWsGe=OLba+8JU9fB28Chow@mail.gmail.com>
 <20250701152000.2477659-1-gprocida@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250701152000.2477659-2-gprocida@google.com>
Subject: [PATCH v2 1/2] gendwarfksyms: use preferred form of sizeof for allocation
From: Giuliano Procida <gprocida@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Giuliano Procida <gprocida@google.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The preferred form is to use the variable being allocated to, rather
than explicitly supplying a type name which might become stale.

Also do this for memset.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 scripts/gendwarfksyms/cache.c   | 2 +-
 scripts/gendwarfksyms/die.c     | 4 ++--
 scripts/gendwarfksyms/dwarf.c   | 2 +-
 scripts/gendwarfksyms/kabi.c    | 2 +-
 scripts/gendwarfksyms/symbols.c | 2 +-
 scripts/gendwarfksyms/types.c   | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

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
index 7bd459ea6c59..5344c7b9a9ce 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -43,7 +43,7 @@ static int type_list_append(struct list_head *list, const char *s, void *owned)
 	if (!s)
 		return 0;
 
-	entry = xmalloc(sizeof(struct type_list_entry));
+	entry = xmalloc(sizeof(*entry));
 	entry->str = s;
 	entry->owned = owned;
 	list_add_tail(&entry->list, list);
@@ -120,7 +120,7 @@ static struct type_expansion *type_map_add(const char *name,
 	struct type_expansion *e;
 
 	if (__type_map_get(name, &e)) {
-		e = xmalloc(sizeof(struct type_expansion));
+		e = xmalloc(sizeof(*e));
 		type_expansion_init(e);
 		e->name = xstrdup(name);
 
-- 
2.50.0.727.gbf7dc18ff4-goog


