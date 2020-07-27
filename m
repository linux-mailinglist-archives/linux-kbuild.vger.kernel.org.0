Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906BA22E3F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jul 2020 04:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgG0CTX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sun, 26 Jul 2020 22:19:23 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:60249 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726763AbgG0CTX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Jul 2020 22:19:23 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0U3sMZnm_1595816358;
Received: from 30.27.116.8(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U3sMZnm_1595816358)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 27 Jul 2020 10:19:19 +0800
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 2/3] scripts/sorttable: Build orc fast lookup table via
 sorttable tool
From:   changhuaixin <changhuaixin@linux.alibaba.com>
In-Reply-To: <20200724135350.GA648324@gmail.com>
Date:   Mon, 27 Jul 2020 10:19:18 +0800
Cc:     changhuaixin <changhuaixin@linux.alibaba.com>, jpoimboe@redhat.com,
        bp@alien8.de, hpa@zytor.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, luto@amacapital.net,
        michal.lkml@markovi.net, mingo@redhat.com,
        Peter Zijlstra <peterz@infradead.org>, tglx@linutronix.de,
        x86@kernel.org, yamada.masahiro@socionext.com
Content-Transfer-Encoding: 8BIT
Message-Id: <912EAD23-412F-482E-8CFF-D99FD01B1915@linux.alibaba.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
 <20200723034643.33537-3-changhuaixin@linux.alibaba.com>
 <20200724135350.GA648324@gmail.com>
To:     Ingo Molnar <mingo@kernel.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Jul 24, 2020, at 9:53 PM, Ingo Molnar <mingo@kernel.org> wrote:
> 
> 
> * Huaixin Chang <changhuaixin@linux.alibaba.com> wrote:
> 
>> Since orc tables are already sorted by sorttable tool, let us move
>> building of fast lookup table into sorttable tool too. This saves us
>> 6380us from boot time under Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz
>> with 64 cores.
> 
> Neat!
> 
>> +struct orc_sort_param {
>> +	size_t		lookup_table_size;
>> +	unsigned int	*orc_lookup_table;
>> +	unsigned long	start_ip;
>> +	size_t		text_size;
>> +	unsigned int	orc_num_entries;
>> +};
> 
>> 
>> +#define LOOKUP_BLOCK_ORDER	8
>> +#define LOOKUP_BLOCK_SIZE	(1 << LOOKUP_BLOCK_ORDER)
>> +
>> +	for (i = 0; i < lookup_num_blocks-1; i++) {
>> +		orc = __orc_find(g_orc_ip_table, g_orc_table,
>> +				 num_entries,
>> +				 lookup_start_ip + (LOOKUP_BLOCK_SIZE * i));
>> +		if (!orc) {
>> +			snprintf(g_err, ERRSTR_MAXSZ,
>> +					"Corrupt .orc_unwind table\n");
>> +			pthread_exit(g_err);
>> +		}
>> +
>> +		orc_lookup[i] = orc - g_orc_table;
>> +	}
>> +
>> +	/* Initialize the ending block: */
>> +	orc = __orc_find(g_orc_ip_table, g_orc_table, num_entries,
>> +			 lookup_stop_ip);
>> +	if (!orc) {
>> +		snprintf(g_err, ERRSTR_MAXSZ, "Corrupt .orc_unwind table\n");
>> +		pthread_exit(g_err);
>> +	}
>> +	orc_lookup[lookup_num_blocks-1] = orc - g_orc_table;
> 
> Yeah, so now this definition of LOOKUP_BLOCK_* basicaly duplicates the 
> arch/x86/include/asm/orc_lookup.h size, with no obvious link between 
> the two. This is asking for trouble.
> 
> <asm/orc_lookup.h> looks simple enough - can we include it in 
> scripts/sorttable.h?
> 
> Or better yet, please move these two defines into <asm/orc_types.h>, 
> which is already included in sorttable.h.
> 
Thanks!
Moving these two into <asm/orc_types.h> and capitalized spelling will be done in the following patches.

Huaixin

> BTW., please update your patches to spell 'ORC' in a capitalized 
> fashion, like most of the existing code does:
> 
>> 	/* create thread to sort ORC unwind tables concurrently */
> 
> Thanks,
> 
> 	Ingo

