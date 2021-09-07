Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65A4402AD2
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Sep 2021 16:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhIGOfG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 10:35:06 -0400
Received: from gate.crashing.org ([63.228.1.57]:32928 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230054AbhIGOfF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 10:35:05 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 187ETeIO006845;
        Tue, 7 Sep 2021 09:29:40 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 187ETeHc006818;
        Tue, 7 Sep 2021 09:29:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 7 Sep 2021 09:29:34 -0500
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
Message-ID: <20210907142934.GF1583@gate.crashing.org>
References: <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com> <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com> <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com> <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org> <20210906201432.GZ920497@tucnak> <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 02:08:58PM -0700, Linus Torvalds wrote:
> On Mon, Sep 6, 2021 at 1:14 PM Jakub Jelinek <jakub@redhat.com> wrote:
> >
> > the only guaranteed APIs are
> > those provided by the headers (x86intrin.h/*mmintrin.h etc. on x86,
> > arm_{neon,sve}.h etc. on arm*, ...)
> 
> You guys realize we don't use those, do you?

Linux does use the Arm and Power vector intrinsics (arm_neon.h and
altivec.h).

> And you don't seem to realize that you are actively arguing *AGAINST*
> what you think you argue for.

I have no idea what you think we are arguing for, only what we are.

> That "immintrin.h" file, for example, is simply not usable for the
> kernel. I just checked.

Yes.  It cannot be used in freestanding environments; it includes a
header file we don't ship (<mm_malloc.h>, via <xmmintrin.h>).  Or
perhaps we do ship it, but only on native systems?  Same issue, anyway.

The top comment in the latter says
  /* Implemented from the specification included in the Intel C++ Compiler
     User Guide and Reference, version 9.0.  */
so the shortcoming exists there already probably?

>       27 | #include <stdlib.h>
>          |          ^~~~~~~~~~
> 
> Oops.

Yup, that is not a (freestanding) standard C header.

> Very similar things happens if you try to use that <stdint.h> file
> that somebody mentioned earlier.

Not at all.  <stdint.h> *is* a standard C header, and we ship it, it
always works.  If you find problems with it, please report them!

> You also don't seem to realize how hard it is to separate out the
> user-land crap that we really cannot use, and must not use.

We have worked very hard for many years to make this better.  For the
freestanding headers only <limits.h> is still problematic, and you do
not need that one anyway, it is legacy more than anything else.


Segher
