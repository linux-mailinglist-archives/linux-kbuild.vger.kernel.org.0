Return-Path: <linux-kbuild+bounces-6003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE29FA570FA
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 19:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29711783EF
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 18:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15752459F1;
	Fri,  7 Mar 2025 18:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQo/UExz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893251C860C;
	Fri,  7 Mar 2025 18:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741373966; cv=none; b=CB/51y4OdD8ABIKUJ9MwRajgWDVqOYvV1+HErQ90ZD96s6lVGIfJBoU3ZnmRLVM2FL7ATQwf2sO1GnDQgeIrk9cpH7sRumRmtl1V3UDeoYoFXCKn51+5u9h2Llo78Xb8xawT3A46jiUtO6UshXL8ajZlniSvA9YJCcgAl+j5NDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741373966; c=relaxed/simple;
	bh=rSSfjfazwk6DZbU+QABgVOqbuGLDpvSFLTCTKi3Wg6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7aoFJ69kmBELQ5Lbugs5IldaV/8z9ivIdDxEoFolK+UugAw2pcL/mJFFZqM0ISkC7dp7pDY3nLY7bqmUVNQIftBEUxZXyVv6bEqt3iK2j71vUBguLW4YIHbT5ZOTXQyWamp13uJa5XKEtR0k+j1GabVQy8tHSh4E1vRxb77yn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQo/UExz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0724C4CEE2;
	Fri,  7 Mar 2025 18:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741373966;
	bh=rSSfjfazwk6DZbU+QABgVOqbuGLDpvSFLTCTKi3Wg6c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lQo/UExzDnzJzMnwvxWXUCS92Gu4qLRl3HiREjb1EorqG9/Lvi2YCOMxyFkzjsuVs
	 kSJp+gtiedSX+XIf9Mp+5LU3ApZ+lTe0ENyZWQtfnqhR7jRGPTGdQB3riMVleretHl
	 q0EnDCFDWV3dgNFHyU6AMCF+cFniBInHYVODkfPGp11BnUq8oYjxHAU4VYbJxpen/F
	 H/lOP4rxncLA5Vm7pP9dObz8sTO8NzhqhQNJSrhi/vTVMAKBkZMcjusSSDEMW42bXD
	 baittk8u3myqVN68psPxBxP64VkZTYBN0ZCiRypLOvURK6thQjTgP6H3tpDJ6Zzzi2
	 tpxQiEmiNA0zA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so2360094e87.3;
        Fri, 07 Mar 2025 10:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQkSyPiI2r6yGbgvO4RWI+N9U4skCn1YiqgUp01PlYJnGVjuVCL+y/2wiJ3M1HKXjVzFgLZGY+ryRm4VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06SDz6rAMPhVgGpqFXi6nDBVQUHyUM/zOqoTQGtT0E8MOQeIS
	DOzDIyI0QmIZBvDqfzSEZekekkAVIzA6+v3vEQU3Gse+FBeAsZPsZkjQi2yyk1c4UDVkAUSLt7o
	b5/gR3QZ/DXJbMUiqQm2iznpnI2E=
X-Google-Smtp-Source: AGHT+IGK7OG7m9tA2pW3zCkgYI1uksbfHoxQ09rp9tXpQOcYT3rfnVS6ajNCu0QHF8fFwQQGfSqk6oo2V+eUoKAd82Q=
X-Received: by 2002:a05:6512:2393:b0:546:27f0:21a7 with SMTP id
 2adb3069b0e04-54990ec1fbdmr1825085e87.49.1741373964605; Fri, 07 Mar 2025
 10:59:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <20250224132132.1765115-8-ardb+git@google.com>
In-Reply-To: <20250224132132.1765115-8-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Mar 2025 03:58:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT7YLZAeX+x+TMN30KwDfs4c5DM=mh7w_FWmv082xTztg@mail.gmail.com>
X-Gm-Features: AQ5f1Jq793AMtaKIoEn_wYdUpnrgHA_qGfyXcw3vTYutmKLTPnDjXzBctmiW7sY
Message-ID: <CAK7LNAT7YLZAeX+x+TMN30KwDfs4c5DM=mh7w_FWmv082xTztg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] Kbuild: Introduce Kconfig symbol for linking
 vmlinux with relocations
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 10:21=E2=80=AFPM Ard Biesheuvel <ardb+git@google.co=
m> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Some architectures build vmlinux with static relocations preserved, but
> strip them again from the final vmlinux image. Arch specific tools
> consume these static relocations in order to construct relocation tables
> for KASLR.
>
> The fact that vmlinux is created, consumed and subsequently updated goes
> against the typical, declarative paradigm used by Make, which is based
> on rules and dependencies. So as a first step towards cleaning this up,
> introduce a Kconfig symbol to declare that the arch wants to consume the
> static relocations emitted into vmlinux. This will be wired up further
> in subsequent patches.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

I have no objection to this patch.

The code diff seems a good clean-up.


> ---
>  Makefile            | 4 ++++
>  arch/Kconfig        | 7 +++++++
>  arch/mips/Kconfig   | 1 +
>  arch/mips/Makefile  | 4 ----
>  arch/riscv/Kconfig  | 1 +
>  arch/riscv/Makefile | 2 +-
>  arch/s390/Kconfig   | 1 +
>  arch/s390/Makefile  | 2 +-
>  arch/x86/Kconfig    | 1 +
>  arch/x86/Makefile   | 6 ------
>  10 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 30dab4c8b012..a3302dce56de 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1119,6 +1119,10 @@ ifdef CONFIG_LD_ORPHAN_WARN
>  LDFLAGS_vmlinux +=3D --orphan-handling=3D$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  endif
>
> +ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> +LDFLAGS_vmlinux        +=3D --emit-relocs --discard-none
> +endif
> +
>  # Align the bit size of userspace programs with the kernel
>  KBUILD_USERCFLAGS  +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CPPFLA=
GS) $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CPPFLA=
GS) $(KBUILD_CFLAGS))
> diff --git a/arch/Kconfig b/arch/Kconfig
> index b8a4ff365582..101a13fcde8e 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1695,6 +1695,13 @@ config ARCH_HAS_KERNEL_FPU_SUPPORT
>           Architectures that select this option can run floating-point co=
de in
>           the kernel, as described in Documentation/core-api/floating-poi=
nt.rst.
>
> +config ARCH_VMLINUX_NEEDS_RELOCS
> +       bool
> +       help
> +         Whether the architecture needs vmlinux to be built with static
> +         relocations preserved. This is used by some architectures to
> +         construct bespoke relocation tables for KASLR.
> +
>  source "kernel/gcov/Kconfig"
>
>  source "scripts/gcc-plugins/Kconfig"
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 1924f2d83932..5aedbd7afadb 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2617,6 +2617,7 @@ config RELOCATABLE
>                    CPU_MIPS32_R6 || CPU_MIPS64_R6 || \
>                    CPU_P5600 || CAVIUM_OCTEON_SOC || \
>                    CPU_LOONGSON64
> +       select ARCH_VMLINUX_NEEDS_RELOCS
>         help
>           This builds a kernel image that retains relocation information
>           so it can be loaded someplace besides the default 1MB.
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index be8cb44a89fd..d9057e29bc62 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -100,10 +100,6 @@ LDFLAGS_vmlinux                    +=3D -G 0 -static=
 -n -nostdlib
>  KBUILD_AFLAGS_MODULE           +=3D -mlong-calls
>  KBUILD_CFLAGS_MODULE           +=3D -mlong-calls
>
> -ifeq ($(CONFIG_RELOCATABLE),y)
> -LDFLAGS_vmlinux                        +=3D --emit-relocs
> -endif
> -
>  cflags-y +=3D -ffreestanding
>
>  cflags-$(CONFIG_CPU_BIG_ENDIAN)                +=3D -EB
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7612c52e9b1e..6f5800114416 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1077,6 +1077,7 @@ config RELOCATABLE
>         bool "Build a relocatable kernel"
>         depends on MMU && 64BIT && !XIP_KERNEL
>         select MODULE_SECTIONS if MODULES
> +       select ARCH_VMLINUX_NEEDS_RELOCS
>         help
>            This builds a kernel as a Position Independent Executable (PIE=
),
>            which retains all relocation metadata required to relocate the
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 13fbc0f94238..6ef0d10e0c50 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -8,7 +8,7 @@
>
>  LDFLAGS_vmlinux :=3D -z norelro
>  ifeq ($(CONFIG_RELOCATABLE),y)
> -       LDFLAGS_vmlinux +=3D -shared -Bsymbolic -z notext --emit-relocs
> +       LDFLAGS_vmlinux +=3D -shared -Bsymbolic -z notext
>         KBUILD_CFLAGS +=3D -fPIE
>  endif
>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 9c9ec08d78c7..ea67b7317138 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -630,6 +630,7 @@ endchoice
>
>  config RELOCATABLE
>         def_bool y
> +       select ARCH_VMLINUX_NEEDS_RELOCS
>         help
>           This builds a kernel image that retains relocation information
>           so it can be loaded at an arbitrary address.
> diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> index 5fae311203c2..d5f4be440879 100644
> --- a/arch/s390/Makefile
> +++ b/arch/s390/Makefile
> @@ -15,7 +15,7 @@ KBUILD_CFLAGS_MODULE +=3D -fPIC
>  KBUILD_AFLAGS  +=3D -m64
>  KBUILD_CFLAGS  +=3D -m64
>  KBUILD_CFLAGS  +=3D -fPIC
> -LDFLAGS_vmlinux        :=3D -no-pie --emit-relocs --discard-none
> +LDFLAGS_vmlinux        :=3D -no-pie
>  extra_tools    :=3D relocs
>  aflags_dwarf   :=3D -Wa,-gdwarf-2
>  KBUILD_AFLAGS_DECOMPRESSOR :=3D $(CLANG_FLAGS) -m64 -D__ASSEMBLY__
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index be2c311f5118..2005d80ff8d1 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2199,6 +2199,7 @@ config RANDOMIZE_BASE
>  config X86_NEED_RELOCS
>         def_bool y
>         depends on RANDOMIZE_BASE || (X86_32 && RELOCATABLE)
> +       select ARCH_VMLINUX_NEEDS_RELOCS
>
>  config PHYSICAL_ALIGN
>         hex "Alignment value to which kernel should be aligned"
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 5b773b34768d..f65ed6dcd6fb 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -251,12 +251,6 @@ endif
>
>  KBUILD_LDFLAGS +=3D -m elf_$(UTS_MACHINE)
>
> -ifdef CONFIG_X86_NEED_RELOCS
> -LDFLAGS_vmlinux :=3D --emit-relocs --discard-none
> -else
> -LDFLAGS_vmlinux :=3D
> -endif
> -
>  #
>  # The 64-bit kernel must be aligned to 2MB.  Pass -z max-page-size=3D0x2=
00000 to
>  # the linker to force 2MB page size regardless of the default page size =
used
> --
> 2.48.1.601.g30ceb7b040-goog
>
>


--=20
Best Regards
Masahiro Yamada

