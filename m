Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087E2340B4A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Mar 2021 18:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbhCRRMM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Mar 2021 13:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbhCRRLk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Mar 2021 13:11:40 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF89C061760
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 10:11:40 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id ga11so14972138pjb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bxVrKYuxs5XU9fnnKC3lGs6PXwAVYnFmVHHh5prD+bw=;
        b=OQNEk3oOQ5hAytzarvFWWb63NfdPj+7PTKDlFTBcFLAUjEi2vCHNZnRQJ3JbBhmokW
         7ygxqd9DvZZ+lHCZ2pGj3ZIL4B9bNb7BUkvcBJ/5vdPDvwSmaPRpk5kEx1pnn0fyhAGH
         V9yx9+Kvg6PMJmO7Vmd8ACDeVgvkNvq+CcQdwoqXDE4O2M0XZ+VWAInjgXiw4J+4web9
         fWA+eQ8WVG97seli+TR+7Mx+62ki2Wn5MgzOGHqutKgMBINZEbFIcmHf0xZRCWdLhZsG
         MaaWJprhgnZ6mFcd0vrxtW9J8nLBK5CoUHFNoYcbdMOvzP7gePSn478jGBtjUgIu7qQz
         iy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bxVrKYuxs5XU9fnnKC3lGs6PXwAVYnFmVHHh5prD+bw=;
        b=V804eUkO6EnfOdplt4fPWFsDfkA9/Vtv5ZKPSQcQrg8P2tS40968UwoidJYzlkpOTt
         +L02EubeF/Sm/XQghda/GULJZtCc7mJbMyygX3kb9IPnWOijMl13A9mlgp3JNRhdyq9H
         +ZGLLUVTNrCOzt0nTJGL5RN8xs67NjbxyISLaTKdpEKs6QW56sqCAmRHWxTfbGzGtKAX
         U3A9m9qjswDL/zRhNlyIe7MX4gg6Fx3eJfSDgcC8kFvmVA4bIEZaPJ+P+ILV90SPBqM+
         6F5NXLfN6jK9w+MZdZrkFasNlvwcmtqNZh4vlNtKFjWD4UvEHuSPEikc7x27t2Y9FJpA
         YibQ==
X-Gm-Message-State: AOAM530oGDZJYhfkFY3tmlARYm7ghqC/0UYGPbaE367yjay7hXZnmZp9
        FupqJIcAMC+T/GMT3dfZA3y42KC4F9EpOPSQgkE=
X-Google-Smtp-Source: ABdhPJxma7BoDEiA/35m54+pGSjy4Tq7Hy9BCEYhhH2pKkqkJ0kEBJy7AZ/Jez7IPPcm8dV8ucPCoNJ/LJla6dBOgeQ=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c0d7:a7ba:fb41:a35a])
 (user=samitolvanen job=sendgmr) by 2002:a62:1c8f:0:b029:209:7eb2:748f with
 SMTP id c137-20020a621c8f0000b02902097eb2748fmr5107163pfc.79.1616087499516;
 Thu, 18 Mar 2021 10:11:39 -0700 (PDT)
Date:   Thu, 18 Mar 2021 10:11:05 -0700
In-Reply-To: <20210318171111.706303-1-samitolvanen@google.com>
Message-Id: <20210318171111.706303-12-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210318171111.706303-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v2 11/17] psci: use __pa_function for cpu_resume
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_CFI_CLANG, the compiler replaces function pointers with
jump table addresses, which results in __pa_symbol returning the
physical address of the jump table entry. As the jump table contains
an immediate jump to an EL1 virtual address, this typically won't
work as intended. Use __pa_function instead to get the address to
cpu_resume.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 drivers/firmware/psci/psci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index f5fc429cae3f..facd3cce3244 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -326,7 +326,7 @@ static int psci_suspend_finisher(unsigned long state)
 {
 	u32 power_state = state;
 
-	return psci_ops.cpu_suspend(power_state, __pa_symbol(cpu_resume));
+	return psci_ops.cpu_suspend(power_state, __pa_function(cpu_resume));
 }
 
 int psci_cpu_suspend_enter(u32 state)
@@ -345,7 +345,7 @@ int psci_cpu_suspend_enter(u32 state)
 static int psci_system_suspend(unsigned long unused)
 {
 	return invoke_psci_fn(PSCI_FN_NATIVE(1_0, SYSTEM_SUSPEND),
-			      __pa_symbol(cpu_resume), 0, 0);
+			      __pa_function(cpu_resume), 0, 0);
 }
 
 static int psci_system_suspend_enter(suspend_state_t state)
-- 
2.31.0.291.g576ba9dcdaf-goog

