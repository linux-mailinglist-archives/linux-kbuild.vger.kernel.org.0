Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F8D24DEF3
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 19:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgHURzU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 13:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgHURzR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 13:55:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707ACC061573
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 10:55:17 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y2so2805862ljc.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 10:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m4V8fZt1LIyKWUpK//pHmx+UE2cyQI+1k+0DpARcdKs=;
        b=UCXANsHTDuglcuMoaPQrO2SPcgEY6vG1EKV1rTav9qeDhjuPUXwzOzAWO97GPtjQDH
         vnro5pnl96FGhRTeEBpt/OEZjQu48BweLMmP5gUzvXiHcfKKCnzSqCp8rihnevc6AQ5B
         Ceo5/n8nq9tRTr1tnI08EiIZY6bxL404FbH6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m4V8fZt1LIyKWUpK//pHmx+UE2cyQI+1k+0DpARcdKs=;
        b=HEC6nZr0pP9/AIk9uCCimme0LDaAJKUXoWR0B3G0Jp3iZlJdKwDuDIPW1uLPMp7Rwq
         n6wn2uTixryhBthTBi+NwsEj9kkKFr589b83576AO0EVwEuzmUxvrX6D0ZrA4/i5txeT
         IckJ/vZ4sdHjb8VYQRdsLHhYEO7pLEYyKUzTQ9IRCZQjYwNdZJFIMj0dvmJo0KSQmaKl
         ETT2y2nHUWdT7Nu2QcTV0aW0wxv0h6CR/WWK942gUx1HfmOzU6a8TMkx5hGcWOoR0D5F
         3W9DjQyj5EGqw5rmWcteDRL+BhQ/3IgKuKlbmjT7bZ4Ue7X8pgtfwr8oHXM3EFLzE34s
         atMA==
X-Gm-Message-State: AOAM533X0j9ntMNn3DX5d3xVza8OhUSagGVgp8GFcZ+YyQ5c1WpLBV0k
        2hOh3cupf41XxfCJJBFjBQntoIwseMqWFw==
X-Google-Smtp-Source: ABdhPJxhYwdj5LgGAFxNhfbF2nQZgDzJL4DOXqMjAX9/UpBE42gAR37mGK3ydfMLEpn6xE22Fc0+/w==
X-Received: by 2002:a2e:7c18:: with SMTP id x24mr1982412ljc.402.1598032515504;
        Fri, 21 Aug 2020 10:55:15 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id r11sm524371ljk.46.2020.08.21.10.55.13
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 10:55:14 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id v9so2786161ljk.6
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 10:55:13 -0700 (PDT)
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr2203972ljp.312.1598032513384;
 Fri, 21 Aug 2020 10:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan> <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
 <20200821172935.GA1411923@rani.riverdale.lan>
In-Reply-To: <20200821172935.GA1411923@rani.riverdale.lan>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 21 Aug 2020 10:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
Message-ID: <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 10:29 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> The no-builtin- options _don't_ disable
> __builtin_ functions. They remove the default definition of foo() as
> __builtin_foo().

Oh, ok, then it's fine.

> Take the problem that instigated this thread. __builtin_stpcpy() doesn't
> work in the kernel because the fallback, stpcpy(), isn't implemented.

Right.

The only problem is the - bogus - recognition of (or rewriting of)
code patterns that the compiler recohnmizes.

__builtin_stpcpy() itself is fine if somebody wants to use it - and
has the fallback.

But implicitly recognizing some code sequence and turning it into
something else is the problem.

> This is why I'm saying clang's no-builtin-foo option is useful for
> embedded: it doesn't prevent the programmer using __builtin_foo(), it
> prevents the _compiler_ using __builtin_foo() on its own.

And that's fine. But it's apparently not what gcc does.

> > So this is things like the compiler silently seeing "oh, you called
> > your function 'free()', so we know that the stores you did to it are
> > dead and we'll remove them".
> >
> > Or this is the compiler doing "Oh, you did four stores of zero in a
> > row, and and you asked for size optimizations, so we'll turn those
> > into a 'bzero()' call".
>
> This one is slightly different from the previous one. The first case is
> really a call to __builtin_free().

No, the first case is a disgrace and a compiler bug.

We've had a situation where gcc complained about a static function
called "free()", without any header file inclusion, and then
complained about it not matching its idea of what "free()" is.

Which is pure and utter garbage.

It's like you have a local variable "int free", and the compiler says
"hey, this doesn't match the prototype that I know this name should
have". It's BS. You just saw the user not just *use* that name, but
*define* it, and do it in a scope where the complaint is irrelevant
and stupid, and when we hadn't even included the header that would
have resulted in conflicts.

IOW, it's an example of a compiler that thinks "it knows better".

It's a broken compiler. And it's an example of the kind of breakage
that compilers absolutely shouldn't do.

The second example is from clang doesn't something horribly horribly stupid.

> This one is turning something that wasn't a function call into
> __builtin_bzero(), and I would hope that no-builtin-bzero would stop it
> as well. OTOH, the compiler is free to turn it into memset(), just like
> it could for structure/array initializers.

The whole "the compiler is free to do X" argument is pure BS. Stop
repeating that bogus argument.

Of COURSE a compiler can do whatever the hell it wants.

That doesn't change the fact that certain things are broken beyond
words and utterly stupid, and a compiler that does them is a *BAD*
compiler.

Turning four stores into a memset() is garbage. Just admit it, instead
of trying to say that it's allowed.

Technically a compiler can decode to simply not compile the kernel at
all, because we do things that are outside a lot of standards.

So the "technically allowed" is not an argument.

             Linus
