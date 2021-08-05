Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE1E3E1F52
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Aug 2021 01:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbhHEX1c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 19:27:32 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:18402 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhHEX1b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 19:27:31 -0400
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 175NR10N023519;
        Fri, 6 Aug 2021 08:27:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 175NR10N023519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628206022;
        bh=MTJTYLNOKEORvL0xiX49grwqhg7y9DI4scWvkscW0DY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yY1mkoKd9GM1Hcw46jv4US3Z5jB6L1DvWGb41H7ZuNVftA2kzachmOFEqR1WZXdj0
         j15IAQyNN2KijpzLnhbPXeKRb1n4bpqzD0P/TlJlcXYpUGKatHHvxPQzI83bl199Ki
         uddT+7tBjRGMFobWImndzFat61hbc7KdRXq6oVmezpkA6fKAF8hd6luAqp3VW0Z1R9
         N0zqEM1FoibZg3bXT+wHq4dOepmfutTuIrGdw8+dd2rkQ1YsrTjwyL+3A6cYdVJqeF
         2XsLY4tRW9qIoin+7ZeUBPyZAjl15GbaJkRJbmDUWl0OY6aynbubyEQ6GcXNd0vx5r
         WuEO27wK47EWQ==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id b1-20020a17090a8001b029017700de3903so10482600pjn.1;
        Thu, 05 Aug 2021 16:27:02 -0700 (PDT)
X-Gm-Message-State: AOAM530K6aL/zbHNxiPpGLP2+mQl6ahHjGSrbAhJk8i2jMu5bhxN/gcX
        WS3DbkxXU8br2f81ctAPZJCrmKD4m8lvx5xRTbY=
X-Google-Smtp-Source: ABdhPJwJdFT3wqYK/QhGQg/N0NvJveDlBV8VJ3nhbQmRVGvWvOn3KnUtRrs4+E7kdZTHsFnelIIUmoRAFU3S2F2JuCI=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr1684pgj.47.1628206021266;
 Thu, 05 Aug 2021 16:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com>
 <20210802183910.1802120-4-ndesaulniers@google.com> <CAK7LNASkBNDzXWxweotPZGJH-z3J59rPQwGDV32rfH9hH+sVHQ@mail.gmail.com>
 <CAKwvOd=iyhky9jhw+UpYM7W5-7tqo02sxpZUASEk6XciS0wSwg@mail.gmail.com> <CAKwvOd=5drNCoU-PLFb-kJTzk1tXOvwCK89hAMPXrBZv+Ey=Bw@mail.gmail.com>
In-Reply-To: <CAKwvOd=5drNCoU-PLFb-kJTzk1tXOvwCK89hAMPXrBZv+Ey=Bw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 6 Aug 2021 08:26:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLPqEYbsEEJZ0S1UvR2v89HgmgcEtutNmW6oCm5TGB9A@mail.gmail.com>
Message-ID: <CAK7LNASLPqEYbsEEJZ0S1UvR2v89HgmgcEtutNmW6oCm5TGB9A@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] Documentation/llvm: update CROSS_COMPILE inferencing
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 6, 2021 at 3:29 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Thu, Aug 5, 2021 at 11:27 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Aug 5, 2021 at 6:58 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Tue, Aug 3, 2021 at 3:39 AM 'Nick Desaulniers' via Clang Built
> > > Linux <clang-built-linux@googlegroups.com> wrote:
> > > > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > > > index b18401d2ba82..f8a360958f4c 100644
> > > > --- a/Documentation/kbuild/llvm.rst
> > > > +++ b/Documentation/kbuild/llvm.rst
> > > > @@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
> > > >  Currently, the integrated assembler is disabled by default. You can pass
> > > >  ``LLVM_IAS=1`` to enable it.
> > > >
> > > > +Omitting CROSS_COMPILE
> > > > +----------------------
> > > > +
> > > > +As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
> > > > +
> > > > +Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> > > > +``--prefix=<path>`` to search for the GNU assembler and linker.
> > >
> > >
> > > Is there any place where we rely on --prefix
> > > to search for the linker?
> > >
> > > In general, the compiler stops after generating an object
> > > since it is passed with the -c option.
> > > The linking stage is separated.
> > >
> > > In the old days, VDSO was an exceptional case
> > > where $(CC) was used as the linker driver, but
> > > commit fe00e50b2db8c60e4ec90befad1f5bab8ca2c800 fixed it.
> >
> > See my previous reply to Fangrui.
> > https://lore.kernel.org/lkml/CAKwvOdnK=SUm1_--tcLRO3LVeXd_2Srfv2tsZCUW0uXXa1W_pg@mail.gmail.com/
> >
> > To be more specific, I believe this is still a problem for ppc vdso.
> > https://github.com/ClangBuiltLinux/linux/issues/774
> >
> > I had sent patches for that, but binutils 2.26 would crash (IIUC,
> > newer GNU binutils are ok).  See this thread:
> > https://lore.kernel.org/lkml/b2066ccd-2b81-6032-08e3-41105b400f75@csgroup.eu/
> >
> > So "we'd prefer the linker was used as the driver, but there's at
> > least one place I know of in the tree where that's not currently the
> > case."
>
> Also, I think the CC_CAN_LINK functionality also fits the bill.
> https://github.com/ClangBuiltLinux/linux/issues/1290
> --
> Thanks,
> ~Nick Desaulniers


Ah, this is it.

Thanks.


-- 
Best Regards
Masahiro Yamada
