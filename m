Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE8ECA077C
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 18:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfH1QhM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 12:37:12 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:60968 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfH1QhL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:37:11 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x7SGamhu026496;
        Thu, 29 Aug 2019 01:36:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x7SGamhu026496
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567010210;
        bh=pzFnxHPByWE3p5MgyLZIinhZ1DpXXFl4e2A55YJh8R0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kf2t8NX17fIM4WLdsCznvCQKVHoax8oawuyhazOXKvxBX9Ku+VEIenw2i37Tp+Ffg
         cKq0V1bRNxyK5gx7KJprGW18rWpR2mEwfUEY4G/nSTMn9MjtXyugYVwBem2sdBJa9M
         a9YR7Z5o47AyyGC1IIR6W34lAXg4BvZIeonMkDPdC3N5d80fHVPhRlp2mNwiyYD7sv
         hqlAVU16kXDIHIdG1XyhcdaIz+Soq0cDavGQ0QF7LZIeKzD+YiDY2I8sn9hkq/Co72
         CLioEQk/HjBzroxxzzF7MeVp1MtUW467n68O6CESQ+USJEl+9wRkagWx7PgFm1Klev
         nEQiew96kf0yg==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id b187so383955vsc.9;
        Wed, 28 Aug 2019 09:36:49 -0700 (PDT)
X-Gm-Message-State: APjAAAXZvI0vawK7J1SSx178HLm+gIxI+ccmjm04aFftD+cYhwGUisri
        T8MwIb2BV0HDUyYHhXt8xydEtM8BhxN9hk4c//U=
X-Google-Smtp-Source: APXvYqzMmPYwM8DIHHUW6yOGBja2/aVO+uGvVU0EP7bREIinhmy/brVHqrnSJ0mtaKhqwD1tfdotXsyqq0cRHfw4qEw=
X-Received: by 2002:a05:6102:20c3:: with SMTP id i3mr3019861vsr.155.1567010207932;
 Wed, 28 Aug 2019 09:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190820170941.26193-1-yamada.masahiro@socionext.com> <20190820170941.26193-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190820170941.26193-2-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 29 Aug 2019 01:36:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-ajH0qMseqJ3HqbBJWhBRbh8axW1bnjfZv+XSRY+1Ag@mail.gmail.com>
Message-ID: <CAK7LNAT-ajH0qMseqJ3HqbBJWhBRbh8axW1bnjfZv+XSRY+1Ag@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild,arc: add CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
 for ARC
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        arcml <linux-snps-arc@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Vineet,

On Wed, Aug 21, 2019 at 2:10 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> arch/arc/Makefile overrides -O2 with -O3. This is the only user of
> ARCH_CFLAGS. There is no user of ARCH_CPPFLAGS or ARCH_AFLAGS.
> My plan is to remove ARCH_{CPP,A,C}FLAGS after refactoring the ARC
> Makefile.
>
> Currently, ARC has no way to enable -Wmaybe-uninitialized because both
> -O3 and -Os disable it. Enabling it will be useful for compile-testing.
> This commit allows allmodconfig (, which defaults to -O2) to enable it.
>
> Add CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y to all the defconfig files
> in arch/arc/configs/ in order to keep the current config settings.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

If it is OK to apply this to my kbuild tree,
can I get your ACK?

If you see any problem, please let me know.

Thanks.



>
>  Makefile                                   | 10 ++++++----
>  arch/arc/Makefile                          |  8 --------
>  arch/arc/configs/axs101_defconfig          |  1 +
>  arch/arc/configs/axs103_defconfig          |  1 +
>  arch/arc/configs/axs103_smp_defconfig      |  1 +
>  arch/arc/configs/haps_hs_defconfig         |  1 +
>  arch/arc/configs/haps_hs_smp_defconfig     |  1 +
>  arch/arc/configs/hsdk_defconfig            |  1 +
>  arch/arc/configs/nps_defconfig             |  1 +
>  arch/arc/configs/nsim_700_defconfig        |  1 +
>  arch/arc/configs/nsim_hs_defconfig         |  1 +
>  arch/arc/configs/nsim_hs_smp_defconfig     |  1 +
>  arch/arc/configs/nsimosci_defconfig        |  1 +
>  arch/arc/configs/nsimosci_hs_defconfig     |  1 +
>  arch/arc/configs/nsimosci_hs_smp_defconfig |  1 +
>  arch/arc/configs/tb10x_defconfig           |  1 +
>  arch/arc/configs/vdk_hs38_defconfig        |  1 +
>  arch/arc/configs/vdk_hs38_smp_defconfig    |  1 +
>  init/Kconfig                               | 12 ++++++++++--
>  19 files changed, 32 insertions(+), 14 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index bc55f366677d..891e47da503f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -716,10 +716,12 @@ KBUILD_CFLAGS     += $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, address-of-packed-member)
>
> -ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> -KBUILD_CFLAGS  += -Os
> -else
> -KBUILD_CFLAGS   += -O2
> +ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
> +KBUILD_CFLAGS += -O2
> +else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
> +KBUILD_CFLAGS += -O3
> +else ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> +KBUILD_CFLAGS += -Os
>  endif
>
>  ifdef CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index ee6d1184c2b1..f1c44cccf8d6 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -48,14 +48,6 @@ endif
>  cfi := $(call as-instr,.cfi_startproc\n.cfi_endproc,-DARC_DW2_UNWIND_AS_CFI)
>  cflags-$(CONFIG_ARC_DW2_UNWIND)                += -fasynchronous-unwind-tables $(cfi)
>
> -ifndef CONFIG_CC_OPTIMIZE_FOR_SIZE
> -# Generic build system uses -O2, we want -O3
> -# Note: No need to add to cflags-y as that happens anyways
> -#
> -# Disable the false maybe-uninitialized warings gcc spits out at -O3
> -ARCH_CFLAGS += -O3 $(call cc-disable-warning,maybe-uninitialized,)
> -endif
> -
>  # small data is default for elf32 tool-chain. If not usable, disable it
>  # This also allows repurposing GP as scratch reg to gcc reg allocator
>  disable_small_data := y
> diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
> index e31a8ebc3ecc..0016149f9583 100644
> --- a/arch/arc/configs/axs101_defconfig
> +++ b/arch/arc/configs/axs101_defconfig
> @@ -9,6 +9,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
> index e0e8567f0d75..5b031582a1cf 100644
> --- a/arch/arc/configs/axs103_defconfig
> +++ b/arch/arc/configs/axs103_defconfig
> @@ -9,6 +9,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
> index fcbc952bc75b..d4eec39e0112 100644
> --- a/arch/arc/configs/axs103_smp_defconfig
> +++ b/arch/arc/configs/axs103_smp_defconfig
> @@ -9,6 +9,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/arch/arc/configs/haps_hs_defconfig b/arch/arc/configs/haps_hs_defconfig
> index 436f2135bdc1..47ff8a97e42d 100644
> --- a/arch/arc/configs/haps_hs_defconfig
> +++ b/arch/arc/configs/haps_hs_defconfig
> @@ -10,6 +10,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_EXPERT=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_COMPAT_BRK is not set
> diff --git a/arch/arc/configs/haps_hs_smp_defconfig b/arch/arc/configs/haps_hs_smp_defconfig
> index 33a787c375e2..9685fd5f57a4 100644
> --- a/arch/arc/configs/haps_hs_smp_defconfig
> +++ b/arch/arc/configs/haps_hs_smp_defconfig
> @@ -10,6 +10,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
> index 403125d9c9a3..9b9a74444ce2 100644
> --- a/arch/arc/configs/hsdk_defconfig
> +++ b/arch/arc/configs/hsdk_defconfig
> @@ -9,6 +9,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_BLK_DEV_RAM=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/arch/arc/configs/nps_defconfig b/arch/arc/configs/nps_defconfig
> index f0a077c00efa..5978d4d7d5b0 100644
> --- a/arch/arc/configs/nps_defconfig
> +++ b/arch/arc/configs/nps_defconfig
> @@ -6,6 +6,7 @@ CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_SYSCTL_SYSCALL=y
>  # CONFIG_EPOLL is not set
>  # CONFIG_SIGNALFD is not set
> diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
> index de398c7b10b3..2b9b11474640 100644
> --- a/arch/arc/configs/nsim_700_defconfig
> +++ b/arch/arc/configs/nsim_700_defconfig
> @@ -10,6 +10,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
> diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
> index 2dbd34a9ff07..bab3dd255841 100644
> --- a/arch/arc/configs/nsim_hs_defconfig
> +++ b/arch/arc/configs/nsim_hs_defconfig
> @@ -10,6 +10,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
> diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
> index c7135f1e2583..90d2d50fb8dc 100644
> --- a/arch/arc/configs/nsim_hs_smp_defconfig
> +++ b/arch/arc/configs/nsim_hs_smp_defconfig
> @@ -8,6 +8,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
> diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
> index 385a71d3c478..5dd470b6609e 100644
> --- a/arch/arc/configs/nsimosci_defconfig
> +++ b/arch/arc/configs/nsimosci_defconfig
> @@ -10,6 +10,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
> diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
> index 248a2c3bdc12..3532e86f7bff 100644
> --- a/arch/arc/configs/nsimosci_hs_defconfig
> +++ b/arch/arc/configs/nsimosci_hs_defconfig
> @@ -10,6 +10,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
> diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
> index 1a4bc7b660fb..d90448bee064 100644
> --- a/arch/arc/configs/nsimosci_hs_smp_defconfig
> +++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
> @@ -8,6 +8,7 @@ CONFIG_IKCONFIG_PROC=y
>  # CONFIG_UTS_NS is not set
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_KPROBES=y
> diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
> index dc739bd093e3..3a138f8c7299 100644
> --- a/arch/arc/configs/tb10x_defconfig
> +++ b/arch/arc/configs/tb10x_defconfig
> @@ -14,6 +14,7 @@ CONFIG_INITRAMFS_SOURCE="../tb10x-rootfs.cpio"
>  CONFIG_INITRAMFS_ROOT_UID=2100
>  CONFIG_INITRAMFS_ROOT_GID=501
>  # CONFIG_RD_GZIP is not set
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_SYSCTL_SYSCALL=y
>  CONFIG_KALLSYMS_ALL=y
>  # CONFIG_AIO is not set
> diff --git a/arch/arc/configs/vdk_hs38_defconfig b/arch/arc/configs/vdk_hs38_defconfig
> index 0c3b21416819..d7c858df520c 100644
> --- a/arch/arc/configs/vdk_hs38_defconfig
> +++ b/arch/arc/configs/vdk_hs38_defconfig
> @@ -4,6 +4,7 @@ CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
> index f9ad9d3ee702..015c1d43889e 100644
> --- a/arch/arc/configs/vdk_hs38_smp_defconfig
> +++ b/arch/arc/configs/vdk_hs38_smp_defconfig
> @@ -4,6 +4,7 @@ CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/init/Kconfig b/init/Kconfig
> index 149efd82447f..92118505dd33 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1209,14 +1209,22 @@ choice
>         default CC_OPTIMIZE_FOR_PERFORMANCE
>
>  config CC_OPTIMIZE_FOR_PERFORMANCE
> -       bool "Optimize for performance"
> +       bool "Optimize for performance (-O2)"
>         help
>           This is the default optimization level for the kernel, building
>           with the "-O2" compiler flag for best performance and most
>           helpful compile-time warnings.
>
> +config CC_OPTIMIZE_FOR_PERFORMANCE_O3
> +       bool "Optimize more for performance (-O3)"
> +       depends on ARC
> +       imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
> +       help
> +         Choosing this option will pass "-O3" to your compiler to optimize
> +         the kernel yet more for performance.
> +
>  config CC_OPTIMIZE_FOR_SIZE
> -       bool "Optimize for size"
> +       bool "Optimize for size (-Os)"
>         imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
>         help
>           Choosing this option will pass "-Os" to your compiler resulting
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
