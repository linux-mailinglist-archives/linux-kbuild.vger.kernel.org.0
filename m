Return-Path: <linux-kbuild+bounces-6426-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC49A7BEA7
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 16:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DAA3189E440
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 14:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428E81F3BAC;
	Fri,  4 Apr 2025 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KmY53IeS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7C21F2365;
	Fri,  4 Apr 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775436; cv=none; b=e5DFgJHRFRddIN64hi+GQMALOcHhtxusoVFfpMtap3saiwC47ts99PYu8oZAW1cAg1m1CXBSEtpIpLmFJrNZKgZL1CGzHnxWLTDUTFFj2Hh0ZkPsNxxn8YOyaQKjaG3Hv2Y/hc5inx1o41flSbRmp+18HyAdiIdtFPq2uDTJO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775436; c=relaxed/simple;
	bh=YM3rw6wN9CbasTPtZ1bQCgUavBT7JsEAebTgmjiRE9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8NCE6c8dp5mkjPQiXJj1dBy7eF5lRZzoWIwW7g8M/EBeCpNI9YSt7V27wbAsaEpGnmf7QSjPw/GdHU4ZK5UGHdBdsXhXSTR6Q8dSZyKbOOB5Ksd7KWUNF01PKHiYun4vXSmmebRxfYNQVQ6SK8UBkLoCNxBfUNYx3XDX9u3UYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KmY53IeS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743775432;
	bh=YM3rw6wN9CbasTPtZ1bQCgUavBT7JsEAebTgmjiRE9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KmY53IeSHKrwgABezhFeODuUUPIkDQZSvvK+OM6HV9fQHDj+qlxphv3y3RrfEwJyF
	 5XBJj8VjO+emAMy519/0XXT9+nFVI2lSQLnSDuNxAFjSbPhZ5MXB5jwY31QuI0IDyo
	 JwlbdudkoZjeMF5GBDritFBS/3LgdbuYgXP1uQSZiWGv6Xda6akmU7X0zfCfCPyxOS
	 DGumB+DDZgj/Y7cKeuQVt3mdMXFVFwh8BGQaHGQxdSduCOtLRKUSdgJXhaHCln5PwX
	 ZfS2oTzzeHNiTJs7dPFBbGwXukuhlLu0lCsGRCpTzAhFVcvColnhJZOYpIMA25HBAb
	 tqyHYbf1E52Xw==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 31FAF17E0C50;
	Fri,  4 Apr 2025 16:03:50 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 04 Apr 2025 10:02:52 -0400
Subject: [PATCH RFC 1/2] docs: Add documentation generation for Kconfig
 symbols
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250404-kconfig-docs-v1-1-4c3155d4ba44@collabora.com>
References: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
In-Reply-To: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Add the contents of all Kconfig files to the Documentation to both
increase their visibility and allow for cross-referencing throughout the
documentation. In order to achieve this:
* Add a new script 'kconfig2rst' that converts a Kconfig file into a
  reStructuredText document.
* Add an extra step to the documentation building that runs the script
  for every Kconfig in the source tree, generating a documentation page
  for each one.
* Add a new "Kconfig symbols" page in the documentation, that is listed
  on the "Kernel Build System" page, which contains an index of all
  Kconfig files and their Kconfig symbols, linking to the corresponding
  pages.

The generated documentation pages have the config symbols as sections
with labels that can be referenced from anywhere in the documentation.
The exceptions are configs that appear multiple times. Those don't get
labels, as that would generate 'duplicate label' warnings from sphinx.
To allow this, a list of configs that appear more than once is embedded
in the kconfig2rst script. When a config appears more than once in the
same Kconfig file, a count is appended in the section to prevent
sphinx's auto-labeling to cause the same warning.

The paths in 'source' directives in the Kconfig files are turned into
links to the generated documentation page to allow for navigation to
included Kconfig files.

Config symbols on 'depends'/'select'/etc lines are prepended by
'CONFIG_' to allow them to be cross-referenced by automarkup, though no
cross-references are created in this commit.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/.gitignore       |   2 +
 Documentation/Config/index.rst |  17 +++
 Documentation/Makefile         |  12 +-
 Documentation/kbuild/index.rst |   2 +
 scripts/kconfig2rst.py         | 336 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 368 insertions(+), 1 deletion(-)

diff --git a/Documentation/.gitignore b/Documentation/.gitignore
index d6dc7c9b8e25020f1f3b28811df2291c38695d5f..2fc70a398dc874fcb83834cb6337f602c64a070a 100644
--- a/Documentation/.gitignore
+++ b/Documentation/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 output
 *.pyc
+Config/
+!Config/index.rst
diff --git a/Documentation/Config/index.rst b/Documentation/Config/index.rst
new file mode 100644
index 0000000000000000000000000000000000000000..2abaa9844dd2a9f57bed0a8d050da3538865b1a5
--- /dev/null
+++ b/Documentation/Config/index.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Kconfig symbols
+===============
+
+.. toctree::
+   :glob:
+   :maxdepth: 2
+
+   *
+   */*
+   */*/*
+   */*/*/*
+   */*/*/*/*
+   */*/*/*/*/*
+   */*/*/*/*/*/*
diff --git a/Documentation/Makefile b/Documentation/Makefile
index 63094646df2890a788542a273e4a828a844b2932..74ebc5303b47f0837a9ab31d39b5464af5f17995 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -115,7 +115,7 @@ $(YNL_INDEX): $(YNL_RST_FILES)
 $(YNL_RST_DIR)/%.rst: $(YNL_YAML_DIR)/%.yaml $(YNL_TOOL)
 	$(Q)$(YNL_TOOL) -i $< -o $@
 
-htmldocs texinfodocs latexdocs epubdocs xmldocs: $(YNL_INDEX)
+htmldocs texinfodocs latexdocs epubdocs xmldocs: $(YNL_INDEX) kconfigdocs
 
 htmldocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
@@ -182,9 +182,19 @@ endif # HAVE_SPHINX
 refcheckdocs:
 	$(Q)cd $(srctree);scripts/documentation-file-ref-check
 
+KCONFIG_DOC_DIR=$(srctree)/Documentation/Config
+KCONFIGS := $(shell find $(srctree) -name Kconfig -type f)
+KCONFIGS_RST := $(patsubst %, $(KCONFIG_DOC_DIR)/%.rst, $(KCONFIGS))
+
+$(KCONFIGS_RST): $(KCONFIGS)
+	$(Q)cd $(srctree); $(foreach var,$^,$(shell mkdir -p $(KCONFIG_DOC_DIR)/$(shell dirname $(var)); scripts/kconfig2rst.py $(var) >$(KCONFIG_DOC_DIR)/$(var).rst))
+
+kconfigdocs: $(KCONFIGS_RST)
+
 cleandocs:
 	$(Q)rm -f $(YNL_INDEX) $(YNL_RST_FILES)
 	$(Q)rm -rf $(BUILDDIR)
+	$(Q)rm -rf $(filter-out %index.rst,$(wildcard $(KCONFIG_DOC_DIR)/*))
 	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media clean
 
 dochelp:
diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index 3731ab22bfe745c5c51963cffe58fb652dadf88c..47a1d9753a9fb7b55b8a7141da8123ca97b15cfb 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -15,6 +15,8 @@ Kernel Build System
     makefiles
     modules
 
+    /Config/index
+
     headers_install
 
     issues
diff --git a/scripts/kconfig2rst.py b/scripts/kconfig2rst.py
new file mode 100755
index 0000000000000000000000000000000000000000..5af073a1c669ac43c95bb7af00099dcd9473a6ae
--- /dev/null
+++ b/scripts/kconfig2rst.py
@@ -0,0 +1,336 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2025 Collabora Ltd
+
+import sys
+import re
+import os
+
+import argparse
+
+BASE_PATH_DEFAULT = "Documentation/Config/"
+CFG_LEN = 60
+RE_indentation = r"^[ \t]*"
+in_help_txt = False
+help_txt = ""
+
+# These configs appear more than once, thus we don't generate labels or xrefs to
+# them to avoid duplicate label warnings from Sphinx
+REPEATED_CONFIGS = [
+    "32BIT",
+    "4KSTACKS",
+    "64BIT",
+    "A",
+    "ADVANCED_OPTIONS",
+    "ALPHA_LEGACY_START_ADDRESS",
+    "ARCH_AIROHA",
+    "ARCH_ALPINE",
+    "ARCH_BCM2835",
+    "ARCH_BCM_IPROC",
+    "ARCH_BRCMSTB",
+    "ARCH_DEFAULT_CRASH_DUMP",
+    "ARCH_FLATMEM_ENABLE",
+    "ARCH_FORCE_MAX_ORDER",
+    "ARCH_HAS_ADD_PAGES",
+    "ARCH_HAS_CACHE_LINE_SIZE",
+    "ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION",
+    "ARCH_HAS_ILOG2_U32",
+    "ARCH_HAS_ILOG2_U64",
+    "ARCH_HIBERNATION_HEADER",
+    "ARCH_HIBERNATION_POSSIBLE",
+    "ARCH_HISI",
+    "ARCH_MAY_HAVE_PC_FDC",
+    "ARCH_MEMORY_PROBE",
+    "ARCH_MMAP_RND_BITS_MAX",
+    "ARCH_MMAP_RND_BITS_MIN",
+    "ARCH_MMAP_RND_COMPAT_BITS_MAX",
+    "ARCH_MMAP_RND_COMPAT_BITS_MIN",
+    "ARCH_MTD_XIP",
+    "ARCH_OMAP",
+    "ARCH_PKEY_BITS",
+    "ARCH_PROC_KCORE_TEXT",
+    "ARCH_R9A07G043",
+    "ARCH_RENESAS",
+    "ARCH_ROCKCHIP",
+    "ARCH_SELECT_MEMORY_MODEL",
+    "ARCH_SELECTS_CRASH_DUMP",
+    "ARCH_SELECTS_KEXEC_FILE",
+    "ARCH_SPARSEMEM_DEFAULT",
+    "ARCH_SPARSEMEM_ENABLE",
+    "ARCH_SUNXI",
+    "ARCH_SUPPORTS_CRASH_DUMP",
+    "ARCH_SUPPORTS_CRASH_HOTPLUG",
+    "ARCH_SUPPORTS_KEXEC",
+    "ARCH_SUPPORTS_KEXEC_FILE",
+    "ARCH_SUPPORTS_KEXEC_JUMP",
+    "ARCH_SUPPORTS_KEXEC_PURGATORY",
+    "ARCH_SUPPORTS_KEXEC_SIG",
+    "ARCH_SUPPORTS_UPROBES",
+    "ARCH_SUSPEND_POSSIBLE",
+    "ARCH_UNIPHIER",
+    "ARCH_VIRT",
+    "AUDIT_ARCH",
+    "B",
+    "BCH_CONST_M",
+    "BCH_CONST_T",
+    "BUILTIN_DTB",
+    "BUILTIN_DTB_NAME",
+    "C",
+    "CC_HAVE_STACKPROTECTOR_TLS",
+    "CHOICE_B",
+    "CHOICE_C",
+    "CMDLINE",
+    "CMDLINE_BOOL",
+    "CMDLINE_EXTEND",
+    "CMDLINE_FORCE",
+    "CMDLINE_FROM_BOOTLOADER",
+    "CMDLINE_OVERRIDE",
+    "CMM",
+    "COMPAT",
+    "COMPAT_VDSO",
+    "CORE",
+    "CORE_BELL_A",
+    "CORE_BELL_A_ADVANCED",
+    "CPU_BIG_ENDIAN",
+    "CPU_HAS_FPU",
+    "CPU_HAS_PREFETCH",
+    "CPU_LITTLE_ENDIAN",
+    "CRYPTO_CHACHA20_NEON",
+    "CRYPTO_JITTERENTROPY_MEMORY_BLOCKS",
+    "CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE",
+    "CRYPTO_JITTERENTROPY_OSR",
+    "CRYPTO_JITTERENTROPY_TESTINTERFACE",
+    "CRYPTO_NHPOLY1305_NEON",
+    "DEBUG_ENTRY",
+    "DMA_NONCOHERENT",
+    "DMI",
+    "DRAM_BASE",
+    "DUMMY",
+    "DUMMY_CONSOLE",
+    "EARLY_PRINTK",
+    "EFI",
+    "EFI_STUB",
+    "FIT_IMAGE_FDT_EPM5",
+    "FIX_EARLYCON_MEM",
+    "FPU",
+    "GENERIC_BUG",
+    "GENERIC_BUG_RELATIVE_POINTERS",
+    "GENERIC_CALIBRATE_DELAY",
+    "GENERIC_CSUM",
+    "GENERIC_HWEIGHT",
+    "GENERIC_ISA_DMA",
+    "GENERIC_LOCKBREAK",
+    "HAS_IOMEM",
+    "HAVE_SMP",
+    "HAVE_TCM",
+    "HEARTBEAT",
+    "HIGHMEM",
+    "HOTPLUG_CPU",
+    "HW_PERF_EVENTS",
+    "HZ",
+    "HZ_100",
+    "HZ_1000",
+    "HZ_1024",
+    "HZ_128",
+    "HZ_250",
+    "HZ_256",
+    "ILLEGAL_POINTER_VALUE",
+    "IRQSTACKS",
+    "ISA",
+    "ISA_DMA_API",
+    "KASAN_SHADOW_OFFSET",
+    "KERNEL_MODE_NEON",
+    "KERNEL_START",
+    "KERNEL_START_BOOL",
+    "KUSER_HELPERS",
+    "KVM",
+    "KVM_GUEST",
+    "L1_CACHE_SHIFT",
+    "LEDS_EXPRESSWIRE",
+    "LOCKDEP_SUPPORT",
+    "LOWMEM_SIZE",
+    "LOWMEM_SIZE_BOOL",
+    "MACH_LOONGSON32",
+    "MACH_LOONGSON64",
+    "MACH_TX49XX",
+    "MAGIC_SYSRQ",
+    "MATH_EMULATION",
+    "MCOUNT",
+    "MMU",
+    "NODES_SHIFT",
+    "NO_IOPORT_MAP",
+    "NR_CPUS",
+    "NR_CPUS_DEFAULT",
+    "NR_CPUS_RANGE_END",
+    "NUMA",
+    "PAGE_OFFSET",
+    "PANIC_TIMEOUT",
+    "PARAVIRT",
+    "PARAVIRT_SPINLOCKS",
+    "PARAVIRT_TIME_ACCOUNTING",
+    "PFAULT",
+    "PGTABLE_LEVELS",
+    "PHYSICAL_ALIGN",
+    "PHYSICAL_START",
+    "PID_IN_CONTEXTIDR",
+    "PM",
+    "POWERPC64_CPU",
+    "PRINT_STACK_DEPTH",
+    "RANDOMIZE_BASE",
+    "RANDOMIZE_BASE_MAX_OFFSET",
+    "RELOCATABLE",
+    "SBUS",
+    "SCHED_CLUSTER",
+    "SCHED_HRTICK",
+    "SCHED_MC",
+    "SCHED_OMIT_FRAME_POINTER",
+    "SCHED_SMT",
+    "SERIAL_CONSOLE",
+    "SMP",
+    "STACKPROTECTOR_PER_TASK",
+    "STACKTRACE_SUPPORT",
+    "SWAP_IO_SPACE",
+    "SYS_SUPPORTS_APM_EMULATION",
+    "SYS_SUPPORTS_NUMA",
+    "SYS_SUPPORTS_SMP",
+    "TASK_SIZE",
+    "TASK_SIZE_BOOL",
+    "TCP_CONG_CUBIC",
+    "TIME_LOW_RES",
+    "UNWINDER_FRAME_POINTER",
+    "UNWINDER_GUESS",
+    "UNWINDER_ORC",
+    "USE_OF",
+    "VMSPLIT_1G",
+    "VMSPLIT_2G",
+    "VMSPLIT_3G",
+    "VMSPLIT_3G_OPT",
+    "X",
+    "X86_32",
+    "X86_64",
+    "XEN",
+    "XEN_DOM0",
+    "XIP_KERNEL",
+    "XIP_PHYS_ADDR",
+    "ARCH_BCM",
+    "VIRTUALIZATION",
+]
+
+
+def print_title(title):
+    heading = "=" * len(title)
+    print(heading)
+    print(title)
+    print(heading)
+    print()
+
+
+parser = argparse.ArgumentParser(
+    prog="kconfig2rst", description="Convert a Kconfig file into ReStructuredText"
+)
+
+parser.add_argument("kconfig", help="Path to input Kconfig file")
+parser.add_argument(
+    "--base-doc-path",
+    default=BASE_PATH_DEFAULT,
+    help="Base path of generated rST files for usage in 'source' links",
+)
+args = parser.parse_args()
+
+print_title(args.kconfig)
+
+line_accum = ""
+continued_line = False
+
+repeated_config_count = {}
+
+with open(args.kconfig) as f:
+    for il in f:
+        # If line ends with \, accumulate it and handle full line
+        if re.search(r"\\\n$", il):
+            continued_line = True
+            line_accum += il[:-2]  # accumulate without backslash and newline
+            continue
+
+        if continued_line:
+            continued_line = False
+            l = line_accum + il
+            line_accum = ""
+        else:
+            l = il
+
+        if in_help_txt:
+            if l == "\n":
+                help_txt += l
+                continue
+            if first_line_help_txt:
+                help_txt_indentation = re.match(RE_indentation, l).group(0).expandtabs()
+                first_line_help_txt = False
+            # Consider any line with same or more indentation as part of help text
+            if (
+                help_txt_indentation
+                in re.match(RE_indentation, l).group(0).expandtabs()
+            ):
+                help_txt += l
+                continue
+            else:
+                in_help_txt = False
+                print(help_txt)
+                help_txt = ""
+        else:
+            l = re.sub(r"[*]", r"\*", l)  # Escape asterisks
+
+        if re.match(r"^[ \t]*#.*", l):
+            # Skip comments
+            continue
+
+        if re.match(r"^[ \t]*help", l):
+            in_help_txt = True
+            first_line_help_txt = True
+            print("* help::\n")
+            continue
+
+        m = re.match("^[ \t]*(menu)?config (?P<cfgname>[A-Za-z0-9_]+)", l)
+        if m:
+            section_name = f"\nCONFIG_{m.group('cfgname')}"
+            underline = f"\n{'='*CFG_LEN}\n"
+            if m.group("cfgname") in REPEATED_CONFIGS:
+                repeated_config_count[m.group("cfgname")] = (
+                    repeated_config_count.get(m.group("cfgname"), 0) + 1
+                )
+                if repeated_config_count[m.group("cfgname")] > 1:
+                    section_name += f"({repeated_config_count[m.group('cfgname')]})"
+                print(section_name + underline)
+            else:
+                print(f"\n.. _CONFIG_{m.group('cfgname')}:\n\n" + section_name + underline)
+            continue
+
+        m = re.match(
+            r"^[ \t]*(def_bool|def_tristate|depends on|select|range|visible if|imply|default|prompt|bool|tristate|string|hex|int|modules)( \"(.*)\")?(?P<expr> [^\"]*)?",
+            l,
+        )
+        if m:
+            expr = m.group('expr') if m.group('expr') else ''
+            not_expr = l
+            if expr:
+                expr = re.sub(r'[A-Z0-9_]{2,}', rf" CONFIG_\g<0> ", expr)
+                not_expr = l[:m.start('expr')]
+            print("* " + not_expr.lstrip() + expr.rstrip())
+            continue
+
+        m = re.match(r'^[ \t]*source "(.*)"', l)
+        if m:
+            # Format Kconfig file paths as Documentation/... so they can be turned
+            # into links by the automarkup plugin
+            print(f"\nsource {args.base_doc_path + m.group(1)}.rst\n")
+            continue
+
+        m = re.match(r"[^ \t]*choice|endchoice|comment|menu|endmenu|if|endif", l)
+        if m:
+            print("\n" + l.strip() + "\n")
+            continue
+
+        print(l.strip())
+
+if help_txt:
+    print(help_txt)  # Flush any pending help text

-- 
2.49.0


