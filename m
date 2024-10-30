Return-Path: <linux-kbuild+bounces-4409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ACE9B6A4B
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A1521C22155
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F6B21FDA9;
	Wed, 30 Oct 2024 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S5asw+Tp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81BD21BB1C
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307691; cv=none; b=UxgvOV7t/c8g9myyLxvonoSS++17Dun0vlc3ign7SDdyDe6Arl+06pj0Re+J06PTmMv0LHOpOGuSHcQ7P19ujSrQ/lORn8TMA1ILQB3SOhC01X+A0Xk5AaZtTqGqDKuPRxSJtF6iBnP4/aUvTPsIX69Wdr591MQvrCFzdiCTHWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307691; c=relaxed/simple;
	bh=K3lTOjjLz4fxcbPmcGKNPm8KGtSKSiWgZnaLzuklA+E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XByLidPL8+PWlVK4QQ5bQtjMBxYsmVaQKjnmy1HGOPima1IhL71xLhKx/isESjhddH0Sow/eCVojv6POmcVxNG7h6ifs213EzhJTDQrWTZr1t5flLkEUMtgbkxemyIWsTK74nBz0eH2bV/asCRdCaIdJyUe8/Epj4i1HkEsk9Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S5asw+Tp; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3c638cc27so126642297b3.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307686; x=1730912486; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzlXzLlkPFm/b/f95jBKjnEEcdsTM/UNISez+jbL0QA=;
        b=S5asw+TpLIqDE9UkZyWqvdHQvHYXcyCbrwMsc3o1uQmacfJ7Gqo8hveOrkZYaXZiAt
         uc7oOgqB8cm93nYHfPsKiyxdi8x2qoySwJ650xr0F1vNXmRn7LHRGXIL3TrhOgulM9Mh
         lyu2LXUiQpWFx1q1mICvJNy1cz3vSts/LgODbj6Ik3m23g/+hW0z8ZnQbw2S4nHTnLxp
         AOwjMQXC4/C3zPuFkoJjL3FuyflYifgELbL+8ONfZvpEuKNPkO2MkCmJQiwjhhAjHIlU
         s+oAjG2y+CNrMsTRQl9cTIwyQHUDgZyICvwVS7rS5JiWtLFT31Mh0DqmAoPGhA30CVU/
         v9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307686; x=1730912486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzlXzLlkPFm/b/f95jBKjnEEcdsTM/UNISez+jbL0QA=;
        b=BNXFXzJtqUvVF3OkD/ktgiJtRFlGLVEx3f6bIeUyYVE70bP7yt5lIBnYQBBwYVDCrr
         zB0YHlxcGKFugYhFkL7soArOyAx+wYHBhJQCVMc9ID2AVJG3dO2x9MtouXxbxnMSCF6v
         Gf3SEFtA1gq2JW8rikuKdwHs7Bqo7SL+/Cp4NKoyrd/Ku2XACuOv7ZNwY6ZwhLAZtoEV
         PNiceGAlkF/v43dlpH0a3WIYYX5EcG7HAHbClt8RxdcIa/zmyH0MVJRdfH8/TAVJLjkj
         6VMnJ8oWDUdKiXpI8s+AyLNZNfbD4pkij27F2RVaSFfwplWn1aIRfq7TbZgibgUkQHL/
         bZgw==
X-Forwarded-Encrypted: i=1; AJvYcCVa7ALqfmqJNTWgTs0M3S+tgmAe91JyeAC4k+5SD1uY3rFUtUwLavxXORYsPxG8gAXaX2eDHck9VgnhRUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6eSCv7mApD0B0sHR9MIPqhomkNsWDzEQvmXnuiNmv9aIxrtKa
	jRiHbXsoFQwSk6kdR5uggSv37VZ0xXBTA1qvILF/bsCbOfolFEqYFgPeiABcgP5SxVl2uZ34gPh
	GBcojdDVk+vD2fO6tZbrIWLHNTQ==
X-Google-Smtp-Source: AGHT+IH519DGxaUBm9MICH17jZkFIcstjCRdWx89irSieFobS2FVlj47D5vMWIvCrHf/T5hEdIjZrgcrHqlaFCi+j74=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:6a03:b0:6e3:1023:3645 with
 SMTP id 00721157ae682-6e9d8c3651fmr7168957b3.8.1730307685757; Wed, 30 Oct
 2024 10:01:25 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:09 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=14998; i=samitolvanen@google.com;
 h=from:subject; bh=K3lTOjjLz4fxcbPmcGKNPm8KGtSKSiWgZnaLzuklA+E=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKacH3p/xUjcu4Lno8S0ZvnbRQUMHlmMWxe4Mu3a85Z
 1pYWdHYUcrCIMbBICumyNLydfXW3d+dUl99LpKAmcPKBDKEgYtTACbSVsTwP+BhjZ3GghcXWp9o
 5+jf6Jp8NmuJ3O2YA+IyS4uyFxt/cmBkaLloUb1DKEUwvixESPjOa8YNsn8Vt7VtX3bkxY+SWH5 LfgA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-23-samitolvanen@google.com>
Subject: [PATCH v5 02/19] tools: Add gendwarfksyms
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

Add a basic DWARF parser, which uses libdw to traverse the debugging
information in an object file and looks for functions and variables.
In follow-up patches, this will be expanded to produce symbol versions
for CONFIG_MODVERSIONS from DWARF.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/Kconfig                 |   8 ++
 scripts/Makefile                      |   1 +
 scripts/gendwarfksyms/.gitignore      |   2 +
 scripts/gendwarfksyms/Makefile        |   8 ++
 scripts/gendwarfksyms/dwarf.c         | 166 ++++++++++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.c | 126 +++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h |  98 +++++++++++++++
 scripts/gendwarfksyms/symbols.c       |  96 +++++++++++++++
 8 files changed, 505 insertions(+)
 create mode 100644 scripts/gendwarfksyms/.gitignore
 create mode 100644 scripts/gendwarfksyms/Makefile
 create mode 100644 scripts/gendwarfksyms/dwarf.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
 create mode 100644 scripts/gendwarfksyms/symbols.c

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 7c6588148d42..f9e5f82fa88b 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -169,6 +169,14 @@ config MODVERSIONS
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
index 000000000000..f84fa98fcbdb
--- /dev/null
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -0,0 +1,126 @@
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
+		if (fd == -1)
+			error("open failed for '%s': %s", argv[n],
+			      strerror(errno));
+
+		dwfl = dwfl_begin(&callbacks);
+		if (!dwfl)
+			error("dwfl_begin failed for '%s': %s", argv[n],
+			      dwarf_errmsg(-1));
+
+		if (!dwfl_report_offline(dwfl, argv[n], argv[n], fd))
+			error("dwfl_report_offline failed for '%s': %s",
+			      argv[n], dwarf_errmsg(-1));
+
+		dwfl_report_end(dwfl, NULL, NULL);
+
+		if (dwfl_getmodules(dwfl, &process_module, NULL, 0))
+			error("dwfl_getmodules failed for '%s'", argv[n]);
+
+		dwfl_end(dwfl);
+	}
+
+	symbol_free();
+
+	return 0;
+}
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
new file mode 100644
index 000000000000..c5437ee31321
--- /dev/null
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -0,0 +1,98 @@
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
+void symbol_free(void);
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
index 000000000000..2c901670224b
--- /dev/null
+++ b/scripts/gendwarfksyms/symbols.c
@@ -0,0 +1,96 @@
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
+static unsigned int for_each(const char *name, symbol_callback_t func,
+			     void *data)
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
+	return for_each(name, NULL, NULL) > 0;
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
+
+void symbol_free(void)
+{
+	struct hlist_node *tmp;
+	struct symbol *sym;
+
+	hash_for_each_safe(symbol_names, sym, tmp, name_hash) {
+		free((void *)sym->name);
+		free(sym);
+	}
+
+	hash_init(symbol_names);
+}
-- 
2.47.0.163.g1226f6d8fa-goog


