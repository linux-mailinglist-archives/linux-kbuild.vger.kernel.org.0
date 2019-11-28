Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7C8E10C79E
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2019 12:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfK1LCZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Nov 2019 06:02:25 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:43556 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726699AbfK1LCY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Nov 2019 06:02:24 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0TjIllLR_1574938929;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0TjIllLR_1574938929)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 28 Nov 2019 19:02:15 +0800
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@amacapital.net>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v5 0/7] Speed booting by sorting ORC unwind tables at build time
Date:   Thu, 28 Nov 2019 19:01:59 +0800
Message-Id: <20191128110206.2107-1-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This series refactored the original sortextable tools, add ORC unwind
tables sort at build time.

To sort the ORC unwind tables(.orc_unwind & .orc_unwind_ip) can save
about 100ms in my test ENV (2C4G VM w/ Xeon 2.5GHz CPU).
It costs about 30ms sort by new sorttable tool.

Any comments or suggestions are welcome!

Thanks!

Changelog:
==========
v4->v5:
- replace sort with qsort, suggested by Andy Lutomirski <luto@amacapital.net>;
- add error handling in link scripts;
- fixed some review findings;

v3->v4:
- Code refactored for Peter's review findings and suggestions.
https://lore.kernel.org/lkml/20191115164539.57930-1-shile.zhang@linux.alibaba.com/

v2->v3:
- Discard new added sortorctable tool and related Kconfig changes.
- Refactored sortextable, makes it more readable and extendable.
- Rename 'sortextable' to 'sorttable', for more kernel tables extend.
- Add ORC unwind tables sort into sorttable.
- Remove the runtime ORC tables sort.
https://lore.kernel.org/lkml/20191115064750.47888-1-shile.zhang@linux.alibaba.com/

v1->v2:
- Removed new added Kconfig and runtime sort code, advised by Josh Poimboeuf.
- Some minor refactoring.
https://lore.kernel.org/lkml/20191108071108.72132-1-shile.zhang@linux.alibaba.com/

v1:
- Added a new sortorctable tool to sort ORC unwind tables at build time,
  same as sortextable.
- Add a new Kconfigure to control if ORC unwind tables sort at build
  time.
https://lore.kernel.org/lkml/20191107143205.206606-1-shile.zhang@linux.alibaba.com/

Shile Zhang (7):
  scripts/sortextable: Rewrite error/success handling
  scripts/sortextable: kernel coding style formating
  scripts/sortextable: Remove dead code
  scripts/sortextable: refactor do_func() function
  scripts/sorttable: rename sortextable to sorttable
  scripts/sorttable: Add ORC unwind tables sort concurrently
  x86/unwind/orc: remove run-time ORC unwind tables sort

 arch/arc/Kconfig                       |   2 +-
 arch/arm/Kconfig                       |   2 +-
 arch/arm64/Kconfig                     |   2 +-
 arch/microblaze/Kconfig                |   2 +-
 arch/mips/Kconfig                      |   2 +-
 arch/parisc/Kconfig                    |   2 +-
 arch/powerpc/Kconfig                   |   2 +-
 arch/s390/Kconfig                      |   2 +-
 arch/x86/Kconfig                       |   2 +-
 arch/x86/kernel/unwind_orc.c           |   8 +-
 arch/xtensa/Kconfig                    |   2 +-
 init/Kconfig                           |   2 +-
 scripts/.gitignore                     |   2 +-
 scripts/Makefile                       |  10 +-
 scripts/link-vmlinux.sh                |  13 +-
 scripts/sortextable.h                  | 209 --------------
 scripts/{sortextable.c => sorttable.c} | 299 +++++++++----------
 scripts/sorttable.h                    | 380 +++++++++++++++++++++++++
 18 files changed, 549 insertions(+), 394 deletions(-)
 delete mode 100644 scripts/sortextable.h
 rename scripts/{sortextable.c => sorttable.c} (67%)
 create mode 100644 scripts/sorttable.h

-- 
2.24.0.rc2

