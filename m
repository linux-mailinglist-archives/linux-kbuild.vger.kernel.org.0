Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96EE4422465
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 13:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbhJELDU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 07:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234656AbhJELDA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 07:03:00 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD0DC0613A9
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 04:00:23 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id fv11-20020a056214240b00b00382e9471ed6so4750492qvb.4
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=aJbTcuURS/chesQOBDsBj7S41hJcRc/zL/qDV/Um5us=;
        b=BbV5uAK97obmNYDliUtqw0GOKWU8gRY8670jg0FGkfCOl/BDOBUmvDlO6y+6Nw4Jgn
         CfJN7QglUerqcxhodLjEyBZShqp4ICKrf4W5xF34Vl5c5QKflyz98mLQU//FeWddOm2e
         p/uR5E2cuLHejLdL8vN8jRxSsC4BcY9UOkkNxSr0C7fJ7qv75CXtp4D3Ic92scHPNmif
         dD338wArlvfKbLVVOSM+Nw9cqI/cJgYIsB/FYIikM+8eanE27mb2CRogMrrq2fTAUK7N
         5KvvRfLb6EijEfArLGnmjYZ5E3/gz/90hEH6UQiVZRzs8RZ5JrdlRULHMetclefDRlYT
         Tgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=aJbTcuURS/chesQOBDsBj7S41hJcRc/zL/qDV/Um5us=;
        b=RbJ6gHiZjA2GK5AvKkvoUc9OZMtym32RM0qrJZ8OCGTKZpRKG+psuCk6WQd+770ofk
         bVChsXuIx3ZnkHmPUHuAmm+5iBY8u9nrB6VHia/IHJXLghMX6HEntw+/fevJdAYlfCmZ
         XgcKzGxg13f+TIhUjhj3k5a0gP7//GFqAgEU4zpRsnvBd0NCCYc43yAH31YX0/cEnNWU
         Ryb5Mwtuqe9/NKTB4+Q+qorZB1NxAr1hO8xaf9rqEQ5vkfFfxw+przTtUz/mDBXFZwLh
         ynIP41jEEzrVaGEXcxe8Th5x4G6P0I8RoraBu+RZJVxPEDfjpnEcEzz+6fL+VoC37Fey
         Fllg==
X-Gm-Message-State: AOAM533qejxDWI4UkPlj7T4KTHbttc+TidI4wbjd20lyfEMhG5L2MqUY
        YxODm0vN7FQbOskMbh9fLuVjhgArtA==
X-Google-Smtp-Source: ABdhPJxFPawR3DIW3jGpiP41o9DqoiOU2oJs+4Aki7E3BJ7Dw7hLuRBw5fCDg3CS98qZ1Osa83SG8HjgJg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a05:6214:1022:: with SMTP id
 k2mr27294558qvr.53.1633431622928; Tue, 05 Oct 2021 04:00:22 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:58:59 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-18-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 17/23] asm-generic/bitops, kcsan: Add
 instrumentation for barriers
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

Adds the required KCSAN instrumentation for barriers of atomic bitops.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/asm-generic/bitops/instrumented-atomic.h | 3 +++
 include/asm-generic/bitops/instrumented-lock.h   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/asm-generic/bitops/instrumented-atomic.h b/include/asm-generic/bitops/instrumented-atomic.h
index 81915dcd4b4e..c90192b1c755 100644
--- a/include/asm-generic/bitops/instrumented-atomic.h
+++ b/include/asm-generic/bitops/instrumented-atomic.h
@@ -67,6 +67,7 @@ static inline void change_bit(long nr, volatile unsigned long *addr)
  */
 static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
 {
+	kcsan_mb();
 	instrument_atomic_read_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_set_bit(nr, addr);
 }
@@ -80,6 +81,7 @@ static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
  */
 static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
 {
+	kcsan_mb();
 	instrument_atomic_read_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_clear_bit(nr, addr);
 }
@@ -93,6 +95,7 @@ static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
  */
 static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
 {
+	kcsan_mb();
 	instrument_atomic_read_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_change_bit(nr, addr);
 }
diff --git a/include/asm-generic/bitops/instrumented-lock.h b/include/asm-generic/bitops/instrumented-lock.h
index 75ef606f7145..eb64bd4f11f3 100644
--- a/include/asm-generic/bitops/instrumented-lock.h
+++ b/include/asm-generic/bitops/instrumented-lock.h
@@ -22,6 +22,7 @@
  */
 static inline void clear_bit_unlock(long nr, volatile unsigned long *addr)
 {
+	kcsan_release();
 	instrument_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	arch_clear_bit_unlock(nr, addr);
 }
@@ -37,6 +38,7 @@ static inline void clear_bit_unlock(long nr, volatile unsigned long *addr)
  */
 static inline void __clear_bit_unlock(long nr, volatile unsigned long *addr)
 {
+	kcsan_release();
 	instrument_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___clear_bit_unlock(nr, addr);
 }
@@ -71,6 +73,7 @@ static inline bool test_and_set_bit_lock(long nr, volatile unsigned long *addr)
 static inline bool
 clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
 {
+	kcsan_release();
 	instrument_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_clear_bit_unlock_is_negative_byte(nr, addr);
 }
-- 
2.33.0.800.g4c38ced690-goog

