Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42AF455656
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Nov 2021 09:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244266AbhKRIOF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Nov 2021 03:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244247AbhKRIOB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Nov 2021 03:14:01 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83B4C061764
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:00 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id l6-20020a05600c4f0600b0033321934a39so2706514wmq.9
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SHlXPesj/sMVN1b9WbUeHFHzMLC0KZiq0qGR6QmTL6E=;
        b=XyT5v0i6sf9PPTqOt1kw+VpryVGt2ed80hDlnhClza3ljnElrz3vRQdJCOpTuvWDRD
         WPs6kJ70xj/jjBVaBPnXZbT42p+8Yl8/MHwAAsB38e+tZCfOctJzbCk3kKfHqJnTyS/G
         U8nyzozLAt7FxcyX3iMWq6oHIPb5Vc8VHuxLlUClKnPspZx1c89pWakNLM3sLcLjVIhl
         XWl9bkN2DLBbX0fVrNT6fOggYu9frJBoBTU6lKOn70O2SDu/YPqQty/ZsbnJsHtNTZia
         iZxjuh3CoMDQ7kq0GjxakKwrr7jR9NFnGBFQsdtaHvbLAcdExPUrDNUkatVJUKaU1n+g
         jfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SHlXPesj/sMVN1b9WbUeHFHzMLC0KZiq0qGR6QmTL6E=;
        b=YzjWh3VTkOAWLWDmGPdJIZcs/OtV2jtQwDb0jwbs1rs2YwJDPeg+fWfoNjgAYnLYGV
         Bj5rys3Gwkqbc0LXhbS0Nm5e1rclE6SoL3hBMwQhNvNKSUZuRDAK5GKdvr64/n6U9K/2
         AeVRFxe+kFU5U9zhVV+s8UER02onS0etyszBC2HoK62toB2QHprMnNxdXYMCBECwlTRT
         rBO1N1VAENJfHhIKqfJJhXxeu7IPsyk/SuSx9E1hvl74UwTBWt4vGEU1PvFOcMhxde0F
         VQsnst3AF2HA//jBguYl+gpGhdP4cdAVYopr1E6ZPjfluduqQOvSavDDTwlNa1R+znL0
         OQkA==
X-Gm-Message-State: AOAM533jsYpvfUliv8Ta2tU7B1jk5HI1Fyjd92QcPnUa4PHjC9VuWDEu
        mEwnl1EMLLGC9bALZMqViQ+8WNwxJg==
X-Google-Smtp-Source: ABdhPJzc+Xdp6Cr5oUM7VbNpIrtiS+7UL+jBSDnBa6TfMrhadriwd1pwXvzXZjLnGlgGS2iXEgJAb/bi7g==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a05:600c:24c:: with SMTP id
 12mr7649392wmj.124.1637223058978; Thu, 18 Nov 2021 00:10:58 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:05 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-2-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 01/23] kcsan: Refactor reading of instrumented memory
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

Factor out the switch statement reading instrumented memory into a
helper read_instrumented_memory().

No functional change.

Signed-off-by: Marco Elver <elver@google.com>
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

