Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3E63DA96D
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jul 2021 18:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhG2Qu5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Jul 2021 12:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbhG2Quv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jul 2021 12:50:51 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C60EC0613C1
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2021 09:50:47 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id s12-20020ad4446c0000b029033a9344451cso98651qvt.21
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2021 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=x9OsDi6ntYJ0VIZCmJL557cNSnY5r/Ab9zmZ7MgbT4s=;
        b=Z887/h+JPf/RmzOCpldFxPeiU1mG1LxdCC2VrhA/Pzmd3Yr2pQqYgskaKQhruSs1gK
         zqE2XDGn/UDBMz3PqaOQC3bzKTiaFYkcrLVhEblfJcKZxikcc4ojwuoD83BnMcYDN4pA
         NQvzXmAZYAQ7EPo+s6Oj6ntrG3HxW3UO0F3gUAg6kkwFgc5nRKu9cGm5NmnX78+Gkkox
         OFtnzA0ox3fO3uL9eLk6ueX37tyPwjQM4M2WR8HWYFcRKFANsfdZ+is+GPX/reIyFF0k
         i8weiiNOmEVbBq0qI9plBz8lfDywqTpjv0Y6mZMIZR817ywaVm+N1jAEDawM0oYZxhOx
         tWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=x9OsDi6ntYJ0VIZCmJL557cNSnY5r/Ab9zmZ7MgbT4s=;
        b=lKXFz+FfT82oU+DfRzBjyz4/Ycmi9ilATfUSrwi+mSxZRxrvXv7dpA+aDJqFe1zE2H
         pcrL9N1p9ooZiR9riXPj9N5bqobbEay1dd+9pBelHa46uAYZyYmbkhuf3OeBgT2uUi5p
         +gOgeg3W2auED6ZusDdo6YNYNz2yv+UEFsr/y3dTGIpMGK3nxZiwNkRnybfAuhEZXHpb
         C3lpxQ9XkajBpL3CTD9JWcwBppkuNQ3Szx9RWx1H/GzavoY5RVa6PvwZWFHe53JODI+n
         ae1VEhIBq9MqBJzdlLWSf/szTYUUIvxc862HjH56mdCxoNco66LiImjG/8Yy05DD4+Bj
         sheQ==
X-Gm-Message-State: AOAM5323gvIgCzY5j94WhYRz/CFkpu3L5cMeIH0I9vHgrDLCQVK4zLAF
        Bqlq0yx49kPk98N2yG2ZMcdesxqyD+Y8VzP/ot4=
X-Google-Smtp-Source: ABdhPJx47Fa51jgE3UGFJyvvG5De61DgUYBkX3Var2bQXsmDQ90X8JX7zYW6kUsFVBtQsZyGxXdin50okf4EUhFK2W4=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:8132:32f4:cf29:1268])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:d446:: with SMTP id
 r6mr6264764qvh.3.1627577446115; Thu, 29 Jul 2021 09:50:46 -0700 (PDT)
Date:   Thu, 29 Jul 2021 09:50:38 -0700
In-Reply-To: <20210729165039.23896-1-ndesaulniers@google.com>
Message-Id: <20210729165039.23896-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210729165039.23896-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH v3 1/2] Makefile: move initial clang flag handling into scripts/Makefile.clang
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
Changes V2 -> V3:
* Pick up Nathan's RB tag.

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
2.32.0.432.gabb21c7263-goog

