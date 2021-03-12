Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058B93382B0
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 01:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhCLAtw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 19:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbhCLAtb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 19:49:31 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F12C061764
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:30 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id h134so17067209qke.1
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2z/Ob1KBSYIAdbfAk0R8ty/tB7fYk5G7Uqr3Tkugs0A=;
        b=HXPIDqa3ilGnJfXXoaPlqtVCFft699aj6X1ZgyB1edbMPQPGqWRvnSWZM4YgmX9SfS
         3ai3WwuU9qOd0PYVJS9vjneegm7E54NnFeGwEOCUHbNdHvUn2KYwFAWWD7Pxy3fIn3E/
         Xfc3wWCi1FV1pTsSPX5eZF1qhXdNrnpKo0UFrfSlSrezhbnHE7WrcLiWsJy6Z1imXMmE
         pl1XcbcWcj4yrpQwP/dZH8xKo9yLMRnz8bwEcH3ft5LkLXj253WTgB0wfiVs3cKNmE17
         K0+LGQopZnN8pk84JQhOYLnPPcleS7MhWgmP9inB9s0BQW9FAKFgH6iAODcOkHJeB8Ze
         fIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2z/Ob1KBSYIAdbfAk0R8ty/tB7fYk5G7Uqr3Tkugs0A=;
        b=EjFFXHNyvp0WJxe0NgsT5YJV0PIxC3VjyLiKwfkdRY1x/XxP/AqdaQlKSPpqc5toY3
         M/obaOLcFAJAFVce5em3UNuj6H4ADwCXI5De/VFiPx50DPP+AURUTB/27rWJM3GI/s6h
         chv1PAG8RlSDTbgSQJ2gu4kPCxHfcETiJfazSAWyeHaOUsUnZlKe9TDbrQN1mJuPEVEy
         9qYRzkHDTdcSP/sHO7t1L8xuW1DGnJ+ppkUl/41272pE0Zc6vZRIXHsGRw0TkbblWe4m
         JJSe5FE5bXYyWribGcJ48FYHjdis/9xxhMaZYXlhMP1wM4Hl70EudnYgiSvF6QHN1JGu
         LDJA==
X-Gm-Message-State: AOAM530VjG/ytM26Bpx4QEG7xF7asgEkQt969J3CtiiT1nC0oogZh9GK
        Ep9eQRKASn8BXTJCAvMMHXpcU8XSjfJMyXY/2T4=
X-Google-Smtp-Source: ABdhPJxHDKETbYeoueGPafrW3BI4Uh5lPSvgOdjIw/MXWNb4TTLYLuJccKyo+tYRBmtObEJFt+syMJh09rwfHBLme60=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c86b:8269:af92:55a])
 (user=samitolvanen job=sendgmr) by 2002:ad4:5887:: with SMTP id
 dz7mr10214152qvb.12.1615510169805; Thu, 11 Mar 2021 16:49:29 -0800 (PST)
Date:   Thu, 11 Mar 2021 16:49:07 -0800
In-Reply-To: <20210312004919.669614-1-samitolvanen@google.com>
Message-Id: <20210312004919.669614-6-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210312004919.669614-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH 05/17] workqueue: cfi: disable callback pointer check with modules
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_CFI_CLANG, a callback function passed to
__queue_delayed_work from a module points to a jump table entry
defined in the module instead of the one used in the core kernel,
which breaks function address equality in this check:

  WARN_ON_ONCE(timer->function != delayed_work_timer_fn);

Disable the warning when CFI and modules are enabled.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/workqueue.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 0d150da252e8..4db267e5ad2d 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1630,7 +1630,14 @@ static void __queue_delayed_work(int cpu, struct workqueue_struct *wq,
 	struct work_struct *work = &dwork->work;
 
 	WARN_ON_ONCE(!wq);
-	WARN_ON_ONCE(timer->function != delayed_work_timer_fn);
+	/*
+	 * With CFI, timer->function can point to a jump table entry in a module,
+	 * which fails the comparison. Disable the warning if CFI and modules are
+	 * both enabled.
+	 */
+	if (!IS_ENABLED(CONFIG_CFI_CLANG) || !IS_ENABLED(CONFIG_MODULES))
+		WARN_ON_ONCE(timer->function != delayed_work_timer_fn);
+
 	WARN_ON_ONCE(timer_pending(timer));
 	WARN_ON_ONCE(!list_empty(&work->entry));
 
-- 
2.31.0.rc2.261.g7f71774620-goog

