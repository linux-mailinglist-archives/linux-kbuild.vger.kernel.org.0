Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC343248FC1
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 22:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgHRU7F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 16:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgHRU7E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 16:59:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9696DC061342
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 13:59:03 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 189so9673700pgg.13
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vr+5B+GKrgPurReyWi008Qfh1JfHLe7PchQovbrkqeA=;
        b=X5TDa7NmLSLO6xcFo2isrF5p8YaF8NNZhKzH/moB3vJcgBV/l8ZxwiIdax8/Z4mAvn
         5q6c62wCy/yTBc+pPwJAcV+9K+xZLodI1IQ2GXIHhpHugIhFLwLFFyB4YbDdg2IuEHcz
         xifD+weo3yENDACy1YGbMkOpdIK8zBS9QLWbCdKtT+dzWVCXFhWxGDe9NaRk+cwu9cXh
         1ow3dMfewwuAU6IFOhohi5xBxPIVXIgbaCx2JtiWM9g1i0m8E2viCSWkOUsYTGKvnq+C
         ui7OR2V9Mk8Ok3a757Uws7hqQKdWz5l+GMHUg3iPaHb8Ky9xjA3+5Yt0V2qr0/SjzJqs
         6hQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vr+5B+GKrgPurReyWi008Qfh1JfHLe7PchQovbrkqeA=;
        b=YSsg2BlHVHlzMqoUGLaNDc5o0pkIvwEUJ2ZVV6FZ3gk1cnmolclwhMEliDpLSNU9uK
         qT7h3gbuBy6/bQR2WCrbjZEStyfWbYnXIQZ+eo8ltcU25IuSjZdG9rlpI19K/3lbo7JG
         7jknIgSrjwBdtIMMJCf2f6lyIJ8YL46IymHyXYFEdkwZuKrjcbMJjWB24Zpwr8XLjhEo
         /VG/Gz6i6RBVJxk/J6hphU3R0KeX85mNZ9nN1PO0+zf5yb+DI3QcJBATAon2PQYocPxw
         zD8DOyUwrQnQo+UbE8RT7YVbmJmAIifsAW4u9GIeDstGuVeS6Q5Sxd9BL3cMI6vrzxS1
         e2RQ==
X-Gm-Message-State: AOAM533uKbzGR+5foifefev+KIWB8/sibKIKnekN2NzKF4lvPvX67oJv
        g+QVAvvgFg3v2YJf423O03eNCwSDG5pncIZuaB7cXA==
X-Google-Smtp-Source: ABdhPJykgNetkMhL19KFqwOXrJJLm1zb6+sWU0n3MZpGu8S4AdycyvfOq5gnOWFXOHjo6tnwK3BvBN6z54zlzNk3V1Q=
X-Received: by 2002:a63:a119:: with SMTP id b25mr14306933pgf.10.1597784342724;
 Tue, 18 Aug 2020 13:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
In-Reply-To: <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Aug 2020 13:58:51 -0700
Message-ID: <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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

On Tue, Aug 18, 2020 at 1:27 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Aug 18, 2020 at 1:24 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
> > > On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
> > > >
> > > > I'm not saying "change the semantics", nor am I saying that playing
> > > > whack-a-mole *for a limited time* is unreasonable. But I would like to go back
> > > > to the compiler authors and get them to implement such a #pragma: "this
> > > > freestanding implementation *does* support *this specific library function*,
> > > > and you are free to call it."
> > >
> > > I'd much rather just see the library functions as builtins that always
> > > do the right thing (with the fallback being "just call the standard
> > > function").
> > >
> > > IOW, there's nothing wrong with -ffreestanding if you then also have
> > > __builtin_memcpy() etc, and they do the sane compiler optimizations
> > > for memcpy().
> > >
> > > What we want to avoid is the compiler making *assumptions* based on
> > > standard names, because we may implement some of those things
> > > differently.
> > >
> >
> > -ffreestanding as it stands today does have __builtin_memcpy and
> > friends. But you need to then use #define memcpy __builtin_memcpy etc,
> > which is messy and also doesn't fully express what you want. #pragma, or
> > even just allowing -fbuiltin-foo options would be useful.

I do really like the idea of -fbuiltin-foo.  For example, you'd specify:

-ffreestanding -fbuiltin-bcmp

as an example. `-ffreestanding` would opt you out of ALL libcall
optimizations, `-fbuiltin-bcmp` would then opt you back in to
transforms that produce bcmp.  That way you're informing the compiler
more precisely about the environment you'd be targeting.  It feels
symmetric to existing `-fno-` flags (clang makes -f vs -fno- pretty
easy when there is such symmetry).  And it's already convention that
if you specify multiple conflicting compiler flags, then the latter
one specified "wins."  In that sense, turning back on specific
libcalls after disabling the rest looks more ergonomic to me.

Maybe Eli or David have thoughts on why that may or may not be as
ergonomic or possible to implement as I imagine?

> >
> > The two compilers have some peculiarities, which means you really can't
> > have functions with the same name that do something else if you want to
> > use builtins at all, and can also lead to missed optimizations.
> >
> > For eg, __builtin_strchr(s,'\0') can be optimized to strlen. gcc will
> > optimize it that way even if -ffreestanding is used (so strlen has to
> > mean strlen), while clang won't, so it misses a potential optimization.
> > This is admittedly a silly example, but you could imagine something like
> > strncpy being optimized to memcpy+memset if the source length was
> > previously computed.
> >
> > PS: clang optimizes sprintf, but doesn't provide __builtin_sprintf?
>
> https://bugs.llvm.org/show_bug.cgi?id=47224
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
