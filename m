Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC574A3C5D
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Aug 2019 18:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbfH3Qno (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Aug 2019 12:43:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33462 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728398AbfH3Qno (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Aug 2019 12:43:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id g2so5001488pfq.0;
        Fri, 30 Aug 2019 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VNBQ1chA7+4ZBueyMDenxYPRvvVnw6pf4AyPEc3095E=;
        b=nCpbACGMO5QiNRc8Xk/61GOsW/YhHLbzmVKE9PJVOriZeq2zFg+spp+LfpUHqDsbYX
         haTkaK51AmfqKjz/lJ1oyFwS32GmSQD/TrD9zB4vbErDZEjJPWlUkb9XhASYCMrTa7uZ
         QDrtZGT7XRguAwWA7SV7TcnfOVC65GuEtRvJ0qZdsEZLhP0btVX+NbIdHbHRNzYNnt1J
         iuKDTBQnOEITvuWzzeWPLyZWd7YF1AT8J2q4e60ByVtMpeCKlbt5a0RcqZ/ehbEV0ShI
         83VQ5TytCulnLyQ5LEEYE7Z76TK5EDP4ATJGM0wJI+QZeCbgNFf9MsBefGyMMD+pacDg
         95sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VNBQ1chA7+4ZBueyMDenxYPRvvVnw6pf4AyPEc3095E=;
        b=sd97GtsYru7asC403MpgATIPHhDDkFkvwhPswT8utPlDWVvl5JFj8OUS7Y7faL0puO
         Bffe9vMJIWCIC9ba6hkfpYQSVPHdZDw+nLoZJa9Kw/b0+XdfxBNSRwRE2IypgzqSLhh8
         tZUf13TAF6wELqfiuTXyxKOExXJlsnxcVwQTNvGWaet1CE81D1m8RTdKxYWGpDQ+rF0l
         RgcYiOQW6ymk1LsBuVwSJuOugNNK5gjKRkZaLwlIqpz6SBOrXHDOMgMlzLNGVAKP701O
         mQGPzDBleBZnzFHvYuK3W5VQQMWQo6YOdUJkzemnTcrui9UHF1OBeqC8kj/vudwLpeJ2
         rl8w==
X-Gm-Message-State: APjAAAVfR7v21nlAeOqDyOvx7LusQIL9vNVTmIL1ZXTYRrDsMFppCrzu
        iy5J0FbBZzidDkRFDMf2M9o=
X-Google-Smtp-Source: APXvYqwEcOULbREIS0APtpYMUMu8rqYHmA5+3LgHpsV9idyqTfew1ueMzBrxNb0FstVhcGgkyq8wVQ==
X-Received: by 2002:a17:90a:b108:: with SMTP id z8mr16660979pjq.108.1567183422841;
        Fri, 30 Aug 2019 09:43:42 -0700 (PDT)
Received: from [192.168.100.64] ([198.182.47.47])
        by smtp.gmail.com with ESMTPSA id s4sm5534693pjp.15.2019.08.30.09.43.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 09:43:41 -0700 (PDT)
Subject: Re: [PATCH 2/3] kbuild, arc: add
 CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3 for ARC
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org
References: <20190820170941.26193-1-yamada.masahiro@socionext.com>
 <20190820170941.26193-2-yamada.masahiro@socionext.com>
From:   Vineet Gupta <vineetg76@gmail.com>
Message-ID: <ed251c63-10e0-bd8a-1a9b-be9ade5cad3f@gmail.com>
Date:   Fri, 30 Aug 2019 09:43:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820170941.26193-2-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/20/19 10:09 AM, Masahiro Yamada wrote:
> arch/arc/Makefile overrides -O2 with -O3. This is the only user of
> ARCH_CFLAGS. There is no user of ARCH_CPPFLAGS or ARCH_AFLAGS.
> My plan is to remove ARCH_{CPP,A,C}FLAGS after refactoring the ARC
> Makefile.

Why, it seems like a good generic facility for arches to over-ride stuff
(specially adding any toggles at the end of cmdline).

And even if there are no current users, it would be good to have. I understand we
don't keep code for future, but strictly this is meta-code ;-)

> Currently, ARC has no way to enable -Wmaybe-uninitialized because both
> -O3 and -Os disable it. Enabling it will be useful for compile-testing.
> This commit allows allmodconfig (, which defaults to -O2) to enable it.

But this is a separate issue and was done on purpose because of unbearable build
spew at the time. As an experiment I enabled it in current kernel and at -O3 we
still get the dreaded spew in net/sunrpc/xdr.c and some more in net/ipv4. The spew
doesn't happen at -O2 and seems not ARC specific as I can see this with ARM -O3
build with gcc 7.3 (buildroot 2018.08)

| $ make ARCH=arm CROSS_COMPILE=arm-linux- net
| ......
| ......
| ../net/sunrpc/xdr.c: In function ‘xdr_encode_word’:
| ../net/sunrpc/xdr.c:1199:2: warning: ‘subbuf.tail[0].iov_base’ may be used
| uninitialized in this function [-Wmaybe-uninitialized]
|  memcpy(subbuf->tail[0].iov_base, obj, this_len);
|  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../net/sunrpc/xdr.c:1205:17: note: ‘subbuf.tail[0].iov_base’ was declared here
|  struct xdr_buf subbuf;


I understand the value of this toggle, but the spew is too much and at times
obfuscated likely other real issues.
> Add CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y to all the defconfig files
> in arch/arc/configs/ in order to keep the current config settings.

My first reaction to adding this to all defconfigs was that this was inelegant :
for lack of better word :-)

But indeed it seems better this way as we can now experiment with -O2 vs. -O3 from
config, rather than hardwiring to -O3.

So if you could please split out the Wmaybe-uninitialized change

Acked-by: Vineet Gupta <vgupta@synopsys.com>

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
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
> @@ -716,10 +716,12 @@ KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, address-of-packed-member)
>  
> -ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> -KBUILD_CFLAGS	+= -Os
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
>  cflags-$(CONFIG_ARC_DW2_UNWIND)		+= -fasynchronous-unwind-tables $(cfi)
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
>  	default CC_OPTIMIZE_FOR_PERFORMANCE
>  
>  config CC_OPTIMIZE_FOR_PERFORMANCE
> -	bool "Optimize for performance"
> +	bool "Optimize for performance (-O2)"
>  	help
>  	  This is the default optimization level for the kernel, building
>  	  with the "-O2" compiler flag for best performance and most
>  	  helpful compile-time warnings.
>  
> +config CC_OPTIMIZE_FOR_PERFORMANCE_O3
> +	bool "Optimize more for performance (-O3)"
> +	depends on ARC
> +	imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
> +	help
> +	  Choosing this option will pass "-O3" to your compiler to optimize
> +	  the kernel yet more for performance.
> +
>  config CC_OPTIMIZE_FOR_SIZE
> -	bool "Optimize for size"
> +	bool "Optimize for size (-Os)"
>  	imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
>  	help
>  	  Choosing this option will pass "-Os" to your compiler resulting
> 

