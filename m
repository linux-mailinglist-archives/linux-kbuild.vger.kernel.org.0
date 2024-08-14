Return-Path: <linux-kbuild+bounces-2984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BFB952277
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 21:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC35C1F243E9
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 19:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA511BDAB7;
	Wed, 14 Aug 2024 19:03:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A113C673;
	Wed, 14 Aug 2024 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723662233; cv=none; b=MQ/Pkh8LTAlEPF7/lr3/zW07DuEVMa7vIqFVcy+iEeZoiJwo2SM6M3/oDB2ANhjRwuAB+iaq2DQMdC046247k1Q2NHJSsN79Nsh3TNkitsibX7gjz8jSPsqOuf8DqCtq6/IDaJwxVyrbVIUNXza4yvvJtJNM1B3L9X4XuEMT6R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723662233; c=relaxed/simple;
	bh=BUklLjjJOfsRkWi8ogPNyB8jK2KTfJhO8KrMS47mczY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NhrNM2/P3brDQ2MMXaBrcfToTeYI+taJWQqDR63hxSmPj6z3oaghuiKr/rUC5tFICfBBYzeTYvEHUN5Xqj5HwQlRaO8y2SekwVWzZfvVTrDo4dL5FlyRptKgDCF6hG5uD7KUviWO/D+i2+nE0Vtr03kJK6f3LNi+U273HgUrrKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87B9C116B1;
	Wed, 14 Aug 2024 19:03:51 +0000 (UTC)
Date: Wed, 14 Aug 2024 15:04:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Nick
 Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>,
 Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v5 2/4] kbuild, kconfig: generate offset range data for
 builtin modules
Message-ID: <20240814150405.0f55335d@gandalf.local.home>
In-Reply-To: <20240716031045.1781332-3-kris.van.hees@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
	<20240716031045.1781332-3-kris.van.hees@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jul 2024 23:10:43 -0400
Kris Van Hees <kris.van.hees@oracle.com> wrote:

> The offset range data for builtin modules is generated using:
>  - modules.builtin: associates object files with module names
>  - vmlinux.map: provides load order of sections and offset of first member
>     per section
>  - vmlinux.o.map: provides offset of object file content per section
>  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME

No where in the change log does it state the name of the file that is going
to be created. That should be the first thing mentioned.

   Create file module.builtin.ranges that can be used to find where
   built-in modules are located by their addresses. This will be useful for
   tracing tools to find what functions are for various built-in modules.


> 
> The generated data will look like:
> 
> .text 00000000-00000000 = _text
> .text 0000baf0-0000cb10 amd_uncore
> .text 0009bd10-0009c8e0 iosf_mbi
> ...
> .text 008e6660-008e9630 snd_soc_wcd_mbhc
> .text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
> .text 008ea610-008ea780 snd_soc_wcd9335
> ...
> .data 00000000-00000000 = _sdata
> .data 0000f020-0000f680 amd_uncore
> 
> For each ELF section, it lists the offset of the first symbol.  This can
> be used to determine the base address of the section at runtime.
> 
> Next, it lists (in strict ascending order) offset ranges in that section
> that cover the symbols of one or more builtin modules.  Multiple ranges
> can apply to a single module, and ranges can be shared between modules.
> 
> The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
> is generated for kernel modules that are built into the kernel image.
> 
> How it works:
> 
>   1. The modules.builtin file is parsed to obtain a list of built-in
>      module names and their associated object names (the .ko file that
>      the module would be in if it were a loadable module, hereafter
>      referred to as <kmodfile>).  This object name can be used to
>      identify objects in the kernel compile because any C or assembler
>      code that ends up into a built-in module will have the option
>      -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
>      can be found in the .<obj>.cmd file in the kernel build tree.
> 
>      If an object is part of multiple modules, they will all be listed
>      in the KBUILD_MODFILE option argument.
> 
>      This allows us to conclusively determine whether an object in the
>      kernel build belong to any modules, and which.
> 
>  2. The vmlinux.map is parsed next to determine the base address of each
>     top level section so that all addresses into the section can be
>     turned into offsets.  This makes it possible to handle sections
>     getting loaded at different addresses at system boot.
> 
>     We also determine an 'anchor' symbol at the beginning of each
>     section to make it possible to calculate the true base address of
>     a section at runtime (i.e. symbol address - symbol offset).
> 
>     We collect start addresses of sections that are included in the top
>     level section.  This is used when vmlinux is linked using vmlinux.o,
>     because in that case, we need to look at the vmlinux.o linker map to
>     know what object a symbol is found in.
> 
>     And finally, we process each symbol that is listed in vmlinux.map
>     (or vmlinux.o.map) based on the following structure:
> 
>     vmlinux linked from vmlinux.a:
> 
>       vmlinux.map:
>         <top level section>
>           <included section>  -- might be same as top level section)
>             <object>          -- built-in association known
>               <symbol>        -- belongs to module(s) object belongs to
>               ...
> 
>     vmlinux linked from vmlinux.o:
> 
>       vmlinux.map:
>         <top level section>
>           <included section>  -- might be same as top level section)
>             vmlinux.o         -- need to use vmlinux.o.map
>               <symbol>        -- ignored
>               ...
> 
>       vmlinux.o.map:
>         <section>
>             <object>          -- built-in association known
>               <symbol>        -- belongs to module(s) object belongs to
>               ...
> 
>  3. As sections, objects, and symbols are processed, offset ranges are
>     constructed in a striaght-forward way:
> 
>       - If the symbol belongs to one or more built-in modules:
>           - It we were working on the same module(s), extend the range

             "If we" ?

>             to include this object
>           - If we were working on another module(s), close that range,
>             and start the new one
>       - If the symbol does not belong to any built-in modules:
>           - It we were working on a module(s) range, close that range

             "If we" ?
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> ---
> 
> Notes:
>     Changes since v4:
>      - Improved commit description to explain the why and how.
>      - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
>      - Improved comments in generate_builtin_ranges.awk
>      - Improved logic in generate_builtin_ranges.awk to handle incorrect
>        object size information in linker maps
>     
>     Changes since v3:
>      - Consolidated patches 2 through 5 into a single patch
>      - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
>      - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
>      - Disable CONFIG_BUILTIN_MODULE_RANGES if
> CONFIG_LTO_CLANG_(FULL|THIN)=y
>      - Support LLVM (lld) compiles in generate_builtin_ranges.awk
>      - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
>     
>     Changes since v2:
>      - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
>      - 1st arg to generate_builtin_ranges.awk is now
> modules.builtin.modinfo
>      - Switched from using modules.builtin.objs to parsing .*.cmd files
>      - Parse data from .*.cmd in generate_builtin_ranges.awk
>      - Use $(real-prereqs) rather than $(filter-out ...)
>     ---
> 
>  Documentation/process/changes.rst   |   7 +
>  lib/Kconfig.debug                   |  19 +
>  scripts/Makefile.vmlinux            |  16 +
>  scripts/Makefile.vmlinux_o          |   3 +
>  scripts/generate_builtin_ranges.awk | 515 ++++++++++++++++++++++++++++
>  5 files changed, 560 insertions(+)
>  create mode 100755 scripts/generate_builtin_ranges.awk
> 
> diff --git a/Documentation/process/changes.rst
> b/Documentation/process/changes.rst index 5685d7bfe4d0..a37b9c22241d
> 100644 --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -63,6 +63,7 @@ cpio                   any              cpio --version
>  GNU tar                1.28             tar --version
>  gtags (optional)       6.6.5            gtags --version
>  mkimage (optional)     2017.01          mkimage --version
> +GNU AWK (optional)     5.1.0            gawk --version

Note, this needs to be rebased on top of the latest Linus tagged branch as
it didn't apply cleanly.

>  ====================== ===============
> ======================================== 
>  .. [#f1] Sphinx is needed only to build the Kernel documentation
> @@ -198,6 +199,12 @@ platforms. The tool is available via the
> ``u-boot-tools`` package or can be built from the U-Boot source code. See
> the instructions
> at https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux 
> +GNU AWK
> +-------
> +
> +GNU AWK is needed if you want kernel builds to generate address range
> data for +builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
> +
>  System utilities
>  ****************
>  
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 59b6765d86b8..ab8428c0e2fd 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -571,6 +571,25 @@ config VMLINUX_MAP
>  	  pieces of code get eliminated with
>  	  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
>  
> +config BUILTIN_MODULE_RANGES
> +	bool "Generate address range information for builtin modules"
> +	depends on !LTO_CLANG_FULL
> +	depends on !LTO_CLANG_THIN
> +	select VMLINUX_MAP
> +	help
> +	 When modules are built into the kernel, there will be no module name
> +	 associated with its symbols in /proc/kallsyms.  Tracers may want to
> +	 identify symbols by module name and symbol name regardless of whether
> +	 the module is configured as loadable or not.
> +
> +	 This option generates modules.builtin.ranges in the build tree with
> +	 offset ranges (per ELF section) for the module(s) they belong to.
> +	 It also records an anchor symbol to determine the load address of the
> +	 section.
> +


> +	 It is fully compatible with CONFIG_RANDOMIZE_BASE and similar late-
> +	 address-modification options.

Hmm, is the above needed? Usually a comment like that is for incompatible
usages.

> +
>  config DEBUG_FORCE_WEAK_PER_CPU
>  	bool "Force weak per-cpu definitions"
>  	depends on DEBUG_KERNEL
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 49946cb96844..7e21162e9de1 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -33,6 +33,22 @@ targets += vmlinux
>  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
>  	+$(call if_changed_dep,link_vmlinux)
>  
> +# module.builtin.ranges
> +#
> ---------------------------------------------------------------------------
> +ifdef CONFIG_BUILTIN_MODULE_RANGES +__default: modules.builtin.ranges
> +
> +quiet_cmd_modules_builtin_ranges = GEN     $@
> +      cmd_modules_builtin_ranges = \
> +	$(srctree)/scripts/generate_builtin_ranges.awk $(real-prereqs) >
> $@ +
> +vmlinux.map: vmlinux
> +
> +targets += modules.builtin.ranges
> +modules.builtin.ranges: modules.builtin vmlinux.map vmlinux.o.map FORCE
> +	$(call if_changed,modules_builtin_ranges)
> +endif
> +
>  # Add FORCE to the prequisites of a target to force it to be always
> rebuilt. #
> --------------------------------------------------------------------------- 
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 6de297916ce6..252505505e0e 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
>  # Link of vmlinux.o used for section mismatch analysis
>  #
> --------------------------------------------------------------------------- 
> +vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
> +
>  quiet_cmd_ld_vmlinux.o = LD      $@
>        cmd_ld_vmlinux.o = \
>  	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> +	$(vmlinux-o-ld-args-y) \
>  	$(addprefix -T , $(initcalls-lds)) \
>  	--whole-archive vmlinux.a --no-whole-archive \
>  	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> new file mode 100755
> index 000000000000..9b647781d5fe
> --- /dev/null
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -0,0 +1,515 @@
> +#!/usr/bin/gawk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# generate_builtin_ranges.awk: Generate address range data for builtin modules +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> +#		vmlinux.o.map > modules.builtin.ranges
> +#

My only concern about this script is how fragile it may be. Is there any
possibility that the input files may change that will break this script,
and if so, is there a way we can detect and warn about it?

Other then that:

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve


> +
> +# Return the module name(s) (if any) associated with the given object.
> +#
> +# If we have seen this object before, return information from the cache.
> +# Otherwise, retrieve it from the corresponding .cmd file.
> +#
> +function get_module_info(fn, mod, obj, mfn, s) {
> +	if (fn in omod)
> +		return omod[fn];
> +
> +	if (match(fn, /\/[^/]+$/) == 0)
> +		return "";
> +
> +	obj = fn;
> +	mod = "";
> +	mfn = "";
> +	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> +	if (getline s <fn == 1) {
> +		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> +			mfn = substr(s, RSTART + 16, RLENGTH - 16);
> +			gsub(/['"]/, "", mfn);
> +
> +			mod = mfn;
> +			gsub(/([^/ ]*\/)+/, "", mod);
> +			gsub(/-/, "_", mod);
> +		}
> +	}
> +	close(fn);
> +
> +	# A single module (common case) also reflects objects that are not part
> +	# of a module.  Some of those objects have names that are also a module
> +	# name (e.g. core).  We check the associated module file name, and if
> +	# they do not match, the object is not part of a module.
> +	if (mod !~ / /) {
> +		if (!(mod in mods))
> +			mod = "";
> +		if (mods[mod] != mfn)
> +			mod = "";
> +	}
> +
> +	# At this point, mod is a single (valid) module name, or a list of
> +	# module names (that do not need validation).
> +	omod[obj] = mod;
> +	close(fn);
> +
> +	return mod;
> +}

