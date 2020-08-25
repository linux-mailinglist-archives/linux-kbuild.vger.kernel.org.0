Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146A225188D
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Aug 2020 14:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgHYM3w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Aug 2020 08:29:52 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:48393 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHYM3w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Aug 2020 08:29:52 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07PCTVki021974;
        Tue, 25 Aug 2020 21:29:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07PCTVki021974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598358573;
        bh=fWDEMSaOrPS74dlXpFO19QBM3u09HqUhQUZB2brSdsY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fOxcwLtgxKIPR8hbtZKkbMiRjJ2Aqr4TlwxTj4ubxNpD2txA5BHxg6KAQPsgXUldU
         MpJOiZ4YGDiPs9RFKoAiLlAW/mAgpfnyAEz0a0/g6shhkRwRf0gHDxSWmNHhaLyvn1
         kJa2Ip51JlytlW/TZumMYEP5WZM6Kol30Y/ezYGCRGJ+W/XKHJ1OwQ09Aq44O3qCnI
         E3ofcAElvx9Woo/XQSE7C4VNnPVa+r/K442fyv8fpmNjr9139ggNgmwSXQKyKS4rh6
         tlZuO0sM6KJfyjcQZRjfek8cCuYM5qaUnjR8+zxm6SnB74hxlNfEzNmbT0Y1St3PNa
         WW2VbtkFCy5qw==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id e14so6215737vsa.9;
        Tue, 25 Aug 2020 05:29:32 -0700 (PDT)
X-Gm-Message-State: AOAM5315vA0a42hdsf7wqGyqwxCD73iA5Hcjb3vVBEHLDBWuvs7TdUwI
        C+D15IeOiqeWR18StXchxuKax9pDnqAi1zX6BgI=
X-Google-Smtp-Source: ABdhPJyIs8Whq8eByRuYrPFEYB0rQzL0fX4J9QQ+NaRlsfdCpvIiae7R+ZUfqK/NgN1ob6KxzLkuKR0sk2tFUVY+/JQ=
X-Received: by 2002:a05:6102:7ac:: with SMTP id x12mr5038553vsg.181.1598358571195;
 Tue, 25 Aug 2020 05:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <CAK7LNAQmWBPV4nZ0xPdSHEt=DipHmR40co827voGOFN=2j47BQ@mail.gmail.com>
 <20200824173450.GA4157679@rani.riverdale.lan> <CAKwvOd=BEwuHFeuskJ4gPOGLoXm98oXA18U=tTw981g+HdVz-w@mail.gmail.com>
In-Reply-To: <CAKwvOd=BEwuHFeuskJ4gPOGLoXm98oXA18U=tTw981g+HdVz-w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 25 Aug 2020 21:28:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQynuqqjhL1rqMf0YnRpQ0jsWrJ7fy51FM7d0xdxws5wQ@mail.gmail.com>
Message-ID: <CAK7LNAQynuqqjhL1rqMf0YnRpQ0jsWrJ7fy51FM7d0xdxws5wQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 25, 2020 at 4:10 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Aug 24, 2020 at 10:34 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > On Tue, Aug 25, 2020 at 12:57:22AM +0900, Masahiro Yamada wrote:
> > >
> > >
> > > To prevent transformation from foo() into bar(),
> > > there are two ways in Clang to do that;
> > > -fno-builtin-foo, and -fno-builtin-bar.
> > > There is only one in GCC; -fno-buitin-foo.
> > >
> > > Is this correct?
> > >
> >
> > It looked that way from previous experimentation, but...
> >
> > >
> > >
> > > I just played the optimization
> > > from printf("helloworld\n") to puts("helloworld").
> > >
> > > https://godbolt.org/z/5s4ded
> > >
> > >
> > > -fno-builtin-puts cannot prevent clang
> > > from emitting puts.
> > > Is it because clang does not support
> > > -fno-builtin-puts?
> >
> > Ugh. clang doesn't have __builtin_puts() but it optimizes printf() into
> > puts(). It doesn't have __builtin_putchar() but will optimize
> > printf("c") into putchar('c').
>
> Bah, merely a <strikethrough>flesh
> wound</strikethrough><strikethrough>compiler bug</strikethrough>rather
> long TODO in the compiler.
> https://github.com/llvm/llvm-project/blob/be2bc7d4cef2edd66c7fb74b70adf62fc68754db/clang/include/clang/Basic/Builtins.def#L943
>
> Anyways, give me a week and I'll hack through the rest of them
> https://reviews.llvm.org/D86508.  Certainly made HPA's point hit home,
> that's a lot of functionality to implement or disable in an
> environment.
>
> Masahiro, are you implying that we shouldn't take the
> -fno-builtin-stpcpy patch, because Clang is inconsistent? (That can be
> fixed.) Even though -fno-builtin-stpcpy works here as intended?
> https://lore.kernel.org/lkml/20200817220212.338670-2-ndesaulniers@google.com/
>
> Otherwise we need to provide an implementation of this symbol in the kernel.
> https://lore.kernel.org/lkml/20200815020946.1538085-1-ndesaulniers@google.com/
>
> Please, pick your poison.



I am not a compiler expert.

Nor am I sure if I am the right person who makes this decision.
But, if so, I would choose the latter.
(implement stpcpy() in the kernel)

I was addressed last night, so
I should write up my thoughts.

I do not think -fno-builtin-stpcpy is a
general solution.

-fno-builtin-stpcpy will work for now
because only Clang implements the transformation
from 'sprintf(dest, "%s", str)' into
'stpcpy(dest, str) - dest'.

If GCC implements it some day,
we would run into a problem because
in GCC, it is not -fno-builtin-stpcpy, but
-fno-builtin-sprintf that disables that optimization.

In this regard, 'KBUILD_CFLAGS += -fno-builtin-sprintf'
would be more future-proof, but it is potentially
an overkill.
We want to disable optimization from sprintf() to stpcpy(),
but we may still benefit from the optimization from
sprintf() into something else.


Linus is uncomfortable with this kind of compiler magic.
If we take compiler's freedom away,
-ffreestanding is a big hammer to solve this problem.

If we welcome the compiler's optimization,
we should implement stpcpy(), bcmp(), and whatever
until we solve all link errors.



--
Best Regards
Masahiro Yamada
