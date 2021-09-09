Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70564044DA
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Sep 2021 07:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350660AbhIIFQb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 01:16:31 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:29468 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350499AbhIIFQb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 01:16:31 -0400
X-Greylist: delayed 93880 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Sep 2021 01:16:31 EDT
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1895EtRZ031230;
        Thu, 9 Sep 2021 14:14:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1895EtRZ031230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631164495;
        bh=ghCcarr3Wa8g2fBREVBbfn3a3wQyCXTSnt9W+mVN4Mw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rGqgIpLlT7n/rxTXzUo+6MUEomBhjVrmkJT2P1Im6Y/S1T9ntkNciz/Qymu546Q/J
         6bFNFQz5G2o3Ez4a2w3Kck8x9R2Vfg9mdsssZNfYlhvCOjS2euWNZPgoz6/FwQ3PBZ
         BgeWVPb39rsU7WA9lXdR5mdukFPrv3xEXjA0ePLlrHvB0PPcGWvNRgplB5fDiD1y2B
         g3CB35uBI0PeWaBpym9q/TOCGxmEG0VtiVZvQLSL4YgTpp2JCQBmwKVOKvGj6E9hDa
         cSBK2wIGgqkoZxrmPMDZ3RZe1GRdVlDrQv/pvE8Yd/GV7b2MOQoyGkOYJr/Kwvqltz
         WYKLNTbB9MbiA==
X-Nifty-SrcIP: [209.85.216.46]
Received: by mail-pj1-f46.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so565225pjx.5;
        Wed, 08 Sep 2021 22:14:55 -0700 (PDT)
X-Gm-Message-State: AOAM532YT1HxsNSNtDpcdJDdQFNZjYWhD/6W+vXuvWiNoj4mJy4InI4+
        +j7TQkR8mqB+5BcsBgtGOb8W9YT2i26hNGa53Ng=
X-Google-Smtp-Source: ABdhPJwZNsMXFApjgplVXDMFN/yESX/46Fzfe2Fjn/3/fRjwdi4HheLFDoRreqN1vd/j/Idb5fi7KFiatlzL1Zk90CU=
X-Received: by 2002:a17:902:6b42:b0:13a:54d0:39c4 with SMTP id
 g2-20020a1709026b4200b0013a54d039c4mr1244141plt.42.1631164494718; Wed, 08 Sep
 2021 22:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
 <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org>
 <20210906201432.GZ920497@tucnak> <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
 <20210906215218.GA920497@tucnak> <20210907145247.GH1583@gate.crashing.org>
In-Reply-To: <20210907145247.GH1583@gate.crashing.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 9 Sep 2021 14:14:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATNZRbdxCkdu=+wW1bcyoX0YcZYRTSW129n7AnnLyKbWg@mail.gmail.com>
Message-ID: <CAK7LNATNZRbdxCkdu=+wW1bcyoX0YcZYRTSW129n7AnnLyKbWg@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 7, 2021 at 11:54 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Mon, Sep 06, 2021 at 11:52:18PM +0200, Jakub Jelinek wrote:
> > On Mon, Sep 06, 2021 at 02:08:58PM -0700, Linus Torvalds wrote:
> > There is a stddef.h include too and that's it
> > (I must say I don't see the reason for that include though).
>
> Yeah me neither.  Maybe the header used NULL before?
>
> > Other compiler provided headers (not talking about C++ now) also have no
> > or very limited includes, including stddef.h, stdarg.h, stdatomic.h, etc.
> > The only exceptions are tgmath.h which isn't usable without libc
> > math.h/complex.h,
>
> <tgmath.h> is only for hosted environments.  That requires a C library
> for GCC (we do not implement this stuff ourselves).  The compiler and
> the C library have to work together to get this done, and the relation
> between GCC and Glibc has been a bit too tight for this, it is true.
>
> But a kernel build is not in a hosted environment.
>
> > in some cases stdint.h and limits.h which are in some
> > configurations provided both by the C library and the compiler and include
> > each other in that case (but e.g. stdint.h has an alternate version that
> > only uses compiler provided builtin macros) and openacc.h.
>
> On what targets is <stdint.h> still problematic?  And <limits.h>?


Since commit 0c79a8e29b5fcbcbfd611daf9d500cfad8370fcf
all architectures in the kernel space use the same fixed-width
types, which are defined by
include/uapi/asm-generic/int-ll64.h

So, u32 is always 'unsigned int',
and u64 is always 'unsigned long long'.

It is convenient for printk() in common code
because we can always use the 'll' prefix for u64.


  u32 foo = 1;
  u64 bar = 1;

  printk("foo = %u\n", foo);
  printk("bar = %llu\n, bar);



If we use compiler-provided <stdint.h>,
it is not convenient for printk() because
uint64_t is 'unsigned long' on some compilers
and 'unsigned long long' on others.

<intypes.h> provides macros such as PRIx64

    uint32_t foo = 1;
    uint64_t bar = 1;

    printk("foo = %" PRIu32 "\n", foo);
    printk("bar = %" PRIu64 "\n", bar);


This works, but ends up with ugly code,
which I want to avoid.












--
Best Regards
Masahiro Yamada
