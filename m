Return-Path: <linux-kbuild+bounces-3957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB69956CD
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7BB4B21A4C
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F76E213EFF;
	Tue,  8 Oct 2024 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gl0dWXs/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920E212D3A
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412724; cv=none; b=raVcPkLtxiqmsCIRbPPMbbbuGu/Yb2mTkKO4sQrS/4SpWJ918I7wCPEuvFGOWMcKOMft0RIMRQMBjrXqvFjV0BdRXofU93Z0jmfjwJcV+WVwc4H6LIA4lT+Ny/dGtxK8ECuGMCWDnOA2EQTf/E5DxXBaCFBH1QfHLi7dBE6mAog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412724; c=relaxed/simple;
	bh=0lGBHoCLiG9Acxs3AlKgo1tCJjq8TaMCY9M43AccgSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I2RLTpKropQq2zxfASX4t/9n8EUdquO82Ev4owQkXF69TPI4lZsg07MoqZ2rtWoQJKsOuG44sStG/6mvwBaaj4GZLshScYv/T4L3RSHkhxpnaeiIm4ZkIlURZ6N781mAx737UWGNfsdpXTIvzaQuXcW4Z29a2SZV/0IusQIevxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gl0dWXs/; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-20b921fa133so1012815ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412722; x=1729017522; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=++q9xYQNjqMI7NCqb6FQjA9b6KXYKSoI9fCqXlx+keI=;
        b=gl0dWXs/3aauN9UMH5AvMq33tgPWj+QKWenzFJLVPDN0QVu4kV0d8aB4qW6JnU3htz
         mpcSqvM16yn0pp0Ol+NyJp0FxUuwfQ52Wmbj9kNndJK8ki6UVjFa+o3WH0LHTBoy7lRf
         /R8tEzITFUuAuzpvf0BKdmBxmilxtE5Pc+EJ8YCsyT6OsNlxivglGUXq708w7Cd6uIT1
         RgaZXC8Hm2pomWEYEqc/eozrPVnqii6OE4G3oGQ6NKc2fN29XkYHQB40irV8rsOEHXPS
         LpYcNqul8QFN4PxARxIyszLYWVQrp0LQ/SmEfeU4iyk7yH5D6/ZlVrczihau5S9Hq2pu
         SG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412722; x=1729017522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++q9xYQNjqMI7NCqb6FQjA9b6KXYKSoI9fCqXlx+keI=;
        b=dSAMmPf7TVfd80Xy+fM9h2/rbTu1aXEfzXflGXTKrqkfOXJyT+R0tOTfDMuTlVXXgI
         1XA6XFpET8n/zquqA9VNYr5TshgYhDbUDx9+pgVJj/fadf4xP8OtGBTd2InqygqzB7ia
         AqNBSQVmedVQyZ62Toq2gpzahLZy1WgQ0t30dqSqfuI/eygUpDR0uF51D2XlynK9FmAv
         I4wvy9UK/nfbO0pBW8h4uDv5dOdP2NkhFjfTcT+Qw6IuoHhZgEw7ijHfD7ajsKMEYU+h
         6knrD28+hzlPL0dWLFM6oBGvWtEkVB6gfdhbDFiHYP8wCfqBiP7XAnseVppAkcxzy3we
         XCzg==
X-Forwarded-Encrypted: i=1; AJvYcCW4DsBjsGnA4NDn1Z1j8Gz0k8GQxbrDZTFhOpEYfbKH7jSTxMcdV+M28/V6fN0iVFl048V1mwmRFkL5U3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjqwbHf58h6MYDF0hV4zHESViZw5JYguXKiPMvNbtaFiVOpOsQ
	s5YKUx+JNy2pXSWmED74ni6XVT1WLYQmPS+uO7wO+e2F9HwHgBXIgWMA/y0Z4bV+lNM2itFTlu/
	P1UC2Uv7hKmwSP8RufzVhXEMhLQ==
X-Google-Smtp-Source: AGHT+IHgBcTNp6rWi0Ni7hSopmcFbaWgQhJOHl/IF8aJ1tnShtxifRPktwBmOod2lusXthZJBtQICU4F3TBg9cRCiKU=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:2343:b0:20b:6a57:bf36 with
 SMTP id d9443c01a7336-20c63183cd8mr1145ad.2.1728412722170; Tue, 08 Oct 2024
 11:38:42 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:27 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=6809; i=samitolvanen@google.com;
 h=from:subject; bh=0lGBHoCLiG9Acxs3AlKgo1tCJjq8TaMCY9M43AccgSk=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNYp7m6wiFleV8NwQ3t/xhCHs8l7JB38F+NaEpOVNN
 f73b3ZbRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZgIw15GhjX3d7zcMIFR0PCh
 TR5bq9ybRx0XrTQW/Ht+bdVNrscJIk4M/yzsDz1y71Xslft6pOX9Iu98W+aNLf4n1dOqBJ5rzOO IYAcA
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-24-samitolvanen@google.com>
Subject: [PATCH v4 03/19] gendwarfksyms: Add address matching
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
 scripts/gendwarfksyms/symbols.c       | 148 ++++++++++++++++++++++++++
 3 files changed, 163 insertions(+)

diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 1a9be8fa18c8..6fb12f9f6023 100644
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
index 4df685deb9e0..6cb99b8769ea 100644
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
@@ -81,3 +117,115 @@ struct symbol *symbol_get(const char *name)
 	for_each(name, get_symbol, &sym);
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
+				if (!sym ||
+				    GELF_ST_BIND(sym->st_info) == STB_LOCAL)
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
-- 
2.47.0.rc0.187.ge670bccf7e-goog


