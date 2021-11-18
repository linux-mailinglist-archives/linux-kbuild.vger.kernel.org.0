Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD02C4556BE
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Nov 2021 09:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244324AbhKRISE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Nov 2021 03:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244321AbhKRIQ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Nov 2021 03:16:56 -0500
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com [IPv6:2a00:1450:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B953C06122B
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:43 -0800 (PST)
Received: by mail-wr1-x44a.google.com with SMTP id p17-20020adff211000000b0017b902a7701so869513wro.19
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FxnGx7glVXa5fb5vt97IxdOcLQo6ydeIuX4RCBDcgdw=;
        b=JzkdiCAfhGg1puCqyu7Gsl+OgpTDx9etUPuyNiUexgDmRwNvmteFPISWaLcOxGAqLq
         9DosLJK7r1BjtZ7VJduWE8TJKifTcPcJfLgzlYGR3Z/kyu7tjT3NHRQHF9l24ehmTlCC
         orKe2mqttixGcaP/+prUUVqGluahucnMKt5EtPGuD0ppVMZmAzuCqMPxo7nPc3FNfKFz
         ATUxY5vds/9KHGWQHQ6sYWo/VlJRQ+rYWLpPTW6oGYbaZzWbbyAYQVUWXGYRAhjg302o
         o/DdWseUPPUOUUpUFbVVaoFnkBSoDqCEeTVPtHy2ouz2y3UlkvpRPpISS4SSx05GZlzo
         wxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FxnGx7glVXa5fb5vt97IxdOcLQo6ydeIuX4RCBDcgdw=;
        b=bTkSZWQ+TDipijTPZvteg5FOlEfpHJ5kjkKF3DtWGG4i3J6n/z+MGcVGCDfYgqPaUi
         ZXu9pNUEhPm5Xt3nBMldrRdZpCrDKfNu28QZuIb64NZ8P6E8AjUxSPg99xWtZq8j1hPS
         Cpt2KhdAql7GPJZfoQ6FGuhFViGemKfN7kvcB050hNmebB8PRAeMlY1+/IhednGcIhEh
         NgCqB8b6BHT9qoHZi3+A5Rm1hS3Ak2IGkoktqkXXuuOYgBlhSBWCB3O7zye4DFz0Mie2
         b874NyiBpyxgvE3gzdWmPsiggMt0ZGm89GWf0xADgKnB1E9jQbHx2JcIGbmAPBWiuDze
         x0ig==
X-Gm-Message-State: AOAM5317DIrL7EYxXmy1S2TXIhNwRhNkvoO8ufQdyfl3QUh9nwtojDe1
        mHq4btppw+FG8GeTGOFRp27R8emTEA==
X-Google-Smtp-Source: ABdhPJz6FEP6GyzxCsPawUoKdjXDHZ0RCNsA/bONWiEy1yb4suQyU+ePefNEIdgwlRx7lrw+TRjThbgJRw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a05:600c:1d01:: with SMTP id
 l1mr7928633wms.44.1637223102036; Thu, 18 Nov 2021 00:11:42 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:22 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-19-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 18/23] x86/barriers, kcsan: Use generic instrumentation for
 non-smp barriers
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

Prefix all barriers with __, now that asm-generic/barriers.h supports
defining the final instrumented version of these barriers. The change is
limited to barriers used by x86-64.

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/x86/include/asm/barrier.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/barrier.h b/arch/x86/include/asm/barrier.h
index 3ba772a69cc8..35389b2af88e 100644
--- a/arch/x86/include/asm/barrier.h
+++ b/arch/x86/include/asm/barrier.h
@@ -19,9 +19,9 @@
 #define wmb() asm volatile(ALTERNATIVE("lock; addl $0,-4(%%esp)", "sfence", \
 				       X86_FEATURE_XMM2) ::: "memory", "cc")
 #else
-#define mb() 	asm volatile("mfence":::"memory")
-#define rmb()	asm volatile("lfence":::"memory")
-#define wmb()	asm volatile("sfence" ::: "memory")
+#define __mb()	asm volatile("mfence":::"memory")
+#define __rmb()	asm volatile("lfence":::"memory")
+#define __wmb()	asm volatile("sfence" ::: "memory")
 #endif
 
 /**
@@ -51,8 +51,8 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
 /* Prevent speculative execution past this barrier. */
 #define barrier_nospec() alternative("", "lfence", X86_FEATURE_LFENCE_RDTSC)
 
-#define dma_rmb()	barrier()
-#define dma_wmb()	barrier()
+#define __dma_rmb()	barrier()
+#define __dma_wmb()	barrier()
 
 #define __smp_mb()	asm volatile("lock; addl $0,-4(%%" _ASM_SP ")" ::: "memory", "cc")
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

