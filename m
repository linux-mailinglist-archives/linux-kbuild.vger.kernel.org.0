Return-Path: <linux-kbuild+bounces-3956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9F9956CA
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BED951C21575
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95E7213EDA;
	Tue,  8 Oct 2024 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oXFGw465"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F08F212EE1
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412723; cv=none; b=U+EF2SADlkwOgef9Xsrn20SnYQXLd3UPvoQx+IfTJdV38T8HzYnSLaSIz2Pe6RZB/kIRAkTGIpfeCgZrgWAoSqg8ISne69pdxC7YG4kL283aaQSFAzDp6OmPpFN6vkUc/kKQR9NzoLBSZDQkM5upB37Cj/QBaI+ZNoRr+mrphVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412723; c=relaxed/simple;
	bh=eo+R2sBJnv+m6zmCr9UjsnOOCyqB0aRtDd5rSDkYDD8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ws8i056kKUB1PbaDcny06OmG9KvOX8l32n0Hi6mC3D//hG402FMjnUPDO1OOJFOmTVpQoXo+I6ydMJAR6j1lvHTGk96SSDFRaQIHl3fAHEBjqlDEoMwN4UbM7pjoHkSbywwCcHyo8QrDJ3iVRhFLl/ZGbdOJCuD4hxD/EVGDxvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oXFGw465; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28eea1074dso1593877276.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412720; x=1729017520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mOYxux7phJ57C24xHjYVDdst1lbeaQ8YtQCEcOZURM=;
        b=oXFGw465rCCjoDAJe7fD2FTtbcrK69haMWE5FlItCPj3jTK+SYAktRsI0A/rbkNkJl
         9B1dl/vwRE3BpPWAn0m8foOqNfTuVsgTw9k3lyctRjuxW6RHTV9f3ic8EypIErt37dXa
         1Q8m7J+YQWEzTDJAOpwrdvOUd5GOSl3Jim/eV+IFcEtUSyPDehSR/XA2GMMTr5OIcjfJ
         SaIJJaNb7oQluWKoYZKWalyWWs9zb6h6gTRoQ73PEGtG2EJQ8Rtt8vKc/36SqaI2a8Qk
         kD+2VctcFLWbWPsWUqTGhMz+53zDbBw/bSsEVONbaIZYEfgC7A4JNXNghVJFUNUj9eFH
         PS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412720; x=1729017520;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mOYxux7phJ57C24xHjYVDdst1lbeaQ8YtQCEcOZURM=;
        b=GUqZ4pWWugHtzdxvWXx4QYYaGC7fBGmis3cDko/lO32A+rlP6rOn4JWNF1dMBbSQat
         93Am1z2KBdXWttplKpOk2OhIV66K4MU7yXFBK1VdqVtjAYKpGo0Mw+5sHv776sNoCFkM
         gj7VSwRNdcDhtiyRewM/s4ztwbBRFtstYXWo6VDUzbR9RdnvJt2Ce80oXAOaCSNPkCW8
         ph0aL6tEY97hORVEPMob579MZWGTuRQemYztfwCHuWxl3xkfLXeIX/HZICkv6AWIKpwR
         WZUczhf51cxCgJXLkPMN4lPacbMKxD4eBolFLaC8Fo3mgF0sxEBcLiyu86Y1irz2MHmI
         vOqg==
X-Forwarded-Encrypted: i=1; AJvYcCWp5jc0vGdJEB94kqzzcyAYfneBl2LURE+6DSoX6WumBk0ftFZMZJogojsNp4SG1sO6jf+9oLhj7hhC3BM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfnM6tZMo0lWytgH/vik6yxaBEaE46BM85qbQHyjRYiXTSk63W
	qk+dZUxQNqNwsHGNPGvV0YlPIX8i8VMBmDF/SWy5iWk9d7TNdwjOX5ZRUC+4AJW/BZzjD/JiAF9
	6HRbdEb1TRLGs1G3pI9V4OAlPew==
X-Google-Smtp-Source: AGHT+IEjOmD/ny7LxZkSR1lU2BjEtLi/IZV0CgcW3UIR7JYU+gd4v9F3fU7wjm6TlX6DjkneDCKcmkDU89MzYFcPdVc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:ed0b:0:b0:e17:8e73:866c with SMTP
 id 3f1490d57ef6-e28fe421ddfmr75276.10.1728412720467; Tue, 08 Oct 2024
 11:38:40 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:26 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=14725; i=samitolvanen@google.com;
 h=from:subject; bh=eo+R2sBJnv+m6zmCr9UjsnOOCyqB0aRtDd5rSDkYDD8=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNYpCQUr7DucuZTJd98ams+OZfaBd/Qbhlun7PznzS
 j6Nls3vKGVhEONgkBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABPxMWZkmD/513W7o68D836d
 ERBunB2iyiLJvPlF9FUFljUPNb+7/2b4n9Pzq6Mn2bwjSMtQreqrzebiK9UnDQ3OKtcWucx+0vu LCQA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-23-samitolvanen@google.com>
Subject: [PATCH v4 02/19] tools: Add gendwarfksyms
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
 scripts/gendwarfksyms/gendwarfksyms.c | 124 +++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h |  97 +++++++++++++++
 scripts/gendwarfksyms/symbols.c       |  83 +++++++++++++
 8 files changed, 489 insertions(+)
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
index 000000000000..1a9be8fa18c8
--- /dev/null
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -0,0 +1,124 @@
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
index 000000000000..4df685deb9e0
--- /dev/null
+++ b/scripts/gendwarfksyms/symbols.c
@@ -0,0 +1,83 @@
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
-- 
2.47.0.rc0.187.ge670bccf7e-goog


