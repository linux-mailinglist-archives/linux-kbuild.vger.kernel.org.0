Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C07142FAFD
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Oct 2021 20:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242628AbhJOSbP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Oct 2021 14:31:15 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:49966 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242604AbhJOSbM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Oct 2021 14:31:12 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0UsDzA4._1634322537;
Received: from ashimida.local(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0UsDzA4._1634322537)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 16 Oct 2021 02:29:01 +0800
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
From:   Dan Li <ashimida@linux.alibaba.com>
Message-ID: <722d9662-e27c-2efb-e8cf-d505b6950475@linux.alibaba.com>
Date:   Sat, 16 Oct 2021 02:28:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkv70XDdK-k3n4ycFQsz+h7V-sTiH8RuxxaLofp-okweQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/15/21 2:44 AM, Nick Desaulniers wrote:
>   On Wed, Oct 13, 2021 at 4:28 PM Dan Li <ashimida@linux.alibaba.com> wrote:
>> --- a/include/linux/compiler-gcc.h
>> +++ b/include/linux/compiler-gcc.h
>> @@ -50,6 +50,10 @@
>>   #define __latent_entropy __attribute__((latent_entropy))
>>   #endif
>>
>> +#if defined(SHADOW_CALL_STACK_PLUGIN) && !defined(__CHECKER__)
>> +#define __noscs __attribute__((no_shadow_call_stack))
>> +#endif
> 
> Cool this is a nice addition, and something I don't think that clang
> has.  For any new feature, having a function attribute to disable it
> at the function granularity is nice, and plays better with LTO than -f
> group flags.  Though that begs the question: what happens if a __noscs
> callee is inlined into a non-__noscs caller, or vice versa?
Thanks Nick,

According to my understanding, all inline optimizations in gcc should
happen before inserting scs insns (scs and paciasp/autiasp use the
same insertion point). Therefore, the check for the __noscs attribute
will also occur after all inlining is completed.

As in the following example:
- Since __noscs attribute is specified, scs_test1 does not insert scs insns
- Since normal functions scs_test2/3 uses x30, it needs to insert scs insns
- Since __noscs attribute is specified, scs_test4 after inlining does not
need to insert scs insns

__always_inline __noscs void scs_test1(void)
{
     asm volatile("mov x1, x1\n\t":::"x30");
}

//scs insns inserted after function inline
void scs_test2(void)
{
     scs_test1();
}

__always_inline void scs_test3(void)
{
     asm volatile("mov x3, x3\n\t":::"x30");
}

//no scs insns inserted
__noscs void scs_test4(void)
{
     scs_test3();
}

ffff800010012900 <scs_test1>:
ffff800010012900:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
ffff800010012904:       910003fd        mov     x29, sp
ffff800010012908:       aa0103e1        mov     x1, x1
ffff80001001290c:       a8c17bfd        ldp     x29, x30, [sp], #16
ffff800010012910:       d65f03c0        ret

ffff800010012914 <scs_test2>:
ffff800010012914:       f800865e        str     x30, [x18], #8
ffff800010012918:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
ffff80001001291c:       910003fd        mov     x29, sp
ffff800010012920:       aa0103e1        mov     x1, x1
ffff800010012924:       a8c17bfd        ldp     x29, x30, [sp], #16
ffff800010012928:       f85f8e5e        ldr     x30, [x18, #-8]!
ffff80001001292c:       d65f03c0        ret

ffff800010012930 <scs_test3>:
ffff800010012930:       f800865e        str     x30, [x18], #8
ffff800010012934:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
ffff800010012938:       910003fd        mov     x29, sp
ffff80001001293c:       aa0303e3        mov     x3, x3
ffff800010012940:       a8c17bfd        ldp     x29, x30, [sp], #16
ffff800010012944:       f85f8e5e        ldr     x30, [x18, #-8]!
ffff800010012948:       d65f03c0        ret
ffff80001001294c:       d503201f        nop

ffff800010012950 <scs_test4>:
ffff800010012950:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
ffff800010012954:       910003fd        mov     x29, sp
ffff800010012958:       aa0303e3        mov     x3, x3
ffff80001001295c:       a8c17bfd        ldp     x29, x30, [sp], #16
ffff800010012960:       d65f03c0        ret
> I noticed that __noscs isn't actually applied anywhere in the kernel,
> yet, at least in this series.  Were there any places necessary that
> you've found thus far?
At present, I have not found a function that must use the __noscs
attribute in the kernel. I have only used this attribute in test cases.

> Overall, I'm happy with the patch and am ready to ack it, but I would
> like to see a link to to the upstream GCC feature request for SCS (and
> one created if it doesn't exist) cited explicitly in the commit
> message.  I think that would be a good demonstration that this can or
> will be upstreamed into the compiler proper for the compiler vendors
> to maintain, rather than the kernel folks.  The compiler vendors may
> have further feedback on the approach, such as my question above
> pertaining to inlining.
>
I have submitted a feature request to the gcc community, and waiting
for a follow-up response.

Is it fine to add the following description in [PATCH V5]?

A similar feature request has also been sent to gcc.
link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102768
