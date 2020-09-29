Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E77B27DAF7
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 23:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgI2Vsi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 17:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729237AbgI2Vrq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 17:47:46 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92902C0613E5
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:47:31 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id f5so4064546qtk.11
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=bLX+1fjl9Bbya2A+atnzXnNoTgL1KkV514BpMbJv1Zc=;
        b=dHnRNjTAqW8lTXo9nEiIoFV8O295lbJjdVXsY2+bhFdy7wpFakrnWQIyA2hWQKJ3M4
         qosF/0hGR2ZjIUgh4/EdiLJbYrVxeS67XkRnjNPlnLbVTy+d8F6wxkmug8s6v+ICxYB0
         8cZhAa2wGYywn4ncJiN1o05hfIQQIu29UE1DPhT3T+xB0nlx2bsXOREKfZjpz9tsStXA
         TKUHPsS2S0/SL0tZVBJnBcm+28ZXPLK91wFqvg5Vq41bts7sxLDRqP6y8jHc7nr8ZF8Z
         YHZxAEAYGJfpUEU+55I610Jp2K5acEaPPIByvwA2/pL5hkU4Zb9dg+0o8WGjFm54hqYH
         HEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bLX+1fjl9Bbya2A+atnzXnNoTgL1KkV514BpMbJv1Zc=;
        b=RL5a1YwTiaDQH1M1F3fgXeK5RFyvZfuCVcycexlND5aClcWgDgsoci3oKOPJOcR2BE
         PwdWAD2UpjwWKmLbH2j71ViRTCgmk+PIE7WnNfBm5seqtyd/LTsK30VsT4s6yqEZ0M1a
         aEssg52Mse1yjww2cbCFpalFPWD8HOytWIUUMle0NBfq5ppHGCLutRJDKB65S5ZaImVw
         hcx7V8AKSdkh6Jv5LONHFWFnIVEUh0vYWg3DAJMApH1MfQa17GZHyzR60brG14giT+rc
         v82SVSyKubYzOz7YHEa6OwZ0IE89qpSW//WKeFujCp5rLop4msgv01O5iPZKShXX6QFg
         9WIw==
X-Gm-Message-State: AOAM530w3jIqdR8hBf+se3JzdimbNJn8Wbtt4DJhi8gnawQCK4anA0LY
        syzvx9XwAsOXtc5l8Y83pXOL06wN++qqcwdUWQ0=
X-Google-Smtp-Source: ABdhPJzqDAQNJ4yOOPQKWE0kEqpwkERe1XdkG9z06KHZ8iQel5gcZqcSfblI2RjnM+ksRD+B562jIJhEv9qWCoeYvkk=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a0c:e5cf:: with SMTP id
 u15mr6643416qvm.14.1601416050747; Tue, 29 Sep 2020 14:47:30 -0700 (PDT)
Date:   Tue, 29 Sep 2020 14:46:27 -0700
In-Reply-To: <20200929214631.3516445-1-samitolvanen@google.com>
Message-Id: <20200929214631.3516445-26-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200929214631.3516445-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 25/29] KVM: arm64: disable LTO for the nVHE directory
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
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We use objcopy to manipulate ELF binaries for the nVHE code,
which fails with LTO as the compiler produces LLVM bitcode
instead. Disable LTO for this code to allow objcopy to be used.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/kvm/hyp/nvhe/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index aef76487edc2..c903c8f31280 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -45,9 +45,9 @@ quiet_cmd_hypcopy = HYPCOPY $@
 		   --rename-section=.text=.hyp.text			\
 		   $< $@
 
-# Remove ftrace and Shadow Call Stack CFLAGS.
+# Remove ftrace, LTO, and Shadow Call Stack CFLAGS.
 # This is equivalent to the 'notrace' and '__noscs' annotations.
-KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_LTO) $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
 
 # KVM nVHE code is run at a different exception code with a different map, so
 # compiler instrumentation that inserts callbacks or checks into the code may
-- 
2.28.0.709.gb0816b6eb0-goog

