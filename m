Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 105A618437D
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2020 10:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgCMJOX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Mar 2020 05:14:23 -0400
Received: from foss.arm.com ([217.140.110.172]:50408 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbgCMJOX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Mar 2020 05:14:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F18831B;
        Fri, 13 Mar 2020 02:14:22 -0700 (PDT)
Received: from [10.162.16.120] (a075563-lin.blr.arm.com [10.162.16.120])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7C813F67D;
        Fri, 13 Mar 2020 02:14:18 -0700 (PDT)
Subject: Re: [PATCH v7 15/17] kconfig: Add support for 'as-option'
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        James Morse <james.morse@arm.com>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1584090304-18043-1-git-send-email-amit.kachhap@arm.com>
 <1584090304-18043-16-git-send-email-amit.kachhap@arm.com>
 <CAK7LNATKkdd5RqB-E0_F3WidxmdBZxhjc2g6bkgCxaUu2vO2eA@mail.gmail.com>
From:   Amit Kachhap <amit.kachhap@arm.com>
Message-ID: <ec853788-03f8-6c28-90f2-3daf0a113c6f@arm.com>
Date:   Fri, 13 Mar 2020 14:44:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNATKkdd5RqB-E0_F3WidxmdBZxhjc2g6bkgCxaUu2vO2eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 3/13/20 2:40 PM, Masahiro Yamada wrote:
> Hi Amit,
> 
> On Fri, Mar 13, 2020 at 6:06 PM Amit Daniel Kachhap
> <amit.kachhap@arm.com> wrote:
>>
>> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
>>
>> Currently kconfig does not have a feature that allows to detect if the
>> used assembler supports a specific compilation option.
>>
>> Introduce 'as-option' to serve this purpose in the context of Kconfig:
>>
>>          config X
>>                  def_bool $(as-option,...)
>>
>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Cc: linux-kbuild@vger.kernel.org
> 
> 
> If you have a chance for v8,
> could you please drop these Cc lines?

Ok sure I will remember.

Cheers,
Amit

> 
> I had already given Ack, and am satisfied.
> I have no more comment.
> 
> Thanks.
> 
> 
> 
>> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
>> ---
>>   scripts/Kconfig.include | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
>> index 85334dc..a1c1925 100644
>> --- a/scripts/Kconfig.include
>> +++ b/scripts/Kconfig.include
>> @@ -31,6 +31,12 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /de
>>   # Return y if the linker supports <flag>, n otherwise
>>   ld-option = $(success,$(LD) -v $(1))
>>
>> +# $(as-option,<flag>)
>> +# /dev/zero is used as output instead of /dev/null as some assembler cribs when
>> +# both input and output are same. Also both of them have same write behaviour so
>> +# can be easily substituted.
>> +as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
>> +
>>   # $(as-instr,<instr>)
>>   # Return y if the assembler supports <instr>, n otherwise
>>   as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
>> --
>> 2.7.4
>>
> 
> 
