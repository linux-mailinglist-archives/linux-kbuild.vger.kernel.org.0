Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCC844ECDF
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Nov 2021 19:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbhKLSz3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Nov 2021 13:55:29 -0500
Received: from foss.arm.com ([217.140.110.172]:43766 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235624AbhKLSz1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Nov 2021 13:55:27 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A9B513D5;
        Fri, 12 Nov 2021 10:52:36 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9AB093F70D;
        Fri, 12 Nov 2021 10:52:34 -0800 (PST)
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
Subject: [PATCH v3 3/4] kcsan: Use preemption model accessors
Date:   Fri, 12 Nov 2021 18:52:02 +0000
Message-Id: <20211112185203.280040-4-valentin.schneider@arm.com>
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
Reviewed-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/kcsan_test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index dc55fd5a36fc..97cf1efce36a 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -1005,13 +1005,14 @@ static const void *nthreads_gen_params(const void *prev, char *desc)
 	else
 		nthreads *= 2;
 
-	if (!IS_ENABLED(CONFIG_PREEMPT) || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
+	if (!preempt_model_preemptible() ||
+	    !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
 		/*
 		 * Without any preemption, keep 2 CPUs free for other tasks, one
 		 * of which is the main test case function checking for
 		 * completion or failure.
 		 */
-		const long min_unused_cpus = IS_ENABLED(CONFIG_PREEMPT_NONE) ? 2 : 0;
+		const long min_unused_cpus = preempt_model_none() ? 2 : 0;
 		const long min_required_cpus = 2 + min_unused_cpus;
 
 		if (num_online_cpus() < min_required_cpus) {
-- 
2.25.1

