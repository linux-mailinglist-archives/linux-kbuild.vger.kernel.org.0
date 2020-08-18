Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93331248E68
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 21:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgHRTDx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 15:03:53 -0400
Received: from terminus.zytor.com ([198.137.202.136]:36623 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgHRTDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 15:03:53 -0400
Received: from carbon-x1.hos.anvin.org ([IPv6:2601:646:8600:3280:61e8:d401:1991:f3df])
        (authenticated bits=0)
        by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 07IJ2bvX2888434
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Tue, 18 Aug 2020 12:02:38 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 07IJ2bvX2888434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2020072401; t=1597777361;
        bh=cfOAXIuv0d1n/p0ol2GZ1qiMxIvr2XSR2TAgYuI9r3w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=z6FSMv10XGVilhbjjXXiM0AVWKbJ7Fhzt0md6cIgU1Ohsv04ugdthB2lXdOawFp4G
         /yIHdNmPHZoJCDgNTXPnJTtAPUBICrzszid60D+pV/4UicZbTfZbrRU0+BZ8RM9wQ7
         35+zOHMSIK0jpi7uLcUHBcJWVVBeZ5kJHzSii4DCkNNkgF64tjR5yM5SQnJO97g4e0
         TLtVUzXQFjyCrQUlr1DheafRH0JBDtqIMF2aHk+22UqWXF1TCLjag5KLD7muJd8VV/
         HrTaRZAfyaXM5tK2841JwFpFsQImabhN3BWsuyiGhtf+WNri0flORDI4/EZYE6HGwH
         89XyyKW8H1m/w==
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
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
        Arvind Sankar <nivedita@alum.mit.edu>,
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
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com>
 <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
From:   "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
Date:   Tue, 18 Aug 2020 12:02:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-08-18 10:56, Nick Desaulniers wrote:
>>
>> The problem here is twofold:
>>
>> 1. The user would be expected to know what kind of the optimizations the
>> compiler can do on what function, which is private knowledge to the
>> compiler.
>>
>> 2. The only way to override -fno-builtin is by a header file with macros
>> overriding the function names with __builtin, but that doesn't tell the
>> compiler proper anything about the execution environment.
>>
>> So the Right Thing is for the compiler authors to change the way
>> -ffreestanding works.
> 
> Sir, this is an Arby's
> 
> There are things all across the compilation landscape that make we
> want to pontificate or even throw a tantrum in an Arby's.  Would I?
> Well, no, I'm just trying to flip burgers or shovel the elephant
> sh...or w/e they do at Arby's (I've never actually been; I detest
> roast beef).
> 
> Would it be interesting to have a way of opting in, as you describe,
> such that your compiler knew exactly what kind of embedded environment
> it was targeting?  Maybe, but I'd argue that opting out is just the
> other side of the same coin. Heads, I win; tails, you lose. That the
> opt in or opt out list is shorter for a given project is not
> particularly interesting.  Should we change the semantics of a fairly
> commonly used compiler flag that multiple toolchains are in agreement
> of, then fix all of the breakage in all of the code that relied on
> those semantics?  I'm afraid that ship may have already
> sailed...probably 20 or 30 years ago.
> 
>> -ffreestanding means, by definition, that there
>> are no library calls (other than libgcc or whatever else is supplied
>> with the compiler) that the compiler can call. That is currently an
>> all-or-nothing choice, or at least one choice per C standard implemented.
> 
> Yes?
> 

I'm not saying "change the semantics", nor am I saying that playing
whack-a-mole *for a limited time* is unreasonable. But I would like to go back
to the compiler authors and get them to implement such a #pragma: "this
freestanding implementation *does* support *this specific library function*,
and you are free to call it." The only way we can get what we really need from
the compilers is by speaking up and requesting it, and we have done so very
successfully recently; further back we tended to get a lot of
language-lawyering, but these days both the gcc and the clang teams have been
wonderfully responsive.

	-hpa

