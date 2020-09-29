Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0764727DA6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 23:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgI2Vqj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 17:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbgI2Vqh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 17:46:37 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD336C0613D1
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:46:35 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b3so6375607ybg.23
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=ldzGNGDZyBtUZ+HZEhFsle3HftCI7jj5VijuIes3XjE=;
        b=A+2S/PVgCIFIgqA1Y+x6xPf02q9T8t5ybB0PjXezPYyVniPZlLdcnNuT2gDH8pQxqt
         4DLm3YscI15WD0HXcWi6zP7QdgI6QCeIg3Wwy7DNEd8iL5lAZ8voCtgTv/8Ph33fQX5R
         cCWSLAJg2dq3VlRuefEs9TYNxSH4LM7WAVyGPxSW12MYXC5swunyjdO/MTHwRwXmOpj6
         zrw6Qc/V5h8ue6BziUtDKZMjN6MdmLK0e7IVaBoAq4UiLgXu2BjcDgz4VCICGb5V+2pt
         D7KNuJtao0SSq+uSZ5vw6TziaUeYi9eaMBYeiVf3XjvW5Jnms1loYQA94qhYeykro9EM
         +7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ldzGNGDZyBtUZ+HZEhFsle3HftCI7jj5VijuIes3XjE=;
        b=GhAphh7By10B+IjMcu3zznhhW/FZqdarwq4EbaLxBh/JWOVBIYDv34GOMXNTn272i0
         qjoQqB2ZJERhs7wDZ8Wsj2oDa8XGutqDhe3N4PpvnOUXQH4r0tq4M6mGqqN/DHXzNrhM
         xyM+z7tVYayCW5i7oV0ptEdZKIDYJ5NE9hqmnEyVwvcaczEGNzEKlZqhIEakEPWIVJIF
         VOEtgLGxJUyLn5MWS6AZ6xtP84ZCcb8zeWEuz8GzU+EDFXqVAM9gKUD9v3WsHoX1O/9M
         89+gC1yQUcx6l9245iNHD+8jBd33pogaFN2PqerwXAK8FVU4ziwMwzoAiGgzIbMTC2IR
         BVZw==
X-Gm-Message-State: AOAM531KpSKnGe6hKudBoQHgmeaFCsvyACjnk0X+zYJe3y4M99E0iJxX
        KNn5JRzLmBAlzXjq5WsJAYSbItoxxT1/OEauR80=
X-Google-Smtp-Source: ABdhPJwwEUCuweR6zj+0aeaCy64VBGtyJJkwMN8XaaF4F/cSzy8beYdpFYYtw+WqPq9+tyjoVdIS0xOGdLfzbpSZCEs=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:ad43:: with SMTP id
 l3mr8526653ybe.157.1601415995012; Tue, 29 Sep 2020 14:46:35 -0700 (PDT)
Date:   Tue, 29 Sep 2020 14:46:03 -0700
In-Reply-To: <20200929214631.3516445-1-samitolvanen@google.com>
Message-Id: <20200929214631.3516445-2-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200929214631.3516445-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 01/29] RAS/CEC: Fix cec_init() prototype
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
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
2.28.0.709.gb0816b6eb0-goog

