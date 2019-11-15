Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAFB9FD991
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 10:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfKOJnz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 04:43:55 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:34080 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727355AbfKOJny (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 04:43:54 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01422;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0Ti8RdaY_1573811029;
Received: from ali-6c96cfdd1403.local(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0Ti8RdaY_1573811029)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 15 Nov 2019 17:43:51 +0800
Subject: Re: [RFC PATCH v3 6/7] scripts/sorttable: Add ORC unwind tables sort
 concurrently
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
 <20191115090723.GS4114@hirez.programming.kicks-ass.net>
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <9594afbc-52bc-5ae7-4a19-8fc4b36a1abd@linux.alibaba.com>
Date:   Fri, 15 Nov 2019 17:43:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115090723.GS4114@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2019/11/15 17:07, Peter Zijlstra wrote:
> On Fri, Nov 15, 2019 at 02:47:49PM +0800, Shile Zhang wrote:
>
>> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
>> +/* ORC unwinder only support X86_64 */
>> +#include <errno.h>
>> +#include <pthread.h>
>> +#include <linux/types.h>
>> +
>> +#define ORC_REG_UNDEFINED	0
>> +#define ERRSTRING_MAXSZ		256
>> +
>> +struct orc_entry {
>> +	s16		sp_offset;
>> +	s16		bp_offset;
>> +	unsigned	sp_reg:4;
>> +	unsigned	bp_reg:4;
>> +	unsigned	type:2;
>> +	unsigned	end:1;
>> +} __attribute__((packed));
>> +
>> +struct orctable_info {
>> +	size_t	orc_size;
>> +	size_t	orc_ip_size;
>> +} orctable;
> There's ./arch/x86/include/asm/orc_types.h for this. Please don't
> duplicate. objtool uses that same header.
Good catch! Thanks for your kindly reminder! I'll remove it.
>> +/**
>> + * sort - sort an array of elements
>> + * @base: pointer to data to sort
>> + * @num: number of elements
>> + * @size: size of each element
>> + * @cmp_func: pointer to comparison function
>> + * @swap_func: pointer to swap function
>> + *
>> + * This function does a heapsort on the given array. You may provide a
>> + * swap_func function optimized to your element type.
>> + *
>> + * Sorting time is O(n log n) both on average and worst-case. While
>> + * qsort is about 20% faster on average, it suffers from exploitable
>> + * O(n*n) worst-case behavior and extra memory requirements that make
>> + * it less suitable for kernel use.
>> + *
>> + * This code token out of /lib/sort.c.
>> + */
>> +static void sort(void *base, size_t num, size_t size,
>> +	  int (*cmp_func)(const void *, const void *),
>> +	  void (*swap_func)(void *, void *, int size))
>> +{
>> +	/* pre-scale counters for performance */
>> +	int i = (num/2 - 1) * size, n = num * size, c, r;
>> +
>> +	/* heapify */
>> +	for ( ; i >= 0; i -= size) {
>> +		for (r = i; r * 2 + size < n; r  = c) {
>> +			c = r * 2 + size;
>> +			if (c < n - size &&
>> +					cmp_func(base + c, base + c + size) < 0)
>> +				c += size;
>> +			if (cmp_func(base + r, base + c) >= 0)
>> +				break;
>> +			swap_func(base + r, base + c, size);
>> +		}
>> +	}
>> +
>> +	/* sort */
>> +	for (i = n - size; i > 0; i -= size) {
>> +		swap_func(base, base + i, size);
>> +		for (r = 0; r * 2 + size < i; r = c) {
>> +			c = r * 2 + size;
>> +			if (c < i - size &&
>> +					cmp_func(base + c, base + c + size) < 0)
>> +				c += size;
>> +			if (cmp_func(base + r, base + c) >= 0)
>> +				break;
>> +			swap_func(base + r, base + c, size);
>> +		}
>> +	}
>> +}
> Do we really need to copy the heapsort implementation? That is, why not
> use libc's qsort() ? This is userspace after all.

Yes, I think qsort is better choice than copy-paste here. But qsort does 
not support customized swap func, which is needed for ORC unwind swap 
two tables together.
I think it's hard to do with qsort, so I used sort same with original 
orc unwind table sort.

