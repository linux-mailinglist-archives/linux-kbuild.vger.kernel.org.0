Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2115848A13
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2019 19:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfFQR2f (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Jun 2019 13:28:35 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:44577 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfFQR2f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jun 2019 13:28:35 -0400
Received: by mail-qt1-f202.google.com with SMTP id x10so9854722qti.11
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2019 10:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=iTRQxecWi31E9RUGi1F0DNGuHKrwwalrM0GzyTsUNjA=;
        b=XnshdqX+g/4Ydbw0GNvRY2ZN060BENLjJ668EKRsXXV5B4I8IkwgOaZgy1o3ub/oQ5
         cemtIn5zdTy/D5pNuss5JXgK3ynyOjdlKbUPH4Fv67QOvDg8bh6I5PEtuA8JuTGguql8
         v3dzh9FcTK0K+4g27TdW8t1o7yQ8FPeqlBbk3FeZ1EByg9uuATgpFU/p5Dh3hC83kBzL
         mdLdaGDObwDMyhAfIS++GeflIKrb4DtXauQhFUjmflX9x3RVwpOxzbc73QxbZHCc6ZBk
         idRa5w9qf48ezMvarkwECVpprkdoy7XIQ46VFa5lp1ihrkCDDM6gOFHDZkITRwOLB7+u
         BgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=iTRQxecWi31E9RUGi1F0DNGuHKrwwalrM0GzyTsUNjA=;
        b=DuzE4lhIrMen/6hnUAXd7cP1SEM1SiEtgp8DMHGJzaS4r9Po3jbTqYIKiHYWKWy9jw
         cjhyOEUu7vdiuugC8R6HT3iQrHd3tH2lLA567CwF2uTbZpPOsmr80jf4OhoYEJF/NA2F
         hmRFWkymSiQJrXqA39KyLniQA7RdjJSwofLk5zIK/63MxnWeSjuC9hqYvlDbohh4GEDs
         hjrGayTBZrS2ZNisz1SrljyQBCaWm3bPYySsMNmkv2uo2waGkgQTtER21cfFZ8gPnqkf
         f80B4zaWHNp8Cv4+nPSN8B3OsxGLqSf/hZVvMsIBa7G3YpCL3kHir7VQ6tBUbyFMW7o9
         VM+g==
X-Gm-Message-State: APjAAAU4ML0f6XpgyglQWj6JPmefZFKpPosbR62//nALpkfEtUYbgeYX
        sJfuR7IdNd/T1AF6KOLaxrKxWTqmPw==
X-Google-Smtp-Source: APXvYqwIh5dU3Z3tUjLmjOX+35JiS3tHnfM98yEdZlZvD4i1HLYa5bSH3fVsAdhDQxWihDN9mLx8HNfh/A==
X-Received: by 2002:ac8:3267:: with SMTP id y36mr93487008qta.293.1560792514307;
 Mon, 17 Jun 2019 10:28:34 -0700 (PDT)
Date:   Mon, 17 Jun 2019 10:28:29 -0700
Message-Id: <20190617172829.164520-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH] kbuild: Remove unnecessary -Wno-unused-value
From:   Nathan Huckleberry <nhuck@google.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This flag turns off several other warnings that would
be useful. Most notably -warn_unused_result is disabled.
All of the following warnings are currently disabled:

UnusedValue
|-UnusedComparison
  |-warn_unused_comparison
|-UnusedResult
  |-warn_unused_result
|-UnevaluatedExpression
  |-PotentiallyEvaluatedExpression
    |-warn_side_effects_typeid
  |-warn_side_effects_unevaluated_context
|-warn_unused_expr
|-warn_unused_voidptr
|-warn_unused_container_subscript_expr
|-warn_unused_call

With this flag removed there are ~10 warnings.
Patches have been submitted for each of these warnings.

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/520
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 3ab8d1a303cd..b293246e48fe 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -68,7 +68,6 @@ else
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-initializer-overrides
-KBUILD_CFLAGS += -Wno-unused-value
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
-- 
2.22.0.410.gd8fdbe21b5-goog

