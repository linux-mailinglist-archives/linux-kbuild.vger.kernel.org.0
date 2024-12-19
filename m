Return-Path: <linux-kbuild+bounces-5196-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AD09F8683
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7C6216BBEB
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6EC1D79B8;
	Thu, 19 Dec 2024 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X4RuCyA5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275BC1C07CB
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642478; cv=none; b=T5OddPtlkxB0YgguEtEJhbXhapqsDUkdsYV+/O3oO/5EFO33lf8ETf53dl1XJanKtuSx6PDGPEsxZBRtE+QuWarDvi1RAnbFZ08iF7UdkKRBqU1R9DPPghk/CzNSxughtl0lKXoHo8BZMzUO8U8zR0ShU7zNUC0Gt799n5YWmIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642478; c=relaxed/simple;
	bh=t4OeKtmQMhXTGshkqVqY9wv+YyO0JXvhiaWxn9DmKAo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pX3XCE5opMHuX4ExYqVbs+Vz9oe182egotiyNwavkfgrKNf0JVN+0GM/Jq07k0FM0gQSxyD3BIbhRfAjoJU2D91j2i+cfbV44Xehj+nPtKRja9nHdQgc2xj/eL/8CnnGS1w4ZZzafilIMvDvGScQf4N3g9vGtfc+ljUvHTmSll4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X4RuCyA5; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-728e3d9706dso1167450b3a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642474; x=1735247274; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aaIPQcS3RU8IiH3sIpb5Pan8w7W30JBzIeQFaarlfbM=;
        b=X4RuCyA5rRAKOTAElVlOtzYGMhWRoA+M0tEtgrZcCJ7m+i0MdlfK2iHsAVbtcR0VxG
         eHrbuNTCFRXjfW9lcxqKKxLXlhEtq0up15N5mcofBJ6MYXzeuQnHv5wCHG9A71e7NngH
         +SqWRe7vjlUMtGuSBB8sV4fezG5RQ1Gz26RcP826WBXVZiI8eQzoklnlo1yGwWPx9NXR
         YxCJ3+sQazK3ndkMHs5a17PtKQK3J1lVhwsONxy8cVAZsEvKKabz7RhRAyz7XmlaGZNB
         3+vXmZ1d4UejWc77pwZjL5qL8+bOYct2gVZ06e1JjD+cv+1MR+YdnYwJ3AxHzXY0JpRg
         8Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642474; x=1735247274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aaIPQcS3RU8IiH3sIpb5Pan8w7W30JBzIeQFaarlfbM=;
        b=bJql6eFD/whmxFMN1NnqIKcQPt122T8DEOJpzDRjnSv07gLC1FYMOVvGhDj8quYUSP
         mLvNgJytGuB1OHq7e3m43KoBZrMUYy+WiI72Ddhbwt+imwIo7d3Ujtg34RxVdsQUFrRt
         62rOB3gCE9x/gosAwGWbX5ezl7mu80Q4n/9ZTnHq98PirJczrpxKYm5YyvMD+phkytM3
         RryxJpwkue08szNpxfCRpChHe3yyrusuV/QKzWEaZhIaF/GBepgDOQ/H2/IigAa/l7YM
         tlPI0NT9fD5wxMd7EQe8sHmaZkbAuutRJCXuInc54FngTKAlJke82Q6L4CWhvpYTQbGp
         PNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2s+ensSLZBZPTAUr2F4zZ7nnC5thkMdwyAHLs1eQJXjuxV+Mp6ZE0VhU2K+dEO2WrZYVKVZIx9lSnXcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmY6lsEQsYbTmklSrjAmFQgOlzSv9ewh1r7fw/192x13kZyM9G
	oK8MfMOkY7xHA8BP8vgCMHQvLp+ba/yJMTRFI7E6k0lp88cy4LmWk8rNsRX6AnjGBs9tithTgES
	52Nf7HS5fGeTieBDEyUq7GP3hVQ==
X-Google-Smtp-Source: AGHT+IGRpSgOPRPZNpyl27Of4ttBmlmnJE0YmNtoWb3t4dJHVI+bEy+3Qz33iUQMEmIb2tBllePsJuTn/0jfn3MEXGg=
X-Received: from pfbct27.prod.google.com ([2002:a05:6a00:f9b:b0:72a:a111:742a])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:888c:0:b0:725:f212:12e5 with SMTP id d2e1a72fcca58-72abded14e5mr298842b3a.24.1734642474367;
 Thu, 19 Dec 2024 13:07:54 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:39 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7404; i=samitolvanen@google.com;
 h=from:subject; bh=t4OeKtmQMhXTGshkqVqY9wv+YyO0JXvhiaWxn9DmKAo=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3ZKvXdzWCx1TOvh2Nf/fKjaxX/OsdbXX7Lr+9uFko
 bf3aicVd5SyMIhxMMiKKbK0fF29dfd3p9RXn4skYOawMoEMYeDiFICJuPMw/Pdlvb/uQRgrW+DR
 x3NTWY47XX8W3bR9porMHBtO21+qjnsY/sccyzcQzOF40S8xe7WSS6bD4pCA4mCuqbOiFlcxciV 9ZAUA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-22-samitolvanen@google.com>
Subject: [PATCH v7 02/18] gendwarfksyms: Add address matching
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/gendwarfksyms.c |   2 +
 scripts/gendwarfksyms/gendwarfksyms.h |  13 ++
 scripts/gendwarfksyms/symbols.c       | 163 ++++++++++++++++++++++++++
 3 files changed, 178 insertions(+)

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
index 5c8288c71fdd..cb9fd78a58da 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -63,14 +63,27 @@ extern int dump_dies;
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
index 7adf2ed9b89b..98febb524dd5 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -6,8 +6,39 @@
 #include "gendwarfksyms.h"
 
 #define SYMBOL_HASH_BITS 12
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
@@ -82,6 +118,132 @@ struct symbol *symbol_get(const char *name)
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
+				if (!sym)
+					error("gelf_getsymshndx failed: %s",
+					      elf_errmsg(-1));
+
+				if (GELF_ST_BIND(sym->st_info) == STB_LOCAL)
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
@@ -92,5 +254,6 @@ void symbol_free(void)
 		free(sym);
 	}
 
+	hash_init(symbol_addrs);
 	hash_init(symbol_names);
 }
-- 
2.47.1.613.gc27f4b7a9f-goog


