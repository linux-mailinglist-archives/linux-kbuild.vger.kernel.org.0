Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6990463333
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Nov 2021 12:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241181AbhK3LuZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Nov 2021 06:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241154AbhK3Ltj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Nov 2021 06:49:39 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC64EC06175E
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:55 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id q7-20020adff507000000b0017d160d35a8so3531019wro.4
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SnYVQxLC6YSHg0QBspCa3KEICf+BvvptqJyS2cHTmDQ=;
        b=YAPrqaSvFXPKIyChd2B9G/mC+V4Jc4D9Ysa+dt9+gyWoCPV+nRINqJd57Duo402ra3
         fACCmxrugjWDUChLO48YEakWmtgKIBS2NenkgfzdEIUaFeOLMeRRLt3y3O0O8m42KVyP
         EYZTlGjECGMCo3XeJTyzQ9huKYBCMEUzAAG6gZ+6TrfzQbi+hkq/C1sNW9Osl71l2q00
         KnvJkh1XBMAWo2p+iVXz1ZScDqJ9cYV8qalOkG24HTG/65Ii8z7IiAdL8qvRMC2Opkvc
         XOyIIRR2dMM8QMdcIa4mT34J5n4EmvIPm98FB4otkGxOdejNKSt9f8kvehv1Vt3mjuJX
         t2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SnYVQxLC6YSHg0QBspCa3KEICf+BvvptqJyS2cHTmDQ=;
        b=uYMO3EaWnFZdqoEpN1b10gWPJVwYTPp7Wxke1USeLahRm0FT9ZyOCDAGhbL9YooWCq
         20hZ4+ncWuya5QATM6AjMcttrHNe2DG17KsAYTfHiWXv/1P3YhCHQnP8+ERClG9HON38
         axUnPvx2A30YyBLHeFk3LXz6n6z6wmwq4PHe4EOHAZBuA1bEpsz1fpVs4iWZxMhyj73V
         xKiL4E6M6VxW1fF7tkVkxls26nkXm7adkFlaf+oqXYSesxH59hlOm/q35OAbdTcBf1CZ
         TK8PmxGO2UL2V6jiB7hQF4id4FIDDbbSTMq0/Ya1337RMYjKKsZIuYAZr6TKIHK8JLRg
         WMqg==
X-Gm-Message-State: AOAM533DHTKjkZmFWteUGxVVsVO8esugwNCSCr78uSx5ngN8/8fEzXzO
        YIxMxPKqeyjijZ8SJCUFcjrRcfouOQ==
X-Google-Smtp-Source: ABdhPJy3VXvdk8vo/XrXiDkU+BIk+TJTbB/pqh504ouz3u8/5fsbp+KQ9JgMbQcOudhStkssJotFYNwe1A==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4f0b:: with SMTP id
 l11mr626057wmq.0.1638272754116; Tue, 30 Nov 2021 03:45:54 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:29 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-22-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 21/25] sched, kcsan: Enable memory barrier instrumentation
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

There's no fundamental reason to disable KCSAN for scheduler code,
except for excessive noise and performance concerns (instrumenting
scheduler code is usually a good way to stress test KCSAN itself).

However, several core sched functions imply memory barriers that are
invisible to KCSAN without instrumentation, but are required to avoid
false positives. Therefore, unconditionally enable instrumentation of
memory barriers in scheduler code. Also update the comment to reflect
this and be a bit more brief.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/sched/Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index c7421f2d05e1..c83b37af155b 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -11,11 +11,10 @@ ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 # that is not a function of syscall inputs. E.g. involuntary context switches.
 KCOV_INSTRUMENT := n
 
-# There are numerous data races here, however, most of them are due to plain accesses.
-# This would make it even harder for syzbot to find reproducers, because these
-# bugs trigger without specific input. Disable by default, but should re-enable
-# eventually.
+# Disable KCSAN to avoid excessive noise and performance degradation. To avoid
+# false positives ensure barriers implied by sched functions are instrumented.
 KCSAN_SANITIZE := n
+KCSAN_INSTRUMENT_BARRIERS := y
 
 ifneq ($(CONFIG_SCHED_OMIT_FRAME_POINTER),y)
 # According to Alan Modra <alan@linuxcare.com.au>, the -fno-omit-frame-pointer is
-- 
2.34.0.rc2.393.gf8c9666880-goog

