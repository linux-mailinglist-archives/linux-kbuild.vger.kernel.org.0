Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5284117EDE0
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2020 02:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgCJBPD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Mar 2020 21:15:03 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:57081 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgCJBPD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Mar 2020 21:15:03 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 02A1ElFu020887;
        Tue, 10 Mar 2020 10:14:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02A1ElFu020887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583802888;
        bh=x9xblK1uaL7VxqRXLVjd3zu7PY3ClHR/2zhzP8sWvIM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dqkZwqApKQinuvyeu/wvLtq3cq4gfxcOsxLQ9eMacfeQQ9Q831k+j9wGKHwQM/90K
         jAbO69i6GOBA6AqjIHCqpd10VnB/kyB+z5TV+wukUCHD5A2eP2jIcXSbh92l4MBCYI
         xcWZjOBmXoayMKQBrToweH7zaTq/x2b8W+2n1TMkMRLdbeCSuKyHG7b6eloN0qx70N
         dJMZEYEOn7ipHGOA6X79c8wwY2vzrtFHX09wAxOGM9O2RzOXGarF1AwvlUBjGEjso5
         Fq4lu7xyXPqFARiCRIGNb7z6pAWKyVudtHxXSa+gwzSClW+hk5pa/cahmrBNeMCizp
         Qyc3SDIKD6yiA==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id q17so4053804uao.12;
        Mon, 09 Mar 2020 18:14:48 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1LUh6sCLa7ru3OLkB0XGg9vMvgO+Lei+dPvDGpN8XebVVeHYmA
        3JzIXhemuwaZzC4Ws8TqLSN/JJKV5Hko403iBFU=
X-Google-Smtp-Source: ADFU+vtsqUOYcSrvMFQYPzpImYlvktxcmXGRxbQ3Pd+7lJp1j1vZRWo0JCrCEGB8v4OcU2XlnuDTHXe3I5na3GbYx34=
X-Received: by 2002:ab0:25c8:: with SMTP id y8mr11157670uan.95.1583802887267;
 Mon, 09 Mar 2020 18:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200309023910.25370-1-masahiroy@kernel.org> <202003091801.6KQQKZ1Y%lkp@intel.com>
 <CAKwvOdksxVa=NGtyT3hsuHg6SJG4CbNWAepf+dxwVDC1+36zyw@mail.gmail.com>
In-Reply-To: <CAKwvOdksxVa=NGtyT3hsuHg6SJG4CbNWAepf+dxwVDC1+36zyw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 10 Mar 2020 10:14:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNATy3Eb9MNFua1N0vjo1Nn7FH5v6do5aU=cufTXvcEq6jw@mail.gmail.com>
Message-ID: <CAK7LNATy3Eb9MNFua1N0vjo1Nn7FH5v6do5aU=cufTXvcEq6jw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: link lib-y objects to vmlinux forcibly when CONFIG_MODULES=y
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     "David S. Miller" <davem@davemloft.net>, kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        =?UTF-8?B?Ru+/ve+/ve+/vW5nLXJ177+977+977+9IFPvv73vv73vv71uZw==?= 
        <maskray@google.com>, Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick, David,

On Tue, Mar 10, 2020 at 4:59 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Mar 9, 2020 at 3:55 AM kbuild test robot <lkp@intel.com> wrote:
> >
> > Hi Masahiro,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on kbuild/for-next]
> > [also build test ERROR on linux/master linus/master v5.6-rc5 next-20200306]
> > [if your patch is applied to the wrong git tree, please drop us a note to help
> > improve the system. BTW, we also suggest to use '--base' option to specify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> >
> > url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kbuild-link-lib-y-objects-to-vmlinux-forcibly-when-CONFIG_MODULES-y/20200309-115312
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> > config: sparc-defconfig (attached as .config)
> > compiler: sparc-linux-gcc (GCC) 7.5.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=7.5.0 make.cross ARCH=sparc
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    arch/sparc/lib/strlen.o: In function `strlen':
> > >> (.text+0x0): multiple definition of `strlen'
> >    lib/string.o:string.c:(.text+0x2b0): first defined here
>
> So this looks like a bug in 32b Sparc, that we should fix first.
>
> arch/sparc/lib/strlen.S provides a definition of strlen, but it does
> not define the preprocessor token __HAVE_ARCH_STRLEN to avoid multiple
> definitions from producing a link error.
>
> Or rather, __HAVE_ARCH_STRLEN is provided in include/asm/string_64.h,
> but not for 32b sparc.  arch/sparc/strlen.o is unconditionally
> required in lib-y in arch/sparc/lib/Makefile.
>
> Either:
> 1. arch/sparc/lib/strlen.S supports 32b sparc, then __HAVE_ARCH_STRLEN
> and a forward declaration of strlen should be provided in
> arch/sparc/include/asm/string.h rather than
> arch/sparc/include/asm/string_64.h, or...
> 2. arch/sparc/lib/strlen.S does not support 32b sparc, then the
> inclusion of strlen.o in arch/sparc/lib/Makefile should be predicated
> on CONFIG_SPARC64.
>
> + Dave who maybe can provide guidance on how to proceed?  The use of
> the BRANCH32 macro in arch/sparc/lib/strlen.S seems to have different
> definitions based on CONFIG_SPARC64 vs CONFIG_SPARC32, which makes me
> thing it's case 1 above, but I'm not familiar with Sparc assembly to
> be confident.



I agree.
The former is probably the intention
according to this commit:

commit ae984d72e0632782dd98c3fcf469b9045ad0d449
Author: David S. Miller <davem@davemloft.net>
Date:   Tue Dec 9 01:07:09 2008 -0800

    sparc: Unify strlen assembler.

    Use the new asm/asm.h header to help commonize the
    strlen assembler between 32-bit and 64-bit

    While we're here, use proper linux/linkage.h macros
    instead of by-hand stuff.

    Signed-off-by: David S. Miller <davem@davemloft.net>



-- 
Best Regards
Masahiro Yamada
