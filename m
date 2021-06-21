Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8003AF741
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 23:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhFUVRc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 17:17:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:39278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229890AbhFUVRb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 17:17:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62E2461289;
        Mon, 21 Jun 2021 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624310117;
        bh=U5Bhyw3k2w/90/PV75ok+gwj74xzLg8U5NTESRlLO5Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=tfG4rh812mT59Jn9piHbUJKC1FWaDJiwHXfCCwk6g9u5pU+ezXMvK9fw910WW1hz/
         0ifFcO1lw8AuSHUZepA0DZJsC6Oo4lpX89esEiHPHKvr5rg05u7YZz/3O5/Woi6wn+
         404d7I5tlTrK6dpEMmqN/os6eVVlL3Riv9ERuWMI/4KlxYsd9ZPLZd/i9Wml45hEfJ
         GuhYic5GpZ5ARh1lvbVrgDfyGEjJwTJ2phtqrk7uOwbXgTXj/1J9EAaTb8JO3x7wMg
         AU6D3KN8NowFuOsMP6FUmnYojdP65QIJ7XcJlDpIoUnYt7e03NFGwiFEd6CWTixLM1
         lA5qe/YjK8czg==
Subject: Re: [PATCH 2/2] Kconfig: CC_HAS_NO_PROFILE_FN_ATTR, depend on for
 GCOV and PGO
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Martin Liska <mliska@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        linux-toolchains@vger.kernel.org, Marco Elver <elver@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>
References: <20210618233023.1360185-1-ndesaulniers@google.com>
 <20210618233023.1360185-3-ndesaulniers@google.com>
 <CANpmjNNK-iYXucjz7Degh1kJPF_Z_=8+2vNLtUW17x0UnfgtPg@mail.gmail.com>
 <CAKwvOdmxGt6nAj+dDZEPdQtXNbYb8N6y3XwoCvCD+Qazskh7zw@mail.gmail.com>
 <CAGG=3QXeAxaf0AhKsg8P1-j2uHOoXne2KCOCEhq9SKa-e2dnag@mail.gmail.com>
 <CAKwvOd=9oAGPeuQmWnAMOxZn2ii_CRmyWnheoyXGcd09-U_CwA@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <c9308265-5822-5097-f2e7-030045c94463@kernel.org>
Date:   Mon, 21 Jun 2021 14:15:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=9oAGPeuQmWnAMOxZn2ii_CRmyWnheoyXGcd09-U_CwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/21/2021 1:43 PM, Nick Desaulniers wrote:
> On Mon, Jun 21, 2021 at 11:50 AM Bill Wendling <morbo@google.com> wrote:
>>
>> On Mon, Jun 21, 2021 at 11:22 AM Nick Desaulniers
>> <ndesaulniers@google.com> wrote:
>>>
>>> On Fri, Jun 18, 2021 at 11:23 PM Marco Elver <elver@google.com> wrote:
>>>>
>>>> On Sat, 19 Jun 2021 at 01:30, Nick Desaulniers <ndesaulniers@google.com> wrote:
>>>>>
>>>>> We don't want compiler instrumentation to touch noinstr functions, which
>>>>> are annotated with the no_profile function attribute. Add a Kconfig test
>>>>> for this and make PGO and GCOV depend on it.
>>>>>
>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>>>> Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
>>>>> Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
>>>>> Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
>>>>> Suggested-by: Peter Zijlstra <peterz@infradead.org>
>>>>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>>>>> ---
>>>>>   init/Kconfig        | 3 +++
>>>>>   kernel/gcov/Kconfig | 1 +
>>>>>   kernel/pgo/Kconfig  | 3 ++-
>>>>>   3 files changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/init/Kconfig b/init/Kconfig
>>>>> index 1ea12c64e4c9..540f862b40c6 100644
>>>>> --- a/init/Kconfig
>>>>> +++ b/init/Kconfig
>>>>> @@ -83,6 +83,9 @@ config TOOLS_SUPPORT_RELR
>>>>>   config CC_HAS_ASM_INLINE
>>>>>          def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
>>>>>
>>>>> +config CC_HAS_NO_PROFILE_FN_ATTR
>>>>> +       def_bool $(success,echo '__attribute__((no_profile)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
>>>>> +
>>>>>   config CONSTRUCTORS
>>>>>          bool
>>>>>
>>>>> diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
>>>>> index 58f87a3092f3..19facd4289cd 100644
>>>>> --- a/kernel/gcov/Kconfig
>>>>> +++ b/kernel/gcov/Kconfig
>>>>> @@ -5,6 +5,7 @@ config GCOV_KERNEL
>>>>>          bool "Enable gcov-based kernel profiling"
>>>>>          depends on DEBUG_FS
>>>>>          depends on !CC_IS_CLANG || CLANG_VERSION >= 110000
>>>>> +       depends on !X86 || (X86 && CC_HAS_NO_PROFILE_FN_ATTR)
>>>>
>>>> [+Cc Mark]
>>>>
>>>> arm64 is also starting to rely on noinstr working properly.
>>>
>>> Sure,
>>> Will, Catalin, other arm64 folks:
>>> Any thoughts on requiring GCC 7.1+/Clang 13.0+ for GCOV support?  That
>>> way we can better guarantee that GCOV (and eventually, PGO) don't
>>> touch noinstr functions?
>>>
>>> If that's ok, I'll add modify the above like:
>>>
>>> + depends on !ARM64 || (ARM64 && CC_HAS_NO_PROFILE_FN_ATTR)
>>>
>> Wouldn't "!ARM64 || CC_HAS_NO_PROFILE_FN_ATTR" be more succinct?
> 
> We need to be able to express via Kconfig "GCOV should not be enabled
> for architectures that use noinstr when the toolchain does not support
> __attribute__((no_profile_instrument_function))."
> 
> Where "architectures that use noinstr" are currently arm64, s390, and
> x86.  So I guess we could do:
> 
> + depends on !ARM64 || !S390 || !X86 || CC_HAS_NO_PROFILE_FN_ATTR
> 
> (We could add a Kconfig for ARCH_WANTS_NO_INSTR, which might be more
> informative than listed out architectures which might be non-obvious
> to passers-by).

I agree that spelling this out might be nicer for the future, in case 
instances like this crop up again. ARCH_REQUIRES_NO_INSTR might be a 
better wording?

> It would be most succinct to raise the requirements to: "GCOV should
> not be enabled when the toolchain does not support
> __attribute__((no_profile_instrument_function))." Then we could do:
> 
> + depends on CC_HAS_NO_PROFILE_FN_ATTR

Then this could become

depends on !ARCH_REQUIRES_NO_INSTR || (ARCH_REQUIRES_NO_INSTR && 
CC_HAS_NO_PROFILE_FN_ATTR)

(sorry for the potential wrap).

Cheers,
Nathan

> Assuming no one has the requirement to support GCOV on PPC with GCC <
> 7.1, for example.
> 
>>
>>> to the above hunk in v2.  Oh, looks like arch/s390 also uses noinstr.
>>> Same question applies then:
>>>
>>> + depends on !S390 || (S390 && CC_HAS_NO_PROFILE_FN_ATTR)
>>>
>>> Or, we could just do
>>>
>>> + depends on CC_HAS_NO_PROFILE_FN_ATTR
>>>
>>> Though that will penalize architectures not using noinstr, that still
>>> would like to use GCOV with versions of GCC older than 7.1.  Perhaps
>>> there are no such such users, or they should consider upgrading their
>>> tools to we can stick with the simpler Kconfig? Thoughts?
>>>
>>>>
>>>> This should probably be a 'select ARCH_HAS_GCOV_PROFILE_ALL if
>>>> CC_HAS_NO_PROFILE_FN_ATTR' in the relevant arch/../Kconfig.
>>>>
>>>> Alternatively, using:
>>>> https://lkml.kernel.org/r/YMcssV/n5IBGv4f0@hirez.programming.kicks-ass.net
>>>>
>>>> But I'd probably not overcomplicate things at this point and just use
>>>> ARCH_HAS_GCOV_PROFILE_ALL, because GCOV seems to be a) rarely used,
>>>> and b) if someone decides to selectively instrument stuff like entry
>>>> code, we can just say it's user error.
>>>>
>>>>
>>>>>          select CONSTRUCTORS
>>>>>          default n
>>>>>          help
>>>>> diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
>>>>> index d2053df1111c..26f75ac4c6c1 100644
>>>>> --- a/kernel/pgo/Kconfig
>>>>> +++ b/kernel/pgo/Kconfig
>>>>> @@ -8,7 +8,8 @@ config PGO_CLANG
>>>>>          bool "Enable clang's PGO-based kernel profiling"
>>>>>          depends on DEBUG_FS
>>>>>          depends on ARCH_SUPPORTS_PGO_CLANG
>>>>> -       depends on CC_IS_CLANG && CLANG_VERSION >= 120000
>>>>> +       depends on CC_IS_CLANG
>>>>> +       depends on CC_HAS_NO_PROFILE_FN_ATTR
>>>>>          help
>>>>>            This option enables clang's PGO (Profile Guided Optimization) based
>>>>>            code profiling to better optimize the kernel.
>>>>> --
>>>>> 2.32.0.288.g62a8d224e6-goog
>>>>>
>>>
>>>
>>>
>>> --
>>> Thanks,
>>> ~Nick Desaulniers
> 
> 
> 
