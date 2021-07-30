Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAF13DC095
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 23:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbhG3V5W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 17:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbhG3V5V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 17:57:21 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05C0C06175F
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:57:15 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id t35-20020a05622a1823b02902647b518455so5138292qtc.3
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=mAs0sIhDHdO55jvkoLMVdL7o5FA16ak0SeaVC0asTAs=;
        b=sUGqlVu1bv4AneOEDgqvj/fEkmy5tU06kp1oA+OL9BUqTer2+/OPl7Uoko4B1I9/CL
         RlT13suT8nRE16OvmOoFhPeDJbd2zWgDdQjnBpfdShxwLCXXoHUZ1FMTP9fctWwAvBv8
         vvE/pay163VMbGMOQk3hfP44vgdvtjrnqel6Burq1x9lNUTHEBsJU1s7jMrw+RMvAGPS
         49nbbvIctXLIH+tq+deV9C4wzesCC+LMEMaCp0rY/L0kUoi7cPwod3Bx+KxWSs5PE5oZ
         uwRcDRFYyZGIQflm2V8He4z5xn5Il5kvNFvPEB9+ocwVOOEflF6UJPrUOxU/zIuWxuIP
         oRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=mAs0sIhDHdO55jvkoLMVdL7o5FA16ak0SeaVC0asTAs=;
        b=fdZGt24YEY9GtS8Bek7FRNQuakkZ8dDV/UmqcGlIrE2PMAnUHWtYseMB0/i8/1DBCz
         ToHBas8U2Gron7BHlhdJuyCTww1vxjXPGBASXQNE+354K6wWCUzvyfUvZyaJBOIvt9W1
         YB/z+rNSMk4hUiFn9xo0x64GZMfeifVaXA2tlHnwFc2bGjBvFSfsdaOaIyyzFPM/RrO2
         GI5vN76aApvLC9kRXESjgSOtpBpCVhke5bY653RFdLXMaD5zLXHSLixwbE4eYPq9hcNb
         0o0h5u+xQssg6fW/adEhHNNkytqTEHY5TOsGCaCH838zKUzREXO70CmWE69ONXmU2/dy
         DzBg==
X-Gm-Message-State: AOAM5308GNfCpVaU9qN+mRPU/EPX8cT5S7nBdH+s6wt6q2M6pW97XE6q
        11rGAkHH15+j8Rn2OK40wdnBMOTMP/GM0R+54io=
X-Google-Smtp-Source: ABdhPJzry5c91xVpjK/XGtG19zZUYNEZ5gnksaYQdmDSUXviGSE7awMbxn28yW5BybYcpfsx0I8WIK4RJGgwIjj1zYc=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:ca8b:b433:7c1d:90d])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:529e:: with SMTP id
 kj30mr5262500qvb.32.1627682234730; Fri, 30 Jul 2021 14:57:14 -0700 (PDT)
Date:   Fri, 30 Jul 2021 14:57:06 -0700
In-Reply-To: <20210730215708.276437-1-ndesaulniers@google.com>
Message-Id: <20210730215708.276437-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210730215708.276437-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v5 1/3] Makefile: move initial clang flag handling into scripts/Makefile.clang
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
2.32.0.554.ge1b32706d8-goog

