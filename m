Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7351C1120BC
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2019 01:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfLDAqr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Dec 2019 19:46:47 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:47854 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726086AbfLDAqr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 19:46:47 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R381e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04446;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0Tjr6d8u_1575420394;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0Tjr6d8u_1575420394)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 04 Dec 2019 08:46:42 +0800
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
Subject: [RFC PATCH v6 0/7] Speed booting by sorting ORC unwind tables at build time
Date:   Wed,  4 Dec 2019 08:46:26 +0800
Message-Id: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

Sorry, update for compile error fix, reported by Intel's kbuild test robot.
Any comments or suggestions are welcome!

Thanks!

Changelog:
==========
v5->v6:
- fix compile error reported by kbuild test robot;

v4->v5:
- replace sort with qsort, suggested by Andy Lutomirski <luto@amacapital.net>;
- add error handling in link scripts;
- fixed some review findings;
https://lore.kernel.org/lkml/20191128110206.2107-1-shile.zhang@linux.alibaba.com/

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
 scripts/Makefile                       |  13 +-
 scripts/link-vmlinux.sh                |  13 +-
 scripts/sortextable.h                  | 209 --------------
 scripts/{sortextable.c => sorttable.c} | 305 +++++++++-----------
 scripts/sorttable.h                    | 380 +++++++++++++++++++++++++
 18 files changed, 557 insertions(+), 395 deletions(-)
 delete mode 100644 scripts/sortextable.h
 rename scripts/{sortextable.c => sorttable.c} (67%)
 create mode 100644 scripts/sorttable.h

-- 
2.24.0.rc2

