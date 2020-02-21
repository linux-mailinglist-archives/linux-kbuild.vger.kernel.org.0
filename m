Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8A05167934
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 10:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgBUJTv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 04:19:51 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51795 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgBUJTu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 04:19:50 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01L9JRP8001277;
        Fri, 21 Feb 2020 18:19:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01L9JRP8001277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582276768;
        bh=VmuyVpcSR865JyPo0oVfgzMcmXUB4YPWqRffdg846F0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k6u9vPdhI6KhWgKFa+85uXqNS1YYMM3fPKwoQ0+mXFsCqC7Qtlm+j6wX6feBp9XGB
         1BUxPU3PkoHO0BiRd2yZ2GByfUpx2+NP2NrIFgVObece6IUxFK2PRcUi6twQPO1gfY
         JBNqel9zTN4MB38yKaZgPGo43xybEJenJCh0+WTcb2kMMpi9ShcEqSpv/q8kJpQ6pE
         wlvStdWh0o5oQLZD9jkzu7XGI0oUs1yDNxY9A1jlyDo2S3apE1l/wh2hRBM5LlrFYN
         ElbrhVjxY+Edkw76jlulz1LngNsLOKencNnkq1Bf51eNsfukbttbhAgvjQTyVvfFPY
         nahV40hzNGuiw==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id w67so386968vkf.1;
        Fri, 21 Feb 2020 01:19:27 -0800 (PST)
X-Gm-Message-State: APjAAAVuYtRmr0nDg/8kBaJmiVRZrTkYGZPn6ASzt1mnGzYG2oDvaAPk
        /Wmf3GvNKPFMMLvEYH0ZhYR939Jh+5FQvx0jfk8=
X-Google-Smtp-Source: APXvYqzaz0mPSZK/ntfmxfvFupJ42NyBQt0nUrM/n8cwK4Ehx6Qt0V2MsrTaIIELjQXW5ad1WZ9ao8dfI393Harrrkg=
X-Received: by 2002:a1f:72c3:: with SMTP id n186mr16153825vkc.12.1582276766520;
 Fri, 21 Feb 2020 01:19:26 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200221085039eucas1p2b439c37eb04870cc020f452b7ad31929@eucas1p2.samsung.com>
 <20200216154502.26478-1-masahiroy@kernel.org> <e0212512-bc44-fc3a-a647-47eff86983b7@samsung.com>
In-Reply-To: <e0212512-bc44-fc3a-a647-47eff86983b7@samsung.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 21 Feb 2020 18:18:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQqsLnZc4h_XEMifS2hX+E39-vxD-BL5C59Aj+TaQo+eA@mail.gmail.com>
Message-ID: <CAK7LNAQqsLnZc4h_XEMifS2hX+E39-vxD-BL5C59Aj+TaQo+eA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use KBUILD_DEFCONFIG as the fallback for DEFCONFIG_LIST
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        X86 ML <x86@kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-um@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Borislav Petkov <bp@alien8.de>,
        "David S. Miller" <davem@davemloft.net>,
        Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jeff Dike <jdike@addtoit.com>, Nick Hu <nickhu@andestech.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rich Felker <dalias@libc.org>,
        Richard Weinberger <richard@nod.at>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Chen <deanbo422@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 21, 2020 at 5:50 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Dear All,
>
> On 16.02.2020 16:45, Masahiro Yamada wrote:
> > Most of the Kconfig commands (except defconfig and all*config) read the
> > .config file as a base set of CONFIG options.
> >
> > When it does not exist, the files in DEFCONFIG_LIST are searched in this
> > order and loaded if found.
> >
> > I do not see much sense in the last two entries in DEFCONFIG_LIST.
> >
> > [1] ARCH_DEFCONFIG
> >
> > The entry for DEFCONFIG_LIST is guarded by 'depends on !UML'. So, the
> > ARCH_DEFCONFIG definition in arch/x86/um/Kconfig is meaningless.
> >
> > arch/{sh,sparc,x86}/Kconfig define ARCH_DEFCONFIG depending on 32 or 64
> > bit variant symbols. This is a little bit strange; ARCH_DEFCONFIG should
> > be a fixed string because the base config file is loaded before the symbol
> > evaluation stage.
> >
> > Using KBUILD_DEFCONFIG is saner because it is fixed before Kconfig is
> > invoked. Fortunately, arch/{sh,sparc,x86}/Makefile define it in the
> > same way, and it works as expected. Hence, replace ARCH_DEFCONFIG with
> > "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)".
> >
> > [2] arch/$(ARCH)/defconfig
> >
> > This file path is no longer valid. The defconfig files are always located
> > in the arch configs/ directories.
> >
> >    $ find arch -name defconfig | sort
> >    arch/alpha/configs/defconfig
> >    arch/arm64/configs/defconfig
> >    arch/csky/configs/defconfig
> >    arch/nds32/configs/defconfig
> >    arch/riscv/configs/defconfig
> >    arch/s390/configs/defconfig
> >    arch/unicore32/configs/defconfig
> >
> > The path arch/*/configs/defconfig is already covered by
> > "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)". So, this file path is
> > not necessary.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> This patch landed in today's linux-next (next-20200221) and broke arm64
> builds:
>
> --->8---
>
> $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
> *** Default configuration is based on 'defconfig'
> #
> # configuration written to .config
> #
> $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image.gz
> scripts/kconfig/conf  --syncconfig Kconfig
> scripts/kconfig/conf  --syncconfig Kconfig
> scripts/kconfig/conf  --syncconfig Kconfig
> scripts/kconfig/conf  --syncconfig Kconfig
> scripts/kconfig/conf  --syncconfig Kconfig
> ...
>
> (endless loop)
>
> --->8---
>
> Reverting it fixes the issue:



My bad.

This is because arch/arm64/Makefile does not define
KBUILD_DEFCONFIG.



I will drop it.

Sorry about that.





>
> --->8---
>
> $ git revert cdd5d1a207d6a3a06c9e627a0234d9a6af6ad347
> [detached HEAD 1080d6a13b6d] Revert "kbuild: use KBUILD_DEFCONFIG as the
> fallback for DEFCONFIG_LIST"
>   5 files changed, 22 insertions(+), 1 deletion(-)
> $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
> *** Default configuration is based on 'defconfig'
> #
> # No change to .config
> #
> $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image.gz
> scripts/kconfig/conf  --syncconfig Kconfig
>    UPD     include/config/kernel.release
>    UPD     include/generated/utsrelease.h
>    CC      scripts/mod/empty.o
> ...
>
> $ aarch64-linux-gnu-gcc --version
> aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1) 7.4.0
> Copyright (C) 2017 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions. There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> --->8---
>
> It looks that the issue is similar to the one described here:
>
> https://patchwork.kernel.org/patch/10453685/
>
> I hope this report helps fixing the issue.
>
> > ---
> >
> >   arch/sh/Kconfig     | 5 -----
> >   arch/sparc/Kconfig  | 5 -----
> >   arch/x86/Kconfig    | 5 -----
> >   arch/x86/um/Kconfig | 5 -----
> >   init/Kconfig        | 3 +--
> >   5 files changed, 1 insertion(+), 22 deletions(-)
> >
> > diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> > index 9ece111b0254..b4f0e37b83eb 100644
> > --- a/arch/sh/Kconfig
> > +++ b/arch/sh/Kconfig
> > @@ -87,11 +87,6 @@ config SUPERH64
> >       select HAVE_EXIT_THREAD
> >       select KALLSYMS
> >
> > -config ARCH_DEFCONFIG
> > -     string
> > -     default "arch/sh/configs/shx3_defconfig" if SUPERH32
> > -     default "arch/sh/configs/cayman_defconfig" if SUPERH64
> > -
> >   config GENERIC_BUG
> >       def_bool y
> >       depends on BUG && SUPERH32
> > diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> > index c1dd6dd642f4..0de15380d1fc 100644
> > --- a/arch/sparc/Kconfig
> > +++ b/arch/sparc/Kconfig
> > @@ -95,11 +95,6 @@ config SPARC64
> >       select PCI_DOMAINS if PCI
> >       select ARCH_HAS_GIGANTIC_PAGE
> >
> > -config ARCH_DEFCONFIG
> > -     string
> > -     default "arch/sparc/configs/sparc32_defconfig" if SPARC32
> > -     default "arch/sparc/configs/sparc64_defconfig" if SPARC64
> > -
> >   config ARCH_PROC_KCORE_TEXT
> >       def_bool y
> >
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index beea77046f9b..98935f4387f9 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -240,11 +240,6 @@ config OUTPUT_FORMAT
> >       default "elf32-i386" if X86_32
> >       default "elf64-x86-64" if X86_64
> >
> > -config ARCH_DEFCONFIG
> > -     string
> > -     default "arch/x86/configs/i386_defconfig" if X86_32
> > -     default "arch/x86/configs/x86_64_defconfig" if X86_64
> > -
> >   config LOCKDEP_SUPPORT
> >       def_bool y
> >
> > diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
> > index a8985e1f7432..95d26a69088b 100644
> > --- a/arch/x86/um/Kconfig
> > +++ b/arch/x86/um/Kconfig
> > @@ -27,11 +27,6 @@ config X86_64
> >       def_bool 64BIT
> >       select MODULES_USE_ELF_RELA
> >
> > -config ARCH_DEFCONFIG
> > -     string
> > -     default "arch/um/configs/i386_defconfig" if X86_32
> > -     default "arch/um/configs/x86_64_defconfig" if X86_64
> > -
> >   config 3_LEVEL_PGTABLES
> >       bool "Three-level pagetables" if !64BIT
> >       default 64BIT
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 452bc1835cd4..6ccdb168dee5 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -6,8 +6,7 @@ config DEFCONFIG_LIST
> >       default "/lib/modules/$(shell,uname -r)/.config"
> >       default "/etc/kernel-config"
> >       default "/boot/config-$(shell,uname -r)"
> > -     default ARCH_DEFCONFIG
> > -     default "arch/$(ARCH)/defconfig"
> > +     default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
> >
> >   config CC_IS_GCC
> >       def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>


-- 
Best Regards
Masahiro Yamada
