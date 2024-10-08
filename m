Return-Path: <linux-kbuild+bounces-3968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656209956F0
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9ECCB28DF8
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320C9219CA5;
	Tue,  8 Oct 2024 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QyTa3zAj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E678219C80
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412745; cv=none; b=BeNPYrG9HMAb5xr748HCKZbJGMXekMJsKYB/TV1heZhlNTJTqd9RRfkwv6YooelYzhlVXwbwofhLCJY2Y7HkubLyuaGXo60gLauyxFD3eQGOKQ7272Gm175n+8T5LWGVBwPzqq+kVvFB0m1JtBMf7R6f0zbMkvL1azBj0S+xUMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412745; c=relaxed/simple;
	bh=YOOugzM5mt+RGuDHuB7UYTtvmIzVOO1B8SD7j0f4lu8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QQqgoOmmMNrLAaZtandOz8N4jU1sZVLYj/BwVD0GwkKNx7hk/++bU3TSEPyGx7tRiHURa+RxTahtLFJXOHRut8iPMXJ2/Bm10QQJrRxGIR6+PhtJjkNXaRnrpWfixnPr9/bRjetwqTnl5WO3IIn3BAy+CpzbnijBSGv0Xy96iaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QyTa3zAj; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-71dfd33fe78so3670812b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412742; x=1729017542; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tGTnU6hyS0+XSlLsxEi6enqtqzcVag7ZErzUexQjRPI=;
        b=QyTa3zAjdY0G42EVku5suugCy91FGhCj1RISbdmDarGRojMA7Int5OcOHVwgbLfMum
         b2jQsP9UqtK31SdGC6uCYGGpBOCBD8i4nRQRf7RqQyg05FMJA/MJ2Y5mpUsrArx1KxPj
         uqXZvUUqduF1VrU4CGU2Lsr4kIsawJ3R4ERGS0qKCPyrrHs1tSaC3FY2OHl3CI0CQiyr
         u5i+bUqCuvNEDWeU8ZBhcpNM2V0YApyL9nnMR3okm902kt87HjqZa1JaotOF5fNQnBxQ
         y1CWZhdXPsroPsfReCUlHIx5PWPDMV2vq7Ir1upp7fbUNvrfQC/W3fdBzN70hbG0JjJl
         iNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412742; x=1729017542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGTnU6hyS0+XSlLsxEi6enqtqzcVag7ZErzUexQjRPI=;
        b=iRJmwUyqR4RVenJWbn7KUSkOQIFu9EuwTd3WdVxWs2jOdQGXEyBkWVDgkSC1pEjxuY
         +CDqc8Ha2EcAAFd6o6hRNqd7Cqze5JLfchJyMsvW2v9SC6TtJhJJkZMB7xzvLPbcuTK0
         B//vQHcck7TCYtJaoFi2FP98PyWcKPlHi3CQa0rtROW5FJBfO5lqElvedPlb+p8XTdrb
         AtAUmLRCnh6JlN33RY8JIxV4ZQy/w+m2sHKz89Z7EZely+g/71i+9VlMrmWa6EmNJ8CO
         ir/uIQYjfg2sL0mdhNLUq9KiEk+xaWiugA8iZEr+4ry5dELYOyKjzhAwTTKdTfVmxnXe
         vlVA==
X-Forwarded-Encrypted: i=1; AJvYcCVs6HvGzehdhOYkGrZRpa8ePs/GBoz93lO0y+vp1pyesfJsRz+lP5OpRNLWGDdvqUkCPajqimnnGOpM1zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJT1N0QXRnqy0wJPUGVN4kRmsXepn+F+VFdiNCCAmFAysP9Fj
	mkZskAagE4GN+Hb7md0kJgnUtpmQ0Py4aTDWEwolEOfdY40ZMP/q9JR15oiDa8O5LARgXO/OifZ
	P96Mo/8VIoOLZhCcKOkx/gidS7Q==
X-Google-Smtp-Source: AGHT+IGNnB1cloqV7aXucCU01PgaJb0uEyG5KMs/AGIEMrZ0/YCZFoa3riLo9tKZ/4pPLjQbxX595RxM/JhD2/CfCrI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:aa7:9193:0:b0:71d:f4ee:9034 with SMTP
 id d2e1a72fcca58-71df4ee913bmr26528b3a.0.1728412741790; Tue, 08 Oct 2024
 11:39:01 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:38 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=18038; i=samitolvanen@google.com;
 h=from:subject; bh=YOOugzM5mt+RGuDHuB7UYTtvmIzVOO1B8SD7j0f4lu8=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNeqXZ27tvvxr+r7TplFmsanCvPc6nBlEzSr2Tv928
 4fVEoG9HaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAisysZGa6FCruL3FW4Yin+
 xi5v1so/VekZvB+lNkQe5VxxfO9R13pGho/XYruPTvz7pya9i7Hjq8cRpsSclcx3yk9eKlsaqmQ cww8A
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-35-samitolvanen@google.com>
Subject: [PATCH v4 14/19] gendwarfksyms: Add support for kABI rules
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

Distributions that want to maintain a stable kABI need the ability
to make ABI compatible changes to kernel without affecting symbol
versions, either because of LTS updates or backports.

With genksyms, developers would typically hide these changes from
version calculation with #ifndef __GENKSYMS__, which would result
in the symbol version not changing even though the actual type has
changed.  When we process precompiled object files, this isn't an
option.

To support this use case, add a --stable command line flag that
gates kABI stability features that are not needed in mainline
kernels, but can be useful for distributions, and add support for
kABI rules, which can be used to restrict gendwarfksyms output.

The rules are specified as a set of null-terminated strings stored
in the .discard.gendwarfksyms.kabi_rules section. Each rule consists
of four strings as follows:

  "version\0type\0target\0value"

The version string ensures the structure can be changed in a
backwards compatible way. The type string indicates the type of the
rule, and target and value strings contain rule-specific data.

Initially support two simple rules:

  1. Declaration-only structures

     A structure declaration can change into a full definition when
     additional includes are pulled in to the TU, which changes the
     versions of any symbol that references the struct. Add support
     for defining declaration-only structs whose definition is not
     expanded during versioning.

  2. Ignored enum fields

     It's possible to add new enum fields without changing the ABI,
     but as the fields are included in symbol versioning, this would
     change the versions. Add support for ignoring specific fields.

Add examples for using the rules under the examples/ directory.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 scripts/gendwarfksyms/Makefile              |   1 +
 scripts/gendwarfksyms/dwarf.c               |  19 +-
 scripts/gendwarfksyms/examples/kabi.h       |  61 ++++++
 scripts/gendwarfksyms/examples/kabi_rules.c |  56 +++++
 scripts/gendwarfksyms/gendwarfksyms.c       |  11 +-
 scripts/gendwarfksyms/gendwarfksyms.h       |  57 ++++++
 scripts/gendwarfksyms/kabi.c                | 214 ++++++++++++++++++++
 7 files changed, 415 insertions(+), 4 deletions(-)
 create mode 100644 scripts/gendwarfksyms/examples/kabi.h
 create mode 100644 scripts/gendwarfksyms/examples/kabi_rules.c
 create mode 100644 scripts/gendwarfksyms/kabi.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index 6540282dc746..27258c31e839 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -5,6 +5,7 @@ gendwarfksyms-objs += gendwarfksyms.o
 gendwarfksyms-objs += cache.o
 gendwarfksyms-objs += die.o
 gendwarfksyms-objs += dwarf.o
+gendwarfksyms-objs += kabi.o
 gendwarfksyms-objs += symbols.o
 gendwarfksyms-objs += types.o
 
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index a47a3a0f7a69..b15f1a5db452 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -80,11 +80,12 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
 	return !!state->sym;
 }
 
-static bool is_declaration(Dwarf_Die *die)
+static bool is_declaration(struct die *cache, Dwarf_Die *die)
 {
 	bool value;
 
-	return get_flag_attr(die, DW_AT_declaration, &value) && value;
+	return (get_flag_attr(die, DW_AT_declaration, &value) && value) ||
+	       kabi_is_struct_declonly(cache->fqn);
 }
 
 /*
@@ -472,10 +473,11 @@ static void __process_structure_type(struct state *state, struct die *cache,
 	process(cache, " {");
 	process_linebreak(cache, 1);
 
-	is_decl = is_declaration(die);
+	is_decl = is_declaration(cache, die);
 
 	if (!is_decl && state->expand.expand) {
 		cache_mark_expanded(&state->expansion_cache, die->addr);
+		state->expand.current_fqn = cache->fqn;
 		check(process_die_container(state, cache, die, process_func,
 					    match_func));
 	}
@@ -508,6 +510,15 @@ static void process_enumerator_type(struct state *state, struct die *cache,
 {
 	Dwarf_Word value;
 
+	if (stable) {
+		/* Get the fqn before we process anything */
+		update_fqn(cache, die);
+
+		if (kabi_is_enumerator_ignored(state->expand.current_fqn,
+					       cache->fqn))
+			return;
+	}
+
 	process_list_comma(state, cache);
 	process(cache, "enumerator");
 	process_fqn(cache, die);
@@ -580,6 +591,7 @@ static void state_init(struct state *state)
 	state->expand.expand = true;
 	state->expand.ptr_depth = 0;
 	state->expand.ptr_expansion_depth = 0;
+	state->expand.current_fqn = NULL;
 	hash_init(state->expansion_cache.cache);
 }
 
@@ -589,6 +601,7 @@ static void expansion_state_restore(struct expansion_state *state,
 	state->expand = saved->expand;
 	state->ptr_depth = saved->ptr_depth;
 	state->ptr_expansion_depth = saved->ptr_expansion_depth;
+	state->current_fqn = saved->current_fqn;
 }
 
 static void expansion_state_save(struct expansion_state *state,
diff --git a/scripts/gendwarfksyms/examples/kabi.h b/scripts/gendwarfksyms/examples/kabi.h
new file mode 100644
index 000000000000..c53e8d4a7d2e
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/kabi.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Google LLC
+ *
+ * Example macros for maintaining kABI stability.
+ *
+ * This file is based on android_kabi.h, which has the following notice:
+ *
+ * Heavily influenced by rh_kabi.h which came from the RHEL/CENTOS kernel
+ * and was:
+ *	Copyright (c) 2014 Don Zickus
+ *	Copyright (c) 2015-2018 Jiri Benc
+ *	Copyright (c) 2015 Sabrina Dubroca, Hannes Frederic Sowa
+ *	Copyright (c) 2016-2018 Prarit Bhargava
+ *	Copyright (c) 2017 Paolo Abeni, Larry Woodman
+ */
+
+#ifndef __KABI_H__
+#define __KABI_H__
+
+/* Kernel macros for userspace testing. */
+#ifndef __aligned
+#define __aligned(x) __attribute__((__aligned__(x)))
+#endif
+#ifndef __used
+#define __used __attribute__((__used__))
+#endif
+#ifndef __section
+#define __section(section) __attribute__((__section__(section)))
+#endif
+#ifndef __PASTE
+#define ___PASTE(a, b) a##b
+#define __PASTE(a, b) ___PASTE(a, b)
+#endif
+#ifndef __stringify
+#define __stringify_1(x...) #x
+#define __stringify(x...) __stringify_1(x)
+#endif
+
+#define __KABI_RULE(hint, target, value)                             \
+	static const char __PASTE(__gendwarfksyms_rule_,             \
+				  __COUNTER__)[] __used __aligned(1) \
+		__section(".discard.gendwarfksyms.kabi_rules") =     \
+			"1\0" #hint "\0" #target "\0" #value
+
+/*
+ * KABI_USE_ARRAY(fqn)
+ *   Treat the struct fqn as a declaration, i.e. even if a definition
+ *   is available, don't expand the contents.
+ */
+#define KABI_STRUCT_DECLONLY(fqn) __KABI_RULE(struct_declonly, fqn, ;)
+
+/*
+ * KABI_ENUMERATOR_IGNORE(fqn, field)
+ *   When expanding enum fqn, skip the provided field. This makes it
+ *   possible to hide added enum fields from versioning.
+ */
+#define KABI_ENUMERATOR_IGNORE(fqn, field) \
+	__KABI_RULE(enumerator_ignore, fqn, field)
+
+#endif /* __KABI_H__ */
diff --git a/scripts/gendwarfksyms/examples/kabi_rules.c b/scripts/gendwarfksyms/examples/kabi_rules.c
new file mode 100644
index 000000000000..446818e67d80
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/kabi_rules.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ *
+ * Examples for kABI rules with --stable.
+ */
+
+/*
+ * The comments below each example contain the expected gendwarfksyms
+ * output which can be verified using LLVM's FileCheck tool:
+ *
+ * https://llvm.org/docs/CommandGuide/FileCheck.html
+ *
+ * RUN: gcc -g -c examples/kabi_rules.c -o examples/kabi_rules.o
+ *
+ * Verify --stable output:
+ *
+ * RUN: echo -e "ex0\nex1" | \
+ * RUN:   ./gendwarfksyms --stable --dump-dies \
+ * RUN:   	examples/kabi_rules.o 2>&1 >/dev/null | \
+ * RUN:   FileCheck examples/kabi_rules.c --check-prefix=STABLE
+ */
+
+#include "kabi.h"
+
+struct s {
+	int a;
+};
+
+KABI_STRUCT_DECLONLY(s);
+
+struct s e0;
+
+/*
+ * STABLE:      variable structure_type s {
+ * STABLE-NEXT: }
+ */
+
+enum e {
+	A,
+	B,
+	C,
+	D,
+};
+
+KABI_ENUMERATOR_IGNORE(e, B);
+KABI_ENUMERATOR_IGNORE(e, C);
+
+enum e e1;
+
+/*
+ * STABLE:      variable enumeration_type e {
+ * STABLE-NEXT:   enumerator A = 0 ,
+ * STABLE-NEXT:   enumerator D = 3
+ * STABLE-NEXT: } byte_size(4)
+ */
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index e90d909d259b..21abf1c98366 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -25,6 +25,8 @@ int dump_die_map;
 int dump_types;
 /* Print out expanded type strings used for symbol versions */
 int dump_versions;
+/* Support kABI stability features */
+int stable;
 /* Write a symtypes file */
 int symtypes;
 static const char *symtypes_file;
@@ -38,6 +40,7 @@ static void usage(void)
 	      "      --dump-die-map   Print debugging information about die_map changes\n"
 	      "      --dump-types     Dump type strings\n"
 	      "      --dump-versions  Dump expanded type strings used for symbol versions\n"
+	      "  -s, --stable         Support kABI stability features\n"
 	      "  -T, --symtypes file  Write a symtypes file\n"
 	      "  -h, --help           Print this message\n"
 	      "\n",
@@ -97,17 +100,21 @@ int main(int argc, char **argv)
 				 { "dump-die-map", 0, &dump_die_map, 1 },
 				 { "dump-types", 0, &dump_types, 1 },
 				 { "dump-versions", 0, &dump_versions, 1 },
+				 { "stable", 0, NULL, 's' },
 				 { "symtypes", 1, NULL, 'T' },
 				 { "help", 0, NULL, 'h' },
 				 { 0, 0, NULL, 0 } };
 
-	while ((opt = getopt_long(argc, argv, "dT:h", opts, NULL)) != EOF) {
+	while ((opt = getopt_long(argc, argv, "dsT:h", opts, NULL)) != EOF) {
 		switch (opt) {
 		case 0:
 			break;
 		case 'd':
 			debug = 1;
 			break;
+		case 's':
+			stable = 1;
+			break;
 		case 'T':
 			symtypes = 1;
 			symtypes_file = optarg;
@@ -151,6 +158,7 @@ int main(int argc, char **argv)
 			      strerror(errno));
 
 		symbol_read_symtab(fd);
+		kabi_read_rules(fd);
 
 		dwfl = dwfl_begin(&callbacks);
 		if (!dwfl)
@@ -167,6 +175,7 @@ int main(int argc, char **argv)
 			error("dwfl_getmodules failed for '%s'", argv[n]);
 
 		dwfl_end(dwfl);
+		kabi_free();
 	}
 
 	if (symfile)
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 814f53ef799e..f32ad4389b58 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -27,6 +27,7 @@ extern int dump_dies;
 extern int dump_die_map;
 extern int dump_types;
 extern int dump_versions;
+extern int stable;
 extern int symtypes;
 
 /*
@@ -225,6 +226,7 @@ struct expansion_state {
 	bool expand;
 	unsigned int ptr_depth;
 	unsigned int ptr_expansion_depth;
+	const char *current_fqn;
 };
 
 struct state {
@@ -256,4 +258,59 @@ void process_cu(Dwarf_Die *cudie);
 
 void generate_symtypes_and_versions(FILE *file);
 
+/*
+ * kabi.c
+ */
+
+#define KABI_RULE_SECTION ".discard.gendwarfksyms.kabi_rules"
+#define KABI_RULE_VERSION "1"
+
+/*
+ * The rule section consists of four null-terminated strings per
+ * entry:
+ *
+ *   1. version
+ *      Entry format version. Must match KABI_RULE_VERSION.
+ *
+ *   2. type
+ *      Type of the kABI rule. Must be one of the tags defined below.
+ *
+ *   3. target
+ *      Rule-dependent target, typically the fully qualified name of
+ *      the target DIE.
+ *
+ *   4. value
+ *      Rule-dependent value.
+ */
+#define KABI_RULE_MIN_ENTRY_SIZE                                       \
+	(/* version\0 */ 2 + /* type\0 */ 2 + /* target\0" */ 2 + \
+	 /* value\0 */ 2)
+#define KABI_RULE_EMPTY_VALUE ";"
+
+/*
+ * Rule: struct_declonly
+ * - For the struct in the target field, treat it as a declaration
+ *   only even if a definition is available.
+ */
+#define KABI_RULE_TAG_STRUCT_DECLONLY "struct_declonly"
+
+/*
+ * Rule: enumerator_ignore
+ * - For the enum in the target field, ignore the named enumerator
+ *   in the value field.
+ */
+#define KABI_RULE_TAG_ENUMERATOR_IGNORE "enumerator_ignore"
+
+enum kabi_rule_type {
+	KABI_RULE_TYPE_UNKNOWN,
+	KABI_RULE_TYPE_STRUCT_DECLONLY,
+	KABI_RULE_TYPE_ENUMERATOR_IGNORE,
+};
+
+bool kabi_is_enumerator_ignored(const char *fqn, const char *field);
+bool kabi_is_struct_declonly(const char *fqn);
+
+void kabi_read_rules(int fd);
+void kabi_free(void);
+
 #endif /* __GENDWARFKSYMS_H */
diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
new file mode 100644
index 000000000000..a5414382782c
--- /dev/null
+++ b/scripts/gendwarfksyms/kabi.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+#define RULE_HASH_BITS 10
+
+struct rule {
+	enum kabi_rule_type type;
+	const char *target;
+	const char *value;
+	struct hlist_node hash;
+};
+
+/* { type, target, value } -> struct rule */
+static HASHTABLE_DEFINE(rules, 1 << RULE_HASH_BITS);
+
+static inline unsigned int rule_hash(enum kabi_rule_type type,
+				     const char *target, const char *value)
+{
+	return hash_32(type) ^ hash_str(target) ^ hash_str(value);
+}
+
+static inline unsigned int __rule_hash(const struct rule *rule)
+{
+	return rule_hash(rule->type, rule->target, rule->value);
+}
+
+static inline const char *get_rule_field(const char **pos, ssize_t *left)
+{
+	const char *start = *pos;
+	size_t len;
+
+	if (*left <= 1)
+		error("unexpected end of kABI rules");
+
+	len = strnlen(start, *left);
+	if (!len)
+		error("empty kABI rule field");
+
+	len += 1;
+	*pos += len;
+	*left -= len;
+
+	return start;
+}
+
+void kabi_read_rules(int fd)
+{
+	GElf_Shdr shdr_mem;
+	GElf_Shdr *shdr;
+	Elf_Data *rule_data = NULL;
+	Elf_Scn *scn;
+	Elf *elf;
+	size_t shstrndx;
+	const char *rule_str;
+	ssize_t left;
+	int i;
+
+	const struct {
+		enum kabi_rule_type type;
+		const char *tag;
+	} rule_types[] = {
+		{
+			.type = KABI_RULE_TYPE_STRUCT_DECLONLY,
+			.tag = KABI_RULE_TAG_STRUCT_DECLONLY,
+		},
+		{
+			.type = KABI_RULE_TYPE_ENUMERATOR_IGNORE,
+			.tag = KABI_RULE_TAG_ENUMERATOR_IGNORE,
+		},
+	};
+
+	if (!stable)
+		return;
+
+	if (elf_version(EV_CURRENT) != EV_CURRENT)
+		error("elf_version failed: %s", elf_errmsg(-1));
+
+	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
+	if (!elf)
+		error("elf_begin failed: %s", elf_errmsg(-1));
+
+	if (elf_getshdrstrndx(elf, &shstrndx) < 0)
+		error("elf_getshdrstrndx failed: %s", elf_errmsg(-1));
+
+	scn = elf_nextscn(elf, NULL);
+
+	while (scn) {
+		shdr = gelf_getshdr(scn, &shdr_mem);
+		if (shdr) {
+			const char *sname =
+				elf_strptr(elf, shstrndx, shdr->sh_name);
+
+			if (sname && !strcmp(sname, KABI_RULE_SECTION)) {
+				rule_data = elf_getdata(scn, NULL);
+				break;
+			}
+		}
+
+		scn = elf_nextscn(elf, scn);
+	}
+
+	if (!rule_data) {
+		debug("kABI rules not found");
+		return;
+	}
+
+	rule_str = rule_data->d_buf;
+	left = shdr->sh_size;
+
+	if (left < KABI_RULE_MIN_ENTRY_SIZE)
+		error("kABI rule section too small: %zd bytes", left);
+
+	if (rule_str[left - 1] != '\0')
+		error("kABI rules are not null-terminated");
+
+	while (left > KABI_RULE_MIN_ENTRY_SIZE) {
+		enum kabi_rule_type type = KABI_RULE_TYPE_UNKNOWN;
+		const char *field;
+		struct rule *rule;
+
+		/* version */
+		field = get_rule_field(&rule_str, &left);
+
+		if (strcmp(field, KABI_RULE_VERSION))
+			error("unsupported kABI rule version: '%s'", field);
+
+		/* type */
+		field = get_rule_field(&rule_str, &left);
+
+		for (i = 0; i < ARRAY_SIZE(rule_types); i++) {
+			if (!strcmp(field, rule_types[i].tag)) {
+				type = rule_types[i].type;
+				break;
+			}
+		}
+
+		if (type == KABI_RULE_TYPE_UNKNOWN)
+			error("unsupported kABI rule type: '%s'", field);
+
+		rule = xmalloc(sizeof(struct rule));
+
+		rule->type = type;
+		rule->target = xstrdup(get_rule_field(&rule_str, &left));
+		rule->value = xstrdup(get_rule_field(&rule_str, &left));
+
+		hash_add(rules, &rule->hash, __rule_hash(rule));
+
+		debug("kABI rule: type: '%s', target: '%s', value: '%s'", field,
+		      rule->target, rule->value);
+	}
+
+	if (left > 0)
+		warn("unexpected data at the end of the kABI rules section");
+
+	check(elf_end(elf));
+}
+
+bool kabi_is_struct_declonly(const char *fqn)
+{
+	struct rule *rule;
+
+	if (!stable)
+		return false;
+	if (!fqn || !*fqn)
+		return false;
+
+	hash_for_each_possible(rules, rule, hash,
+			       rule_hash(KABI_RULE_TYPE_STRUCT_DECLONLY, fqn,
+					 KABI_RULE_EMPTY_VALUE)) {
+		if (rule->type == KABI_RULE_TYPE_STRUCT_DECLONLY &&
+		    !strcmp(fqn, rule->target))
+			return true;
+	}
+
+	return false;
+}
+
+bool kabi_is_enumerator_ignored(const char *fqn, const char *field)
+{
+	struct rule *rule;
+
+	if (!stable)
+		return false;
+	if (!fqn || !*fqn || !field || !*field)
+		return false;
+
+	hash_for_each_possible(rules, rule, hash,
+			       rule_hash(KABI_RULE_TYPE_ENUMERATOR_IGNORE, fqn,
+					 field)) {
+		if (rule->type == KABI_RULE_TYPE_ENUMERATOR_IGNORE &&
+		    !strcmp(fqn, rule->target) && !strcmp(field, rule->value))
+			return true;
+	}
+
+	return false;
+}
+
+void kabi_free(void)
+{
+	struct hlist_node *tmp;
+	struct rule *rule;
+
+	hash_for_each_safe(rules, rule, tmp, hash) {
+		free((void *)rule->target);
+		free((void *)rule->value);
+		free(rule);
+	}
+
+	hash_init(rules);
+}
-- 
2.47.0.rc0.187.ge670bccf7e-goog


