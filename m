Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DD942CCEF
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Oct 2021 23:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhJMVmT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Oct 2021 17:42:19 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:55982 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229588AbhJMVmT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Oct 2021 17:42:19 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0UrjC5sw_1634161208;
Received: from ashimida.local(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0UrjC5sw_1634161208)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 14 Oct 2021 05:40:11 +0800
Subject: Re: [PATCH] [PATCH V3]ARM64: SCS: Add gcc plugin to support Shadow
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
References: <1634148189-29393-1-git-send-email-ashimida@linux.alibaba.com>
 <CAKwvOd=qxHU41HFEWLAz6DOvSMPdW863E9SKVe0PFK0ePDvizQ@mail.gmail.com>
From:   Dan Li <ashimida@linux.alibaba.com>
Message-ID: <c2d0bfc9-364e-a2a8-e786-7a5102e34ddc@linux.alibaba.com>
Date:   Thu, 14 Oct 2021 05:40:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=qxHU41HFEWLAz6DOvSMPdW863E9SKVe0PFK0ePDvizQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/14/21 2:50 AM, Nick Desaulniers wrote:
> On Wed, Oct 13, 2021 at 11:03 AM Dan Li <ashimida@linux.alibaba.com> wrote:
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 62c3c1d..da2da8c 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -81,7 +81,7 @@ config ARM64
>>          select ARCH_SUPPORTS_DEBUG_PAGEALLOC
>>          select ARCH_SUPPORTS_HUGETLBFS
>>          select ARCH_SUPPORTS_MEMORY_FAILURE
>> -       select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
>> +       select ARCH_SUPPORTS_SHADOW_CALL_STACK if (CC_HAVE_SHADOW_CALL_STACK || GCC_PLUGIN_SHADOW_CALL_STACK)
>>          select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
>>          select ARCH_SUPPORTS_LTO_CLANG_THIN
>>          select ARCH_SUPPORTS_CFI_CLANG
>> @@ -1062,7 +1062,7 @@ config ARCH_HAS_FILTER_PGPROT
>>
>>   # Supported by clang >= 7.0
>>   config CC_HAVE_SHADOW_CALL_STACK
>> -       def_bool $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18)
>> +       def_bool (CC_IS_CLANG && $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18))
> 
> I guess since clang supported SCS since clang-7, but the minimally
> supported version of clang according to
> Documentation/process/changes.rst is 10.0.1, then this could be:
> 
> def_boot CC_IS_CLANG || $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18)
> 
> Then we won't have to touch it again once SCS lands in upstream GCC,
> as the cc-option test will start to pass?
> 
Thanks Nick,

That sounds reasonable.
