Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8567CFD683
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 07:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKOGsG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 01:48:06 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:39901 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725848AbfKOGsG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 01:48:06 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0Ti7ujx6_1573800472;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0Ti7ujx6_1573800472)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 15 Nov 2019 14:48:00 +0800
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v3 0/7] Speed booting by sorting ORC unwind tables at build time
Date:   Fri, 15 Nov 2019 14:47:43 +0800
Message-Id: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

I refactored the sortextable code and add ORC unwind tables sort
support, for kernel boot speedup by sorting kernel tables at build time
as much as possible.

Followed Peter's suggestion, I put ORC tables sort into a separated
thread makes these tables sort concurrently. That helps to avoid
kernel's link time as possible.

What I did:
[1-4]	: refacorting code sortextable.{ch}, for more readable and
	  extendable, prepare for further rework;
[5]	: rename the sortextable to sorttable, and related Kconfig, for
	  commonly extend.
[6-7]	: Add ORC unwind tables sorting, and remove the runtime sort.

Further works:
Put more kernel tables be sorted at build time:
- __jump_table:
  I found jump table sort in jump_label_init() does not cost more boot
  time, seems not more benefit to sort it at build time. Maybe can
  consider it in future for more boot-time sensitive case.
- .static_call_sites:
  This tables not merged yet, needs to check the runtime sort cost in
  future.
  https://lore.kernel.org/lkml/20191007081716.07616230.8@infradead.org/

Thanks!

Changes from RFC v3:
- Discard new added sortorctable tool and related Kconfig changes.
- Refactored sortextable, makes it more readable and extendable.
- Rename 'sortextable' to 'sorttable', for more kernel tables extend.
- Add ORC unwind tables sort into sorttable.
- Remove the runtime ORC tables sort.

Changes from RFC v2:
- Removed new added Kconfig and runtime sort code, advised by Josh Poimboeuf.
- Some minor refactoring.
https://www.lkml.org/lkml/2019/11/8/56

v1:
- Added a new sortorctable tool to sort ORC unwind tables at build time,
  same as sortextable.
- Add a new Kconfigure to control if ORC unwind tables sort at build
  time.
https://www.lkml.org/lkml/2019/11/7/611

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
 arch/parisc/kernel/vmlinux.lds.S       |   2 +-
 arch/powerpc/Kconfig                   |   2 +-
 arch/s390/Kconfig                      |   2 +-
 arch/x86/Kconfig                       |   2 +-
 arch/x86/kernel/unwind_orc.c           |   8 +-
 arch/xtensa/Kconfig                    |   2 +-
 init/Kconfig                           |   2 +-
 scripts/.gitignore                     |   2 +-
 scripts/Makefile                       |   9 +-
 scripts/link-vmlinux.sh                |  10 +-
 scripts/sortextable.h                  | 209 -------------
 scripts/{sortextable.c => sorttable.c} | 299 ++++++++----------
 scripts/sorttable.h                    | 412 +++++++++++++++++++++++++
 19 files changed, 578 insertions(+), 395 deletions(-)
 delete mode 100644 scripts/sortextable.h
 rename scripts/{sortextable.c => sorttable.c} (67%)
 create mode 100644 scripts/sorttable.h

-- 
2.24.0.rc2

