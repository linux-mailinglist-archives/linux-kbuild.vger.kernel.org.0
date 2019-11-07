Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8CCF3190
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2019 15:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfKGOeA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Nov 2019 09:34:00 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:45369 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729047AbfKGOeA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 09:34:00 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01451;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0ThQoCKT_1573137161;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0ThQoCKT_1573137161)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 07 Nov 2019 22:32:49 +0800
From:   shile.zhang@linux.alibaba.com
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at build time
Date:   Thu,  7 Nov 2019 22:32:01 +0800
Message-Id: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Shile Zhang <shile.zhang@linux.alibaba.com>

Hi,

I found the unwind_init taken long time (more than 90ms) in kernel
booting, mainly spent on sorting the two ORC unwind tables, orc_unwind
and orc_unwind_ip.

I also noticed that this issued has reported and discussed last year:
https://lkml.org/lkml/2018/10/8/342
But seems no final solution until now, I tried to sort the ORC tables at
build time, followed the helpful hints from Josh and Ingo in that thread.
And mainly referred the implementation of 'sortextable' tool:
https://lore.kernel.org/linux-mips/1334872799-14589-1-git-send-email-ddaney.cavm@gmail.com/

What I did:

- Add a Kconfig to control build-time sorting or runtime sorting;
- Referred 'sortextable', create a similar helper tool 'sortorctable',
  help to sort the ORC unwind tables at vmlinux link process.

One potential improvement is to sort the module ORC tables in future.

Thanks!

Shile Zhang (4):
  scripts: Add sortorctable to sort ORC unwind tables
  kbuild: Sort ORC unwind tables in vmlinux link process
  x86/unwind/orc: Skip sorting if BUILDTIME_ORCTABLE_SORT is configured
  x86/Kconfig: Add a Kconfig option to sort ORC tables at build time

 arch/x86/Kconfig.debug       |   9 ++
 arch/x86/kernel/unwind_orc.c |   2 +
 scripts/.gitignore           |   1 +
 scripts/Makefile             |   2 +
 scripts/link-vmlinux.sh      |  10 ++
 scripts/sortorctable.c       | 246 +++++++++++++++++++++++++++++++++++
 scripts/sortorctable.h       |  25 ++++
 7 files changed, 295 insertions(+)
 create mode 100644 scripts/sortorctable.c
 create mode 100644 scripts/sortorctable.h

-- 
2.24.0.rc2

