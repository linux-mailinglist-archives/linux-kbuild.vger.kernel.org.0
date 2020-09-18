Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217C02706AD
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgIRUPE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgIRUPD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:15:03 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC97EC0613E6
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:01 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id j35so6107815qtk.14
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=I0YLtwhWjc07CuFqeB5q66ZrbEvcoZ20B6+f9QGQIyM=;
        b=jYUGHI1s8CrS/sSNFTlA7rmGo0aE0IxsOvco8+3mbGmxJ9XXGBu6oJrmFB8WRKT0qU
         zy//LwT+zYYBdAukM8OYIDIlT0g/nSfyiohg2buo5UUTX5oxMiibN0IAZdFZeUFX43do
         J75Ez99j+amuAzoOHQ0FFpTbHxdaoahEQ7mXskyDoQ20jhkMYFi95nSwiM3fgkSylPUu
         CgNcTGMuPTBF1DZs6+MnIXUHE0THEx4HxmF1Qc5rm1DW1zfnCq0VNXbuVkgxBrHhGtkl
         Jtq5TVNiA8w8V4hj/3o5nuATv73gM7CpTJhyuPWJPzpN9VmwWFkxnAAGfCAkUKsGwXZb
         /0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=I0YLtwhWjc07CuFqeB5q66ZrbEvcoZ20B6+f9QGQIyM=;
        b=BLD2p0gduEYyR1vhKtBXDSCYS4PY1jmgDnmnhAgzG7WsBHNT3J4fH+UvO8Wy7L3fEJ
         e8KSZ9MsqOS8Lm8s46zp9e7m9O5eLa1WqBgBoTY9b//rrlJa/AkaEcRhkuM5npLT+jja
         JHEAfcGHXT8VshQTqhA2WMlXjJn9I/9emgWK3kDE/+0F0X9OExm9s8+14dWRBKwjLwr+
         gbARhiINI583ePU7doSOhOSaKdDncSE+WD40t4drf0yHru9I0ARCVCr6MyqTJOZth2uD
         oo9KRdPr+pDbuPEb6xX/TJU3GwohwEBVZcmc6dpH1rWG4fho6jiNjXYyOF/nUU0VUh3N
         hIgw==
X-Gm-Message-State: AOAM530qGoItJ5Zh5KMx/QXi8/rzRarRUww0aCNTz4DAhkr8wyc2oFdM
        iQsJYZQiGdkYKIwgoHr3RrBw9yoL/OWr6YlzPpI=
X-Google-Smtp-Source: ABdhPJz8YsEPOq657LzaNLkjWdjXppy9+ITNLo8GCqthbQa6sHwPiOQhQjOantZ7VXaLO7lFT1ulWYm9Ne5qkWpjkw4=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:5a0e:: with SMTP id
 ei14mr20723233qvb.15.1600460099899; Fri, 18 Sep 2020 13:14:59 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:15 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-10-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 09/30] x86, build: use objtool mcount
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

Select HAVE_OBJTOOL_MCOUNT if STACK_VALIDATION is selected to use
objtool to generate __mcount_loc sections for dynamic ftrace with
Clang and gcc <5 (later versions of gcc use -mrecord-mcount).

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7101ac64bb20..6de2e5c0bdba 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -163,6 +163,7 @@ config X86
 	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING		if X86_64
 	select HAVE_C_RECORDMCOUNT
+	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
-- 
2.28.0.681.g6f77f65b4e-goog

