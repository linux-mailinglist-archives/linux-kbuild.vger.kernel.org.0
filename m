Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B19D44CA8A
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Nov 2021 21:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhKJU2L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Nov 2021 15:28:11 -0500
Received: from foss.arm.com ([217.140.110.172]:50616 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232005AbhKJU2L (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Nov 2021 15:28:11 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0346101E;
        Wed, 10 Nov 2021 12:25:22 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A8C83F5A1;
        Wed, 10 Nov 2021 12:25:20 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2 0/5] preempt: PREEMPT vs PREEMPT_DYNAMIC configs fixup
Date:   Wed, 10 Nov 2021 20:24:43 +0000
Message-Id: <20211110202448.4054153-1-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi folks,

Thanks to suggestions from Mike, Frederic and Marco I ended up with
something that looks somewhat sane and with a minimal amount of crud.

Patches
=======

o Patch 1 is the meat of the topic and could be picked on its own if the
  rest is too icky.
o Patch 2 introduces helpers for the dynamic preempt state
o Patches 3-5 make use of said accessors where relevant.

Testing
=======

Briefly tested the dynamic part on an x86 kernel + QEMU. x86_64_defconfig
gets me:

  Dynamic Preempt: voluntary

and appending preempt=full gets me:

  Dynamic Preempt: full

Revisions
=========

v1: http://lore.kernel.org/r/20211105104035.3112162-1-valentin.schneider@arm.com
v1.5: http://lore.kernel.org/r/20211109151057.3489223-1-valentin.schneider@arm.com

This v2 is completely different from v1, so I felt like I could get away
without writing a version changelog...

Cheers,
Valentin

Valentin Schneider (5):
  preempt: Restore preemption model selection configs
  preempt/dynamic: Introduce preempt mode accessors
  powerpc: Use preemption model accessors
  kscan: Use preemption model accessors
  ftrace: Use preemption model accessors for trace header printout

 arch/powerpc/kernel/interrupt.c |  2 +-
 arch/powerpc/kernel/traps.c     |  2 +-
 include/linux/kernel.h          |  2 +-
 include/linux/sched.h           | 16 +++++++++++++
 include/linux/vermagic.h        |  2 +-
 init/Makefile                   |  2 +-
 kernel/Kconfig.preempt          | 42 ++++++++++++++++-----------------
 kernel/kcsan/kcsan_test.c       |  4 ++--
 kernel/sched/core.c             | 17 ++++++++++---
 kernel/trace/trace.c            | 14 ++++-------
 10 files changed, 62 insertions(+), 41 deletions(-)

--
2.25.1

