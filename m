Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D4142246F
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 13:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbhJELDm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 07:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234629AbhJELDR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 07:03:17 -0400
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com [IPv6:2a00:1450:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC6DC061768
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 04:00:29 -0700 (PDT)
Received: by mail-wr1-x44a.google.com with SMTP id r15-20020adfce8f000000b0015df1098ccbso5600766wrn.4
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DahfAT1Q5cTf5jxzmYjgaD95bFaAqh3xNJSBaROtoZ0=;
        b=lZfIqlUUqz7u5X/s/XmXxONKoH9HGZb4q0bpmoH4oihbA1XE3i5nHsIkL+hhCtJY3V
         gvIsY4OWMufkNrB7mXwRc/5nRf82JskqH8iyqHsmDzenzSo5P9uZ25rWIHXuKezfeurA
         B74KPFJzmNJFKW7vg3RQDckzc/MhOSxFUgw2zBgmiDHU3+6zwQIJVSxRK/TWkrJ4haeu
         ywrJxCJ3JEFT5zH9aUCCBMUsDT3e7OW0ae9Urmv2YygyzamAKu3iAJNUfU2O0AIeIRRr
         7x7Gtk3YUtwPTPnoUXRcFSZRNAMXe8e7SjzOqwOs9ulzJpZAGRgyV4tIO2+HucspCIGw
         JA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DahfAT1Q5cTf5jxzmYjgaD95bFaAqh3xNJSBaROtoZ0=;
        b=4jNfYe4FiSvxIy5Ta51mWCixa2+V41+uxTkjH4bM2GuuBtyLGTnpau5sie6LxEd9Fl
         sSEHSWFZAN5OVCCM1zsF5VNqYO6kPtm4ChAH/evgqFcZIFAnf2o+L4TOoqM5fMAKTgkQ
         o/IHjloHuuN2RdPuUrYs8j/GC3ycuBo9rRtsINUs94fjaeXU1znzmd4E6dJHkykfbVuf
         ro4xsoMNN9YN3eKlIC7POePPMk0s++r6ftiHxlVCOfRT45i3WsPx/F6EJtULVd096+4N
         QME2leKjFMYqYwY9RX9WJSRMV8diVq8yZpMHGAZZUW5H8OEJRTZo1i5GX7Qro4krfHBG
         N5xg==
X-Gm-Message-State: AOAM5333zSlNylWw+yqVbHwEV2kptYOwfEbmDMI3AR4PRF5VRo94Gv8w
        mcJHpKo/MlNfNisMWZjhkYoHuudyrw==
X-Google-Smtp-Source: ABdhPJxJAoPskpWSnMop/lTO76OUSxjnhmwBrh54jf8LKDoRw6BSA+ERe7cvgmB0awg4h7LA7Ty/9GLR1g==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a1c:ed0a:: with SMTP id l10mr2762058wmh.140.1633431627680;
 Tue, 05 Oct 2021 04:00:27 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:59:01 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-20-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 19/23] x86/qspinlock, kcsan: Instrument barrier of pv_queued_spin_unlock()
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

If CONFIG_PARAVIRT_SPINLOCKS=y, queued_spin_unlock() is implemented
using pv_queued_spin_unlock() which is entirely inline asm based. As
such, we do not receive any KCSAN barrier instrumentation via regular
atomic operations.

Add the missing KCSAN barrier instrumentation for the
CONFIG_PARAVIRT_SPINLOCKS case.

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/x86/include/asm/qspinlock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/qspinlock.h b/arch/x86/include/asm/qspinlock.h
index d86ab942219c..d87451df480b 100644
--- a/arch/x86/include/asm/qspinlock.h
+++ b/arch/x86/include/asm/qspinlock.h
@@ -53,6 +53,7 @@ static inline void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 
 static inline void queued_spin_unlock(struct qspinlock *lock)
 {
+	kcsan_release();
 	pv_queued_spin_unlock(lock);
 }
 
-- 
2.33.0.800.g4c38ced690-goog

