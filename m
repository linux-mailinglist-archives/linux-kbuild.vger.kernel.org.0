Return-Path: <linux-kbuild+bounces-4768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC179D5416
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E32CB216BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB6E1D14E4;
	Thu, 21 Nov 2024 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4BJXWc8g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B15C1C4A37
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221762; cv=none; b=KP916PcsUYIgCuy7AyJlOaQaWl6+qJNBx9+DDKGtSCtpYJOHsH5chX0bEvaXNaQeu+zEP7BJ/mk4gBybRZW5P5OijMHXAd+jtJp2CNVgJUlOm4xiVWr/BoFEiJ7wOgYSLpBiymLyT0pA8l4aU3gBPRfmpfRCF47ZFiHNiiW2IvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221762; c=relaxed/simple;
	bh=Y1QCUP2Re4IRy6UVi3VRwspdBWOnfLDfsjech3YcH1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dkKKnH4pRseUp9/besbgqZqNiwjQ4uCgELRy2yQfRi4qXNvHVTCsCfl08V4OTcDVELLf7yGNOW9KLBm7FAFxeA+q+afNoGsaEoka2O01jLqo3hkPYOXBORPG4mBcBKlUh9rxgxdGR+4gtkCDkORwx8RmmVvuuCzcIpkFO9fYmrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4BJXWc8g; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ee7ccc0283so22244287b3.2
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221759; x=1732826559; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQqxFjP+g20UF2jMStPlLsQIq6BeQ7yhwkU25eTMd54=;
        b=4BJXWc8gkMJtLkIyNTe4cuBUrhEEcfGQzD1BFTDQU7MIOeVivw38izwvu8AXXTWPXP
         24eYzdt3OdcO9ukwlkPZAIJnSLQfMjbH3D4F+4rE60Lhczx+QG+3RGFIytQg3GdmeYYJ
         +Ghmpel3IvHelXCAWtVJlQN8CQ3l0ffBsjDbCUieY20Y1CsJo0ilLpAjWvTZfZs54AgS
         nVI6lyeyJvr0RbvYtD3aIseHs/FE9bHWLczNhPR5t9g1gAHmVOZ2/rVF+Kxb3nvLNTV8
         wcjaRe0fbg3ZgzV9If7J22wv6oKzEjlhwmUmqkjoGQMQJabge56WFMpscyP3WmN4sgk8
         xp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221759; x=1732826559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQqxFjP+g20UF2jMStPlLsQIq6BeQ7yhwkU25eTMd54=;
        b=vwj6DGW9tj6wJoIB3zBrEBGLwXpfOt3bd4nh8FYW8RzaDq5rtTz8EzRDBjEbZSYLsf
         ILGPxvXpEC3xpaLdhd2UrIzDQRDZmVwMVIR3LMvJFsqn7rv1nXouE/M0aG4PS73yLny4
         IXFQVUlZtHxk0Gk2KfUC91u+6gSImWLcoR/XOryQduOp2OFSVNsyhX1nUDIPk1KiIrLa
         hYNsaRtatrdovWBYJIhwCw2NSgqhE6ylPsQL8Ilk2sInphvzlvqY1KK4j6eBZ5isKBqh
         QH/n8LFQnqCyMPkNCbVzCDfBYMKnJg+oWVs8zBAAWvekOSJeYaW872bAGTcPPHqUbcXw
         n+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUB9PbRfE2P8gJJVelw4hHknw3YpntE106VPPPAU0Hne+cLnH1wggqzjeHV7FhfePGQ7pB1FXQLvvwdyhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mY8vmzqin6w+hyyIPD8wfrJcE318GoP2YKfJXb5tMuwDbGYh
	wb24GntCRqOksRzfymhERmBEZ9A/PFlJtIyA4uZ84zpobCmOms386toeT89UUR3kxnxFIenrFqF
	AQQBp/9VoPdBxTREwrReDOg6JpQ==
X-Google-Smtp-Source: AGHT+IEoa76F55eo3HyrISkKkt6UN1lROXcZ/ENWl8eQ58qrymBXkLQ2Gb/EQ+zL4QtprGCeNONXUmu6vJU43cfZO6Q=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:988:b0:6e3:b93:3ae2 with
 SMTP id 00721157ae682-6eee0874a83mr3757b3.1.1732221759350; Thu, 21 Nov 2024
 12:42:39 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:23 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7286; i=samitolvanen@google.com;
 h=from:subject; bh=Y1QCUP2Re4IRy6UVi3VRwspdBWOnfLDfsjech3YcH1k=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s3Vvubi0HurytY2ZLsP3w8lE4mz5M//6yg1vI37Lb
 lrj6VXfUcrCIMbBICumyNLydfXW3d+dUl99LpKAmcPKBDKEgYtTACYiepLhf5G+iZXkHeNi4XXb
 fjvtrSt+vOmfy77K2xmTQ3tNW0LUHzP807sq/Ku58I7g+9dOF1k/q3lle52SVquJWt2enb9+1fI SZgA=
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-22-samitolvanen@google.com>
Subject: [PATCH v6 02/18] gendwarfksyms: Add address matching
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
index 23e484af5d22..c9e268b21777 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -68,14 +68,27 @@ extern int dump_dies;
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
2.47.0.371.ga323438b13-goog


