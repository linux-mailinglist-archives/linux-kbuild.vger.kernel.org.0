Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B6044ECE0
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Nov 2021 19:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235630AbhKLSza (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Nov 2021 13:55:30 -0500
Received: from foss.arm.com ([217.140.110.172]:43788 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235618AbhKLSz3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Nov 2021 13:55:29 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71E871474;
        Fri, 12 Nov 2021 10:52:38 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A05873F70D;
        Fri, 12 Nov 2021 10:52:36 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kbuild@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v3 4/4] ftrace: Use preemption model accessors for trace header printout
Date:   Fri, 12 Nov 2021 18:52:03 +0000
Message-Id: <20211112185203.280040-5-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112185203.280040-1-valentin.schneider@arm.com>
References: <20211112185203.280040-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
preemption model of the live kernel. Use the newly-introduced accessors
instead.

Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 7896d30d90f7..749f66f96cee 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4271,17 +4271,11 @@ print_trace_header(struct seq_file *m, struct trace_iterator *iter)
 		   entries,
 		   total,
 		   buf->cpu,
-#if defined(CONFIG_PREEMPT_NONE)
-		   "server",
-#elif defined(CONFIG_PREEMPT_VOLUNTARY)
-		   "desktop",
-#elif defined(CONFIG_PREEMPT)
-		   "preempt",
-#elif defined(CONFIG_PREEMPT_RT)
-		   "preempt_rt",
-#else
+		   preempt_model_none()      ? "server" :
+		   preempt_model_voluntary() ? "desktop" :
+		   preempt_model_full()      ? "preempt" :
+		   preempt_model_rt()        ? "preempt_rt" :
 		   "unknown",
-#endif
 		   /* These are reserved for later use */
 		   0, 0, 0, 0);
 #ifdef CONFIG_SMP
-- 
2.25.1

