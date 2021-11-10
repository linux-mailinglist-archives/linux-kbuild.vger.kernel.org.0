Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E223744CA98
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Nov 2021 21:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhKJU3O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Nov 2021 15:29:14 -0500
Received: from foss.arm.com ([217.140.110.172]:50680 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232859AbhKJU2P (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Nov 2021 15:28:15 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88E0C1435;
        Wed, 10 Nov 2021 12:25:27 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5863A3F5A1;
        Wed, 10 Nov 2021 12:25:25 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Cc:     Marco Elver <elver@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
Date:   Wed, 10 Nov 2021 20:24:45 +0000
Message-Id: <20211110202448.4054153-3-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110202448.4054153-1-valentin.schneider@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

CONFIG_PREEMPT{_NONE, _VOLUNTARY} designate either:
o The build-time preemption model when !PREEMPT_DYNAMIC
o The default boot-time preemption model when PREEMPT_DYNAMIC

IOW, using those on PREEMPT_DYNAMIC kernels is meaningless - the actual
model could have been set to something else by the "preempt=foo" cmdline
parameter.

Introduce a set of helpers to determine the actual preemption mode used by
the live kernel.

Suggested-by: Marco Elver <elver@google.com>
Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
---
 include/linux/sched.h | 16 ++++++++++++++++
 kernel/sched/core.c   | 11 +++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 5f8db54226af..0640d5622496 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
 #endif
 }
 
+#ifdef CONFIG_PREEMPT_DYNAMIC
+
+extern bool is_preempt_none(void);
+extern bool is_preempt_voluntary(void);
+extern bool is_preempt_full(void);
+
+#else
+
+#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
+#define is_preempt_voluntary() IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
+#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
+
+#endif
+
+#define is_preempt_rt() IS_ENABLED(CONFIG_PREEMPT_RT)
+
 /*
  * Does a critical section need to be broken due to another
  * task waiting?: (technically does not depend on CONFIG_PREEMPTION,
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 97047aa7b6c2..9db7f77e53c3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6638,6 +6638,17 @@ static void __init preempt_dynamic_init(void)
 	}
 }
 
+#define PREEMPT_MODE_ACCESSOR(mode) \
+	bool is_preempt_##mode(void)						 \
+	{									 \
+		WARN_ON_ONCE(preempt_dynamic_mode == preempt_dynamic_undefined); \
+		return preempt_dynamic_mode == preempt_dynamic_##mode;		 \
+	}
+
+PREEMPT_MODE_ACCESSOR(none)
+PREEMPT_MODE_ACCESSOR(voluntary)
+PREEMPT_MODE_ACCESSOR(full)
+
 #else /* !CONFIG_PREEMPT_DYNAMIC */
 
 static inline void preempt_dynamic_init(void) { }
-- 
2.25.1

