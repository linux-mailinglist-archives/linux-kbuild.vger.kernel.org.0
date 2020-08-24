Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232D325018F
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Aug 2020 17:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgHXP62 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Aug 2020 11:58:28 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:18750 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgHXP6T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Aug 2020 11:58:19 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 07OFw0El032105;
        Tue, 25 Aug 2020 00:58:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 07OFw0El032105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598284681;
        bh=Ya6WAqf3qWKePGzzyVqFBPTs2/RY7mac2cuoBTwLsr4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JWHS6WXDmrw1vNT2G4VzLtt+Na8Tg2XMpgeYm9VLI3FJfR9IP8FndgFwq2FRnM7Bz
         kyPYcY6gSOtRgXSWPWHCmfNWhqWwPmSVFQRPvLCGPTcsTo/NzBwjiJYaJfD12ggNrW
         Az0S8QOtELjrtdxcEdh7/k/70nFIAlzqyQJuZfaj9KXaBVCvjPAB3ehoAhjVOw5uY3
         UEBgyv2aPuGkglK8p6UAOyaH6UuzpJAWfaBnfQPrCSVIO4mIT9laXqFeBUDnjx73ec
         ZUpQcqu7WOo8vi2K5cLq2hm2lfa4NYi2B8FITZJUb1bAuw202x/h3QZyn6/0QKthUh
         DV34FACYcKDbQ==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id v138so4709413vsv.7;
        Mon, 24 Aug 2020 08:58:01 -0700 (PDT)
X-Gm-Message-State: AOAM530tx6OYvxVIpjVSFCkO9wqf1BJGdZWqvni6rdI/kI6q/MgwMgxz
        SGrglZdr4zFIVHgr4b1XVXFCgHZIPs0snEDzLro=
X-Google-Smtp-Source: ABdhPJwNecrtonMTPU19gIF2qOZvAfWCEiNQd7E8DRXm1BWKDtvyST/xDu2rw/4uiWmT/mhA4SrVgth1MCdLNKTsK4Y=
X-Received: by 2002:a05:6102:7ac:: with SMTP id x12mr2940671vsg.181.1598284680097;
 Mon, 24 Aug 2020 08:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com> <20200818214146.GA3196105@rani.riverdale.lan>
In-Reply-To: <20200818214146.GA3196105@rani.riverdale.lan>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 25 Aug 2020 00:57:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmWBPV4nZ0xPdSHEt=DipHmR40co827voGOFN=2j47BQ@mail.gmail.com>
Message-ID: <CAK7LNAQmWBPV4nZ0xPdSHEt=DipHmR40co827voGOFN=2j47BQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
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

On Wed, Aug 19, 2020 at 6:41 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Tue, Aug 18, 2020 at 01:58:51PM -0700, Nick Desaulniers wrote:
> > On Tue, Aug 18, 2020 at 1:27 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Tue, Aug 18, 2020 at 1:24 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > > >
> > > > On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
> > > > > On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
> > > > > >
> > > > > > I'm not saying "change the semantics", nor am I saying that playing
> > > > > > whack-a-mole *for a limited time* is unreasonable. But I would like to go back
> > > > > > to the compiler authors and get them to implement such a #pragma: "this
> > > > > > freestanding implementation *does* support *this specific library function*,
> > > > > > and you are free to call it."
> > > > >
> > > > > I'd much rather just see the library functions as builtins that always
> > > > > do the right thing (with the fallback being "just call the standard
> > > > > function").
> > > > >
> > > > > IOW, there's nothing wrong with -ffreestanding if you then also have
> > > > > __builtin_memcpy() etc, and they do the sane compiler optimizations
> > > > > for memcpy().
> > > > >
> > > > > What we want to avoid is the compiler making *assumptions* based on
> > > > > standard names, because we may implement some of those things
> > > > > differently.
> > > > >
> > > >
> > > > -ffreestanding as it stands today does have __builtin_memcpy and
> > > > friends. But you need to then use #define memcpy __builtin_memcpy etc,
> > > > which is messy and also doesn't fully express what you want. #pragma, or
> > > > even just allowing -fbuiltin-foo options would be useful.
> >
> > I do really like the idea of -fbuiltin-foo.  For example, you'd specify:
> >
> > -ffreestanding -fbuiltin-bcmp
> >
> > as an example. `-ffreestanding` would opt you out of ALL libcall
> > optimizations, `-fbuiltin-bcmp` would then opt you back in to
> > transforms that produce bcmp.  That way you're informing the compiler
> > more precisely about the environment you'd be targeting.  It feels
> > symmetric to existing `-fno-` flags (clang makes -f vs -fno- pretty
> > easy when there is such symmetry).  And it's already convention that
> > if you specify multiple conflicting compiler flags, then the latter
> > one specified "wins."  In that sense, turning back on specific
> > libcalls after disabling the rest looks more ergonomic to me.
> >
> > Maybe Eli or David have thoughts on why that may or may not be as
> > ergonomic or possible to implement as I imagine?
> >
>
> Note that -fno-builtin-foo seems to mean slightly different things in
> clang and gcc. From experimentation, clang will neither optimize a call
> to foo, nor perform an optimization that introduces a call to foo. gcc
> will avoid optimizing calls to foo, but it can still generate new calls
> to foo while optimizing something else. Which means that
> -fno-builtin-{bcmp,stpcpy} only solves things for clang, not gcc. It's
> just that gcc doesn't seem to have implemented those optimizations.


To prevent transformation from foo() into bar(),
there are two ways in Clang to do that;
-fno-builtin-foo, and -fno-builtin-bar.
There is only one in GCC; -fno-buitin-foo.

Is this correct?



I just played the optimization
from printf("helloworld\n") to puts("helloworld").

https://godbolt.org/z/5s4ded


-fno-builtin-puts cannot prevent clang
from emitting puts.
Is it because clang does not support
-fno-builtin-puts?

It is not clear to find out
which -fno-builtin-* is supported
because compilation succeeds anyway...


--
Best Regards
Masahiro Yamada
