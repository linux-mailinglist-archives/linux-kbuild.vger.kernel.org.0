Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8F522A63C
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 05:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgGWDqx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jul 2020 23:46:53 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:38467 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725822AbgGWDqx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jul 2020 23:46:53 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0U3YAYRB_1595476009;
Received: from localhost(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U3YAYRB_1595476009)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 23 Jul 2020 11:46:49 +0800
From:   Huaixin Chang <changhuaixin@linux.alibaba.com>
To:     jpoimboe@redhat.com
Cc:     bp@alien8.de, changhuaixin@linux.alibaba.com, hpa@zytor.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: [PATCH RESEND 0/3] Build ORC fast lookup table in scripts/sorttable tool
Date:   Thu, 23 Jul 2020 11:46:40 +0800
Message-Id: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Move building of fast lookup table from boot to sorttable tool. This saves us
6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores. It
adds a little more than 7ms to boot time when testing on the same CPU.

Kernel initialization unwind_init() cannot be removed because lookup_num_blocks
is still needed.

Huaixin Chang (3):
  scripts/sorttable: Change section type of orc_lookup to SHT_PROGBITS
  scripts/sorttable: Build orc fast lookup table via sorttable tool
  x86/unwind/orc: Simplify unwind_init() for x86 boot

 arch/x86/kernel/unwind_orc.c      | 41 +---------------
 include/asm-generic/vmlinux.lds.h |  2 +
 scripts/sorttable.h               | 99 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 96 insertions(+), 46 deletions(-)

-- 
2.14.4.44.g2045bb6

