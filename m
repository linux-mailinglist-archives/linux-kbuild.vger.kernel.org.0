Return-Path: <linux-kbuild+bounces-3008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F3D95391E
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 19:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021931F259CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927D57D40D;
	Thu, 15 Aug 2024 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eGKc6Vog"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324D57CBC
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 17:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743562; cv=none; b=u8HsWcXjfu3hmmaG5mv37OWG1wm5ykKq/s/dWFuQp4ZQSWOmaLUAPI2YO03L3eX9a6xNPg25hKXbdP5o04x2FDpOIOBUFctVHPIZc1hZrj98x+1mhDKqsCWZkm0EUDj0dbWTlT12pdHiQlkdk9hS3iZlp1Bgd4qzokw2ybyG7Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743562; c=relaxed/simple;
	bh=hYmG5yt01O2vbqwBp7PP3hIYMSvbeyeHaHO3a1wFkH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ECAK3NYvXQdSkcmL2xkE6oe3JDXwEPM0OaCJ5Zg+8bP4ksa5uziGBsLGj9PrlEWYYLp6SwxQ/+22cpJZjZz+jrCoLXQFo16g+ILjMDPlkAHwE16ngaVAn6Ou4jmjBHQof/qE7eZPfxvSyqkbHGBTWOWKYf7a954lXH2E0/7iX8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eGKc6Vog; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-201f89c6b21so6235635ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743559; x=1724348359; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpexM9fykb8F2roek5WqlkwH0rKydnPc1uN1TQABN3Y=;
        b=eGKc6Vog3OywseZSr1HEFNxiFjUrLp3c4pbrYRipDPGFLP99uAibv8pusDk+HRK5Kk
         VvnwrAeLYzi3o6fZABwZkMsLNg2B+rTqV3CnM3/jeMgr33laDv/FVefWEFJ+5E0FF8D2
         VKOEYnrWjPQvOj16DLynyrhNsjKqIYyNinBHVFpIVwZ43GjzKFES+XW0Q9x2pvUIvoVZ
         qAbbqMMeKQFx7iwd2utWiab4m/VTC3XGvJeIldWIZIRgpQcKQRghWrFDDb3rzz7W0gMW
         yK5kYpL86n/T+mlZlIutEZmmZ8OXvG1EW+t73UKGf8QOx+r9y/73CNC3wmE7krlh36S+
         i/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743559; x=1724348359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpexM9fykb8F2roek5WqlkwH0rKydnPc1uN1TQABN3Y=;
        b=Lywqi5LMz/mcYJcLg0RZGmENA2SXTP0ql/mQ4UxAFkZSGKMpPk2aGnAsh3jHjYv9Ef
         GoPpT5/PrNt88g/TwTioLIEzauwOyplaD4rBtKjBEwxHZ2SWCgMgZAYr5vhWOqxGa4s9
         ycHlkNkg9505rqUkRYX8BD0q2DGLPsE5SAKyaO1dShbbHH16OUPQngPqXtEw/8CR8FR2
         4ejim3pSzZ7ovp+ub006j1kyr7ITc2ZMqIzcer4Sl+0UEQjaKZSelXnTpMWYfuv2eqkU
         P03gzZ/4dD1Zb9ek08uETUYeF+s6WqZlAgepv5tOkJoNlr6iZh4comttjPFyKpzEzCew
         8Y+A==
X-Forwarded-Encrypted: i=1; AJvYcCWemZEfYKM8I5Z07nigafjA1fmvt0Bxo8KoT2I8PXdazWHlnyrfsF1FJ6iaVS0PNYmWIbaeP8ii3gAyUYNRX5jRchw2l6qzeQwa1jji
X-Gm-Message-State: AOJu0Yy7/2f8o5XtXm7Oqjs7ZCfiBzXB6UQA1zJB0QNKa4pRndmRFsFD
	diT+3aVgUJn4UUpQNg2WDQbRYz7QqiVumUhqbnRIxgSjST6t39AoTla91rIU6rS8KmMXhHn6bb0
	RZQvmPivB9N1GrBJO+FytiaBnwA==
X-Google-Smtp-Source: AGHT+IH8/3eOMWCOeClNJqRJ6nF99J4r8CyoyyKEWH8ahJS3xT9dj2SLUFFnGqAYYgcxxGF2/tmYaOSqjFRejEAGQiU=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:f684:b0:1fb:56c8:f273 with
 SMTP id d9443c01a7336-20203e4798fmr440195ad.1.1723743558559; Thu, 15 Aug 2024
 10:39:18 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:07 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7437; i=samitolvanen@google.com;
 h=from:subject; bh=hYmG5yt01O2vbqwBp7PP3hIYMSvbeyeHaHO3a1wFkH4=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04hD1u8vcutuUsraMRLPBZY8D62QWQnLdTw
 Jmu88k1VrCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7vnwC/0RM0rg3Pr6UU/JjzL9sven5E/iF8J23JuqnOnrRU6yIssP2YfjaFvY4Z5EpUrgu+Zob9l
 u4Yh5xNbzYC1za3vo82V7VrxdIaqxvyTRCO28WPx7kdxN3xB3TB7n9VYX7d9IVQSUkbWA9sQwAL
 /icm/sXgV+lgdaje+mEKeguw8SK2fDl7OVoFQTWJZpC3fT62nqXGJDpgzOn4Gp865rhE2LDESS6
 oJsM0/4qwF0OPMt2ELjCeHyVurVJKEHb1n/y783to+tBmM0C9CD7DcsJcAVZMbBnyRWPl3QwXyd
 lRrEgXfY9+Pr6TBaQJ9kebo61jHAXN71vlI9QPP2A3hHWOx4CDJ4a7kz27ni1htLW+YFr3BSsSe
 xI4Ta/8cUU1HPbjRLRTxV91taWgOx99uRp8+/6x1QgB6tBqZ2yU/M24ZLdZKkoDzN8OJpZu3Dk9 DdzXP8jwRSdrICESpYLvbVgjdtBDemlJ3R+xQJQ4JX59ljF1EUd5g4s2WWYZ+mivYw5T0=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-24-samitolvanen@google.com>
Subject: [PATCH v2 03/19] gendwarfksyms: Add address matching
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

The compiler may choose not to emit type information in DWARF for all
aliases, but it's possible for each alias to be exported separately.
To ensure we find type information for the aliases as well, read
{section, address} tuples from the symbol table and match symbols also
by address.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/gendwarfksyms.c |   2 +
 scripts/gendwarfksyms/gendwarfksyms.h |   7 ++
 scripts/gendwarfksyms/symbols.c       | 161 +++++++++++++++++++++++++-
 3 files changed, 165 insertions(+), 5 deletions(-)

diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index d209b237766b..e2f8ee5a4bf3 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -118,6 +118,8 @@ int main(int argc, const char **argv)
 			return -1;
 		}
 
+		check(symbol_read_symtab(fd));
+
 		dwfl = dwfl_begin(&callbacks);
 		if (!dwfl) {
 			error("dwfl_begin failed for '%s': %s", object_files[n],
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 03f3e408a839..cb9106dfddb9 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -61,6 +61,10 @@ extern bool debug;
 /*
  * symbols.c
  */
+struct symbol_addr {
+	uint32_t section;
+	Elf64_Addr address;
+};
 
 static inline u32 name_hash(const char *name)
 {
@@ -69,10 +73,13 @@ static inline u32 name_hash(const char *name)
 
 struct symbol {
 	const char *name;
+	struct symbol_addr addr;
+	struct hlist_node addr_hash;
 	struct hlist_node name_hash;
 };
 
 extern int symbol_read_exports(FILE *file);
+extern int symbol_read_symtab(int fd);
 extern struct symbol *symbol_get(const char *name);
 
 /*
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 673ad9cf9e77..f96acb941196 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -6,11 +6,43 @@
 #include "gendwarfksyms.h"
 
 #define SYMBOL_HASH_BITS 15
+
+/* struct symbol_addr -> struct symbol */
+static DEFINE_HASHTABLE(symbol_addrs, SYMBOL_HASH_BITS);
+/* name -> struct symbol */
 static DEFINE_HASHTABLE(symbol_names, SYMBOL_HASH_BITS);
 
+static inline u32 symbol_addr_hash(const struct symbol_addr *addr)
+{
+	return jhash(addr, sizeof(struct symbol_addr), 0);
+}
+
 typedef int (*symbol_callback_t)(struct symbol *, void *arg);
 
-static int for_each(const char *name, symbol_callback_t func, void *data)
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
+			check(func(match, data));
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
@@ -23,9 +55,13 @@ static int for_each(const char *name, symbol_callback_t func, void *data)
 		if (strcmp(match->name, name))
 			continue;
 
+		/* Call func for the match, and all address matches */
 		if (func)
 			check(func(match, data));
 
+		if (!name_only && match->addr.section != SHN_UNDEF)
+			return checkp(__for_each_addr(match, func, data)) + 1;
+
 		return 1;
 	}
 
@@ -34,7 +70,7 @@ static int for_each(const char *name, symbol_callback_t func, void *data)
 
 static bool is_exported(const char *name)
 {
-	return checkp(for_each(name, NULL, NULL)) > 0;
+	return checkp(for_each(name, true, NULL, NULL)) > 0;
 }
 
 int symbol_read_exports(FILE *file)
@@ -57,13 +93,14 @@ int symbol_read_exports(FILE *file)
 		if (is_exported(name))
 			continue; /* Ignore duplicates */
 
-		sym = malloc(sizeof(struct symbol));
+		sym = calloc(1, sizeof(struct symbol));
 		if (!sym) {
-			error("malloc failed");
+			error("calloc failed");
 			return -1;
 		}
 
 		sym->name = name;
+		sym->addr.section = SHN_UNDEF;
 		name = NULL;
 
 		hash_add(symbol_names, &sym->name_hash, name_hash(sym->name));
@@ -91,6 +128,120 @@ struct symbol *symbol_get(const char *name)
 {
 	struct symbol *sym = NULL;
 
-	for_each(name, get_symbol, &sym);
+	for_each(name, false, get_symbol, &sym);
 	return sym;
 }
+
+typedef int (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
+				     Elf32_Word xndx, void *arg);
+
+static int elf_for_each_symbol(int fd, elf_symbol_callback_t func, void *arg)
+{
+	size_t sym_size;
+	GElf_Shdr shdr_mem;
+	GElf_Shdr *shdr;
+	Elf_Data *xndx_data = NULL;
+	Elf_Scn *scn;
+	Elf *elf;
+
+	if (elf_version(EV_CURRENT) != EV_CURRENT) {
+		error("elf_version failed: %s", elf_errmsg(-1));
+		return -1;
+	}
+
+	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
+	if (!elf) {
+		error("elf_begin failed: %s", elf_errmsg(-1));
+		return -1;
+	}
+
+	sym_size = gelf_getclass(elf) == ELFCLASS32 ? sizeof(Elf32_Sym) :
+						      sizeof(Elf64_Sym);
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
+	scn = elf_nextscn(elf, NULL);
+
+	while (scn) {
+		shdr = gelf_getshdr(scn, &shdr_mem);
+
+		if (shdr && shdr->sh_type == SHT_SYMTAB) {
+			Elf_Data *data = elf_getdata(scn, NULL);
+			unsigned int nsyms = data->d_size / sym_size;
+			unsigned int n;
+
+			for (n = 0; n < nsyms; ++n) {
+				const char *name = NULL;
+				Elf32_Word xndx = 0;
+				GElf_Sym sym_mem;
+				GElf_Sym *sym;
+
+				sym = gelf_getsymshndx(data, xndx_data, n,
+						       &sym_mem, &xndx);
+
+				if (sym->st_shndx != SHN_XINDEX)
+					xndx = sym->st_shndx;
+
+				name = elf_strptr(elf, shdr->sh_link,
+						  sym->st_name);
+
+				/* Skip empty symbol names */
+				if (name && *name &&
+				    checkp(func(name, sym, xndx, arg)) > 0)
+					break;
+			}
+		}
+
+		scn = elf_nextscn(elf, scn);
+	}
+
+	return check(elf_end(elf));
+}
+
+static int set_symbol_addr(struct symbol *sym, void *arg)
+{
+	struct symbol_addr *addr = arg;
+
+	if (sym->addr.section == SHN_UNDEF) {
+		sym->addr.section = addr->section;
+		sym->addr.address = addr->address;
+		hash_add(symbol_addrs, &sym->addr_hash,
+			 symbol_addr_hash(&sym->addr));
+
+		debug("%s -> { %u, %lx }", sym->name, sym->addr.section,
+		      sym->addr.address);
+	} else {
+		warn("multiple addresses for symbol %s?", sym->name);
+	}
+
+	return 0;
+}
+
+static int process_symbol(const char *name, GElf_Sym *sym, Elf32_Word xndx,
+			  void *arg)
+{
+	struct symbol_addr addr = { .section = xndx, .address = sym->st_value };
+
+	/* Set addresses for exported symbols */
+	if (GELF_ST_BIND(sym->st_info) != STB_LOCAL &&
+	    addr.section != SHN_UNDEF)
+		checkp(for_each(name, true, set_symbol_addr, &addr));
+
+	return 0;
+}
+
+int symbol_read_symtab(int fd)
+{
+	return elf_for_each_symbol(fd, process_symbol, NULL);
+}
-- 
2.46.0.184.g6999bdac58-goog


