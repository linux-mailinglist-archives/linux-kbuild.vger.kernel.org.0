Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D14A20CBB2
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2020 04:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgF2COH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sun, 28 Jun 2020 22:14:07 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:50419 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726404AbgF2COH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 22:14:07 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07484;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0U0xryp7_1593396842;
Received: from 30.27.116.9(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U0xryp7_1593396842)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 29 Jun 2020 10:14:03 +0800
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v3 0/3] Build ORC fast lookup table in scripts/sorttable
 tool
From:   changhuaixin <changhuaixin@linux.alibaba.com>
In-Reply-To: <20200603143945.64248-1-changhuaixin@linux.alibaba.com>
Date:   Mon, 29 Jun 2020 10:14:01 +0800
Cc:     changhuaixin <changhuaixin@linux.alibaba.com>, bp@alien8.de,
        hpa@zytor.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, luto@amacapital.net,
        michal.lkml@markovi.net, mingo@redhat.com,
        Peter Zijlstra <peterz@infradead.org>, tglx@linutronix.de,
        x86@kernel.org, yamada.masahiro@socionext.com
Content-Transfer-Encoding: 8BIT
Message-Id: <217C22B3-D08F-4CB9-BC8D-3645C8389F5D@linux.alibaba.com>
References: <20200601173840.3f36m6l4fsu5bill@treble>
 <20200603143945.64248-1-changhuaixin@linux.alibaba.com>
To:     jpoimboe@redhat.com
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Josh, will you please have a look at this patchset?

There might be another way to set SHT_PROGBITS of section .orc_lookup by writing section headers when orc_unwind and orc_unwind_ip tables are writen. It might be as follows:

diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index 3f98dcfbc177..860d4dcec8e6 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -183,6 +183,10 @@ int create_orc_sections(struct objtool_file *file)
        u_sec = elf_create_section(file->elf, ".orc_unwind",
                                   sizeof(struct orc_entry), idx);

+       /* make flags of section orc_lookup right */
+       if (!elf_create_section(file->elf, ".orc_lookup", sizeof(int), 0))
+               return -1;
+

What do you think about this way of setting SHT_PROGBITS?

> On Jun 3, 2020, at 10:39 PM, Huaixin Chang <changhuaixin@linux.alibaba.com> wrote:
> 
> Move building of fast lookup table from boot to sorttable tool. This saves us
> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores. It
> adds a little more than 7ms to boot time when testing on the same CPU.
> 
> Changelog v3:
> 1. Modify annotation of unwind_init().
> 
> Changelog v2:
> 1. Type of section orc_lookup needs to be SHT_PROGBITS.
> 2. unwind_init() cannot be removed totally as setting lookup_num_blocks is needed.
> 
> Huaixin Chang (3):
>  scripts/sorttable: Change section type of orc_lookup to SHT_PROGBITS
>  scripts/sorttable: Build orc fast lookup table via sorttable tool
>  x86/unwind/orc: Simplify unwind_init() for x86 boot
> 
> arch/x86/kernel/unwind_orc.c      | 41 +---------------
> include/asm-generic/vmlinux.lds.h |  2 +
> scripts/sorttable.h               | 99 ++++++++++++++++++++++++++++++++++++---
> 3 files changed, 96 insertions(+), 46 deletions(-)
> 
> -- 
> 2.14.4.44.g2045bb6

