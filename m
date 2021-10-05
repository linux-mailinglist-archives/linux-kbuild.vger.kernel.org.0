Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D30342245F
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 13:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234611AbhJELDQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 07:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234454AbhJELCz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 07:02:55 -0400
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7D3C06139D
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 04:00:19 -0700 (PDT)
Received: by mail-wm1-x349.google.com with SMTP id y23-20020a05600c365700b003015b277f98so923334wmq.2
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bAriFda77KQSvkeLAdzIsmSKLo4uFZFQooRrd/rm25s=;
        b=ets2sLEUSeqf2WMRaL5hYWDn8l6wE1b2w/7sDfXLO4KLhXBCQaC4kOgTp19Encefnw
         jYlLY4PKK2IXcJgFESqwEwHrZ5Td7G1niHpPxgaOkxLTiG61GgRatpK7/qrJkQXD7oP9
         yaY9tMHF1HG+L9wTNS1oF4p+m/n35XBPrQDyduB0jHpnbJDmIoe1ltVAk5mXWxmU1jVM
         pUH1claWzDggDOIxpc04wW2LCQRNVt+OSpPe5M8kEB7gcagf6pi5RmJ/PcJruJkwx9UN
         cJTZy5YARZkTft5TnnPUQHgutpPljmQ+lyq6vgDFFUpJk/MWohfufIVbaPqOOABrRjWb
         6kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bAriFda77KQSvkeLAdzIsmSKLo4uFZFQooRrd/rm25s=;
        b=CcHD53s3P8EHSiFjMpR/BZNuLjFz1QlZK/efPvfP4CGmYQeMU+6GZ7uhhui2sjMFhG
         86I5eZhMeqD9mrKTLUoIv/GsBLvU1FATpOc+VnP/gTPSBISIcfbVUaM1byW8mVKg6FKy
         tEUax9ldM3+nPhiUvyI3LdFIg351iWWN88BeHr9aootp9WK+Ua8fxD3vwCpapnTQ8aaw
         k8BEQeIUPhvWo44HDi/swF4II2GkxQ72CcuMmBUN0H4RmAtKTxgmKKbdUBtznRpzlx/5
         9hmMmy5RZbMTCaig6pyBS5Q5a1L+YgtHuZbT227Y8J66lYa5qhswYiXWzKfcE9HqyBjw
         7a8Q==
X-Gm-Message-State: AOAM530jE0LoMR2TIN+0R8xGnOqYQnc3aPSMOccMuKB/A8GK4Hzuv/Xy
        3XkhQNa9AVg1BiOEJSvGQFD36wqhXA==
X-Google-Smtp-Source: ABdhPJxwiOSTStDBneaFQWWQkzxn7TeSivNZJE5WBv37pW+d6gP/rGHoYZw5KmilYcs0foSm3DlIC4Lt7Q==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a5d:6084:: with SMTP id w4mr17452146wrt.176.1633431618057;
 Tue, 05 Oct 2021 04:00:18 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:58:57 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-16-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 15/23] locking/barriers, kcsan: Support generic instrumentation
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
2.33.0.800.g4c38ced690-goog

