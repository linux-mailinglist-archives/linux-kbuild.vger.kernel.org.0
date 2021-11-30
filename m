Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A282463322
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Nov 2021 12:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240991AbhK3LuQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Nov 2021 06:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241252AbhK3Ltl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Nov 2021 06:49:41 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09305C061763
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:58 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id v18-20020a5d5912000000b001815910d2c0so3522294wrd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JzBhpw0Qm81Z9lbF5IGyZhQAb+5o04LDLkCFlxupKLc=;
        b=pHRgTgtBe9w8GJo+UVuCrCXkkBePrXHeJXXGSGxiMQTDZhPB1HMZjVhCQEHB+8iuxA
         QTqapU0TX6O4TE0Y48efyZW2bq1hF37Xt0PGzM68wPVdqNEwB+3nHHqWFUL1gWu3kHtR
         Cq7Wrdud5dEh12cWU90OhIU4V/9Q7ULAOS9mOORJ6Eqe+R8j1ryew/Yd+VDrcTllPVFh
         5lcxmqYwyS4EYnDSPUY2x7vLF1W4hPQ8ICF36xbdENuMBTVVtdo+SbNEIlEehDKxtwYR
         kgzu3xNPjqGc6hHJvBg6+Ezt/2WHsUBVgd1XEwAmeXQPIFvn+uf/vjPzU0O+2NhHvmqd
         ksUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JzBhpw0Qm81Z9lbF5IGyZhQAb+5o04LDLkCFlxupKLc=;
        b=jgmyUpCuZq9hQMMv0nHgwohQsbP6xNHhx+D3CMu+//rhmPDTpq864I2uAyb5h2POfS
         jcqDdsb9ilpYjlBPDwYBms/iP2Ewab38dPeiy8u9+DDut4nRaLIy/FRacQWw+aTDNNeZ
         zyQiFK8lmxUsNOSKZ6B+Hl+E/csbaJYPuQIYmhuKx3rTd2xRJ7dzV9iLC5VD8MSATScc
         OUlAil3kXyNTxpTuYBs8HgYJuo59Vx76wGBi3vbyOAe1pgyZnoRYxODhPMZUqaLddRch
         cEr+vuR/aFJuD2SAx9PVQJ9g4dFOUcVCYi1+OgNtEiHnHqE9oRAgJ1Sy+ONWTNOZypqP
         DxEw==
X-Gm-Message-State: AOAM532Yfa6zLjga5s/AdTMAGQUH3ZxM9trahwWqyCN1kpOeA/WSvkBm
        lgkZr7xO8A5736dZbQOJWG/ymGXkvA==
X-Google-Smtp-Source: ABdhPJyGlw39n0+Jfq+xh033MGOvVeVGOoalcV20EEznri+jie430fZfA9+7esf3Wo7SpGvol2V1AwHpQw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a7b:cc8f:: with SMTP id p15mr4408290wma.129.1638272756667;
 Tue, 30 Nov 2021 03:45:56 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:30 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-23-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 22/25] objtool, kcsan: Add memory barrier instrumentation
 to whitelist
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

Adds KCSAN's memory barrier instrumentation to objtool's uaccess
whitelist.

Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 21735829b860..61dfb66b30b6 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -849,6 +849,10 @@ static const char *uaccess_safe_builtin[] = {
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
2.34.0.rc2.393.gf8c9666880-goog

