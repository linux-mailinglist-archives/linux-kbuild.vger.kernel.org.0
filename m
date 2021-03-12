Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6243382B3
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 01:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhCLAtv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 19:49:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhCLAt3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 19:49:29 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB16C061764
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:28 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id v136so17030057qkb.9
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=H7rLHacy3F07lJtMDfRAgErCQuUrrLGxI+6W0d6WNpU=;
        b=sUvmGnJ+rhgNMV6BMGfzMD6FhlSVemJZuz19BUK84N0z28Eoya5RelUNEB4bGszQ8g
         h59RKb80ZeuYZloMlKF0xAboydHMpXu92lVUTi82QMs81W8kTnYA1ZDNiNx3x+misJXL
         GM0Xkdrdn0O8zTvSRuEj345cHir/Ug/LUWrHGzcxiWWeQYb101FpAB0rLvX5F/W4gV7o
         YylaNmKIJoPpazOXW8XD4FPKiXg1EBF1QXOtdCNVG3JMSbC9vt6JCxYbBgz4DChIKPWL
         wQv7/tmAQxWr5y+X5O61j8AOyrVenfu0Qfcg0+4/OzYM99F4RhaIvLi87Qy1DQXYuiSQ
         dkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=H7rLHacy3F07lJtMDfRAgErCQuUrrLGxI+6W0d6WNpU=;
        b=tcH7lqetroxKKCwfTR0dPtECWEX7wnrvfKLs1vKq88Tu68ZdRNI9DXXLn0sFxHdqv7
         LbEJeLEE0Ol1XrxPvnQYtvgSEcn9uyDsCgSZ/gdv0OkI77MRGTA8pCzoG2hmlaCF+o7d
         sN+iLYCwq2UmBVSTnMo3VrNblVeffXDtxugC2BrYkeADHFC4uGFNxxHbvLI/lIY1I97C
         Q6eGqD47Uq08Ekc+O9ZEGQy8uCHNEhHB1tm7ntBj+THf+HJPBeLV2LqnybAF1P747Fry
         zOr2nR/oRq8qC2+BRXkv/MazCexApsSl1IbmkW5az3P1rYn/R5pKC4zw6Hjx//2dn21B
         1KEA==
X-Gm-Message-State: AOAM530cBq1iGTVi9H+TVpkqfEbZLtYsRSCWQfcheKMOyC7vgOjOBAZl
        QkN/gqMYBoy687atdEGYpVu4gi58TMJpdPoHuaU=
X-Google-Smtp-Source: ABdhPJzcwYBUkwwPBHNvKt/g3QgQMzip9UKPQANWzW+ZzALJcGM1EFSFPH1hDnIaEovkHR0Pipxp3EXxwVLjJY4HWJw=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c86b:8269:af92:55a])
 (user=samitolvanen job=sendgmr) by 2002:a0c:f541:: with SMTP id
 p1mr10332251qvm.14.1615510168097; Thu, 11 Mar 2021 16:49:28 -0800 (PST)
Date:   Thu, 11 Mar 2021 16:49:06 -0800
In-Reply-To: <20210312004919.669614-1-samitolvanen@google.com>
Message-Id: <20210312004919.669614-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210312004919.669614-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH 04/17] module: cfi: ensure __cfi_check alignment
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

CONFIG_CFI_CLANG_SHADOW assumes the __cfi_check() function is page
aligned and at the beginning of the .text section. While Clang would
normally align the function correctly, it fails to do so for modules
with no executable code.

This change ensures the correct __cfi_check() location and
alignment. It also discards the .eh_frame section, which Clang can
generate with certain sanitizers, such as CFI.

Link: https://bugs.llvm.org/show_bug.cgi?id=46293
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/module.lds.S | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 168cd27e6122..552ddb084f76 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -3,10 +3,13 @@
  * Archs are free to supply their own linker scripts.  ld will
  * combine them automatically.
  */
+#include <asm/page.h>
+
 SECTIONS {
 	/DISCARD/ : {
 		*(.discard)
 		*(.discard.*)
+		*(.eh_frame)
 	}
 
 	__ksymtab		0 : { *(SORT(___ksymtab+*)) }
@@ -40,7 +43,16 @@ SECTIONS {
 		*(.rodata..L*)
 	}
 
-	.text : { *(.text .text.[0-9a-zA-Z_]*) }
+#ifdef CONFIG_CFI_CLANG
+	/*
+	 * With CFI_CLANG, ensure __cfi_check is at the beginning of the
+	 * .text section, and that the section is aligned to page size.
+	 */
+	.text : ALIGN(PAGE_SIZE) {
+		*(.text.__cfi_check)
+		*(.text .text.[0-9a-zA-Z_]* .text..L.cfi*)
+	}
+#endif
 }
 
 /* bring in arch-specific sections */
-- 
2.31.0.rc2.261.g7f71774620-goog

