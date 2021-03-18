Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5CD340B54
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Mar 2021 18:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhCRRMP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Mar 2021 13:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbhCRRLj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Mar 2021 13:11:39 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C569C061763
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 10:11:38 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id f2so20237371pjt.7
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 10:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xIKsEDWi8EL1j5NSYc2uWQA3l5Y2NiXXcLT9TovNhRQ=;
        b=uKxyyo5NDdB1QUbA3EnMvjuX1onU20iICbKJ9iP/dqRqzhm0bGPXUszw7wf3GKl1Cw
         8b6zGQsOgdMHwwqtEMHY8K9uQWWo8Csl7Ij0z216FvJg68YI42t5LQuRc707PLWEIS0l
         v6mINbfwZQaRHIuEtuhd/w+jw1MkLwDSlSn0PFx/6d0jgHgbFlLEe2zIRvzuxqfIFbB4
         81s6Y5tTsyTXg3PP3MbUj5QPEwCUc2bn0HIlVMkvO4B9tOKV53UBjXaLwrQa+a/fwExd
         ndjASAw4BiPpZ/v3XOZOyYf+t4si7VDIT+/WYNd+6rtyQwfJBQtMCpJMP/HwM/sR2oXZ
         1fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xIKsEDWi8EL1j5NSYc2uWQA3l5Y2NiXXcLT9TovNhRQ=;
        b=sqDzAyLKt85NTlDgXhj6fru6GRf7HFeL9J59W7Dkb3u9dqn0sA6aHPOTKjmFZpTod5
         eBOL6Tl7PDOJjImZVlJr3o54BclHk60y3G+9/1qd7WUy+SrePh5aY5eMkFcmNVnuv9xq
         7WYkgPOt4FizE/gP64khkYnWn3xSNjzk/Ji7R21SM22tWvI+/Mz55UQIbLWeTVWfqP76
         TDWd+dI2rw3rch3jJOv7OdsEvHoSXSh0Ql8liwvaRzAWnxj4b6KIaAG6ABSZyms3YMB6
         GpCYLNHxtC1obilrjOYt1NCBsPZqJnT3/n2zYcoltGhQSbimmqG5HVj0plBhD6LtO7bz
         OcXw==
X-Gm-Message-State: AOAM533p1Fy8qMYM0HS+YCpzsYpwY57GkMYDbCR+VkrfzlPjYs3VqkaM
        xIoGs/ht52CM4+1PkhWr5twCkCSI9H+YUokfmm0=
X-Google-Smtp-Source: ABdhPJwtUxlgXUjHfalHssJK6ozLwDkIUZpLb/yIsL/9erTHZ+0BV/50LNkOYs0FUF9Eq2xmyoDCO5T7tob2m1K9T6U=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c0d7:a7ba:fb41:a35a])
 (user=samitolvanen job=sendgmr) by 2002:a62:e90c:0:b029:203:90f:6f34 with
 SMTP id j12-20020a62e90c0000b0290203090f6f34mr5021966pfh.29.1616087497587;
 Thu, 18 Mar 2021 10:11:37 -0700 (PDT)
Date:   Thu, 18 Mar 2021 10:11:04 -0700
In-Reply-To: <20210318171111.706303-1-samitolvanen@google.com>
Message-Id: <20210318171111.706303-11-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210318171111.706303-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v2 10/17] lkdtm: use __va_function
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

To ensure we take the actual address of a function in kernel text, use
__va_function. Otherwise, with CONFIG_CFI_CLANG, the compiler replaces
the address with a pointer to the CFI jump table, which is actually in
the module when compiled with CONFIG_LKDTM=m.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/usercopy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lkdtm/usercopy.c b/drivers/misc/lkdtm/usercopy.c
index 109e8d4302c1..d173d6175c87 100644
--- a/drivers/misc/lkdtm/usercopy.c
+++ b/drivers/misc/lkdtm/usercopy.c
@@ -314,7 +314,7 @@ void lkdtm_USERCOPY_KERNEL(void)
 
 	pr_info("attempting bad copy_to_user from kernel text: %px\n",
 		vm_mmap);
-	if (copy_to_user((void __user *)user_addr, vm_mmap,
+	if (copy_to_user((void __user *)user_addr, __va_function(vm_mmap),
 			 unconst + PAGE_SIZE)) {
 		pr_warn("copy_to_user failed, but lacked Oops\n");
 		goto free_user;
-- 
2.31.0.291.g576ba9dcdaf-goog

