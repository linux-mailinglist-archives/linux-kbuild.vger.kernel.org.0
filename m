Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896C0270668
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIRUPk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgIRUPj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:15:39 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A00C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:37 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id q131so5539062qke.22
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=/0ldiyB2nVfkSW+Z4ZqugZ1I2eeQ0sdYMfFHH6J6dWM=;
        b=ObhRsoWs56/ckOGNxhhvSliY51cEtV0g/uMSUnztF/O7z31SMtCH/329m8ibTSKZpG
         fiez3GHcBYfc9o5RBx52gPxMzE2kT7BpfP1ZD4q5GKOuEItaIBhl8DMnx+NNI8ef7ycs
         b8R96aDxgD2UiGsnLon+7daf2qTD2JY7NXxEElaPkmsOHkoKvbT8QFHFiJaUXRtTLxH0
         55yHN4z3tf4xECFWt3X9nwCecG7xNYuYAMLaw4tETvqQQGxC0C2DOdr9nz2poaLSjtvv
         1tZdTBVYTcwfiT3/yI4GgTADGX+HKVoqImsQX1FHpwsSfHwO0fR0fgmBvCx0ByfTr/Ho
         8lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/0ldiyB2nVfkSW+Z4ZqugZ1I2eeQ0sdYMfFHH6J6dWM=;
        b=ViYDpWlK/kWQxmWRBNK7jbo1A5tXBf1Ndqb9GWwMH2npr16HBKQ4MUBEceb4ccElcT
         hsH2Bl4WWzUdlewDXCBmGM6dZw3mo1xmyza9Eefae/QpoeLxJi5+kjlWm050VPSRfNNL
         B9vjvq0bk0U36aFN5oxkLrj5a8RWKNAzjQ/a1Jcqi99CWM60lEGVHG5jd+XHxUepRJ4r
         K4NCj6aZsxNRZ1+Y+2hvJpHqdcEdevcKQGdUMGQ1opdKdGUpa5fv66LPwMLNqzxXPrj9
         ZJCBxmLro0aQWRcvoArV5UlrtO13W2a6Q8oUmKd/bIsRcMZxLR3DMJ2auQd6cfr5c0Eo
         y87g==
X-Gm-Message-State: AOAM533X4KY7/St8PRWOKTEgcYRSb7wLn89OQWWSXcahGrpCf+13ze1J
        xwl2mQJazm8GdZykLC4vLeQ+AfiAnSrA3T61yFQ=
X-Google-Smtp-Source: ABdhPJzlCcwfWl9pGOxTGz2mpuA0ZcI0OzyXT/6tCo4MOeFDLBSH0AjygGOTnITZPst0myY84qe7t61m7gd1U0GYQLc=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a0c:8b02:: with SMTP id
 q2mr19161266qva.48.1600460136604; Fri, 18 Sep 2020 13:15:36 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:30 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-25-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 24/30] arm64: export CC_USING_PATCHABLE_FUNCTION_ENTRY
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
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since arm64 does not use -pg in CC_FLAGS_FTRACE with
DYNAMIC_FTRACE_WITH_REGS, skip running recordmcount by
exporting CC_USING_PATCHABLE_FUNCTION_ENTRY.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 4e8bb73359c8..57b875099b17 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -123,6 +123,7 @@ CHECKFLAGS	+= -D__aarch64__
 ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_REGS),y)
   KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
   CC_FLAGS_FTRACE := -fpatchable-function-entry=2
+  export CC_USING_PATCHABLE_FUNCTION_ENTRY := 1
 endif
 
 # Default value
-- 
2.28.0.681.g6f77f65b4e-goog

