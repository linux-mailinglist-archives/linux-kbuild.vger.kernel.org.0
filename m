Return-Path: <linux-kbuild+bounces-4410-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB1F9B6A4C
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 945131F21293
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B540321FDAC;
	Wed, 30 Oct 2024 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G83lBC+H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5B21F4BC
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307691; cv=none; b=iy06WRzUyDz8+/7lhQcqwMwtBCDEhlkAMq8EOxOEAb1vfdrzYELCgDfncRmGmBgGr2r4BNSxTtDf2VokKcOK+uy2zbvOEWAg8b+kb3xd2btb8MJ9B+44VU+IAgOLglTIbbsMy93d8g9g75J4UDRlsUhuOl1mucO3j5WFSR8UYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307691; c=relaxed/simple;
	bh=5eXj0tEpnkW5tjOBSP7mXKcpGF+Gg3iNj6445CGq4/4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SDE6393nIckd3aieql+Bu4aeLCdTz+PEckqL/K+HpeGljlO+KEfV719E/dqk0x5YfcA5LiVEuGWTw3MhubZ/7G/6HbEAc0IUPxz79HxtH6ipeSWkbib1GBDrhiEs3nwS8LZArlEMbx46pnRNJJK5W+ryjiYMa05zB+hxoZY/aIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G83lBC+H; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e355f1ff4bso122780567b3.2
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307687; x=1730912487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+0CEg5FUGKNpBMSgAmCCgbcSeLS0u4J4fo9kx62CARA=;
        b=G83lBC+H+sbCRbT93xtC6DwIEVZ1qjgMNpl0UV6iaaW7HEiYBEYi7WGsTvJkHgqkDD
         36aQNR22srf4595FnlFEwKWNcKI38ekiiP9qVRtRTgmOEVydbcJkTDmJAt3EOFU/7+Ic
         EpSkgWB5V0sG69n41DOM0SFy88DIsNiUPdjYtj4+ArkmngFTnJpUXKJX9On2yndxbz0v
         BWOZS2XYHNGOjfNohi2rKSlJU6wMuKzhTH6tdeDevhao6EP8FNqub1VGZUOxSrPRG/SF
         kYXDEjZkfuswErqod2uYJrGGR/ABeDVZG0fkNlEakqth1nGAayDuY9XMzwGfNunOPzqk
         FXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307687; x=1730912487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0CEg5FUGKNpBMSgAmCCgbcSeLS0u4J4fo9kx62CARA=;
        b=pVSdlC9N+yCWde/ZdhZdqEdRnfWUzxRTbrLFkQVdVdD+CpNjHmS9Jx5lg3/Dvkstpj
         HNstknE23NTeNjZ6oj7eyqljRfqZkUr4GatzdT5WigAapgoGEXbACgAPWPDBUxT/Gsec
         aNvSK1D2wu+QXzWHaGuVtzxkk5mNpzuEFeyQNhXdnPRavsKHg7y3ldi4YJlBk0ZScMWs
         AAJn0YfMiZVZ0J8945MG+jmtrygeJ9Z+yqnx1HUzQZ/HaYh2ncfVhmUsQEhk7qGfHe5p
         reVOvrSfeifaH1m6DRStpVdY3X6G/TIShQtCR73XQ/zUJplhsy77BrkDD3jckEBrjExW
         NCFg==
X-Forwarded-Encrypted: i=1; AJvYcCXpglEYwUm0w0sOl6kNhT8cDCawpRXroGUu6xromNKVkBY2TN/T7sbFFFoWOm2DCjcxtstmZCk+3czBIx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYAvhdlXAqEU+W2R/Yf09dfkFE3hdORiYTzxuQvDf3YVy9u0C
	lo0APZCC8Ag/gz2LLqqu7qn1gXDaXS9V5qde17XRpPc+twzcYZD9ujSnMqahxJCoD/1CUgtQ9a+
	zHPu0OuupT5V4Bci7DR/HOEcA3g==
X-Google-Smtp-Source: AGHT+IFzUSIPggqBwoIus0XarzMHbAAIBVagF9e03Cy4gYN0HmJM3uWbut7tcenH6nqDWV8ayplzWyYrD7AEjBzkFFY=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:6488:b0:6e3:1f46:77a6 with
 SMTP id 00721157ae682-6e9d892d7c2mr10458827b3.2.1730307687308; Wed, 30 Oct
 2024 10:01:27 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:10 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7325; i=samitolvanen@google.com;
 h=from:subject; bh=5eXj0tEpnkW5tjOBSP7mXKcpGF+Gg3iNj6445CGq4/4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaSGtGQs7Sn2Ld/yUuKUX89mrIX3r6VZpC+XvR+vNu
 XwY5sh2lLIwiHEwyIopsrR8Xb1193en1FefiyRg5rAygQxh4OIUgIncncPIsN5j/6wg/hsrprDW
 l+vyXbvNzT7l3fPsKJu3kzM+nZ3vfJmR4dXmiA8TQ3Yf8spsX8h9suBig/+9jJvTt5w4qKN610v 0DysA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-24-samitolvanen@google.com>
Subject: [PATCH v5 03/19] gendwarfksyms: Add address matching
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

The compiler may choose not to emit type information in DWARF for all
aliases, but it's possible for each alias to be exported separately.
To ensure we find type information for the aliases as well, read
{section, address} tuples from the symbol table and match symbols also
by address.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 scripts/gendwarfksyms/gendwarfksyms.c |   2 +
 scripts/gendwarfksyms/gendwarfksyms.h |  13 +++
 scripts/gendwarfksyms/symbols.c       | 161 ++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index f84fa98fcbdb..1763234b6329 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -103,6 +103,8 @@ int main(int argc, char **argv)
 			error("open failed for '%s': %s", argv[n],
 			      strerror(errno));
 
+		symbol_read_symtab(fd);
+
 		dwfl = dwfl_begin(&callbacks);
 		if (!dwfl)
 			error("dwfl_begin failed for '%s': %s", argv[n],
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index c5437ee31321..f75d8ca33b45 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -66,14 +66,27 @@ extern int dump_dies;
  * symbols.c
  */
 
+static inline unsigned int addr_hash(uintptr_t addr)
+{
+	return hash_ptr((const void *)addr);
+}
+
+struct symbol_addr {
+	uint32_t section;
+	Elf64_Addr address;
+};
+
 struct symbol {
 	const char *name;
+	struct symbol_addr addr;
+	struct hlist_node addr_hash;
 	struct hlist_node name_hash;
 };
 
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);
 
 void symbol_read_exports(FILE *file);
+void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
 void symbol_free(void);
 
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 2c901670224b..e7343394248b 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -6,8 +6,39 @@
 #include "gendwarfksyms.h"
 
 #define SYMBOL_HASH_BITS 15
+
+/* struct symbol_addr -> struct symbol */
+static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
+/* name -> struct symbol */
 static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
 
+static inline unsigned int symbol_addr_hash(const struct symbol_addr *addr)
+{
+	return hash_32(addr->section ^ addr_hash(addr->address));
+}
+
+static unsigned int __for_each_addr(struct symbol *sym, symbol_callback_t func,
+				    void *data)
+{
+	struct hlist_node *tmp;
+	struct symbol *match = NULL;
+	unsigned int processed = 0;
+
+	hash_for_each_possible_safe(symbol_addrs, match, tmp, addr_hash,
+				    symbol_addr_hash(&sym->addr)) {
+		if (match == sym)
+			continue; /* Already processed */
+
+		if (match->addr.section == sym->addr.section &&
+		    match->addr.address == sym->addr.address) {
+			func(match, data);
+			++processed;
+		}
+	}
+
+	return processed;
+}
+
 static unsigned int for_each(const char *name, symbol_callback_t func,
 			     void *data)
 {
@@ -22,9 +53,13 @@ static unsigned int for_each(const char *name, symbol_callback_t func,
 		if (strcmp(match->name, name))
 			continue;
 
+		/* Call func for the match, and all address matches */
 		if (func)
 			func(match, data);
 
+		if (match->addr.section != SHN_UNDEF)
+			return __for_each_addr(match, func, data) + 1;
+
 		return 1;
 	}
 
@@ -56,6 +91,7 @@ void symbol_read_exports(FILE *file)
 
 		sym = xcalloc(1, sizeof(struct symbol));
 		sym->name = name;
+		sym->addr.section = SHN_UNDEF;
 
 		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
 		++nsym;
@@ -82,6 +118,130 @@ struct symbol *symbol_get(const char *name)
 	return sym;
 }
 
+typedef void (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
+				      Elf32_Word xndx, void *arg);
+
+static void elf_for_each_global(int fd, elf_symbol_callback_t func, void *arg)
+{
+	size_t sym_size;
+	GElf_Shdr shdr_mem;
+	GElf_Shdr *shdr;
+	Elf_Data *xndx_data = NULL;
+	Elf_Scn *scn;
+	Elf *elf;
+
+	if (elf_version(EV_CURRENT) != EV_CURRENT)
+		error("elf_version failed: %s", elf_errmsg(-1));
+
+	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
+	if (!elf)
+		error("elf_begin failed: %s", elf_errmsg(-1));
+
+	scn = elf_nextscn(elf, NULL);
+
+	while (scn) {
+		shdr = gelf_getshdr(scn, &shdr_mem);
+		if (!shdr)
+			error("gelf_getshdr failed: %s", elf_errmsg(-1));
+
+		if (shdr->sh_type == SHT_SYMTAB_SHNDX) {
+			xndx_data = elf_getdata(scn, NULL);
+			if (!xndx_data)
+				error("elf_getdata failed: %s", elf_errmsg(-1));
+			break;
+		}
+
+		scn = elf_nextscn(elf, scn);
+	}
+
+	sym_size = gelf_fsize(elf, ELF_T_SYM, 1, EV_CURRENT);
+	scn = elf_nextscn(elf, NULL);
+
+	while (scn) {
+		shdr = gelf_getshdr(scn, &shdr_mem);
+		if (!shdr)
+			error("gelf_getshdr failed: %s", elf_errmsg(-1));
+
+		if (shdr->sh_type == SHT_SYMTAB) {
+			unsigned int nsyms;
+			unsigned int n;
+			Elf_Data *data = elf_getdata(scn, NULL);
+
+			if (!data)
+				error("elf_getdata failed: %s", elf_errmsg(-1));
+
+			if (shdr->sh_entsize != sym_size)
+				error("expected sh_entsize (%lu) to be %zu",
+				      shdr->sh_entsize, sym_size);
+
+			nsyms = shdr->sh_size / shdr->sh_entsize;
+
+			for (n = 1; n < nsyms; ++n) {
+				const char *name = NULL;
+				Elf32_Word xndx = 0;
+				GElf_Sym sym_mem;
+				GElf_Sym *sym;
+
+				sym = gelf_getsymshndx(data, xndx_data, n,
+						       &sym_mem, &xndx);
+
+				if (!sym ||
+				    GELF_ST_BIND(sym->st_info) == STB_LOCAL)
+					continue;
+
+				if (sym->st_shndx != SHN_XINDEX)
+					xndx = sym->st_shndx;
+
+				name = elf_strptr(elf, shdr->sh_link,
+						  sym->st_name);
+				if (!name)
+					error("elf_strptr failed: %s",
+					      elf_errmsg(-1));
+
+				/* Skip empty symbol names */
+				if (*name)
+					func(name, sym, xndx, arg);
+			}
+		}
+
+		scn = elf_nextscn(elf, scn);
+	}
+
+	check(elf_end(elf));
+}
+
+static void set_symbol_addr(struct symbol *sym, void *arg)
+{
+	struct symbol_addr *addr = arg;
+
+	if (sym->addr.section == SHN_UNDEF) {
+		sym->addr = *addr;
+		hash_add(symbol_addrs, &sym->addr_hash,
+			 symbol_addr_hash(&sym->addr));
+
+		debug("%s -> { %u, %lx }", sym->name, sym->addr.section,
+		      sym->addr.address);
+	} else if (sym->addr.section != addr->section ||
+		   sym->addr.address != addr->address) {
+		warn("multiple addresses for symbol %s?", sym->name);
+	}
+}
+
+static void elf_set_symbol_addr(const char *name, GElf_Sym *sym,
+				Elf32_Word xndx, void *arg)
+{
+	struct symbol_addr addr = { .section = xndx, .address = sym->st_value };
+
+	/* Set addresses for exported symbols */
+	if (addr.section != SHN_UNDEF)
+		for_each(name, set_symbol_addr, &addr);
+}
+
+void symbol_read_symtab(int fd)
+{
+	elf_for_each_global(fd, elf_set_symbol_addr, NULL);
+}
+
 void symbol_free(void)
 {
 	struct hlist_node *tmp;
@@ -92,5 +252,6 @@ void symbol_free(void)
 		free(sym);
 	}
 
+	hash_init(symbol_addrs);
 	hash_init(symbol_names);
 }
-- 
2.47.0.163.g1226f6d8fa-goog


