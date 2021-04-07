Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD6235742C
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 20:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhDGSYC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 14:24:02 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36571 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbhDGSYC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 14:24:02 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MPXxi-1lHTPR1SSY-00MduN; Wed, 07 Apr 2021 20:23:51 +0200
Received: by mail-wr1-f49.google.com with SMTP id y18so2879506wrn.6;
        Wed, 07 Apr 2021 11:23:51 -0700 (PDT)
X-Gm-Message-State: AOAM532w1foSpDlTB29KlKxMqcBby+nuRRt4cSxKKQpscSfRNzQ+LzYj
        T1PB1WY93OFMlxleK5J4IJ53+8SJv4BfdIa8C9I=
X-Google-Smtp-Source: ABdhPJz6wc70W2TXiXomk41RGh1ewR/98GpMkXJ3a/IZ9wfDCtO6JB3ZofStuvB0YyQBAEYNPujhuR/uV9VcGQl0jKM=
X-Received: by 2002:adf:c641:: with SMTP id u1mr5997458wrg.332.1617819831064;
 Wed, 07 Apr 2021 11:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <202104071815.lq85YO6c-lkp@intel.com> <CAKwvOdnrSorkpCCshZAav=1rczSTWa5Ji_Nhcd=vzmywAiCoNQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnrSorkpCCshZAav=1rczSTWa5Ji_Nhcd=vzmywAiCoNQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Apr 2021 20:23:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0NX4bpQUdHBhpo1s2PU465WjAOAPPzifeHuvFGi20NMw@mail.gmail.com>
Message-ID: <CAK8P3a0NX4bpQUdHBhpo1s2PU465WjAOAPPzifeHuvFGi20NMw@mail.gmail.com>
Subject: Re: arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table'
 from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        kbuild-all@lists.01.org, LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+SLddVpQRj2EsMpog9Z/APMCoV5pxPANfLH7GBH964/PdlBzEce
 9hiN9NMzT3Tyhz1qO4ocY7uy+DEtKqPzDtvsfXCHEYaLH0pRy09VP8MTyJ3FXkWpb7JBGbY
 D+oH1w54VMrCj2glch60fo8y3vzrtPcOfdGgNmmYxuAnelzgKQU9FgZbHCewxPPi7zq6S8j
 cH1o6tN1bf5j7/q146+tg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QmfxZLnxNN4=:aQGdhgUtxXxxCbOlWstFG5
 4A/I7hhfORzrSbjKmA+lhQf8fKbE4Cv7oXRdANcqI6e+kNkdpuzvSiw7u+Byhko9RxXxFWYGA
 S+RFeZtuVkMz8Cc5wQuGr461MTniBQRfN/CuDN8CvL9mTLpRdWwGrFxXH1NePzT74ZRP1XGK4
 qXZr4PMGjoshG+W032ZuSn8eY4DzaNTInkxrdEELpM63Ml5OmVxchtottIooBaEboPrgofmD2
 xaDpRD8xNBz7Pvo7BJzv3zWbXzyD/SNhpRVkTSGpRXNweLDn56How1uMqoaAbv+jx3iFxBaA1
 0w7Cs/Snsefy9s14GFXH6kidEbTOjdtzgK47h1Ivf4c0EacdVqK4O4LTOdFaPRSeQrUqKC1c5
 LDVQ3cZwxy1q/i/0Mqr88Titijx3KDD2yyeC2+BNdBopvRnGY+nuOmZp2ARxUqoW2xokjPKaN
 TIlSd/3m/IJJ7oZoWGjSje8z65zkqx86xpG96OxwzZ6XAhD5BjhBkVKHJ7nwQvYm4a/dwxamE
 /KmvkLOfuZzVftwM7oOM/BeeEyQ+j2ha0JUYFKkpZWoPcb4FXCI8BaZNLwsDJlkFLMMLsm0C/
 Bhz8lBJFmmnUdrK3L0RjfUaShuzjAIcPxh
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 7, 2021 at 8:07 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Wed, Apr 7, 2021 at 3:52 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Kees,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2d743660786ec51f5c1fefd5782bbdee7b227db0
> > commit: 5a17850e251a55bba6d65aefbfeacfa9888cd2cd arm/build: Warn on orphan section placement
> > date:   7 months ago
> > config: arm-randconfig-r033-20210407 (attached as .config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
>
> Looks like arch/arm/include/asm/cpuidle.h defines
> `CPUIDLE_METHOD_OF_DECLARE` to create a static struct in such a
> section.  Only arch/arm/mach-omap2/pm33xx-core.c uses that macro.

Nick, Kees,

Should I resend my patch, or are you taking care of it?

https://lore.kernel.org/lkml/20201230155506.1085689-1-arnd@kernel.org/T/#u

         Arnd
