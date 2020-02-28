Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF87172F8C
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 04:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730712AbgB1Dtg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 22:49:36 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:43740 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730586AbgB1Dtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 22:49:36 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01S3nVlx010153;
        Fri, 28 Feb 2020 12:49:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01S3nVlx010153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582861773;
        bh=0NA3c9ClvYWuHtCt4C8GLQVJE0FJkSJ4u+rIf89zeHg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R4c+9yjcvOE2sEQspIq91LVOb2UQ+h9DTGwsJDEAAx7oMvRlFGOzk31w2bNxLamGZ
         LPoD0IZ0nppfL1n/wd84+/1nO6OST8tLzN4QltfpyeVuFIsYu1J4+XArs0/7/CqttR
         RkubVUaZnxUMWJxCW2jDvWH4V5b5FIs9pcifJZMrf8OFKbrXw9IWrHxWKTQcSSji5X
         DR/JYk31sw9OpX4aTO95XqVwoiWMMNat2oHswj/7z4OMWu5fMAlG3HkzQYtoIui3yq
         0WFnLbYXzzfbZRwiuljXqeHpHHc1nvNW0VdEINoLYUznjzL/98OxKS4a8hThr0qvJS
         2zyxjnVaDL6kg==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id g15so1147908vsf.1;
        Thu, 27 Feb 2020 19:49:32 -0800 (PST)
X-Gm-Message-State: ANhLgQ0hmS32e2WdU1NZElLdj4dfvBtjG1aHXSA2uQE/kbnCFkVP3tXW
        mILVsdbSXKQV1RUW1sBk2co6OJNg3M04Jk3YG6k=
X-Google-Smtp-Source: ADFU+vtgzns8RGzyKG8zrynO/4mPoxb0CGvRKAbbbXqzGGgP6fnJkububhLMea2CIvqS+X2cWTJVQ0EN0vu/seUEuds=
X-Received: by 2002:a67:fa4b:: with SMTP id j11mr1471344vsq.155.1582861770888;
 Thu, 27 Feb 2020 19:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20200228034640.25247-1-masahiroy@kernel.org>
In-Reply-To: <20200228034640.25247-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Feb 2020 12:48:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS9uWyvFeVkxtbkuBrnqumYzzLfcsUrVByHHyons4m8hA@mail.gmail.com>
Message-ID: <CAK7LNAS9uWyvFeVkxtbkuBrnqumYzzLfcsUrVByHHyons4m8hA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use KBUILD_DEFCONFIG as the fallback for DEFCONFIG_LIST
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, linux-um@lists.infradead.org,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 28, 2020 at 12:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Most of the Kconfig commands (except defconfig and all*config) read
> the .config file as a base set of CONFIG options.
>
> When it does not exist, the files in DEFCONFIG_LIST are searched in
> this order and loaded if found.
>
> I do not see much sense in the last two lines in DEFCONFIG_LIST.
>
> [1] ARCH_DEFCONFIG
>
> The entry for DEFCONFIG_LIST is guarded by 'depends on !UML'. So, the
> ARCH_DEFCONFIG definition in arch/x86/um/Kconfig is meaningless.
>
> arch/{sh,sparc,x86}/Kconfig define ARCH_DEFCONFIG depending on 32 or
> 64 bit variant symbols. This is a little bit strange; ARCH_DEFCONFIG
> should be a fixed string because the base config file is loaded before
> the symbol evaluation stage.
>
> Using KBUILD_DEFCONFIG makes more sense because it is fixed before
> Kconfig is invoked. Fortunately, arch/{sh,sparc,x86}/Makefile define it
> in the same way, and it works as expected. Hence, replace ARCH_DEFCONFIG
> with "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)".
>
> [2] arch/$(ARCH)/defconfig
>
> This file path is no longer valid. The defconfig files are always located
> in the arch configs/ directories.
>
>   $ find arch -name defconfig | sort
>   arch/alpha/configs/defconfig
>   arch/arm64/configs/defconfig
>   arch/csky/configs/defconfig
>   arch/nds32/configs/defconfig
>   arch/riscv/configs/defconfig
>   arch/s390/configs/defconfig
>   arch/unicore32/configs/defconfig
>
> The path arch/*/configs/defconfig is already covered by
> "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)". So, this file path is
> not necessary.
>
> I moved the default KBUILD_DEFCONFIG to the top Makefile. Otherwise,
> the 7 architectures listed above would end up with endless loop of
> syncconfig.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


I forgot to say this.
This is v2.

Changes in v2:
  - Move KBUILD_DEFCONFIG to fix endless loop of syncconfig


> ---
>
>  Makefile                 | 3 +++
>  arch/sh/Kconfig          | 5 -----
>  arch/sparc/Kconfig       | 5 -----
>  arch/x86/Kconfig         | 5 -----
>  arch/x86/um/Kconfig      | 5 -----
>  init/Kconfig             | 3 +--
>  scripts/kconfig/Makefile | 4 ----
>  7 files changed, 4 insertions(+), 26 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 81d130ad9534..17cc09304561 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -388,6 +388,9 @@ endif
>  KCONFIG_CONFIG ?= .config
>  export KCONFIG_CONFIG
>
> +# Default file for 'make defconfig'. This may be overridden by arch-Makefile.
> +export KBUILD_DEFCONFIG := defconfig
> +
>  # SHELL used by kbuild
>  CONFIG_SHELL := sh
>
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 9ece111b0254..b4f0e37b83eb 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -87,11 +87,6 @@ config SUPERH64
>         select HAVE_EXIT_THREAD
>         select KALLSYMS
>
> -config ARCH_DEFCONFIG
> -       string
> -       default "arch/sh/configs/shx3_defconfig" if SUPERH32
> -       default "arch/sh/configs/cayman_defconfig" if SUPERH64
> -
>  config GENERIC_BUG
>         def_bool y
>         depends on BUG && SUPERH32
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index c1dd6dd642f4..0de15380d1fc 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -95,11 +95,6 @@ config SPARC64
>         select PCI_DOMAINS if PCI
>         select ARCH_HAS_GIGANTIC_PAGE
>
> -config ARCH_DEFCONFIG
> -       string
> -       default "arch/sparc/configs/sparc32_defconfig" if SPARC32
> -       default "arch/sparc/configs/sparc64_defconfig" if SPARC64
> -
>  config ARCH_PROC_KCORE_TEXT
>         def_bool y
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index beea77046f9b..98935f4387f9 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -240,11 +240,6 @@ config OUTPUT_FORMAT
>         default "elf32-i386" if X86_32
>         default "elf64-x86-64" if X86_64
>
> -config ARCH_DEFCONFIG
> -       string
> -       default "arch/x86/configs/i386_defconfig" if X86_32
> -       default "arch/x86/configs/x86_64_defconfig" if X86_64
> -
>  config LOCKDEP_SUPPORT
>         def_bool y
>
> diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
> index a8985e1f7432..95d26a69088b 100644
> --- a/arch/x86/um/Kconfig
> +++ b/arch/x86/um/Kconfig
> @@ -27,11 +27,6 @@ config X86_64
>         def_bool 64BIT
>         select MODULES_USE_ELF_RELA
>
> -config ARCH_DEFCONFIG
> -       string
> -       default "arch/um/configs/i386_defconfig" if X86_32
> -       default "arch/um/configs/x86_64_defconfig" if X86_64
> -
>  config 3_LEVEL_PGTABLES
>         bool "Three-level pagetables" if !64BIT
>         default 64BIT
> diff --git a/init/Kconfig b/init/Kconfig
> index 20a6ac33761c..240c1ed15c69 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -6,8 +6,7 @@ config DEFCONFIG_LIST
>         default "/lib/modules/$(shell,uname -r)/.config"
>         default "/etc/kernel-config"
>         default "/boot/config-$(shell,uname -r)"
> -       default ARCH_DEFCONFIG
> -       default "arch/$(ARCH)/defconfig"
> +       default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
>
>  config CC_IS_GCC
>         def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 5887ceb6229e..c9d0a4a8efb3 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -12,10 +12,6 @@ else
>  Kconfig := Kconfig
>  endif
>
> -ifndef KBUILD_DEFCONFIG
> -KBUILD_DEFCONFIG := defconfig
> -endif
> -
>  ifeq ($(quiet),silent_)
>  silent := -s
>  endif
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
