Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764AF270628
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgIRUOr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgIRUOq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:14:46 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B8DC0613D4
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:14:44 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id u35so852239ybd.13
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=TqwpwA2qY0+meoCfIpHLXgNZtzIUgg9/FYqaJr/lHNY=;
        b=SAoKEt/G+wtGaNCEiPqBIUWaja1A3a5xAaghJ/k2HKUAWFgeK1QtV+lm2abWhnX5JD
         Lf1hWpMt0A3jqpXruVqakGZ4N4PzL5bDWgBRoB39cxdPpeOzfkkXXse9Da7EBLH6QszX
         yIQ4ps5QStAHLhzkW1GWCkPJtNZSS8s/HOHVJHh3mI37xrZXjV6JN7t2as4vjgpWd97H
         CN/1JCl9Z9jsIQ1IBYZGN/6gvrn4jzLfqwLse2ncX3sbW59FHzHrRf8VneE+RDy4N63e
         UjVJEfryi+4JjkhY1SGeecgO1nkIBXlZAGQENtM5mKEq9sThtpYLPTQWmgxN7MxHsXfh
         pLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TqwpwA2qY0+meoCfIpHLXgNZtzIUgg9/FYqaJr/lHNY=;
        b=NdLpaOf0b/goL48yZsflzpRDIWppyCkJ/l6ggQ8gXXih6WeKLOYPkSN8+WzxCjJX6n
         TYsrnI063LwTffJh9EHTbGgcEaa48axSX2i3YeYYgkXYcJ348J38egI2SWtQEop53AEM
         g6sBfE3Yuu6B1YOsKohYNuXSULcb9KJ9Hs83SYRt2hcF0kc1sMWI48nMsO6Yla7j8DYK
         Esu59p9C+b/mkJpiWPJAmIcwGsRJ4fMuh/VmmbT07Rnw4TS7EqlHJTW20cncIDGy1eAn
         pypOXgFQ0D57PVTpFLIIFH7APIIwWymUHtHd5AK/TuTWjWyT0Y9GY73tPTJmG9MvfEL7
         Y5/w==
X-Gm-Message-State: AOAM532vcH4T9aSdSoPYwH+7ByxfIWG5wq1zGnvv5a7U/B4d02FL2Hxy
        jKLNvwfvZk12dRDIvdOvUXZ0kvFna/0XqOcubcw=
X-Google-Smtp-Source: ABdhPJzOup8sE7kVTU78SL83JQa8xb+w2NlpY7pFS1w2EC6IHmBL07qIyuYvXqVu343S5bZmQVA9R2tZ1tsrCw5cNVQ=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:73ca:: with SMTP id
 o193mr30862020ybc.224.1600460083214; Fri, 18 Sep 2020 13:14:43 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:08 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-3-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 02/30] RAS/CEC: Fix cec_init() prototype
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Luca Stefani <luca.stefani.ge1@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Luca Stefani <luca.stefani.ge1@gmail.com>

late_initcall() expects a function that returns an integer. Update the
function signature to match.

 [ bp: Massage commit message into proper sentences. ]

Fixes: 9554bfe403nd ("x86/mce: Convert the CEC to use the MCE notifier")
Signed-off-by: Luca Stefani <luca.stefani.ge1@gmail.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Sami Tolvanen <samitolvanen@google.com>
Link: https://lkml.kernel.org/r/20200805095708.83939-1-luca.stefani.ge1@gmail.com
---
 drivers/ras/cec.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 569d9ad2c594..6939aa5b3dc7 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -553,20 +553,20 @@ static struct notifier_block cec_nb = {
 	.priority	= MCE_PRIO_CEC,
 };
 
-static void __init cec_init(void)
+static int __init cec_init(void)
 {
 	if (ce_arr.disabled)
-		return;
+		return -ENODEV;
 
 	ce_arr.array = (void *)get_zeroed_page(GFP_KERNEL);
 	if (!ce_arr.array) {
 		pr_err("Error allocating CE array page!\n");
-		return;
+		return -ENOMEM;
 	}
 
 	if (create_debugfs_nodes()) {
 		free_page((unsigned long)ce_arr.array);
-		return;
+		return -ENOMEM;
 	}
 
 	INIT_DELAYED_WORK(&cec_work, cec_work_fn);
@@ -575,6 +575,7 @@ static void __init cec_init(void)
 	mce_register_decode_chain(&cec_nb);
 
 	pr_info("Correctable Errors collector initialized.\n");
+	return 0;
 }
 late_initcall(cec_init);
 
-- 
2.28.0.681.g6f77f65b4e-goog

