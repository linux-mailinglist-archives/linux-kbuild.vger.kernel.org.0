Return-Path: <linux-kbuild+bounces-5366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5DEA00F0D
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 21:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FE49162FD2
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 20:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FE51E7678;
	Fri,  3 Jan 2025 20:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qzj5DyYt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295A1C1F13
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jan 2025 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937172; cv=none; b=d9rQbK+tqlkWdY+Koqcww+7W4CwUwKwQtaX80Pnw6ktGUcX0tCNuaHPyTzK3Y+B/yQ+gLKi2x2nuVHQQ2oYMbocLM1p3+LTEBvU4gC8MQn+6/vN2e5y9B0nrZ76MGQDz00uckSPBY6AJK8KzCrUCRYUA9r9vCPBai8/QrwaLpng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937172; c=relaxed/simple;
	bh=meWJOhPVkswEJEUPXpRMtDuGyzKKL9cF0sOOnTujhIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qiiHUJQzZiYZA8qMLH+GwMvYr/lVYL1JiDk7L84VR6JsaxnN/Fo4SJtF0Br6uq0VT2YtmBJlxh09FBpXIBMJyFxj00umKORdH9b8XEAWto4cOO02fMPUmBQPTQ0LNkaEb82gkZpenIoHnfH4P1Q27Bb6RsZ4Bm9gyZ3Eqg9Pb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qzj5DyYt; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2163dc0f5dbso154203015ad.2
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jan 2025 12:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937157; x=1736541957; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ+bQtpgXwuh9TDVVL7KrLC8CdDggoJteu7mzxqQJxM=;
        b=Qzj5DyYtOchJ5VZAov9Dlv5RToinceKV0ir7QVBlGBCUhP+QkkC7dH2IkXSs0fPZGf
         GRmv1UZvNSqFKPUUTSHk/ChjGCehQx4+kXLlKJKcrvxCmrvF8Vjofa62lz5wJfkQXDgA
         CWjLMAX0YeOZ6JVAtG//QG9r60ynglpd3RCBgzrckkIPLxxYjAaHU7B47LosEV5bYPhT
         KvAl9E6r4XmnSBS5Kn9uz9EV17DiStTvibgkaQvjpJUomy1jH0e8z8l/I0MAwID/t50a
         Wkcyaw7O8Uywn31y3Qc+fBSbAD+7PDYINOH3BzG9/anP9KSmqVcmEwehporRGGUr5y+S
         ul5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937157; x=1736541957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ+bQtpgXwuh9TDVVL7KrLC8CdDggoJteu7mzxqQJxM=;
        b=rGHJy8erXpB7CV6DSQdgFkVMc20AuxNRcJC3OrGwpKKZWLduOy/BJDiGsH2d8VBWUA
         ifzzOaMrypvVFohUOV2aKD3VxLId1d9xqBl90hC8A6As/hXipfdW+PMfsEv9KD1EpF7W
         TRvEI3nict1hcj3AUeuA6t09apR3hCuMXG7trKiVzFrH8sk9d/wyUkOlL+RD68P+0QU8
         tqNkpoxjJLA/9ZAedFtzwur/6O85PBAzKi+xXZ1hKjg6ZWNf5ZMpefGGJ0ipuzouqvjO
         ueJgYkO+IU3nvz+PrdsNQC5UvwPceaAw//Y1QVLs3CcJIHlUcOAThGldDwZV0vFzvM2K
         7C6g==
X-Forwarded-Encrypted: i=1; AJvYcCXmStoIbIZpKQBx2Iwgi4/xMofbA/HNm4eYfL2uK0y8FcK6ENL2k+O+DkAJDuUjL+j5olfqbb8xL7FpmVo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzmhz3K585Bf14E5yWmIiOTBMSWMR1RAyOrNMTKSrAmbUkTaaI
	XTedgTooaEqVEtT6LmpAfE57Gh2EdQP/R9IJ7psDxiGyh/HsOZGOPQgVVRyc8XASkgCcebtVg40
	GipK2EotESa4MCXS0ad0feU8qXQ==
X-Google-Smtp-Source: AGHT+IG6RCnmkZ7qTcCx7H4ePCaqMlHKEOJKEafW0+i5QszOMcrXkb1a+y0wXYSwVtz2CbGxomR2G/LYOmuxGPIKfhM=
X-Received: from pfwz3.prod.google.com ([2002:a05:6a00:1d83:b0:72a:83ec:b170])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6da9:b0:1db:d738:f2ff with SMTP id adf61e73a8af0-1e5e04503femr81302631637.2.1735937157557;
 Fri, 03 Jan 2025 12:45:57 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:37 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7893; i=samitolvanen@google.com;
 h=from:subject; bh=meWJOhPVkswEJEUPXpRMtDuGyzKKL9cF0sOOnTujhIQ=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPplrJt5xy297p+c4h5v117ka+5XB987+nDhz06mHm
 dN25DyW6ChlYRDjYJAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQATeXWL4Z/+zY03Aj5vebH8
 B5tJPc/7l63Lbgr9yLcO9O6sO2AlKFjPyHBD7NFRMZuVT+b98/6WsLns9L3VgfoT7s6eteslg4z ft52sAA==
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-35-samitolvanen@google.com>
Subject: [PATCH v8 15/18] gendwarfksyms: Add support for symbol type pointers
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

The compiler may choose not to emit type information in DWARF for
external symbols. Clang, for example, does this for symbols not
defined in the current TU.

To provide a way to work around this issue, add support for
__gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
the necessary type information in DWARF also for the missing symbols.

Example usage:

  #define GENDWARFKSYMS_PTR(sym) \
      static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
          __section(".discard.gendwarfksyms") = &sym;

  extern int external_symbol(void);
  GENDWARFKSYMS_PTR(external_symbol);

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c              | 55 +++++++++++++++++++++-
 scripts/gendwarfksyms/examples/symbolptr.c | 33 +++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h      |  7 +++
 scripts/gendwarfksyms/symbols.c            | 27 +++++++++++
 4 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 746a89d9e3d4..534d9aa7c114 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -1061,6 +1061,31 @@ static void process_variable(struct state *state, Dwarf_Die *die)
 	process_symbol(state, die, __process_variable);
 }
 
+static void save_symbol_ptr(struct state *state)
+{
+	Dwarf_Die ptr_type;
+	Dwarf_Die type;
+
+	if (!get_ref_die_attr(&state->die, DW_AT_type, &ptr_type) ||
+	    dwarf_tag(&ptr_type) != DW_TAG_pointer_type)
+		error("%s must be a pointer type!",
+		      get_symbol_name(&state->die));
+
+	if (!get_ref_die_attr(&ptr_type, DW_AT_type, &type))
+		error("%s pointer missing a type attribute?",
+		      get_symbol_name(&state->die));
+
+	/*
+	 * Save the symbol pointer DIE in case the actual symbol is
+	 * missing from the DWARF. Clang, for example, intentionally
+	 * omits external symbols from the debugging information.
+	 */
+	if (dwarf_tag(&type) == DW_TAG_subroutine_type)
+		symbol_set_ptr(state->sym, &type);
+	else
+		symbol_set_ptr(state->sym, &ptr_type);
+}
+
 static int process_exported_symbols(struct state *unused, struct die *cache,
 				    Dwarf_Die *die)
 {
@@ -1084,7 +1109,9 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
 
 		state_init(&state);
 
-		if (tag == DW_TAG_subprogram)
+		if (is_symbol_ptr(get_symbol_name(&state.die)))
+			save_symbol_ptr(&state);
+		else if (tag == DW_TAG_subprogram)
 			process_subprogram(&state, &state.die);
 		else
 			process_variable(&state, &state.die);
@@ -1097,10 +1124,36 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
 	}
 }
 
+static void process_symbol_ptr(struct symbol *sym, void *arg)
+{
+	struct state state;
+	Dwarf *dwarf = arg;
+
+	if (sym->state != SYMBOL_UNPROCESSED || !sym->ptr_die_addr)
+		return;
+
+	debug("%s", sym->name);
+	state_init(&state);
+	state.sym = sym;
+
+	if (!dwarf_die_addr_die(dwarf, (void *)sym->ptr_die_addr, &state.die))
+		error("dwarf_die_addr_die failed for symbol ptr: '%s'",
+		      sym->name);
+
+	if (dwarf_tag(&state.die) == DW_TAG_subroutine_type)
+		process_subprogram(&state, &state.die);
+	else
+		process_variable(&state, &state.die);
+
+	cache_free(&state.expansion_cache);
+}
+
 void process_cu(Dwarf_Die *cudie)
 {
 	check(process_die_container(NULL, NULL, cudie, process_exported_symbols,
 				    match_all));
 
+	symbol_for_each(process_symbol_ptr, dwarf_cu_getdwarf(cudie->cu));
+
 	cache_free(&srcfile_cache);
 }
diff --git a/scripts/gendwarfksyms/examples/symbolptr.c b/scripts/gendwarfksyms/examples/symbolptr.c
new file mode 100644
index 000000000000..88bc1bd60da8
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/symbolptr.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ *
+ * Example for symbol pointers. When compiled with Clang, gendwarfkyms
+ * uses a symbol pointer for `f`.
+ *
+ * $ clang -g -c examples/symbolptr.c -o examples/symbolptr.o
+ * $ echo -e "f\ng\np" | ./gendwarfksyms -d examples/symbolptr.o
+ */
+
+/* Kernel macros for userspace testing. */
+#ifndef __used
+#define __used __attribute__((__used__))
+#endif
+#ifndef __section
+#define __section(section) __attribute__((__section__(section)))
+#endif
+
+#define __GENDWARFKSYMS_EXPORT(sym)				\
+	static typeof(sym) *__gendwarfksyms_ptr_##sym __used	\
+		__section(".discard.gendwarfksyms") = &sym;
+
+extern void f(unsigned int arg);
+void g(int *arg);
+void g(int *arg) {}
+
+struct s;
+extern struct s *p;
+
+__GENDWARFKSYMS_EXPORT(f);
+__GENDWARFKSYMS_EXPORT(g);
+__GENDWARFKSYMS_EXPORT(p);
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index fe49730fe623..197a1a8123c6 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -89,6 +89,10 @@ extern int symtypes;
  * symbols.c
  */
 
+/* See symbols.c:is_symbol_ptr */
+#define SYMBOL_PTR_PREFIX "__gendwarfksyms_ptr_"
+#define SYMBOL_PTR_PREFIX_LEN (sizeof(SYMBOL_PTR_PREFIX) - 1)
+
 static inline unsigned int addr_hash(uintptr_t addr)
 {
 	return hash_ptr((const void *)addr);
@@ -112,14 +116,17 @@ struct symbol {
 	struct hlist_node name_hash;
 	enum symbol_state state;
 	uintptr_t die_addr;
+	uintptr_t ptr_die_addr;
 	unsigned long crc;
 };
 
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);
 
+bool is_symbol_ptr(const char *name);
 void symbol_read_exports(FILE *file);
 void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
+void symbol_set_ptr(struct symbol *sym, Dwarf_Die *ptr);
 void symbol_set_die(struct symbol *sym, Dwarf_Die *die);
 void symbol_set_crc(struct symbol *sym, unsigned long crc);
 void symbol_for_each(symbol_callback_t func, void *arg);
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 4c499ba6c86d..327f87389c34 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -39,6 +39,20 @@ static unsigned int __for_each_addr(struct symbol *sym, symbol_callback_t func,
 	return processed;
 }
 
+/*
+ * For symbols without debugging information (e.g. symbols defined in other
+ * TUs), we also match __gendwarfksyms_ptr_<symbol_name> symbols, which the
+ * kernel uses to ensure type information is present in the TU that exports
+ * the symbol. A __gendwarfksyms_ptr pointer must have the same type as the
+ * exported symbol, e.g.:
+ *
+ *   typeof(symname) *__gendwarf_ptr_symname = &symname;
+ */
+bool is_symbol_ptr(const char *name)
+{
+	return name && !strncmp(name, SYMBOL_PTR_PREFIX, SYMBOL_PTR_PREFIX_LEN);
+}
+
 static unsigned int for_each(const char *name, symbol_callback_t func,
 			     void *data)
 {
@@ -47,6 +61,8 @@ static unsigned int for_each(const char *name, symbol_callback_t func,
 
 	if (!name || !*name)
 		return 0;
+	if (is_symbol_ptr(name))
+		name += SYMBOL_PTR_PREFIX_LEN;
 
 	hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
 				    hash_str(name)) {
@@ -84,6 +100,17 @@ void symbol_set_crc(struct symbol *sym, unsigned long crc)
 		error("no matching symbols: '%s'", sym->name);
 }
 
+static void set_ptr(struct symbol *sym, void *data)
+{
+	sym->ptr_die_addr = (uintptr_t)((Dwarf_Die *)data)->addr;
+}
+
+void symbol_set_ptr(struct symbol *sym, Dwarf_Die *ptr)
+{
+	if (for_each(sym->name, set_ptr, ptr) == 0)
+		error("no matching symbols: '%s'", sym->name);
+}
+
 static void set_die(struct symbol *sym, void *data)
 {
 	sym->die_addr = (uintptr_t)((Dwarf_Die *)data)->addr;
-- 
2.47.1.613.gc27f4b7a9f-goog


