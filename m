Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF12F19D393
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2020 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgDCJ1A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 05:27:00 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:42026 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgDCJ07 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 05:26:59 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0339Qsq7028468;
        Fri, 3 Apr 2020 18:26:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0339Qsq7028468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585906015;
        bh=MstVQUcgSZG0zMpYAd6uwUB9YIo5n+SWfVQSoNG7zYs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vPSn6fquixsMdc8F/WHY+Z3hJJymMhmLaDGmIwv7h5J0ek55oMCHsTTC4epy4WIoN
         SWVSfC4glyY7yTY1sWGPuwl0llHmc4VwIWmXPCNX8DcZD+thXY/QtgY0PKrotEctSq
         fVbPm/PxVFq/ebVWrmiCPK5vIyJwgugYO9rmW34Hlp+lAx2lgGgH1Hji8mAx/HeoKV
         2jpgLrQKENR2BHBqM7/Jj9FL/+1KODQSff6lqOmkSCfEi1101py0RwTjZ1b3akTWpZ
         WHUvzU/EqP+t88fGHnBrDwg2DolNJlit/finZMiZkdqhWFynBslUIK3Byq04Z/rnFD
         houwTm8pljgYg==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id y17so2438527uap.13;
        Fri, 03 Apr 2020 02:26:54 -0700 (PDT)
X-Gm-Message-State: AGi0PualAhsuBl8RJxJygZpAlVuOfIai2baHxMYhzGSlxm49F83EuqUa
        c0dSU1yDc/wlZkqCK0ESScqAcxwSzwEnfz5iYXQ=
X-Google-Smtp-Source: APiQypJv5Cv+OWIIu8e9neKOttTNCoftbQaRs6wYhkoxm4CNEoGf3PrOYPE8+yNwLCju9NAzOB9CzonSznjlClJ2kQA=
X-Received: by 2002:ab0:2790:: with SMTP id t16mr5779840uap.40.1585906013243;
 Fri, 03 Apr 2020 02:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org> <20200403085719.GA9282@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200403085719.GA9282@ubuntu-m2-xlarge-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Apr 2020 18:26:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATtqe_vSYTUD+7G8du46F3Kksx6F2yHK4Tw9PLdybqL7A@mail.gmail.com>
Message-ID: <CAK7LNATtqe_vSYTUD+7G8du46F3Kksx6F2yHK4Tw9PLdybqL7A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nathan,


On Fri, Apr 3, 2020 at 5:57 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Hi Masahiro,
>
> On Fri, Apr 03, 2020 at 02:17:09PM +0900, Masahiro Yamada wrote:
> > As Documentation/kbuild/llvm.rst implies, building the kernel with a
> > full set of LLVM tools gets very verbose and unwieldy.
> >
> > Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> > GCC and Binutils. You can pass LLVM=1 from the command line or as an
> > environment variable. Then, Kbuild will use LLVM toolchains in your
> > PATH environment.
> >
> > Please note LLVM=1 does not turn on the LLVM integrated assembler.
> > You need to explicitly pass AS=clang to use it. When the upstream
> > kernel is ready for the integrated assembler, I think we can make
> > it default.
>
> I agree this should be the default but I think it should probably be
> called out somewhere in the documentation as well since users might not
> expect to have to have a cross assembler installed.


I will add the following info to llvm.rst:

`LLVM=1` does not turn on the LLVM integrated assembler, so you still need
assembler from GNU binutils. You can pass `AS=clang` to use the integrated
assembler, but it is experimental as of writing.




> > We discussed what we need, and we agreed to go with a simple boolean
> > switch (https://lkml.org/lkml/2020/3/28/494).
> >
> > Some items in the discussion:
> >
> > - LLVM_DIR
> >
> >   When multiple versions of LLVM are installed, I just thought supporting
> >   LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
> >
> >   CC      = $(LLVM_DIR)clang
> >   LD      = $(LLVM_DIR)ld.lld
> >     ...
> >
> >   However, we can handle this by modifying PATH. So, we decided to not do
> >   this.
> >
> > - LLVM_SUFFIX
> >
> >   Some distributions (e.g. Debian) package specific versions of LLVM with
> >   naming conventions that use the version as a suffix.
> >
> >   CC      = clang$(LLVM_SUFFIX)
> >   LD      = ld.lld(LLVM_SUFFIX)
> >     ...
> >
> >   will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
> >   but the suffixed versions in /usr/bin/ are symlinks to binaries in
> >   /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
> >
> > - HOSTCC, HOSTCXX, etc.
> >
> >   We can switch the host compilers in the same way:
> >
> >   ifneq ($(LLVM),)
> >   HOSTCC       = clang
> >   HOSTCXX      = clang++
> >   else
> >   HOSTCC       = gcc
> >   HOSTCXX      = g++
> >   endif
>
> I would personally like to see this but I do not have the strongest
> opinion.
>
> >   This may the right thing to do, but I could not make up my mind.
> >   Because we do not frequently switch the host compiler, a counter
> >   solution I had in my mind was to leave it to the default of the
> >   system.
> >
> >   HOSTCC       = cc
> >   HOSTCXX      = c++
> >
> >   Many distributions support update-alternatives to switch the default
> >   to GCC, Clang, or whatever, but reviewers were opposed to this
> >   approach. So, this commit does not touch the host tools.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Documentation/kbuild/kbuild.rst |  5 +++++
> >  Documentation/kbuild/llvm.rst   |  5 +++++
> >  Makefile                        | 20 ++++++++++++++++----
> >  3 files changed, 26 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> > index 510f38d7e78a..2d1fc03d346e 100644
> > --- a/Documentation/kbuild/kbuild.rst
> > +++ b/Documentation/kbuild/kbuild.rst
> > @@ -262,3 +262,8 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
> >  These two variables allow to override the user@host string displayed during
> >  boot and in /proc/version. The default value is the output of the commands
> >  whoami and host, respectively.
> > +
> > +LLVM
> > +----
> > +If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
> > +of GCC and GNU binutils to build the kernel.
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index d6c79eb4e23e..4602369f6a4f 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -55,6 +55,11 @@ additional parameters to `make`.
> >         READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> >         HOSTLD=ld.lld
> >
> > +You can use a single switch `LLVM=1` to use LLVM utilities by default (except
> > +for building host programs).
> > +
> > +     make LLVM=1 HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> > +
> >  Getting Help
> >  ------------
> >
> > diff --git a/Makefile b/Makefile
> > index c91342953d9e..6db89ecdd942 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -409,16 +409,28 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> >  KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
> >
> >  # Make variables (CC, etc...)
> > -LD           = $(CROSS_COMPILE)ld
> > -CC           = $(CROSS_COMPILE)gcc
> >  CPP          = $(CC) -E
> > +ifneq ($(LLVM),)
> > +CC           = clang
> > +LD           = ld.lld
> > +AR           = llvm-ar
> > +NM           = llvm-nm
> > +OBJCOPY              = llvm-objcopy
> > +OBJDUMP              = llvm-objdump
> > +READELF              = llvm-readelf
> > +OBJSIZE              = llvm-size
> > +STRIP                = llvm-strip
> > +else
> > +CC           = $(CROSS_COMPILE)gcc
> > +LD           = $(CROSS_COMPILE)ld
> >  AR           = $(CROSS_COMPILE)ar
> >  NM           = $(CROSS_COMPILE)nm
> > -STRIP                = $(CROSS_COMPILE)strip
> >  OBJCOPY              = $(CROSS_COMPILE)objcopy
> >  OBJDUMP              = $(CROSS_COMPILE)objdump
> > -OBJSIZE              = $(CROSS_COMPILE)size
> >  READELF              = $(CROSS_COMPILE)readelf
> > +OBJSIZE              = $(CROSS_COMPILE)size
> > +STRIP                = $(CROSS_COMPILE)strip
> > +endif
> >  PAHOLE               = pahole
> >  LEX          = flex
> >  YACC         = bison
> > --
> > 2.17.1
> >
>
> I have verified that the variables get their correct value with LLVM=1
> and that they are still overridable.
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200403085719.GA9282%40ubuntu-m2-xlarge-x86.



-- 
Best Regards
Masahiro Yamada
