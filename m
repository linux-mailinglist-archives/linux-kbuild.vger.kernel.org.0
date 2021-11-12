Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2394244ECD4
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Nov 2021 19:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhKLSzW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Nov 2021 13:55:22 -0500
Received: from foss.arm.com ([217.140.110.172]:43712 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229892AbhKLSzV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Nov 2021 13:55:21 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A2F3101E;
        Fri, 12 Nov 2021 10:52:30 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DB3E3F70D;
        Fri, 12 Nov 2021 10:52:28 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kbuild@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v3 0/4] preempt: PREEMPT vs PREEMPT_DYNAMIC configs fixup
Date:   Fri, 12 Nov 2021 18:51:59 +0000
Message-Id: <20211112185203.280040-1-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi folks,

This v3 is mostly about the naming problem - get your paintbrushes ready!

Patches
=======

o Patch 1 is the meat of the topic - note that it's now in tip/sched/urgent
o Patch 2 introduces helpers for the dynamic preempt state
o Patches 3-4 make use of said accessors where relevant.

Testing
=======

Briefly tested the dynamic part on an x86 kernel + QEMU.
Compile-tested the kcsan test thingie as a module.

Revisions
=========

v1: http://lore.kernel.org/r/20211105104035.3112162-1-valentin.schneider@arm.com
v1.5: http://lore.kernel.org/r/20211109151057.3489223-1-valentin.schneider@arm.com

v2 -> v3
++++++++

o Turned is_preempt_*() into preempt_model_*() (Frederic)
  It breaks my rule of "booleans must answer a yes/no question" but is the best
  I could come with using a "preempt_" prefix
  
o Added preempt_model_preemptible() (Marco)
  Now used in kcsan_test.c
  
o Dropped powerpc changes

Cheers,
Valentin


Valentin Schneider (4):
  preempt: Restore preemption model selection configs
  preempt/dynamic: Introduce preemption model accessors
  kcsan: Use preemption model accessors
  ftrace: Use preemption model accessors for trace header printout

 include/linux/kernel.h    |  2 +-
 include/linux/sched.h     | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/vermagic.h  |  2 +-
 init/Makefile             |  2 +-
 kernel/Kconfig.preempt    | 42 +++++++++++++++++++--------------------
 kernel/kcsan/kcsan_test.c |  5 +++--
 kernel/sched/core.c       | 18 ++++++++++++++---
 kernel/trace/trace.c      | 14 ++++---------
 8 files changed, 87 insertions(+), 39 deletions(-)

--
2.25.1

