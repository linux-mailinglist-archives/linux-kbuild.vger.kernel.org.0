Return-Path: <linux-kbuild+bounces-3639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3F97CF9E
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 02:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5E31286D20
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 00:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B91C4C69;
	Fri, 20 Sep 2024 00:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nF4ozgw0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138CE79C0;
	Fri, 20 Sep 2024 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726791839; cv=none; b=tE7mYPlyPrj0cpYqhj0QZL1BdJhYfVF6WAGAiekxP010cQmECSPwCZ5OESSD8DxTLsEOk4F3tUMwmwKI3/9tW0N6++sAHmI9XY4usoHH7dapsaGUFpZLu2+9ryNOoPaywMCMFU1dZvNrVw7QqE/7Pi9lqwir+HKVt3t+4y/y7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726791839; c=relaxed/simple;
	bh=3NfPHzF3SGB4XE69q0uHaj+1S2KtdnYkHBDkrfexqeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKNXZ5926X3MwdDYH+6peqb+yJcq7pWRCqgeLWn4bkeryFvjFaazE8qttgoxFgU2EoBlo9zOSr5U5x/uwXToYt4R0ABZZj0mBLGWKbCEP3ombPmVjJHeobg1tbwSQ52U7x5qHALCp4ks0yEhd5J+54HKQhyZyzhJxMASYvhwb/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nF4ozgw0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BACC4CECE;
	Fri, 20 Sep 2024 00:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726791838;
	bh=3NfPHzF3SGB4XE69q0uHaj+1S2KtdnYkHBDkrfexqeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nF4ozgw0eA5+yMiQ0h8MqO2IXNAkgtSR65D1T5Oo7bbgwNr3eUZpiADUwmf9cexCZ
	 GQWFc3V+fkoBFSORf8pKJ+AfX+ZQKfPziRD3mdkuGVswP87bjLlU94WRfwYSHrb/eH
	 Cpbmd07TeKiju9nR07ktE6ldoRImzyGcMb3hgH+DFFbSjqwLJOFAxMCUmeagjrUwSt
	 s5471HmTl1EpA9F7zF18BNr/hcLKS7bMeTn+GX/c2KKPT1Gjmc0UENStXHVh0hdyXX
	 WyzaV3Uy2LvyvN8+yD/LIGw8GTKirqi4ZFAEh4cm3iLG/Z4FkXvdK53D8uCRUy6tTw
	 JMotHH6tOQwgA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53653ff0251so1703600e87.0;
        Thu, 19 Sep 2024 17:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKSPoDw5rlCKSSk68jqCJ/qqpTUabRkTS8JQtlzTv753LQ9EyI0HPAOcdbt/IWBeEvGXgCb5Y4J8oCV8DA@vger.kernel.org, AJvYcCV7XIXQ6m5pjmtK2FeoSHCp7ZjR7+poTCKQ0R2NBxculaGKVhsNFecc80l+0i9OvkuGhtaGW+90cgnLXCk=@vger.kernel.org, AJvYcCW+0okf2A1xMRJjwUfKuB/EVc0MPTZ9QZgeJCut7rsu1A3fE2KR8vUi9JEiefbX7m+nrMxkKjYZuN5HpRDbTg==@vger.kernel.org, AJvYcCXt6mzDjdZG6W9BSpZLkClcLISk+Q7t1q0qW/QwPVHHf1IkWTKc8AjqaWsgvo3bNmnK0tG0qyGYpxQQ7muyQC+lRu0L@vger.kernel.org
X-Gm-Message-State: AOJu0YydOXjKQ7msH18t4u+Ea9Ov7cs+BIyeoWqyZzKNShNu43okVhRJ
	PBuSk2L82x8zdDZPzcZJcg/ii9fo8U92CO+/X9AqYAs+yMCM6e1vlhePmokIqdiOSHmv5CUUe3e
	nvqwAu+gS1z/B5JBhv60wm42xhUA=
X-Google-Smtp-Source: AGHT+IFahxARF4XW67mJb9s0KbE3GT1O8Y0OHyb+rFbeP9ZK7ERW9zuudZB1hVgi+ys7b8hvUHvhbZjX9bva0N1Fvsc=
X-Received: by 2002:a05:6512:158e:b0:533:d3e:16f5 with SMTP id
 2adb3069b0e04-536ac334255mr571535e87.38.1726791837087; Thu, 19 Sep 2024
 17:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
 <CGME20240919170739eucas1p1213d18f662c5370f71887fa1a5936409@eucas1p1.samsung.com>
 <20240906144506.1151789-3-kris.van.hees@oracle.com> <20240919170737.3oe2teklabpz54hx@AALNPWDAGOMEZ1.aal.scsc.local>
 <CAK7LNAR_TKY+eiW6C_9DhDKY=7x9zmh=CMEM3fVSL6n26ruEjQ@mail.gmail.com> <87ldzncy8l.fsf@gentoo.org>
In-Reply-To: <87ldzncy8l.fsf@gentoo.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Sep 2024 09:23:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRYSdoOc-NBT0EsEzt9NY_H8v_=CNBFOUaVsrRZTAmaw@mail.gmail.com>
Message-ID: <CAK7LNATRYSdoOc-NBT0EsEzt9NY_H8v_=CNBFOUaVsrRZTAmaw@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] kbuild: generate offset range data for builtin modules
To: Sam James <sam@gentoo.org>
Cc: Daniel Gomez <da.gomez@samsung.com>, Kris Van Hees <kris.van.hees@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 3:08=E2=80=AFAM Sam James <sam@gentoo.org> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > On Fri, Sep 20, 2024 at 2:07=E2=80=AFAM Daniel Gomez <da.gomez@samsung.=
com> wrote:
> >>
> >> On Fri, Sep 06, 2024 at 10:45:03AM -0400, Kris Van Hees wrote:
> >> > Create file module.builtin.ranges that can be used to find where
> >> > built-in modules are located by their addresses. This will be useful=
 for
> >> > tracing tools to find what functions are for various built-in module=
s.
> >> >
> >> > The offset range data for builtin modules is generated using:
> >> >  - modules.builtin: associates object files with module names
> >> >  - vmlinux.map: provides load order of sections and offset of first =
member
> >> >     per section
> >> >  - vmlinux.o.map: provides offset of object file content per section
> >> >  - .*.cmd: build cmd file with KBUILD_MODFILE
> >> >
> >> > The generated data will look like:
> >> >
> >> > .text 00000000-00000000 =3D _text
> >> > .text 0000baf0-0000cb10 amd_uncore
> >> > .text 0009bd10-0009c8e0 iosf_mbi
> >> > ...
> >> > .text 00b9f080-00ba011a intel_skl_int3472_discrete
> >> > .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472=
_tps68470
> >> > .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
> >> > ...
> >> > .data 00000000-00000000 =3D _sdata
> >> > .data 0000f020-0000f680 amd_uncore
> >> >
> >> > For each ELF section, it lists the offset of the first symbol.  This=
 can
> >> > be used to determine the base address of the section at runtime.
> >> >
> >> > Next, it lists (in strict ascending order) offset ranges in that sec=
tion
> >> > that cover the symbols of one or more builtin modules.  Multiple ran=
ges
> >> > can apply to a single module, and ranges can be shared between modul=
es.
> >> >
> >> > The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset rang=
e data
> >> > is generated for kernel modules that are built into the kernel image=
.
> >> >
> >> > How it works:
> >> >
> >> >  1. The modules.builtin file is parsed to obtain a list of built-in
> >> >     module names and their associated object names (the .ko file tha=
t
> >> >     the module would be in if it were a loadable module, hereafter
> >> >     referred to as <kmodfile>).  This object name can be used to
> >> >     identify objects in the kernel compile because any C or assemble=
r
> >> >     code that ends up into a built-in module will have the option
> >> >     -DKBUILD_MODFILE=3D<kmodfile> present in its build command, and =
those
> >> >     can be found in the .<obj>.cmd file in the kernel build tree.
> >> >
> >> >     If an object is part of multiple modules, they will all be liste=
d
> >> >     in the KBUILD_MODFILE option argument.
> >> >
> >> >     This allows us to conclusively determine whether an object in th=
e
> >> >     kernel build belong to any modules, and which.
> >> >
> >> >  2. The vmlinux.map is parsed next to determine the base address of =
each
> >> >     top level section so that all addresses into the section can be
> >> >     turned into offsets.  This makes it possible to handle sections
> >> >     getting loaded at different addresses at system boot.
> >> >
> >> >     We also determine an 'anchor' symbol at the beginning of each
> >> >     section to make it possible to calculate the true base address o=
f
> >> >     a section at runtime (i.e. symbol address - symbol offset).
> >> >
> >> >     We collect start addresses of sections that are included in the =
top
> >> >     level section.  This is used when vmlinux is linked using vmlinu=
x.o,
> >> >     because in that case, we need to look at the vmlinux.o linker ma=
p to
> >> >     know what object a symbol is found in.
> >> >
> >> >     And finally, we process each symbol that is listed in vmlinux.ma=
p
> >> >     (or vmlinux.o.map) based on the following structure:
> >> >
> >> >     vmlinux linked from vmlinux.a:
> >> >
> >> >       vmlinux.map:
> >> >         <top level section>
> >> >           <included section>  -- might be same as top level section)
> >> >             <object>          -- built-in association known
> >> >               <symbol>        -- belongs to module(s) object belongs=
 to
> >> >               ...
> >> >
> >> >     vmlinux linked from vmlinux.o:
> >> >
> >> >       vmlinux.map:
> >> >         <top level section>
> >> >           <included section>  -- might be same as top level section)
> >> >             vmlinux.o         -- need to use vmlinux.o.map
> >> >               <symbol>        -- ignored
> >> >               ...
> >> >
> >> >       vmlinux.o.map:
> >> >         <section>
> >> >             <object>          -- built-in association known
> >> >               <symbol>        -- belongs to module(s) object belongs=
 to
> >> >               ...
> >> >
> >> >  3. As sections, objects, and symbols are processed, offset ranges a=
re
> >> >     constructed in a straight-forward way:
> >> >
> >> >       - If the symbol belongs to one or more built-in modules:
> >> >           - If we were working on the same module(s), extend the ran=
ge
> >> >             to include this object
> >> >           - If we were working on another module(s), close that rang=
e,
> >> >             and start the new one
> >> >       - If the symbol does not belong to any built-in modules:
> >> >           - If we were working on a module(s) range, close that rang=
e
> >> >
> >> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> >> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> >> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> >> > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> >> > Tested-by: Sam James <sam@gentoo.org>
> >> > ---
> >> >
> >> > Notes:
> >> >     Changes since v9:
> >> >      - Reverted support for build directory as optional 4th argument=
.
> >> >      - Added modules.builtin.ranges and vmlinux.o.map to CLEAN_FILES=
.
> >> >      - Fixed support for sparc64.
> >> >
> >> >     Changes since v8:
> >> >      - Added support for built-in Rust modules.
> >> >      - Added optional 4th argument to specify kernel build directory=
.
> >> >
> >> >     Changes since v7:
> >> >      - Removed extra close(fn).
> >> >      - Make CONFIG_BUILTIN_MODULE_RANGES depend on !lTO.
> >> >
> >> >     Changes since v6:
> >> >      - Applied Masahiro Yamada's suggestions (Kconfig, makefile, scr=
ipt).
> >> >
> >> >     Changes since v5:
> >> >      - Removed unnecessary compatibility info from option descriptio=
n.
> >> >
> >> >     Changes since v4:
> >> >      - Improved commit description to explain the why and how.
> >> >      - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RA=
NGES.
> >> >      - Improved comments in generate_builtin_ranges.awk
> >> >      - Improved logic in generate_builtin_ranges.awk to handle incor=
rect
> >> >        object size information in linker maps
> >> >
> >> >     Changes since v3:
> >> >      - Consolidated patches 2 through 5 into a single patch
> >> >      - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
> >> >      - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
> >> >      - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FUL=
L|THIN)=3Dy
> >> >      - Support LLVM (lld) compiles in generate_builtin_ranges.awk
> >> >      - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=3Dy
> >> >
> >> >     Changes since v2:
> >> >      - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_R=
ANGES
> >> >      - 1st arg to generate_builtin_ranges.awk is now modules.builtin=
.modinfo
> >> >      - Switched from using modules.builtin.objs to parsing .*.cmd fi=
les
> >> >      - Parse data from .*.cmd in generate_builtin_ranges.awk
> >> >      - Use $(real-prereqs) rather than $(filter-out ...)
> >> >     ---
> >> >
> >> >  Documentation/process/changes.rst   |   7 +
> >> >  Makefile                            |   1 +
> >> >  lib/Kconfig.debug                   |  15 +
> >> >  scripts/Makefile.vmlinux            |  18 +
> >> >  scripts/Makefile.vmlinux_o          |   3 +
> >> >  scripts/generate_builtin_ranges.awk | 508 +++++++++++++++++++++++++=
+++
> >> >  6 files changed, 552 insertions(+)
> >> >  create mode 100755 scripts/generate_builtin_ranges.awk
> >> >
> >> > diff --git a/Documentation/process/changes.rst b/Documentation/proce=
ss/changes.rst
> >> > index 3fc63f27c226..00f1ed7c59c3 100644
> >> > --- a/Documentation/process/changes.rst
> >> > +++ b/Documentation/process/changes.rst
> >> > @@ -64,6 +64,7 @@ GNU tar                1.28             tar --vers=
ion
> >> >  gtags (optional)       6.6.5            gtags --version
> >> >  mkimage (optional)     2017.01          mkimage --version
> >> >  Python (optional)      3.5.x            python3 --version
> >> > +GNU AWK (optional)     5.1.0            gawk --version
> >> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >> >
> >> >  .. [#f1] Sphinx is needed only to build the Kernel documentation
> >> > @@ -192,6 +193,12 @@ platforms. The tool is available via the ``u-bo=
ot-tools`` package or can be
> >> >  built from the U-Boot source code. See the instructions at
> >> >  https://docs.u-boot.org/en/latest/build/tools.html#building-tools-f=
or-linux
> >> >
> >> > +GNU AWK
> >> > +-------
> >> > +
> >> > +GNU AWK is needed if you want kernel builds to generate address ran=
ge data for
> >> > +builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
> >> > +
> >> >  System utilities
> >> >  ****************
> >> >
> >> > diff --git a/Makefile b/Makefile
> >> > index d57cfc6896b8..ec98a1e5b257 100644
> >> > --- a/Makefile
> >> > +++ b/Makefile
> >> > @@ -1482,6 +1482,7 @@ endif # CONFIG_MODULES
> >> >  # Directories & files removed with 'make clean'
> >> >  CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >> >              modules.builtin modules.builtin.modinfo modules.nsdeps =
\
> >> > +            modules.builtin.ranges vmlinux.o.map \
> >> >              compile_commands.json rust/test \
> >> >              rust-project.json .vmlinux.objs .vmlinux.export.c
> >> >
> >> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> >> > index a30c03a66172..5e2f30921cb2 100644
> >> > --- a/lib/Kconfig.debug
> >> > +++ b/lib/Kconfig.debug
> >> > @@ -571,6 +571,21 @@ config VMLINUX_MAP
> >> >         pieces of code get eliminated with
> >> >         CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
> >> >
> >> > +config BUILTIN_MODULE_RANGES
> >> > +     bool "Generate address range information for builtin modules"
> >> > +     depends on !LTO
> >> > +     depends on VMLINUX_MAP
> >> > +     help
> >> > +      When modules are built into the kernel, there will be no modu=
le name
> >> > +      associated with its symbols in /proc/kallsyms.  Tracers may w=
ant to
> >> > +      identify symbols by module name and symbol name regardless of=
 whether
> >> > +      the module is configured as loadable or not.
> >> > +
> >> > +      This option generates modules.builtin.ranges in the build tre=
e with
> >> > +      offset ranges (per ELF section) for the module(s) they belong=
 to.
> >> > +      It also records an anchor symbol to determine the load addres=
s of the
> >> > +      section.
> >> > +
> >> >  config DEBUG_FORCE_WEAK_PER_CPU
> >> >       bool "Force weak per-cpu definitions"
> >> >       depends on DEBUG_KERNEL
> >> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> >> > index 5ceecbed31eb..dfb408aa19c6 100644
> >> > --- a/scripts/Makefile.vmlinux
> >> > +++ b/scripts/Makefile.vmlinux
> >> > @@ -33,6 +33,24 @@ targets +=3D vmlinux
> >> >  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> >> >       +$(call if_changed_dep,link_vmlinux)
> >> >
> >> > +# module.builtin.ranges
> >> > +# -----------------------------------------------------------------=
----------
> >> > +ifdef CONFIG_BUILTIN_MODULE_RANGES
> >> > +__default: modules.builtin.ranges
> >> > +
> >> > +quiet_cmd_modules_builtin_ranges =3D GEN     $@
> >> > +      cmd_modules_builtin_ranges =3D $(real-prereqs) > $@
> >> > +
> >> > +targets +=3D modules.builtin.ranges
> >> > +modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.=
awk \
> >> > +                     modules.builtin vmlinux.map vmlinux.o.map FORC=
E
> >> > +     $(call if_changed,modules_builtin_ranges)
> >> > +
> >> > +vmlinux.map: vmlinux
> >> > +     @:
> >> > +
> >> > +endif
> >> > +
> >> >  # Add FORCE to the prerequisites of a target to force it to be alwa=
ys rebuilt.
> >> >  # -----------------------------------------------------------------=
----------
> >> >
> >> > diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> >> > index d64070b6b4bc..0b6e2ebf60dc 100644
> >> > --- a/scripts/Makefile.vmlinux_o
> >> > +++ b/scripts/Makefile.vmlinux_o
> >> > @@ -45,9 +45,12 @@ objtool-args =3D $(vmlinux-objtool-args-y) --link
> >> >  # Link of vmlinux.o used for section mismatch analysis
> >> >  # -----------------------------------------------------------------=
----------
> >> >
> >> > +vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)    +=3D -Map=3D$@=
.map
> >> > +
> >> >  quiet_cmd_ld_vmlinux.o =3D LD      $@
> >> >        cmd_ld_vmlinux.o =3D \
> >> >       $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> >> > +     $(vmlinux-o-ld-args-y) \
> >> >       $(addprefix -T , $(initcalls-lds)) \
> >> >       --whole-archive vmlinux.a --no-whole-archive \
> >> >       --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> >> > diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_=
builtin_ranges.awk
> >> > new file mode 100755
> >> > index 000000000000..b9ec761b3bef
> >> > --- /dev/null
> >> > +++ b/scripts/generate_builtin_ranges.awk
> >> > @@ -0,0 +1,508 @@
> >> > +#!/usr/bin/gawk -f
> >>
> >> This forces the gawk to be found always in /usr/bin. For systems where=
 gawk can
> >> be located in other places, can we change the Shebang to:
> >>
> >> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_bu=
iltin_ranges.awk
> >> index b9ec761b3bef..886251c8d3f7 100755
> >> --- a/scripts/generate_builtin_ranges.awk
> >> +++ b/scripts/generate_builtin_ranges.awk
> >> @@ -1,4 +1,4 @@
> >> -#!/usr/bin/gawk -f
> >> +#!/usr/bin/env gawk -f
> >>  # SPDX-License-Identifier: GPL-2.0
> >>  # generate_builtin_ranges.awk: Generate address range data for builti=
n modules
> >>  # Written by Kris Van Hees <kris.van.hees@oracle.com>
> >
> >
> > No. We cannot fix it this way.
> >
> >
> > I already pointed out this shebang issue.
> >
> > https://lore.kernel.org/lkml/CAK7LNASLc=3Dik9QdX4K_XuN=3Dcg+1VcUBk-y5En=
QEtOG+qOWaY=3DQ@mail.gmail.com/
> >
> >
> >
> > I thought Kris would send a fix up, but
> > perhaps people tend to be busy with LPC this week.
> >
> >
>
> He did, see https://lore.kernel.org/all/20240912171646.1523528-1-kris.van=
.hees@oracle.com/.
>


Ah, thanks for the pointer.
I missed it.
(I was only checking kbuild ML)


It squashed it to the original patch.

--
Best Regards
Masahiro Yamada

