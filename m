Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED673E2EDC
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Aug 2021 19:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241155AbhHFR1X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Aug 2021 13:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240927AbhHFR1X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Aug 2021 13:27:23 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADE0C061798
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Aug 2021 10:27:07 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id c3-20020a05620a0ce3b02903b8eff05707so6702919qkj.5
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Aug 2021 10:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=DsQFy/CzTnQXNoNOJwZLuGXsmdWykdOYnmIA1IAJYnI=;
        b=SLKP8QT3UTFB+yk0MpS4S2ZYQEJh0gnI+gyTWPJzp356nk7gk9IXC4JqccWo2rsf3/
         mxbffoWg83nR9QH0xUW3c93TAvFZeiOCwFnyBppdGNWSrkzG4zWhh3dKLn5YLuKXJbd9
         Kxr9PqtKr7EAId4nMlv5kRVsG6V7G9nSeERVDXcCQeZGUpph8uOjFZYcZeihdrdHZ7sG
         Wijn7xnJJl2Uy1HwettgBfYqHN77gB3BnC3iKU7w8yZgCR0AKo4d/SJOJ/1AHNxoUB8h
         aEdlTKnQOo9Lyw3ZOZN+g7g29CTXQ76o0jFNXoZOkn8apGIHsDOeY6g/YqPyc8JegjGB
         qyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=DsQFy/CzTnQXNoNOJwZLuGXsmdWykdOYnmIA1IAJYnI=;
        b=NLAqOvPmKo+2w8DhDep9yZ/I/cIDmPP01GEuQRp7NTWBMYfSpl6UdqKnDDPPTQ97ji
         HHnVHSpkJIhehZQxdrfkTYc31KVzJOfzmOtNRs+316WBGT5U7FSqjkdTtUhVfFDbueHD
         LKFIZI6Gu6ZzynpNTGxhcckV5qf6UV9FeOasP174q7qUZR3WnpsOqMrz3tkP91R+eK30
         ED09Qpg86bkAJycVrMLBT4PAN7Nrlg7etv8y9GFwwxx/1tduKSAXMVZ5DVl14M2uRpMw
         WDE3qtN1GpwhUUvChbJleg+qlhm/CMbvZTgvPsQqZzSnRgoHGeEth+Bri6PWdf9laNx8
         nv5A==
X-Gm-Message-State: AOAM530Re3wKmujm1nuI/NrCPR/DU7hV5SfEocL1Itcza7eqAsVJGcm+
        XNSdIxbBxsKV+jB00XowaUQtYcxsJ7MSOTddHPc=
X-Google-Smtp-Source: ABdhPJxlVebXFVl1DX68O2az9jnUDVOkZsun/wYx/gJq/Ne5YY7RqIBz45lXfXNMiZy//yphthHXxKGwM9UXhBISE9s=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:d20b:bb87:51cd:edc3])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:27e4:: with SMTP id
 jt4mr1006501qvb.45.1628270826503; Fri, 06 Aug 2021 10:27:06 -0700 (PDT)
Date:   Fri,  6 Aug 2021 10:27:01 -0700
Message-Id: <20210806172701.3993843-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v2] scripts/Makefile.clang: default to LLVM_IAS=1
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     Khem Raj <raj.khem@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
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

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Drop "Currently" from Documentation/, as per Matthew.
* Drop Makefile and riscv Makefile, rebase on
  https://lore.kernel.org/lkml/20210805150102.131008-1-masahiroy@kernel.org/
  as per Masahiro.
* Base is kbuild/for-next, plus
  https://lore.kernel.org/lkml/20210802183910.1802120-1-ndesaulniers@google.com/
  https://lore.kernel.org/lkml/20210805150102.131008-1-masahiroy@kernel.org/.

 Documentation/kbuild/llvm.rst | 14 ++++++++------
 scripts/Makefile.clang        |  6 +++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index f8a360958f4c..e87ed5479963 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
 	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
 	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
 
-Currently, the integrated assembler is disabled by default. You can pass
-``LLVM_IAS=1`` to enable it.
+The integrated assembler is enabled by default. You can pass ``LLVM_IAS=0`` to
+disable it.
 
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
prerequisite-patch-id: 6a0342755115ec459610657edac1075f069faa3d
-- 
2.32.0.605.g8dce9f2422-goog

