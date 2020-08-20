Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD10024C7DC
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 00:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgHTWmx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 18:42:53 -0400
Received: from terminus.zytor.com ([198.137.202.136]:38161 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728477AbgHTWmx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 18:42:53 -0400
Received: from hanvin-mobl2.amr.corp.intel.com ([134.134.139.76])
        (authenticated bits=0)
        by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 07KMfYf0053672
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Thu, 20 Aug 2020 15:41:34 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 07KMfYf0053672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2020072401; t=1597963300;
        bh=s4KiY6IVPnssifxLe3ApzH+AtYKkZ/XrfXH15ucZ9e0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IAMNJsQo4KkZCk6UDBgAsJFK1T4nqrdipQ0KSG2bi5XlLefzOFyNzJfd6JBp/Eqnj
         VHbE4iAUQMWz5ocgQpUMbWJZ48TsXSpcvRbzTndwkfz78DBqhhQshfKmOQgTqfl/Wj
         RBrRX6RLrQLFcyq+62UQqNTl5iqXyJkx64mYyx75plbxBnh30PzkIKu+Mutd3qUOT0
         A4ujtEmGkcsIjEOIH+UIsRNZ+WEbjtLf8z10eiI1dZo9znixEIR6kWCNqNX8JEo+kL
         Mat2a2XlApq5aNd3GFkvQ74Yb62mM52q5ryXOb1H145zrd8cWYB0dPr/gIaowZMVMU
         Kmllk8PLEm/fA==
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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
From:   "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <edd38955-dad1-ca6c-d783-6cb529d8dd3a@zytor.com>
Date:   Thu, 20 Aug 2020 15:41:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-08-18 13:58, Nick Desaulniers wrote:
> On Tue, Aug 18, 2020 at 1:27 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> On Tue, Aug 18, 2020 at 1:24 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>>>
>>> On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
>>>> On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
>>>>>
>>>>> I'm not saying "change the semantics", nor am I saying that playing
>>>>> whack-a-mole *for a limited time* is unreasonable. But I would like to go back
>>>>> to the compiler authors and get them to implement such a #pragma: "this
>>>>> freestanding implementation *does* support *this specific library function*,
>>>>> and you are free to call it."
>>>>
>>>> I'd much rather just see the library functions as builtins that always
>>>> do the right thing (with the fallback being "just call the standard
>>>> function").
>>>>
>>>> IOW, there's nothing wrong with -ffreestanding if you then also have
>>>> __builtin_memcpy() etc, and they do the sane compiler optimizations
>>>> for memcpy().
>>>>
>>>> What we want to avoid is the compiler making *assumptions* based on
>>>> standard names, because we may implement some of those things
>>>> differently.
>>>>
>>>
>>> -ffreestanding as it stands today does have __builtin_memcpy and
>>> friends. But you need to then use #define memcpy __builtin_memcpy etc,
>>> which is messy and also doesn't fully express what you want. #pragma, or
>>> even just allowing -fbuiltin-foo options would be useful.
> 
> I do really like the idea of -fbuiltin-foo.  For example, you'd specify:
> 
> -ffreestanding -fbuiltin-bcmp
> 
> as an example. `-ffreestanding` would opt you out of ALL libcall
> optimizations, `-fbuiltin-bcmp` would then opt you back in to
> transforms that produce bcmp.  That way you're informing the compiler
> more precisely about the environment you'd be targeting.  It feels
> symmetric to existing `-fno-` flags (clang makes -f vs -fno- pretty
> easy when there is such symmetry).  And it's already convention that
> if you specify multiple conflicting compiler flags, then the latter
> one specified "wins."  In that sense, turning back on specific
> libcalls after disabling the rest looks more ergonomic to me.
> 
> Maybe Eli or David have thoughts on why that may or may not be as
> ergonomic or possible to implement as I imagine?
> 

I would prefer this to be a #pragma for a header file, rather than
having a very long command line for everything...

	-hpa

