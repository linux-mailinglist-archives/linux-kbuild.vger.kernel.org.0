Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AAB24CE2C
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 08:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgHUGp7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 02:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgHUGp6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 02:45:58 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9C9C061386
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 23:45:57 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k13so414305lfo.0
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 23:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5bPPep5bDg1VFzpkxRBbcmCJ2qD9Va8/3Ftdk6p2l/g=;
        b=A3MGrtczd5NJ3P+Niu30oBzutZUKu0rHzDoXaIjo/qrbOFe/yeroAVI9Cjblbf7H/E
         Vj9Zm7gLY6r4O/ebPn1mze861IoyluIYqxWiuLUQNFevSY2HizJzaTnua84xRnVaD8az
         qSUKhhfOK+qPbYiGYEm0Ci1F/UhwmwNlUQ328=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5bPPep5bDg1VFzpkxRBbcmCJ2qD9Va8/3Ftdk6p2l/g=;
        b=iWNaWu0B+5l5MMX8VWxHk+JiYv4cRMuvK/1RUupjG3G8vuu0v0xbS81ewxysKsdOJI
         73KCXxi4k7ZQ7kmUQLUyS25wFsxcVe33Rlug6ye/pMw78BzQJif6z49IZmyK7ODZ0f0j
         B9XM0ywntKtyVPkm4iT8N2k7zjZdwJzKPcI0sE4HfmyoHWYqcf/Z+WPvU4H9qxXjuxyk
         iMvGm20NWilBcNHD3CuGqbDqLZvG0gaRBt+JPEzFk1diH9QtV8V7uijdpII5k7XW+ADX
         wZ6pfb2J4rQSnt9V5XZS0LX1VIixmm4obwEA6V1uGHGwUIS1xonm4J8z8iF+h5qmZdiU
         zFmA==
X-Gm-Message-State: AOAM533+ipnV5IrITq0Job98ACC693Jl1jlFcSZ1eYdf/zJzwnrWFoGq
        YvC+5aULCsjF+6GPz1zMx4Q09w==
X-Google-Smtp-Source: ABdhPJwOItL4qsnK0FWZmGbVV44MGEu8EXdcdrou8xJh+fE60Flz/ZSSVu6qUP5Ecr6kER+1ag9xNA==
X-Received: by 2002:a19:a8f:: with SMTP id 137mr715383lfk.145.1597992355755;
        Thu, 20 Aug 2020 23:45:55 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id p1sm188312lji.93.2020.08.20.23.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 23:45:54 -0700 (PDT)
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
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
 <20200820175617.GA604994@rani.riverdale.lan>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <721e6979-e83b-2238-4763-a8cf99b57631@rasmusvillemoes.dk>
Date:   Fri, 21 Aug 2020 08:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820175617.GA604994@rani.riverdale.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 20/08/2020 19.56, Arvind Sankar wrote:
> On Thu, Aug 20, 2020 at 04:56:02PM +0200, Rasmus Villemoes wrote:
>> On 18/08/2020 23.41, Arvind Sankar wrote:
>>>
>>> Note that -fno-builtin-foo seems to mean slightly different things in
>>> clang and gcc. From experimentation, clang will neither optimize a call
>>> to foo, nor perform an optimization that introduces a call to foo. gcc
>>> will avoid optimizing calls to foo, but it can still generate new calls
>>> to foo while optimizing something else. Which means that
>>> -fno-builtin-{bcmp,stpcpy} only solves things for clang, not gcc. It's
>>> just that gcc doesn't seem to have implemented those optimizations.
>>>
>>
>> I think it's more than that. I've always read gcc's documentation
>>
>> '-fno-builtin'
>> '-fno-builtin-FUNCTION'
>>      Don't recognize built-in functions that do not begin with
>>      '__builtin_' as prefix. ...
>>
>>      GCC normally generates special code to handle certain built-in
>>      functions more efficiently; for instance, calls to 'alloca' may
>>      become single instructions which adjust the stack directly, and
>>      calls to 'memcpy' may become inline copy loops.
>>      ...
>>
>> to mean exactly that observed above and nothing more, i.e. that
>> -fno-builtin-foo merely means that gcc stops treating a call of a
>> function named foo to mean a call to a function implementing the
>> standard function by that name (and hence allows it to e.g. replace a
>> memcpy(d, s, 1) by byte load+store). It does not mean to prevent
>> emitting calls to foo, and I don't think it ever will - it's a bit sad
>> that clang has chosen to interpret these options differently.
> 
> That documentation is misleading, as it also goes on to say:
> "...nor can you change the behavior of the functions by linking with a
> different library"
> which implies that you _can_ change the behavior if you use the option,
> and which is what your "i.e." is saying as well.
> 
> My point is that this is not completely true: in gcc, foo by default is
> defined to be __builtin_foo, and -fno-builtin-foo simply removes this
> definition. So the effect is just that calls to foo in the original
> source will be left alone.

Yes, this is a much better way of putting it. And with -fbuiltin-foo in
effect, the compiler just needs to transform the code in some way as-if
the standard function by that name was called, which it can of course
decide to implement by emitting such a call, but it can also open-code
it - or synthesize it using other std functions.

> But in order for an optimization that introduces a new call to foo to be
> valid, foo _must_ have standard semantics: strchr(s,'\0') is not s +
> strlen(s) unless strlen has standard semantics.

Correct. So I agree that -fno-builtin-strlen should prevent the compiler
from generating calls to strlen() that don't appear in the code.

This is an oversight in
> gcc's optimizations: it converts to s + __builtin_strlen(s), which then
> (normally) becomes s + strlen(s).
> 
> Check out this horror: https://godbolt.org/z/a1r9fK
> 
> Clang will disable this optimization if -fno-builtin-strlen is
> specified.
>
> Clang's interpretation is more useful for embedded, since you can use
> -fno-builtin-foo and avoid calling __builtin_foo directly, and be
> guaranteed that there will be no calls to foo that you didn't write
> explicitly (outside of memcpy/memset/memcmp). In this case you are free
> to implement foo with non-standard semantics, or avoid implementing it
> altogether, and be reasonably confident that it will all work.

Yeah, except that the list of -fno-builtin-foo one would have to pass is
enourmous, so for targets with a somewhat wonky libc, I'd much rather be
able to do a blanket -fno-builtin, and then manually check their memcpy,
memset and memcmp implementations and opt back in with
-fbuiltin-mem{cpy,set,cmp} so that small constant-size memcpys do get
properly open-coded.

The advice in gcc's documentation of just #definining memcpy() to
__builtin_memcpy() doesn't work in the real world (for example it breaks
C++ code that uses std::memcpy(...)).

>> Thinking out load, it would be useful if both compilers grew
>>
>>   -fassume-provided-std-foo
>>
>> and
>>
>>   -fno-assume-provided-std-foo
>>
>> options to tell the compiler that a function named foo with standard
>> semantics can be assumed (or not) to be provided by the execution
>> environment; i.e. one half of what -f(no-)builtin-foo apparently does
>> for clang currently.
> 
> Not following: -fno-assume-provided-std-foo sounds like it would have
> exactly the same semantics as Clang's -fno-builtin-foo, except maybe in
> addition it should cause the compiler to error on seeing __builtin_foo
> if it can't implement that without calling foo.

Yeah, I think you've convinced me there's no use for a separate option
to prevent inventing calls to foo() - I was mostly thinking of it as a
way to avoid having to provide each and every libc function that may
have been half-way standardized at some point. But if one doesn't
provide, say, bcmp, the code base certainly doesn't use bcmp itself, so
one doesn't lose anything by just using -fno-builtin-bcmp; there are no
explicit bcmp() uses that fail to get optimized.

Rasmus
