Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14B3249327
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 05:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHSDDK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Tue, 18 Aug 2020 23:03:10 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:59579 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726605AbgHSDDJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 23:03:09 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04427;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0U6BcqGk_1597806184;
Received: from 30.27.116.4(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U6BcqGk_1597806184)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 19 Aug 2020 11:03:05 +0800
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2 0/3] Build ORC fast lookup table in scripts/sorttable
 tool
From:   changhuaixin <changhuaixin@linux.alibaba.com>
In-Reply-To: <20200807041802.18639-1-changhuaixin@linux.alibaba.com>
Date:   Wed, 19 Aug 2020 11:03:04 +0800
Cc:     bp@alien8.de, hpa@zytor.com, jpoimboe@redhat.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Content-Transfer-Encoding: 8BIT
Message-Id: <C2FA85AC-12FD-4FC3-A955-31F0441D81CC@linux.alibaba.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
 <20200807041802.18639-1-changhuaixin@linux.alibaba.com>
To:     Ingo Molnar <mingo@kernel.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi，Ingo

This patchset reverts the hacks from patchset v1. Also it includes some other fixes upon v1 as suggested.
Will you please have a look at this?

The previous links are:
https://lore.kernel.org/lkml/20200724135531.GB648324@gmail.com/

Thanks,
huaixin

> On Aug 7, 2020, at 12:17 PM, Huaixin Chang <changhuaixin@linux.alibaba.com> wrote:
> 
> Move building of fast lookup table from boot to sorttable tool. This saves us
> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores. It
> adds a little more than 7ms to boot time when testing on the same CPU.
> 
> Changelog v2:
> 1. Write .orc_lookup section header via objtool
> 2. Move two ORC lookup table macro from orc_lookup.h into orc_types.h
> 3. Spell 'ORC' in capitalized fashion
> 
> Huaixin Chang (3):
>  objtool: Write .orc_lookup section header
>  scripts/sorttable: Build ORC fast lookup table via sorttable tool
>  x86/unwind/orc: Simplify unwind_init() for x86 boot
> 
> arch/x86/include/asm/orc_lookup.h      | 16 ------
> arch/x86/include/asm/orc_types.h       | 16 ++++++
> arch/x86/kernel/unwind_orc.c           | 41 +--------------
> arch/x86/kernel/vmlinux.lds.S          |  2 +-
> scripts/sorttable.h                    | 96 +++++++++++++++++++++++++++++++---
> tools/arch/x86/include/asm/orc_types.h | 16 ++++++
> tools/objtool/orc_gen.c                |  4 ++
> 7 files changed, 128 insertions(+), 63 deletions(-)
> 
> -- 
> 2.14.4.44.g2045bb6

