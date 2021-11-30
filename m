Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D4C4632C4
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Nov 2021 12:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240895AbhK3Lsc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Nov 2021 06:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbhK3Ls2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Nov 2021 06:48:28 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F3EC061748
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:09 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id p12-20020a05600c1d8c00b0033a22e48203so12698173wms.6
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZmySmV7nXgp7ZU44HAHRwN8PhZWnIeFNi9/5LSGaJn0=;
        b=hs4LlI5lsoVztdyeXHYGVaXqoGqfWxtfU47ZxaWIXMF2LtJbb78kUIVc0cRuvGbMfb
         UNw6/fXMdGtPv2h8zBMi5zOcBaSwfjE2+nKiMNKeM9jeUs4vjbJK99CBpMUY1igcK2AO
         hkM8i+x5rI34uTiK4kGz6Ny8KsFfPBn9Skfxtgdf+EY6mB5WctN9uRu5XKue8YS4CWPZ
         MuVmceyTqxFjckuQpfDMMo3/XKIvHHLDEu5mET7aFh3FTzDlkJ5ONfBlsc2EWCjP5kGc
         SyQVbaVFhKuFSos4aYqJ8KZimc+D5tJysctdVSWpiS6AHqJ7/PEA9mqqH25rLKWF5py6
         iIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZmySmV7nXgp7ZU44HAHRwN8PhZWnIeFNi9/5LSGaJn0=;
        b=gXkTb46IUOdea5xl5S+QaXac/16KgQxw940jNx6VRg7b6Je76GSW4XBWabjeb82FAS
         eLirX87Fevof1C7EWFwHwJ6IgiBXF0Ub7pjjNYm5aP10DK6gSbbKbvlBiEe/qiPQMhL1
         vbbNks1s5ZCcHllNoTH01+adNlgP4eLzkf0k2vjMOJXe+/vqQoBibTWIsoy8MTdVgr6J
         lu0kmYD7YWieaYvFWLF3oTzuIykxh+y09snGiOVpCR/1H5BheBp+tJvG76/G7q616UIw
         MYJj0O3J8LP3OO4pCCrbOCgbLiq5HHtztQlbVaUOHR8Bpbz6hUwe54gXP0U8Oc0K763I
         68pg==
X-Gm-Message-State: AOAM532vRpit3YepvMWkDx7N5EGdC3xeRnZGMZ3w3uMvIFdXJCqoRrBS
        qAXRPJL5hdaHxZjjtgLl3twRpvsNBQ==
X-Google-Smtp-Source: ABdhPJwtFgfDTN6vPjSFkCyUpvSQ19ytHU7Acqp52u/sb5E17RDsJPS4ZB9wklKdX5QEMGX86DVOVVVs4A==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4f0b:: with SMTP id
 l11mr625318wmq.0.1638272707028; Tue, 30 Nov 2021 03:45:07 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:10 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-3-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 02/25] kcsan: Remove redundant zero-initialization of globals
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, llvm@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

They are implicitly zero-initialized, remove explicit initialization.
It keeps the upcoming additions to kcsan_ctx consistent with the rest.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
v3:
* Minimize diff by leaving "scoped_accesses" on its own line, which
  should also reduce diff of future changes.
---
 init/init_task.c    | 5 -----
 kernel/kcsan/core.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/init/init_task.c b/init/init_task.c
index 2d024066e27b..73cc8f03511a 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -182,11 +182,6 @@ struct task_struct init_task
 #endif
 #ifdef CONFIG_KCSAN
 	.kcsan_ctx = {
-		.disable_count		= 0,
-		.atomic_next		= 0,
-		.atomic_nest_count	= 0,
-		.in_flat_atomic		= false,
-		.access_mask		= 0,
 		.scoped_accesses	= {LIST_POISON1, NULL},
 	},
 #endif
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

