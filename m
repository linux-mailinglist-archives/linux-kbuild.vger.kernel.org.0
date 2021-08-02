Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B513DE32F
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Aug 2021 01:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhHBXnZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 19:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhHBXnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 19:43:24 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95911C0613D5
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 16:43:13 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id hf7-20020a0562140e87b02902dc988b8675so14200583qvb.3
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 16:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=yy9pyQojvK7Hdmo6VGo2Lui7HtlFWMn7Zh2eGYLAN30=;
        b=UH3CUy9t8ryrDG4F3pv3TetQOMIQtKV6Y2LYsFhy+ponF7FuzwIOeDtuKfPCeNRPz7
         qHv8bicgNi2Ms3bIMqrwpY0Md+goVKT37gdnPhhc2+yX4vG/W+X5cyUIn/dkmk2cLyF0
         MRdcgQAGixOudrNX42SWMNzXoN/NtEIZjLBCDQl4+oKI8Pl+WlHKMJloWVrWpXB5Vm7P
         Ssr1i3ElcLtqhCrLJGNmyjpeEgyd+YFIKF+sgrp6IBqZg7VKnHjNmygADAV0uwUssdse
         Gi6DioUPgJIJ+D58vtaUZ8bRm/0K+LhPuz3XJtLMDhzu/CXC+QDLi2/WPpwFQ0LZjaMX
         rd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=yy9pyQojvK7Hdmo6VGo2Lui7HtlFWMn7Zh2eGYLAN30=;
        b=ae7CkR41KKKlMuxKLYsne32LjPk7cI3XngfDuOta2WS0MwGePUFjJs/sMq8waf9Smd
         /8SQMqNFQ089tMEcN5kH1o2mr8Av7trFjhuKluzOf1uIn3WtSKhC40JP8pBH2f5+fuX/
         yVgdiywzRFmZdwv1BbchEqTl1hmis8j8NoJomaBWvsYFm7lX7wknQtyh33DY8OhLXCn3
         Ma6Qg9pUlJKkXb932wKO+sgE0d6GMP5O8gxgtPWuRjIvmFvd9cV1jXw27XZ5lkmKWX43
         OVs3r0btoJU/VNbnst5ZOmEJrRc++D1vUJ1QwAhfub2jJ8EIdvTp381Q3eGs3fJeGLlw
         vVzA==
X-Gm-Message-State: AOAM533knukBJJlFhDdd06Sta93p6D2w1jRZ26cx61Mn/flWguCwMRVh
        6NG92NAKH/2bRtsImsLqLi+NIAHQP54HxZyYMDk=
X-Google-Smtp-Source: ABdhPJxv56UYXw0HdwPKZZQFp3/zRO8zP8qIjavfTRIKYqCH5596UCuGHqajKqMv8WCVM5UAz4HoFd32fzVH1fyJqgg=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:3db0:42c:8665:a4ae])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:b44b:: with SMTP id
 e11mr18946709qvf.38.1627947792748; Mon, 02 Aug 2021 16:43:12 -0700 (PDT)
Date:   Mon,  2 Aug 2021 16:43:03 -0700
Message-Id: <20210802234304.3519577-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     Khem Raj <raj.khem@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LLVM_IAS=1 controls enabling clang's integrated assembler via
-integrated-as. This was an explicit opt in until we could enable
assembler support in Clang for more architecures. Now we have support
and CI coverage of LLVM_IAS=1 for all architecures except a few more
bugs affecting s390 and powerpc.

This commit flips the default from opt in via LLVM_IAS=1 to opt out via
LLVM_IAS=0.  CI systems or developers that were previously doing builds
with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
opted-in.

This finally shortens the command line invocation when cross compiling
with LLVM to simply:

$ make ARCH=arm64 LLVM=1

Link: https://github.com/ClangBuiltLinux/linux/issues/1434
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Note: base is:
https://lore.kernel.org/lkml/20210802183910.1802120-1-ndesaulniers@google.com/

 Documentation/kbuild/llvm.rst | 14 ++++++++------
 Makefile                      |  2 +-
 arch/riscv/Makefile           |  2 +-
 scripts/Makefile.clang        |  6 +++---
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index f8a360958f4c..16712fab4d3a 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
 	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
 	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
 
-Currently, the integrated assembler is disabled by default. You can pass
-``LLVM_IAS=1`` to enable it.
+Currently, the integrated assembler is enabled by default. You can pass
+``LLVM_IAS=0`` to disable it.
 
 Omitting CROSS_COMPILE
 ----------------------
 
 As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
 
-Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
-``--prefix=<path>`` to search for the GNU assembler and linker.
-
 If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
 from ``ARCH``.
 
@@ -78,7 +75,12 @@ That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
 
 For example, to cross-compile the arm64 kernel::
 
-	make ARCH=arm64 LLVM=1 LLVM_IAS=1
+	make ARCH=arm64 LLVM=1
+
+If ``LLVM_IAS=0`` is specified, ``CROSS_COMPILE`` is also used to derive
+``--prefix=<path>`` to search for the GNU assembler and linker. ::
+
+	make ARCH=arm64 LLVM=1 LLVM_IAS=0 CROSS_COMPILE=aarch64-linux-gnu-
 
 Supported Architectures
 -----------------------
diff --git a/Makefile b/Makefile
index 444558e62cbc..b24b48c9ebb7 100644
--- a/Makefile
+++ b/Makefile
@@ -845,7 +845,7 @@ else
 DEBUG_CFLAGS	+= -g
 endif
 
-ifneq ($(LLVM_IAS),1)
+ifeq ($(LLVM_IAS),0)
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
 endif
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index bc74afdbf31e..807f7c94bc6f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -41,7 +41,7 @@ endif
 ifeq ($(CONFIG_LD_IS_LLD),y)
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
-ifneq ($(LLVM_IAS),1)
+ifeq ($(LLVM_IAS),0)
 	KBUILD_CFLAGS += -Wa,-mno-relax
 	KBUILD_AFLAGS += -Wa,-mno-relax
 endif
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 1f4e3eb70f88..3ae63bd35582 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -22,12 +22,12 @@ else
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 endif # CROSS_COMPILE
 
-ifeq ($(LLVM_IAS),1)
-CLANG_FLAGS	+= -integrated-as
-else
+ifeq ($(LLVM_IAS),0)
 CLANG_FLAGS	+= -no-integrated-as
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
+else
+CLANG_FLAGS	+= -integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)

base-commit: d7a86429dbc691bf540688fcc8542cc20246a85b
prerequisite-patch-id: 0d3072ecb5fd06ff6fd6ea81fe601f6c54c23910
prerequisite-patch-id: 2654829756eb8a094a0ffad1679caa75a4d86619
prerequisite-patch-id: a51e7885ca2376d008bbf146a5589da247806f7b
-- 
2.32.0.554.ge1b32706d8-goog

