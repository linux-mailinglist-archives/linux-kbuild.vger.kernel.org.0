Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DF842246A
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 13:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbhJELDe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 07:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234686AbhJELDL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 07:03:11 -0400
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85C9C0613AE
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 04:00:26 -0700 (PDT)
Received: by mail-wm1-x34a.google.com with SMTP id f11-20020a7bcd0b000000b0030d72d5d0bcso1176403wmj.7
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FsZx+1aUI6aPLGHtJazoYidelDd+JHI3Oque8YR4DUc=;
        b=bncNaURV8U+L/MP6DHcifcIjKya0n67TGaPEehD44/Pm+KoCE66jdcQK6BvBN1e9Az
         i8wF59eNK3HPqwpVHP0CDCf0K3ZCa+f3rTCri6kjG1bvs7F4D3M9s9mornuL8qEbKzL+
         +E8fH1Qusqns6nKdkAHhbGvyRMRLCe8i+3G6SPHIsikTc5lIoDfY6r45Ini4E+cAjWtM
         2E5q28T9pRHC5H+nsJRK4cFWUYSUZw9yPMwgrB4sv5uhcKfNqrvZLb64Ee2fpNlI+SmB
         JwINLd+pzRyh2hQrT333/qEUgI3uFFDoSljZcofqNbVqmGfSecILtCPE6uNOTDyemEqj
         dP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FsZx+1aUI6aPLGHtJazoYidelDd+JHI3Oque8YR4DUc=;
        b=Na7Lw6MQkZZ1tH5JFmcj6khwJmShhX1PDtc59+lhEk9vQmzFHGrLiZjxGjwDjNv7u+
         6x9xxwsNvHJxMjW/lAeHGLEPHtFPOPnfbEEbD0tP7MhQs8cVOf3xjwx6vzMQI/2DZAyE
         HPZ1jZadFQM0FGukb7HiP7N44QEBq3VnPae9BQ5CbpF6kGxCIDcKysd7xCf2ZjT3A9JB
         /il9pmzBA0U2wj5UMRZHkWM1NjDl1fYZ61DiTwjxXmwMYrSEAzPRqSZczGH7QvB0ffPR
         nmnqAY2508JN8UGh74w7jt9MGw143X8Go9ktOdLy0MroO+dyroDaNtnrAZ9yZakN2ev+
         PFjA==
X-Gm-Message-State: AOAM5303MYM6tJhqtKT2g12U0TuYste2DTRFsOycdorcmMVFLuspr64e
        K4Q94t1/J8Nt4DrXBIw1Bp7wovk3Og==
X-Google-Smtp-Source: ABdhPJyDvlA4g8ipU5InCKw9mS62EE7qBbe4UjBC1Axj5ukt1gnSOvOZv1Ve5Dnwomu+Br87UdQC1JgBfw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a05:600c:4fc7:: with SMTP id
 o7mr2657914wmq.91.1633431625363; Tue, 05 Oct 2021 04:00:25 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:59:00 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-19-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 18/23] x86/barriers, kcsan: Use generic
 instrumentation for non-smp barriers
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E . McKenney" <paulmck@kernel.org>
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
2.33.0.800.g4c38ced690-goog

