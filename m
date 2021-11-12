Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE1044ECDA
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Nov 2021 19:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbhKLSz0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Nov 2021 13:55:26 -0500
Received: from foss.arm.com ([217.140.110.172]:43746 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235598AbhKLSzZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Nov 2021 13:55:25 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64369139F;
        Fri, 12 Nov 2021 10:52:34 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E8273F70D;
        Fri, 12 Nov 2021 10:52:32 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kbuild@vger.kernel.org
Cc:     Marco Elver <elver@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v3 2/4] preempt/dynamic: Introduce preemption model accessors
Date:   Fri, 12 Nov 2021 18:52:01 +0000
Message-Id: <20211112185203.280040-3-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112185203.280040-1-valentin.schneider@arm.com>
References: <20211112185203.280040-1-valentin.schneider@arm.com>
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
parameter. Same problem applies to CONFIG_PREEMPTION.

Introduce a set of helpers to determine the actual preemption model used by
the live kernel.

Suggested-by: Marco Elver <elver@google.com>
Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
---
 include/linux/sched.h | 41 +++++++++++++++++++++++++++++++++++++++++
 kernel/sched/core.c   | 12 ++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 5f8db54226af..e8e884ee6e8b 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2073,6 +2073,47 @@ static inline void cond_resched_rcu(void)
 #endif
 }
 
+#ifdef CONFIG_PREEMPT_DYNAMIC
+
+extern bool preempt_model_none(void);
+extern bool preempt_model_voluntary(void);
+extern bool preempt_model_full(void);
+
+#else
+
+static inline bool preempt_model_none(void)
+{
+	return IS_ENABLED(CONFIG_PREEMPT_NONE);
+}
+static inline bool preempt_model_voluntary(void)
+{
+	return IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY);
+}
+static inline bool preempt_model_full(void)
+{
+	return IS_ENABLED(CONFIG_PREEMPT);
+}
+
+#endif
+
+static inline bool preempt_model_rt(void)
+{
+	return IS_ENABLED(CONFIG_PREEMPT_RT);
+}
+
+/*
+ * Does the preemption model allow non-cooperative preemption?
+ *
+ * For !CONFIG_PREEMPT_DYNAMIC kernels this is an exact match with
+ * CONFIG_PREEMPTION; for CONFIG_PREEMPT_DYNAMIC this doesn't work as the
+ * kernel is *built* with CONFIG_PREEMPTION=y but may run with e.g. the
+ * PREEMPT_NONE model.
+ */
+static inline bool preempt_model_preemptible(void)
+{
+	return preempt_model_full() || preempt_model_rt();
+}
+
 /*
  * Does a critical section need to be broken due to another
  * task waiting?: (technically does not depend on CONFIG_PREEMPTION,
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 97047aa7b6c2..e2502b8643b4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6638,6 +6638,18 @@ static void __init preempt_dynamic_init(void)
 	}
 }
 
+#define PREEMPT_MODEL_ACCESSOR(mode) \
+	bool preempt_model_##mode(void)						 \
+	{									 \
+		WARN_ON_ONCE(preempt_dynamic_mode == preempt_dynamic_undefined); \
+		return preempt_dynamic_mode == preempt_dynamic_##mode;		 \
+	}									 \
+	EXPORT_SYMBOL_GPL(preempt_model_##mode)
+
+PREEMPT_MODEL_ACCESSOR(none);
+PREEMPT_MODEL_ACCESSOR(voluntary);
+PREEMPT_MODEL_ACCESSOR(full);
+
 #else /* !CONFIG_PREEMPT_DYNAMIC */
 
 static inline void preempt_dynamic_init(void) { }
-- 
2.25.1

