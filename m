Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BAE252FEA
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 15:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730284AbgHZN35 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 09:29:57 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53856 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729540AbgHZN3r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 09:29:47 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 07QDTLdk005122;
        Wed, 26 Aug 2020 22:29:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 07QDTLdk005122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598448562;
        bh=tNXIFtx4OCOjEbxfaMetiZvvEWEud6dFm6DVPlRG6/U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oZS0uyjQxKwmiORelo6ou/ZXRCWhxWwnRb7KpxTe0i7TxSoqM7aDjV7OztApNLg/i
         /yBwGooq2tgmM7bi7swgUohQ4DxU41AFBoZcWKMTmAIJl1rdj0ClN4S9r/Lue+hbY0
         gjuuwr0UEAKcS2e0jfkH/zDXpnO4OmIRMN5PlPhCrutYwgSQJmsKgPcLlW/vAXGcBN
         Bw7qHjRwEGVfn2JssQ7BsZtFoF0fJ43xiQpUqf2WLefAbzG+RfEuDrTYQVqfMO09Jz
         kklYUQOz8N7GV/NqXboH11vehTJoQAGBfhzFeCpWufXJjBJa769CV1l8WriyYAlgmt
         uGd/CIB9LEOjQ==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id h2so890891plr.0;
        Wed, 26 Aug 2020 06:29:21 -0700 (PDT)
X-Gm-Message-State: AOAM530WoDfiPKpaelZEARqeCGvc39jJXSEq7S/+UOXGPotqvE2Rrf+I
        qxJkaFmgrBFSvpXmRH56WcazDKJImQ8ZIGTLi10=
X-Google-Smtp-Source: ABdhPJyptsNXsluSTO9BSD2NQ/mPRLaxE4KppC7eM2LmlxEpDMBfy8uGyHMsjIWEYawhJuX6U9wNVDjFGHMWbEkzA8w=
X-Received: by 2002:a17:90b:11c4:: with SMTP id gv4mr5899331pjb.198.1598448561144;
 Wed, 26 Aug 2020 06:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <CAK7LNAQmWBPV4nZ0xPdSHEt=DipHmR40co827voGOFN=2j47BQ@mail.gmail.com>
 <20200824173450.GA4157679@rani.riverdale.lan> <CAKwvOd=BEwuHFeuskJ4gPOGLoXm98oXA18U=tTw981g+HdVz-w@mail.gmail.com>
 <CAK7LNAQynuqqjhL1rqMf0YnRpQ0jsWrJ7fy51FM7d0xdxws5wQ@mail.gmail.com> <CAKwvOdk9gpKNmEAHLf9KtzmzxnSdmDdutu5Mpp39XEaxMywMFA@mail.gmail.com>
In-Reply-To: <CAKwvOdk9gpKNmEAHLf9KtzmzxnSdmDdutu5Mpp39XEaxMywMFA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 Aug 2020 22:28:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQHj-GeqH_5WpKo7gA6qZAiX8OOxxnL1v-SNZwRHFSXQQ@mail.gmail.com>
Message-ID: <CAK7LNAQHj-GeqH_5WpKo7gA6qZAiX8OOxxnL1v-SNZwRHFSXQQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
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

On Tue, Aug 25, 2020 at 11:02 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Aug 25, 2020 at 5:30 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Aug 25, 2020 at 4:10 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Masahiro, are you implying that we shouldn't take the
> > > -fno-builtin-stpcpy patch, because Clang is inconsistent? (That can be
> > > fixed.) Even though -fno-builtin-stpcpy works here as intended?
> > > https://lore.kernel.org/lkml/20200817220212.338670-2-ndesaulniers@google.com/
> > >
> > > Otherwise we need to provide an implementation of this symbol in the kernel.
> > > https://lore.kernel.org/lkml/20200815020946.1538085-1-ndesaulniers@google.com/
> > >
> > > Please, pick your poison.
> >
> >
> >
> > I am not a compiler expert.
> >
> > Nor am I sure if I am the right person who makes this decision.
> > But, if so, I would choose the latter.
> > (implement stpcpy() in the kernel)
> >
> > I was addressed last night, so
> > I should write up my thoughts.
> >
> > I do not think -fno-builtin-stpcpy is a
> > general solution.
> >
> > -fno-builtin-stpcpy will work for now
> > because only Clang implements the transformation
> > from 'sprintf(dest, "%s", str)' into
> > 'stpcpy(dest, str) - dest'.
> >
> > If GCC implements it some day,
> > we would run into a problem because
> > in GCC, it is not -fno-builtin-stpcpy, but
> > -fno-builtin-sprintf that disables that optimization.
> >
> > In this regard, 'KBUILD_CFLAGS += -fno-builtin-sprintf'
> > would be more future-proof, but it is potentially
> > an overkill.
> > We want to disable optimization from sprintf() to stpcpy(),
> > but we may still benefit from the optimization from
> > sprintf() into something else.
> >
> >
> > Linus is uncomfortable with this kind of compiler magic.
> > If we take compiler's freedom away,
> > -ffreestanding is a big hammer to solve this problem.
> >
> > If we welcome the compiler's optimization,
> > we should implement stpcpy(), bcmp(), and whatever
> > until we solve all link errors.
>
> Speculating that -ffreestanding is untenable, submitted v3:
> https://lore.kernel.org/lkml/20200825135838.2938771-1-ndesaulniers@google.com/T/#u
> --
> Thanks,
> ~Nick Desaulniers

FYI:
Andrew Morton picked up this patch.




-- 
Best Regards
Masahiro Yamada
