Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4460F248F99
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 22:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgHRU2K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 16:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgHRU2H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 16:28:07 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA725C061389
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 13:28:06 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j21so10270024pgi.9
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xxbo8ts5YS429RzEU6ZgRNO13aJtTja8Ct2w5Hx3ELI=;
        b=I9ZazxWW3yNjUs4lFGnzeJihSQFCQ2r/rN+yu5KLqpCghaUgoNqtf6TwLa8Zs4Ld3V
         ZKcsVCz8OufKjRhyMG0CIadleSRk1SKaVJDzLUVsZ7aA3DpZiNQyHXy/AieFuNVleSdz
         o9MsfLwNq1MCTxYBELvWTJ7/riY/rh7WCiQUMsDGntllK4zDoCSxonJON9YtejbA6VDk
         2a0PWw6s87jLwUjwjhqhq7ZYwQfr6tIYL+BkCpjyY6GR8UAJMQVg0UJEQk3yKGdwICp0
         dfyEVT4ClFeI+1FwC60kRM5LoF9IL0zuC1m+XgdKMRGzpkdG8Yiq5R2OeunyZG6J+F4/
         4Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxbo8ts5YS429RzEU6ZgRNO13aJtTja8Ct2w5Hx3ELI=;
        b=WPQJJqnXdswiUoTT+HckZJLgcKKdyb76aKdptScUFs2vSDMG9ztoaLGbGbp3jHavVP
         68K3OHfDznCGte2wQy8mACxoEd4t1SS2iLH7dnxQeXQ0r/p+RzTzoljj2FO1gKZj2YTo
         LucXKqnrFHMSOeuOfe2dxygcA21l63QOUPGfhtikPyi1AQLvbDBXWwfIx9ojqFDisce7
         7IvKYK2PiYVdTAo2H8gJPyKsjaEC9Ixbzs/PWK0J3WjWsGfzYKKdpqoIcX0dMOCyxRbb
         V+H2a1bIsJ1g9ffAFkBPTogzz2DTnw/tNwZcmf8gnS2PZbgq70aXzYZvpiWG/G3juF4O
         ZIhQ==
X-Gm-Message-State: AOAM5301szMxN+U1BZDxBgjLiNfWeoe2kDB8foXdlU7/AVNqGjwlrPsv
        7Q7QaDYR9GxlFr8E/WylKNPR5/pu9swj0GkS/mWfMw==
X-Google-Smtp-Source: ABdhPJw3r3c5zfHyeswmOG57fp7bxIYVb0RszFBCj3KKjt8kCRCEcn6gmG8pMyymVAA3R/3CtWzuceO4UwwxbAZmZwU=
X-Received: by 2002:aa7:96e5:: with SMTP id i5mr13635550pfq.108.1597782485999;
 Tue, 18 Aug 2020 13:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
In-Reply-To: <20200818202407.GA3143683@rani.riverdale.lan>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Aug 2020 13:27:54 -0700
Message-ID: <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>
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
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 1:24 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
> > On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
> > >
> > > I'm not saying "change the semantics", nor am I saying that playing
> > > whack-a-mole *for a limited time* is unreasonable. But I would like to go back
> > > to the compiler authors and get them to implement such a #pragma: "this
> > > freestanding implementation *does* support *this specific library function*,
> > > and you are free to call it."
> >
> > I'd much rather just see the library functions as builtins that always
> > do the right thing (with the fallback being "just call the standard
> > function").
> >
> > IOW, there's nothing wrong with -ffreestanding if you then also have
> > __builtin_memcpy() etc, and they do the sane compiler optimizations
> > for memcpy().
> >
> > What we want to avoid is the compiler making *assumptions* based on
> > standard names, because we may implement some of those things
> > differently.
> >
>
> -ffreestanding as it stands today does have __builtin_memcpy and
> friends. But you need to then use #define memcpy __builtin_memcpy etc,
> which is messy and also doesn't fully express what you want. #pragma, or
> even just allowing -fbuiltin-foo options would be useful.
>
> The two compilers have some peculiarities, which means you really can't
> have functions with the same name that do something else if you want to
> use builtins at all, and can also lead to missed optimizations.
>
> For eg, __builtin_strchr(s,'\0') can be optimized to strlen. gcc will
> optimize it that way even if -ffreestanding is used (so strlen has to
> mean strlen), while clang won't, so it misses a potential optimization.
> This is admittedly a silly example, but you could imagine something like
> strncpy being optimized to memcpy+memset if the source length was
> previously computed.
>
> PS: clang optimizes sprintf, but doesn't provide __builtin_sprintf?

https://bugs.llvm.org/show_bug.cgi?id=47224
-- 
Thanks,
~Nick Desaulniers
