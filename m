Return-Path: <linux-kbuild+bounces-5209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 325AB9F86A9
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16B85188AE97
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699491FECC6;
	Thu, 19 Dec 2024 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2PKkc+tW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4B21FF1D6
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642497; cv=none; b=NrGBZXu8upDd5hVxgR2offSruTDu/gq7cBipauvKifaRQALl8DwdspOlcyQ5ucJKX7PURrR2ybbJVzTFwXlVjBy3SEgoJXGb6DoGZ9QiGr7r87sRJRqJ0cly9HzuC3Tt5B53MZwNFDUdZukTz4fjOPsqnN0EEmHoMirTU2KkPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642497; c=relaxed/simple;
	bh=meWJOhPVkswEJEUPXpRMtDuGyzKKL9cF0sOOnTujhIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QVN0OYyop4/lSPvTnXKeJm8dgD0hDLP5QxCwhvVgetD/DRittl3IuAQ59elliI1Sn/wCWowcsSvNc3LDyzbn3TXLniknVLDmZkycdfvndgX/rUOQ+E8+ohMO+p2tdjPN+Ozbe6YAwu9CG6FOdQ69XMAbXSYNNtP8rEVBP+yQ/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2PKkc+tW; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166a1a5cc4so11302285ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642494; x=1735247294; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ+bQtpgXwuh9TDVVL7KrLC8CdDggoJteu7mzxqQJxM=;
        b=2PKkc+tWijCOqRnr4WXcjJfj3mOQGjm+17rpOKvfesZTYu1U+Evo74tUZ9mfSQnRVg
         +gEmg4OEy/GwpRZrry6CBSYypSxHwr1oGqSel2xgVm+PFWJnAt+oKR4o9YGtgMcmGzTV
         lJcmbZQbIFbm95pLaG4bdorOC4NSNi+c6hETnZlLBGMwpr5+n5pqETw1dPxTGWWHn+tZ
         wbipKx8B+0FmqIgCOXmv7hKAynQ/bVedPncjLq+35wQUUeEWU2NO8VaXgjp4cxD4ZJNM
         oYQg9DsVpQ2iFOHYlEQvo7Bq94j+/TggbYatZnS6DsHaSJCyT0Y3c9IchYUFTH+XzHDn
         4u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642494; x=1735247294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ+bQtpgXwuh9TDVVL7KrLC8CdDggoJteu7mzxqQJxM=;
        b=UIZteRb/uf2+StDh/RbFpN/7SLIxtXEDIZwHU23/61ze/hq1bTzvYeXmcVgobIKdRg
         XmS1SzC812u86ln/z3uLpK0RPX8/2e5AER4KQVZ8vMBeirv95EWTaTNwe+bsXlnTu3lS
         xU8FAA4/avNzUOBewkhkwszZivC93XwHKTZfzKlE9HhHlzKz2aSnnqcCUafC2AbydeCv
         AnwC8l8T8yWznau/SJjlMaInG5jVEU8RCvzNbrH7KAUnbDBymWPO6xOgbjT7x4vowGyp
         iKOgujflOfzNYsFE+onU8xOofShMi8FoagbiLwnia/+8EFFYyVwJOsB10itcXepR/ZaX
         SrHA==
X-Forwarded-Encrypted: i=1; AJvYcCULWdcFnXTa4uXhcD2tJF5GShV4kKFKyZZZHjNLkSSY2xADyRE/j5A5YvRqQGqlO7+qNb+RXFLsELcV0IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFRACvdYlacO3a+2wKIhNXcarANszXh1JISUTQSv5MBnSnRNR
	vEP42eU9ho4EuyhHAe4rSm7eGSWwnokwwnoidMi4runAEfZdca1x25tXETnI8k+tXc4VSc/lWj9
	fae3WH7BExSMmGiHLDrtrelpnpw==
X-Google-Smtp-Source: AGHT+IFanGBqP4nFKDIDHoYd02bX7Fby8FIHEYxpEIjfOOg6TCvJOUA3qQnwUsNt2GWM+nb/JBf8ycMhpKxFRcd5rHY=
X-Received: from pjur4.prod.google.com ([2002:a17:90a:d404:b0:2ea:448a:8cd1])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2c84:b0:2ee:f687:6ad5 with SMTP id 98e67ed59e1d1-2f452dfd364mr694606a91.2.1734642494365;
 Thu, 19 Dec 2024 13:08:14 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:52 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7893; i=samitolvanen@google.com;
 h=from:subject; bh=meWJOhPVkswEJEUPXpRMtDuGyzKKL9cF0sOOnTujhIQ=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3QprJt5xy297p+c4h5v117ka+5XB987+nDhz06mHm
 dN25DyW6ChlYRDjYJAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQATCatk+O86J7wpnmP2Zu1e
 a4Xb6XMiPx9g6g7SO5uSXyOrtErK/Scjw48HUbsbE/gOnHgc4NU6rbVnBtvKhd+LvX9vXzh/1+K WfA4A
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-35-samitolvanen@google.com>
Subject: [PATCH v7 15/18] gendwarfksyms: Add support for symbol type pointers
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


