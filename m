Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A983382B5
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 01:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhCLAtw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 19:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhCLAtd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 19:49:33 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB60C061762
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:32 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id v6so27683853ybk.9
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Y+bQ/FvCUm3fvBgel5uQUEfp5fAIz/0D/2shjtjBBOQ=;
        b=XH46gyIVQlOmQFd/RmNS2UiHhzUpt2qt03RTF06Xnae6iCcw0dFPqWjKTPco+qP/Zx
         fB/uJw66ANkZSXLpgPZzsNiuQ09DnyCviGcpTgD8pTRezXmUpwZek+cB7Y/HvGxA8qch
         dFOUqeeMZ918ZEBhrbuNcNxKi6PRldR02Suyv0Yn8UZyobwAbNbMX7d8KutkSzRsxDGm
         0S6hbtJQ8Ws4a+nW+Glvo6IMRSySbHIstPjzQXpwjaBdZ61ql+77Yzbd9C2HqajlQ9bT
         al24/Uv71xlS2VCq05aPDtCBcnEMCW+8us1rt97YOCFL3l3qREf0N5Bb4Jekm29kn/qK
         q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Y+bQ/FvCUm3fvBgel5uQUEfp5fAIz/0D/2shjtjBBOQ=;
        b=o3TYubzVSo/zVBmDjfLjc1O2CvBmB4qEsxl8kFCsxDJPmWa2WDcJU/laJ+GYwxEXjx
         2YBq5YAcNEYlnchgbQnyAxU1qshYLmmLrRIfNdGxRrwlxsGjI1p6b705V/sa5QJ0z7A4
         OQYdl6SfoF4AnlCZNkH5tkvVxElfYPM1DTaSk0vPEDnStx8vAnATYDfc9OL9ZBPHkvFp
         KUiR0ozoI6v7W69mIuuGxjP+kgc41tsfEHm7u9fqVh8HbHWqcXvPkeb6IW/c75EvyWzr
         BrcD+Hd0U54vHKyHr4nh13l9gOqHuhkc1HXyDjCpocTYbcAh58B08DB2WGURNwOwnTeJ
         LT6A==
X-Gm-Message-State: AOAM532NfcVgIWFjoC+6VxeMupMO+o4d4/OYApoBaJp97IysnbnpwQc8
        xafOhRrBU8pHqVyuytl9Yw7LTBqwFg9ETq1FaqU=
X-Google-Smtp-Source: ABdhPJx7qHHoiwHh7Mz2oYX8+DonjBOnAMdcSWoE+4sImbjhV4Eew8XMTramdbIeYBSUSqj6zA5bpTyw6U5L5XSs8WU=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c86b:8269:af92:55a])
 (user=samitolvanen job=sendgmr) by 2002:a25:1d88:: with SMTP id
 d130mr15900461ybd.446.1615510171706; Thu, 11 Mar 2021 16:49:31 -0800 (PST)
Date:   Thu, 11 Mar 2021 16:49:08 -0800
In-Reply-To: <20210312004919.669614-1-samitolvanen@google.com>
Message-Id: <20210312004919.669614-7-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210312004919.669614-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH 06/17] kthread: cfi: disable callback pointer check with modules
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
__kthread_queue_delayed_work from a module points to a jump table
entry defined in the module instead of the one used in the core
kernel, which breaks function address equality in this check:

  WARN_ON_ONCE(timer->function != kthread_delayed_work_timer_fn);

Disable the warning when CFI and modules are enabled.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/kthread.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 1578973c5740..af5fee350586 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -963,7 +963,13 @@ static void __kthread_queue_delayed_work(struct kthread_worker *worker,
 	struct timer_list *timer = &dwork->timer;
 	struct kthread_work *work = &dwork->work;
 
-	WARN_ON_ONCE(timer->function != kthread_delayed_work_timer_fn);
+	/*
+	 * With CFI, timer->function can point to a jump table entry in a module,
+	 * which fails the comparison. Disable the warning if CFI and modules are
+	 * both enabled.
+	 */
+	if (!IS_ENABLED(CONFIG_CFI_CLANG) || !IS_ENABLED(CONFIG_MODULES))
+		WARN_ON_ONCE(timer->function != kthread_delayed_work_timer_fn);
 
 	/*
 	 * If @delay is 0, queue @dwork->work immediately.  This is for
-- 
2.31.0.rc2.261.g7f71774620-goog

