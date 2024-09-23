Return-Path: <linux-kbuild+bounces-3671-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A2E97F058
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 20:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79F86B21C1B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 18:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3912E1A0BDA;
	Mon, 23 Sep 2024 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="muGoVXUE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124F71A08C5
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115554; cv=none; b=Rs6RFYD1yvGSZXUZGuypGtt1CqyTadHkfVqaBEtxLWW1kYH9PAU4wwl2rbgENqmqz5B6Dqc3UPjxbGT4sC5ABXvhB9i9/auOWfyqFDwGBi7AhBVdFLE/Uop5x8MEc2t8hNyfLehxgHRqxEoRGojCzCAr14JCNJQP5LB32MQ083o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115554; c=relaxed/simple;
	bh=EIGT9VIHeytq4Cj/C6088281fr/C0yizCn1b3ot2OpU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gZltxI0u/IX3W4xaTMbj16yfTPngdZOjlBHhKpsZ8ZgmFV/+N9rCyIUOlJ022OTko1xhHZS6ekr0Mg7UJyySh88SoDR4C3yiGBApqz/mBJli5Uevewk0B6/2NyQfbtOE2uUu/CCW7PGhptU4wB8H5dWmvMjG8vufXOWjLDLLl3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=muGoVXUE; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2077537f6bfso39691365ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115551; x=1727720351; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r25b93t30NRQDT3mdE01vOqrF861R5sVgc3eWnwIsC4=;
        b=muGoVXUESNIPguydiDOKb2aiZGAlSOGEIIWneIRIN3fj1+4Gzx9jCKv/boReVHXt+x
         qFDdOyNiVetg3msc0XJjOKt9Rz7E9TUY5GphQbNv4LzzelfJavq1K0S3Tj2LmHeuiIGx
         CUXCAlxQBLl9SbAQVcCKfyJru/3zWXgqRNIMIjyHb/HVw1S7o6sKqXjumDunQJYwZtUQ
         y430kSqFkPvL2eM64Bpf4dnInwZDypWxwMSaIk5jr7FQge0BZ0x5bvZEoR2bTDIhwNj2
         9COtauguEIQ5pIwZBpwaQv+brqqQtEWJjE8elpYGinPoWRihQ1UTFSJi6UTBlzfCo6p0
         3ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115551; x=1727720351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r25b93t30NRQDT3mdE01vOqrF861R5sVgc3eWnwIsC4=;
        b=pG1gSh79rEt5IZw/M6alNMvS7pp6bzFiBklOQnC/EMdKDcuutBh2NImY0XzhZHA/GI
         YwvcJGbSvN0jXhqgZTHVtj2FmO2L1CnKGMZg14NXVuIXCEZyycnGyHNaarscbp16zpJU
         Q5uZtuKKIaGBMPnycnK0o5e6Y+VxJS4DVHs0/TdviBUOKL7igQpJNLKDaXuEfb9zr7r4
         7zFJ8AxTteEzUD5qHKNkmW5BYlEXLWQ1rDMaaFCA47gOFIh6H9PfhJG0QAzdWhqNI2v4
         Lu/SRHzeo7rhBOdb5VA0D5ZbocjBVq35Ro7pFZArzwbsKuI2FtcK+erDXfJOKnE+VcD+
         i2xg==
X-Forwarded-Encrypted: i=1; AJvYcCWOxFn7OcHAC5iJEgAwo53jHebmcwg+1ANqLro71UFLZoCQXRxos/mT+Wj5O4ahkjoN0Wlm4+hV2RYWg8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcJTWFC83/cktD+947UjdK8wk6tUlQDoTtCwNCqTRazTD66Io
	Y6aXHE1k7DwGTgk/LqF8CvCx56QVNiWJcT2OPy6iRdecwXBxNWRrOs/5alix9CmUAqeBz7cy3oa
	jUVkrYeyxl7OF5fWEYydnwoMOMw==
X-Google-Smtp-Source: AGHT+IHMRrMHpwWxjfNNNbMOMVIr8jGhe2gygLHm8/okL3yLNqEk754NTh7YUpKveVk+VHizpRL/6+H/9e9Ktv9vHAQ=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:6901:b0:1fb:f1f:19ea with
 SMTP id d9443c01a7336-20aed0749bfmr5075ad.1.1727115551084; Mon, 23 Sep 2024
 11:19:11 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:49 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=14721; i=samitolvanen@google.com;
 h=from:subject; bh=EIGT9VIHeytq4Cj/C6088281fr/C0yizCn1b3ot2OpU=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN7KndDzqERA62MLYO21BtaGpzeILP5wWqH06cm3WG
 jsRNbntHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAiCWGMDDNTjjWu3Jjp9eNy
 5+5bknz8C4z2/ww/VeOyY9/rmXrP/GQZ/ul0LLnddXTTuVt3UtQFP75UK31wpkzNgccx8cMRpmt 2/9gA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-25-samitolvanen@google.com>
Subject: [PATCH v3 03/20] tools: Add gendwarfksyms
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a basic DWARF parser, which uses libdw to traverse the debugging
information in an object file and looks for functions and variables.
In follow-up patches, this will be expanded to produce symbol versions
for CONFIG_MODVERSIONS from DWARF.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/module/Kconfig                 |   8 ++
 scripts/Makefile                      |   1 +
 scripts/gendwarfksyms/.gitignore      |   2 +
 scripts/gendwarfksyms/Makefile        |   8 ++
 scripts/gendwarfksyms/dwarf.c         | 166 ++++++++++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.c | 132 ++++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h |  97 +++++++++++++++
 scripts/gendwarfksyms/symbols.c       |  82 +++++++++++++
 8 files changed, 496 insertions(+)
 create mode 100644 scripts/gendwarfksyms/.gitignore
 create mode 100644 scripts/gendwarfksyms/Makefile
 create mode 100644 scripts/gendwarfksyms/dwarf.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
 create mode 100644 scripts/gendwarfksyms/symbols.c

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index ccdbd1bc12aa..c3a0172a909f 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -168,6 +168,14 @@ config MODVERSIONS
 	  make them incompatible with the kernel you are running.  If
 	  unsure, say N.
 
+config GENDWARFKSYMS
+	bool
+	depends on DEBUG_INFO
+	# Requires full debugging information, split DWARF not supported.
+	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
+	# Requires ELF object files.
+	depends on !LTO
+
 config ASM_MODVERSIONS
 	bool
 	default HAVE_ASM_MODVERSIONS && MODVERSIONS
diff --git a/scripts/Makefile b/scripts/Makefile
index 6bcda4b9d054..d7fec46d38c0 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -54,6 +54,7 @@ targets += module.lds
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
+subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_SECURITY_IPE) += ipe
 
diff --git a/scripts/gendwarfksyms/.gitignore b/scripts/gendwarfksyms/.gitignore
new file mode 100644
index 000000000000..0927f8d3cd96
--- /dev/null
+++ b/scripts/gendwarfksyms/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+/gendwarfksyms
diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
new file mode 100644
index 000000000000..9f8fec4fd39b
--- /dev/null
+++ b/scripts/gendwarfksyms/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+hostprogs-always-y += gendwarfksyms
+
+gendwarfksyms-objs += gendwarfksyms.o
+gendwarfksyms-objs += dwarf.o
+gendwarfksyms-objs += symbols.o
+
+HOSTLDLIBS_gendwarfksyms := -ldw -lelf
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
new file mode 100644
index 000000000000..81df3e2ad3ae
--- /dev/null
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
+{
+	Dwarf_Attribute da;
+
+	/* dwarf_formref_die returns a pointer instead of an error value. */
+	return dwarf_attr(die, id, &da) && dwarf_formref_die(&da, value);
+}
+
+#define DEFINE_GET_STRING_ATTR(attr)                         \
+	static const char *get_##attr##_attr(Dwarf_Die *die) \
+	{                                                    \
+		Dwarf_Attribute da;                          \
+		if (dwarf_attr(die, DW_AT_##attr, &da))      \
+			return dwarf_formstring(&da);        \
+		return NULL;                                 \
+	}
+
+DEFINE_GET_STRING_ATTR(name)
+DEFINE_GET_STRING_ATTR(linkage_name)
+
+static const char *get_symbol_name(Dwarf_Die *die)
+{
+	const char *name;
+
+	/* rustc uses DW_AT_linkage_name for exported symbols */
+	name = get_linkage_name_attr(die);
+	if (!name)
+		name = get_name_attr(die);
+
+	return name;
+}
+
+static bool match_export_symbol(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die *source = die;
+	Dwarf_Die origin;
+
+	/* If the DIE has an abstract origin, use it for type information. */
+	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
+		source = &origin;
+
+	state->sym = symbol_get(get_symbol_name(die));
+
+	/* Look up using the origin name if there are no matches. */
+	if (!state->sym && source != die)
+		state->sym = symbol_get(get_symbol_name(source));
+
+	state->die = *source;
+	return !!state->sym;
+}
+
+/*
+ * Type string processing
+ */
+static void process(const char *s)
+{
+	s = s ?: "<null>";
+
+	if (dump_dies)
+		fputs(s, stderr);
+}
+
+bool match_all(Dwarf_Die *die)
+{
+	return true;
+}
+
+int process_die_container(struct state *state, Dwarf_Die *die,
+			  die_callback_t func, die_match_callback_t match)
+{
+	Dwarf_Die current;
+	int res;
+
+	res = checkp(dwarf_child(die, &current));
+	while (!res) {
+		if (match(&current)) {
+			/* <0 = error, 0 = continue, >0 = stop */
+			res = checkp(func(state, &current));
+			if (res)
+				return res;
+		}
+
+		res = checkp(dwarf_siblingof(&current, &current));
+	}
+
+	return 0;
+}
+
+/*
+ * Exported symbol processing
+ */
+static void process_symbol(struct state *state, Dwarf_Die *die,
+			   die_callback_t process_func)
+{
+	debug("%s", state->sym->name);
+	check(process_func(state, die));
+	if (dump_dies)
+		fputs("\n", stderr);
+}
+
+static int __process_subprogram(struct state *state, Dwarf_Die *die)
+{
+	process("subprogram");
+	return 0;
+}
+
+static void process_subprogram(struct state *state, Dwarf_Die *die)
+{
+	process_symbol(state, die, __process_subprogram);
+}
+
+static int __process_variable(struct state *state, Dwarf_Die *die)
+{
+	process("variable ");
+	return 0;
+}
+
+static void process_variable(struct state *state, Dwarf_Die *die)
+{
+	process_symbol(state, die, __process_variable);
+}
+
+static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
+{
+	int tag = dwarf_tag(die);
+
+	switch (tag) {
+	/* Possible containers of exported symbols */
+	case DW_TAG_namespace:
+	case DW_TAG_class_type:
+	case DW_TAG_structure_type:
+		return check(process_die_container(
+			NULL, die, process_exported_symbols, match_all));
+
+	/* Possible exported symbols */
+	case DW_TAG_subprogram:
+	case DW_TAG_variable: {
+		struct state state;
+
+		if (!match_export_symbol(&state, die))
+			return 0;
+
+		if (tag == DW_TAG_subprogram)
+			process_subprogram(&state, &state.die);
+		else
+			process_variable(&state, &state.die);
+
+		return 0;
+	}
+	default:
+		return 0;
+	}
+}
+
+void process_cu(Dwarf_Die *cudie)
+{
+	check(process_die_container(NULL, cudie, process_exported_symbols,
+				    match_all));
+}
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
new file mode 100644
index 000000000000..096a334fa5b3
--- /dev/null
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <fcntl.h>
+#include <getopt.h>
+#include <errno.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include "gendwarfksyms.h"
+
+/*
+ * Options
+ */
+
+/* Print debugging information to stderr */
+int debug;
+/* Dump DIE contents */
+int dump_dies;
+
+static void usage(void)
+{
+	fputs("Usage: gendwarfksyms [options] elf-object-file ... < symbol-list\n\n"
+	      "Options:\n"
+	      "  -d, --debug          Print debugging information\n"
+	      "      --dump-dies      Dump DWARF DIE contents\n"
+	      "  -h, --help           Print this message\n"
+	      "\n",
+	      stderr);
+}
+
+static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
+			  Dwarf_Addr base, void *arg)
+{
+	Dwarf_Addr dwbias;
+	Dwarf_Die cudie;
+	Dwarf_CU *cu = NULL;
+	Dwarf *dbg;
+	int res;
+
+	debug("%s", name);
+	dbg = dwfl_module_getdwarf(mod, &dwbias);
+
+	do {
+		res = dwarf_get_units(dbg, cu, &cu, NULL, NULL, &cudie, NULL);
+		if (res < 0)
+			error("dwarf_get_units failed: no debugging information?");
+		if (res == 1)
+			break; /* No more units */
+
+		process_cu(&cudie);
+	} while (cu);
+
+	return DWARF_CB_OK;
+}
+
+static const Dwfl_Callbacks callbacks = {
+	.section_address = dwfl_offline_section_address,
+	.find_debuginfo = dwfl_standard_find_debuginfo,
+};
+
+int main(int argc, char **argv)
+{
+	unsigned int n;
+	int opt;
+
+	struct option opts[] = { { "debug", 0, NULL, 'd' },
+				 { "dump-dies", 0, &dump_dies, 1 },
+				 { "help", 0, NULL, 'h' },
+				 { 0, 0, NULL, 0 } };
+
+	while ((opt = getopt_long(argc, argv, "dh", opts, NULL)) != EOF) {
+		switch (opt) {
+		case 0:
+			break;
+		case 'd':
+			debug = 1;
+			break;
+		case 'h':
+			usage();
+			return 0;
+		default:
+			usage();
+			return 1;
+		}
+	}
+
+	if (optind >= argc) {
+		usage();
+		error("no input files?");
+	}
+
+	symbol_read_exports(stdin);
+
+	for (n = optind; n < argc; n++) {
+		Dwfl *dwfl;
+		int fd;
+
+		fd = open(argv[n], O_RDONLY);
+		if (fd == -1) {
+			error("open failed for '%s': %s", argv[n],
+			      strerror(errno));
+			return -1;
+		}
+
+		dwfl = dwfl_begin(&callbacks);
+		if (!dwfl) {
+			error("dwfl_begin failed for '%s': %s", argv[n],
+			      dwarf_errmsg(-1));
+			return -1;
+		}
+
+		if (!dwfl_report_offline(dwfl, argv[n], argv[n], fd)) {
+			error("dwfl_report_offline failed for '%s': %s",
+			      argv[n], dwarf_errmsg(-1));
+			return -1;
+		}
+
+		dwfl_report_end(dwfl, NULL, NULL);
+
+		if (dwfl_getmodules(dwfl, &process_module, NULL, 0)) {
+			error("dwfl_getmodules failed for '%s'", argv[n]);
+			return -1;
+		}
+
+		dwfl_end(dwfl);
+	}
+
+	return 0;
+}
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
new file mode 100644
index 000000000000..1a10d18f178e
--- /dev/null
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <dwarf.h>
+#include <elfutils/libdw.h>
+#include <elfutils/libdwfl.h>
+#include <inttypes.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+
+#include <hash.h>
+#include <hashtable.h>
+#include <list.h>
+#include <xalloc.h>
+
+#ifndef __GENDWARFKSYMS_H
+#define __GENDWARFKSYMS_H
+
+/*
+ * Options -- in gendwarfksyms.c
+ */
+extern int debug;
+extern int dump_dies;
+
+/*
+ * Output helpers
+ */
+#define __PREFIX "gendwarfksyms: "
+#define __println(prefix, format, ...)                                \
+	fprintf(stderr, prefix __PREFIX "%s: " format "\n", __func__, \
+		##__VA_ARGS__)
+
+#define debug(format, ...)                                    \
+	do {                                                  \
+		if (debug)                                    \
+			__println("", format, ##__VA_ARGS__); \
+	} while (0)
+
+#define warn(format, ...) __println("warning: ", format, ##__VA_ARGS__)
+#define error(format, ...)                                   \
+	do {                                                 \
+		__println("error: ", format, ##__VA_ARGS__); \
+		exit(1);                                     \
+	} while (0)
+
+/*
+ * Error handling helpers
+ */
+#define __check(expr, test)                                     \
+	({                                                      \
+		int __res = expr;                               \
+		if (test)                                       \
+			error("`%s` failed: %d", #expr, __res); \
+		__res;                                          \
+	})
+
+/* Error == non-zero values */
+#define check(expr) __check(expr, __res)
+/* Error == negative values */
+#define checkp(expr) __check(expr, __res < 0)
+
+/*
+ * symbols.c
+ */
+
+struct symbol {
+	const char *name;
+	struct hlist_node name_hash;
+};
+
+typedef void (*symbol_callback_t)(struct symbol *, void *arg);
+
+void symbol_read_exports(FILE *file);
+struct symbol *symbol_get(const char *name);
+
+/*
+ * dwarf.c
+ */
+
+struct state {
+	struct symbol *sym;
+	Dwarf_Die die;
+};
+
+typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
+typedef bool (*die_match_callback_t)(Dwarf_Die *die);
+bool match_all(Dwarf_Die *die);
+
+int process_die_container(struct state *state, Dwarf_Die *die,
+			  die_callback_t func, die_match_callback_t match);
+
+void process_cu(Dwarf_Die *cudie);
+
+#endif /* __GENDWARFKSYMS_H */
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
new file mode 100644
index 000000000000..1809be93d18c
--- /dev/null
+++ b/scripts/gendwarfksyms/symbols.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+#define SYMBOL_HASH_BITS 15
+static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
+
+static int for_each(const char *name, symbol_callback_t func, void *data)
+{
+	struct hlist_node *tmp;
+	struct symbol *match;
+
+	if (!name || !*name)
+		return 0;
+
+	hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
+				    hash_str(name)) {
+		if (strcmp(match->name, name))
+			continue;
+
+		if (func)
+			func(match, data);
+
+		return 1;
+	}
+
+	return 0;
+}
+
+static bool is_exported(const char *name)
+{
+	return checkp(for_each(name, NULL, NULL)) > 0;
+}
+
+void symbol_read_exports(FILE *file)
+{
+	struct symbol *sym;
+	char *line = NULL;
+	char *name = NULL;
+	size_t size = 0;
+	int nsym = 0;
+
+	while (getline(&line, &size, file) > 0) {
+		if (sscanf(line, "%ms\n", &name) != 1)
+			error("malformed input line: %s", line);
+
+		if (is_exported(name)) {
+			/* Ignore duplicates */
+			free(name);
+			continue;
+		}
+
+		sym = xcalloc(1, sizeof(struct symbol));
+		sym->name = name;
+
+		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
+		++nsym;
+
+		debug("%s", sym->name);
+	}
+
+	free(line);
+	debug("%d exported symbols", nsym);
+}
+
+static void get_symbol(struct symbol *sym, void *arg)
+{
+	struct symbol **res = arg;
+
+	*res = sym;
+}
+
+struct symbol *symbol_get(const char *name)
+{
+	struct symbol *sym = NULL;
+
+	for_each(name, get_symbol, &sym);
+	return sym;
+}
-- 
2.46.0.792.g87dc391469-goog


