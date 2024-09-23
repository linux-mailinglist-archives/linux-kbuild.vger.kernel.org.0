Return-Path: <linux-kbuild+bounces-3672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79B97F05B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 20:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5D16B21EFA
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 18:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345B21A08CA;
	Mon, 23 Sep 2024 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AkgShLJw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09C1A0BCF
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 18:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115556; cv=none; b=FCd1NrppS6zBEZEDQ2rNWNV1fZC4Qvz1PVkno+m3REZ2AcUlkPQc7kOIT93IP0LvFhBBhN4ma7eYQtvH6cOKXTYjslWxuiY8Z/HRD2qxybrvLzc1SRtrYh2ctIuTrRKtnkIyYr5oVTT1r33Gab0zC06H7CPkJxfukaFze59hTc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115556; c=relaxed/simple;
	bh=iSUUW3x5txrloi+7+mdj9ELlZqG3qTNWuRqFbkcBVvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JFizppt7UMDu58sbZ/P0yZjXtt+8zmTC4BWSKBpwezDeECFyYciBOwD4G0uteO1r1R5QepHz50F1CrkP3ov0juP54KAaK4iGKQjnc9y0UMuf+XAyVRr3e6ro7YVOdWZfq5NAMEBq4l3CQw/Bqx5X3SN3gdCMW2bwLABh5FWWPIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AkgShLJw; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-718e065f057so5998916b3a.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115553; x=1727720353; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5E6A6+qtsL2yx6u5QsUJXotC4baF5lnSIeka5+35fc=;
        b=AkgShLJwMpwUUFB51uVQ56nOFyfDvrUr5+9nO0QxqV4jD3Isxt7cbqH6zSdrJRnUdi
         1WZImgLwxtLTip1uozLfOaknYjna0M11b7hNcwZpqwrRi8gDeO6j6mOhXcPC49bcqWm4
         DQHvwOpyKb+CTH1tapacFk1VwHdF0ZxzNsw0peY3FrwJgkal3nd9WbW9At5UBlM1KDTj
         z6c2jriO2JoZKDQF+W2jvrqbjJfLDT1B2eCyVRgUZdlcJ9UvQ2U8WyIeeDOs0sj14Ban
         DdzzBbjwEuOT4bRSP0qFddU9W9HZvwYe/Evy88GFu3QWEL1eleOZQWLgpwtEO1eBitwI
         IcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115553; x=1727720353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5E6A6+qtsL2yx6u5QsUJXotC4baF5lnSIeka5+35fc=;
        b=h/Xdroei5ng9XQRqIbDr9NDyPTbfSMyoP4FBGo/YpqasWoS8W5gffsugAqFY1re+mA
         +kdHC7Iqi9NkE+JpLIbxEduRP6xwLmK1Rdyfdy0kFbyJM2IX9HhjSW640DifhwtA2HwT
         ONZvEOhic17g4p/fsu6cIzvKzC/8ziUBce3K3JHDP0coitpt1S/dW12aTpYWsxPKYbkW
         cXnU5Ux0+VcGaJb4rmFEvze5Itrf6VApCYrd+fhaQ93R8rnaArGeU6UBCkSEXhvXWmMm
         SBaKY8Pme8klu6zIN0fqMVgIPyVCQls4you4O5GRVkuCQnEahySNayyd66nQqYXsTEH3
         OEvA==
X-Forwarded-Encrypted: i=1; AJvYcCXd9vBll9WAkimhoDahQNckZX3Owy1mDhkPXEUA8yUVqVNqYjycVAXCDLj3F86GB2ZfBkKt6/0ggCC3q+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YySxmf20gXRg+i1ZA6gaIENWpumD/q9XwnOdvHQrepUQt0z7bGa
	+IB60L6yKwWineVi5k1rGXgp5ENB7b89jZQNVDvQfpTXhAj3KppVntBCmj3cfVdP8p9aLGk5Z22
	Nt5paR9yE+3QePRg0TxQqYSBSUQ==
X-Google-Smtp-Source: AGHT+IGTT/HJAvXTol3s1CGGiXlpT4QazkYqwtFl5wbZvjyFTJ7aUqw/e69/vdZFngAkYLyFECjGUy2FtIhorJ52z2k=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:6210:b0:717:98ba:fe26 with
 SMTP id d2e1a72fcca58-7199cb1ed42mr17592b3a.0.1727115552951; Mon, 23 Sep 2024
 11:19:12 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:50 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7147; i=samitolvanen@google.com;
 h=from:subject; bh=iSUUW3x5txrloi+7+mdj9ELlZqG3qTNWuRqFbkcBVvs=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN3JMXqrmeiOMj5179gSLXcXBMps+lS+9n/H3+bIwT
 i/9esGzHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAirv8YGf5NvbvxgW3R656K
 qMm76/zz/5pvunWn+7UTz8OIxduWm0szMuyuC9Zsur5mhiRTi9SsLykMpWzSHpelTJr8dgqvWHX dhREA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-26-samitolvanen@google.com>
Subject: [PATCH v3 04/20] gendwarfksyms: Add address matching
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

The compiler may choose not to emit type information in DWARF for all
aliases, but it's possible for each alias to be exported separately.
To ensure we find type information for the aliases as well, read
{section, address} tuples from the symbol table and match symbols also
by address.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/gendwarfksyms.c |   2 +
 scripts/gendwarfksyms/gendwarfksyms.h |  13 +++
 scripts/gendwarfksyms/symbols.c       | 153 +++++++++++++++++++++++++-
 3 files changed, 165 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 096a334fa5b3..5032ec487626 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -105,6 +105,8 @@ int main(int argc, char **argv)
 			return -1;
 		}
 
+		symbol_read_symtab(fd);
+
 		dwfl = dwfl_begin(&callbacks);
 		if (!dwfl) {
 			error("dwfl_begin failed for '%s': %s", argv[n],
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 1a10d18f178e..a058647e2361 100644
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
 
 /*
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 1809be93d18c..d84b46675dd1 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -6,9 +6,41 @@
 #include "gendwarfksyms.h"
 
 #define SYMBOL_HASH_BITS 15
+
+/* struct symbol_addr -> struct symbol */
+static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
+/* name -> struct symbol */
 static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
 
-static int for_each(const char *name, symbol_callback_t func, void *data)
+static inline unsigned int symbol_addr_hash(const struct symbol_addr *addr)
+{
+	return hash_32(addr->section ^ addr_hash(addr->address));
+}
+
+static int __for_each_addr(struct symbol *sym, symbol_callback_t func,
+			   void *data)
+{
+	struct hlist_node *tmp;
+	struct symbol *match = NULL;
+	int processed = 0;
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
+static int for_each(const char *name, bool name_only, symbol_callback_t func,
+		    void *data)
 {
 	struct hlist_node *tmp;
 	struct symbol *match;
@@ -21,9 +53,13 @@ static int for_each(const char *name, symbol_callback_t func, void *data)
 		if (strcmp(match->name, name))
 			continue;
 
+		/* Call func for the match, and all address matches */
 		if (func)
 			func(match, data);
 
+		if (!name_only && match->addr.section != SHN_UNDEF)
+			return checkp(__for_each_addr(match, func, data)) + 1;
+
 		return 1;
 	}
 
@@ -32,7 +68,7 @@ static int for_each(const char *name, symbol_callback_t func, void *data)
 
 static bool is_exported(const char *name)
 {
-	return checkp(for_each(name, NULL, NULL)) > 0;
+	return checkp(for_each(name, true, NULL, NULL)) > 0;
 }
 
 void symbol_read_exports(FILE *file)
@@ -55,6 +91,7 @@ void symbol_read_exports(FILE *file)
 
 		sym = xcalloc(1, sizeof(struct symbol));
 		sym->name = name;
+		sym->addr.section = SHN_UNDEF;
 
 		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
 		++nsym;
@@ -77,6 +114,116 @@ struct symbol *symbol_get(const char *name)
 {
 	struct symbol *sym = NULL;
 
-	for_each(name, get_symbol, &sym);
+	for_each(name, false, get_symbol, &sym);
 	return sym;
 }
+
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
+
+		if (shdr && shdr->sh_type == SHT_SYMTAB_SHNDX) {
+			xndx_data = elf_getdata(scn, NULL);
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
+
+		if (shdr && shdr->sh_type == SHT_SYMTAB) {
+			Elf_Data *data = elf_getdata(scn, NULL);
+			unsigned int nsyms;
+			unsigned int n;
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
+				if (GELF_ST_BIND(sym->st_info) == STB_LOCAL)
+					continue;
+
+				if (sym->st_shndx != SHN_XINDEX)
+					xndx = sym->st_shndx;
+
+				name = elf_strptr(elf, shdr->sh_link,
+						  sym->st_name);
+
+				/* Skip empty symbol names */
+				if (name && *name)
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
+	} else {
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
+		for_each(name, true, set_symbol_addr, &addr);
+}
+
+void symbol_read_symtab(int fd)
+{
+	elf_for_each_global(fd, elf_set_symbol_addr, NULL);
+}
-- 
2.46.0.792.g87dc391469-goog


