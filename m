Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C5B288E36
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 18:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389814AbgJIQOn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 12:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389715AbgJIQOI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 12:14:08 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A52C0613E1
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2020 09:13:54 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id n8so6823484qtf.10
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2020 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=xL7tn5bk8rd7QhzERnW5XDCxrWNQLuaGbP7lLdALs6Y=;
        b=OqvMiRbTLr7vQGkxZV+PzeN6OVnsvLKpKhipsC6rP2jdI7Y08eG9SJBUZ2mgdSJMkz
         x9QYY+hyJILnVTzv1B5ofQttFgWo7nBVjEgzundXt0DKJFBiSX7gz99ELfNKZbc2BUdu
         GQMlCWP+SMb3Czho/JwY5yFAdN3ZemagwBRj9FsPu58e2Af0yK9l4pesMcwC48QrH+Tx
         dQRg1+j/gMRSCddCjO1H4ILpvwOtSODFimUgDlcNLZ9DVwxxTNXijF18Aa3WiggyxUrV
         V/7JINREru8rAbs/3tG8GRSCPMpt5bAArAPyPhPEspa0qrdfHyj8Ao7YvCGIThXpmbGh
         raVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xL7tn5bk8rd7QhzERnW5XDCxrWNQLuaGbP7lLdALs6Y=;
        b=N7aFFnNtMx5vaXrKq5UJQ3WZhusQuZ6tQH3Q1Kc8LnCiPLTjgKGnjruujoJaFx3wLN
         3ZUgkl82xsux9t1LEg3Hdip1+hfYmFVLaC27gUFEo54CUX80mKYspuxXBaJMtQofnHD6
         KgzorE4ARNbJNiq4OAZcGeqBRBXRcBfNDnOESeW+S3yrqNLicFprRnuwqxqheQEOWMD1
         6rrkJbU1At8gHRuSOejj7MBk10Yf0k72K37bwiXW9pKMDyMFzUIIcVKsngkrtHG7zz54
         BF+pLeqapHaGlz2GJIYy3QxBnwd7LrAI+q/2b7p8Ss+cAWo9pS0nDlSVfrKM03xc5fw9
         ud/Q==
X-Gm-Message-State: AOAM530MFlG1Pvi/OuV+7ZsJO1OxmtITr6TnSuR+898NP1MlCbSaOcuR
        4s7hYYL4rXEMaaZyAJZdbviG6qLtuxC2laWA8gs=
X-Google-Smtp-Source: ABdhPJzJNs9VefAdVXIx8sE3q7uXvK82feETKtZCmngvw33KH61VeZxl20uF5X/PWOLcLy230cxOgVWyuUcI+4L/D/I=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:5747:: with SMTP id
 q7mr1648297qvx.0.1602260033580; Fri, 09 Oct 2020 09:13:53 -0700 (PDT)
Date:   Fri,  9 Oct 2020 09:13:15 -0700
In-Reply-To: <20201009161338.657380-1-samitolvanen@google.com>
Message-Id: <20201009161338.657380-7-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201009161338.657380-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v5 06/29] x86, build: use objtool mcount
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

Select HAVE_OBJTOOL_MCOUNT if STACK_VALIDATION is selected to use
objtool to generate __mcount_loc sections for dynamic ftrace with
Clang and gcc <5 (later versions of gcc use -mrecord-mcount).

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5e832fd520b5..6d67646153bc 100644
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
2.28.0.1011.ga647a8990f-goog

