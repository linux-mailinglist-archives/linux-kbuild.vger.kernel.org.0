Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E29B3BF231
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 00:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhGGWqB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 18:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbhGGWqA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 18:46:00 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AC4C06175F
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Jul 2021 15:43:19 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id 44-20020aed30af0000b029024e8ccfcd07so2174952qtf.11
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Jul 2021 15:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/85l2E8K+20QVvNNb2KxNFZMM43rwvEksKDAAvMmyxw=;
        b=aMgaH0f60ri4+7q3inDHhAzPnvNA8hvYOKgJ9NqPtv+6JhaqB+ORX55cfzdeRuc9+Z
         2YA1ByZYy8zsokIagV+qVw247owxNutuGtky3IjJzAobpcTE0+UiYO/i3y1VLfu8AwLx
         PxV3YbDoi7UG3RwYwob47yzZs2nd4823aAb/F+nb8Y/H3txTg74ZcfDwVqqEtTLHz7i6
         1zBQfvhkXUiD5Kq6CNIuoZglsK1TS/taTEvbbCja5z/0raBo9mTY22/N44nC4KLhvpDg
         ah7OERSNSuM0WBC9u4QIJZOiG557syp5PDMPgpbINv5eiCs3tjLJ9uRFc7dngP2qNO/Q
         uGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/85l2E8K+20QVvNNb2KxNFZMM43rwvEksKDAAvMmyxw=;
        b=GtM8iRrGGEXuSuWCkxDJhd1cpsJT8W5fEdsjbngNyTT5vZYaxgH4cGxwflBqqTrCgi
         VQFQ1IECckq2Yn5G2+Hq1S8BJRlYU7QXX3v4CLtV2y8gV+4CWM0lGXCGTfpT7Qn/8Era
         exc6kI9el8/PpHy7JYm8y++yaU0hIjUNssdPoT8IPIs6pci0VuxgID2bCq8xrQrGISI+
         OVs6m34xCbtnFg+dqvvNrIPM16a0WZgUu/VnDO6etoMCnbQscx8bnSJ1eKLaxKDJ2tp2
         9K4xoNaZa9PITbM2VSS9lIXoi0a/J03+HhAqVEm9ycm6v2IIlhbQQYP8uqrqin80fAuO
         u9iw==
X-Gm-Message-State: AOAM532SJMHlMJBGDZDSeam+F30ysGc+iOMthvNpVlDI/gxy+Rrn8Phc
        kft+hLrwDiEL0MEBFxA+Md+sGOZPC0BS0frsmM8=
X-Google-Smtp-Source: ABdhPJxItucFemx8YM3vONxVgiXV68A9Y6Uq5ZiQ3ccTpoCn7Jqfyh8C8HwRkUeIOlNw44d+dcOXVnrlV3US2kUCHb0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:d417:6e24:4a54:1792])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:1a0a:: with SMTP id
 fh10mr26007149qvb.59.1625697798784; Wed, 07 Jul 2021 15:43:18 -0700 (PDT)
Date:   Wed,  7 Jul 2021 15:43:10 -0700
In-Reply-To: <20210707224310.1403944-1-ndesaulniers@google.com>
Message-Id: <20210707224310.1403944-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH 2/2] Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We get constant feedback that the command line invocation of make is too
long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
target triple, or is an absolute path outside of $PATH, but it's mostly
redundant for a given ARCH.

If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
KBUILD_CFLAGS, and KBUILD_AFLAGS based on $ARCH.

Previously, we'd cross compile via:
$ ARCH=arm64 CROSS_COMPILE=aarch64-linxu-gnu make LLVM=1 LLVM_IAS=1
Now:
$ ARCH=arm64 make LLVM=1 LLVM_IAS=1

Link: https://github.com/ClangBuiltLinux/linux/issues/1399
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes RFC -> v1:
* Rebase onto linux-kbuild/for-next
* Keep full target triples since missing the gnueabi suffix messes up
  32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
  drop references to arm64.
* Flush out TODOS.
* Add note about -EL/-EB, -m32/-m64.
* Add note to Documentation/.

 Documentation/kbuild/llvm.rst |  5 +++++
 scripts/Makefile.clang        | 38 +++++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index b18401d2ba82..80c63dd9a6d1 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -46,6 +46,11 @@ example: ::
 
 	clang --target=aarch64-linux-gnu foo.c
 
+When both ``LLVM=1`` and ``LLVM_IAS=1`` are used, ``CROSS_COMPILE`` becomes
+unnecessary and can be inferred from ``ARCH``. Example: ::
+
+	ARCH=arm64 make LLVM=1 LLVM_IAS=1
+
 LLVM Utilities
 --------------
 
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 297932e973d4..a79088797a50 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -1,6 +1,40 @@
-ifneq ($(CROSS_COMPILE),)
+# Individual arch/{arch}/Makfiles should use -EL/-EB to set intended endianness
+# and -m32/-m64 to set word size based on Kconfigs instead of relying on the
+# target triple.
+ifeq ($(CROSS_COMPILE),)
+ifneq ($(LLVM),)
+ifeq ($(LLVM_IAS),1)
+ifeq ($(ARCH),arm)
+CLANG_FLAGS	+= --target=arm-linux-gnueabi
+else ifeq ($(ARCH),arm64)
+CLANG_FLAGS	+= --target=aarch64-linux-gnu
+else ifeq ($(ARCH),hexagon)
+CLANG_FLAGS	+= --target=hexagon-linux-gnu
+else ifeq ($(ARCH),i386)
+CLANG_FLAGS	+= --target=i686-linux-gnu
+else ifeq ($(ARCH),m68k)
+CLANG_FLAGS	+= --target=m68k-linux-gnu
+else ifeq ($(ARCH),mips)
+CLANG_FLAGS	+= --target=mipsel-linux-gnu
+else ifeq ($(ARCH),powerpc)
+CLANG_FLAGS	+= --target=powerpc64le-linux-gnu
+else ifeq ($(ARCH),riscv)
+CLANG_FLAGS	+= --target=riscv64-linux-gnu
+else ifeq ($(ARCH),s390)
+CLANG_FLAGS	+= --target=s390x-linux-gnu
+else ifeq ($(ARCH),x86)
+CLANG_FLAGS	+= --target=x86_64-linux-gnu
+else ifeq ($(ARCH),x86_64)
+CLANG_FLAGS	+= --target=x86_64-linux-gnu
+else
+$(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)
+endif # ARCH
+endif # LLVM_IAS
+endif # LLVM
+else
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
-endif
+endif # CROSS_COMPILE
+
 ifeq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -integrated-as
 else
-- 
2.32.0.93.g670b81a890-goog

