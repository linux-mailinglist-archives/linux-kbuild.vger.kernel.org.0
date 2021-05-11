Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1AE4379EE0
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 May 2021 06:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhEKFAD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 May 2021 01:00:03 -0400
Received: from ozlabs.ru ([107.174.27.60]:60276 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229885AbhEKFAD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 May 2021 01:00:03 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 May 2021 01:00:03 EDT
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id AB91DAE80042;
        Tue, 11 May 2021 00:48:16 -0400 (EDT)
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for preprocessor
Date:   Tue, 11 May 2021 14:48:12 +1000
Message-Id: <20210511044812.267965-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The $(CPP) (do only preprocessing) macro is already defined in Makefile.
However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
in flags duplication. Which is not a big deal by itself except for
the flags which depend on other flags and the compiler checks them
as it parses the command line.

Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
If clang+llvm+sanitizer are enabled, this results in

-emit-llvm-bc -fno-lto -flto -fvisibility=hidden \
 -fsanitize=cfi-mfcall -fno-lto  ...

in the clang command line and triggers error:

clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'

This removes unnecessary CPP redefinition. Which works fine as in most
place KBUILD_CFLAGS is passed to $CPP except
arch/powerpc/kernel/vdso64/vdso(32|64).lds (and probably some others,
not yet detected). To fix vdso, we do:
1. explicitly add -m(big|little)-endian to $CPP
2. (for clang) add $CLANG_FLAGS to $KBUILD_CPPFLAGS as otherwise clang
silently ignores -m(big|little)-endian if the building platform does not
support big endian (such as x86) so --prefix= is required.

While at this, remove some duplication from CPPFLAGS_vdso(32|64)
as cmd_cpp_lds_S has them anyway. It still puzzles me why we need -C
(preserve comments in the preprocessor output) flag here.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* fix KBUILD_CPPFLAGS
* add CLANG_FLAGS to CPPFLAGS
---
 Makefile                            | 1 +
 arch/powerpc/Makefile               | 3 ++-
 arch/powerpc/kernel/vdso32/Makefile | 2 +-
 arch/powerpc/kernel/vdso64/Makefile | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 72af8e423f11..13acd2183d55 100644
--- a/Makefile
+++ b/Makefile
@@ -591,6 +591,7 @@ CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
+KBUILD_CPPFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 3212d076ac6a..306bfd2797ad 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -76,6 +76,7 @@ endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CFLAGS	+= -mlittle-endian
+KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
 LDEMULATION	:= lppc
 GNUTARGET	:= powerpcle
@@ -83,6 +84,7 @@ MULTIPLEWORD	:= -mno-multiple
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
 else
 KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
+KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
 KBUILD_LDFLAGS	+= -EB
 LDEMULATION	:= ppc
 GNUTARGET	:= powerpc
@@ -208,7 +210,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
 KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
-CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 7d9a6fee0e3d..ea001c6df1fa 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -44,7 +44,7 @@ asflags-y := -D__VDSO32__ -s
 
 obj-y += vdso32_wrapper.o
 targets += vdso32.lds
-CPPFLAGS_vdso32.lds += -P -C -Upowerpc
+CPPFLAGS_vdso32.lds += -C
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 2813e3f98db6..07eadba48c7a 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
 asflags-y := -D__VDSO64__ -s
 
 targets += vdso64.lds
-CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
+CPPFLAGS_vdso64.lds += -C
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
-- 
2.30.2

