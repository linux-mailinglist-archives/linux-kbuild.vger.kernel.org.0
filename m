Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8721002E9
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 11:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfKRKu2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Nov 2019 05:50:28 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:38202 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726506AbfKRKu2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Nov 2019 05:50:28 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0TiSbQOg_1574074219;
Received: from ali-6c96cfdd1403.local(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0TiSbQOg_1574074219)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 18 Nov 2019 18:50:20 +0800
Subject: Re: [RFC PATCH v3 7/7] x86/unwind/orc: remove run-time ORC unwind
 tables sort
To:     David Laight <David.Laight@ACULAB.COM>,
        'Josh Poimboeuf' <jpoimboe@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-8-shile.zhang@linux.alibaba.com>
 <893d3caf85cd4ed0921fab84cfe28cad@AcuMS.aculab.com>
 <20191115174649.ldif5o7xqo5ntxeo@treble>
 <5fe9024bc69c4a4eb115b3c2f3f9bcd1@AcuMS.aculab.com>
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <c15ef0d0-b4a2-0c8c-8868-2441d09f7891@linux.alibaba.com>
Date:   Mon, 18 Nov 2019 18:50:19 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5fe9024bc69c4a4eb115b3c2f3f9bcd1@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2019/11/18 18:05, David Laight wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
>> Sent: 15 November 2019 17:47
>> On Fri, Nov 15, 2019 at 04:51:24PM +0000, David Laight wrote:
>>> From: Shile Zhang
>>>> Sent: 15 November 2019 06:48
>>> ...
>>>>   arch/x86/kernel/unwind_orc.c | 8 +++++---
>>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
>>>> index 332ae6530fa8..280da6fa9922 100644
>>>> --- a/arch/x86/kernel/unwind_orc.c
>>>> +++ b/arch/x86/kernel/unwind_orc.c
>>>> @@ -273,9 +273,11 @@ void __init unwind_init(void)
>>>>   		return;
>>>>   	}
>>>>
>>>> -	/* Sort the .orc_unwind and .orc_unwind_ip tables: */
>>>> -	sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_cmp,
>>>> -	     orc_sort_swap);
>>>> +	/*
>>>> +	 * Note, orc_unwind and orc_unwind_ip tables has been sorted in
>>>> +	 * vmlinux link phase by sorttable tool at build time.
>>>> +	 * Its ready for binary search now.
>>>> +	 */
>>> How fast is sort() if the table is sorted?
>>> Relying on the kernel sources and build scripts always being in sync seems dangerous.
>>> Probably better to leave the sort in for a release of two.
>> This patch comes after the build script changes, so they'd be in sync.
>> What would the concern be?
> Mostly that if, for any reason, the build script changes are missing nothing
> will detect the error - but the results will be very confusing.
> If the sort is fast for sorted inputs (some algorithms aren't) then leaving
> it in won't take that long.
>
> 	David

Hi, David,

Thanks for your review!
Due to the sort inside kernel is heap-sort, so it cost almost the same 
time for sorted inputs.
I wondered if we can add error handling in the link script, exit with 
error if sort encountered any errors.

Thanks!

> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

