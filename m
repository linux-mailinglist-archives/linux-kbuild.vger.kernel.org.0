Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D838C1828C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2020 07:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387786AbgCLGNR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Mar 2020 02:13:17 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16966 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387767AbgCLGNR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Mar 2020 02:13:17 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 02C6D56Q008807;
        Thu, 12 Mar 2020 15:13:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02C6D56Q008807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583993586;
        bh=QdsYTwRD/NXf7E3Vc491owN77X3TI+BMC36RI8c4GC4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n27uJzG38zU1gF16TRtHMWtuu3rGnQvebZAdH8VWC5c1WtsdBslPFMjd/U2tlOKjL
         kFIn62/tZHshXbD2pHdYPSN7OUl4sEq7k3puJXz/itCKoEXR1kfYwphCDi61qOkQgL
         mBqoV5ZKqjF5Bd3aBsxuHSvWYjsHZldpuO2R9y0oCx4s6w6X5R6FgRcOHXN3n8HFG3
         G4z6uYRuwGoskBIxrp+e0ax3icGU77ExHhMDcgYY37xsMM0kCzhuqINRalu7IDWpE/
         GoakKVm3TEehGdhCq3fIb111wJxmpBEDW34lk4HpNzaDIaZ4r1TdJ/J1wK0RKqosaV
         OuxLMg195EIBg==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id z125so2946876vsb.13;
        Wed, 11 Mar 2020 23:13:06 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2Zf1lal/ktsH9c1WH+QCeivpK3WykkFTwEg7YDcryYLbFMdoE6
        /mtezDGK6dcjwf0v6IhQl2I64qlkclWPfOqf0iA=
X-Google-Smtp-Source: ADFU+vuJbHkcCBIr3GGlbkwsmOWgTPyYanmOAqnvKkLMJFFYp/ZckKbbMW76oHgTbVqEl76sDPBr8VEtUHfrtkNttDE=
X-Received: by 2002:a67:8745:: with SMTP id j66mr3205235vsd.181.1583993584819;
 Wed, 11 Mar 2020 23:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200311223725.27662-2-masahiroy@kernel.org> <202003121230.lys3M8E8%lkp@intel.com>
In-Reply-To: <202003121230.lys3M8E8%lkp@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 12 Mar 2020 15:12:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNARwR5X2C_VzK_3RZo+30Cu3uPuiw-rFUut1j8azLhbxAA@mail.gmail.com>
Message-ID: <CAK7LNARwR5X2C_VzK_3RZo+30Cu3uPuiw-rFUut1j8azLhbxAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: link lib-y objects to vmlinux forcibly
 when CONFIG_MODULES=y
To:     inux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "sparclinux@vger.kernel.org, David S . Miller" <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi MIPS forks,


I got the following report from 0-day bot.
Please advise me how to fix it.


I am not sure how multi-platform works in MIPS.

The cavium-octeon platform has its own implementation
of various functions.

So, vmlinux links different library routines
depending on whether CONFIG_CAVIUM_OCTEON_SOC, correct?



fw_init_cmdline():
arch/mips/cavium-octeon/setup.c
arch/mips/fw/lib/cmdline.c


__delay(), __udelay(), __ndelay():
arch/mips/cavium-octeon/csrc-octeon.c
arch/mips/lib/delay.S


memcpy(), memmove():
arch/mips/cavium-octeon/octeon-memcpy.S
arch/mips/lib/memcpy.S



FWIW, the following fixes the multiple definition errors.



diff --git a/arch/mips/fw/lib/cmdline.c b/arch/mips/fw/lib/cmdline.c
index 6ecda64ad184..6ac6e0493e1f 100644
--- a/arch/mips/fw/lib/cmdline.c
+++ b/arch/mips/fw/lib/cmdline.c
@@ -16,6 +16,7 @@ int fw_argc;
 int *_fw_argv;
 int *_fw_envp;

+#ifndef CONFIG_CAVIUM_OCTEON_SOC
 void __init fw_init_cmdline(void)
 {
        int i;
@@ -41,6 +42,7 @@ void __init fw_init_cmdline(void)
                        strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
        }
 }
+#endif

 char * __init fw_getcmdline(void)
 {
diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 479f50559c83..4cc98af4161a 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -3,10 +3,14 @@
 # Makefile for MIPS-specific library files..
 #

-lib-y  += bitops.o csum_partial.o delay.o memcpy.o memset.o \
+lib-y  += bitops.o csum_partial.o memset.o \
           mips-atomic.o strncpy_user.o \
           strnlen_user.o uncached.o

+ifneq ($(CONFIG_CAVIUM_OCTEON_SOC),y)
+lib-y  += delay.o memcpy.o
+endif
+
 obj-y                  += iomap_copy.o
 obj-$(CONFIG_PCI)      += iomap-pci.o
 lib-$(CONFIG_GENERIC_CSUM)     := $(filter-out csum_partial.o, $(lib-y))



On Thu, Mar 12, 2020 at 1:31 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Masahiro,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on kbuild/for-next]
> [also build test ERROR on v5.6-rc5 next-20200311]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/sparc-revive-__HAVE_ARCH_STRLEN-for-32bit-sparc/20200312-073459
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> config: mips-cavium_octeon_defconfig (attached as .config)
> compiler: mips64-linux-gcc (GCC) 9.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=9.2.0 make.cross ARCH=mips
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    mips64-linux-ld: arch/mips/fw/lib/cmdline.o: in function `fw_init_cmdline':
> >> cmdline.c:(.init.text+0x0): multiple definition of `fw_init_cmdline'; arch/mips/cavium-octeon/setup.o:setup.c:(.init.text+0xad8): first defined here
>    mips64-linux-ld: arch/mips/lib/delay.o: in function `__delay':
> >> delay.c:(.text+0x0): multiple definition of `__delay'; arch/mips/cavium-octeon/csrc-octeon.o:csrc-octeon.c:(.text+0x80): first defined here
>    mips64-linux-ld: arch/mips/lib/delay.o: in function `__udelay':
> >> delay.c:(.text+0x10): multiple definition of `__udelay'; arch/mips/cavium-octeon/csrc-octeon.o:csrc-octeon.c:(.text+0x8): first defined here
>    mips64-linux-ld: arch/mips/lib/delay.o: in function `__ndelay':
> >> delay.c:(.text+0x50): multiple definition of `__ndelay'; arch/mips/cavium-octeon/csrc-octeon.o:csrc-octeon.c:(.text+0x40): first defined here
>    mips64-linux-ld: arch/mips/lib/memcpy.o: in function `memmove':
> >> (.text+0x0): multiple definition of `memmove'; arch/mips/cavium-octeon/octeon-memcpy.o:(.text+0x3a0): first defined here
>    mips64-linux-ld: arch/mips/lib/memcpy.o: in function `__rmemcpy':
> >> (.text+0x20): multiple definition of `__rmemcpy'; arch/mips/cavium-octeon/octeon-memcpy.o:(.text+0x3c0): first defined here
>    mips64-linux-ld: arch/mips/lib/memcpy.o: in function `memcpy':
> >> (.text+0x80): multiple definition of `memcpy'; arch/mips/cavium-octeon/octeon-memcpy.o:(.text+0x0): first defined here
>    mips64-linux-ld: arch/mips/lib/memcpy.o: in function `memcpy':
> >> (.text+0x84): multiple definition of `__copy_user'; arch/mips/cavium-octeon/octeon-memcpy.o:(.text+0x4): first defined here
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



--
Best Regards
Masahiro Yamada
