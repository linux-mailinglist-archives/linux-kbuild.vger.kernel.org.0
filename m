Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4CB942FDA8
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Oct 2021 23:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238707AbhJOVyR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Oct 2021 17:54:17 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:60782 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229921AbhJOVyR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Oct 2021 17:54:17 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0UsFO8L2_1634334723;
Received: from ashimida.local(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0UsFO8L2_1634334723)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 16 Oct 2021 05:52:05 +0800
Subject: Re: [PATCH] [PATCH V4]ARM64: SCS: Add gcc plugin to support Shadow
 Call Stack
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        catalin.marinas@arm.com, will@kernel.org, keescook@chromium.org,
        nathan@kernel.org, tglx@linutronix.de, akpm@linux-foundation.org,
        samitolvanen@google.com, frederic@kernel.org, rppt@kernel.org,
        mark.rutland@arm.com, yifeifz2@illinois.edu, rostedt@goodmis.org,
        viresh.kumar@linaro.org, andreyknvl@gmail.com,
        colin.king@canonical.com, ojeda@kernel.org,
        luc.vanoostenryck@gmail.com, elver@google.com,
        nivedita@alum.mit.edu, ardb@kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org, clang-built-linux@googlegroups.com
References: <1634167668-60198-1-git-send-email-ashimida@linux.alibaba.com>
 <CAKwvOdkv70XDdK-k3n4ycFQsz+h7V-sTiH8RuxxaLofp-okweQ@mail.gmail.com>
 <722d9662-e27c-2efb-e8cf-d505b6950475@linux.alibaba.com>
 <CAKwvOdnMvBP-1=YbXTpYOgWqCBy44tUvWdtMXp8p485bYnPYNQ@mail.gmail.com>
From:   Dan Li <ashimida@linux.alibaba.com>
Message-ID: <d1873b11-2aa2-d08c-921c-0a28c4edd33f@linux.alibaba.com>
Date:   Sat, 16 Oct 2021 05:52:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnMvBP-1=YbXTpYOgWqCBy44tUvWdtMXp8p485bYnPYNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/16/21 3:13 AM, Nick Desaulniers wrote:
> On Fri, Oct 15, 2021 at 11:29 AM Dan Li <ashimida@linux.alibaba.com> wrote:
>>
>>
>>
>> On 10/15/21 2:44 AM, Nick Desaulniers wrote:
>>>    On Wed, Oct 13, 2021 at 4:28 PM Dan Li <ashimida@linux.alibaba.com> wrote:
>>>> --- a/include/linux/compiler-gcc.h
>>>> +++ b/include/linux/compiler-gcc.h
>>>> @@ -50,6 +50,10 @@
>>>>    #define __latent_entropy __attribute__((latent_entropy))
>>>>    #endif
>>>>
>>>> +#if defined(SHADOW_CALL_STACK_PLUGIN) && !defined(__CHECKER__)
>>>> +#define __noscs __attribute__((no_shadow_call_stack))
>>>> +#endif
>>>
>>> Cool this is a nice addition, and something I don't think that clang
>>> has.  For any new feature, having a function attribute to disable it
>>> at the function granularity is nice, and plays better with LTO than -f
>>> group flags.  Though that begs the question: what happens if a __noscs
>>> callee is inlined into a non-__noscs caller, or vice versa?
>> Thanks Nick,
>>
>> According to my understanding, all inline optimizations in gcc should
>> happen before inserting scs insns (scs and paciasp/autiasp use the
>> same insertion point). Therefore, the check for the __noscs attribute
>> will also occur after all inlining is completed.
>>
>> As in the following example:
>> - Since __noscs attribute is specified, scs_test1 does not insert scs insns
>> - Since normal functions scs_test2/3 uses x30, it needs to insert scs insns
>> - Since __noscs attribute is specified, scs_test4 after inlining does not
>> need to insert scs insns
>>
>> __always_inline __noscs void scs_test1(void)
>> {
>>       asm volatile("mov x1, x1\n\t":::"x30");
>> }
>>
>> //scs insns inserted after function inline
>> void scs_test2(void)
>> {
>>       scs_test1();
>> }
> 
> That may be surprising to developers.  Perhaps __always_inline on
> scs_test1 is distracting this test case, but I suspect it may not make
> a difference.  This particular issue comes up time and again with
> stack protectors; ie. the callee is marked no stack protector, then
> gets inlined into a caller and suddenly gets a stack protector.
>
Yes.

I haven’t noticed this issue. I just took a quick look at the stack
canary code, and found that the instructions are generated in the
RTL stage like scs/pac (AST => GIMPLE => RTL => asm output), and
the inlining should have been completed before this.

Generally, instructions that are sensitive to assembly order can
only be inserted during RTL, otherwise their order is difficult to
guarantee. I think this may be the reason why the similar problem
always appears.
