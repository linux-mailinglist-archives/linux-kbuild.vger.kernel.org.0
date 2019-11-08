Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A0CF3D8D
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2019 02:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfKHBnV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Nov 2019 20:43:21 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:39219 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728370AbfKHBnV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 20:43:21 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0ThSTUQ0_1573177398;
Received: from ali-6c96cfdd1403.local(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0ThSTUQ0_1573177398)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Nov 2019 09:43:19 +0800
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
 <20191107154654.jyg24wzqujdtx7zq@treble>
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <280e2634-e808-9177-478b-910b3210a958@linux.alibaba.com>
Date:   Fri, 8 Nov 2019 09:43:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107154654.jyg24wzqujdtx7zq@treble>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2019/11/7 23:46, Josh Poimboeuf wrote:
> On Thu, Nov 07, 2019 at 10:32:01PM +0800, shile.zhang@linux.alibaba.com wrote:
>> From: Shile Zhang <shile.zhang@linux.alibaba.com>
>>
>> Hi,
>>
>> I found the unwind_init taken long time (more than 90ms) in kernel
>> booting, mainly spent on sorting the two ORC unwind tables, orc_unwind
>> and orc_unwind_ip.
>>
>> I also noticed that this issued has reported and discussed last year:
>> https://lkml.org/lkml/2018/10/8/342
>> But seems no final solution until now, I tried to sort the ORC tables at
>> build time, followed the helpful hints from Josh and Ingo in that thread.
>> And mainly referred the implementation of 'sortextable' tool:
>> https://lore.kernel.org/linux-mips/1334872799-14589-1-git-send-email-ddaney.cavm@gmail.com/
>>
>> What I did:
>>
>> - Add a Kconfig to control build-time sorting or runtime sorting;
>> - Referred 'sortextable', create a similar helper tool 'sortorctable',
>>    help to sort the ORC unwind tables at vmlinux link process.
>>
>> One potential improvement is to sort the module ORC tables in future.
>>
>> Thanks!
> Thanks a lot for working on this!
>
> I'd say the new config option isn't needed.  The runtime ORC sorting
> logic is unconditionally bad and the code should just be removed.  I saw
> recently that it's one of the main offenders for boot time latency.
Hi, Josh, Thanks very much for your quickly response!

I'll refactor the code as your advice.
Yes, the run-time sorting cost is bigger for currently Cloud products, 
such as serverless products, which needs boot up ASAP.
>
> I also agree with Peter that we should try to reduce the link-time
> penalty as much as possible.  But it's a necessary evil to a certain
> extent.
>
agree!

Thanks again and looking forwards more advice from you!
