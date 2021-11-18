Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F804556A8
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Nov 2021 09:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244384AbhKRIRP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Nov 2021 03:17:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244358AbhKRIQL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Nov 2021 03:16:11 -0500
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F18BC06118D
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:36 -0800 (PST)
Received: by mail-wm1-x349.google.com with SMTP id ay34-20020a05600c1e2200b00337fd217772so2723516wmb.4
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=T9LcpiESjlbrW6ACmq5IFNnAkv2Wwnn3szo64Ts4MTU=;
        b=n/UFmav1ENDv1h0WTCbIrOk73KwKcPYIyMh2kyYhwgQF7oBo7KaTGaEDsjUzXHoHMh
         Xi6CGU4q74OXQJGZDf1Jpb24tNMq/Zq7ELFRT33dDDe70MxRXxsWGk5pOk26Q4hqYxcg
         ezIn341A84Qv5ayPNZMP3vg5G0JMNuisUbOj1PxV04DqjHBw3bMLwFNaotZf/yktqEIK
         NyehNHEADWmBPRFTFKj4DnO3d84Q1Ob3Ptn3tV2x+1XKmjOp5QLjxUQ5NctWHvLViK88
         OniwqfsH6SGdMm3/fuZaONRHF3PE4nlH8yzFqUOG6EOGl7oro8kHw7g0cViqxPAquYJY
         HuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=T9LcpiESjlbrW6ACmq5IFNnAkv2Wwnn3szo64Ts4MTU=;
        b=sF0gxEpMzb8xGVgLUMtRqYNHXgv567YuLNH0q173zLy24ffLRpy9KzrIs0QYH0bhsS
         u9cwc2i2AvYNlYvTKM5r4CgRI3b5AzWin7GxRPtCrLs5jfCQyzKN1QrTM4tM3NMwA4Zu
         9G2imPhw0WF1aMji+PmVjAzmzStTuZmcyVJ3Th4ACaIa13HwKRA1dGFbkb3p3hMLtjec
         KfORXjOQKTtgzAM4JzzDIO/WdgANu71LoH7DTKPRgLVN+EdOYKE9ZBYutOjlzHlpbrTZ
         34F5NGzQl4M4MVIry/VraxbPM1YaZZnSlFNWEubwUpYmGn6nTVcor5EbyJ9XBVVTJLCY
         09JA==
X-Gm-Message-State: AOAM531+TBgLQAVbLyDLWBpBPeLb15R6d0QIVDcpt+Oum7Qo7b74M34m
        jdq7IbaXmiA+HEqtzgtBEOp1HV2zjg==
X-Google-Smtp-Source: ABdhPJzDuFmLudQnfsl3oBo9w+kUceIPU6SyWe+MGVHxuaPu65q9Yc11/mzBXR//E2asV/5c9jvF39wc4g==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a05:600c:350c:: with SMTP id
 h12mr7414150wmq.123.1637223094553; Thu, 18 Nov 2021 00:11:34 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:19 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-16-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 15/23] locking/barriers, kcsan: Support generic instrumentation
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

Thus far only smp_*() barriers had been defined by asm-generic/barrier.h
based on __smp_*() barriers, because the !SMP case is usually generic.

With the introduction of instrumentation, it also makes sense to have
asm-generic/barrier.h assist in the definition of instrumented versions
of mb(), rmb(), wmb(), dma_rmb(), and dma_wmb().

Because there is no requirement to distinguish the !SMP case, the
definition can be simpler: we can avoid also providing fallbacks for the
__ prefixed cases, and only check if `defined(__<barrier>)`, to finally
define the KCSAN-instrumented versions.

This also allows for the compiler to complain if an architecture
accidentally defines both the normal and __ prefixed variant.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/asm-generic/barrier.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index 27a9c9edfef6..02c4339c8eeb 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -21,6 +21,31 @@
 #define nop()	asm volatile ("nop")
 #endif
 
+/*
+ * Architectures that want generic instrumentation can define __ prefixed
+ * variants of all barriers.
+ */
+
+#ifdef __mb
+#define mb()	do { kcsan_mb(); __mb(); } while (0)
+#endif
+
+#ifdef __rmb
+#define rmb()	do { kcsan_rmb(); __rmb(); } while (0)
+#endif
+
+#ifdef __wmb
+#define wmb()	do { kcsan_wmb(); __wmb(); } while (0)
+#endif
+
+#ifdef __dma_rmb
+#define dma_rmb()	do { kcsan_rmb(); __dma_rmb(); } while (0)
+#endif
+
+#ifdef __dma_wmb
+#define dma_wmb()	do { kcsan_wmb(); __dma_wmb(); } while (0)
+#endif
+
 /*
  * Force strict CPU ordering. And yes, this is required on UP too when we're
  * talking to devices.
-- 
2.34.0.rc2.393.gf8c9666880-goog

