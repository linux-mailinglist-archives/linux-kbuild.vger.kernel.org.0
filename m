Return-Path: <linux-kbuild+bounces-7255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF7AC30E7
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 20:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F124317CD41
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 18:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127DB3BBF2;
	Sat, 24 May 2025 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVaYRSpI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE6928382;
	Sat, 24 May 2025 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748110538; cv=none; b=DOuYAb1f+RsjFKd7AOZYJzvsWa5x2k927bdzYi9IHZVa8iEO05n/IH5xI5oXnADar67N+6UW8LXx92DBlG3nMKaogZ9M6WOnLl2t8QnSEnPDU1Csn4G/zC6cy/vQ6NNUl/0zSW2kc1xu8rKZbjp/962lUABq7aqfZi3IhW0dJIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748110538; c=relaxed/simple;
	bh=tokj9AdNZcLys6KcBCEI+LF8zfoInkg01RXsmtGF97U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0KoHkk1c89BJ+Y8+beguOYmEEieyNJVMpu4o99vaNCoMqop3axqcD3oeO21ga2xBBK0ttq9tv/levPminnoinMFA7LCSueFRaLUbrN0ILq4GwBM85v1DFnnWDYk01iBNHJ0CemuLHn9SQyMPIHO9bxW3CfXLq0isMMbxVsAcbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVaYRSpI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FD3C4CEF4;
	Sat, 24 May 2025 18:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748110537;
	bh=tokj9AdNZcLys6KcBCEI+LF8zfoInkg01RXsmtGF97U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WVaYRSpI3jkPtyOwnWeImKMWeKs6DxW7Z0GW2JFjqhBYRxXPkFj8V8dFljxKLXP2J
	 7CxbZi+1/tCVygPPoFDAhBPHmBP4N+RjPGZ/k8n9LyrBP0CEJokEOZ0WestB62+lQo
	 Q19JntsmsRq73xaWbrMsf+kfFrY01CvzT7FdYqevEqiXHRhkTeul4luac5L8rXHqHA
	 kTrL6mtVek9nOse554Xqe1vGXB7EqyW26a+wxiM2pqsBwtns85Zd9OcpDNvvUfiZiR
	 nf48Y2ORaOB5TIwDFfE8an3qQEBfpIkpnDc6yYGUx4A9ZlOqMw7GgYogG5uSQCrEyg
	 siOMMui6zH72g==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a071so9403911fa.1;
        Sat, 24 May 2025 11:15:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8fl5/K68W5LhikuSDW+r9qfv+pzODljEca/arsUuC/7GADOIuUcN6lZo9R++zIcSJlLamtHV/ORU2QJM=@vger.kernel.org, AJvYcCX+R/lZNF9EyrlDVxLUJVFnoKwKm5d05lHz4Sws/YdN8ijLt85HLxGHbQXIpkxaxTzKF3HLYtj1PjQwBEEO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HJRCC7Llh8J+uRbLi+F6WxsrI9AbtBc+95/uZ3clloshpABh
	IfFR2oLrv4M44a+peJTgVPlUcHHnYvbGz54ZUbDw8vcKtS5QE6s2iZyABnh6gHhS3lxy6kXEYIX
	7/39nFKfaNSWeHdgNQJWv6j+Vcsbe9T8=
X-Google-Smtp-Source: AGHT+IG2OLZdIjG367/4RRpP9r6ghaIgdEJR336gJlUQLdBIT9sYxE23kbv2q0CRuj8usbifAtReQZ/L3pAtgYth3AY=
X-Received: by 2002:a05:651c:31d1:b0:329:25dd:72ce with SMTP id
 38308e7fff4ca-3295ba84fbfmr6493111fa.35.1748110535529; Sat, 24 May 2025
 11:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521213534.3159514-1-xur@google.com>
In-Reply-To: <20250521213534.3159514-1-xur@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 25 May 2025 03:14:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5Jy-us4pc725bb_LyHAP3b9D7Z0Jp=krOFujmnYmZXg@mail.gmail.com>
X-Gm-Features: AX0GCFsSIqrrUUwix6ProBaZwka9mt9diJwawOE6SyAqaw0ixCAkfHKFanL0HUk
Message-ID: <CAK7LNAT5Jy-us4pc725bb_LyHAP3b9D7Z0Jp=krOFujmnYmZXg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: distributed build support for Clang ThinLTO
To: xur@google.com
Cc: Nathan Chancellor <nathan@kernel.org>, Eric Naim <dnaim@cachyos.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 6:35=E2=80=AFAM <xur@google.com> wrote:
>
> From: Rong Xu <xur@google.com>
>
> Add distributed ThinLTO build support for the Linux kernel.
> This new mode offers several advantages: (1) Increased
> flexibility in handling user-specified build options.
> (2) Improved user-friendliness for developers. (3) Greater
> convenience for integrating with objtool and livepatch.

I did not understand any of these benefits
despite a lot of added complexity.






> Note that "distributed" in this context refers to a term
> that differentiates in-process ThinLTO builds by invoking
> backend compilation through the linker, not necessarily
> building in distributed environments.
>
> Distributed ThinLTO is enabled via the
> `CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
>  > make LLVM=3D1 defconfig
>  > scripts/config -e LTO_CLANG_THIN_DIST
>  > make LLVM=3D1 oldconfig
>  > make LLVM=3D1 vmlinux -j <..>
>
> The implementation changes the top-level Makefile with a
> macro for generating `vmlinux.o` for distributed ThinLTO
> builds. It uses the existing Kbuild infrastructure to
> perform two recursive passes through the subdirectories.
> The first pass generates LLVM IR object files, similar to
> in-process ThinLTO. Following the thin-link stage, a second
> pass compiles these IR files into the final native object
> files. The build rules and actions for this two-pass process
> are primarily implemented in `scripts/Makefile.build`.
>
> Currently, this patch focuses on building the main kernel
> image (`vmlinux`) only. Support for building kernel modules
> using this method is planned for a subsequent patch.

The announcement of the future plan is even scary,
especially after looking at your implementation.


>
> Tested on the following arch: x86, arm64, loongarch, and
> riscv.
>
> Some implementation details can be found here:
> https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/859=
34
>
> Signed-off-by: Rong Xu <xur@google.com>
> ---
> Changelog since v1:
> - Updated the description in arch/Kconfig based on feedback
>   from Nathan Chancellor
> - Revised file suffixes: .final_o -> .o.thinlto.native, and
>   .final_a -> .a.thinlto.native
> - Updated list of ignored files in .gitignore
>
> Changelog since v2:
> - Changed file suffixes: .o.thinlto.native -> .o_thinlto_native,
>   and .a.thinlto.native -> .a_thinlto_native so that basename
>   works as intended.
> - Tested the patch with AutoFDO and Propeller.
> ---
>  .gitignore                        |  3 ++
>  MAINTAINERS                       |  5 +++
>  Makefile                          | 40 ++++++++++++++++++++---
>  arch/Kconfig                      | 19 +++++++++++
>  scripts/Makefile.build            | 52 +++++++++++++++++++++++++++---
>  scripts/Makefile.lib              |  7 +++-
>  scripts/Makefile.vmlinux_o        | 16 +++++++---
>  scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++++
>  scripts/head-object-list.txt      |  1 +
>  9 files changed, 181 insertions(+), 15 deletions(-)
>  create mode 100644 scripts/Makefile.vmlinux_thinlink
>
> diff --git a/.gitignore b/.gitignore
> index f2f63e47fb886..b83a68185ef46 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -12,6 +12,7 @@
>  #
>  .*
>  *.a
> +*.a_thinlto_native
>  *.asn1.[ch]
>  *.bin
>  *.bz2
> @@ -39,6 +40,7 @@
>  *.mod.c
>  *.o
>  *.o.*
> +*.o_thinlto_native
>  *.patch
>  *.rmeta
>  *.rpm
> @@ -64,6 +66,7 @@ modules.order
>  /vmlinux
>  /vmlinux.32
>  /vmlinux.map
> +/vmlinux.thinlink
>  /vmlinux.symvers
>  /vmlinux.unstripped
>  /vmlinux-gdb.py
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d48dd6726fe6b..f54090f364c93 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5790,6 +5790,11 @@ F:       scripts/Makefile.clang
>  F:     scripts/clang-tools/
>  K:     \b(?i:clang|llvm)\b
>
> +CLANG/LLVM THINLTO DISTRIBUTED BUILD
> +M:     Rong Xu <xur@google.com>
> +S:     Supported
> +F:     scripts/Makefile.vmlinux_thinlink
> +
>  CLK API
>  M:     Russell King <linux@armlinux.org.uk>
>  L:     linux-clk@vger.kernel.org
> diff --git a/Makefile b/Makefile
> index a9edd03036537..8fbff2ab87ebd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -298,7 +298,8 @@ no-dot-config-targets :=3D $(clean-targets) \
>                          outputmakefile rustavailable rustfmt rustfmtchec=
k
>  no-sync-config-targets :=3D $(no-dot-config-targets) %install modules_si=
gn kernelrelease \
>                           image_name
> -single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
> +single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.=
o_thinlto_native \
> +                 %.a_thinlto_native %.o.thinlto.bc %/
>
>  config-build   :=3D
>  mixed-build    :=3D
> @@ -991,10 +992,10 @@ export CC_FLAGS_SCS
>  endif
>
>  ifdef CONFIG_LTO_CLANG
> -ifdef CONFIG_LTO_CLANG_THIN
> -CC_FLAGS_LTO   :=3D -flto=3Dthin -fsplit-lto-unit
> -else
> +ifdef CONFIG_LTO_CLANG_FULL
>  CC_FLAGS_LTO   :=3D -flto
> +else # for CONFIG_LTO_CLANG_THIN or CONFIG_LTO_CLANG_THIN_DIST
> +CC_FLAGS_LTO   :=3D -flto=3Dthin -fsplit-lto-unit
>  endif
>  CC_FLAGS_LTO   +=3D -fvisibility=3Dhidden
>
> @@ -1213,8 +1214,34 @@ vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-obj=
ect-list.txt FORCE
>         $(call if_changed,ar_vmlinux.a)
>
>  PHONY +=3D vmlinux_o
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +vmlinux.thinlink: vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> +       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_thinlink
> +targets +=3D vmlinux.thinlink
> +
> +vmlinux.a_thinlto_native :=3D $(patsubst %.a,%.a_thinlto_native,$(KBUILD=
_VMLINUX_OBJS))
> +quiet_cmd_ar_vmlinux.a_thinlto_native =3D AR      $@
> +      cmd_ar_vmlinux.a_thinlto_native =3D \
> +       rm -f $@; \
> +       $(AR) cDPrST $@ $(vmlinux.a_thinlto_native); \
> +       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F =
-f $(srctree)/scripts/head-object-list.txt)
> +
> +define rule_gen_vmlinux.a_thinlto_native
> +       +$(Q)$(MAKE) $(build)=3D. need-builtin=3D1 thinlto_final_pass=3D1=
 need-modorder=3D1 built-in.a_thinlto_native


I really do not understand why this needs the second
recursion, as you already know the list of objects
by 'ar t vmlinux.a'.








> +       $(call cmd_and_savecmd,ar_vmlinux.a_thinlto_native)
> +endef
> +
> +vmlinux.a_thinlto_native: vmlinux.thinlink scripts/head-object-list.txt =
FORCE
> +       $(call if_changed_rule,gen_vmlinux.a_thinlto_native)
> +
> +targets +=3D vmlinux.a_thinlto_native
> +
> +vmlinux_o: vmlinux.a_thinlto_native
> +       $(Q)$(MAKE) thinlto_final_pass=3D1 -f $(srctree)/scripts/Makefile=
.vmlinux_o
> +else
>  vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_o
> +endif
>
>  vmlinux.o modules.builtin.modinfo modules.builtin: vmlinux_o
>         @:
> @@ -1572,7 +1599,8 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
rs \
>                modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
>                compile_commands.json rust/test \
>                rust-project.json .vmlinux.objs .vmlinux.export.c \
> -               .builtin-dtbs-list .builtin-dtb.S
> +              .builtin-dtbs-list .builtin-dtb.S \
> +              .vmlinux_thinlto_bc_files vmlinux.thinlink
>
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES +=3D include/config include/generated          \
> @@ -2023,6 +2051,8 @@ clean: $(clean-dirs)
>                 -o -name '*.symtypes' -o -name 'modules.order' \
>                 -o -name '*.c.[012]*.*' \
>                 -o -name '*.ll' \
> +               -o -name '*.a_thinlto_native' -o -name '*.o_thinlto_nativ=
e' \
> +               -o -name '*.o.thinlto.bc' \
>                 -o -name '*.gcno' \
>                 \) -type f -print \
>                 -o -name '.tmp_*' -print \
> diff --git a/arch/Kconfig b/arch/Kconfig
> index b0adb665041f1..30dccda07c671 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -810,6 +810,25 @@ config LTO_CLANG_THIN
>             https://clang.llvm.org/docs/ThinLTO.html
>
>           If unsure, say Y.
> +
> +config LTO_CLANG_THIN_DIST
> +       bool "Clang ThinLTO in distributed mode (EXPERIMENTAL)"
> +       depends on HAS_LTO_CLANG && ARCH_SUPPORTS_LTO_CLANG_THIN
> +       select LTO_CLANG
> +       help
> +         This option enables Clang's ThinLTO in distributed build mode.
> +         In this mode, the linker performs the thin-link, generating
> +         ThinLTO index files. Subsequently, the build system explicitly
> +         invokes ThinLTO backend compilation using these index files
> +         and pre-linked IR objects. The resulting native object files
> +         are with the .o_thinlto_native suffix.
> +
> +         This build mode offers improved visibility into the ThinLTO
> +         process through explicit subcommand exposure. It also makes
> +         final native object files directly available, benefiting
> +         tools like objtool and kpatch. Additionally, it provides
> +         crucial granular control over back-end options, enabling
> +         module-specific compiler options, and simplifies debugging.
>  endchoice
>
>  config ARCH_SUPPORTS_AUTOFDO_CLANG
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 13dcd86e74ca8..338e1aec0eaa3 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -50,18 +50,23 @@ endif
>
>  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> +builtin_suffix :=3D $(if $(filter %.a_thinlto_native, $(MAKECMDGOALS)),.=
a_thinlto_native,.a)
> +ifeq ($(thinlto_final_pass),1)
> +builtin_suffix :=3D.a_thinlto_native
> +endif
> +
>  # subdir-builtin and subdir-modorder may contain duplications. Use $(sor=
t ...)
> -subdir-builtin :=3D $(sort $(filter %/built-in.a, $(real-obj-y)))
> +subdir-builtin :=3D $(sort $(filter %/built-in$(builtin_suffix), $(real-=
obj-y)))
>  subdir-modorder :=3D $(sort $(filter %/modules.order, $(obj-m)))
>
>  targets-for-builtin :=3D $(extra-y)
>
>  ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
> -targets-for-builtin +=3D $(obj)/lib.a
> +targets-for-builtin +=3D $(obj)/lib$(builtin_suffix)
>  endif
>
>  ifdef need-builtin
> -targets-for-builtin +=3D $(obj)/built-in.a
> +targets-for-builtin +=3D $(obj)/built-in$(builtin_suffix)
>  endif
>
>  targets-for-modules :=3D $(foreach x, o mod, \
> @@ -337,6 +342,10 @@ $(obj)/%.o: $(obj)/%.S FORCE
>  targets +=3D $(filter-out $(subdir-builtin), $(real-obj-y))
>  targets +=3D $(filter-out $(subdir-modorder), $(real-obj-m))
>  targets +=3D $(lib-y) $(always-y)
> +ifeq ($(builtin_suffix),.a_thinlto_native)
> +native_targets =3D $(patsubst,%.o,%.o_thinlto_native,$(targets))
> +targets +=3D $(native_targets)
> +endif
>
>  # Linker scripts preprocessor (.lds.S -> .lds)
>  # ----------------------------------------------------------------------=
-----
> @@ -347,6 +356,24 @@ quiet_cmd_cpp_lds_S =3D LDS     $@
>  $(obj)/%.lds: $(src)/%.lds.S FORCE
>         $(call if_changed_dep,cpp_lds_S)
>
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +# Generate .o_thinlto_native (obj) from .o (bitcode) file
> +# ----------------------------------------------------------------------=
-----
> +quiet_cmd_cc_o_bc =3D CC $(quiet_modtag) $@
> +
> +cmd_cc_o_bc      =3D $(if $(filter bitcode, $(shell file -b $<)),$(CC) \
> +                  $(filter-out -Wp% $(LINUXINCLUDE) %.h.gch %.h -D% \
> +                  -flto=3Dthin, $(c_flags)) \
> +                  -Wno-unused-command-line-argument \
> +                  -x ir -fthinlto-index=3D$<.thinlto.bc -c -o $@ \
> +                  $(if $(findstring ../,$<), \
> +                  $$(realpath --relative-to=3D$(srcroot) $<), $<), \
> +                  cp $< $@)
> +
> +$(obj)/%.o_thinlto_native: $(obj)/%.o FORCE
> +       $(call if_changed,cc_o_bc)
> +endif
> +
>  # ASN.1 grammar
>  # ----------------------------------------------------------------------=
-----
>  quiet_cmd_asn1_compiler =3D ASN.1   $(basename $@).[ch]
> @@ -360,7 +387,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objt=
ree)/scripts/asn1_compiler
>  # ----------------------------------------------------------------------=
-----
>
>  # To build objects in subdirs, we need to descend into the directories
> -$(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
> +$(subdir-builtin): $(obj)/%/built-in$(builtin_suffix): $(obj)/% ;
>  $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>
>  #
> @@ -377,6 +404,12 @@ quiet_cmd_ar_builtin =3D AR      $@
>  $(obj)/built-in.a: $(real-obj-y) FORCE
>         $(call if_changed,ar_builtin)
>
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +# Rule to compile a set of .o_thinlto_native files into one .a_thinlto_n=
ative file.
> +$(obj)/built-in.a_thinlto_native: $(patsubst %.o,%.o_thinlto_native,$(re=
al-obj-y)) FORCE
> +       $(call if_changed,ar_builtin)
> +endif
> +
>  # This is a list of build artifacts from the current Makefile and its
>  # sub-directories. The timestamp should be updated when any of the membe=
r files.
>
> @@ -394,6 +427,14 @@ $(obj)/modules.order: $(obj-m) FORCE
>  $(obj)/lib.a: $(lib-y) FORCE
>         $(call if_changed,ar)
>
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +quiet_cmd_ar_native =3D AR      $@
> +      cmd_ar_native =3D rm -f $@; $(AR) cDPrsT $@ $(patsubst %.o,%.o_thi=
nlto_native,$(real-prereqs))
> +
> +$(obj)/lib.a_thinlto_native: $(patsubst %.o,%.o_thinlto_native,$(lib-y))=
 FORCE
> +       $(call if_changed,ar_native)
> +endif
> +
>  quiet_cmd_ld_multi_m =3D LD [M]  $@
>        cmd_ld_multi_m =3D $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool)
>
> @@ -459,7 +500,8 @@ $(single-subdir-goals): $(single-subdirs)
>  PHONY +=3D $(subdir-ym)
>  $(subdir-ym):
>         $(Q)$(MAKE) $(build)=3D$@ \
> -       need-builtin=3D$(if $(filter $@/built-in.a, $(subdir-builtin)),1)=
 \
> +       need-builtin=3D$(if $(filter $@/built-in$(builtin_suffix), $(subd=
ir-builtin)),1) \
> +       thinlto_final_pass=3D$(if $(filter .a_thinlto_native, $(builtin_s=
uffix)),1) \
>         need-modorder=3D$(if $(filter $@/modules.order, $(subdir-modorder=
)),1) \
>         $(filter $@/%, $(single-subdir-goals))
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bddb..9cfd23590334d 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -34,8 +34,13 @@ else
>  obj-m :=3D $(filter-out %/, $(obj-m))
>  endif
>
> +builtin_suffix :=3D $(if $(filter %.a_thinlto_native, $(MAKECMDGOALS)),.=
a_thinlto_native,.a)
> +ifeq ($(thinlto_final_pass),1)
> +        builtin_suffix :=3D.a_thinlto_native
> +endif
> +
>  ifdef need-builtin
> -obj-y          :=3D $(patsubst %/, %/built-in.a, $(obj-y))
> +obj-y          :=3D $(patsubst %/, %/built-in$(builtin_suffix), $(obj-y)=
)
>  else
>  obj-y          :=3D $(filter-out %/, $(obj-y))
>  endif
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index b024ffb3e2018..f9abc45a68b36 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -9,6 +9,14 @@ include $(srctree)/scripts/Kbuild.include
>  # for objtool
>  include $(srctree)/scripts/Makefile.lib
>
> +ifeq ($(thinlto_final_pass),1)
> +vmlinux_a :=3D vmlinux.a_thinlto_native
> +vmlinux_libs :=3D $(patsubst %.a,%.a_thinlto_native,$(KBUILD_VMLINUX_LIB=
S))
> +else
> +vmlinux_a :=3D vmlinux.a
> +vmlinux_libs :=3D $(KBUILD_VMLINUX_LIBS)
> +endif
> +
>  # Generate a linker script to ensure correct ordering of initcalls for C=
lang LTO
>  # ----------------------------------------------------------------------=
-----
>
> @@ -18,7 +26,7 @@ quiet_cmd_gen_initcalls_lds =3D GEN     $@
>         $(PERL) $(real-prereqs) > $@
>
>  .tmp_initcalls.lds: $(srctree)/scripts/generate_initcall_order.pl \
> -               vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> +               $(vmlinux_a) $(vmlinux_libs) FORCE
>         $(call if_changed,gen_initcalls_lds)
>
>  targets :=3D .tmp_initcalls.lds
> @@ -59,8 +67,8 @@ quiet_cmd_ld_vmlinux.o =3D LD      $@
>         $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
>         $(vmlinux-o-ld-args-y) \
>         $(addprefix -T , $(initcalls-lds)) \
> -       --whole-archive vmlinux.a --no-whole-archive \
> -       --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> +       --whole-archive $(vmlinux_a) --no-whole-archive \
> +       --start-group $(vmlinux_libs) --end-group \
>         $(cmd_objtool)
>
>  define rule_ld_vmlinux.o
> @@ -68,7 +76,7 @@ define rule_ld_vmlinux.o
>         $(call cmd,gen_objtooldep)
>  endef
>
> -vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> +vmlinux.o: $(initcalls-lds) $(vmlinux_a) $(vmlinux_libs) FORCE
>         $(call if_changed_rule,ld_vmlinux.o)
>
>  targets +=3D vmlinux.o
> diff --git a/scripts/Makefile.vmlinux_thinlink b/scripts/Makefile.vmlinux=
_thinlink
> new file mode 100644
> index 0000000000000..13e4026c7d45b
> --- /dev/null
> +++ b/scripts/Makefile.vmlinux_thinlink
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +PHONY :=3D __default
> +__default: vmlinux.thinlink
> +
> +include include/config/auto.conf
> +include $(srctree)/scripts/Kbuild.include
> +
> +
> +# Generate a linker script to ensure correct ordering of initcalls for C=
lang LTO
> +# ----------------------------------------------------------------------=
-----
> +
> +quiet_cmd_gen_initcalls_lds =3D GEN     $@
> +      cmd_gen_initcalls_lds =3D \
> +       $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +       $(PERL) $(real-prereqs) > $@
> +
> +.tmp_initcalls_thinlink.lds: $(srctree)/scripts/generate_initcall_order.=
pl \
> +               vmlinux.a FORCE
> +       $(call if_changed,gen_initcalls_lds)
> +
> +targets :=3D .tmp_initcalls_thinlink.lds
> +
> +initcalls-lds :=3D .tmp_initcalls_thinlink.lds
> +
> +quiet_cmd_ld_vmlinux.thinlink =3D LD      $@
> +      cmd_ld_vmlinux.thinlink =3D \
> +       $(AR) t vmlinux.a > .vmlinux_thinlto_bc_files; \
> +       $(LD) ${KBUILD_LDFLAGS} -r $(addprefix -T , $(initcalls-lds)) \
> +       --thinlto-index-only @.vmlinux_thinlto_bc_files; \
> +       touch vmlinux.thinlink
> +
> +vmlinux.thinlink: vmlinux.a $(initcalls-lds) FORCE
> +       $(call if_changed,ld_vmlinux.thinlink)
> +
> +targets +=3D vmlinux.thinlink
> +
> +# Add FORCE to the prerequisites of a target to force it to be always re=
built.
> +# ----------------------------------------------------------------------=
-----
> +
> +PHONY +=3D FORCE
> +FORCE:
> +
> +# Read all saved command lines and dependencies for the $(targets) we
> +# may be building above, using $(if_changed{,_dep}). As an
> +# optimization, we don't need to read them if the target does not
> +# exist, we will rebuild anyway in that case.
> +
> +existing-targets :=3D $(wildcard $(sort $(targets)))
> +
> +-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
> +
> +.PHONY: $(PHONY)
> diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
> index 7274dfc65af60..90710b87a3877 100644
> --- a/scripts/head-object-list.txt
> +++ b/scripts/head-object-list.txt

Adding a new entry to this file is NACK.



> @@ -18,6 +18,7 @@ arch/arm/kernel/head.o
>  arch/csky/kernel/head.o
>  arch/hexagon/kernel/head.o
>  arch/loongarch/kernel/head.o
> +arch/loongarch/kernel/head.o_thinlto_native
>  arch/m68k/68000/head.o
>  arch/m68k/coldfire/head.o
>  arch/m68k/kernel/head.o
> --
> 2.49.0.1143.g0be31eac6b-goog
>
>


--=20
Best Regards
Masahiro Yamada

