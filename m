Return-Path: <linux-kbuild+bounces-5351-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591DA00EEB
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 21:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE0C3A47CA
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 20:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888171AD3E5;
	Fri,  3 Jan 2025 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FhbY3EI6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA641BFDFC
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jan 2025 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937142; cv=none; b=ra/qIS/JorpvW0S5kliU8tL1vJ5jv9CI/5qej8hoOfAXpKobypHZa46rq6XLtri7DWy4Fr4VCQlnDwWdwgk64eVQsD2KAqW7iwQqQk7ljVfBvRsjtCGclkeA1z3kyxgaxm9hIkEipehsXXzb+L99vL2mqCdIPs1sYvsf4o00DC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937142; c=relaxed/simple;
	bh=fzVr6fKgzEIFdsA0UPXmH/kse9QbLqY2nS3Tewl8NWY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BkGqf73HjYBFNKEIC9Aqr9xG0pEYUMApW339aAtDymClJNmmsjqaet3kQBW8DfnKwKoRHQoFSq4O/8uJ/hyEq/cKQ1g/lxCsGWuJCYT0OMH/tJN4qTyp6pq8Vjh2QT0ZQasx67QhGiT8CREYzFaBbTAvBS+lTwJxescEJgnieGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FhbY3EI6; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166464e236so300481565ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jan 2025 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937138; x=1736541938; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zLpQS/gnu91PnGj0lISTgfkEEEKsnzRIWAV6qflhe7M=;
        b=FhbY3EI6uyykOf8m76uJqt04nxM2cK+IB89XPzyIBIuAokvz0eSpe3JbD5BTJqX3Sg
         gEOuIXBooVZwPmXcoFP8v0TJF9EDTI275o+9RVv3D6f1oKF4lNN9fvAw918lNfaHNdU8
         ew7E3H2rH/F624pS1EG6EyOqIJOC5RQsmRV9suxzPmfkbKAAOqOypNm/SdTvsQrzAFm6
         n1cgS2JQ2IJ7FlTDYeCYkV0JmPIqRfDHAjK5f7uZ1fz6TjqsDp/W3+WZa55Jj4miPuzr
         ik/su9N2Rl88OlUGzueFPIxG/fC46pCZ9u7oL7KX47mkNc3fkeVYGXjp/xnlNn/23ELZ
         BFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937138; x=1736541938;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLpQS/gnu91PnGj0lISTgfkEEEKsnzRIWAV6qflhe7M=;
        b=Ps6ZXzipQDIa6o2EsSPwofLahWZxUCZWI0RNmaPADZ5d7QHF1quEMxAQVj0t7CCp+0
         JTk9eGqf2YkvTmjNCc98RAO9PYJNK4QF5+N8EzoCgWD2POuG7k+XF06pR+n3de84ZrsA
         E46yivy85ileF2UGiE9aStoMm7HqXvajSQAqVoprnTWCM3fBIxrgcoPeCnPpKFflXBzD
         WmL5+ZxKVVE83/RdT8C4mBidriZFOKa0A0bOB7I5TMJNKew0QRtEHcvV63DURfiewhGK
         lIj5+RWGMBxoBuEaJLyk5W6z2I0/yHFT3cMm55G7GsZ4r9RQBAvAQ+gXT46ePFjcS6nv
         YZfA==
X-Forwarded-Encrypted: i=1; AJvYcCWrSmKA3zRHsOirWgJ/R2eM0qcCu8y5PwKPxbTHsBT8sv+Vdaygl8QPUqBemYMRq39jDajk54/2abEoATY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVNQ2HKvbMh6tf6F9jx8VVzu3vp0lf28BhDoezMxM9KebQmEb
	ckeXUgnZled6huUWBG1spdLvhaNlFx6zY+UHTFKQD14uqSUYRYaZX/nBv7fRrwc8kJneQAL2dAv
	FSzF/PKGKg6C4BVCkha5yhueS3g==
X-Google-Smtp-Source: AGHT+IGl2m3cfV3NcHN2pmSUPzbHYXMeL1GQeg153FdINlJb1CXi4JHEU0Jr2m5E4C1AlhmO4tCc0lI59vsX9oWlMck=
X-Received: from pfwy1.prod.google.com ([2002:a05:6a00:1c81:b0:727:3a40:52d7])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3994:b0:1e0:d867:c875 with SMTP id adf61e73a8af0-1e5e080ab04mr67786488637.36.1735937138689;
 Fri, 03 Jan 2025 12:45:38 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:24 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7376; i=samitolvanen@google.com;
 h=from:subject; bh=fzVr6fKgzEIFdsA0UPXmH/kse9QbLqY2nS3Tewl8NWY=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPkmKi7U3RycW7Oc3uZjhfHKvw9mfG+MOhb7ZH8axz
 0H4omBhRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZgI2xmG/4UfWwXfXY42n3hF
 TmrnmldTP9bKZTvHf+yqurov+SBD3CaG/7HlabOMJ2b/ZTpkOC863lpJRzZ/h1PFRt7QW6kspw5 X8QMA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-22-samitolvanen@google.com>
Subject: [PATCH v8 02/18] gendwarfksyms: Add address matching
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
 scripts/gendwarfksyms/gendwarfksyms.h |  13 +++
 scripts/gendwarfksyms/symbols.c       | 161 ++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index a1d13353c6bc..cd8bfe973a5c 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -105,6 +105,8 @@ int main(int argc, char **argv)
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
index 592eacf72694..98febb524dd5 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -7,9 +7,38 @@
 
 #define SYMBOL_HASH_BITS 12
 
+/* struct symbol_addr -> struct symbol */
+static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
 /* name -> struct symbol */
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
@@ -24,9 +53,13 @@ static unsigned int for_each(const char *name, symbol_callback_t func,
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
 
@@ -58,6 +91,7 @@ void symbol_read_exports(FILE *file)
 
 		sym = xcalloc(1, sizeof(struct symbol));
 		sym->name = name;
+		sym->addr.section = SHN_UNDEF;
 
 		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
 		++nsym;
@@ -84,6 +118,132 @@ struct symbol *symbol_get(const char *name)
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
@@ -94,5 +254,6 @@ void symbol_free(void)
 		free(sym);
 	}
 
+	hash_init(symbol_addrs);
 	hash_init(symbol_names);
 }
-- 
2.47.1.613.gc27f4b7a9f-goog


