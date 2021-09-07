Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98CAE402BD5
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Sep 2021 17:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhIGPcR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 11:32:17 -0400
Received: from gate.crashing.org ([63.228.1.57]:49179 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345158AbhIGPcQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 11:32:16 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 187FQwd6012880;
        Tue, 7 Sep 2021 10:26:58 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 187FQuaU012874;
        Tue, 7 Sep 2021 10:26:56 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 7 Sep 2021 10:26:56 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210907152656.GI1583@gate.crashing.org>
References: <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com> <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com> <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org> <20210906201432.GZ920497@tucnak> <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com> <20210906215218.GA920497@tucnak> <CAHk-=wiKy45R2vMHhjr16_Q+iYea-70byuj=mHLvp1GURqdYPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiKy45R2vMHhjr16_Q+iYea-70byuj=mHLvp1GURqdYPA@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 03:24:41PM -0700, Linus Torvalds wrote:
> On Mon, Sep 6, 2021 at 2:52 PM Jakub Jelinek <jakub@redhat.com> wrote:
> >
> > It is actually not that bad, stdlib.h is indeed included there because of 2
> > intrinsics out of more than 5000 and when one doesn't need those, just
> > #define _MM_MALLOC_H_INCLUDED
> 
> .. and on clang?

Clang apparently has __MM_MALLOC_H  as header guard here.  But Clang
does say
  #if __STDC_HOSTED__
  #include <mm_malloc.h>
  #endif
so they do not have this bug in the first place.  GCC should fix this as
well.  I filed <https://gcc.gnu.org/PR102231>.  Thanks for bringing thisd
to our attention!

> There, I think you have to undefine __STDC_HOSTED__. Maybe by using
> -ffreestanding?

That defines it to 0, instead, as required by the C standard:
$ :|gcc -E -dM -|grep HOSTED
#define __STDC_HOSTED__ 1
$ :|gcc -E -dM - -ffreestanding|grep HOSTED
#define __STDC_HOSTED__ 0

Yes, that is how this works: the command line flag says how the macro
should be defined by the compiler (and changing it in your code is UB
btw).

> Except if you use -ffreestanding, you lose some very bvasic
> functionality (*),

(see below)

> And they should very much *not*at*all* be considered some kind of
> sacred "this is the only way to do things". Because that is clearly
> not true, and has *never* been true.

Take for example <stdint.h>.  There is no other way to find out what
types to use for exact-width integers.  Unless you really want to do
  typedef unsigned int __attribute__((mode (DI))) u64;
but that is rather unportable to other compilers but GCC.

<stdint.h> *is* the only portable way for getting exact-width integers
(and some other things).  This is not something we decide, it is not
something you can decide, it follows directly from the C standard.

Using it is easy.  Not using it leads to the forest of include files and
preprocessor conditionals the kernel currently uses.

> The usable header files are the odd special case, not the general case.
> 
> Really.
> 
> Is it really so hard to just admit that the kernel shouldn't use those
> headers? When we have 30 years of experience in doing exactly that?

That isn't the core issue at hand.  Yes, Linux has implemented all of it
manually historically, and there even were good reasons for some of
that.  That does not mean that it would be a good idea to throw out the
few standard C headers it does use, and implement those with compiler
internal interfaces instead, which we advice you against.

> (*) iirc, with -ffreestanding gcc doesn't do all the basic memcpy()
> optimizations. But I forget the exact details.

I would love to hear any details about that.

I do know the Glibc headers do (or did?) some premature optimisation
wrt. some mem* and str*, hurting performance on newer compilers.  But
you should not be using the Glibc headers for compiling the kernel at
all anyway, so maybe there was some bug thereabouts?


Segher
