Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42133E17B4
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 17:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241450AbhHEPQj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 11:16:39 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37685 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241095AbhHEPQj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 11:16:39 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 175FG7g9008798;
        Fri, 6 Aug 2021 00:16:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 175FG7g9008798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628176567;
        bh=7JKVqdhk3wDgxUpgLrRBBJjC3akBTBo6VvDVu+02hPk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NbSRuTWtsSoUCcitllxBuHGpjcs6wQH82TDnRhc4ee4feibkzphqAG4g+oz9wjs19
         yXGbH+/lxlX7LcVj5qD7PWjOPp8SPSS6atZ8zwE12jPRB6cm4JDSFjJ+bnJf7n8NJL
         CfPdjzGZYmpx0Hh3Q7/oNswTtpy4pl0PsqJLrg09ug/7l02k8nv8Mf3Zrg7DQPPc8Y
         n3/y1P0QDDGu8KvDSgZ1jbXm9MHjLntCJ17k3YvjJhglCGn/5Fa4dqTKNxgacm5M+Q
         7BIN9NiNf9xU5fzZfK1SHHDiegYxKoWYCJDhvFzOuN0m/gltYCaCZv07fitMGNw9m7
         mcZqmH64jgqnA==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id j1so9599388pjv.3;
        Thu, 05 Aug 2021 08:16:07 -0700 (PDT)
X-Gm-Message-State: AOAM531dgxOuAZtb8QEiiCio9XNOyzfdAUe+/GLXFAjwJT8KW5MGt/8g
        3/Gdc+YGPoHxPxlU+qHumVLPVtXhuhTs+L7Kw7k=
X-Google-Smtp-Source: ABdhPJwrhP5GxxiXyQoPTJ4HbkL2DpweB++rWVgwsahs6nVzqpqSNzY6uS/hh/EvSpVap/wB8NFnoDkci8pzupkBsb8=
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr203382pgm.175.1628176566664;
 Thu, 05 Aug 2021 08:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com>
In-Reply-To: <20210802234304.3519577-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 6 Aug 2021 00:15:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
Message-ID: <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Khem Raj <raj.khem@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 3, 2021 at 8:43 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> LLVM_IAS=1 controls enabling clang's integrated assembler via
> -integrated-as. This was an explicit opt in until we could enable
> assembler support in Clang for more architecures. Now we have support
> and CI coverage of LLVM_IAS=1 for all architecures except a few more
> bugs affecting s390 and powerpc.
>
> This commit flips the default from opt in via LLVM_IAS=1 to opt out via
> LLVM_IAS=0.  CI systems or developers that were previously doing builds
> with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
> explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
> opted-in.
>
> This finally shortens the command line invocation when cross compiling
> with LLVM to simply:
>
> $ make ARCH=arm64 LLVM=1
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1434
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Note: base is:
> https://lore.kernel.org/lkml/20210802183910.1802120-1-ndesaulniers@google.com/
>
>  Documentation/kbuild/llvm.rst | 14 ++++++++------
>  Makefile                      |  2 +-
>  arch/riscv/Makefile           |  2 +-
>  scripts/Makefile.clang        |  6 +++---
>  4 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index f8a360958f4c..16712fab4d3a 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
>           OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>           HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
>
> -Currently, the integrated assembler is disabled by default. You can pass
> -``LLVM_IAS=1`` to enable it.
> +Currently, the integrated assembler is enabled by default. You can pass
> +``LLVM_IAS=0`` to disable it.
>
>  Omitting CROSS_COMPILE
>  ----------------------
>
>  As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
>
> -Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> -``--prefix=<path>`` to search for the GNU assembler and linker.
> -
>  If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
>  from ``ARCH``.
>
> @@ -78,7 +75,12 @@ That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
>
>  For example, to cross-compile the arm64 kernel::
>
> -       make ARCH=arm64 LLVM=1 LLVM_IAS=1
> +       make ARCH=arm64 LLVM=1
> +
> +If ``LLVM_IAS=0`` is specified, ``CROSS_COMPILE`` is also used to derive
> +``--prefix=<path>`` to search for the GNU assembler and linker. ::
> +
> +       make ARCH=arm64 LLVM=1 LLVM_IAS=0 CROSS_COMPILE=aarch64-linux-gnu-
>
>  Supported Architectures
>  -----------------------
> diff --git a/Makefile b/Makefile
> index 444558e62cbc..b24b48c9ebb7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -845,7 +845,7 @@ else
>  DEBUG_CFLAGS   += -g
>  endif
>
> -ifneq ($(LLVM_IAS),1)
> +ifeq ($(LLVM_IAS),0)
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
>  endif
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..807f7c94bc6f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -41,7 +41,7 @@ endif
>  ifeq ($(CONFIG_LD_IS_LLD),y)
>         KBUILD_CFLAGS += -mno-relax
>         KBUILD_AFLAGS += -mno-relax
> -ifneq ($(LLVM_IAS),1)
> +ifeq ($(LLVM_IAS),0)
>         KBUILD_CFLAGS += -Wa,-mno-relax
>         KBUILD_AFLAGS += -Wa,-mno-relax
>  endif



Please drop these two hunks.

I will apply my patch instead.
https://lore.kernel.org/patchwork/patch/1472580/






> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 1f4e3eb70f88..3ae63bd35582 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -22,12 +22,12 @@ else
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  endif # CROSS_COMPILE
>
> -ifeq ($(LLVM_IAS),1)
> -CLANG_FLAGS    += -integrated-as
> -else
> +ifeq ($(LLVM_IAS),0)
>  CLANG_FLAGS    += -no-integrated-as
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +else
> +CLANG_FLAGS    += -integrated-as
>  endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>
> base-commit: d7a86429dbc691bf540688fcc8542cc20246a85b
> prerequisite-patch-id: 0d3072ecb5fd06ff6fd6ea81fe601f6c54c23910
> prerequisite-patch-id: 2654829756eb8a094a0ffad1679caa75a4d86619
> prerequisite-patch-id: a51e7885ca2376d008bbf146a5589da247806f7b
> --
> 2.32.0.554.ge1b32706d8-goog
>


When we negate a flag that is enabled by default,
which is a common way?
 - set it to '0'
 - set is to empty


So, I was wondering if we should support
not only LLVM_IAS=0 but also LLVM_IAS=.

What do you think?


-- 
Best Regards
Masahiro Yamada
