Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C513C1C0B
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 01:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhGHX2M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 19:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhGHX2M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 19:28:12 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2D4C061574
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Jul 2021 16:25:29 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id v184-20020a257ac10000b02904f84a5c5297so8996097ybc.16
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Jul 2021 16:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=urOO6z/E/vigRuyY41VEGZzBsmY3+0PNbgPSZ6JhbA8=;
        b=q9AAsmHEGJuqeAqSa0zZFJCgp9QTxFkcay8w3jlF4LA6Ch3FtAnVJt2Xg/LbiecI0T
         TQPbsEcjxkaMsAfHSsF9aNYPKLG95iKcL8r5s4RV+KTO6VspeVtWETOBzj4xP2/Pq+mp
         SWralMOg3c04MC+ov84m7oX0wCgp4QX0t1T6BTEt5Qu/wF7v5Dme3oQwI+zCmvT7VdKV
         UwrT2r3qXtaGMncUgRLgnnZ6N4j6d17WkcKJbb9ARLlKl6pU6f3Jz+ML7NOB41pJGdgG
         jMoqtNkVUKrBBD/01yeoYzHVTK4hMJGrPF+DYIm4B5PLvbSxSv0Vfg6+Z7MRAXOZGz1I
         XgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=urOO6z/E/vigRuyY41VEGZzBsmY3+0PNbgPSZ6JhbA8=;
        b=ozGkuf0YXHZJqJk4JN/8S3NWdr08qtMJxiLGY+wVxTlO8LMCa77iFqnL2+Cgfe8Ji/
         uEY3pq0yEpG7Eu8flfR63njBoc6eb3QBJkyaUOmHJUXpeQXKXt/4ruGUd90xn0h2nT0x
         JVlyfpLAKZ8zVbUvCvmq+khIQVnIsLqOZ4uMyWnIMB15I20dfOMKG9/nZI9N5fmMOFVE
         t47bw/LskeibD2lNVJTTdxthqu2O2KTY0zq33a1fPmGHWVb+RaEfqRy4tj8nhcaAh+jF
         DjukfdnDpcwjciQTQizbE727Eg6NOz/m/rdbdyoQOsjfImKp5Eb6k+BrnrwR94GLEuuT
         JYkQ==
X-Gm-Message-State: AOAM5314VV2KQi/GWXfS06441XgJGnu2Fg/7RdPhJ4+KiEh/2XVc8JX9
        Ag9XzXycujT017xHcuspaTS19nhHQ5J1cCURIT4=
X-Google-Smtp-Source: ABdhPJzymA2MwLLldgqDqB0kWnz2aSrBCjLiR6U+N3DIThXrhx/3QQUHEVebbyr4g5apkeEeJIw3LtcG4zGwzVLTsCE=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:9fd:98a9:be3a:391d])
 (user=ndesaulniers job=sendgmr) by 2002:a25:508e:: with SMTP id
 e136mr39414843ybb.275.1625786728855; Thu, 08 Jul 2021 16:25:28 -0700 (PDT)
Date:   Thu,  8 Jul 2021 16:25:21 -0700
In-Reply-To: <20210708232522.3118208-1-ndesaulniers@google.com>
Message-Id: <20210708232522.3118208-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v2 1/2] Makefile: move initial clang flag handling into scripts/Makefile.clang
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With some of the changes we'd like to make to CROSS_COMPILE, the initial
block of clang flag handling which controls things like the target triple,
whether or not to use the integrated assembler and how to find GAS,
and erroring on unknown warnings is becoming unwieldy. Move it into its
own file under scripts/.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 MAINTAINERS            |  1 +
 Makefile               | 15 +--------------
 scripts/Makefile.clang | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 14 deletions(-)
 create mode 100644 scripts/Makefile.clang

diff --git a/MAINTAINERS b/MAINTAINERS
index 81e1edeceae4..9c1205c258c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4433,6 +4433,7 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
 F:	include/linux/compiler-clang.h
+F:	scripts/Makefile.clang
 F:	scripts/clang-tools/
 K:	\b(?i:clang|llvm)\b
 
diff --git a/Makefile b/Makefile
index cbab0dc53065..010e3a4e770b 100644
--- a/Makefile
+++ b/Makefile
@@ -586,20 +586,7 @@ endif
 CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
 
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
-ifneq ($(CROSS_COMPILE),)
-CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
-endif
-ifeq ($(LLVM_IAS),1)
-CLANG_FLAGS	+= -integrated-as
-else
-CLANG_FLAGS	+= -no-integrated-as
-GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
-CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
-endif
-CLANG_FLAGS	+= -Werror=unknown-warning-option
-KBUILD_CFLAGS	+= $(CLANG_FLAGS)
-KBUILD_AFLAGS	+= $(CLANG_FLAGS)
-export CLANG_FLAGS
+include $(srctree)/scripts/Makefile.clang
 endif
 
 # Include this also for config targets because some architectures need
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
new file mode 100644
index 000000000000..297932e973d4
--- /dev/null
+++ b/scripts/Makefile.clang
@@ -0,0 +1,14 @@
+ifneq ($(CROSS_COMPILE),)
+CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
+endif
+ifeq ($(LLVM_IAS),1)
+CLANG_FLAGS	+= -integrated-as
+else
+CLANG_FLAGS	+= -no-integrated-as
+GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
+CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
+endif
+CLANG_FLAGS	+= -Werror=unknown-warning-option
+KBUILD_CFLAGS	+= $(CLANG_FLAGS)
+KBUILD_AFLAGS	+= $(CLANG_FLAGS)
+export CLANG_FLAGS
-- 
2.32.0.93.g670b81a890-goog

