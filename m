Return-Path: <linux-kbuild+bounces-6466-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E5DA7D236
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 04:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9FD7188C4DC
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 02:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68A9211A2A;
	Mon,  7 Apr 2025 02:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EM2ZAt8B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A18935280;
	Mon,  7 Apr 2025 02:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743994087; cv=none; b=r2TOJdDfFVmBQoNwXa5I4CQ8Sf/+L1CPM5TpJau7tnZhb366IbbpKt3JAJcdK4c94VLV2dSVaK53XNQiPP13lZMPM+uvSZ/XAfqmxpgt59TYV1mgXQ5wLW80gk1KVS8OueHdFkHmSokne/akG5YZtK0g7VpOLTsCgS5OiWGVa8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743994087; c=relaxed/simple;
	bh=rv5c1vQPYG3wAffq8ileWcmnlS8WdUbG/k1tMQShqIk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4a1vw0l8p2RDO7Bl8zeoMZSlMTmDR1zxQjUbN2hyXCsEdbPGCntqa6fiPlnW+/2gD4SMTiYW37gxbxe1YQDWilj3F+GUiwJhY9K5ye2L5TAQAlzweS01BXYrgPQAARjLGszLUvRC7/pBGWRJykZ6MsUfWjz+uk0D0MQ2BegBcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EM2ZAt8B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D6CC4CEE3;
	Mon,  7 Apr 2025 02:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743994087;
	bh=rv5c1vQPYG3wAffq8ileWcmnlS8WdUbG/k1tMQShqIk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EM2ZAt8BR8yTMyh/Xv7cy6981b7vcU5DbjwRGPW6cvpNzxDNi39qys9npA8kUEMHF
	 CFdyIJbZmDTMY/a5lwT+vu2PS7T4sPPr7MrJje+gkTmAOys0TFkomIegffkSZiEvLD
	 inATxGZAPvif01UVd2sG72/EiNALOy8u7cuskEZuOboeUwzaPjY071+n0S/c85LAWD
	 zhMk+8cwq49yfrN6Wq+FCsdyjb5ylF9J8a7CFHz4qbx0Xj9DRbpDKeGC9d3aLqx4ne
	 fsXP0YMpiglNnTzuMbpSRCsYAb+eDH96dDArb6tcCaXHEQKdRKY4h2tceRJwNA1MUI
	 vKqPHAqmK6Lgg==
Date: Mon, 7 Apr 2025 10:47:55 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, kernel@collabora.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH RFC 1/2] docs: Add documentation generation for Kconfig
 symbols
Message-ID: <20250407104429.45c0ba77@sal.lan>
In-Reply-To: <20250404-kconfig-docs-v1-1-4c3155d4ba44@collabora.com>
References: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
	<20250404-kconfig-docs-v1-1-4c3155d4ba44@collabora.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 04 Apr 2025 10:02:52 -0400
N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> escreveu:

> Add the contents of all Kconfig files to the Documentation to both
> increase their visibility and allow for cross-referencing throughout the
> documentation. In order to achieve this:
> * Add a new script 'kconfig2rst' that converts a Kconfig file into a
>   reStructuredText document.
> * Add an extra step to the documentation building that runs the script
>   for every Kconfig in the source tree, generating a documentation page
>   for each one.
> * Add a new "Kconfig symbols" page in the documentation, that is listed
>   on the "Kernel Build System" page, which contains an index of all
>   Kconfig files and their Kconfig symbols, linking to the corresponding
>   pages.
>=20
> The generated documentation pages have the config symbols as sections
> with labels that can be referenced from anywhere in the documentation.
> The exceptions are configs that appear multiple times. Those don't get
> labels, as that would generate 'duplicate label' warnings from sphinx.
> To allow this, a list of configs that appear more than once is embedded
> in the kconfig2rst script. When a config appears more than once in the
> same Kconfig file, a count is appended in the section to prevent
> sphinx's auto-labeling to cause the same warning.
>=20
> The paths in 'source' directives in the Kconfig files are turned into
> links to the generated documentation page to allow for navigation to
> included Kconfig files.
>=20
> Config symbols on 'depends'/'select'/etc lines are prepended by
> 'CONFIG_' to allow them to be cross-referenced by automarkup, though no
> cross-references are created in this commit.

Despite the huge increase on the time to produce documentation, I'm not
sure how worth is to have it, as there are already cross-reference
services doing something somewhat similar, like:

	https://elixir.bootlin.com

Yet, I didn't test this series yet. So, not sure yet about its
value.

Anyway, it follows some comments about the current implementation.

After addressed on a v2, I intend to test and see how it behaves.

>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/.gitignore       |   2 +
>  Documentation/Config/index.rst |  17 +++
>  Documentation/Makefile         |  12 +-
>  Documentation/kbuild/index.rst |   2 +
>  scripts/kconfig2rst.py         | 336 +++++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 368 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/.gitignore b/Documentation/.gitignore
> index d6dc7c9b8e25020f1f3b28811df2291c38695d5f..2fc70a398dc874fcb83834cb6=
337f602c64a070a 100644
> --- a/Documentation/.gitignore
> +++ b/Documentation/.gitignore
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  output
>  *.pyc
> +Config/
> +!Config/index.rst
> diff --git a/Documentation/Config/index.rst b/Documentation/Config/index.=
rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..2abaa9844dd2a9f57bed0a8d0=
50da3538865b1a5
> --- /dev/null
> +++ b/Documentation/Config/index.rst
> @@ -0,0 +1,17 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Kconfig symbols
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   :glob:
> +   :maxdepth: 2
> +
> +   *
> +   */*
> +   */*/*
> +   */*/*/*
> +   */*/*/*/*
> +   */*/*/*/*/*
> +   */*/*/*/*/*/*

That sounds weird, hard to maintain and probably slow.

Better to have a Sphinx extension instead, with a decent implementation
of glob. The Python's one is slow, on my tests with the Kernel tree.
I worked on something that worked fine for kernel-doc.py:

	https://lore.kernel.org/linux-doc/12a54f1b8f4afd2e70a87195a2aa34f96d736b77=
.1740387599.git.mchehab+huawei@kernel.org/

Perhaps this script could import the class from it, once such
series gets merged. It could make sense to split it on a separate file
if we're going to re-use its code.

> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 63094646df2890a788542a273e4a828a844b2932..74ebc5303b47f0837a9ab31d3=
9b5464af5f17995 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -115,7 +115,7 @@ $(YNL_INDEX): $(YNL_RST_FILES)
>  $(YNL_RST_DIR)/%.rst: $(YNL_YAML_DIR)/%.yaml $(YNL_TOOL)
>  	$(Q)$(YNL_TOOL) -i $< -o $@
> =20
> -htmldocs texinfodocs latexdocs epubdocs xmldocs: $(YNL_INDEX)
> +htmldocs texinfodocs latexdocs epubdocs xmldocs: $(YNL_INDEX) kconfigdocs
> =20
>  htmldocs:
>  	@$(srctree)/scripts/sphinx-pre-install --version-check
> @@ -182,9 +182,19 @@ endif # HAVE_SPHINX
>  refcheckdocs:
>  	$(Q)cd $(srctree);scripts/documentation-file-ref-check
> =20
> +KCONFIG_DOC_DIR=3D$(srctree)/Documentation/Config
> +KCONFIGS :=3D $(shell find $(srctree) -name Kconfig -type f)
> +KCONFIGS_RST :=3D $(patsubst %, $(KCONFIG_DOC_DIR)/%.rst, $(KCONFIGS))
> +
> +$(KCONFIGS_RST): $(KCONFIGS)
> +	$(Q)cd $(srctree); $(foreach var,$^,$(shell mkdir -p $(KCONFIG_DOC_DIR)=
/$(shell dirname $(var)); scripts/kconfig2rst.py $(var) >$(KCONFIG_DOC_DIR)=
/$(var).rst))
> +
> +kconfigdocs: $(KCONFIGS_RST)
> +
>  cleandocs:
>  	$(Q)rm -f $(YNL_INDEX) $(YNL_RST_FILES)
>  	$(Q)rm -rf $(BUILDDIR)
> +	$(Q)rm -rf $(filter-out %index.rst,$(wildcard $(KCONFIG_DOC_DIR)/*))
>  	$(Q)$(MAKE) BUILDDIR=3D$(abspath $(BUILDDIR)) $(build)=3DDocumentation/=
userspace-api/media clean
> =20
>  dochelp:
> diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.=
rst
> index 3731ab22bfe745c5c51963cffe58fb652dadf88c..47a1d9753a9fb7b55b8a7141d=
a8123ca97b15cfb 100644
> --- a/Documentation/kbuild/index.rst
> +++ b/Documentation/kbuild/index.rst
> @@ -15,6 +15,8 @@ Kernel Build System
>      makefiles
>      modules
> =20
> +    /Config/index
> +
>      headers_install
> =20
>      issues
> diff --git a/scripts/kconfig2rst.py b/scripts/kconfig2rst.py
> new file mode 100755
> index 0000000000000000000000000000000000000000..5af073a1c669ac43c95bb7af0=
0099dcd9473a6ae
> --- /dev/null
> +++ b/scripts/kconfig2rst.py
> @@ -0,0 +1,336 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright 2025 Collabora Ltd
> +
> +import sys
> +import re
> +import os
> +
> +import argparse
> +
> +BASE_PATH_DEFAULT =3D "Documentation/Config/"
> +CFG_LEN =3D 60

> +RE_indentation =3D r"^[ \t]*"
> +in_help_txt =3D False
> +help_txt =3D ""

Better to follow Python's standards and keep all constants on uppercase.

I would place the main code inside a class, with the non-const data
inside the class, as it makes the code cleaner and helps using it as
both a Sphinx extension and as a standalone command (which is useful
for testing it).

> +
> +# These configs appear more than once, thus we don't generate labels or =
xrefs to
> +# them to avoid duplicate label warnings from Sphinx
> +REPEATED_CONFIGS =3D [
> +    "32BIT",
> +    "4KSTACKS",
> +    "64BIT",
> +    "A",
> +    "ADVANCED_OPTIONS",
> +    "ALPHA_LEGACY_START_ADDRESS",
> +    "ARCH_AIROHA",
> +    "ARCH_ALPINE",
> +    "ARCH_BCM2835",
> +    "ARCH_BCM_IPROC",
> +    "ARCH_BRCMSTB",
> +    "ARCH_DEFAULT_CRASH_DUMP",
> +    "ARCH_FLATMEM_ENABLE",
> +    "ARCH_FORCE_MAX_ORDER",
> +    "ARCH_HAS_ADD_PAGES",
> +    "ARCH_HAS_CACHE_LINE_SIZE",
> +    "ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION",
> +    "ARCH_HAS_ILOG2_U32",
> +    "ARCH_HAS_ILOG2_U64",
> +    "ARCH_HIBERNATION_HEADER",
> +    "ARCH_HIBERNATION_POSSIBLE",
> +    "ARCH_HISI",
> +    "ARCH_MAY_HAVE_PC_FDC",
> +    "ARCH_MEMORY_PROBE",
> +    "ARCH_MMAP_RND_BITS_MAX",
> +    "ARCH_MMAP_RND_BITS_MIN",
> +    "ARCH_MMAP_RND_COMPAT_BITS_MAX",
> +    "ARCH_MMAP_RND_COMPAT_BITS_MIN",
> +    "ARCH_MTD_XIP",
> +    "ARCH_OMAP",
> +    "ARCH_PKEY_BITS",
> +    "ARCH_PROC_KCORE_TEXT",
> +    "ARCH_R9A07G043",
> +    "ARCH_RENESAS",
> +    "ARCH_ROCKCHIP",
> +    "ARCH_SELECT_MEMORY_MODEL",
> +    "ARCH_SELECTS_CRASH_DUMP",
> +    "ARCH_SELECTS_KEXEC_FILE",
> +    "ARCH_SPARSEMEM_DEFAULT",
> +    "ARCH_SPARSEMEM_ENABLE",
> +    "ARCH_SUNXI",
> +    "ARCH_SUPPORTS_CRASH_DUMP",
> +    "ARCH_SUPPORTS_CRASH_HOTPLUG",
> +    "ARCH_SUPPORTS_KEXEC",
> +    "ARCH_SUPPORTS_KEXEC_FILE",
> +    "ARCH_SUPPORTS_KEXEC_JUMP",
> +    "ARCH_SUPPORTS_KEXEC_PURGATORY",
> +    "ARCH_SUPPORTS_KEXEC_SIG",
> +    "ARCH_SUPPORTS_UPROBES",
> +    "ARCH_SUSPEND_POSSIBLE",
> +    "ARCH_UNIPHIER",
> +    "ARCH_VIRT",
> +    "AUDIT_ARCH",
> +    "B",
> +    "BCH_CONST_M",
> +    "BCH_CONST_T",
> +    "BUILTIN_DTB",
> +    "BUILTIN_DTB_NAME",
> +    "C",
> +    "CC_HAVE_STACKPROTECTOR_TLS",
> +    "CHOICE_B",
> +    "CHOICE_C",
> +    "CMDLINE",
> +    "CMDLINE_BOOL",
> +    "CMDLINE_EXTEND",
> +    "CMDLINE_FORCE",
> +    "CMDLINE_FROM_BOOTLOADER",
> +    "CMDLINE_OVERRIDE",
> +    "CMM",
> +    "COMPAT",
> +    "COMPAT_VDSO",
> +    "CORE",
> +    "CORE_BELL_A",
> +    "CORE_BELL_A_ADVANCED",
> +    "CPU_BIG_ENDIAN",
> +    "CPU_HAS_FPU",
> +    "CPU_HAS_PREFETCH",
> +    "CPU_LITTLE_ENDIAN",
> +    "CRYPTO_CHACHA20_NEON",
> +    "CRYPTO_JITTERENTROPY_MEMORY_BLOCKS",
> +    "CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE",
> +    "CRYPTO_JITTERENTROPY_OSR",
> +    "CRYPTO_JITTERENTROPY_TESTINTERFACE",
> +    "CRYPTO_NHPOLY1305_NEON",
> +    "DEBUG_ENTRY",
> +    "DMA_NONCOHERENT",
> +    "DMI",
> +    "DRAM_BASE",
> +    "DUMMY",
> +    "DUMMY_CONSOLE",
> +    "EARLY_PRINTK",
> +    "EFI",
> +    "EFI_STUB",
> +    "FIT_IMAGE_FDT_EPM5",
> +    "FIX_EARLYCON_MEM",
> +    "FPU",
> +    "GENERIC_BUG",
> +    "GENERIC_BUG_RELATIVE_POINTERS",
> +    "GENERIC_CALIBRATE_DELAY",
> +    "GENERIC_CSUM",
> +    "GENERIC_HWEIGHT",
> +    "GENERIC_ISA_DMA",
> +    "GENERIC_LOCKBREAK",
> +    "HAS_IOMEM",
> +    "HAVE_SMP",
> +    "HAVE_TCM",
> +    "HEARTBEAT",
> +    "HIGHMEM",
> +    "HOTPLUG_CPU",
> +    "HW_PERF_EVENTS",
> +    "HZ",
> +    "HZ_100",
> +    "HZ_1000",
> +    "HZ_1024",
> +    "HZ_128",
> +    "HZ_250",
> +    "HZ_256",
> +    "ILLEGAL_POINTER_VALUE",
> +    "IRQSTACKS",
> +    "ISA",
> +    "ISA_DMA_API",
> +    "KASAN_SHADOW_OFFSET",
> +    "KERNEL_MODE_NEON",
> +    "KERNEL_START",
> +    "KERNEL_START_BOOL",
> +    "KUSER_HELPERS",
> +    "KVM",
> +    "KVM_GUEST",
> +    "L1_CACHE_SHIFT",
> +    "LEDS_EXPRESSWIRE",
> +    "LOCKDEP_SUPPORT",
> +    "LOWMEM_SIZE",
> +    "LOWMEM_SIZE_BOOL",
> +    "MACH_LOONGSON32",
> +    "MACH_LOONGSON64",
> +    "MACH_TX49XX",
> +    "MAGIC_SYSRQ",
> +    "MATH_EMULATION",
> +    "MCOUNT",
> +    "MMU",
> +    "NODES_SHIFT",
> +    "NO_IOPORT_MAP",
> +    "NR_CPUS",
> +    "NR_CPUS_DEFAULT",
> +    "NR_CPUS_RANGE_END",
> +    "NUMA",
> +    "PAGE_OFFSET",
> +    "PANIC_TIMEOUT",
> +    "PARAVIRT",
> +    "PARAVIRT_SPINLOCKS",
> +    "PARAVIRT_TIME_ACCOUNTING",
> +    "PFAULT",
> +    "PGTABLE_LEVELS",
> +    "PHYSICAL_ALIGN",
> +    "PHYSICAL_START",
> +    "PID_IN_CONTEXTIDR",
> +    "PM",
> +    "POWERPC64_CPU",
> +    "PRINT_STACK_DEPTH",
> +    "RANDOMIZE_BASE",
> +    "RANDOMIZE_BASE_MAX_OFFSET",
> +    "RELOCATABLE",
> +    "SBUS",
> +    "SCHED_CLUSTER",
> +    "SCHED_HRTICK",
> +    "SCHED_MC",
> +    "SCHED_OMIT_FRAME_POINTER",
> +    "SCHED_SMT",
> +    "SERIAL_CONSOLE",
> +    "SMP",
> +    "STACKPROTECTOR_PER_TASK",
> +    "STACKTRACE_SUPPORT",
> +    "SWAP_IO_SPACE",
> +    "SYS_SUPPORTS_APM_EMULATION",
> +    "SYS_SUPPORTS_NUMA",
> +    "SYS_SUPPORTS_SMP",
> +    "TASK_SIZE",
> +    "TASK_SIZE_BOOL",
> +    "TCP_CONG_CUBIC",
> +    "TIME_LOW_RES",
> +    "UNWINDER_FRAME_POINTER",
> +    "UNWINDER_GUESS",
> +    "UNWINDER_ORC",
> +    "USE_OF",
> +    "VMSPLIT_1G",
> +    "VMSPLIT_2G",
> +    "VMSPLIT_3G",
> +    "VMSPLIT_3G_OPT",
> +    "X",
> +    "X86_32",
> +    "X86_64",
> +    "XEN",
> +    "XEN_DOM0",
> +    "XIP_KERNEL",
> +    "XIP_PHYS_ADDR",
> +    "ARCH_BCM",
> +    "VIRTUALIZATION",
> +]

Maintaining this sounds a nightmare, as new (eventually duplicated)
symbols may happen anytime.

The best here sounds to do something similar to what I did with
get_abi.py: parse them all altogether, dynamically detecting
duplication. IMO, it also makes sense to have dereference pages
for such duplicated symbols pointing to all occurrences of them.


> +
> +
> +def print_title(title):
> +    heading =3D "=3D" * len(title)
> +    print(heading)
> +    print(title)
> +    print(heading)
> +    print()
> +
> +
> +parser =3D argparse.ArgumentParser(
> +    prog=3D"kconfig2rst", description=3D"Convert a Kconfig file into ReS=
tructuredText"
> +)
> +
> +parser.add_argument("kconfig", help=3D"Path to input Kconfig file")
> +parser.add_argument(
> +    "--base-doc-path",
> +    default=3DBASE_PATH_DEFAULT,
> +    help=3D"Base path of generated rST files for usage in 'source' links=
",
> +)
> +args =3D parser.parse_args()
> +
> +print_title(args.kconfig)
> +
> +line_accum =3D ""
> +continued_line =3D False
> +
> +repeated_config_count =3D {}
> +
> +with open(args.kconfig) as f:
> +    for il in f:

This won't handle directories. Better to use my glob function.

Also, calling lines as as "il" sounds weird for me. I would just
call it "line".

> +        # If line ends with \, accumulate it and handle full line
> +        if re.search(r"\\\n$", il):

Better to use endswith("\\\n"),, as it is faster. We can also use
removesuffix(), as I guess the minimal Python version is now 3.9.

> +            continued_line =3D True
> +            line_accum +=3D il[:-2]  # accumulate without backslash and =
newline
> +            continue
> +
> +        if continued_line:
> +            continued_line =3D False
> +            l =3D line_accum + il
> +            line_accum =3D ""
> +        else:
> +            l =3D il
> +
> +        if in_help_txt:
> +            if l =3D=3D "\n":
> +                help_txt +=3D l
> +                continue
> +            if first_line_help_txt:
> +                help_txt_indentation =3D re.match(RE_indentation, l).gro=
up(0).expandtabs()

Please compile all regular expressions, to make it faster.

> +                first_line_help_txt =3D False
> +            # Consider any line with same or more indentation as part of=
 help text
> +            if (
> +                help_txt_indentation
> +                in re.match(RE_indentation, l).group(0).expandtabs()
> +            ):
> +                help_txt +=3D l
> +                continue
> +            else:
> +                in_help_txt =3D False
> +                print(help_txt)
> +                help_txt =3D ""
> +        else:
> +            l =3D re.sub(r"[*]", r"\*", l)  # Escape asterisks
> +
> +        if re.match(r"^[ \t]*#.*", l):
> +            # Skip comments
> +            continue

I would strip comments first, as I guess Kconfig syntaxe allow to use
comments after any texts, like:

	config SYMBOL # some comment

> +
> +        if re.match(r"^[ \t]*help", l):
> +            in_help_txt =3D True
> +            first_line_help_txt =3D True
> +            print("* help::\n")
> +            continue
> +
> +        m =3D re.match("^[ \t]*(menu)?config (?P<cfgname>[A-Za-z0-9_]+)"=
, l)

Better to accept multiple spaces after config, as it would be valid to
have:

	config    FOO

> +        if m:
> +            section_name =3D f"\nCONFIG_{m.group('cfgname')}"
> +            underline =3D f"\n{'=3D'*CFG_LEN}\n"
> +            if m.group("cfgname") in REPEATED_CONFIGS:
> +                repeated_config_count[m.group("cfgname")] =3D (
> +                    repeated_config_count.get(m.group("cfgname"), 0) + 1
> +                )
> +                if repeated_config_count[m.group("cfgname")] > 1:
> +                    section_name +=3D f"({repeated_config_count[m.group(=
'cfgname')]})"
> +                print(section_name + underline)
> +            else:
> +                print(f"\n.. _CONFIG_{m.group('cfgname')}:\n\n" + sectio=
n_name + underline)
> +            continue
> +
> +        m =3D re.match(
> +            r"^[ \t]*(def_bool|def_tristate|depends on|select|range|visi=
ble if|imply|default|prompt|bool|tristate|string|hex|int|modules)( \"(.*)\"=
)?(?P<expr> [^\"]*)?",
> +            l,
> +        )

I would place the valid matches on an array and do a join to create the
compiled regex to match them. This would make easier to maintain as=20
Kconfig syntax add more notations.

> +        if m:
> +            expr =3D m.group('expr') if m.group('expr') else ''
> +            not_expr =3D l
> +            if expr:
> +                expr =3D re.sub(r'[A-Z0-9_]{2,}', rf" CONFIG_\g<0> ", ex=
pr)
> +                not_expr =3D l[:m.start('expr')]
> +            print("* " + not_expr.lstrip() + expr.rstrip())
> +            continue
> +
> +        m =3D re.match(r'^[ \t]*source "(.*)"', l)
> +        if m:
> +            # Format Kconfig file paths as Documentation/... so they can=
 be turned
> +            # into links by the automarkup plugin
> +            print(f"\nsource {args.base_doc_path + m.group(1)}.rst\n")
> +            continue
> +
> +        m =3D re.match(r"[^ \t]*choice|endchoice|comment|menu|endmenu|if=
|endif", l)

Same here.

> +        if m:
> +            print("\n" + l.strip() + "\n")
> +            continue
> +
> +        print(l.strip())
> +
> +if help_txt:
> +    print(help_txt)  # Flush any pending help text
>=20

