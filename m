Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA00624DE68
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 19:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgHUR3y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 13:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728754AbgHUR3j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 13:29:39 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DCCC061573;
        Fri, 21 Aug 2020 10:29:39 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id t23so1761715qto.3;
        Fri, 21 Aug 2020 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5YuybKZTV6+y2jdsm8D937XYyXteASeCgo782uMSN54=;
        b=DaXjCsU6rUCmYHNazMqmOYKGd5+E7dI8Ey8oG06UZdKZ6MEfAwCzeJuL5jPFWIpu5F
         bvmtLt5LAvQd9ILlvhPajOdyPzp83wbzwxrBShXw/fWBXwhWh7BOzSuUfWA4cLaQJFan
         CoPd5gvagUyrnVZqK+GQwjwMsQYbisbUrjq4Ivtf97aTmu+eeKguGqP09cBgRX9YL2NA
         Hln+YzwbfuFCKoa8SCIulLXPrZGbpU61MbbT2vVxC6tISr/LyhNMi7KU03DIy5+XLWW5
         J0ypft08k/bOe9E8bhOukd+oVls6eH2IZkzJIokr6q+3iqEIVUuMHnjrP0K+Mvwl/JWP
         GyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=5YuybKZTV6+y2jdsm8D937XYyXteASeCgo782uMSN54=;
        b=oS2o593Dt6F2ycLGHd0QTxNj7Y+MJLKOORrYtG1ufUSh+lW7n6EcvcHL8QE6hKCzlV
         B5DNOqT/oIcWyR4ZKzskDBEphmDBKvAefwN/P9t2/CI95pblmKBiIGam3XK2Aaz8JJjt
         st/nH3qFadV5PT2yBCHLYmiHoY/4WysruPNSxzx263IlWA5kktVjElrYjtVZCIVTmALP
         yDXlaZ3I3KKxZlUhITJdhLBOi5pq8cZPun//nDgsKdKMe64fpAV8/QsG5Y/KbAgwngyz
         Va7/n4Fsiq/HzJERSoGGCy4MgsMCHVdZlh+JTKBRwjQ3Jza9AujwWYXXz+XqUxizT3wx
         Q+eQ==
X-Gm-Message-State: AOAM530g4qFlyubpPUPVAOk6nmzB92rhw44VTVB8Ehu/1DU6XhzEVQzy
        VJiluGzIEvNMFlRqeIZsrSE=
X-Google-Smtp-Source: ABdhPJyh4Xad2b+n7JZSbMQHz8G1pyzv4nfZxw6XeH/8FvDa3KZKEdCj5fLjYlIZHR31w0iq87urFA==
X-Received: by 2002:ac8:ec7:: with SMTP id w7mr3770399qti.118.1598030978689;
        Fri, 21 Aug 2020 10:29:38 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id j61sm2521675qtd.52.2020.08.21.10.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 10:29:37 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Fri, 21 Aug 2020 13:29:35 -0400
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
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
Message-ID: <20200821172935.GA1411923@rani.riverdale.lan>
References: <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
 <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan>
 <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan>
 <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 20, 2020 at 04:33:03PM -0700, Linus Torvalds wrote:
> On Thu, Aug 20, 2020 at 10:56 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > Clang's interpretation is more useful for embedded, since you can use
> > -fno-builtin-foo and avoid calling __builtin_foo directly, and be
> > guaranteed that there will be no calls to foo that you didn't write
> > explicitly (outside of memcpy/memset/memcmp). In this case you are free
> > to implement foo with non-standard semantics, or avoid implementing it
> > altogether, and be reasonably confident that it will all work.
> 
> Honestly, I think concentrating on whether __builtin_foo() works or
> not misses the point entirely.
> 
> That has never _ever_ been a problem for us, and I doubt it has been a
> problem for anybody else either.
> 
> If you use __builtin_memcpy() in your source tree, then why would you
> possibly ever want to disable it? And if you _don't_ use it, then
> again - why would you ever want to disable it?
> 
> No, the real (and only) problem has always been about the compilers
> magically and silently "recognizing" certain source patterns, and
> turning them into function calls behind the users back.
> 
> And that has nothing to do with __builtin_foo(). At least it
> _shouldn't_ have anything to do with it.
> 

There seems to be some confusion here. The recognition and
__builtin_foo() go hand-in-hand: memcpy() is special _because_ the
compiler defines it to be __builtin_memcpy(); and the compiler turns the
patterns into __builtin_foo() calls, which just end up as a call to
foo() if they can't be inlined. The no-builtin- options _don't_ disable
__builtin_ functions. They remove the default definition of foo() as
__builtin_foo().

Take the problem that instigated this thread. __builtin_stpcpy() doesn't
work in the kernel because the fallback, stpcpy(), isn't implemented.
The optimization is doing:
  sprintf(buf,"%s",s)
  -> __builtin_sprintf(buf,"%s",s)
  -> __builtin_stpcpy(buf,s)-buf
  -> stpcpy(buf,s)-buf

Now, further below, you basically say this is an example of the compiler
taking something non-stpcpy() and turning it into stpcpy(), and you ask
for a no-magic-stpcpy that would stop this optimization. That's what
clang's no-builtin-stpcpy already does. The only extra thing it does is
that the compiler will also not touch an explicit call to stpcpy(), but
you can still call __builtin_stpcpy() if you really want it.

This is what was going on in that LZ4 memcpy() issue: the compiler was
faithfully compiling code like memcpy(d,s,8) into a call to memcpy()
because we told it not to define memcpy() as __builtin_memcpy(), by
compiling for a freestanding environment.

This is why I'm saying clang's no-builtin-foo option is useful for
embedded: it doesn't prevent the programmer using __builtin_foo(), it
prevents the _compiler_ using __builtin_foo() on its own.

> So this is things like the compiler silently seeing "oh, you called
> your function 'free()', so we know that the stores you did to it are
> dead and we'll remove them".
> 
> Or this is the compiler doing "Oh, you did four stores of zero in a
> row, and and you asked for size optimizations, so we'll turn those
> into a 'bzero()' call".

This one is slightly different from the previous one. The first case is
really a call to __builtin_free().

This one is turning something that wasn't a function call into
__builtin_bzero(), and I would hope that no-builtin-bzero would stop it
as well. OTOH, the compiler is free to turn it into memset(), just like
it could for structure/array initializers.

The memcpy/memset/memcmp family is a bit of an edge case: the compiler
requires them to be defined even for freestanding environments, so you
can't in general stop the compiler from turning something into memset().
(That -ffreestanding stops gcc from turning loops into memset() is a
pragmatic recognition that some people are going to try to implement
memset() in C.)

> 
> Or the compiler doing completely broken things, and turning a
> "!memcmp()" expression into a "!bcmp()" because the compilier
> incorrectly assumes it's faster.

Stop it with the bcmp-shaming already. bcmp _can_ be implemented faster
than memcmp, and it's no great loss if it isn't, since then it'll just
be an alias to memcmp in any sensible libc.

> 
> Notice? Not a single one of those had any __builtin_xyz() pattern in
> them. Quite the reverse. The compiler took something completely
> different, and assumed builtin semantics without us having told it to.
> 
> So I think "-fno-builtin-xyz" is barking *completely* up the wrong
> tree. It's missing the problem. The problem is not "I have some
> builtin patterns, here, you can use them".

Nope: in a hosted environment, xyz() _is_ __builtin_xyz(), and that is
almost always a good thing for 99% of the code out there: you tell it to
use builtin semantics by choosing to compile for a hosted environment.

If you want something in between freestanding and hosted, you absolutely
need some way to tell the compiler exactly which xyz()'s can be treated
as __builtin_xyz() and which ones shouldn't. The no-builtin- flags allow
you to start from a hosted environment and turn off the specialness of
the functions that you don't want to be special. The proposed builtin-
flags would allow you to start from freestanding and turn on the
specialness of the functions that you do want to be special.

> 
> It's the same as all the vector intrinsics. Those don't hurt anybody -
> as long as they only get used when people use the intrinsics. If the
> compiler starts to suddenly use vector intrinsics without being told
> to, *THAT* can be a problem. But there is never any reson to turn off
> any particular intrinsic otherwise.
> 
> If you don't want it used, don't use it. And if you do use it, the
> compiler generates the vector code sequence. It's that simple.
> 
> So to me, a compiler flag like "-fno-builtin-memcpy" is completely
> insane. The flag adds absolutely no value.
> 
> The real value would be "-fno-magic-bcmp" which turns off stupid
> optimizations that magically turn non-bcmp things into bcmp. But it
> should not turn off *actual* __builtin_bcmp() if such a thing exists
> and people want to explicitly use it.
> 
>              Linus
