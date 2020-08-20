Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3BB24C113
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Aug 2020 16:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgHTO4P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 10:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgHTO4J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 10:56:09 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E10C061386
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 07:56:08 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id g6so2397762ljn.11
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/ykyf/DFJPRk+LJhd4gWzpG3IAE+R8tPYL4KrwhMgRM=;
        b=Tqwr6xPEkCzFQinEVPAhvPL+AZv9nB9tisxcKkJmbGxIz2fQRURRo96xYFC2daX/K2
         aV6+c27jl18VUfd/iriJg+/oExn7ydoVTnDh/QhBX9vtaHaKlxmLdsZK1mfGewIuT7uQ
         LFxsQsIftezlmHizWiaN57J3ZQd4+Vo2oHUu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/ykyf/DFJPRk+LJhd4gWzpG3IAE+R8tPYL4KrwhMgRM=;
        b=rFwEDFaLNdXNvCddA3ONVWmZ0EO/f+dtbsc2XRSQNmXJMfDER0k3vvxkWu0SJw9Gyo
         bAyvyp0tcZMvVeipy95EdLqBbtQ8CpRi3YvTHmwomQZxmpdWvEw1+QFoFlRKKOowfzl8
         Bd3vAbx6MP3KYpfdsy6mP5JVq9wTTbtu4OutIaDsMJTDQ0SxLb+DNVwyRZJUsPINnkM2
         m3RWXF0VPH6/hYoX1IX4DVZM52Qsfl+K+ddf+9UO6qLIf+XroE0dSqHbJ2Lp0e1FuVx1
         iTNAtvpLzi/dTcRdYUoXaxQqZDrxxFCuWdJ/htfHbp9TA2qWYak89McxiC5pA0XPeDcp
         NYYQ==
X-Gm-Message-State: AOAM531Nz9Wr4oVyblohswZyqPMsN/07e3oRqYZVpHuIWxFwIBmdKAyk
        URpAHH6rjxs3zGCJu976geTWfA==
X-Google-Smtp-Source: ABdhPJwWNTMjuLtgomNg4RLsk7kkApyg5eAdXgForaqNIq9JLTBaq8slGS9ncLR37o9JdusAsoMrgw==
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr1707465lji.215.1597935365273;
        Thu, 20 Aug 2020 07:56:05 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id f12sm498715ljn.14.2020.08.20.07.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 07:56:04 -0700 (PDT)
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Desaulniers <ndesaulniers@google.com>
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
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com>
 <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
 <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
Date:   Thu, 20 Aug 2020 16:56:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818214146.GA3196105@rani.riverdale.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 18/08/2020 23.41, Arvind Sankar wrote:
> On Tue, Aug 18, 2020 at 01:58:51PM -0700, Nick Desaulniers wrote:
>> On Tue, Aug 18, 2020 at 1:27 PM Nick Desaulniers
>> <ndesaulniers@google.com> wrote:
>>>
>>> On Tue, Aug 18, 2020 at 1:24 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>>>>
>>>> On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
>>>>> On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
>>>>>>
>>>>>> I'm not saying "change the semantics", nor am I saying that playing
>>>>>> whack-a-mole *for a limited time* is unreasonable. But I would like to go back
>>>>>> to the compiler authors and get them to implement such a #pragma: "this
>>>>>> freestanding implementation *does* support *this specific library function*,
>>>>>> and you are free to call it."
>>>>>
>>>>> I'd much rather just see the library functions as builtins that always
>>>>> do the right thing (with the fallback being "just call the standard
>>>>> function").
>>>>>
>>>>> IOW, there's nothing wrong with -ffreestanding if you then also have
>>>>> __builtin_memcpy() etc, and they do the sane compiler optimizations
>>>>> for memcpy().
>>>>>
>>>>> What we want to avoid is the compiler making *assumptions* based on
>>>>> standard names, because we may implement some of those things
>>>>> differently.
>>>>>
>>>>
>>>> -ffreestanding as it stands today does have __builtin_memcpy and
>>>> friends. But you need to then use #define memcpy __builtin_memcpy etc,
>>>> which is messy and also doesn't fully express what you want. #pragma, or
>>>> even just allowing -fbuiltin-foo options would be useful.
>>
>> I do really like the idea of -fbuiltin-foo.  For example, you'd specify:
>>
>> -ffreestanding -fbuiltin-bcmp
>>
>> as an example. `-ffreestanding` would opt you out of ALL libcall
>> optimizations, `-fbuiltin-bcmp` would then opt you back in to
>> transforms that produce bcmp.  That way you're informing the compiler
>> more precisely about the environment you'd be targeting.  It feels
>> symmetric to existing `-fno-` flags (clang makes -f vs -fno- pretty
>> easy when there is such symmetry).  And it's already convention that
>> if you specify multiple conflicting compiler flags, then the latter
>> one specified "wins."  In that sense, turning back on specific
>> libcalls after disabling the rest looks more ergonomic to me.
>>
>> Maybe Eli or David have thoughts on why that may or may not be as
>> ergonomic or possible to implement as I imagine?
>>
> 
> Note that -fno-builtin-foo seems to mean slightly different things in
> clang and gcc. From experimentation, clang will neither optimize a call
> to foo, nor perform an optimization that introduces a call to foo. gcc
> will avoid optimizing calls to foo, but it can still generate new calls
> to foo while optimizing something else. Which means that
> -fno-builtin-{bcmp,stpcpy} only solves things for clang, not gcc. It's
> just that gcc doesn't seem to have implemented those optimizations.
> 

I think it's more than that. I've always read gcc's documentation

'-fno-builtin'
'-fno-builtin-FUNCTION'
     Don't recognize built-in functions that do not begin with
     '__builtin_' as prefix. ...

     GCC normally generates special code to handle certain built-in
     functions more efficiently; for instance, calls to 'alloca' may
     become single instructions which adjust the stack directly, and
     calls to 'memcpy' may become inline copy loops.
     ...

to mean exactly that observed above and nothing more, i.e. that
-fno-builtin-foo merely means that gcc stops treating a call of a
function named foo to mean a call to a function implementing the
standard function by that name (and hence allows it to e.g. replace a
memcpy(d, s, 1) by byte load+store). It does not mean to prevent
emitting calls to foo, and I don't think it ever will - it's a bit sad
that clang has chosen to interpret these options differently.

Thinking out load, it would be useful if both compilers grew

  -fassume-provided-std-foo

and

  -fno-assume-provided-std-foo

options to tell the compiler that a function named foo with standard
semantics can be assumed (or not) to be provided by the execution
environment; i.e. one half of what -f(no-)builtin-foo apparently does
for clang currently.

And yes, the positive -fbuiltin-foo would also be quite useful in order
to get the compiler to recognize a few important functions (memcpy,
memcmp) while using -ffreestanding (or just plain -fno-builtin) to tell
it to avoid assuming anything about most std functions - I've worked on
a VxWorks target where snprintf() didn't have the correct "return what
would be written" semantics but rather behaved like the kernel's
non-standard scnprintf(), and who knows what other odd quirks that libc had.

Rasmus
