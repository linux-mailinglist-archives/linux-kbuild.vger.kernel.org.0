Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4062F42247B
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 13:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbhJELEC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 07:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbhJELDf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 07:03:35 -0400
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com [IPv6:2a00:1450:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843DEC06135F
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 04:00:36 -0700 (PDT)
Received: by mail-wr1-x44a.google.com with SMTP id x2-20020a5d54c2000000b0015dfd2b4e34so5579059wrv.6
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HKI+TnuwkVzGQacqSxDdhV83/KyiTPOZkFDvUOmoq5w=;
        b=drtT1iGcO3gVywE5+7iiUB+0nkm0x2iHratGhz1+VgZ3S9aL3d85rt7o2hkguAv57j
         mYu/ECwQYFZKPddmRj18p6tT9dppN3hIRKLF/GDbnWAhASokfzi971xdwXFJUWzX/OVB
         IrfukrFN921mvm9vOqZqpJB4Cw82TTkrdJ0gyTWK3Hj1qEp9c15e8MmxKCo3Wk155Sht
         daLsdqNyd894MD9YepBYTRw81E3D1q838qAaUrFaUNRaCD8L1rAGhpvD+dyphBPQNEds
         Ghc1MsrGDBNuQQDgTGlUeYdgZUt3Q/TVBpyVfX4gbszogoVCovBzfct5itUMq1L63oB7
         Iolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HKI+TnuwkVzGQacqSxDdhV83/KyiTPOZkFDvUOmoq5w=;
        b=zKeUT2bSE79Ov46GrH6uEwcSw+2mHoYig6r5e9IrNCsXjvse1Ui0LBD8TntJ+nmXcV
         KiqBqo1Gb0piw5Q/0zLf7Uue3AufKYAiWBOhO73957eaipQLtaHkjAIMQYnZfrIHFMq0
         V098KGLPd2EaP5tCvwDGF50cpUKAyaLAphZKSnv3KbrnppfZU7I7McJ7RTdlh1suwDsi
         YsusapQ0O+IbkU3/W9VaVEDrxa1L11SCaWyaPEw/MVNCM3dQT3M9/BxDubO7x9kmquV0
         dPdjvYHm4Ue7OwpXqNU8G/M/9ZBFkHIbAY69Upl/TIhh1bnhUn3uWKASsuCpnF7n3+dV
         G4sg==
X-Gm-Message-State: AOAM530vznfgFp2dBj1LbK0uDXVk2uKj6aznDLNCDmdw65h8BbTJPxMu
        hGsBfC+TxX52NG9Qx/0fM+VoREE8XA==
X-Google-Smtp-Source: ABdhPJwXAWBk8ymGDBMpf3SYMhCr7mdIwIo84alxZ309ddgJ/+Ku3X3widAzFVRKQyAwYDxE9VpI1KyKrg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a05:600c:3b26:: with SMTP id
 m38mr554577wms.0.1633431634472; Tue, 05 Oct 2021 04:00:34 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:59:04 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-23-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 22/23] objtool, kcsan: Add memory barrier
 instrumentation to whitelist
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

Adds KCSAN's memory barrier instrumentation to objtool's uaccess
whitelist.

Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e5947fbb9e7a..7e8cd3ba5482 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -651,6 +651,10 @@ static const char *uaccess_safe_builtin[] = {
 	"__asan_report_store16_noabort",
 	/* KCSAN */
 	"__kcsan_check_access",
+	"__kcsan_mb",
+	"__kcsan_wmb",
+	"__kcsan_rmb",
+	"__kcsan_release",
 	"kcsan_found_watchpoint",
 	"kcsan_setup_watchpoint",
 	"kcsan_check_scoped_accesses",
-- 
2.33.0.800.g4c38ced690-goog

