Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F493DDF63
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 20:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhHBSja (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 14:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhHBSj3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 14:39:29 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B8FC06175F
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 11:39:20 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id t101-20020a25aaee0000b0290578c0c455b2so19878918ybi.13
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 11:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=gB4C2V/JRguj4rIBL7q84P8CEYcrLKzVf1rrlRWL8ws=;
        b=ibOF2huEqj8zm7B5cvTjuBhfuojGGoi5tyhfAmlRya+6n1AKH2xsdr32hT93l0oM2F
         oJ/xeRaqKS0JtzQ3Zrl0fw6lJhRf1CneqRAdyrm1cwO0jMNuPMGeJh5WnZj/1uN0rnih
         1157OL1ZTTXVJ7HXH+xo6hQDGsXwt6VqCYIEfRruduII6ZqWSNjdSwND2rcaq0j+10Pc
         S2JR8/KG06oHR/3oivBq2sYIba7r1V3syN7AlmYKivGvn1n9aoVEciM281hJD3qRw/KZ
         6dAGOpKr2rXfm39y2MvRvnug12KNDYvGTQJwvtMFYHkraE8bhfAkYHf8tYpxOi5VBlgg
         d87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gB4C2V/JRguj4rIBL7q84P8CEYcrLKzVf1rrlRWL8ws=;
        b=gDUOswEcz25tgmkKU2FmReb2s3AJS8uMVs6IYX2u2gx2nwNzFUUWsPDEVCExJrnRwb
         2ltUcFoeckZtR8Btg73KGuJYKy8zZE5IPRbkTeGqBzB8YDlt521upgyscoRg5SzR+7hO
         X28g4nJEMcT2cDiKgM2p4cI8vl7c1BqTaiimSudm/dXNsq7vF/tZmUVvuJCV9axUMiS9
         B5juYg7k+2pS848rqpqdKQQTTusZqMDTjRZYbySqCaZ7PIDOpesqAtZyrDrfALer+MV1
         XNvWZlQwpbaiGQ/JmX1kwVGm2Fx9gT6lqOBetgQfr1B3dZfM2QZ0o4/1Ek3Y+mP6CVvM
         uo2w==
X-Gm-Message-State: AOAM532jJCQIJIn12FBqgc0dr4xV4In+R6Xp3sTmwhGm+gYFgYNNwp+G
        E9YrEtXygjPc9gi6E8AVazl3Ww3tpEezeOO/h/o=
X-Google-Smtp-Source: ABdhPJxEHNPJZkwXVTm+0ZWk4gLLYQ//MtT+jGwZS2AH42Aj8E3EBqO4/9+9QJzQcvn4lsFUcImip8y6QRcc6ZOKkkE=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:3db0:42c:8665:a4ae])
 (user=ndesaulniers job=sendgmr) by 2002:a25:be09:: with SMTP id
 h9mr24786099ybk.239.1627929559410; Mon, 02 Aug 2021 11:39:19 -0700 (PDT)
Date:   Mon,  2 Aug 2021 11:39:08 -0700
In-Reply-To: <20210802183910.1802120-1-ndesaulniers@google.com>
Message-Id: <20210802183910.1802120-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v6 1/3] Makefile: move initial clang flag handling into scripts/Makefile.clang
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With some of the changes we'd like to make to CROSS_COMPILE, the initial
block of clang flag handling which controls things like the target triple,
whether or not to use the integrated assembler and how to find GAS,
and erroring on unknown warnings is becoming unwieldy. Move it into its
own file under scripts/.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 MAINTAINERS            |  1 +
 Makefile               | 15 +--------------
 scripts/Makefile.clang | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 14 deletions(-)
 create mode 100644 scripts/Makefile.clang

diff --git a/MAINTAINERS b/MAINTAINERS
index 19135a9d778e..3af8d39f43ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4501,6 +4501,7 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
 F:	include/linux/compiler-clang.h
+F:	scripts/Makefile.clang
 F:	scripts/clang-tools/
 K:	\b(?i:clang|llvm)\b
 
diff --git a/Makefile b/Makefile
index 6b555f64df06..444558e62cbc 100644
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
2.32.0.554.ge1b32706d8-goog

