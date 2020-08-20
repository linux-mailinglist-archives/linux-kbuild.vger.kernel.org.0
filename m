Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC1A24C4E7
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Aug 2020 19:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHTR4X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 13:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgHTR4V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 13:56:21 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DC1C061385;
        Thu, 20 Aug 2020 10:56:21 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id j10so1300586qvo.13;
        Thu, 20 Aug 2020 10:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xPg80FTYr7jHnigVtUvLs+RG+/ikYe21gYIT+f1HYr4=;
        b=TUVy88eynJDrUjzPi+voCkxs1fKTeQ9UJAWiS3dDBs/Svql8mn78n3oQpv0Ag2g8u8
         oyRj2lqGGmP2U3sAXLpzCfSnUpIyO7XwGW0VBmrose7c5qENXxip2I05VNt5fs19QXdW
         iIkwepYqutpBbopfiU3qNPmujWeZyMI0p1dtUmg70sZqaD9jeJXyW1+r5F3pFvYXNbf1
         ++y9mjmPUj9fVmmNcL8Z51q3em5yVkMG64M3+NpKh+imjotSXKtVxjLAJEdC/ZaHzRGb
         LpEABcTxKKefpVSMds5CSg6rEUKg6iCIO2hxF4fHIsBgJGRUup224+uz0/i9h1jFxZ0L
         XE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=xPg80FTYr7jHnigVtUvLs+RG+/ikYe21gYIT+f1HYr4=;
        b=SDGCQ9+BkLUs1xaHCxRarGHNb+GB+rKhXPdfbIGcROiAHiCOlzjePsLUscqD0+dZyb
         VM5V8GHerIsrdc4iL0jx2nhvSKQ2WSB41hrK018usEyaXCZ/87cPCkzFiic6y29D3sl8
         MVZ2xKBQDOta19S0jLD9tT0qugT/QoCfCJC6fYFj7Ovx0vPiN/v1E5t0VsI9Em9TbhfZ
         vyQD76uQBIQkGoTt6oTY72Nkjsxwu+FB5xz3tn2Ygs0qgyItBAXH1dGMDh2lYtutZ0mH
         WEfdfwY9iG6lObnkE0hGJ5COwOAMYz6x+zIAKeV41oaRAfni4/4qW16TvTopbQMIvpuk
         HX6g==
X-Gm-Message-State: AOAM531GHA54n3Q6ocl2IGiNt4O+/hvH4F37/T6fRrj7sSiCwr7VUMlg
        6TEZcxWa0dp5KvBnLmXrppw=
X-Google-Smtp-Source: ABdhPJyH2IY36IK1XwEJAFmI+sGhcHgtGvi0iUoixNTtuVeDPH+RxPgsJ3nRqsNwpvKFghuHysux8Q==
X-Received: by 2002:a05:6214:18d1:: with SMTP id cy17mr4114807qvb.29.1597946180488;
        Thu, 20 Aug 2020 10:56:20 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id c33sm3736137qtk.40.2020.08.20.10.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 10:56:19 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Thu, 20 Aug 2020 13:56:17 -0400
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
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
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200820175617.GA604994@rani.riverdale.lan>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com>
 <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
 <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan>
 <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 20, 2020 at 04:56:02PM +0200, Rasmus Villemoes wrote:
> On 18/08/2020 23.41, Arvind Sankar wrote:
> > 
> > Note that -fno-builtin-foo seems to mean slightly different things in
> > clang and gcc. From experimentation, clang will neither optimize a call
> > to foo, nor perform an optimization that introduces a call to foo. gcc
> > will avoid optimizing calls to foo, but it can still generate new calls
> > to foo while optimizing something else. Which means that
> > -fno-builtin-{bcmp,stpcpy} only solves things for clang, not gcc. It's
> > just that gcc doesn't seem to have implemented those optimizations.
> > 
> 
> I think it's more than that. I've always read gcc's documentation
> 
> '-fno-builtin'
> '-fno-builtin-FUNCTION'
>      Don't recognize built-in functions that do not begin with
>      '__builtin_' as prefix. ...
> 
>      GCC normally generates special code to handle certain built-in
>      functions more efficiently; for instance, calls to 'alloca' may
>      become single instructions which adjust the stack directly, and
>      calls to 'memcpy' may become inline copy loops.
>      ...
> 
> to mean exactly that observed above and nothing more, i.e. that
> -fno-builtin-foo merely means that gcc stops treating a call of a
> function named foo to mean a call to a function implementing the
> standard function by that name (and hence allows it to e.g. replace a
> memcpy(d, s, 1) by byte load+store). It does not mean to prevent
> emitting calls to foo, and I don't think it ever will - it's a bit sad
> that clang has chosen to interpret these options differently.

That documentation is misleading, as it also goes on to say:
"...nor can you change the behavior of the functions by linking with a
different library"
which implies that you _can_ change the behavior if you use the option,
and which is what your "i.e." is saying as well.

My point is that this is not completely true: in gcc, foo by default is
defined to be __builtin_foo, and -fno-builtin-foo simply removes this
definition. So the effect is just that calls to foo in the original
source will be left alone.

But in order for an optimization that introduces a new call to foo to be
valid, foo _must_ have standard semantics: strchr(s,'\0') is not s +
strlen(s) unless strlen has standard semantics. This is an oversight in
gcc's optimizations: it converts to s + __builtin_strlen(s), which then
(normally) becomes s + strlen(s).

Check out this horror: https://godbolt.org/z/a1r9fK

Clang will disable this optimization if -fno-builtin-strlen is
specified.

Clang's interpretation is more useful for embedded, since you can use
-fno-builtin-foo and avoid calling __builtin_foo directly, and be
guaranteed that there will be no calls to foo that you didn't write
explicitly (outside of memcpy/memset/memcmp). In this case you are free
to implement foo with non-standard semantics, or avoid implementing it
altogether, and be reasonably confident that it will all work.

> 
> Thinking out load, it would be useful if both compilers grew
> 
>   -fassume-provided-std-foo
> 
> and
> 
>   -fno-assume-provided-std-foo
> 
> options to tell the compiler that a function named foo with standard
> semantics can be assumed (or not) to be provided by the execution
> environment; i.e. one half of what -f(no-)builtin-foo apparently does
> for clang currently.

Not following: -fno-assume-provided-std-foo sounds like it would have
exactly the same semantics as Clang's -fno-builtin-foo, except maybe in
addition it should cause the compiler to error on seeing __builtin_foo
if it can't implement that without calling foo.

> 
> And yes, the positive -fbuiltin-foo would also be quite useful in order
> to get the compiler to recognize a few important functions (memcpy,
> memcmp) while using -ffreestanding (or just plain -fno-builtin) to tell
> it to avoid assuming anything about most std functions - I've worked on
> a VxWorks target where snprintf() didn't have the correct "return what
> would be written" semantics but rather behaved like the kernel's
> non-standard scnprintf(), and who knows what other odd quirks that libc had.
> 
> Rasmus
