Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D42FDFFCFA
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 02:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfKRB5P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Nov 2019 20:57:15 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:36157 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726168AbfKRB5O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Nov 2019 20:57:14 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0TiLzX7N_1574042230;
Received: from ali-6c96cfdd1403.local(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0TiLzX7N_1574042230)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 18 Nov 2019 09:57:11 +0800
Subject: Re: [RFC PATCH v4 0/7] Speed booting by sorting ORC unwind tables at
 build time
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
 <20191115175224.ozuiei2vlfvynok5@treble>
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <39ff8865-8fef-6220-e024-293ee4fadf65@linux.alibaba.com>
Date:   Mon, 18 Nov 2019 09:57:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115175224.ozuiei2vlfvynok5@treble>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2019/11/16 01:52, Josh Poimboeuf wrote:
> On Sat, Nov 16, 2019 at 12:45:32AM +0800, Shile Zhang wrote:
>> Hi,
>>
>> I refactored the code, followed by Peter's suggestions in v3, thank you!
>> Any suggestions and comments are welcome!
>>
>> Thanks!
>>
>> Changelog:
>> ==========
>> v3->v4:
>> - Code refactored for Peter's review findings and suggestions.
> Hi Shile,
>
> I haven't given it a proper review yet, but one minor suggestion.  In
> general it's good practice to wait at least a few business days before
> posting a new version of a patch set.  That way it gives people time to
> review, and it also helps to avoid flooding people's inboxes.
>

Hi, Josh,

Thank you very much for your kindly reminder!
I got it and very sorry for that flooding.

Best regards!

--- Shile

