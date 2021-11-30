Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15D3463319
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Nov 2021 12:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241313AbhK3Ltz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Nov 2021 06:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241213AbhK3LtQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Nov 2021 06:49:16 -0500
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0942AC061399
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:46 -0800 (PST)
Received: by mail-wm1-x349.google.com with SMTP id p12-20020a05600c1d8c00b0033a22e48203so12699143wms.6
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JvNCvfwB/M304r5/BDcWOzh3dLnMrHum3apHlfxEx/4=;
        b=HGTmGOZbV8BO8UVwawHP2qaUUIQR8l5KZLll/+rqQfeQwOOUV8mNOVjYuSRralZ5Aj
         Twljfp8LxW2WknHiRqI9QoWbiqLagWNhyAuGUORzqavLTJN5zuDJkA6xswrqgI98Q+uE
         sGDIjOsQo9WMuJw/ByUioVp1OJy74McWnV33/n/ke3sFX2NvSAiuq9skxWedjHC8nrai
         PFaVXbEHKi7lgTq4v/bsg0Ngh7AzO5iLGy1cgulyhEEKXvYvFqiiN0vi/YfKe4jiq5uk
         +dCCCqPcYM82viw2lZRJNNCNvZn4sNAzh4K9IyWAuaDW1a3v+W75mITtZVW93eEWrquG
         Qiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JvNCvfwB/M304r5/BDcWOzh3dLnMrHum3apHlfxEx/4=;
        b=iTtUaTHl3FO8bsup9Od0PWGGU5TrgJOWn4r6WRH/zyK5vNE9HfkKqI5zg5ZOr6M7gu
         obStd1exSKVu+aWSIWMeGsvmp39qtfg9BGMWyoEvzErvEk5eEyzioWXr71jZqhecy3qT
         BDiQmUfUZ+Eh3utR/CkLBvYrwOALl/s6EBNLp8eQIKlG2l4ohe/Rvh2LR46cY7uDbBFZ
         vrQcp4ObRCRkgOO1GpguFtNrS6BSBSBZBW3a4OOQYbC2motIEGHQmUnAXyyp79W/W15g
         bW6+l5i2dF5hdPjYqJIlCzm5ydzA6Ybsw3KwDwAtdo1QcQFiBbUQTPkRJ/nHlixG+9J+
         4m3Q==
X-Gm-Message-State: AOAM533xaZrjFQa5ZCJmmq4+uBHHUwnQPmiunhHfjLjbfksbVuJHg7+m
        ngWU9Kc0HBUowdAAlfN196cR0u8npg==
X-Google-Smtp-Source: ABdhPJzSDzQegokGIwsGrKkVQ/IhdBWsBMMU4nwhK3bFeKxSJ75NPWkWR6nK52NPFK40FBPIH38r66gw+w==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:2e46:: with SMTP id
 q6mr4344091wmf.6.1638272744574; Tue, 30 Nov 2021 03:45:44 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:25 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-18-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 17/25] asm-generic/bitops, kcsan: Add instrumentation for barriers
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
2.34.0.rc2.393.gf8c9666880-goog

