Return-Path: <linux-kbuild+bounces-406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3481B445
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Dec 2023 11:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB3D01C2448B
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Dec 2023 10:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B5921344;
	Thu, 21 Dec 2023 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FH7uSR5J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76074E14;
	Thu, 21 Dec 2023 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a269a271b5bso77056366b.1;
        Thu, 21 Dec 2023 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703155635; x=1703760435; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xNJ0jtv09UWS6w6XQ1RoNiwHReqyTfpvRZA94x5Ry+I=;
        b=FH7uSR5JoFkN3wfi6qAmNmsMQl6bFEXWJzj4vlNyM5uq0nVmOoo6GtNWGi0WWlnR+C
         jyFINUnY3zjLnSCNt4V/pe67xZKrIUVjTI84MoOh79t8fidHV2jne//vCAAYJNFmZbgE
         xSrCsoNBQZ7lt3NVLcy3duar3pX1QwHbjHBybYQzP4CzpDnxik4bN3en7mdJhdmd2RN8
         sQEKbIR5hNU7sn/SSflprtKu4iJU7hDQbGI2Sa7BX0y+h1ZYTQrO+G+gscZ0p/LYlE6r
         gsv+sLu8GztdIwY3+P9oFx61RBbr1kVzvh3C3uyWiVyCOxs0wiw47S1yXPMLxiEeUuYE
         YMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703155635; x=1703760435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNJ0jtv09UWS6w6XQ1RoNiwHReqyTfpvRZA94x5Ry+I=;
        b=MNuPTfFud7pMiwkkks/WlJD+am6v5k0mCZrsKSLqmobRBxS1j+RSbJ8mHXmO7bK0bZ
         V5RQXNTITp8RCwtG+6AwLH3q4y8zG7UCzGCg5FpZ7xMGbF/QD9hxStvzOiA5E4HbbMTx
         C8lJYRalBdVWS5th0qXfZIk3lWyzl+YVm1mDnCoz0unnhN3fNpRCnBB9261A6zwCvErY
         UKEE76ulvjq/Jd6ut7MC9SbC+rG8sJMMDKr60lJ98hxSdzEdW41nVoFKoLf+WXVsDCpL
         b10xleVaOOhJAOfYYw0wNF4g61qRHNWJ4nN/sDQnh62YFYcXyX/ATaj4PrD+6UOxkiS6
         rIBw==
X-Gm-Message-State: AOJu0YyPXLh+p+8FUDTMWm1xbMvIRoDhg/hna+4wAHRoFDZ/XirrTImg
	GZtsROWIS5TzuxLQW8OZ3uP13ciBiLjTuOhv8qM=
X-Google-Smtp-Source: AGHT+IFgTnJCK0I7hZ8qxk5ZFXcKbBJseClDBORN8F+OvGycsHG42G9BkrS7UxCpyCaEdZ+jYAECfazbt/MZktG9yKo=
X-Received: by 2002:a17:906:103:b0:a19:f69e:1d3f with SMTP id
 3-20020a170906010300b00a19f69e1d3fmr10563335eje.71.1703155634216; Thu, 21 Dec
 2023 02:47:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204214635.2916691-1-alessandro.carminati@gmail.com>
In-Reply-To: <20231204214635.2916691-1-alessandro.carminati@gmail.com>
From: Alessandro Carminati <alessandro.carminati@gmail.com>
Date: Thu, 21 Dec 2023 11:46:36 +0100
Message-ID: <CAPp5cGTNe0FKfxTxXpXcMkevn4TPTNq8Don7MNDc-KLfZLzp-g@mail.gmail.com>
Subject: Re: [PATCH v7] scripts/link-vmlinux.sh: Add alias to duplicate
 symbols for kallsyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Nick Alcock <nick.alcock@oracle.com>, 
	Kris Van Hees <kris.van.hees@oracle.com>, Eugene Loh <eugene.loh@oracle.com>, 
	Francis Laniel <flaniel@linux.microsoft.com>, Viktor Malik <vmalik@redhat.com>, 
	Petr Mladek <pmladek@suse.com>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

gentle ping

Il giorno lun 4 dic 2023 alle ore 22:47 Alessandro Carminati (Red Hat)
<alessandro.carminati@gmail.com> ha scritto:
>
> In the kernel environment, situations frequently arise where identical
> names are shared among symbols within both the core image and modules.
> While this doesn't pose issues for the kernel's binary itself, it
> complicates trace or probe operations using tools like kprobe.
>
> This patch introduces "kas_alias" to address this challenge.
>
> During the kernel's build process, just before linking the vmlinux
> image in the "scripts/link-vmlinux.sh", symbol name frequencies are
> collected.
> This collection includes both the core kernel components and modules.
> Subsequently, within the same action, the nm data relative to vmlinux
> is modified by adding aliases based on the comprehensive symbol
> information gathered.
>
> The collection process occurs in two phases:
>
> 1. First phase: Executed during the linking of vmlinux, "kas_alias" scans
>    all symbols provided by the 'nm' data against the vmlinux core image
>    and all objects used for module linkage. This phase requires all
>    modules objects to be produced at this stage, thereby adding a vmlinux
>    dependency for linking modules in 'scripts/Makefile.modfinal'.
>
> 2. Second phase: In a subsequent run in the same build, "kas_alias"
>    processes module objects and injects aliases into the objects' symbol
>    tables where necessary. This operation is done by modifying
>    'scripts/Makefile.modfinal' to include an action for each processed
>    module.
>
> Example:
>
> Consider the symbol "device_show", you can expect an output like the
> following:
>
>  ~ # cat /proc/kallsyms | grep " name_show"
> ffffcaa2bb4f01c8 t name_show
> ffffcaa2bb4f01c8 t name_show@kernel_irq_irqdesc_c_264
> ffffcaa2bb9c1a30 t name_show
> ffffcaa2bb9c1a30 t name_show@drivers_pnp_card_c_186
> ffffcaa2bbac4754 t name_show
> ffffcaa2bbac4754 t name_show@drivers_regulator_core_c_678
> ffffcaa2bbba4900 t name_show
> ffffcaa2bbba4900 t name_show@drivers_base_power_wakeup_stats_c_93
> ffffcaa2bbec4038 t name_show
> ffffcaa2bbec4038 t name_show@drivers_rtc_sysfs_c_26
> ffffcaa2bbecc920 t name_show
> ffffcaa2bbecc920 t name_show@drivers_i2c_i2c_core_base_c_660
> ffffcaa2bbed3840 t name_show
> ffffcaa2bbed3840 t name_show@drivers_i2c_i2c_dev_c_100
> ffffcaa2bbef7210 t name_show
> ffffcaa2bbef7210 t name_show@drivers_pps_sysfs_c_66
> ffffcaa2bbf03328 t name_show
> ffffcaa2bbf03328 t name_show@drivers_hwmon_hwmon_c_72
> ffffcaa2bbff6f3c t name_show
> ffffcaa2bbff6f3c t name_show@drivers_remoteproc_remoteproc_sysfs_c_215
> ffffcaa2bbff8d78 t name_show
> ffffcaa2bbff8d78 t name_show@drivers_rpmsg_rpmsg_core_c_455
> ffffcaa2bbfff7a4 t name_show
> ffffcaa2bbfff7a4 t name_show@drivers_devfreq_devfreq_c_1395
> ffffcaa2bc001f60 t name_show
> ffffcaa2bc001f60 t name_show@drivers_extcon_extcon_c_389
> ffffcaa2bc009890 t name_show
> ffffcaa2bc009890 t name_show@drivers_iio_industrialio_core_c_1396
> ffffcaa2bc01212c t name_show
> ffffcaa2bc01212c t name_show@drivers_iio_industrialio_trigger_c_51
> ffffcaa2bc025e2c t name_show
> ffffcaa2bc025e2c t name_show@drivers_fpga_fpga_mgr_c_618
> ffffcaa2a052102c t name_show    [hello]
> ffffcaa2a052102c t name_show@hello_hello_c_8    [hello]
> ffffcaa2a051955c t name_show    [rpmsg_char]
> ffffcaa2a051955c t name_show@drivers_rpmsg_rpmsg_char_c_365     [rpmsg_char]
>
> where hello, is a plain helloworld module built OOT.
>
> Tested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>
>
> ---
>
> NOTE1:
> About the symbols name duplication that happens as consequence of the
> inclusion compat_binfmt_elf.c does, it is evident that this corner is
> inherently challenging the addr2line approach.
> Attempting to conceal this limitation would be counterproductive.
>
> compat_binfmt_elf.c includes directly binfmt_elf.c, addr2line can't help
> but report all functions and data declared by that file, coming from
> binfmt_elf.c.
>
> My position is that, rather than producing a more complicated pipeline
> to handle this corner case, it is better to fix the compat_binfmt_elf.c
> anomaly.
>
> This patch does not deal with the two potentially problematic symbols
> defined by compat_binfmt_elf.c
>
> Changes from v1:
> * Integrated changes requested by Masami to exclude symbols with prefixes
>   "_cfi" and "_pfx".
> * Introduced a small framework to handle patterns that need to be excluded
>   from the alias production.
> * Excluded other symbols using the framework.
> * Introduced the ability to discriminate between text and data symbols.
> * Added two new config symbols in this version:
>   CONFIG_KALLSYMS_ALIAS_DATA, which allows data for data, and
>   CONFIG_KALLSYMS_ALIAS_DATA_ALL, which excludes all filters and provides
>   an alias for each duplicated symbol.
>
> https://lore.kernel.org/all/20230711151925.1092080-1-alessandro.carminati@gmail.com/
>
> Changes from v2:
> * Alias tags are created by querying DWARF information from the vmlinux.
> * The filename + line number is normalized and appended to the original
>   name.
> * The tag begins with '@' to indicate the symbol source.
> * Not a change, but worth mentioning, since the alias is added to the
>   existing list, the old duplicated name is preserved, and the livepatch
>   way of dealing with duplicates is maintained.
> * Acknowledging the existence of scenarios where inlined functions
>   declared in header files may result in multiple copies due to compiler
>   behavior, though it is not actionable as it does not pose an operational
>   issue.
> * Highlighting a single exception where the same name refers to different
>   functions: the case of "compat_binfmt_elf.c," which directly includes
>   "binfmt_elf.c" producing identical function copies in two separate
>   modules.
>
> https://lore.kernel.org/all/20230714150326.1152359-1-alessandro.carminati@gmail.com/
>
> Changes from v3:
> * kas_alias was rewritten in Python to create a more concise and
>   maintainable codebase.
> * The previous automation process used by kas_alias to locate the vmlinux
>   and the addr2line has been replaced with an explicit command-line switch
>   for specifying these requirements.
> * addr2line has been added into the main Makefile.
> * A new command-line switch has been introduced, enabling users to extend
>   the alias to global data names.
>
> https://lore.kernel.org/all/20230828080423.3539686-1-alessandro.carminati@gmail.com/
>
> Changes from v4:
> * Fixed the O=<build dir> build issue
> * The tool halts execution upon encountering major issues, thereby ensuring
>   the pipeline is interrupted.
> * A cmdline option to specify the source directory added.
> * Minor code adjusments.
> * Tested on mips32 and i386
>
> https://lore.kernel.org/all/20230919193948.465340-1-alessandro.carminati@gmail.com/
>
> Changes from v5:
> * Regex filter extended to all symbols
> * Alias creation extended to module objects
> * Code cleaned and commented
> * kas_alias verbose execution via KAS_ALIAS_DEBUG env variable
> * CONFIG_KALLSYMS_ALIAS_SRCLINE selects KBUILD_BUILTIN to ensure no races
>   during modules build
> * Tested on x86_64, aarch64 and i386
>
> https://lore.kernel.org/all/20230927173516.1456594-1-alessandro.carminati@gmail.com/
>
> Changes from v6:
> * Generate a file to facilitate the construction of custom OOT modules using aliases.
>   In this context, it is needed to export the modules.symbfreq file, a product of
>   the build.
> * Previously, kas_alias was intended to run once, executing all tasks within the same
>   session. In this version, two targets have been introduced to split the work into
>   distinct phases: one for creating aliases for the core image and another for
>   generating aliases for modules.
> * The module aliases production statement has been inserted in the
>   scripts/Makefile.modfinal. Instead of being executed individually for each module,
>   it now runs once for all modules.
> * The approach for excluding symbols in .init and .exit ELF sections has undergone a
>   rewrite.
> * kas_alias is now capable of applying aliases to OOT modules. However, for this to
>   occur, the 'modules.symbfreq' file needs to be accessible during the build.
>   If it is not found, aliases won't be added.
>
> https://lore.kernel.org/all/20231024201157.748254-1-alessandro.carminati@gmail.com/
> ---
>  Makefile                  |  14 +-
>  init/Kconfig              |  22 ++
>  scripts/Makefile.modfinal |  30 +-
>  scripts/kas_alias.py      | 600 ++++++++++++++++++++++++++++++++++++++
>  scripts/link-vmlinux.sh   |  27 +-
>  5 files changed, 688 insertions(+), 5 deletions(-)
>  create mode 100755 scripts/kas_alias.py
>
> diff --git a/Makefile b/Makefile
> index 99db546fbb45..810a0cd21d20 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -479,6 +479,7 @@ OBJCOPY             = $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
>  OBJDUMP                = $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF                = $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP          = $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +ADDR2LINE      = $(LLVM_PREFIX)llvm-addr2line$(LLVM_SUFFIX)
>  else
>  CC             = $(CROSS_COMPILE)gcc
>  LD             = $(CROSS_COMPILE)ld
> @@ -488,6 +489,7 @@ OBJCOPY             = $(CROSS_COMPILE)objcopy
>  OBJDUMP                = $(CROSS_COMPILE)objdump
>  READELF                = $(CROSS_COMPILE)readelf
>  STRIP          = $(CROSS_COMPILE)strip
> +ADDR2LINE      = $(CROSS_COMPILE)addr2line
>  endif
>  RUSTC          = rustc
>  RUSTDOC                = rustdoc
> @@ -591,7 +593,7 @@ export RUSTC_BOOTSTRAP := 1
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
>  export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN CARGO
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
> -export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> +export CPP AR NM STRIP OBJCOPY OBJDUMP READELF ADDR2LINE PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> @@ -1453,6 +1455,16 @@ KBUILD_BUILTIN := 1
>  modules: vmlinux
>  endif
>
> +# *.ko are usually independent of vmlinux, but CONFIG_KALLSYMS_ALIAS_SRCLINE
> +# is another exception.
> +# At the time when vmlinux is being linked, kas_alias operates on both vmlinux
> +# and modules. To prevent races with modules, kas_alias needs to pause operations
> +# while it is executed.
> +ifdef CONFIG_KALLSYMS_ALIAS_SRCLINE
> +KBUILD_BUILTIN := 1
> +modules: vmlinux
> +endif
> +
>  modules: modules_prepare
>
>  # Target to prepare building external modules
> diff --git a/init/Kconfig b/init/Kconfig
> index 9ffb103fc927..f68341b29576 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1738,6 +1738,28 @@ config KALLSYMS_BASE_RELATIVE
>           time constants, and no relocation pass is required at runtime to fix
>           up the entries based on the runtime load address of the kernel.
>
> +config KALLSYMS_ALIAS_SRCLINE
> +       bool "Produces alias for duplicated text symbols" if EXPERT
> +       depends on KALLSYMS && DEBUG_INFO && !DEBUG_INFO_SPLIT
> +       help
> +         It is not uncommon for drivers or modules related to similar
> +         peripherals to have symbols with the exact same name.
> +         While this is not a problem for the kernel's binary itself, it
> +         becomes an issue when attempting to trace or probe specific
> +         functions using infrastructure like ftrace or kprobe.
> +
> +         This option addresses this challenge, producing alias for text
> +         symbol names that include the file name and line where the symbols
> +         are defined in the source code.
> +
> +config KALLSYMS_ALIAS_SRCLINE_DATA
> +       bool "Produces alias also for global variables names"
> +       depends on KALLSYMS_ALIAS_SRCLINE
> +       help
> +         Sometimes it can be useful to refer to global vars by name. Since
> +         they suffer the same issue as text symbols, this config option
> +         allows having aliases for global variables names too.
> +
>  # end of the "standard kernel features (expert users)" menu
>
>  # syscall, maps, verifier
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 8568d256d6fb..acde29a46c6b 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -15,6 +15,32 @@ include $(srctree)/scripts/Makefile.lib
>  # find all modules listed in modules.order
>  modules := $(call read-file, $(MODORDER))
>
> +ifeq ($(KBUILD_BUILTIN),y)
> +  ifeq ($(or $(CONFIG_DEBUG_INFO_BTF_MODULES),$(CONFIG_KALLSYMS_ALIAS_SRCLINE)),y)
> +    VMLINUX_DEP := vmlinux
> +  endif
> +endif
> +
> +VMLINUX_DEP ?=
> +
> +ifeq ($(CONFIG_KALLSYMS_ALIAS_SRCLINE),y)
> +  ifeq ($(CONFIG_KALLSYMS_ALIAS_SRCLINE_DATA),y)
> +    KAS_DATA := --process_data
> +  endif
> +
> +  ifdef KAS_ALIAS_DEBUG
> +      DEBUG_FLAG := $(KAS_ALIAS_DEBUG)
> +  else
> +      DEBUG_FLAG := 0
> +  endif
> +
> +  KAS_ALIAS_MODULE_CMD := $(srctree)/scripts/kas_alias.py --symbol_frequency $(extmod_prefix)modules.symbfreq \
> +  --debug $(DEBUG_FLAG)  --nm $(NM) $(KAS_DATA) \
> +  --addr2line $(ADDR2LINE) --basedir $(srctree) --separator @ \
> +  single_module \
> +  --objcopy $(OBJCOPY) --objdump $(OBJDUMP) --target-module
> +endif
> +
>  __modfinal: $(modules:%.o=%.ko)
>         @:
>
> @@ -30,6 +56,7 @@ quiet_cmd_cc_o_c = CC [M]  $@
>
>  quiet_cmd_ld_ko_o = LD [M]  $@
>        cmd_ld_ko_o +=                                                   \
> +       [ "$(KAS_ALIAS_MODULE_CMD)" != "" ] && $(KAS_ALIAS_MODULE_CMD) $<;      \
>         $(LD) -r $(KBUILD_LDFLAGS)                                      \
>                 $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)              \
>                 -T scripts/module.lds -o $@ $(filter %.o, $^)
> @@ -52,7 +79,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>         printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
>
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
> -%.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
> +%.ko: %.o %.mod.o scripts/module.lds $(VMLINUX_DEP) FORCE
>         +$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>         +$(if $(newer-prereqs),$(call cmd,btf_ko))
> @@ -65,7 +92,6 @@ targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
>
>  PHONY += FORCE
>  FORCE:
> -
>  # Read all saved command lines and dependencies for the $(targets) we
>  # may be building above, using $(if_changed{,_dep}). As an
>  # optimization, we don't need to read them if the target does not
> diff --git a/scripts/kas_alias.py b/scripts/kas_alias.py
> new file mode 100755
> index 000000000000..5b0517771389
> --- /dev/null
> +++ b/scripts/kas_alias.py
> @@ -0,0 +1,600 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Copyright (C) 2023 Red Hat, Inc. Alessandro Carminati <alessandro.carminati@gmail.com>
> +#
> +# kas_alias: Adds alias to duplicate symbols for the kallsyms output.
> +
> +import os
> +import re
> +import sys
> +import inspect
> +import argparse
> +import subprocess
> +from enum import Enum
> +from collections import namedtuple
> +
> +# Regex representing symbols that need no alias
> +regex_filter = [
> +        "^__compound_literal\\.[0-9]+$",
> +        "^__[wm]*key\\.[0-9]+$",
> +        "^_*TRACE_SYSTEM.*$",
> +        "^__already_done\\.[0-9]+$",
> +        "^__msg\\.[0-9]+$",
> +        "^__func__\\.[0-9]+$",
> +        "^CSWTCH\\.[0-9]+$",
> +        "^_rs\\.[0-9]+$",
> +        "^___tp_str\\.[0-9]+$",
> +        "^__flags\\.[0-9]+$",
> +        "^___done\\.[0-9]+$",
> +        "^__print_once\\.[0-9]+$",
> +        "^___once_key\\.[0-9]+$",
> +        "^__pfx_.*$",
> +        "^__cfi_.*$",
> +        "^\\.LC[0-9]+$",
> +        "^\\.L[0-9]+.[0-9]+$",
> +        "^__UNIQUE_ID_.*$",
> +        "^symbols\\.[0-9]+$",
> +        "^_note_[0-9]+$"
> +        ]
> +
> +class DebugLevel(Enum):
> +    PRODUCTION = 0
> +    INFO = 1
> +    DEBUG_BASIC = 2
> +    DEBUG_MODULES = 3
> +    DEBUG_ALL = 4
> +
> +class SeparatorType:
> +    def __call__(self, separator):
> +        if len(separator) != 1:
> +            raise argparse.ArgumentTypeError("Separator must be a single character")
> +        return separator
> +
> +Line = namedtuple('Line', ['address', 'type', 'name', 'addr_int'])
> +
> +def get_caller():
> +    """
> +    Used only to produce debug messages:
> +    Gets the caller's caller name if any, "kas_alias" otherwise
> +    Args:
> +      None
> +    Returns:
> +      A string representing a name of a function.
> +    """
> +    stack = inspect.stack()
> +    if len(stack) > 2:
> +        caller = stack[2][0]
> +        caller_name = caller.f_code.co_name
> +        return caller_name
> +    else:
> +        return "kas_alias"
> +
> +def debug_print(config, print_debug_level, text):
> +    """
> +    Prints text if current debug level is greater or equal to print_debug_level.
> +    Args:
> +      current_debug_level: Application debug level specified by command line.
> +      print_debug_level: Minimum debug level message should be printed.
> +      text: string representing the message.
> +    Returns:
> +      Nothing.
> +    """
> +    if int(config.debug) >= print_debug_level:
> +        print(f"{get_caller()}: " + text)
> +
> +def parse_nm_lines(config, lines, name_occurrences=None):
> +    """
> +    Parses a given nm output and returns the symbol list along with a hash of
> +    symbol occurrences.
> +    Args:
> +      lines: List of tuples representing one nm line.
> +      name_occurrences: Hash having the name as key, used to count names'
> +                        occurrences.
> +    Returns:
> +      Creates a new line list proper for the nm output it parsed and, updates
> +      the occurrences hash.
> +    """
> +    debug_print(config, DebugLevel.DEBUG_BASIC.value, "parse_nm_lines: parse start")
> +
> +    if name_occurrences is None:
> +        name_occurrences = {}
> +
> +    symbol_list = []
> +
> +    for line in lines:
> +        fields = line.strip().split()
> +
> +        if len(fields) >= 3:
> +            address, type, name = fields[0], fields[1], ' '.join(fields[2:])
> +            symbol_list.append(Line(address, type, name, int(address, 16)))
> +            name_occurrences[name] = name_occurrences.get(name, 0) + 1
> +
> +    return symbol_list, name_occurrences
> +
> +def start_addr2line_process(binary_file, config):
> +    """
> +    Initializes an addr2line server process operating on the given ELF object.
> +    Args:
> +      binary_file: String representing the binary file name object of addr2line
> +                   queries.
> +      addr2line_file: String representing the addr2line executable name.
> +    Returns:
> +      Returns addr2line process descriptor.
> +    """
> +    debug_print(config, DebugLevel.DEBUG_BASIC.value, f"Starting addr2line process on {binary_file}")
> +
> +    try:
> +        addr2line_process = subprocess.Popen([config.addr2line_file, '-fe',
> +                                             binary_file],
> +                                             stdin=subprocess.PIPE,
> +                                             stdout=subprocess.PIPE,
> +                                             stderr=subprocess.PIPE,
> +                                             text=True)
> +        return addr2line_process
> +    except Exception as e:
> +        debug_print(config, DebugLevel.PRODUCTION.value, f"Script terminated due to an error ({type(e).__name__}): {str(e)}")
> +        sys.exit(-2)
> +
> +def addr2line_fetch_address(config, addr2line_process, address):
> +    """
> +    Queries a specific address using the active addr2line process.
> +    Args:
> +      addr2line_process: Descriptor of the addr2line process that is wanted to
> +                         handle the query.
> +      address: The address of the symbol that needs to be resolved.
> +    Returns:
> +      Returns a string representing the file and line number where the symbol
> +      at the specified address has been defined. The address is normalized
> +      before being returned.
> +  """
> +    debug_print(config, DebugLevel.DEBUG_ALL.value, f"Resolving {address}")
> +
> +    try:
> +        addr2line_process.stdin.write(address + '\n')
> +        addr2line_process.stdin.flush()
> +        addr2line_process.stdout.readline().strip()
> +        output = addr2line_process.stdout.readline().strip()
> +
> +        return os.path.normpath(output)
> +    except Exception as e:
> +        debug_print(config, DebugLevel.PRODUCTION.value, f"Script terminated due to an error ({type(e).__name__}): {str(e)}")
> +        sys.exit(-2)
> +
> +def process_line(line, config, section_map):
> +    """
> +    Determines whether a duplicate item requires an alias or not.
> +    Args:
> +      line: nm line object that needs to be checked.
> +      section_map: map correlating symbols and the ELF section they are from
> +    Returns:
> +      Returns true if the line needs to be processed, false otherwise.
> +    """
> +    debug_print(config, DebugLevel.DEBUG_ALL.value, f"Processing {line.address} {line.type} {line.name}")
> +
> +    # The module contains symbols that were discarded after being loaded. Typically,
> +    # these symbols belong to the initialization function. These symbols have their
> +    # address in the init section addresses, so this check prevents these symbols
> +    # from being assigned aliases.
> +    if section_map != None:
> +       if line.name in section_map:
> +          if (".init" in section_map[line.name] or ".exit" in section_map[line.name]):
> +              return False
> +       else:
> +          return False
> +
> +    if config.process_data_sym:
> +        return not (any(re.match(regex, line.name) for regex in regex_filter))
> +    else:
> +        return (line.type in {"T", "t"}) and (
> +                not (any(re.match(regex, line.name) for regex in regex_filter)))
> +
> +def fetch_file_lines(config, filename):
> +    """
> +    Reads a text file and retrieves its content.
> +    Args:
> +      filename: String representing the name of the file that needs to be read.
> +    Returns:
> +      Returns a string list representing the lines read in the file.
> +    """
> +    debug_print(config, DebugLevel.DEBUG_BASIC.value, f"Fetch {filename}")
> +
> +    try:
> +        with open(filename, 'r') as file:
> +            lines = [line.strip() for line in file.readlines()]
> +        return lines
> +    except FileNotFoundError:
> +        debug_print(config, DebugLevel.PRODUCTION.value, f"Script terminated due to an error ({type(FileNotFoundError).__name__}): {str(FileNotFoundError)}")
> +        sys.exit(-2)
> +
> +def do_nm(filename, config):
> +    """
> +    Runs the nm command on a specified file.
> +    Args:
> +      filename: String representing the name of the file on which nm should
> +      run against.
> +      nm_executable: String representing the nm executable filename.
> +    Returns:
> +      Returns a strings list representing the nm output.
> +    """
> +    debug_print(config, DebugLevel.DEBUG_BASIC.value, f"executing {config.nm_file} -n {filename}")
> +
> +    try:
> +        nm_output = subprocess.check_output([config.nm_file, '-n', filename],
> +                      universal_newlines=True, stderr=subprocess.STDOUT).splitlines()
> +        return nm_output
> +    except subprocess.CalledProcessError as e:
> +        debug_print(config, DebugLevel.PRODUCTION.value, f"Script terminated due to an error ({type(e).__name__}): {str(e)}")
> +        sys.exit(-2)
> +
> +def make_objcpy_arg(config, line, decoration, section_map):
> +    """
> +    Produces an objcopy argument statement for a single alias to be added in a
> +    module.
> +    Args:
> +      line: nm line object target for this iteration.
> +      decoration: String representing the decoration (normalized addr2line
> +                  output) to be added at the symbol name to have the alias.
> +      section_map: map correlating symbols and the ELF section they are from
> +    Returns:
> +      Returns a string that directly maps the argument string objcopy should
> +      use to add the alias.
> +    """
> +    try:
> +        flag = "global" if line.type.isupper() else "local"
> +        debug_print(config, DebugLevel.DEBUG_MODULES.value,
> +                 f"{line.name + decoration}={section_map[line.name]}:0x{line.address},{flag}")
> +        return (
> +                "--add-symbol "
> +                f"{line.name + decoration}={section_map[line.name]}:0x{line.address},{flag} "
> +               )
> +    except Exception:
> +        debug_print(config, DebugLevel.PRODUCTION.value,
> +              f"make_objcpy_arg warning: Skip alias for {line.name}"
> +              f" type {line.type} because no corresponding section found.")
> +        return ""
> +
> +def execute_objcopy(config, objcopy_args, object_file):
> +    """
> +    Uses objcopy to add aliases to a given module object file.
> +    Since objcopy can't operate in place, the original object file is renamed
> +    before operating on it. At function end, a new object file having the old
> +    object's name is carrying the aliases for the duplicate symbols.
> +    Args:
> +      objcopy_executable: String representing the object copy executable file.
> +      objcopy_args: Arguments (aliases to add to the object file) to be used
> +                    in the objcopy execution command line.
> +      object_file: Target object file (module object file) against which objcopy is executed.
> +    Returns:
> +      Nothing is returned, but as a side effect of this function execution,
> +      the module's object file contains the aliases for duplicated symbols.
> +    """
> +    # Rename the original object file by adding a suffix
> +    backup_file = object_file + '.orig'
> +    debug_print(config, DebugLevel.DEBUG_MODULES.value, f"rename {object_file} to {backup_file}")
> +    os.rename(object_file, backup_file)
> +
> +    full_command = (
> +                    f"{config.objcopy_file} "
> +                    f"{objcopy_args} {backup_file} {object_file}"
> +                   )
> +    debug_print(config, DebugLevel.DEBUG_MODULES.value, f"executing {full_command}")
> +
> +    try:
> +        subprocess.run(full_command, shell=True, check=True)
> +    except subprocess.CalledProcessError as e:
> +        debug_print(config, DebugLevel.PRODUCTION.value, f"Script terminated due to an error ({type(e).__name__}): {str(e)}")
> +        sys.exit(-2)
> +
> +def generate_decoration(line, config, addr2line_process):
> +    """
> +    Generates symbol decoration to be used to make the alias name, by
> +    querying addr2line.
> +    Args:
> +      line: nm line object that needs an alias.
> +      config: Object containing command line configuration.
> +      addr2line_process: Descriptor of the addr2line process that serves
> +                         the binary object where the symbol belongs.
> +    Returns:
> +      Returns a string representing the decoration for the given symbol,
> +      or empty string if this can not be done. E.g., addr2line can't find
> +      the point where the symbol is defined.
> +    """
> +    output = addr2line_fetch_address(config, addr2line_process, line.address)
> +    base_dir = config.linux_base_dir + "/"
> +    cwd = os.getcwd() + "/"
> +    absolute_base_dir = os.path.abspath(os.path.join(cwd, base_dir))
> +
> +    if output.startswith(base_dir):
> +        output = output[len(base_dir):]
> +
> +    if output.startswith(absolute_base_dir):
> +        output = output[len(absolute_base_dir):]
> +
> +    if output.startswith('/'):
> +            output = output[1:]
> +
> +    decoration = config.separator + "".join(
> +        "_" if not c.isalnum() else c for c in output
> +    )
> +    # The addr2line can emit the special string "?:??" when addr2line can not find the
> +    # specified address in the DWARF section that after normalization it becomes "____".
> +    # In such cases, emitting an alias wouldn't make sense, so it is skipped.
> +    if decoration != config.separator + "____":
> +        return decoration
> +    return ""
> +
> +def section_interesting(section):
> +    """
> +    checks if a section is of interest.
> +    Args:
> +      section: string representing the section needed to be tested.
> +    Returns:
> +      True if it is, False otherwise.
> +    """
> +    sections_regex = [r".text", r".data", r".bss", r".rodata"]
> +
> +    for pattern in sections_regex:
> +        if re.search(pattern, section):
> +            return True
> +    return False
> +
> +def get_symbol2section(config, file_to_operate):
> +    """
> +    This function aims to produce a map{symbol_name]=section_name for
> +    any given object file.
> +    Args:
> +      objdump_executable: String representing the objdump executable.
> +      file_to_operate: file whose section names are wanted.
> +    Returns:
> +      Returns a map, where the key is the symbol name and the value is
> +      a section name.
> +    """
> +    try:
> +        output = subprocess.check_output(
> +                   [config.objdump_file, '-h', file_to_operate],
> +                   universal_newlines=True)
> +        section_pattern = re.compile(r'^ *[0-9]+ ([.a-z_]+) +([0-9a-f]+).*$', re.MULTILINE)
> +        section_names = section_pattern.findall(output)
> +        result = {}
> +        for section, section_siza in section_names:
> +            if int(section_siza, 16) != 0 and section_interesting(section):
> +                debug_print(config, DebugLevel.DEBUG_ALL.value, f"CMD => {config.objdump_file} -tj {section} {file_to_operate}")
> +                try:
> +                    output = subprocess.check_output(
> +                           [config.objdump_file, '-tj', section, file_to_operate],
> +                           universal_newlines=True)
> +                except subprocess.CalledProcessError:
> +                      pass
> +                func_names_pattern = re.compile(r'[0-9a-f]+.* ([.a-zA-Z_][.A-Za-z_0-9]+)$', re.MULTILINE)
> +                matches = func_names_pattern.findall(output)
> +                for func_name in matches:
> +                    result[func_name] = section
> +
> +
> +    except Exception as e:
> +        debug_print(config, DebugLevel.PRODUCTION.value, f"Script terminated due to an error ({type(e).__name__}): {str(e)}")
> +        sys.exit(-2)
> +    return result
> +
> +def produce_output_modules(config, symbol_list, name_occurrences,
> +                           module_file_name, addr2line_process):
> +    """
> +    Computes the alias addition on a given module object file.
> +    Args:
> +      config: Object containing command line configuration.
> +      symbol_list: List of tuples representing nm lines for the given object
> +                   file.
> +      name_occurrences: Hash that stores symbol occurrences for the build.
> +      module_file_name: String representing the target moule object file.
> +      addr2line_process: Descriptor of the addr2line process that is wanted to
> +                         handle the query.
> +    Returns:
> +      Nothing is returned, but as a side effect of this function execution,
> +      the module's object file contains the aliases for duplicated symbols.
> +    """
> +    debug_print(config, DebugLevel.DEBUG_ALL.value, "produce_output_modules computation starts here ")
> +    objcopy_args = "";
> +    args_cnt = 0
> +    section_map = get_symbol2section(config, module_file_name)
> +    for module_symbol in symbol_list:
> +        debug_print(config, DebugLevel.DEBUG_ALL.value, f"--> Processing {module_symbol}")
> +        try:
> +            if (name_occurrences[module_symbol.name] > 1) and process_line(module_symbol, config, section_map):
> +                decoration = generate_decoration(module_symbol, config, addr2line_process)
> +                debug_print(config, DebugLevel.DEBUG_ALL.value, f"--- {module_symbol} occurred multiple times and is a candidate for alias: decoration '{decoration}'")
> +                if decoration != "":
> +                    objcopy_args = objcopy_args + make_objcpy_arg(config, module_symbol, decoration, section_map)
> +                    args_cnt = args_cnt + 1
> +                    if args_cnt > 50:
> +                       debug_print(config, DebugLevel.DEBUG_MODULES.value, "Number of arguments high, split objcopy"
> +                                   " call into multiple statements.")
> +                       execute_objcopy(config, objcopy_args, module_file_name)
> +                       args_cnt = 0
> +                       objcopy_args = ""
> +        except KeyError:
> +            pass
> +    execute_objcopy(config, objcopy_args, module_file_name)
> +
> +def produce_output_vmlinux(config, symbol_list, name_occurrences, addr2line_process):
> +    """
> +    Computes the alias addition for the core Linux on image.
> +    Args:
> +      config: Object containing command line configuration.
> +      symbol_list: List of tuples representing nm lines for the given object
> +                   file.
> +      name_occurrences: Hash that stores symbol occurreces for the build.
> +      addr2line_process: Descriptor of the addr2line process that is wanted to
> +                         handle the query.
> +    Returns:
> +      Nothing is returned, but as a side effect of this function execution,
> +      the core kernel image contains the aliases for duplicated symbols.
> +    """
> +    with open(config.output_file, 'w') as output_file:
> +       for obj in symbol_list:
> +            output_file.write(f"{obj.address} {obj.type} {obj.name}\n")
> +            if (name_occurrences[obj.name] > 1) and process_line(obj, config, None):
> +                decoration = generate_decoration(obj, config, addr2line_process)
> +                debug_print(config,DebugLevel.DEBUG_ALL.value, f"Symbol {obj.name} appears multiple times, and decoration is {decoration}")
> +                if decoration != "":
> +                    debug_print(config, DebugLevel.DEBUG_ALL.value, f"Writing on {config.output_file} the additional '{obj.address} {obj.type} {obj.name + decoration}'")
> +                    output_file.write(f"{obj.address} {obj.type} {obj.name + decoration}\n")
> +
> +def read_name_occurrences(config):
> +    """
> +    Reads symbol frequencies from the file specified in the 'config' argument.
> +
> +    If the file is not found, it gracefully returns an empty map.
> +
> +    Args:
> +      config: A configuration object or dictionary containing necessary information
> +              to locate the file.
> +
> +    Returns:
> +      A map where keys represent symbol names and values represent their frequencies.
> +    """
> +    name_occurrences = {}
> +    # This code reads occurrences of symbol names from a file containing both the core image
> +    # and modules frequencies resulted from the computation of the "core_image" action.
> +    # It reads from the file specified by command-line arguments; if the file doesn't exist
> +    # or the filename isn't specified, it returns an empty map.
> +    # The code relies on accessing and reading config.symbol_frequency_file containing
> +    # symbol name frequencies.
> +    # In a complete build, this file is generated during the "core image" action earlier
> +    # in the build process.
> +    # However, when building a custom OOT module, it is needed to ensure that this file
> +    # is accessible in the current directory where the module source code is being built.
> +    # Not having this file result in a module that have no aliases even if they are needed
> +    if config.symbol_frequency_file is not None:
> +        try:
> +            with open(config.symbol_frequency_file, 'r') as file:
> +                for line in file:
> +                    key, value = line.strip().split(':')
> +                    name_occurrences[key]=int(value)
> +        except FileNotFoundError:
> +            pass
> +
> +    return name_occurrences
> +
> +def check_aliases(config, module_nm_lines):
> +   """
> +   Flags modules that already have aliases based on the given 'module_nm_lines'.
> +
> +   This function takes in configuration details and a list of strings representing
> +   the 'nm' command output for a specific module. It detects instances where a module
> +   already possesses an alias, which might occur after a build interruption and restart.
> +
> +   The detection logic is straightforward: it examines if the separator character is
> +   present in the symbol name. If found, it uses this separator to check if the
> +   previous symbol shares the same name. This detection assumes 'nm' is invoked with
> +   the '-n' flag, ensuring symbol sorting.
> +
> +   Args:
> +     config: A configuration object or dictionary containing necessary information.
> +     module_nm_lines: A list of strings representing the 'nm' command output for a module.
> +
> +   Returns:
> +     True if the module_nm_lines contains aliases, False otherwise.
> +   """
> +   prev = None
> +   for line in module_nm_lines:
> +       if ('@' in line.name and line.name.split(config.separator)[0] == prev):
> +           return False
> +       prev = line.name
> +   return True
> +
> +def main():
> +    # Handles command-line arguments and generates a config object
> +    parser = argparse.ArgumentParser(description='Add alias to multiple occurring symbols name in kallsyms')
> +    subparsers = parser.add_subparsers(title='Subcommands', dest='action')
> +    core_image_parser = subparsers.add_parser('core_image', help='Operates for in tree computation.')
> +    core_image_parser.add_argument('-n', "--nmdata", dest="nm_data_file", required=True, help="Set vmlinux nm output file to use for core image.")
> +    core_image_parser.add_argument('-o', "--outfile", dest="output_file", required=True, help="Set the vmlinux nm output file containing aliases.")
> +    core_image_parser.add_argument('-v', "--vmlinux", dest="vmlinux_file", required=True, help="Set the vmlinux core image file.")
> +    core_image_parser.add_argument('-m', "--modules_list", dest="module_list", required=True, help="Set the file containing the list of the modules object files.")
> +
> +    single_module_parser = subparsers.add_parser('single_module', help='Operates for out of tree computation.')
> +    single_module_parser.add_argument('-c', "--objcopy", dest="objcopy_file", required=True, help="Set the objcopy executable to be used.")
> +    single_module_parser.add_argument('-u', "--objdump", dest="objdump_file", required=True, help="Set objdump  executable to be used.")
> +    single_module_parser.add_argument('-q', "--target-module", dest="target_module", required=False, help="Sets a tharget module to operate.")
> +
> +    parser.add_argument('-j', "--symbol_frequency", dest="symbol_frequency_file", required=True, help="Specify the symbol frequency needed to use for producing aliases")
> +    parser.add_argument('-z', "--debug", dest="debug", required=False, help="Set the debug level.", choices=[f"{level.value}" for level in DebugLevel], default="1" )
> +    parser.add_argument('-a', "--addr2line", dest="addr2line_file", required=True, help="Set the addr2line executable to be used.")
> +    parser.add_argument('-b', "--basedir", dest="linux_base_dir", required=True, help="Set base directory of the source kernel code.")
> +    parser.add_argument('-s', "--separator", dest="separator", required=False, help="Set separator, character that separates original name from the addr2line data in alias symbols.", default="@", type=SeparatorType())
> +    parser.add_argument('-d', "--process_data", dest="process_data_sym", required=False, help="Requires the tool to process data symbols along with text symbols.", action='store_true')
> +    parser.add_argument('-e', "--nm", dest="nm_file", required=True, help="Set the nm executable to be used.")
> +
> +    config = parser.parse_args()
> +
> +    try:
> +        # The core_image target is utilized for gathering symbol statistics from the core image and modules,
> +        # generating aliases for the core image. This target is designed to be invoked from scripts/link-vmlinux.sh
> +        if config.action == 'core_image':
> +            debug_print(config, DebugLevel.INFO.value,"Start core_image processing")
> +
> +            # Determine kernel source code base directory
> +            if not config.linux_base_dir.startswith('/'):
> +                config.linux_base_dir = os.path.normpath(os.getcwd() + "/" + config.linux_base_dir) + "/"
> +            debug_print(config, DebugLevel.DEBUG_BASIC.value, f"Configuration: {config}")
> +
> +            debug_print(config, DebugLevel.INFO.value, "Process nm data from vmlinux")
> +            # Process nm data from vmlinux
> +            debug_print(config, DebugLevel.DEBUG_BASIC.value, f"fetch_file_lines({config.nm_data_file})")
> +            vmlinux_nm_lines = fetch_file_lines(config, config.nm_data_file)
> +            vmlinux_symbol_list, name_occurrences = parse_nm_lines(config, vmlinux_nm_lines)
> +
> +            debug_print(config, DebugLevel.INFO.value,"Process nm data for modules")
> +            # Process nm data for modules
> +            debug_print(config, DebugLevel.DEBUG_BASIC.value, f"fetch_file_lines({config.nm_data_file})")
> +            module_list = fetch_file_lines(config, config.module_list)
> +            module_symbol_list = {}
> +            for module in module_list:
> +                module_nm_lines = do_nm(module, config)
> +                module_symbol_list[module], name_occurrences = parse_nm_lines(config, module_nm_lines, name_occurrences)
> +
> +            debug_print(config, DebugLevel.INFO.value, f"Save name_occurrences data: {config.symbol_frequency_file}")
> +            with open(config.symbol_frequency_file, 'w') as file:
> +                for key, value in name_occurrences.items():
> +                    file.write(f"{key}:{value}\n")
> +
> +            debug_print(config, DebugLevel.INFO.value, "Produce file for vmlinux")
> +            # Produce file for vmlinux
> +            debug_print(config, DebugLevel.DEBUG_BASIC.value, f"addr2line_process({config.vmlinux_file}, {config.addr2line_file})")
> +            addr2line_process = start_addr2line_process(config.vmlinux_file, config)
> +            produce_output_vmlinux(config, vmlinux_symbol_list, name_occurrences, addr2line_process)
> +            addr2line_process.stdin.close()
> +            addr2line_process.stdout.close()
> +            addr2line_process.stderr.close()
> +            addr2line_process.wait()
> +
> +        # Expects to be called from scripts/Makefile.modfinal
> +        elif config.action == 'single_module':
> +             debug_print(config, DebugLevel.INFO.value,"Start single_module processing")
> +             # read simbol name frequency file
> +             name_occurrences = read_name_occurrences(config)
> +             # scan current module
> +             module_nm_lines = do_nm(config.target_module, config)
> +             mudule_nm_data, _ = parse_nm_lines(config, module_nm_lines)
> +             if check_aliases(config, mudule_nm_data,):
> +                 debug_print(config, DebugLevel.DEBUG_BASIC.value, f"addr2line_process({config.target_module}, {config.addr2line_file})")
> +                 addr2line_process = start_addr2line_process(config.target_module, config)
> +                 debug_print(config, DebugLevel.DEBUG_BASIC.value,"adding aliases to module")
> +                 produce_output_modules(config, mudule_nm_data, name_occurrences, config.target_module, addr2line_process)
> +                 addr2line_process.stdin.close()
> +                 addr2line_process.stdout.close()
> +                 addr2line_process.stderr.close()
> +                 addr2line_process.wait()
> +             else:
> +                 debug_print(config, DebugLevel.INFO.value,"module is already aliased, skipping")
> +
> +        else:
> +            raise SystemExit("Script terminated: unknown action")
> +
> +    except Exception as e:
> +        debug_print(config, DebugLevel.PRODUCTION.value, f"Script terminated due to an error ({type(e).__name__}): {str(e)}")
> +        sys.exit(-2)
> +
> +if __name__ == "__main__":
> +    main()
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index a432b171be82..31afac64d7ed 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -91,7 +91,12 @@ vmlinux_link()
>
>         # The kallsyms linking does not need debug symbols included.
>         if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
> -               ldflags="${ldflags} ${wl}--strip-debug"
> +               # The kallsyms linking does not need debug symbols included,
> +               # unless the KALLSYMS_ALIAS_SRCLINE.
> +               if ! is_enabled CONFIG_KALLSYMS_ALIAS_SRCLINE && \
> +                  [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
> +                       ldflags="${ldflags} ${wl}--strip-debug"
> +               fi
>         fi
>
>         if is_enabled CONFIG_VMLINUX_MAP; then
> @@ -161,7 +166,24 @@ kallsyms()
>         fi
>
>         info KSYMS ${2}
> -       scripts/kallsyms ${kallsymopt} ${1} > ${2}
> +       ALIAS=""
> +       KAS_DATA=""
> +       if is_enabled CONFIG_KALLSYMS_ALIAS_SRCLINE_DATA; then
> +               KAS_DATA="--process_data"
> +       fi
> +       if is_enabled CONFIG_KALLSYMS_ALIAS_SRCLINE; then
> +               ALIAS=".alias"
> +               # You can use KAS_ALIAS_DEBUG=<debug level> in the make statements to enable
> +               # verbose execution for kas_alias.
> +               ${srctree}/scripts/kas_alias.py --symbol_frequency modules.symbfreq \
> +                       --debug ${KAS_ALIAS_DEBUG:-0} \
> +                       --addr2line ${ADDR2LINE} --basedir ${srctree} --nm ${NM} \
> +                       --separator @ ${KAS_DATA} \
> +                       core_image \
> +                       --modules_list ${MODORDER} --vmlinux ${kallsyms_vmlinux} \
> +                       --nmdata ${1} --outfile ${1}${ALIAS}
> +       fi
> +       scripts/kallsyms ${kallsymopt} ${1}${ALIAS} > ${2}
>  }
>
>  # Perform one step in kallsyms generation, including temporary linking of
> @@ -203,6 +225,7 @@ cleanup()
>         rm -f System.map
>         rm -f vmlinux
>         rm -f vmlinux.map
> +       find . -type f -name "*.orig" -exec rm {} \;
>  }
>
>  # Use "make V=1" to debug this script
> --
> 2.34.1
>

