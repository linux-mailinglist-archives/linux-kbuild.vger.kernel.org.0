Return-Path: <linux-kbuild+bounces-5195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7759F9F8682
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A75516B9F3
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A501C2DB0;
	Thu, 19 Dec 2024 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SKLeCniX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1AD1B4F25
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642475; cv=none; b=qHaEcoE6ce4UKU8f08D1u+aVmvBBmisZ2Dl2aD+JdLRJcmtsLJNHMZPLycQBg36+IkT/BJM3xtVi/4Gjo08mcD9MNVcFryRmDFGjvbsL8C4jp9OEQYjmqrVen4e2DVe2f8BuqArNusYlnkzQqP/Kt8K6jINGtR/4UJKZkDR0YSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642475; c=relaxed/simple;
	bh=2R588xAUPDj6AGGdbWW5NwsrdeGB6AGfvMfJGS/jZx4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cT28vJ/ALEET5X+Rg/hx3c5wZa/zUDxUrX49nXO+/GG9pVic2PgHBRuV+Qrl7Ez8Hcqh/ImOhLm2ze3/2BtZJHcU0ha4Cm63vwuvkp/jmKt6BV8LB5p3LgoaUcdyb0SMes7wQ+LG3MqeNk0pUGDv9f5WxcgqdHUcSF913fSc1RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SKLeCniX; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7eb0a32fc5aso760886a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642473; x=1735247273; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZKqBqF0DF83RqL6Z7Kl1Azm4e26cplxVnocDMKcEpM=;
        b=SKLeCniXvb2yQ0Fdz2LmlC1o9CZtLjroh1xslzndC1B6ZO5BHgP/Ho5CgXek76vZ2b
         OD97AadC07aytoxcOXHhl4gACQ4reSXc3x4s9rQ37OMFqLpYEfNCsfgrnhLO9+J7SBMM
         UF/RhKhfdykvnYyLU1iNR2CIzBLnQimQwMsfS9HPCD+axrheRT/kSZy/4EJ/3rJqr3h4
         kRM7Yzu6YdeoDYLyglwFbe/ifz22fE2hAIVWXHy8sdqOR1ZdDqQrN8yJoRBk2+1yrF1o
         ZplfzIFf6nTfLS9YTsj+EUvZnhXmtFdIoOwI9tXjFdQzJeR/zu/IWKBpgIDV9pgrEeeJ
         hlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642473; x=1735247273;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZKqBqF0DF83RqL6Z7Kl1Azm4e26cplxVnocDMKcEpM=;
        b=kHZ5lu30oafwmJP3oq9T+VZrXTDGFdjfN8VvJaa/LDHHYACJInBM4W3PbZKZGZ2Obd
         OVKDOt0QmeVi/RilrNX3f7egnPFnx3X2yjr4wVg05MC/5rmnee96My4DxIUk6CZz7Tl/
         EY2UCPniyTDvVJy0BurGWjWDcHr1D9k/at2P4zJQLqPrJuw0p1G9PJ0yhrSib2GEmkSF
         2ROKnqyeTT3g6naD/+TwCOcEesHe+BxdEfuK9xIHo8R9qJaSBBnlHEV3qEB3KLx3S+4I
         FxHxe7Ztz1yZOtjF/0vyFZ5QRDajrT8X0giAKcMe69hmUkgwQAqzEI1R5qFSM6KaQ8c0
         gTvA==
X-Forwarded-Encrypted: i=1; AJvYcCWG9pChoBG6YwbUQizOrl9hkroIxz/80d6xTqDqTBpks5tAPy4ycrMbO6W92/5Z8Wj81JnV0GNmTHqD/nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQOjMvIYM6PHCJnQ5AlL/fs4NiD8hmT0chrewRJyjRWMYFVyte
	RgZCg7HFhWoc8mERZiEWGVh2BzceLofZ/fTeu5n1pawt/GnmsaBoTTcdNk+ROmTTFZgRwPqOiqr
	LTzHiSPu0xtYzb/pnC9MsBe66ig==
X-Google-Smtp-Source: AGHT+IFJL1RxKDsXqgL3DtW3U3Mg12nOMMsALjKCxJoLk2AfQs+nAGL4RT7NPJBEKhNqLd9TxR4yhgD2XdmpXwA7f04=
X-Received: from pfaw12.prod.google.com ([2002:a05:6a00:ab8c:b0:728:e1a0:2e73])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:32a5:b0:1e1:bf3d:a191 with SMTP id adf61e73a8af0-1e5e080c805mr805679637.33.1734642472902;
 Thu, 19 Dec 2024 13:07:52 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:38 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=15516; i=samitolvanen@google.com;
 h=from:subject; bh=2R588xAUPDj6AGGdbWW5NwsrdeGB6AGfvMfJGS/jZx4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3ZIcV3h0Zfm/L/9fNo3V0e+nxN62Y/H3lgju/3ZRh
 YnBu2FTRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZiIognDX7nJqQ9mr6/fcerf
 tRtSp/zPycqzS1ds1kysV97/6EWneBojw3vNu9ZeV8srVu/tfXHJreha7pJvGoGzrd8nHu+/Mml 1MicA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-21-samitolvanen@google.com>
Subject: [PATCH v7 01/18] tools: Add gendwarfksyms
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 MAINTAINERS                           |   7 ++
 kernel/module/Kconfig                 |   8 ++
 scripts/Makefile                      |   1 +
 scripts/gendwarfksyms/.gitignore      |   2 +
 scripts/gendwarfksyms/Makefile        |   8 ++
 scripts/gendwarfksyms/dwarf.c         | 166 ++++++++++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.c | 126 +++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h |  95 +++++++++++++++
 scripts/gendwarfksyms/symbols.c       |  96 +++++++++++++++
 9 files changed, 509 insertions(+)
 create mode 100644 scripts/gendwarfksyms/.gitignore
 create mode 100644 scripts/gendwarfksyms/Makefile
 create mode 100644 scripts/gendwarfksyms/dwarf.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
 create mode 100644 scripts/gendwarfksyms/symbols.c

diff --git a/MAINTAINERS b/MAINTAINERS
index baf0eeb9a355..35bb18834b39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9550,6 +9550,13 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/radio-gemtek*
 
+GENDWARFKSYMS
+M:	Sami Tolvanen <samitolvanen@google.com>
+L:	linux-modules@vger.kernel.org
+L:	linux-kbuild@vger.kernel.org
+S:	Maintained
+F:	scripts/gendwarfksyms/
+
 GENERIC ARCHITECTURE TOPOLOGY
 M:	Sudeep Holla <sudeep.holla@arm.com>
 L:	linux-kernel@vger.kernel.org
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 7b329057997a..4637f063d0fc 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -169,6 +169,14 @@ config MODVERSIONS
 	  make them incompatible with the kernel you are running.  If
 	  unsure, say N.
 
+config GENDWARFKSYMS
+	bool "gendwarfksyms (from debugging information)"
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
index 000000000000..5c8288c71fdd
--- /dev/null
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <dwarf.h>
+#include <elfutils/libdw.h>
+#include <elfutils/libdwfl.h>
+#include <stdlib.h>
+#include <stdio.h>
+
+#include <hash.h>
+#include <hashtable.h>
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
index 000000000000..7adf2ed9b89b
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
+#define SYMBOL_HASH_BITS 12
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
2.47.1.613.gc27f4b7a9f-goog


