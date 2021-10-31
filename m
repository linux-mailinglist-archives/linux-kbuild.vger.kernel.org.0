Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD64440E6F
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 Oct 2021 13:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhJaMkw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 Oct 2021 08:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhJaMkv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 Oct 2021 08:40:51 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D72EC061570;
        Sun, 31 Oct 2021 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=lB3SIW23abBtuALywBPxVOTIYwGSheKJFWf5p+84tX8=; b=WPBMqihvv4pLk4emK09OVXBWRC
        pentfIRPIE5qmfrKS0AmTqor18AZ94gYBRvr2a+lTz8GVx0bnybLPdIaTG2YNrhPuIDJ9CsN2YDsm
        bFdJVvv74+i4DgKl6pevZVLuUwoPZ+JlLzyIoedMuojRVKeM9tob5NzGr2bM6fwIn/BfmeddfiS2s
        L0RKibOLT/wcio67N8z18cRurtuIAC+G54nbP4b9EoT7bzI2CxyMBI/9Nf/DsTxndiynavrdV0cZT
        FfpgLT9KSBFmqFWeYi1MyV/g15JzMaU5bEbq/nFF3bjkzsRbGaJ/1olyi3OtklFLgKxz8b2YBXDYB
        KQ8jwEWA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mhA6D-00DOaJ-NH; Sun, 31 Oct 2021 12:38:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5F07430022C;
        Sun, 31 Oct 2021 13:38:08 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 3B4832058F615; Sun, 31 Oct 2021 13:38:08 +0100 (CET)
Date:   Sun, 31 Oct 2021 13:38:08 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
Message-ID: <YX6OMKPlV/pFvIpT@hirez.programming.kicks-ass.net>
References: <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
 <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net>
 <YXrhZoOgv5dtFMTs@archlinux-ax161>
 <20211028204855.GP174703@worktop.programming.kicks-ass.net>
 <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
 <YXu2z6FQ6Z7qtjbk@hirez.programming.kicks-ass.net>
 <20211030143311.GH174730@worktop.programming.kicks-ass.net>
 <CA+icZUUU53OwtCDC-4FPfcCenYQeZo7b8b=wszbvrHSYBqbYOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUUU53OwtCDC-4FPfcCenYQeZo7b8b=wszbvrHSYBqbYOA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 31, 2021 at 02:18:01AM +0100, Sedat Dilek wrote:
> On Sat, Oct 30, 2021 at 4:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> >
> > Latestest greatness... :-)
> >
> > ---
> > Subject: kbuild: Fix clang/llvm build infra
> >
> > Debian (and derived) distros ship their compilers as -$ver suffixed
> > binaries. For gcc it is sufficent to use:
> >
> >  $ make CC=gcc-12
> >
> > However, clang builds (esp. clang-lto) need a whole array of tools to be
> > exactly right, leading to unweildy stuff like:
> >
> >  $ make CC=clang-13 LD=ld.lld=14 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1
> >
> > which is, quite franktly, totally insane and unusable. Instead make
> > the CC variable DTRT, enabling one such as myself to use:
> >
> >  $ make CC=clang-13
> >
> > This also lets one quickly test different clang versions.
> > Additionally, also support path based LLVM suites like:
> >
> >  $ make CC=/opt/llvm/bin/clang
> >
> 
> Hi Peter,
> 
> Thanks for bringing this up again.
> 
> Your issue is not new for Debianist and Linux-LLVM/Clang folks.
> 
> But let me comment.
> 
> I agree, it is preferable or should be treated the same way in using
> clang-$ver like gcc-$ver.
> 
> Background:

Right, I know that.

> As a compromise I use in my build_linux-llvm-toolchain.sh script

> But...
> 
> ...for several new features like Clang-LTO we need the LLVM full "eco system".
> LLVM eco system means compiler, linker and binutils.
> In several talks at LPC 2021 talkers used the term "LLVM/binutils"
> like for GNU/binutils.
> The LLVM/Clang kernel-docs talk about "LLVM util(itie)s" which is set
> by LLVM=1 or not (LLVM=0).
> 
> Link: https://www.kernel.org/doc/html/latest/kbuild/llvm.html#llvm-utilities
> 
> AFAICS your patch has a primary focus to fix the LLVM/Clang
> infrastructure when CONFIG_LTO_CLANG=y, right?
> Can you massage the commit message to reflect this?

It already does :-) Also, it's a little bit more complicated, you can't
actually select CONFIG_LTO *unless* you've configured your toolchain
just right.

> IMHO your patch can be improved to check for CONFIG_LTO_CLANG=y where
> LLVM=1 is mandatory and IIRC LLVM_IAS=1, too.
> ( The default to use LLVM/Clang-IAS (Integrated ASsembler) was changed
> recently for some combinations arches + Clang-LTO? )

Egg, meet chicken :-)

> Before I forgot:
> Can you add a comment for the PPC and S390 situation in the commit message.

Sure.

> Please remember people also want to use combinations like gcc-$ver and
> LLVM/binutils like ld.lld-$ver.

make CC=gcc LLVM=1
make CC=clang LLVM=0

are still valid combinations that work, I just don't think they ought to
be the default.

> GCC-10 + LLD-$VER was the fastest combination to build a Linux Debian
> package here on my Intel SandyBridge CPU system.
> ( There exists overrides like LD=... STRIP=... and I use
> XXX_FOR_BUILD=... (see my attached build-script). )

Right, that's what overrides are for, non-default setups. I just, quite
strongly, feel that our defaults are completely insane.

~ Peter
