Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A51B46330E
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Nov 2021 12:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241027AbhK3Ltm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Nov 2021 06:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241179AbhK3LtK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Nov 2021 06:49:10 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC52C0613FD
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:38 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id y141-20020a1c7d93000000b0033c2ae3583fso10288748wmc.5
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HO2j8fDcTjG33FWF1g1vyRfUzwW+oeuePm13p24Xfnw=;
        b=sAns+f6z6lC9Rzr6sv1VOaF9Z+/b9Rm7Fc6eiv8LDEf1/K8jbpxDmmnPBMBZfSxySX
         dTpjl3fNGMy78twn2A4yIBadlhfaWtCCsObqHVem6zBDVFZVCC4n+IQUTL7f0sQCFvwb
         o57Imh2NYHQtkXdFhwKWYCTpsWBhlOl1CCg0T4fc9xHd4rCYaw53hmF7vk0QAz6SS6GP
         wIiH+wJJ9skB13S9TyInZZn9WwBTgfFJcdUIkQyoG9cGBoOA6WySIvzdR0anU8rbzqLX
         RWbyTf4PvpmsxkiuslYmzwxUNIXoBo8PPE9Ue6o5o9xu9E1j8Bu4cV0qwZSk4l4zKZky
         Ogjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HO2j8fDcTjG33FWF1g1vyRfUzwW+oeuePm13p24Xfnw=;
        b=njYH79ebp0B8IxpEyyPnXK/lqN4u3nw+2QnITFvgPuqg0VwLqfdDggEdJQAO/uaMSh
         rM9QaUayWiDwiNsSPvljA/6xuqB2VCvNlcBvF4yKPKcJO6F/kdznUOlQ8pbaAUiHzTXY
         BWc5pkLf7KEXjKpjh+LfhYdYCpqV3TgLbTHpkXTglDl1t/+JycD3Ec43w8mGACSVO0gm
         cs5PL+jEK8V2BY9S+xy803ofms4kOOU7tnj/5wP2GzlbNrSCkS2f6v8KJ2F/wsX0Q1Nq
         Y7gQwr4jmdQ6LR8902Srw2zUjncmjiqbuLRxfC7uJrY7NRGZHQ+dlZmrJV5CRHClBDs4
         BQWQ==
X-Gm-Message-State: AOAM532ybtxuMFW2onAFAhFF/KpqHlcH5G23wW8ecvgNGlstXmhs40Af
        9jLwiT7s1SjlWjJMSCuP+3rK4Tlkzg==
X-Google-Smtp-Source: ABdhPJx2Rz4y/jenX9xM8/e7rGubW4uw91rJcNHmjU3XY1sl9Bg9qcjG6x+0kmUf26GRvGsaHzk4ZiHgag==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4308:: with SMTP id
 p8mr4243163wme.132.1638272737238; Tue, 30 Nov 2021 03:45:37 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:22 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-15-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 14/25] locking/barriers, kcsan: Add instrumentation for barriers
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

Adds the required KCSAN instrumentation for barriers if CONFIG_SMP.
KCSAN supports modeling the effects of:

	smp_mb()
	smp_rmb()
	smp_wmb()
	smp_store_release()

Signed-off-by: Marco Elver <elver@google.com>
---
 include/asm-generic/barrier.h | 29 +++++++++++++++--------------
 include/linux/spinlock.h      |  2 +-
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index 640f09479bdf..27a9c9edfef6 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -14,6 +14,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/compiler.h>
+#include <linux/kcsan-checks.h>
 #include <asm/rwonce.h>
 
 #ifndef nop
@@ -62,15 +63,15 @@
 #ifdef CONFIG_SMP
 
 #ifndef smp_mb
-#define smp_mb()	__smp_mb()
+#define smp_mb()	do { kcsan_mb(); __smp_mb(); } while (0)
 #endif
 
 #ifndef smp_rmb
-#define smp_rmb()	__smp_rmb()
+#define smp_rmb()	do { kcsan_rmb(); __smp_rmb(); } while (0)
 #endif
 
 #ifndef smp_wmb
-#define smp_wmb()	__smp_wmb()
+#define smp_wmb()	do { kcsan_wmb(); __smp_wmb(); } while (0)
 #endif
 
 #else	/* !CONFIG_SMP */
@@ -123,19 +124,19 @@ do {									\
 #ifdef CONFIG_SMP
 
 #ifndef smp_store_mb
-#define smp_store_mb(var, value)  __smp_store_mb(var, value)
+#define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
 #endif
 
 #ifndef smp_mb__before_atomic
-#define smp_mb__before_atomic()	__smp_mb__before_atomic()
+#define smp_mb__before_atomic()	do { kcsan_mb(); __smp_mb__before_atomic(); } while (0)
 #endif
 
 #ifndef smp_mb__after_atomic
-#define smp_mb__after_atomic()	__smp_mb__after_atomic()
+#define smp_mb__after_atomic()	do { kcsan_mb(); __smp_mb__after_atomic(); } while (0)
 #endif
 
 #ifndef smp_store_release
-#define smp_store_release(p, v) __smp_store_release(p, v)
+#define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
 #endif
 
 #ifndef smp_load_acquire
@@ -178,13 +179,13 @@ do {									\
 #endif	/* CONFIG_SMP */
 
 /* Barriers for virtual machine guests when talking to an SMP host */
-#define virt_mb() __smp_mb()
-#define virt_rmb() __smp_rmb()
-#define virt_wmb() __smp_wmb()
-#define virt_store_mb(var, value) __smp_store_mb(var, value)
-#define virt_mb__before_atomic() __smp_mb__before_atomic()
-#define virt_mb__after_atomic()	__smp_mb__after_atomic()
-#define virt_store_release(p, v) __smp_store_release(p, v)
+#define virt_mb() do { kcsan_mb(); __smp_mb(); } while (0)
+#define virt_rmb() do { kcsan_rmb(); __smp_rmb(); } while (0)
+#define virt_wmb() do { kcsan_wmb(); __smp_wmb(); } while (0)
+#define virt_store_mb(var, value) do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
+#define virt_mb__before_atomic() do { kcsan_mb(); __smp_mb__before_atomic(); } while (0)
+#define virt_mb__after_atomic()	do { kcsan_mb(); __smp_mb__after_atomic(); } while (0)
+#define virt_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
 #define virt_load_acquire(p) __smp_load_acquire(p)
 
 /**
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index b4e5ca23f840..5c0c5174155d 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -171,7 +171,7 @@ do {									\
  * Architectures that can implement ACQUIRE better need to take care.
  */
 #ifndef smp_mb__after_spinlock
-#define smp_mb__after_spinlock()	do { } while (0)
+#define smp_mb__after_spinlock()	kcsan_mb()
 #endif
 
 #ifdef CONFIG_DEBUG_SPINLOCK
-- 
2.34.0.rc2.393.gf8c9666880-goog

