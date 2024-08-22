Return-Path: <linux-kbuild+bounces-3156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E929595BD60
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 19:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C83286169
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 17:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2431CEAC5;
	Thu, 22 Aug 2024 17:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzEyf6uQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93F1CCB36;
	Thu, 22 Aug 2024 17:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348082; cv=none; b=FDMpBzj+fBYbzdL08v2otEqYT3BUazKL9k0Q6YJyFkMT8VSnYxzoO0BF1kSjixSlzX8hFberp5H+3d0vAC6NyW5vcR27CTDSrngCJMujPx5csjhHrsh4oRUgkmZLbkLsLC8LFDK3/leKH5yEE9MkX1o8sArkA+aK2Vag4l1gxq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348082; c=relaxed/simple;
	bh=rahWFJeMcvXEHyx7jNcZStpXPA3pa18p17UBFBk8xtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taMNqVrSugesyGvrCrmbZjvB7pjWUo0ATnzByLLH+9YlScbjvz5dQnAyw4vbop85CnFlA7hauUNh8f+4ki94/tkru0TNUywbiM7SofKXfGcMGQyfdsYqMq5iRadc+p56LOBr7hVUU+U5PHCz7yEBDmkvWZ+fmYPQ+wUqSR/HTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzEyf6uQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D122C4AF0C;
	Thu, 22 Aug 2024 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724348082;
	bh=rahWFJeMcvXEHyx7jNcZStpXPA3pa18p17UBFBk8xtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VzEyf6uQ1Mr3OOQF+Jc5klfYyY7YGp2pKAIz522AEjbgffHyjHTHl9kzx0aWLGStv
	 q3ajF0yh41us8dyT5XeAyA7Oznuy88fLxOMD55ghzW3Et8XMQ3N5ebRA58QPahR1Pb
	 vkZRSUSsKnMbHvda1m0IBqYKXf973eOnUCXH/rdPn4eRW7GSKyfzSxGzqp8Qdm7azL
	 31AQoNig9nl68RxGwkmKTMh4cwpocj/PFiUOCZXurtviC8kxRROE0je9/2QiaJXGrR
	 ASFGO7Z2SgXQQRJZwwhyyh0Nt5jRk4RtLI4odOfVorMJXHpV1aTZGYOIvO1gWGqeQa
	 u4DD+D4l/k+wQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3f163e379so17505171fa.3;
        Thu, 22 Aug 2024 10:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU18RlR3X7OH2wjOAH096o4R+AdulA0ZWzbsQ7ITdq8HzPaffI8COJfnEBEI2jpeoACxOYBuSeC+mn+Af0=@vger.kernel.org, AJvYcCW1Plg0aZMElq4Q7n9GkqPIQD0msGAijONYsOfCzAusbnrUK5qQEM0L8sEkSoxesApG0U0aqpqfrwfirDjegdjK+XC3@vger.kernel.org, AJvYcCXXdxUJHR2t+rsNB1pQfK/Lm7a2QF3105H86+ELtD5iNqNP+LPNJ1M46UPHpXMHZrJ6zjpnIwjR/iwakTddVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmQwwBQqlMH7rmZgzrVGxE+TxYESr9BFN4/w6Hiq+xFAAQr/1B
	w3X5TOKznFvP1nyfOurIW0hoCNh7QwGyyQnpJfFDsh4/i0CJRhzHkP06Xy0OEqcrUfuOae59sf/
	3EzatVmtfjdVw33xkDTsoD+7zRi4=
X-Google-Smtp-Source: AGHT+IG0yd7j8ZcYnzo/5J5k1u9eHExoy9aGS6E79ggApFILT1GWudOVvzvPeOA5qyV9BShxLqQIin21+j/yT70RQ7Q=
X-Received: by 2002:a2e:b3d4:0:b0:2f3:c384:71ee with SMTP id
 38308e7fff4ca-2f405eef820mr22347761fa.33.1724348080675; Thu, 22 Aug 2024
 10:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821040700.1919317-1-kris.van.hees@oracle.com> <20240821040700.1919317-2-kris.van.hees@oracle.com>
In-Reply-To: <20240821040700.1919317-2-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 23 Aug 2024 02:34:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARsq1aT5jJnKRYscAMsp3aO5euykSU_yPF6ZLMaDoeHJw@mail.gmail.com>
Message-ID: <CAK7LNARsq1aT5jJnKRYscAMsp3aO5euykSU_yPF6ZLMaDoeHJw@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] kbuild: generate offset range data for builtin modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 1:11=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
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
>  - .*.cmd: build cmd file with KBUILD_MODFILE
>
> The generated data will look like:
>
> .text 00000000-00000000 =3D _text
> .text 0000baf0-0000cb10 amd_uncore
> .text 0009bd10-0009c8e0 iosf_mbi
> ...
> .text 00b9f080-00ba011a intel_skl_int3472_discrete
> .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps6=
8470
> .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
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
>     Changes since v6:
>      - Applied Masahiro Yamada's suggestions (Kconfig, makefile, script).
>
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
>  Documentation/process/changes.rst   |   7 +
>  lib/Kconfig.debug                   |  16 +
>  scripts/Makefile.vmlinux            |  18 +
>  scripts/Makefile.vmlinux_o          |   3 +
>  scripts/generate_builtin_ranges.awk | 506 ++++++++++++++++++++++++++++
>  5 files changed, 550 insertions(+)
>  create mode 100755 scripts/generate_builtin_ranges.awk
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/ch=
anges.rst
> index 3fc63f27c226..00f1ed7c59c3 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -64,6 +64,7 @@ GNU tar                1.28             tar --version
>  gtags (optional)       6.6.5            gtags --version
>  mkimage (optional)     2017.01          mkimage --version
>  Python (optional)      3.5.x            python3 --version
> +GNU AWK (optional)     5.1.0            gawk --version
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
>  .. [#f1] Sphinx is needed only to build the Kernel documentation
> @@ -192,6 +193,12 @@ platforms. The tool is available via the ``u-boot-to=
ols`` package or can be
>  built from the U-Boot source code. See the instructions at
>  https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-li=
nux
>
> +GNU AWK
> +-------
> +
> +GNU AWK is needed if you want kernel builds to generate address range da=
ta for
> +builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
> +
>  System utilities
>  ****************
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index a30c03a66172..f087dc3da321 100644
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


Forgot to mention this.

These two lines can be replaced with

         depends on !LTO






> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_built=
in_ranges.awk
> new file mode 100755
> index 000000000000..865cb7ac4970
> --- /dev/null
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -0,0 +1,506 @@
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
> +function get_module_info(fn, mod, obj, s) {
> +       if (fn in omod)
> +               return omod[fn];
> +
> +       if (match(fn, /\/[^/]+$/) =3D=3D 0)
> +               return "";
> +
> +       obj =3D fn;
> +       mod =3D "";
> +       fn =3D substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> +       if (getline s <fn =3D=3D 1) {
> +               if (match(s, /DKBUILD_MODFILE=3D['"]+[^'"]+/) > 0) {
> +                       mod =3D substr(s, RSTART + 16, RLENGTH - 16);
> +                       gsub(/['"]/, "", mod);
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
> +       }
> +
> +       gsub(/([^/ ]*\/)+/, "", mod);
> +       gsub(/-/, "_", mod);
> +
> +       # At this point, mod is a single (valid) module name, or a list o=
f
> +       # module names (that do not need validation).
> +       omod[obj] =3D mod;
> +       close(fn);


I still see the second close(fn).









--=20
Best Regards
Masahiro Yamada

