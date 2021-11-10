Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF45E44CA8E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Nov 2021 21:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhKJU2S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Nov 2021 15:28:18 -0500
Received: from foss.arm.com ([217.140.110.172]:50710 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233059AbhKJU2S (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Nov 2021 15:28:18 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05175143B;
        Wed, 10 Nov 2021 12:25:30 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEBB43F5A1;
        Wed, 10 Nov 2021 12:25:27 -0800 (PST)
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
Subject: [PATCH v2 3/5] powerpc: Use preemption model accessors
Date:   Wed, 10 Nov 2021 20:24:46 +0000
Message-Id: <20211110202448.4054153-4-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110202448.4054153-1-valentin.schneider@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
preemption model of the live kernel. Use the newly-introduced accessors
instead.

sched_init() -> preempt_dynamic_init() happens way before IRQs are set up,
so this should be fine.

Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
---
 arch/powerpc/kernel/interrupt.c | 2 +-
 arch/powerpc/kernel/traps.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index de10a2697258..c56c10b59be3 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -552,7 +552,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (IS_ENABLED(CONFIG_PREEMPT)) {
+		if (is_preempt_full()) {
 			/* Return to preemptible kernel context */
 			if (unlikely(current_thread_info()->flags & _TIF_NEED_RESCHED)) {
 				if (preempt_count() == 0)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index aac8c0412ff9..1cb31bbdc925 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -265,7 +265,7 @@ static int __die(const char *str, struct pt_regs *regs, long err)
 	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024, get_mmu_str(),
-	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
+	       is_preempt_full() ? " PREEMPT" : "",
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
-- 
2.25.1

