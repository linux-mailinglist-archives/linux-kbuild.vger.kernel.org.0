Return-Path: <linux-kbuild+bounces-4423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A19B9B6A77
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6A77B20AE1
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B84235A25;
	Wed, 30 Oct 2024 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rttvv2AF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6538229B5C
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307715; cv=none; b=ahIp+/IWRh0kAw36zQV+1CRVwfYWL/5GMrvc3KJSjYnQEV69fBGO+5mjBWL8ChqYdbPykCfwkmO+7w4llcg0gRVesMzLGkPe006swcate8eXA6bhKnKTfVOzE6prZFKqn2I9yWc5o6B9hYWYTFGI6Fu+b1DsrBYSrSgvUlJVDGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307715; c=relaxed/simple;
	bh=BtK4LaLimoObIGP1FhwZS209qMjVJ2G36xcCoVpSoPc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a6HBC4J1rqBky9GtNh3Lsfaf7pl/q/LS1JVr7a7CkedSWbb0Z/La1PPHRgH1Fn6IowG0npU+Q1/gIxck/0wmMaRWkS229TwQ+6ibhDBBho3WX5Zn/atFTPZtjapMtC70PmnAFO1gI95UgJGgZDa/1Bc+IyLPm+hRzP8Wxxd+A1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rttvv2AF; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e76eabc7ddso8136082a91.3
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307711; x=1730912511; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+CXnGmJ+GGt3WD0nKae+FawRzcUFlErE3x+1aX4ifA=;
        b=rttvv2AF50LH27RXEnW5voAkFsF0dvGf4oL6ImLf3uW0Tk491wXGX5YmduSi1uNFt9
         dYvgPlQY4tPmr7cdcqjUfrJDVGXpJ2HaMzo1mgKV8dHLh+fPCMEgffZzta8KSgUgbc4R
         wXBpe27uFE2DZ7Q9t5FcJxIrLBSZQ0tSf4vhhdNFerS2FHMsy5OJDqBqPN3iU23dKMFo
         bZsU5pZ4XoBDMhGZc/NOZz5sFTfbBKiY26Zt3BL5deVcJrDMdAwngK+4xqnxR5MfLF0G
         2zHIerxxDl4G0oqlpBa1UfZKhucQ3lwhSDvbLUWq/BM2s61Uvrfhjyz5EZZWeE0WChL5
         Al+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307711; x=1730912511;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+CXnGmJ+GGt3WD0nKae+FawRzcUFlErE3x+1aX4ifA=;
        b=aKRrPfdnNn/v0OFgRRHVxEzC24AbvlN6WMzskYdGECCn1ThWRXV3o0wjDFmFVcYA9V
         T1azoueAjKK/kJbPEYbNiZRwpf2QvftORDJJugOMv/Lhljsmw4oYwlssA/pROkVr9qNw
         9inWcqThfIzrC8C3pCTp43+9aWlC8XVVactQ1LkeN30oD9wnTrIDpBi9ReAO/k1saDvk
         sQ5DIs9NnVe4lQl9yonQfB1Te41Lyonrq2/0wYuBtVJN8L6Zvlx1JtQ4JqXh7M/bjZ7l
         seSpjRojGyZHELa9OppAsM1h4qMVTYGH+vZ0IrYewSUxFv4N5TH1On0g+k/R5Q/s0pKw
         ec0g==
X-Forwarded-Encrypted: i=1; AJvYcCXtXWgE+zQIgq9nsd9jZc+JCADVUUpYBeNSzrTC32oIvpxCCPx9TrrX9j95rpTC59AfbMNMqGOkvp2pX8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQMfjRAFoCwhMQlWZtmgdmLBL1s/QB7AIpil5B8kGGXvB/Axj
	39KXJzWJ4oy9K//0v9FhM9cvVzDz0zHcUOj9eUZXuzr9mtLptnSpuOnpCHzoLs0F4FS/tRHFCgq
	AteDrsQrKZUb1//kYXbyNfg+Ibw==
X-Google-Smtp-Source: AGHT+IEuBkheXCwm4Fa6lCIiAS69m/igfsZmgSgUtqJnyMMeWymTvruL6WaEAMnZelFie3XPM2pp156IX2AE8UArm/0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90b:1c86:b0:2d8:e7ef:7d1e with
 SMTP id 98e67ed59e1d1-2e8f11dce24mr40394a91.7.1730307710249; Wed, 30 Oct 2024
 10:01:50 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:23 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7904; i=samitolvanen@google.com;
 h=from:subject; bh=BtK4LaLimoObIGP1FhwZS209qMjVJ2G36xcCoVpSoPc=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaVE7Onyyr2zTkw/aYHK+9fNbnw35QdZKXqfmTJ0sm
 jH5qsemjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjARb2dGhsn/L3vYOigHMHyw
 s3sVp1i+QFoybe6ftOC/6847RBgy+zMyTBF4UV7+US2hWfyhDesRlgu3PE2kj573K7DW9Jvnozm DHQA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-37-samitolvanen@google.com>
Subject: [PATCH v5 16/19] gendwarfksyms: Add support for symbol type pointers
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
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c              | 55 +++++++++++++++++++++-
 scripts/gendwarfksyms/examples/symbolptr.c | 33 +++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h      |  7 +++
 scripts/gendwarfksyms/symbols.c            | 27 +++++++++++
 4 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index ba0f502ad20c..10224756f2af 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -1013,6 +1013,31 @@ static void process_variable(struct state *state, Dwarf_Die *die)
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
@@ -1036,7 +1061,9 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
 
 		state_init(&state);
 
-		if (tag == DW_TAG_subprogram)
+		if (is_symbol_ptr(get_symbol_name(&state.die)))
+			save_symbol_ptr(&state);
+		else if (tag == DW_TAG_subprogram)
 			process_subprogram(&state, &state.die);
 		else
 			process_variable(&state, &state.die);
@@ -1049,8 +1076,34 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
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
+	cache_clear_expanded(&state.expansion_cache);
+}
+
 void process_cu(Dwarf_Die *cudie)
 {
 	check(process_die_container(NULL, NULL, cudie, process_exported_symbols,
 				    match_all));
+
+	symbol_for_each(process_symbol_ptr, dwarf_cu_getdwarf(cudie->cu));
 }
diff --git a/scripts/gendwarfksyms/examples/symbolptr.c b/scripts/gendwarfksyms/examples/symbolptr.c
new file mode 100644
index 000000000000..b7b97cd39769
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
+ * $ clang -g -c examples/symbolptr.c examples/symbolptr.o
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
index 962c36326ccc..c9277af76d7b 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -92,6 +92,10 @@ extern int symtypes;
  * symbols.c
  */
 
+/* See symbols.c:is_symbol_ptr */
+#define SYMBOL_PTR_PREFIX "__gendwarfksyms_ptr_"
+#define SYMBOL_PTR_PREFIX_LEN (sizeof(SYMBOL_PTR_PREFIX) - 1)
+
 static inline unsigned int addr_hash(uintptr_t addr)
 {
 	return hash_ptr((const void *)addr);
@@ -115,14 +119,17 @@ struct symbol {
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
index e0c9007f7250..e00c86fa0ba2 100644
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
2.47.0.163.g1226f6d8fa-goog


