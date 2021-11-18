Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E3045565C
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Nov 2021 09:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244257AbhKRIOH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Nov 2021 03:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244260AbhKRIOE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Nov 2021 03:14:04 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3ABC061204
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:02 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id v10-20020a1cf70a000000b00318203a6bd1so2718506wmh.6
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=tuhyQwzlfQERbV6yctXDUlEPG1hDRNoinPlUWTt5/uo=;
        b=D3oVfd2YW+Jp0uWnxzxNuYTct1ZYohzwg0BWZoFT76u6awgFWd2DR3ZCJl3hb6Yhvo
         KETbEmZvuQfBxAuXqM/WJ/+3ZdiVlllEQPVNGVg3xS93MQdCnA3feBHHINUwKPhRmpG6
         jc3pDoc/4nlId6nmxamE0Ew/EFoYnpV+tirsZqWz9ZwHwWXJ32Ue9hJVXQmYyclwQ9kH
         HHedB/VE8nIp/Q9DxS9HcGo8hOaxQr/Tcrg5HdMkc2qsslGAY6Mf3fenb4k21me8E6fY
         r6jTlhfCDXqdh0McMzWPlUPmEA3Tyenk6iq86GFlFsQ1xQN/TqOsb8J6B/6Sog08Mfku
         WYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tuhyQwzlfQERbV6yctXDUlEPG1hDRNoinPlUWTt5/uo=;
        b=cI5hbuN8qPFVPFFxFPeQGNWiR5zZhcxWJZyeIq83tD1ruMBko58ekOEptDN6rA1VT+
         mU2xIAiV/oeSJm4sH8y9bM5eR3yu/BkitYPItCO06s1dP2zaB+u36q72q8HCSeHGvJKV
         8pAm7pw85hdUkZ5nwvGEnp01GA59KTz9F8K6UtMDbbdkts3EniFSTp8yUPO1qWTiGJKI
         k+r8twV8I50lFv6mgmVY5Na5uN2q+fAGiYmI4Mzi98xVXGhC3mdjw0z8lgvUQH4WFxsg
         NEHjTo9f86kIFX/9IpQ+zo2OGMW+Zci/pMpda3+gC8DArl3FYgEGIIbpzyYNsfdaV8a0
         7y8w==
X-Gm-Message-State: AOAM531Sgql2VxKnZyEx+WQ2B4Fgx3pOKPo9XygMgWSzoXhxNWfBk84N
        CRbMTWiqnm7Bf6BhnlZ5SnxPgZSv9Q==
X-Google-Smtp-Source: ABdhPJzQxkm6OMNTn46m01PGy9cklfqML1hzDduv1JDdwG8tqjMXvO3kTz4l34bGEND1CfeyWVzi0Z/tfw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a5d:452b:: with SMTP id j11mr28008131wra.432.1637223061543;
 Thu, 18 Nov 2021 00:11:01 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:06 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-3-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 02/23] kcsan: Remove redundant zero-initialization of globals
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

They are implicitly zero-initialized, remove explicit initialization.
It keeps the upcoming additions to kcsan_ctx consistent with the rest.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
 init/init_task.c    | 9 +--------
 kernel/kcsan/core.c | 5 -----
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/init/init_task.c b/init/init_task.c
index 2d024066e27b..61700365ce58 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -181,14 +181,7 @@ struct task_struct init_task
 	.kasan_depth	= 1,
 #endif
 #ifdef CONFIG_KCSAN
-	.kcsan_ctx = {
-		.disable_count		= 0,
-		.atomic_next		= 0,
-		.atomic_nest_count	= 0,
-		.in_flat_atomic		= false,
-		.access_mask		= 0,
-		.scoped_accesses	= {LIST_POISON1, NULL},
-	},
+	.kcsan_ctx = { .scoped_accesses = {LIST_POISON1, NULL} },
 #endif
 #ifdef CONFIG_TRACE_IRQFLAGS
 	.softirqs_enabled = 1,
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 6bfd3040f46b..e34a1710b7bc 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -44,11 +44,6 @@ bool kcsan_enabled;
 
 /* Per-CPU kcsan_ctx for interrupts */
 static DEFINE_PER_CPU(struct kcsan_ctx, kcsan_cpu_ctx) = {
-	.disable_count		= 0,
-	.atomic_next		= 0,
-	.atomic_nest_count	= 0,
-	.in_flat_atomic		= false,
-	.access_mask		= 0,
 	.scoped_accesses	= {LIST_POISON1, NULL},
 };
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

