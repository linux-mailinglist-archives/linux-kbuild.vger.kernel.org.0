Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDE5F3D8B
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2019 02:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfKHBm7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Nov 2019 20:42:59 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:52339 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbfKHBm6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 20:42:58 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0ThSglxQ_1573177375;
Received: from ali-6c96cfdd1403.local(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0ThSglxQ_1573177375)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Nov 2019 09:42:55 +0800
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
 <20191107152244.GD4114@hirez.programming.kicks-ass.net>
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <85abe498-f241-4752-81b5-6c0314f5a1e8@linux.alibaba.com>
Date:   Fri, 8 Nov 2019 09:42:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107152244.GD4114@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2019/11/7 23:22, Peter Zijlstra wrote:
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
> What is the build-time cost for doing this? The link phase is already a
> fairly big bottleneck for building a kernel.
Hi, Peter, Thanks for your kindly reply!
On my test env, the build-time sort spend about 100ms, which is similar 
to runtime sorting due to the same sorting code. Of course there are few 
compiling cost in sortorctable tool itself. I think the overall cost of 
this build-time sorting is not so much.

I agree with you that the link time of vmlinux shoud be optimized.
But IMHO, for one kernel product release, the kernel building is once 
for all. So put the sorting in build time can save boot time for 
customer, for each booting. I think this is significant for boot time 
sensitive products, such as embedded devices in IoT, or VM in Cloud.
> Can sort{ex,orc}table() be ran concurrently? Do they want to be the same
> (threaded) tool?
I think it is possible to do those sort work concurrently, likes 
deferred memory init which is big boot time speed up.
But I don't know if the exception table and ORC unwind tables can be 
deferred, due to those tables might be used in early boot time, for 
early exception handling and early debugging. I'm not familiar with that.

IMO, the init works in kernel boot time should do the necessary 
runtime-depends initialization, which cannot done out-of-bands. For 
exception, ORC unwind like tables, which does not depends on the runtime 
ENV. It can/should be ready in building time. IOW, this kind of "setup 
cost" should not put on customer.

Thanks again!
