Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87686249082
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 00:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgHRWAL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 18:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgHRWAJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 18:00:09 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56B1C061389
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 15:00:08 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d188so10633047pfd.2
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 15:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/AxmovO98IHJLv1CX6xUdj9pEPvzGzDZT+BKRsV1lY=;
        b=iILfBF6sXg7pzcaaZ2AWKXWS+zCeWTUcxBLBFdpxqz2bhV+FQqzCgHMN9JKUQyivlf
         E7EBB6JD5veMabpuIfhmFZkcGkehLev0ct2LCFWdOgcDIQ6RbZk8IhvUi+xrsvpx/CQk
         yz8RmoT/HHD7atWCAwk2pOHbVmvXhhq4cC0Jw+buG0YhlCdiiXealsJp6rAOy0QB6zCo
         fytw6tladDvyELDG71aqx5XqAzL27q3kVvK0y2/JtBp0wR4jWGGsrWN74Q0xX+/dpO8i
         nDU9ONiCTS9Jdq+CnlJeBixwDtBNcxxn9Pv0dCkIXRi9tUEbGfacCilhjXqBsEAuDHZp
         qWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/AxmovO98IHJLv1CX6xUdj9pEPvzGzDZT+BKRsV1lY=;
        b=cL7m2c6b12LZsfMh2xLOf7BjKnz7CTVpek8MpSdpmwIMpEojIyz/9YvZwPkok1D2yp
         XVTgkZ/sPRCs5PelfNoihGeXU5KcuUXjrSiBPUlJ8hArG4DmHieY8iqx5WAjofAuVIo5
         0l/bKHJdDvS4HfjIGED4xf3CNfLgVlKECGvisaxHM0Pxy4Tk61dAB1Qoo3PH7WPyfddC
         ba52i6IKgOLYoa0xvvNdAOmSSmhdkN7G28yQ++7lmciXIACDNdqDjoKl/kEVyteRWnGF
         leBpARq+NpS7BprU0T3vhbcO1PNbpmaBIg6q38Xb6qNiCrA89RspFE2u1pOII4nHq0iG
         HKbg==
X-Gm-Message-State: AOAM531IMuZHkRLP5qDAEMk5iTHULkNf9aP658Pxvm29K2sCpNZxsbmy
        nRAYAQi93zbj4Pt2cFxKt4G5Q9WLLTrSTBQksRegJg==
X-Google-Smtp-Source: ABdhPJw1okZeg98NBXPTZjiqt5gwbn+1e3A7rVPN/HT37J1FmBzAShFsvbhQoMUv0hCUQBOYN9DQzW/ckwM/KKMm6p4=
X-Received: by 2002:a63:a119:: with SMTP id b25mr14426151pgf.10.1597788008115;
 Tue, 18 Aug 2020 15:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com> <20200818214146.GA3196105@rani.riverdale.lan>
In-Reply-To: <20200818214146.GA3196105@rani.riverdale.lan>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Aug 2020 14:59:56 -0700
Message-ID: <CAKwvOdnW8zjcxmHwu5PhHa1hMFu=S=qPh5gfC6tN7FrSE+3kKg@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
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

On Tue, Aug 18, 2020 at 2:41 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
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

Can you please share some godbolt links that demonstrate these observations?
-- 
Thanks,
~Nick Desaulniers
