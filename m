Return-Path: <linux-kbuild+bounces-3075-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB5D955B20
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 08:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6E91F21586
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 06:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2341D515;
	Sun, 18 Aug 2024 06:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvFij+MP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C59B168B1;
	Sun, 18 Aug 2024 06:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723962015; cv=none; b=L6YxhtIO+uaFrh3xGiZGUpYe8cM/3v/UM6yW5CU/uJiU1v2gvGcXFIPFl3M3VE2v0M1qojFIK7iUutfc+6w+uubHb+sFn8yCrifY13Rt3S8LQwAHxcXGOKpwfJ+3m8MtvJ+jo7qbKECJjnfdOo/LHwbAdQ+pNQLAVlJsEeiwWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723962015; c=relaxed/simple;
	bh=xI+SQznXzxae2Z/zaoxSoRaXJXOQfYfuVjIm64v4zK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YM1jPu9QDbbB71r4S/qRJkbvkg83NRAgyfjFF9Bejh5SZdU506RJ59y5pdkt1jOJpuz4Gvi09DxHKsxq/d7NCEet8BRQSmXcnBmnIN87Za6iro5u8AegmX/LkoNJRC5TbMvhEgszNUFX38/Bv4Yb7nX4h4/2BGC54hBGorSOeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvFij+MP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C69C4AF09;
	Sun, 18 Aug 2024 06:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723962014;
	bh=xI+SQznXzxae2Z/zaoxSoRaXJXOQfYfuVjIm64v4zK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XvFij+MP+tmci/hNogwco1RKfrBe1BhtKJUmMCfAaySEGbYRL6Wn4X2klrw9+ROwF
	 jt1Pn8+O9DsVWOWEtAByeti30T/fKM53uXH4eY7gYZsOIWX2fxqDNqgDXYe/xifRiX
	 gvAXOeFCn6P3qNnAR5o+a+NuuEFoExRXaDxDoyhf/fGx7XPGk4NHamBo02BpQKLIb4
	 15AVg42+mQ8NYWHgYQAulF1cyLed2GKZmuAcWmtzclyRnuwMVVu6ohqHrWLq45UyRa
	 +6n/wXwrID7LTEPNtgc21TTardT7GyEAgKz2DZhIpYBE8VzCyj6eR9l0qqP5czPdNZ
	 dBtiOsVm09flQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52fc4388a64so4290757e87.1;
        Sat, 17 Aug 2024 23:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlPV9a002h9mCDz6tmISJgT/NMeqhCoB3eo0vdbxtzPif8uNCwa/hSe3yEAH6JayuEtYHgSMLdqNU7jPaApSl+I2I/lL9gzpwKkte2wFqBAzkszO6zoWF3sheDAdu9PGTpwWu3t4/5UYERokmvfJRypAqLdhHwW1tjTwcTxePHJo/YyyGHJCjdMyG60ycOAA==
X-Gm-Message-State: AOJu0YxxTFI2oBUoFT7oxwL1EhPM52EvA2J6gdeDLptjsKWD8Sx35OSv
	ht+yTMqXYIPGXbkvVw/8ZQfMyExBtzxJsgPAtiatWk8VYA0MdRH8gMO2arWXqtH2UBJ754JDMIi
	Cus7JnBjI65UAVUtSMg/faaQb6jM=
X-Google-Smtp-Source: AGHT+IH+40jYjLdLycHen7TvRyHtczsqhOuddgIfSmB7THmjjEnYu6sYAOhqSXdhqsVeBU81JtYKDnxBkt0vD3VTNc0=
X-Received: by 2002:a05:6512:2310:b0:52f:df:db40 with SMTP id
 2adb3069b0e04-5331c6f1073mr4607476e87.56.1723962013372; Sat, 17 Aug 2024
 23:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815150339.1564769-1-kris.van.hees@oracle.com> <20240815150339.1564769-3-kris.van.hees@oracle.com>
In-Reply-To: <20240815150339.1564769-3-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 18 Aug 2024 15:19:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARsJgcEsTdeKxe9MtBeCPp6dCNrOArJRBievo954p33LQ@mail.gmail.com>
Message-ID: <CAK7LNARsJgcEsTdeKxe9MtBeCPp6dCNrOArJRBievo954p33LQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] kbuild, kconfig: generate offset range data for
 builtin modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: multipart/mixed; boundary="0000000000006a0082061fef2f9b"

--0000000000006a0082061fef2f9b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 12:04=E2=80=AFAM Kris Van Hees <kris.van.hees@oracl=
e.com> wrote:


The subject should be:
"kbuild: generate offset range data for builtin modules"


(Drop ", kconfig")




>
> Create file module.builtin.ranges that can be used to find where
> built-in modules are located by their addresses. This will be useful for
> tracing tools to find what functions are for various built-in modules.
>
> The offset range data for builtin modules is generated using:
>  - modules.builtin: associates object files with module names
>  - vmlinux.map: provides load order of sections and offset of first membe=
r
>     per section
>  - vmlinux.o.map: provides offset of object file content per section
>  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME


I do not see "KBUILD_MODNAME" in the code.
It only checks "KUILD_MODFILE".





>
> The generated data will look like:
>
> .text 00000000-00000000 =3D _text
> .text 0000baf0-0000cb10 amd_uncore
> .text 0009bd10-0009c8e0 iosf_mbi
> ...
> .text 008e6660-008e9630 snd_soc_wcd_mbhc
> .text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x



It is good to note that multiple module names appear
in one line, but the instance (snd_soc_wcd933*) no longer
occurs since 11b0b802f8e38d48ca74d520028add81263f003e.


I recommend to replace the output snippet with:


.text 00b9f080-00ba011a intel_skl_int3472_discrete
.text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps684=
70
.text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470


This still happens when CONFIG_INTEL_SKL_INT3472=3Dy.





> .text 008ea610-008ea780 snd_soc_wcd9335
> ...
> .data 00000000-00000000 =3D _sdata
> .data 0000f020-0000f680 amd_uncore
>
> For each ELF section, it lists the offset of the first symbol.  This can
> be used to determine the base address of the section at runtime.
>
> Next, it lists (in strict ascending order) offset ranges in that section
> that cover the symbols of one or more builtin modules.  Multiple ranges
> can apply to a single module, and ranges can be shared between modules.
>
> The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range dat=
a
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
>      -DKBUILD_MODFILE=3D<kmodfile> present in its build command, and thos=
e
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
>           - If we were working on the same module(s), extend the range
>             to include this object
>           - If we were working on another module(s), close that range,
>             and start the new one
>       - If the symbol does not belong to any built-in modules:
>           - If we were working on a module(s) range, close that range
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>     Changes since v5:
>      - Removed unnecessary compatibility info from option description.
>
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
>      - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THI=
N)=3Dy
>      - Support LLVM (lld) compiles in generate_builtin_ranges.awk
>      - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=3Dy
>
>     Changes since v2:
>      - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
>      - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modi=
nfo
>      - Switched from using modules.builtin.objs to parsing .*.cmd files
>      - Parse data from .*.cmd in generate_builtin_ranges.awk
>      - Use $(real-prereqs) rather than $(filter-out ...)
> ---

>  System utilities

> index a30c03a66172..dcdf14ffe031 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -571,6 +571,22 @@ config VMLINUX_MAP
>           pieces of code get eliminated with
>           CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
>
> +config BUILTIN_MODULE_RANGES
> +       bool "Generate address range information for builtin modules"
> +       depends on !LTO_CLANG_FULL
> +       depends on !LTO_CLANG_THIN
> +       select VMLINUX_MAP


I still got

"WARNING: unmet direct dependencies detected for VMLINUX_MAP"


I suggested "depends on VMLINUX_MAP" instead of "select VMLINUX_MAP".



https://lore.kernel.org/linux-kbuild/202405150623.lmS5sVhM-lkp@intel.com/

https://lore.kernel.org/linux-kbuild/CAK7LNAST_SbaN9WQRM_k0xE1MUReJvn9AMSg4=
A1-9b9xotf67w@mail.gmail.com/








> +       help
> +        When modules are built into the kernel, there will be no module =
name
> +        associated with its symbols in /proc/kallsyms.  Tracers may want=
 to
> +        identify symbols by module name and symbol name regardless of wh=
ether
> +        the module is configured as loadable or not.
> +
> +        This option generates modules.builtin.ranges in the build tree w=
ith
> +        offset ranges (per ELF section) for the module(s) they belong to=
.
> +        It also records an anchor symbol to determine the load address o=
f the
> +        section.
> +
>  config DEBUG_FORCE_WEAK_PER_CPU
>         bool "Force weak per-cpu definitions"
>         depends on DEBUG_KERNEL
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 49946cb96844..7e21162e9de1 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -33,6 +33,22 @@ targets +=3D vmlinux
>  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
>         +$(call if_changed_dep,link_vmlinux)
>
> +# module.builtin.ranges
> +# ----------------------------------------------------------------------=
-----
> +ifdef CONFIG_BUILTIN_MODULE_RANGES
> +__default: modules.builtin.ranges
> +
> +quiet_cmd_modules_builtin_ranges =3D GEN     $@
> +      cmd_modules_builtin_ranges =3D \
> +       $(srctree)/scripts/generate_builtin_ranges.awk $(real-prereqs) > =
$@
> +
> +vmlinux.map: vmlinux


This should be:


vmlinux.map: vmlinux
        @:


Otherwise, GNU Make would try to find a pattern rule
to update vmlinux.map.





> +
> +targets +=3D modules.builtin.ranges
> +modules.builtin.ranges: modules.builtin vmlinux.map vmlinux.o.map FORCE
> +       $(call if_changed,modules_builtin_ranges)



Presumably, modules.builtin.ranges should be regenerated when
scripts/generate_builtin_ranges.awk is changed.


Maybe, you can do this:


quiet_cmd_modules_builtin_ranges =3D GEN     $@
      cmd_modules_builtin_ranges =3D $(real-prereqs) > $@

targets +=3D modules.builtin.ranges
modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
                        modules.builtin vmlinux.map vmlinux.o.map FORCE
        $(call if_changed,modules_builtin_ranges)




> +endif
> +
>  # Add FORCE to the prequisites of a target to force it to be always rebu=
ilt.
>  # ----------------------------------------------------------------------=
-----
>
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 6de297916ce6..252505505e0e 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -45,9 +45,12 @@ objtool-args =3D $(vmlinux-objtool-args-y) --link
>  # Link of vmlinux.o used for section mismatch analysis
>  # ----------------------------------------------------------------------=
-----
>
> +vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)      +=3D -Map=3D$@.ma=
p
> +
>  quiet_cmd_ld_vmlinux.o =3D LD      $@
>        cmd_ld_vmlinux.o =3D \
>         $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> +       $(vmlinux-o-ld-args-y) \
>         $(addprefix -T , $(initcalls-lds)) \
>         --whole-archive vmlinux.a --no-whole-archive \
>         --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_built=
in_ranges.awk
> new file mode 100755
> index 000000000000..9b647781d5fe
> --- /dev/null
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -0,0 +1,515 @@
> +#!/usr/bin/gawk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# generate_builtin_ranges.awk: Generate address range data for builtin m=
odules
> +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> +#              vmlinux.o.map > modules.builtin.ranges
> +#
> +
> +# Return the module name(s) (if any) associated with the given object.
> +#
> +# If we have seen this object before, return information from the cache.
> +# Otherwise, retrieve it from the corresponding .cmd file.
> +#
> +function get_module_info(fn, mod, obj, mfn, s) {
> +       if (fn in omod)
> +               return omod[fn];
> +
> +       if (match(fn, /\/[^/]+$/) =3D=3D 0)
> +               return "";
> +
> +       obj =3D fn;
> +       mod =3D "";
> +       mfn =3D "";
> +       fn =3D substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> +       if (getline s <fn =3D=3D 1) {
> +               if (match(s, /DKBUILD_MODFILE=3D['"]+[^'"]+/) > 0) {
> +                       mfn =3D substr(s, RSTART + 16, RLENGTH - 16);
> +                       gsub(/['"]/, "", mfn);
> +
> +                       mod =3D mfn;
> +                       gsub(/([^/ ]*\/)+/, "", mod);
> +                       gsub(/-/, "_", mod);
> +               }
> +       }
> +       close(fn);
> +
> +       # A single module (common case) also reflects objects that are no=
t part
> +       # of a module.  Some of those objects have names that are also a =
module
> +       # name (e.g. core).  We check the associated module file name, an=
d if
> +       # they do not match, the object is not part of a module.
> +       if (mod !~ / /) {
> +               if (!(mod in mods))
> +                       mod =3D "";
> +               if (mods[mod] !=3D mfn)
> +                       mod =3D "";
> +       }
> +
> +       # At this point, mod is a single (valid) module name, or a list o=
f
> +       # module names (that do not need validation).
> +       omod[obj] =3D mod;
> +       close(fn);


Is this "close(fn)" necessary?
I see it a few lines above too.




The code became way simpler since my previous review, but
I think this is still redundant.

You do not need to check both of modname and its path.

I attached a patch for code refactoring.





--
Best Regards

Masahiro Yamada

--0000000000006a0082061fef2f9b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-fixup-modules.builtin.ranges.patch"
Content-Disposition: attachment; 
	filename="0001-fixup-modules.builtin.ranges.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lzz6euy00>
X-Attachment-Id: f_lzz6euy00

RnJvbSBmY2RjNDU5Y2U0YzdlYjg0NTQ5ZTQ1Y2YwNmEzYTQ0ZjkwYWEzY2Y5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBGcmksIDE2IEF1ZyAyMDI0IDIzOjU1OjUxICswOTAwClN1YmplY3Q6IFtQQVRDSF0g
Zml4dXAgbW9kdWxlcy5idWlsdGluLnJhbmdlcwoKU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFt
YWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KLS0tCiBsaWIvS2NvbmZpZy5kZWJ1ZyAgICAgICAg
ICAgICAgICAgICB8ICAyICstCiBzY3JpcHRzL01ha2VmaWxlLnZtbGludXggICAgICAgICAgICB8
IDEyICsrKysrKystLS0tLQogc2NyaXB0cy9nZW5lcmF0ZV9idWlsdGluX3Jhbmdlcy5hd2sgfCAy
NSArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmRlYnVnIGIv
bGliL0tjb25maWcuZGVidWcKaW5kZXggZGNkZjE0ZmZlMDMxLi5mMDg3ZGMzZGEzMjEgMTAwNjQ0
Ci0tLSBhL2xpYi9LY29uZmlnLmRlYnVnCisrKyBiL2xpYi9LY29uZmlnLmRlYnVnCkBAIC01NzUs
NyArNTc1LDcgQEAgY29uZmlnIEJVSUxUSU5fTU9EVUxFX1JBTkdFUwogCWJvb2wgIkdlbmVyYXRl
IGFkZHJlc3MgcmFuZ2UgaW5mb3JtYXRpb24gZm9yIGJ1aWx0aW4gbW9kdWxlcyIKIAlkZXBlbmRz
IG9uICFMVE9fQ0xBTkdfRlVMTAogCWRlcGVuZHMgb24gIUxUT19DTEFOR19USElOCi0Jc2VsZWN0
IFZNTElOVVhfTUFQCisJZGVwZW5kcyBvbiBWTUxJTlVYX01BUAogCWhlbHAKIAkgV2hlbiBtb2R1
bGVzIGFyZSBidWlsdCBpbnRvIHRoZSBrZXJuZWwsIHRoZXJlIHdpbGwgYmUgbm8gbW9kdWxlIG5h
bWUKIAkgYXNzb2NpYXRlZCB3aXRoIGl0cyBzeW1ib2xzIGluIC9wcm9jL2thbGxzeW1zLiAgVHJh
Y2VycyBtYXkgd2FudCB0bwpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4IGIv
c2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4CmluZGV4IDdlMjExNjJlOWRlMS4uN2U4YjcwMzc5OWM4
IDEwMDY0NAotLS0gYS9zY3JpcHRzL01ha2VmaWxlLnZtbGludXgKKysrIGIvc2NyaXB0cy9NYWtl
ZmlsZS52bWxpbnV4CkBAIC0zOSwxNCArMzksMTYgQEAgaWZkZWYgQ09ORklHX0JVSUxUSU5fTU9E
VUxFX1JBTkdFUwogX19kZWZhdWx0OiBtb2R1bGVzLmJ1aWx0aW4ucmFuZ2VzCiAKIHF1aWV0X2Nt
ZF9tb2R1bGVzX2J1aWx0aW5fcmFuZ2VzID0gR0VOICAgICAkQAotICAgICAgY21kX21vZHVsZXNf
YnVpbHRpbl9yYW5nZXMgPSBcCi0JJChzcmN0cmVlKS9zY3JpcHRzL2dlbmVyYXRlX2J1aWx0aW5f
cmFuZ2VzLmF3ayAkKHJlYWwtcHJlcmVxcykgPiAkQAotCi12bWxpbnV4Lm1hcDogdm1saW51eAor
ICAgICAgY21kX21vZHVsZXNfYnVpbHRpbl9yYW5nZXMgPSAkKHJlYWwtcHJlcmVxcykgPiAkQAog
CiB0YXJnZXRzICs9IG1vZHVsZXMuYnVpbHRpbi5yYW5nZXMKLW1vZHVsZXMuYnVpbHRpbi5yYW5n
ZXM6IG1vZHVsZXMuYnVpbHRpbiB2bWxpbnV4Lm1hcCB2bWxpbnV4Lm8ubWFwIEZPUkNFCittb2R1
bGVzLmJ1aWx0aW4ucmFuZ2VzOiAkKHNyY3RyZWUpL3NjcmlwdHMvZ2VuZXJhdGVfYnVpbHRpbl9y
YW5nZXMuYXdrIFwKKwkJCW1vZHVsZXMuYnVpbHRpbiB2bWxpbnV4Lm1hcCB2bWxpbnV4Lm8ubWFw
IEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQsbW9kdWxlc19idWlsdGluX3JhbmdlcykKKwordm1s
aW51eC5tYXA6IHZtbGludXgKKwlAOgorCiBlbmRpZgogCiAjIEFkZCBGT1JDRSB0byB0aGUgcHJl
cXVpc2l0ZXMgb2YgYSB0YXJnZXQgdG8gZm9yY2UgaXQgdG8gYmUgYWx3YXlzIHJlYnVpbHQuCmRp
ZmYgLS1naXQgYS9zY3JpcHRzL2dlbmVyYXRlX2J1aWx0aW5fcmFuZ2VzLmF3ayBiL3NjcmlwdHMv
Z2VuZXJhdGVfYnVpbHRpbl9yYW5nZXMuYXdrCmluZGV4IDliNjQ3NzgxZDVmZS4uODY1Y2I3YWM0
OTcwIDEwMDc1NQotLS0gYS9zY3JpcHRzL2dlbmVyYXRlX2J1aWx0aW5fcmFuZ2VzLmF3aworKysg
Yi9zY3JpcHRzL2dlbmVyYXRlX2J1aWx0aW5fcmFuZ2VzLmF3awpAQCAtMTIsNyArMTIsNyBAQAog
IyBJZiB3ZSBoYXZlIHNlZW4gdGhpcyBvYmplY3QgYmVmb3JlLCByZXR1cm4gaW5mb3JtYXRpb24g
ZnJvbSB0aGUgY2FjaGUuCiAjIE90aGVyd2lzZSwgcmV0cmlldmUgaXQgZnJvbSB0aGUgY29ycmVz
cG9uZGluZyAuY21kIGZpbGUuCiAjCi1mdW5jdGlvbiBnZXRfbW9kdWxlX2luZm8oZm4sIG1vZCwg
b2JqLCBtZm4sIHMpIHsKK2Z1bmN0aW9uIGdldF9tb2R1bGVfaW5mbyhmbiwgbW9kLCBvYmosIHMp
IHsKIAlpZiAoZm4gaW4gb21vZCkKIAkJcmV0dXJuIG9tb2RbZm5dOwogCkBAIC0yMSwxNiArMjEs
MTEgQEAgZnVuY3Rpb24gZ2V0X21vZHVsZV9pbmZvKGZuLCBtb2QsIG9iaiwgbWZuLCBzKSB7CiAK
IAlvYmogPSBmbjsKIAltb2QgPSAiIjsKLQltZm4gPSAiIjsKIAlmbiA9IHN1YnN0cihmbiwgMSwg
UlNUQVJUKSAiLiIgc3Vic3RyKGZuLCBSU1RBUlQgKyAxKSAiLmNtZCI7CiAJaWYgKGdldGxpbmUg
cyA8Zm4gPT0gMSkgewogCQlpZiAobWF0Y2gocywgL0RLQlVJTERfTU9ERklMRT1bJyJdK1teJyJd
Ky8pID4gMCkgewotCQkJbWZuID0gc3Vic3RyKHMsIFJTVEFSVCArIDE2LCBSTEVOR1RIIC0gMTYp
OwotCQkJZ3N1YigvWyciXS8sICIiLCBtZm4pOwotCi0JCQltb2QgPSBtZm47Ci0JCQlnc3ViKC8o
W14vIF0qXC8pKy8sICIiLCBtb2QpOwotCQkJZ3N1YigvLS8sICJfIiwgbW9kKTsKKwkJCW1vZCA9
IHN1YnN0cihzLCBSU1RBUlQgKyAxNiwgUkxFTkdUSCAtIDE2KTsKKwkJCWdzdWIoL1snIl0vLCAi
IiwgbW9kKTsKIAkJfQogCX0KIAljbG9zZShmbik7CkBAIC00MiwxMCArMzcsMTEgQEAgZnVuY3Rp
b24gZ2V0X21vZHVsZV9pbmZvKGZuLCBtb2QsIG9iaiwgbWZuLCBzKSB7CiAJaWYgKG1vZCAhfiAv
IC8pIHsKIAkJaWYgKCEobW9kIGluIG1vZHMpKQogCQkJbW9kID0gIiI7Ci0JCWlmIChtb2RzW21v
ZF0gIT0gbWZuKQotCQkJbW9kID0gIiI7CiAJfQogCisJZ3N1YigvKFteLyBdKlwvKSsvLCAiIiwg
bW9kKTsKKwlnc3ViKC8tLywgIl8iLCBtb2QpOworCiAJIyBBdCB0aGlzIHBvaW50LCBtb2QgaXMg
YSBzaW5nbGUgKHZhbGlkKSBtb2R1bGUgbmFtZSwgb3IgYSBsaXN0IG9mCiAJIyBtb2R1bGUgbmFt
ZXMgKHRoYXQgZG8gbm90IG5lZWQgdmFsaWRhdGlvbikuCiAJb21vZFtvYmpdID0gbW9kOwpAQCAt
NzYsMTggKzcyLDEzIEBAIGZ1bmN0aW9uIHVwZGF0ZV9lbnRyeShvc2VjdCwgbW9kLCBzb2ZmLCBl
b2ZmLCBzZWN0LCBpZHgpIHsKICMKICMgTGluZXMgd2lsbCBiZSBsaWtlOgogIwlrZXJuZWwvY3J5
cHRvL2x6by1ybGUua28KLSMgYW5kIHdlIGRlcml2ZSB0aGUgYnVpbHQtaW4gbW9kdWxlIG5hbWUg
ZnJvbSB0aGlzIGFzICJsem9fcmxlIiBhbmQgYXNzb2NpYXRlCi0jIGl0IHdpdGggb2JqZWN0IG5h
bWUgImNyeXB0by9sem8tcmxlIi4KKyMgYW5kIHdlIHJlY29yZCB0aGUgb2JqZWN0IG5hbWUgImNy
eXB0by9sem8tcmxlIi4KICMKIEFSR0lORCA9PSAxIHsKIAlzdWIoL2tlcm5lbFwvLywgIiIpOwkJ
CSMgc3RyaXAgb2ZmICJrZXJuZWwvIiBwcmVmaXgKIAlzdWIoL1wua28kLywgIiIpOwkJCSMgc3Ry
aXAgb2ZmIC5rbyBzdWZmaXgKIAotCW1vZCA9ICQxOwotCXN1YigvKFteL10qXC8pKy8sICIiLCBt
b2QpOwkJIyBtb2QgPSBiYXNlbmFtZSgkMSkKLQlnc3ViKC8tLywgIl8iLCBtb2QpOwkJCSMgQ29u
dmVydCAtIHRvIF8KLQotCW1vZHNbbW9kXSA9ICQxOworCW1vZHNbJDFdID0gMTsKIAluZXh0Owog
fQogCi0tIAoyLjQzLjAKCg==
--0000000000006a0082061fef2f9b--

