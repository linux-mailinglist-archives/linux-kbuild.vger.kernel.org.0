Return-Path: <linux-kbuild+bounces-2160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80C90B8A9
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 19:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BBBD1F24E23
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 17:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB32195971;
	Mon, 17 Jun 2024 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YsK0k5r9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5C19049C
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647111; cv=none; b=uM8kmeAvfPXbajEU6SJUIVJCAAnYx6DrAwOYGBc8W9iPYV6zSv1YNTn+Ta+5EHr0dgpxK3+n2247RZKoVqVScW1VDU3Wk443OqVUVXjcMn4tq+4SvZGnYr13cHf+jRC1DpJbn1W8tMxWpmp2/nmT8xy7HpAj1qzXuXKce3eDWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647111; c=relaxed/simple;
	bh=xEYsXEZcuwwhUBMDlUBf1X1yPVPLH2iuty1W6//7LKE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VKNR+Jn+EjHSp/qY5HeKDG90pqnpt+0svAoHGJ0JJmX2TGJP5YmwPYCL+N1708ie4yLWW3kSi36d4Qu0ii9nNigI/xSpsNz1atAz8imDPplzkBPXN4cKYIgUPkJeihISI+hLt9XtKsuytHGbdPorXZlTG70SD2H0i2Ykngel4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YsK0k5r9; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2c2dd94c728so4804895a91.2
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647109; x=1719251909; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3E8V7gmLyohlBlm4SnFOe783c56Xkz1mRG3vn3a+Cc=;
        b=YsK0k5r9C8Q57thtCDVipAKCZbXoOQDonsoFbHteE8LIK4lSMjpHQDertfZFR+cgoY
         Fm+jwHlC8tqZ8S49bXRGHuYP75sHRJ8+6hSPTh4req5aGp/AzAjmbAU79lw5pEDpsctk
         YXURUc8rRQA4w+LOpQqN7aRaPxO32BK+4XTTPoDawoSwlQt33cZq79lBB50OyfRdatiR
         gdn4mtvQblBaKI5wV1nFbxa9WvkMQmk0U4oMd6NO3FhCvLbXTG7Ac8RNzSjRcC/6BCRV
         /V6NutKjzpUofZ/Awm7bsi7IjLtOrDHgI7qvb0frN7HdvRAzhUKLCAW7vKflpJxdiWQK
         pCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647109; x=1719251909;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3E8V7gmLyohlBlm4SnFOe783c56Xkz1mRG3vn3a+Cc=;
        b=ZRoeEoU/p6NaY7iFD8P+WxziDx76mm/rn03c66ZEXnOX+jGvEbZOPIv0x/x5kMTLJu
         SwKuGTsv1qxyyi//oPIzuSO0KpHDUy3mt2psC61gmfC5z3ZaNHPn9XtIuobkGFG2kYCm
         sqtWbccQnbl0g1dv5WES4d1NAN3M28WCGsZ2bJYb7qhuAdvkPPOwu/H3N/EZInVm/EHy
         vKdzwEuHsb06u3r0TRIxZUWrB2zzpXiHgK5vwvJ+VFSRArxX29+8UVLN+Zw1kwTUXe7s
         4r+NU1rPzvkzhWuqD5bfMXcyBz+v3jOQ7TYNw1Tr+Hn5BJYD94P4IMmqlsid3U4/DFa1
         huRw==
X-Forwarded-Encrypted: i=1; AJvYcCVSvQJBZ3nkDqjWi7jfylpftF8VgW5FP6fT+53FyHUGqQQ7pqBpPA9UZgDOJsxIPPOU98BpyBBv49hqppEUeNYGEGmEjya7dOSvzqOD
X-Gm-Message-State: AOJu0YyKqPmAWq3s6ztVYGMPdHIQDrWvnXAkGCZhTmeajOWi0pGT02y3
	S9YjsptRXlx9V0qLxJ5mMEfDrUq3Zdkcai/gRYL4HRLvKNrIUBiiAMmEcWbS4WRCH3SbvcaB0or
	/fgADbi152iiklr5Qhqb/775Vaw==
X-Google-Smtp-Source: AGHT+IHsjSrwOS0Wj6w6liPWf1kv/uqSpoF2WSPbUclGM+sXDYGYNn9as+p2jf2d8vSq09tsOBsmTenxf4MfLYAt/8U=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:f601:b0:1f7:3e75:20cf with
 SMTP id d9443c01a7336-1f8627f9149mr763355ad.8.1718647109252; Mon, 17 Jun 2024
 10:58:29 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:21 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=8432; i=samitolvanen@google.com;
 h=from:subject; bh=xEYsXEZcuwwhUBMDlUBf1X1yPVPLH2iuty1W6//7LKE=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk6sng5HUOoC/7PBTpSTIHLFp+zaKAkdN/PD
 3Pay0BzSciJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5OgAKCRBMtfaEi7xW
 7koJDACqAdbqz0N0fPaklN5axIJo9/W9Atwvp0ZtvnO5B+8ZSkl8hLF9tJF8YaTMbGIPAIgULmX
 tXuCuZhhOFCsrwYfYWyNzpV0RZtSqSckWGdcfLG/4+Q0rJMsoWiyorxsh8X54Ehb7ZFqDHT7o1G
 CV6edtc+Rei2jiOR5ABAcdA7yHSl+folJT//qII8uXNRbiJHhOcf7a0is7s/xm9lHmpwvyFTVlI
 KF7FJHEEDEG/YI8ahPtKcio1JOkDCT+ND0/9dJC63lqVS+tfIbXYnojkFXheNpIQrbWEs+2O94Z
 rntIqvvWvAL72TXg/Ql6xxP7MCzhBK9F5Z7SrnO+Udd1gWnlf0EEoSLlpSg+E30RZfZFA5Rhvqa
 KvzYrtFSDuHSa3RtyyoHxyiM0lvLH3Al8UfmyEi16bs/ZYzXLXJEFhuKmlGLn2iLYHDXwBO0vEY NjpQWUn8TPfGSaB+VuU/0jJ5acQASB7dzw692q9U+bcth9TAnJNazvVU5+QQOWcZPJK2k=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-19-samitolvanen@google.com>
Subject: [PATCH 02/15] gendwarfksyms: Add symbol list input handling
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Support passing a list of exported symbols to gendwarfksyms via stdin
and filter non-exported symbols from the output.

The symbol list input has the format 'symbol-address symbol-name' to
allow the parser to discover exported symbols also by address. This
is necessary for aliased symbols, where only one name appears in the
debugging information.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/gendwarfksyms/Build           |   1 +
 tools/gendwarfksyms/gendwarfksyms.c |   2 +
 tools/gendwarfksyms/gendwarfksyms.h |  17 ++++
 tools/gendwarfksyms/symbols.c       | 130 ++++++++++++++++++++++++++++
 tools/gendwarfksyms/types.c         |  70 ++++++++++++++-
 5 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 tools/gendwarfksyms/symbols.c

diff --git a/tools/gendwarfksyms/Build b/tools/gendwarfksyms/Build
index 805591b6df80..a83c59bfef8b 100644
--- a/tools/gendwarfksyms/Build
+++ b/tools/gendwarfksyms/Build
@@ -1,2 +1,3 @@
 gendwarfksyms-y += gendwarfksyms.o
+gendwarfksyms-y += symbols.o
 gendwarfksyms-y += types.o
diff --git a/tools/gendwarfksyms/gendwarfksyms.c b/tools/gendwarfksyms/gendwarfksyms.c
index 4a2dea307849..4a1bd9239182 100644
--- a/tools/gendwarfksyms/gendwarfksyms.c
+++ b/tools/gendwarfksyms/gendwarfksyms.c
@@ -96,6 +96,8 @@ int main(int argc, const char **argv)
 	if (parse_options(argc, argv, &filename) < 0)
 		return usage();
 
+	check(symbol_read_list(stdin));
+
 	fd = open(filename, O_RDONLY);
 	if (fd == -1) {
 		error("open failed for '%s': %s", filename, strerror(errno));
diff --git a/tools/gendwarfksyms/gendwarfksyms.h b/tools/gendwarfksyms/gendwarfksyms.h
index 44e94f1d9671..b77855cc94a7 100644
--- a/tools/gendwarfksyms/gendwarfksyms.h
+++ b/tools/gendwarfksyms/gendwarfksyms.h
@@ -49,6 +49,21 @@ extern bool debug;
 		__res;                                          \
 	})
 
+/*
+ * symbols.c
+ */
+
+/* Exported symbol -- matching either the name or the address */
+struct symbol {
+	const char *name;
+	uintptr_t addr;
+	struct hlist_node addr_hash;
+	struct hlist_node name_hash;
+};
+
+extern int symbol_read_list(FILE *file);
+extern struct symbol *symbol_get(uintptr_t addr, const char *name);
+
 /*
  * types.c
  */
@@ -56,6 +71,8 @@ extern bool debug;
 struct state {
 	Dwfl_Module *mod;
 	Dwarf *dbg;
+	struct symbol *sym;
+	Dwarf_Die origin;
 };
 
 typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
diff --git a/tools/gendwarfksyms/symbols.c b/tools/gendwarfksyms/symbols.c
new file mode 100644
index 000000000000..2cae61bcede7
--- /dev/null
+++ b/tools/gendwarfksyms/symbols.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <string.h>
+#include <linux/jhash.h>
+#include "gendwarfksyms.h"
+
+/* Hash tables for looking up requested symbols by address and name */
+#define SYMBOL_HASH_BITS 7
+DEFINE_HASHTABLE(symbol_addrs, SYMBOL_HASH_BITS);
+DEFINE_HASHTABLE(symbol_names, SYMBOL_HASH_BITS);
+
+static u32 name_hash(const char *name)
+{
+	return jhash(name, strlen(name), 0);
+}
+
+/* symbol_for_each callback -- return true to stop, false to continue */
+typedef bool (*symbol_callback_t)(struct symbol *, void *arg);
+
+static bool for_each_addr(uintptr_t addr, symbol_callback_t func, void *data)
+{
+	struct symbol *sym;
+	bool found = false;
+
+	if (addr == UINTPTR_MAX)
+		return false;
+
+	hash_for_each_possible(symbol_addrs, sym, addr_hash, addr) {
+		if (sym->addr == addr) {
+			if (func(sym, data))
+				return true;
+			found = true;
+		}
+	}
+
+	return found;
+}
+
+static bool for_each_name(const char *name, symbol_callback_t func, void *data)
+{
+	struct symbol *sym;
+	bool found = false;
+
+	if (!name)
+		return false;
+
+	hash_for_each_possible(symbol_names, sym, name_hash, name_hash(name)) {
+		if (!strcmp(sym->name, name)) {
+			if (func(sym, data))
+				return true;
+			found = true;
+		}
+	}
+
+	return found;
+}
+
+static bool for_each(uintptr_t addr, const char *name, symbol_callback_t func,
+		     void *data)
+{
+	bool found = false;
+
+	if (for_each_addr(addr, func, data))
+		found = true;
+	if (for_each_name(name, func, data))
+		found = true;
+
+	return found;
+}
+
+int symbol_read_list(FILE *file)
+{
+	struct symbol *sym;
+	char *line = NULL;
+	char *name = NULL;
+	uint64_t addr;
+	size_t size = 0;
+
+	while (getline(&line, &size, file) > 0) {
+		if (sscanf(line, "%" PRIx64 " %ms\n", &addr, &name) != 2) {
+			error("malformed input line (expected 'address symbol-name'): %s",
+			      line);
+			return -1;
+		}
+
+		free(line);
+		line = NULL;
+
+		sym = malloc(sizeof(struct symbol));
+		if (!sym) {
+			error("malloc failed");
+			return -1;
+		}
+
+		debug("adding { %lx, \"%s\" }", addr, name);
+
+		sym->addr = (uintptr_t)addr;
+		sym->name = name;
+		name = NULL;
+
+		hash_add(symbol_addrs, &sym->addr_hash, sym->addr);
+		hash_add(symbol_names, &sym->name_hash, name_hash(sym->name));
+	}
+
+	if (line)
+		free(line);
+
+	return 0;
+}
+
+static bool return_symbol(struct symbol *sym, void *arg)
+{
+	struct symbol **res = (struct symbol **)arg;
+
+	*res = sym;
+	return true; /* Stop -- return the first match */
+}
+
+struct symbol *symbol_get(uintptr_t addr, const char *name)
+{
+	struct symbol *sym;
+
+	if (for_each(addr, name, return_symbol, &sym))
+		return sym;
+
+	return NULL;
+}
diff --git a/tools/gendwarfksyms/types.c b/tools/gendwarfksyms/types.c
index 2a8e45ae911c..f1ce7bfcf510 100644
--- a/tools/gendwarfksyms/types.c
+++ b/tools/gendwarfksyms/types.c
@@ -5,6 +5,68 @@
 
 #include "gendwarfksyms.h"
 
+#define DEFINE_GET_ATTR(attr, type)                                    \
+	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
+				      type *value)                     \
+	{                                                              \
+		Dwarf_Attribute da;                                    \
+		return dwarf_attr(die, id, &da) &&                     \
+		       !dwarf_form##attr(&da, value);                  \
+	}
+
+DEFINE_GET_ATTR(addr, Dwarf_Addr)
+
+static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
+{
+	Dwarf_Attribute da;
+
+	/* dwarf_formref_die returns a pointer instead of an error value. */
+	return dwarf_attr(die, id, &da) && dwarf_formref_die(&da, value);
+}
+
+static const char *get_name(Dwarf_Die *die)
+{
+	Dwarf_Attribute attr;
+
+	/* rustc uses DW_AT_linkage_name for exported symbols */
+	if (dwarf_attr(die, DW_AT_linkage_name, &attr) ||
+	    dwarf_attr(die, DW_AT_name, &attr)) {
+		return dwarf_formstring(&attr);
+	}
+
+	return NULL;
+}
+
+static Dwarf_Die *get_exported(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die *origin = NULL;
+	Dwarf_Word addr = UINTPTR_MAX;
+
+	state->sym = NULL;
+
+	/* If the DIE has an abstract origin, use it for type expansion. */
+	if (get_ref_die_attr(die, DW_AT_abstract_origin, &state->origin))
+		origin = &state->origin;
+
+	/*
+	 * Only one name is emitted for aliased functions, so we must match
+	 * the address too, if available.
+	 */
+	if (get_addr_attr(die, DW_AT_low_pc, &addr) &&
+	    dwfl_module_relocate_address(state->mod, &addr) < 0) {
+		error("dwfl_module_relocate_address failed");
+		return NULL;
+	}
+
+	state->sym = symbol_get(addr, get_name(die));
+
+	/* Look up using the origin name if there are no matches. */
+	if (!state->sym && origin)
+		state->sym = symbol_get(addr, get_name(origin));
+
+	return origin ? origin : die;
+}
+
 /*
  * Type string processing
  */
@@ -40,7 +102,7 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 }
 
 /*
- * Symbol processing
+ * Exported symbol processing
  */
 static int process_subprogram(struct state *state, Dwarf_Die *die)
 {
@@ -67,6 +129,12 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
 	/* Possible exported symbols */
 	case DW_TAG_subprogram:
 	case DW_TAG_variable:
+		die = get_exported(state, die);
+		if (!die || !state->sym)
+			return 0;
+
+		debug("%s (@ %lx)", state->sym->name, state->sym->addr);
+
 		if (tag == DW_TAG_subprogram)
 			check(process_subprogram(state, die));
 		else
-- 
2.45.2.627.g7a2c4fd464-goog


