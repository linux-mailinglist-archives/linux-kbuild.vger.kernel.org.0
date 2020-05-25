Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3E1E347C
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2020 03:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgE0BLr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Tue, 26 May 2020 21:11:47 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:49788 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727937AbgE0BLq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 21:11:46 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07488;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0TzlIGHx_1590541902;
Received: from 30.27.116.2(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0TzlIGHx_1590541902)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 27 May 2020 09:11:44 +0800
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
From:   changhuaixin <changhuaixin@linux.alibaba.com>
In-Reply-To: <20200522182815.ezanmvbemhzq2fmm@treble>
Date:   Mon, 25 May 2020 11:33:00 +0800
Cc:     changhuaixin <changhuaixin@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
        michal.lkml@markovi.net, mingo@redhat.com, peterz@infradead.org,
        tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com
Content-Transfer-Encoding: 8BIT
Message-Id: <F00701B2-F4AD-48B2-9710-33E4CFA5C5AA@linux.alibaba.com>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
 <20200522182815.ezanmvbemhzq2fmm@treble>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks for your kindly reply. Let me have a check.

> On May 23, 2020, at 2:28 AM, Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> 
> On Wed, Apr 29, 2020 at 02:46:24PM +0800, Huaixin Chang wrote:
>> Move building of fast lookup table from boot to sorttable tool. This saves us
>> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.
>> 
>> Huaixin Chang (2):
>>  scripts/sorttable: Build orc fast lookup table via sorttable tool
>>  x86/unwind/orc: Remove unwind_init() from x86 boot
>> 
>> arch/x86/include/asm/unwind.h |  2 -
>> arch/x86/kernel/setup.c       |  2 -
>> arch/x86/kernel/unwind_orc.c  | 51 ----------------------
>> scripts/sorttable.h           | 99 ++++++++++++++++++++++++++++++++++++++++---
>> 4 files changed, 92 insertions(+), 62 deletions(-)
> 
> I tested this (rebased on tip/master), it seems to break ORC
> completely... e.g. /proc/self/stack is empty.
> 
> -- 
> Josh

