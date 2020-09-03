Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CA525CB25
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Sep 2020 22:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgICUiu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 16:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729400AbgICUbi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 16:31:38 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5D3C0619C4
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 13:31:11 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id g18so2486099pgl.10
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=WN8mpXa+HsW9fsZYTOAsBdC0BrDsnoqsIhb4CRQsjoA=;
        b=ILcqyCFUuMNmm3B95VxDju+nky8Uu+qmaPpzDRj3rzSs7wdq56m1nXOOYGQRh5j+ez
         GoI90TA6FVXFOlD755AmSb4/FNzaT0VP8lOAy6uMYZFFLJuqFJVL9bJwWTH9E0GqtOEo
         al6TkePRlfFId/wWeLeyYEgNYfWQP0oNFVpXgW52difahcSd5ZTRotEOB0pRrOx1IZXM
         Cnhj1xtZcbRHwGgTBVkZm/DFy5pa62h5HdpA7rjM4Z4R2IFE8nWpVFD1OTUXwGK6Fy0y
         CR+ahjyBXSSb5EJ1ofWh2xFjBel7zKuiBnOe86gBc07OTZ6uirMoAkpdrWgxZ4RTDhON
         LYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WN8mpXa+HsW9fsZYTOAsBdC0BrDsnoqsIhb4CRQsjoA=;
        b=Ki8sd0Rs/DYw/1BrfIW2hKILsZZ/WBXuTZjzwM0IchC6MHLHyLOtguPfuDXdjN+yUg
         95h4zS/PZKzVAz4WTNrf5MvK3PxtGgv192R4dvEuszEnKpfocM2FJD2rKBAstPHvyAs3
         WR9n2plm6xZmJ8KTDAcmGvKk3+ZgB3lSFZo6ya4egfhNai04h+aUdVpsqi8xkwu7kK9w
         MijiaubwbI7BI81OrSIm98/Y85u+pqY3cZ668nyr59MY6zAAdSE99Cara/wFqXgeAZgc
         v7SGb9lVX9I91rMLhx20qpevf6eS6d9umuC6rN+C67KNAW7yQwQbLd5yVvUghGvx0+ZC
         QB+A==
X-Gm-Message-State: AOAM530rOSE2eVDQX4BVMgUpjYytUhH8FsPGm6VMUAUsexIzq25uXZ8o
        eE4NxjdZQZndtzUlNkmbrys6K35PypTNO34OQSo=
X-Google-Smtp-Source: ABdhPJyGVWrrLe9OiHn6gBlDgaN9mhbz1XtS93UGhLaXNK12eKqdd07FdIpOk9xvfDGTdAf7XwfZllDsHPKhawlMPg4=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:d512:: with SMTP id
 t18mr1126739pju.106.1599165071359; Thu, 03 Sep 2020 13:31:11 -0700 (PDT)
Date:   Thu,  3 Sep 2020 13:30:33 -0700
In-Reply-To: <20200903203053.3411268-1-samitolvanen@google.com>
Message-Id: <20200903203053.3411268-9-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com> <20200903203053.3411268-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v2 08/28] x86, build: use objtool mcount
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
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Select HAVE_OBJTOOL_MCOUNT if STACK_VALIDATION is selected to use
objtool to generate __mcount_loc sections for dynamic ftrace with
Clang and gcc <5.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
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
2.28.0.402.g5ffc5be6b7-goog

