Return-Path: <linux-kbuild+bounces-3009-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16953953920
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 19:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9784F1F21FBE
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3997F80604;
	Thu, 15 Aug 2024 17:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mYqj+2oP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070D6757EB
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743563; cv=none; b=UEBfDO7gbYmIfIwbwaoiFXAhrZdbpwP1KsKtNxbk9xvfIRfhDhJ3esNsUqkP8AEm0Ew8SbGgbpfLGeaUJf4VmF5O6OjnZkN831i/AZGV40hC0ATWhZBhuNNbrwuc2oqks2r1S7h1tD2e6RQUHkOUw5ty//tq+yUC1qaAmtjxMqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743563; c=relaxed/simple;
	bh=Ahmj2O3IR+LSl3BiA52xKx3B/l6T0r/Fo4+Nt8cR26I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sOwoMxOSuwP4tidI06d1RCDyBpeFfbC6aBnhxmESwUASpe5RoPKD8UOgDSCHb2kGm8Z7ybbU8RauOfk2mPsA2suQQrvlgP10f6Mx6+A6ULApDQ2i0lmV0dNKjG9t2eJPn9SHX0bbHL1fYP1iqrN+uuEQ7tcSFq6RvBRI1X+5VhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mYqj+2oP; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7bc8bb2f6f5so994693a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 10:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743560; x=1724348360; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mLQlJKBqT4/VzYmf9VfZ8u93RL60RGH7yZrLYBcRMXE=;
        b=mYqj+2oPpG6Dfn0tdKv50rvipmR1lNvUZEW/bFDN2nRGxkano25ikQ98iSZhDpZQE7
         9c1Swuj+Py6hGLL5HvLEZ0ZyXnUWuKEfkQx7/sSedxaJ5touR5pf1ljRLh043hHtFemj
         juOM/4gOJmXb+02yEPRbA4+A/4LgevSjeAR2wQf4dRVQkyv6f2jVWb70l4qW2gM0wwvY
         fKm+iKNNHMsA8H5L/vPvp7j+TtZ4dLQ/T1but4MWqCFrfPogy5yX/XcDfazMBfLtloTg
         HjtiE8UtqaYOnGKk9gAv60kQVQZdNjxXDzmMiwW7RDMs8Q8/pmmw+QJFWjg+G/0GgqXx
         GjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743560; x=1724348360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLQlJKBqT4/VzYmf9VfZ8u93RL60RGH7yZrLYBcRMXE=;
        b=fQfUfyedbDeruCTiy2mGwA34ZmigUmZhf097Vaz87bxDvu3EENID8X5htv9hEThpxK
         kzLD2VvCyb5N6A1nmu0RmqMv8S5TrZnEv7qWwWi8dNSKcdFHQJTC787ZsnEjTerC1mah
         s338iFyDbvVApfWZbTVyXa+aJ1dmry4gQfJfnnAs6jYCQrodm7nfnoyj0wJYDkMyeLl/
         6vKoh03/om7MMjtC8l01LN9cha47mKaQxVkPWAWeFYzj8NH49YV26OxCVz+2uS3cl2kD
         iFBTS87nJYziz38nPo14NkDjJRgP35HETojSH/LsiXduaVswHWwoJ+o2Czr18vnXD0NX
         /XQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOIVUv3QuDOz4dYdFOjbq+VxrQ2y7FrC4K0qVg6Driqe9oVUT/Ym+v16j1dsYEpg5cVW2QUq50vO6j9TsZEHdUkEDwQoSynKJIsNp+
X-Gm-Message-State: AOJu0YziZv0Nucl/bqABoEnz+QPNrLMCUQCeHvIFOTJve7VASYmE9r/V
	tLaOiujW5Lh7QMZmm9ECZ8+fxiPOMVOZTYMk5VqmzYxtxDr9oY5zNrtaK2XjUOqjQbVEN7Elh+O
	YzbQMyXaj5XjOmpZHyOeszL5oWA==
X-Google-Smtp-Source: AGHT+IE1twvMiJGv9A9PF3ykXAMYl/52O8nOi2sdu4GF15yrKLi7qKJGQ8IRVIMXcNpJkBrcc/J9f+3K3535R6ZKioE=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:5ec5:0:b0:760:76b9:ade9 with SMTP
 id 41be03b00d2f7-7c9791e4e77mr64a12.1.1723743560144; Thu, 15 Aug 2024
 10:39:20 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:08 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4474; i=samitolvanen@google.com;
 h=from:subject; bh=Ahmj2O3IR+LSl3BiA52xKx3B/l6T0r/Fo4+Nt8cR26I=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04aOj8csDviqueJ1eEjKR7eZPwgInAwuFoD
 5HAQqspMuCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7lcUC/9O1P8fFLBUCeOT4Cxm+rBpUW5+73RlFMMG8H+bGc4TSk35d91Su3NehrxYKKU/pT/PVPk
 DjVOLzLc8vrfvwl1Nt2wQ3EvSJwZZ2eqYER+zrUZkPmdpOjiOYowuBi+VOGnihjQZx8uQsuLUt7
 zhIE6Y174Min92jA8j8LDjo3zgA5McorGyWANE2Ma2NOssLU4RB3vC9Cv2K0cJXR5QuckfadlW/
 H8vQ6BvRvS05m2JGRSjmSdBZFGPGjJQ6ED/BTajeja7EOvAH4yaTiejmibxBkkf24sQYGkJtIFd
 9JRGxIuuBDftKiPVQh0Oy5oK7Bp85TJ10jeczHneuITdV9P5glF6Y93MaLFT/zfIHRIna8eMMht
 pCs8UVnoc1wLnWExqcs3Q+pdqBXsMgfk0hGBoCKsZS1ot/5/0WRepl1NmMVX+hWHaY52dKgGU/K pA+68yDFF6TmIwfEZNO90AOtKj3WGCZWGirLJ7+tlFKpTSC07C7XYKELv14DkFgF8HGFQ=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-25-samitolvanen@google.com>
Subject: [PATCH v2 04/19] gendwarfksyms: Add support for type pointers
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
---
 scripts/gendwarfksyms/dwarf.c         | 26 +++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  6 ++++++
 scripts/gendwarfksyms/symbols.c       | 16 ++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 71cfab0553da..956b30224316 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -94,6 +94,28 @@ static int process_variable(struct state *state, Dwarf_Die *die)
 	return check(process(state, "variable;\n"));
 }
 
+static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die ptr_type;
+	Dwarf_Die type;
+
+	if (!get_ref_die_attr(die, DW_AT_type, &ptr_type) ||
+	    dwarf_tag(&ptr_type) != DW_TAG_pointer_type) {
+		error("%s must be a pointer type!", get_name(die));
+		return -1;
+	}
+
+	if (!get_ref_die_attr(&ptr_type, DW_AT_type, &type)) {
+		error("%s pointer missing a type attribute?", get_name(die));
+		return -1;
+	}
+
+	if (dwarf_tag(&type) == DW_TAG_subroutine_type)
+		return check(process_subprogram(state, &type));
+	else
+		return check(process_variable(state, &ptr_type));
+}
+
 static int process_exported_symbols(struct state *state, Dwarf_Die *die)
 {
 	int tag = dwarf_tag(die);
@@ -114,7 +136,9 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
 
 		debug("%s", state->sym->name);
 
-		if (tag == DW_TAG_subprogram)
+		if (is_symbol_ptr(get_name(&state->die)))
+			check(process_symbol_ptr(state, &state->die));
+		else if (tag == DW_TAG_subprogram)
 			check(process_subprogram(state, &state->die));
 		else
 			check(process_variable(state, &state->die));
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index cb9106dfddb9..8f6acd1b8f8f 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -61,6 +61,11 @@ extern bool debug;
 /*
  * symbols.c
  */
+
+/* See symbols.c:is_symbol_ptr */
+#define SYMBOL_PTR_PREFIX "__gendwarfksyms_ptr_"
+#define SYMBOL_PTR_PREFIX_LEN (sizeof(SYMBOL_PTR_PREFIX) - 1)
+
 struct symbol_addr {
 	uint32_t section;
 	Elf64_Addr address;
@@ -78,6 +83,7 @@ struct symbol {
 	struct hlist_node name_hash;
 };
 
+extern bool is_symbol_ptr(const char *name);
 extern int symbol_read_exports(FILE *file);
 extern int symbol_read_symtab(int fd);
 extern struct symbol *symbol_get(const char *name);
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index f96acb941196..d6d016458ae1 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -41,6 +41,20 @@ static int __for_each_addr(struct symbol *sym, symbol_callback_t func,
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
 static int for_each(const char *name, bool name_only, symbol_callback_t func,
 		    void *data)
 {
@@ -49,6 +63,8 @@ static int for_each(const char *name, bool name_only, symbol_callback_t func,
 
 	if (!name || !*name)
 		return 0;
+	if (is_symbol_ptr(name))
+		name += SYMBOL_PTR_PREFIX_LEN;
 
 	hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
 				    name_hash(name)) {
-- 
2.46.0.184.g6999bdac58-goog


