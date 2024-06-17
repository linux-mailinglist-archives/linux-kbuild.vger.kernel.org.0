Return-Path: <linux-kbuild+bounces-2159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB9690B8AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 19:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7859B24C44
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 17:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD4C194C9B;
	Mon, 17 Jun 2024 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pL+/eo/q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B641922DB
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647111; cv=none; b=IA6PLke7cdVlazFZ5BU486ADjMBmWENjJNfk27zVMCyxghR0nmumoI1pMgR1tSAcStkqN2bhLPsz2d6EMFmczcSRp2ydP8rLCWs32s5iLmea4mHUr9gNzoqbACMrcTNxlTUQ6mVQRblvs0iRmXQ5HHLQrno26/4Pw2nRmCRJtfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647111; c=relaxed/simple;
	bh=Xs4KwoxMlQJYeEXm0rnpnTVWjgFyQKLzxA4GR17idpU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KciJBH9q8hF/2iTILkTdG968FLwMt8xl7auMJgpi7tAvRwJwwyBtkkZyOnq/HY4hfZ9g5p2V14cxOx6W+QebrHbXL3PZiK5QJF7+kajrUKq1VJ2UjwdWAUzRqCB3iWmv53b445/aqjHHtDi8AFQ6P/hrxW3ehssrFpRgkDwA+l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pL+/eo/q; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1f87cb270e5so25821475ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647107; x=1719251907; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DUXYcBMIdUd+zaarsTS02Ok3bfGsgWGWrIF0wd751zk=;
        b=pL+/eo/q9WpkR/igK7yNuzL7KuAMqcL7l8PkUAuOPFWBORerAWmYC3qf84RFdsL+FK
         49YKRMU92tPmi6D/bQKNeJV1hEhC2flF9AMcq7shuhfVd7WvSzzd3V4skfFVm128fe+t
         eyBcfcpAPSnjHM+Xqvdzj5C8BcIcCFuintprD2sqgNztfW80zExMobOPC3PMnudnayjp
         TCfaHomCwbVQvLBC80qE8q0BtliM8zqrLO8kBVl+COir+AEj8tN9gXM8Y104pbg9trr3
         TjIy2SxrkLiWui3wvYGvcA8thKEyWVHqeS8rlEtCZdIH0YUSu0Nxx8m5eSfjybLKyTHA
         0R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647107; x=1719251907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUXYcBMIdUd+zaarsTS02Ok3bfGsgWGWrIF0wd751zk=;
        b=ahXD5vEmd2waSpKucbed5G82XnYL0Y0LuwHhsmrAQYZ7oUVnHCPFjP+g2iZ0zdeCRt
         4T1cseGP7nyKkNFHGd35x7D4fXKXmWzPOh7MOzcd7aJcMKzKe86MnYqJJ+dPsIzWcDEb
         76h8WHr3yyePU3TAPQwPdJUDzDnHWrS7Zh6MknYc4GFJBh9tudXZV8DI6jowfiECl19t
         xi+Ymg6xQzSSpMHTtOCFsdP8oFRrk7ktqoOxNZmFdk699ofaUr29JMxpBQHWd1fsElWL
         O9K6KFz2VOW9mllM1CeUMEszBJAifMDfqFigUGyN7URBUpi3iiWPo/adbmpjCa1llQD8
         zt3g==
X-Forwarded-Encrypted: i=1; AJvYcCWC90/cTl2WbljsuSVDcYiwlnWp9lGad3EJ9zjC5joOhR/9FuLcFXK6FVxK7iDY5ukJsN4+ITJkjMlEBD6mzI5MzR+P2SibojruS2Q9
X-Gm-Message-State: AOJu0YxlcDOnzt2+qw6Szj9qo/+boNuVGR2RLxkPUkVvICK9aMCwhiKx
	OR3PWsYN/fAhYQXFWXdCYdwW1z4osxjZ7N8gcyVz2Z/n/Je6dqBY8MHB3ZNqncRCN4VbDwppezW
	8Q77MEDS8zZ2kFd7rjmYJS/2v2Q==
X-Google-Smtp-Source: AGHT+IEA4cUUoJ3DpsCthdA+8I05uaHgHeN12zjF5sW6zMmJNlL+nFOI3fB/nnhyRIrUpruWLkHexG2JjXFqODJSEZg=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:1246:b0:1f4:8a2a:6394 with
 SMTP id d9443c01a7336-1f8627f336dmr9242265ad.8.1718647107293; Mon, 17 Jun
 2024 10:58:27 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:20 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=13011; i=samitolvanen@google.com;
 h=from:subject; bh=Xs4KwoxMlQJYeEXm0rnpnTVWjgFyQKLzxA4GR17idpU=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk6od45vEuvdcIBwLiaolMBNrH8eaDDzYUua
 Gj3bki6kGyJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5OgAKCRBMtfaEi7xW
 7q+/C/496QTbzCXL4tbdWN/11WLksSPbgTRoQFGVVj/ECkfhHQ8ojff7vlo8n0YGMzqKO2+tO0b
 kUQ2cAxy0xHGPtvXHo13CaMmIMbvgDcyDLLOtJc2FZ7HPlrgj5bNZ1D1udNTgEDv+AzB5dwIuJK
 +0ubgSZ8G/WDXDgFxJknTGTaoZgG0TJsLsgrY+TVuuRhVdK+etmCJ3V2hEiMTqd2PaSwt2g39lD
 QkcXZJ40xVgyZlIK5CAbMexlxbfmTnKzHl48dnYQQcS04TVGMaUSgax5cBgxsCu0uX2GVYy6g/x
 cmMxqCCG/WmdR9Qht2qLdp4k38iVOm1G1lbFq1jxYbSMASNawDmYAxvkFDvgyCxJ0r//NILJTMU
 RUYmuobzLnRjTxzwUY8mvjPAZ09piSoX/tqkrv6PDaPIC4mzuRysTdGXyMl+CdbUy5UmaLnR+ya ECxJpTk51Jx+9Ksgu88jIjI2lfc1wHw/ured/dV5YkFFALlQ4ei1d4o49roZFXsQ45p4M=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-18-samitolvanen@google.com>
Subject: [PATCH 01/15] tools: Add gendwarfksyms
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a basic DWARF parser, which uses libdw to traverse the debugging
information in an object file and looks for functions and variables.
In follow-up patches, this will be expanded to produce symbol versions
for CONFIG_MODVERSIONS from DWARF. This tool is needed mainly for Rust
kernel module compatibility.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/Makefile                      |  11 +--
 tools/gendwarfksyms/Build           |   2 +
 tools/gendwarfksyms/Makefile        |  49 +++++++++++
 tools/gendwarfksyms/gendwarfksyms.c | 128 ++++++++++++++++++++++++++++
 tools/gendwarfksyms/gendwarfksyms.h |  71 +++++++++++++++
 tools/gendwarfksyms/types.c         |  87 +++++++++++++++++++
 6 files changed, 343 insertions(+), 5 deletions(-)
 create mode 100644 tools/gendwarfksyms/Build
 create mode 100644 tools/gendwarfksyms/Makefile
 create mode 100644 tools/gendwarfksyms/gendwarfksyms.c
 create mode 100644 tools/gendwarfksyms/gendwarfksyms.h
 create mode 100644 tools/gendwarfksyms/types.c

diff --git a/tools/Makefile b/tools/Makefile
index 276f5d0d53a4..60806ff753b7 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -17,6 +17,7 @@ help:
 	@echo '  firewire               - the userspace part of nosy, an IEEE-1394 traffic sniffer'
 	@echo '  firmware               - Firmware tools'
 	@echo '  freefall               - laptop accelerometer program for disk protection'
+	@echo '  gendwarfksyms          - generates symbol versions from DWARF'
 	@echo '  gpio                   - GPIO tools'
 	@echo '  hv                     - tools used when in Hyper-V clients'
 	@echo '  iio                    - IIO tools'
@@ -68,7 +69,7 @@ acpi: FORCE
 cpupower: FORCE
 	$(call descend,power/$@)
 
-counter firewire hv guest bootconfig spi usb virtio mm bpf iio gpio objtool leds wmi pci firmware debugging tracing: FORCE
+counter firewire hv guest bootconfig spi usb virtio mm bpf iio gendwarfksyms gpio objtool leds wmi pci firmware debugging tracing: FORCE
 	$(call descend,$@)
 
 bpf/%: FORCE
@@ -154,8 +155,8 @@ freefall_install:
 kvm_stat_install:
 	$(call descend,kvm/$(@:_install=),install)
 
-install: acpi_install counter_install cpupower_install gpio_install \
-		hv_install firewire_install iio_install \
+install: acpi_install counter_install cpupower_install gendwarfksyms_install \
+		gpio_install hv_install firewire_install iio_install \
 		perf_install selftests_install turbostat_install usb_install \
 		virtio_install mm_install bpf_install x86_energy_perf_policy_install \
 		tmon_install freefall_install objtool_install kvm_stat_install \
@@ -168,7 +169,7 @@ acpi_clean:
 cpupower_clean:
 	$(call descend,power/cpupower,clean)
 
-counter_clean hv_clean firewire_clean bootconfig_clean spi_clean usb_clean virtio_clean mm_clean wmi_clean bpf_clean iio_clean gpio_clean objtool_clean leds_clean pci_clean firmware_clean debugging_clean tracing_clean:
+counter_clean hv_clean firewire_clean bootconfig_clean spi_clean usb_clean virtio_clean mm_clean wmi_clean bpf_clean iio_clean gendwarfksyms_clean gpio_clean objtool_clean leds_clean pci_clean firmware_clean debugging_clean tracing_clean:
 	$(call descend,$(@:_clean=),clean)
 
 libapi_clean:
@@ -211,7 +212,7 @@ build_clean:
 clean: acpi_clean counter_clean cpupower_clean hv_clean firewire_clean \
 		perf_clean selftests_clean turbostat_clean bootconfig_clean spi_clean usb_clean virtio_clean \
 		mm_clean bpf_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
-		freefall_clean build_clean libbpf_clean libsubcmd_clean \
+		freefall_clean build_clean libbpf_clean libsubcmd_clean gendwarfksyms_clean \
 		gpio_clean objtool_clean leds_clean wmi_clean pci_clean firmware_clean debugging_clean \
 		intel-speed-select_clean tracing_clean thermal_clean thermometer_clean thermal-engine_clean
 
diff --git a/tools/gendwarfksyms/Build b/tools/gendwarfksyms/Build
new file mode 100644
index 000000000000..805591b6df80
--- /dev/null
+++ b/tools/gendwarfksyms/Build
@@ -0,0 +1,2 @@
+gendwarfksyms-y += gendwarfksyms.o
+gendwarfksyms-y += types.o
diff --git a/tools/gendwarfksyms/Makefile b/tools/gendwarfksyms/Makefile
new file mode 100644
index 000000000000..1138ebd8bd0f
--- /dev/null
+++ b/tools/gendwarfksyms/Makefile
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+include ../scripts/Makefile.include
+include ../scripts/Makefile.arch
+
+ifeq ($(srctree),)
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
+srctree := $(patsubst %/,%,$(dir $(srctree)))
+endif
+
+GENDWARFKSYMS    := $(OUTPUT)gendwarfksyms
+GENDWARFKSYMS_IN := $(GENDWARFKSYMS)-in.o
+
+LIBDW_FLAGS := $(shell $(HOSTPKG_CONFIG) libdw --cflags 2>/dev/null)
+LIBDW_LIBS  := $(shell $(HOSTPKG_CONFIG) libdw --libs 2>/dev/null || echo -ldw -lelf)
+
+all: $(GENDWARFKSYMS)
+
+INCLUDES := -I$(srctree)/tools/include
+
+WARNINGS := -Wall -Wno-unused-value
+GENDWARFKSYMS_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBDW_FLAGS)
+GENDWARFKSYMS_LDFLAGS := $(LIBDW_LIBS) $(KBUILD_HOSTLDFLAGS)
+
+# Always want host compilation.
+HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
+
+ifeq ($(V),1)
+  Q =
+else
+  Q = @
+endif
+
+export srctree OUTPUT
+include $(srctree)/tools/build/Makefile.include
+
+$(GENDWARFKSYMS_IN): FORCE
+	$(Q)$(MAKE) $(build)=gendwarfksyms $(HOST_OVERRIDES) CFLAGS="$(GENDWARFKSYMS_CFLAGS)" \
+		LDFLAGS="$(GENDWARFKSYMS_LDFLAGS)"
+
+
+$(GENDWARFKSYMS): $(GENDWARFKSYMS_IN)
+	$(QUIET_LINK)$(HOSTCC) $(GENDWARFKSYMS_IN) $(GENDWARFKSYMS_LDFLAGS) -o $@
+
+clean:
+	$(call QUIET_CLEAN, gendwarfksyms) $(RM) $(GENDWARFKSYMS)
+
+FORCE:
+
+.PHONY: clean FORCE
diff --git a/tools/gendwarfksyms/gendwarfksyms.c b/tools/gendwarfksyms/gendwarfksyms.c
new file mode 100644
index 000000000000..4a2dea307849
--- /dev/null
+++ b/tools/gendwarfksyms/gendwarfksyms.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <fcntl.h>
+#include <errno.h>
+#include <stdarg.h>
+#include <string.h>
+#include "gendwarfksyms.h"
+
+/*
+ * Options
+ */
+
+/* Print type descriptions and debugging output to stderr */
+bool debug;
+
+static const struct {
+	const char *arg;
+	bool *flag;
+} options[] = {
+	{ "--debug", &debug },
+};
+
+static int usage(void)
+{
+	error("usage: gendwarfksyms [options] elf-object-file < symbol-list");
+	return -1;
+}
+
+static int parse_options(int argc, const char **argv, const char **filename)
+{
+	*filename = NULL;
+
+	for (int i = 1; i < argc; i++) {
+		bool found = false;
+
+		for (int j = 0; j < ARRAY_SIZE(options); j++) {
+			if (!strcmp(argv[i], options[j].arg)) {
+				*options[j].flag = true;
+				found = true;
+				break;
+			}
+		}
+
+		if (!found) {
+			if (!*filename)
+				*filename = argv[i];
+			else
+				return -1;
+		}
+	}
+
+	return *filename ? 0 : -1;
+}
+
+static int process_modules(Dwfl_Module *mod, void **userdata, const char *name,
+			   Dwarf_Addr base, void *arg)
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
+		if (res < 0) {
+			error("dwarf_get_units failed: no debugging information?");
+			return -1;
+		} else if (res == 1) {
+			return DWARF_CB_OK; /* No more units */
+		}
+
+		check(process_module(mod, dbg, &cudie));
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
+int main(int argc, const char **argv)
+{
+	const char *filename = NULL;
+	Dwfl *dwfl;
+	int fd;
+
+	if (parse_options(argc, argv, &filename) < 0)
+		return usage();
+
+	fd = open(filename, O_RDONLY);
+	if (fd == -1) {
+		error("open failed for '%s': %s", filename, strerror(errno));
+		return -1;
+	}
+
+	dwfl = dwfl_begin(&callbacks);
+	if (!dwfl) {
+		error("dwfl_begin failed for '%s': %s", filename,
+		      dwarf_errmsg(-1));
+		return -1;
+	}
+
+	if (!dwfl_report_offline(dwfl, filename, filename, fd)) {
+		error("dwfl_report_offline failed for '%s': %s", filename,
+		      dwarf_errmsg(-1));
+		return -1;
+	}
+
+	dwfl_report_end(dwfl, NULL, NULL);
+
+	if (dwfl_getmodules(dwfl, &process_modules, NULL, 0)) {
+		error("dwfl_getmodules failed for '%s'", filename);
+		return -1;
+	}
+
+	dwfl_end(dwfl);
+
+	return 0;
+}
diff --git a/tools/gendwarfksyms/gendwarfksyms.h b/tools/gendwarfksyms/gendwarfksyms.h
new file mode 100644
index 000000000000..44e94f1d9671
--- /dev/null
+++ b/tools/gendwarfksyms/gendwarfksyms.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <dwarf.h>
+#include <elfutils/libdw.h>
+#include <elfutils/libdwfl.h>
+#include <linux/hashtable.h>
+#include <inttypes.h>
+#include <stdlib.h>
+#include <stdio.h>
+
+#ifndef __GENDWARFKSYMS_H
+#define __GENDWARFKSYMS_H
+
+/*
+ * Options -- in gendwarfksyms.c
+ */
+extern bool debug;
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
+#define error(format, ...) __println("error: ", format, ##__VA_ARGS__)
+
+/*
+ * Error handling helpers
+ */
+#define check(expr)                                             \
+	({                                                      \
+		int __res = expr;                               \
+		if (__res < 0) {                                \
+			error("`%s` failed: %d", #expr, __res); \
+			return __res;                           \
+		}                                               \
+		__res;                                          \
+	})
+
+/*
+ * types.c
+ */
+
+struct state {
+	Dwfl_Module *mod;
+	Dwarf *dbg;
+};
+
+typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
+typedef bool (*die_match_callback_t)(Dwarf_Die *die);
+extern bool match_all(Dwarf_Die *die);
+
+extern int process_die_container(struct state *state, Dwarf_Die *die,
+				 die_callback_t func,
+				 die_match_callback_t match);
+
+extern int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie);
+
+#endif /* __GENDWARFKSYMS_H */
diff --git a/tools/gendwarfksyms/types.c b/tools/gendwarfksyms/types.c
new file mode 100644
index 000000000000..2a8e45ae911c
--- /dev/null
+++ b/tools/gendwarfksyms/types.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+/*
+ * Type string processing
+ */
+static int process(struct state *state, const char *s)
+{
+	s = s ?: "<null>";
+
+	if (debug)
+		fputs(s, stderr);
+
+	return 0;
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
+	res = check(dwarf_child(die, &current));
+	while (!res) {
+		if (match(&current))
+			check(func(state, &current));
+		res = check(dwarf_siblingof(&current, &current));
+	}
+
+	return 0;
+}
+
+/*
+ * Symbol processing
+ */
+static int process_subprogram(struct state *state, Dwarf_Die *die)
+{
+	return check(process(state, "subprogram;\n"));
+}
+
+static int process_variable(struct state *state, Dwarf_Die *die)
+{
+	return check(process(state, "variable;\n"));
+}
+
+static int process_exported_symbols(struct state *state, Dwarf_Die *die)
+{
+	int tag = dwarf_tag(die);
+
+	switch (tag) {
+	/* Possible containers of exported symbols */
+	case DW_TAG_namespace:
+	case DW_TAG_class_type:
+	case DW_TAG_structure_type:
+		return check(process_die_container(
+			state, die, process_exported_symbols, match_all));
+
+	/* Possible exported symbols */
+	case DW_TAG_subprogram:
+	case DW_TAG_variable:
+		if (tag == DW_TAG_subprogram)
+			check(process_subprogram(state, die));
+		else
+			check(process_variable(state, die));
+
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie)
+{
+	struct state state = { .mod = mod, .dbg = dbg };
+
+	return check(process_die_container(
+		&state, cudie, process_exported_symbols, match_all));
+}
-- 
2.45.2.627.g7a2c4fd464-goog


