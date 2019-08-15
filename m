Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFF98F322
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2019 20:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732810AbfHOSUe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Aug 2019 14:20:34 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:40272 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHOSUe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 14:20:34 -0400
Received: by mail-qk1-f202.google.com with SMTP id g125so2879902qkd.7
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 11:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=H21ITYUHPl8jPlR91yWJPzMgLH3swJ34NAnanW4jJ2Y=;
        b=b6z6Kd9S5maj6QhxrUZQJPhZwPpI2GEo6rAtgpN8eGHPNELcPY8nV0pZ3LqVj09M/D
         7c3bO/0XfuWYTky3qxJD+D7BxXk3gZllSawZe6fCXXnuX14a747DMMOoLZT0PEIiJwPN
         +uYRjR0xML8Rios0oin3umT48cQluUB4XnrE01sAXajZIvoeWI9CRAHmmtaunbR/W1zv
         0PRL0iZ1pjYYEkObmTc/eXr6M7RIUvCTEI/ZfA+O2S0s3F8o5H9dHoljjQtLA0vsvo0X
         9oLfwj7q7mulTToGtTPzaIF4aD9Qil7QIGz0A/OLkkMxlnkZjDRdfVaz0vIB1fYGRhue
         J8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=H21ITYUHPl8jPlR91yWJPzMgLH3swJ34NAnanW4jJ2Y=;
        b=csYDnTdr9O7wn1cEGM//Kl8orjBWoA99sMii+39GgSTeT2jShO1KZUndQ+pIP9ZP5z
         9wssNd5o3jEVF6ArvOl8CSMr0VZ9MLX/YSQHIZAlwJDefYbXSSGAbHGvVORFaiJkUue/
         Jb/s9z1af9E0Jx1qfVRMT4QmMQfLJeN8fg2j/kFVQm6zigUqH2T+7shXUiZYV7grCygZ
         o/E7nP+t75bh9e7mtppdQzujXIC4f3105PO+Z7pdd04a3AEeIaw0Z8G3xOvwgRPpd0pk
         htcblveW+7GcPjdwBsyMrDwiyeEbR1pmUlOO8JFiwyvx0hbnnvq+XTZgObJqZM1oJmtJ
         aqQQ==
X-Gm-Message-State: APjAAAVnREZFC8CBt6CfZQqm5cdsT/hz2PpzExaolwLK/3NYxnTjb3Fl
        pHIaLYTLJbd7f8cQrRG2KtiaZLCWGA==
X-Google-Smtp-Source: APXvYqwz2YZ0acx0DMhcQ5rg/7AdnLU8fO1vU4S8pkloDlLcaqG50CCTgNCTfBUA71BqDS4N8OUCcqMOqA==
X-Received: by 2002:a0c:db88:: with SMTP id m8mr4275575qvk.143.1565893232928;
 Thu, 15 Aug 2019 11:20:32 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:20:29 -0700
Message-Id: <20190815182029.197604-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
From:   Nathan Huckleberry <nhuck@google.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        joe@perches.com, miguel.ojeda.sandonis@gmail.com
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clang is updating to support -Wimplicit-fallthrough on C
https://reviews.llvm.org/D64838. Since clang does not
support the comment version of fallthrough annotations
this update causes an additional 50k warnings. Most
of these warnings (>49k) are duplicates from header files.

This patch is intended to be reverted after the warnings
have been cleaned up.

Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 Makefile                   | 4 ++++
 scripts/Makefile.extrawarn | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 1b23f95db176..93b9744e66a2 100644
--- a/Makefile
+++ b/Makefile
@@ -846,7 +846,11 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
 # Warn about unmarked fall-throughs in switch statement.
+# If the compiler is clang, this warning is only enabled if W=1 in
+# Makefile.extrawarn
+ifndef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
+endif
 
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a74ce2e3c33e..e12359d69bb7 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -30,6 +30,9 @@ warning-1 += $(call cc-option, -Wunused-but-set-variable)
 warning-1 += $(call cc-option, -Wunused-const-variable)
 warning-1 += $(call cc-option, -Wpacked-not-aligned)
 warning-1 += $(call cc-option, -Wstringop-truncation)
+ifdef CONFIG_CC_IS_CLANG
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
+endif
 # The following turn off the warnings enabled by -Wextra
 warning-1 += -Wno-missing-field-initializers
 warning-1 += -Wno-sign-compare
-- 
2.23.0.rc1.153.gdeed80330f-goog

