Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968BD4364BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 16:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhJUOvr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 10:51:47 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:48616 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231522AbhJUOvq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 10:51:46 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0UtAB4.e_1634827764;
Received: from ashimida.local(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0UtAB4.e_1634827764)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 21 Oct 2021 22:49:25 +0800
Subject: Re: [PATCH] [PATCH V5]ARM64: SCS: Add gcc plugin to support Shadow
 Call Stack
To:     Kees Cook <keescook@chromium.org>
Cc:     Qing Zhao <qing.zhao@oracle.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Ard Biesheuvel <ardb@kernel.org>, masahiroy@kernel.org,
        michal.lkml@markovi.net, catalin.marinas@arm.com, will@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, tglx@linutronix.de,
        akpm@linux-foundation.org, frederic@kernel.org, rppt@kernel.org,
        mark.rutland@arm.com, yifeifz2@illinois.edu, rostedt@goodmis.org,
        viresh.kumar@linaro.org, andreyknvl@gmail.com,
        colin.king@canonical.com, ojeda@kernel.org,
        luc.vanoostenryck@gmail.com, elver@google.com,
        nivedita@alum.mit.edu, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org, clang-built-linux@googlegroups.com
References: <1634337180-92127-1-git-send-email-ashimida@linux.alibaba.com>
 <202110191006.68BB660@keescook>
From:   Dan Li <ashimida@linux.alibaba.com>
Message-ID: <a8d3fbb8-916a-13db-fc60-4ed7881d2bdb@linux.alibaba.com>
Date:   Thu, 21 Oct 2021 22:49:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <202110191006.68BB660@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/20/21 5:40 AM, Kees Cook wrote:
> On Sat, Oct 16, 2021 at 06:33:00AM +0800, Dan Li wrote:
>> This patch supports gcc-based SCS protection on ARM64 by adding a plugin.
>>
>> For each function that x30 will be pushed onto the stack during execution,
>> this plugin, similar to gcc's pac implementation, will normally:
>> 1) insert "str x30, [x18], #8" at the beginning of function's prologue
>> 2) insert "ldr x30, [x18, #-8]!" immediately before function's
>> epilogue return/sibling calls
>>
>> If pac is enabled, scs push/pop will be inserted between paciasp/autiasp.
>>
>> At present, this patch has been successfully compiled in the following
>> gcc versions based on defconfig with kernel 5.14 and startup normally
>> with commands:
>>
>> make ARCH=arm64 defconfig
>> ./scripts/config -e CONFIG_GCC_PLUGINS -e CONFIG_SHADOW_CALL_STACK \
>> -e CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK
>> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>>
>> Tested gcc version:
>> * 6.3.1
>> * 7.3.1
>> * 7.5.0
>> * 8.2.1
>> * 9.2.0
>> * 10.3.1
>>
>> A similar feature request has also been sent to gcc.
>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102768
>>
>> Signed-off-by: Dan Li <ashimida@linux.alibaba.com>
>> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> This is very cool; thanks for working on this! I am, however, struggling
> with a few overlapping issues that touch this area of functionality.
> I'll try to give you some background on my thoughts here...
> 
> For a while now, it's been made clear that Linus isn't a fan[1] of the
> gcc-plugins (and Masahiro hasn't been too happy either, as the plugins
> complicate[2] things for the build infrastructure). However, it's been
> pretty important for proving out various compiler-provided security
> defenses. I view them as being in one of three states:
> 
> 1) stuff that isn't available in either compiler
> 	- e.g. structure randomization
> 	- e.g. per-task canaries on arm32
> 2) stuff that is in Clang but stalled/unlikely in GCC
> 	- e.g. stack initialization
> 3) deprecated
> 
> State 1 hasn't changed much really, and serves as a good "try out this
> idea and see if people want it", as a jumping-off point for actually
> getting the feature into GCC and Clang proper.
> 
> State 2 is what happens with something from State 1 gets implemented in
> Clang but not GCC. (i.e. Clang upstream has been convinced of the
> utility of a given feature, which should help with upstreaming it to
> GCC.)
> 
> State 3 is what happens when the feature exists in GCC, but not in all GCC
> versions supported by the kernel. It makes a plugin follow the kernel's
> GCC deprecation schedule.
> 
> Notably, since we don't have Clang plugins, there's no corresponding
> "State 2" for where something is in GCC but not Clang, but we can still
> enable it under Clang builds.
> 
> Anyway, this is a long way to say that I don't think I want to add
> a new gcc-plugin when it is at "State 2" (i.e. Clang has support but
> GCC doesn't.) There's no need to "prove" that the compiler feature is
> generally desirable, so it's best to get this into GCC directly.
> 
Thank for your sharing kees,

I learned the history of discussions about plugins, and also just saw
your latest patch[1].

It sounds reasonable that the kernel should not rely on GCC plugins as
much as possible, and it's better to submit such features to GCC first.

But we often face the problem of low compiler version in practice. Those
who really care about security should choose to switch to the appropriate
version, but it may not always be easy for security guys to push compiler
guys or customers to make changes. It's even more annoying when this
happens frequently. Providing plugins for lower versions of GCC will make
such things easier.

At the same time, it sounds more reasonable to dynamically select pac/scs
for SCS, but there are also gcc <7 versions that may need to be supported.
Another case is forward edge KCFI, I'm not sure if there are other ways to
support low version gcc besides plugins (please let me know if so)

So what I want to say is, after both GCC and CLANG support a feature
(in "State 3"), could it be allowed to support for this feature
in lower versions of gcc through a plugin?

[1]https://lore.kernel.org/all/20211020173554.38122-1-keescook@chromium.org/

> On top of this, there is the interaction between SCS and PAC, in the
> sense that the kernel will need to be able to dynamically select between
> SCS and PAC (likely via the "alternatives" infrastructure), and that
> needs work for Clang too, so it'd be a good time to coordinate this with
> GCC. (Sami and Ard have been working[3] on this, though I realize I don't
> think there was a specific bug for it, so I've opened one now[4]).
>
I'm not sure, maybe it's a stupid question ...

Do SCS and PAC have to choose one or the other? Although the two are
similar in theory, they can be implemented without conflict. If they are
turned on at the same time, it may usually makes the attacker think about
one more step.

In the case that both can be supported at the same time, is it better to
let the user decide whether to open at the same time?

> So, I think the best way forward with this would be to implement this as
> a feature in GCC directly, and to see if there's some way to coordinate
> work with Sami, Ard, Qing, and other folks who look into this.
> 
> -Kees
> 
> [1] https://lore.kernel.org/lkml/202103031334.8D898CA@keescook/
> [2] https://lore.kernel.org/lkml/20200729031537.37926-1-masahiroy@kernel.org/
> [3] https://lore.kernel.org/all/20211013152243.2216899-1-ardb@kernel.org/
> [4] https://github.com/KSPP/linux/issues/168
> 
>> 2.7.4
>>
>> -- 
>> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/1634337180-92127-1-git-send-email-ashimida%40linux.alibaba.com.
> 
