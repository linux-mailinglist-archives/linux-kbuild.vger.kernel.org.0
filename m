Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 759E94632BE
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Nov 2021 12:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236614AbhK3Ls1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Nov 2021 06:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbhK3LsZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Nov 2021 06:48:25 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D11DC061574
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:06 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id n16-20020a05600c3b9000b003331973fdbbso12722276wms.0
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xU7oMqGuZSzuwQqlTLWl5HT2gcOlUZd23bSn8B82hrg=;
        b=Xy0Q+YI5NXLu9Vu/GqZXZ/NkVKZGY+Dyl/qHhhsqu+N7c30y5RqI/XCrIlHe3X19Nh
         evJKpX1Yb5PiOGVi1OlZVgpRdD2+1S8l7ngHyodcnAb0g7h8yA5Ab5+1LnPIcWw8vsTM
         p2uXuWZAkjJyFoSytrkutzkg/LKlRjI43oPCGO+yw5/6Yfs1tHJ/Mf4uJOXe72iBcCBl
         4FO/p9lF2haQmJkr/CoJCx3SDiPv+jHsgdY0dUU6fZwZ18WtY9A1ipHCJmqZq3ds957N
         Uj2uP2ybxXh8OhQWUBFKB4C89sZGuXi6EvuurDqZ5TrmAwgvkFHV0fpSoAZ84iAvdZ0x
         V/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xU7oMqGuZSzuwQqlTLWl5HT2gcOlUZd23bSn8B82hrg=;
        b=ON37FXEOYYA0SCc/GUJG50DK4WyxANr8n1A+KBUhXPEFZUFNS6+zimEMLjfZ+S2fTU
         30LeATfn6O6hDg5QF7yl8dHeb+U0sajQfzLwrT44NL00TRZUyUN503B3LBbjGYVpgNWJ
         SAEA7TD7d1JZexggeNH7XM8ht8w1x91XDC9btSo04R5OEzKAcJPouzRolKjMHiKo0dgK
         5iqciaSxwoKPPOz1iGhFKA9ImnZq7rr4lu3wMC1c6y4jO9r8VGMMoW9qGum0nFJHTweA
         a7b5n+zg4mUa7UwRPdVVI1hkG9Ha73BEutaXXnID4G/XsvORqHjRNFT6Q20ZqvxozGid
         mZsg==
X-Gm-Message-State: AOAM532hMCVLJRuc41ZB95qdPcy5ZPXkBbUdc4n+dwLKUmRkNzdrGgIg
        pER6MWFIawdUO3CHF3GuMW0RL7dxnQ==
X-Google-Smtp-Source: ABdhPJxMw5l6/kTuSVacreFWKtgYBmLxSIyhtA/0rGCmUImckuo5HDxUebxVJTM+SCYFMFx3K6mM35ARMw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4f87:: with SMTP id
 n7mr4359911wmq.63.1638272704753; Tue, 30 Nov 2021 03:45:04 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:09 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-2-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 01/25] kcsan: Refactor reading of instrumented memory
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

Factor out the switch statement reading instrumented memory into a
helper read_instrumented_memory().

No functional change.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 kernel/kcsan/core.c | 51 +++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 4b84c8e7884b..6bfd3040f46b 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -325,6 +325,21 @@ static void delay_access(int type)
 	udelay(delay);
 }
 
+/*
+ * Reads the instrumented memory for value change detection; value change
+ * detection is currently done for accesses up to a size of 8 bytes.
+ */
+static __always_inline u64 read_instrumented_memory(const volatile void *ptr, size_t size)
+{
+	switch (size) {
+	case 1:  return READ_ONCE(*(const u8 *)ptr);
+	case 2:  return READ_ONCE(*(const u16 *)ptr);
+	case 4:  return READ_ONCE(*(const u32 *)ptr);
+	case 8:  return READ_ONCE(*(const u64 *)ptr);
+	default: return 0; /* Ignore; we do not diff the values. */
+	}
+}
+
 void kcsan_save_irqtrace(struct task_struct *task)
 {
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -482,23 +497,7 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 	 * Read the current value, to later check and infer a race if the data
 	 * was modified via a non-instrumented access, e.g. from a device.
 	 */
-	old = 0;
-	switch (size) {
-	case 1:
-		old = READ_ONCE(*(const u8 *)ptr);
-		break;
-	case 2:
-		old = READ_ONCE(*(const u16 *)ptr);
-		break;
-	case 4:
-		old = READ_ONCE(*(const u32 *)ptr);
-		break;
-	case 8:
-		old = READ_ONCE(*(const u64 *)ptr);
-		break;
-	default:
-		break; /* ignore; we do not diff the values */
-	}
+	old = read_instrumented_memory(ptr, size);
 
 	/*
 	 * Delay this thread, to increase probability of observing a racy
@@ -511,23 +510,7 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 	 * racy access.
 	 */
 	access_mask = ctx->access_mask;
-	new = 0;
-	switch (size) {
-	case 1:
-		new = READ_ONCE(*(const u8 *)ptr);
-		break;
-	case 2:
-		new = READ_ONCE(*(const u16 *)ptr);
-		break;
-	case 4:
-		new = READ_ONCE(*(const u32 *)ptr);
-		break;
-	case 8:
-		new = READ_ONCE(*(const u64 *)ptr);
-		break;
-	default:
-		break; /* ignore; we do not diff the values */
-	}
+	new = read_instrumented_memory(ptr, size);
 
 	diff = old ^ new;
 	if (access_mask)
-- 
2.34.0.rc2.393.gf8c9666880-goog

