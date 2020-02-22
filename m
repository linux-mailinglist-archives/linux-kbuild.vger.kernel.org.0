Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416F0168B1A
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 01:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgBVAkg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 19:40:36 -0500
Received: from sonic308-35.consmr.mail.gq1.yahoo.com ([98.137.68.59]:33949
        "EHLO sonic308-35.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727066AbgBVAka (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 19:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1582332026; bh=nOXdz42wneT7NBdKwI+6kXS+wX8R0iDxFBMVOCtd090=; h=From:To:Cc:Subject:Date:References:From:Subject; b=uLwXlhef5o2JYB5h2Pq9YtwXyelcygOPmAUh6cV43vlvl/xEhZzAR3HPYUSmk7kZ9uJ07jEcc0g55TmTwBUBGQc3KlIxN4YB0u+xI3aiXpj3VU1y4nzCK+303FV8CWmaUCht7qtJe6JndiSoHrsYRzG9Uh2953shAcDqw+R05OeiXuBtjjrJ/17JrwmGQu9j8MgCJcylT2A+zVrUnH83BqBeIAMvCKMGF3nl0MqcoAn9og0705jqoZD21bH85tgDKw0VcnuBAz4/3uGOrEt6p6FLDw7Pwb7q7NBNKo/vK4Y4/cQ1SBTsrli1aY6GOq5ocFllgMrYrr4/vKiiF7ziBg==
X-YMail-OSG: N_6BpMEVRDvd.miR6A7lED5GPdAEx7ojsA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.gq1.yahoo.com with HTTP; Sat, 22 Feb 2020 00:40:26 +0000
Received: by smtp405.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID dcfddd2195eedaebf1f6daa8fc223b6b;
          Sat, 22 Feb 2020 00:38:24 +0000 (UTC)
From:   "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To:     linux-kbuild@vger.kernel.org, michal.lkml@markovi.net,
        masahiroy@kernel.org
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
Date:   Fri, 21 Feb 2020 19:38:20 -0500
Message-Id: <20200222003820.220854-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-pipe reduces unnecessary disk wear for systems where /tmp is not a
tmpfs, slightly increases compilation speed, and avoids leaving behind
files when gcc crashes.

According to the gcc manual, "this fails to work on some systems where
the assembler is unable to read from a pipe; but the GNU assembler has
no trouble". We already require GNU ld on all platforms, so this is not
an additional dependency. LLVM as also supports pipes.

-pipe has always been used for most architectures, this change
standardizes it globally. Most notably, arm, arm64, riscv, and x86 are
affected.

Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
---
 Makefile               | 2 +-
 arch/alpha/Makefile    | 2 +-
 arch/arc/Makefile      | 2 +-
 arch/arm/Makefile      | 1 -
 arch/csky/Makefile     | 1 -
 arch/ia64/Makefile     | 2 +-
 arch/m68k/Makefile     | 2 +-
 arch/mips/Makefile     | 2 +-
 arch/nios2/Makefile    | 2 +-
 arch/openrisc/Makefile | 2 +-
 arch/parisc/Makefile   | 2 +-
 arch/powerpc/Makefile  | 2 +-
 arch/s390/Makefile     | 2 +-
 arch/sh/Makefile       | 2 +-
 arch/sparc/Makefile    | 4 ++--
 arch/xtensa/Makefile   | 2 +-
 16 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index aab38cb02b24..782c12267151 100644
--- a/Makefile
+++ b/Makefile
@@ -459,7 +459,7 @@ KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror=implicit-function-declaration -Werror=implicit-int \
 		   -Wno-format-security \
-		   -std=gnu89
+		   -std=gnu89 -pipe
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 12dee59b011c..b40a9be72d9b 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -12,7 +12,7 @@ NM := $(NM) -B
 
 LDFLAGS_vmlinux	:= -static -N #-relax
 CHECKFLAGS	+= -D__alpha__
-cflags-y	:= -pipe -mno-fp-regs -ffixed-8
+cflags-y	:= -mno-fp-regs -ffixed-8
 cflags-y	+= $(call cc-option, -fno-jump-tables)
 
 cpuflags-$(CONFIG_ALPHA_EV4)		:= -mcpu=ev4
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 20e9ab6cc521..b6a2f553771c 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
 CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
 endif
 
-cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
+cflags-y	+= -fno-common -fno-builtin -mmedium-calls -D__linux__
 cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
 cflags-$(CONFIG_ISA_ARCV2)	+= -mcpu=hs38
 
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index db857d07114f..7711467e0797 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -21,7 +21,6 @@ KBUILD_LDS_MODULE	+= $(srctree)/arch/arm/kernel/module.lds
 endif
 
 GZFLAGS		:=-9
-#KBUILD_CFLAGS	+=-pipe
 
 # Never generate .eh_frame
 KBUILD_CFLAGS	+= $(call cc-option,-fno-dwarf2-cfi-asm)
diff --git a/arch/csky/Makefile b/arch/csky/Makefile
index fb1bbbd91954..3ba8d936122c 100644
--- a/arch/csky/Makefile
+++ b/arch/csky/Makefile
@@ -42,7 +42,6 @@ KBUILD_CFLAGS += -msoft-float -mdiv
 KBUILD_CFLAGS += -fno-tree-vectorize
 endif
 
-KBUILD_CFLAGS += -pipe
 ifeq ($(CSKYABI),abiv2)
 KBUILD_CFLAGS += -mno-stack-size
 endif
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 32240000dc0c..554dc20873d8 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -24,7 +24,7 @@ KBUILD_LDS_MODULE += $(srctree)/arch/ia64/module.lds
 KBUILD_AFLAGS_KERNEL := -mconstant-gp
 EXTRA		:=
 
-cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
+cflags-y	:= $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
 		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
 KBUILD_CFLAGS_KERNEL := -mconstant-gp
 
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 5d9288384096..99a226bbd06c 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -60,7 +60,7 @@ cpuflags-$(CONFIG_M5206)	:= $(call cc-option,-mcpu=5206,-m5200)
 KBUILD_AFLAGS += $(cpuflags-y)
 KBUILD_CFLAGS += $(cpuflags-y)
 
-KBUILD_CFLAGS += -pipe -ffreestanding
+KBUILD_CFLAGS += -ffreestanding
 
 ifdef CONFIG_MMU
 # without -fno-strength-reduce the 53c7xx.c driver fails ;-(
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed8156..05eb77328a13 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -95,7 +95,7 @@ all-$(CONFIG_SYS_SUPPORTS_ZBOOT)+= vmlinuz
 # machines may also.  Since BFD is incredibly buggy with respect to
 # crossformat linking we rely on the elf2ecoff tool for format conversion.
 #
-cflags-y			+= -G 0 -mno-abicalls -fno-pic -pipe
+cflags-y			+= -G 0 -mno-abicalls -fno-pic
 cflags-y			+= -msoft-float
 LDFLAGS_vmlinux			+= -G 0 -static -n -nostdlib
 KBUILD_AFLAGS_MODULE		+= -mlong-calls
diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index 52c03e60b114..3205cb5fd143 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -24,7 +24,7 @@ LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-n
 
 KBUILD_AFLAGS += -march=r$(CONFIG_NIOS2_ARCH_REVISION)
 
-KBUILD_CFLAGS += -pipe -D__linux__ -D__ELF__
+KBUILD_CFLAGS += -D__linux__ -D__ELF__
 KBUILD_CFLAGS += -march=r$(CONFIG_NIOS2_ARCH_REVISION)
 KBUILD_CFLAGS += $(if $(CONFIG_NIOS2_HW_MUL_SUPPORT),-mhw-mul,-mno-hw-mul)
 KBUILD_CFLAGS += $(if $(CONFIG_NIOS2_HW_MULX_SUPPORT),-mhw-mulx,-mno-hw-mulx)
diff --git a/arch/openrisc/Makefile b/arch/openrisc/Makefile
index bf10141c7426..86075fc673d9 100644
--- a/arch/openrisc/Makefile
+++ b/arch/openrisc/Makefile
@@ -22,7 +22,7 @@ KBUILD_DEFCONFIG := or1ksim_defconfig
 OBJCOPYFLAGS    := -O binary -R .note -R .comment -S
 LIBGCC 		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
-KBUILD_CFLAGS	+= -pipe -ffixed-r10 -D__linux__
+KBUILD_CFLAGS	+= -ffixed-r10 -D__linux__
 
 ifeq ($(CONFIG_OPENRISC_HAVE_INST_MUL),y)
 	KBUILD_CFLAGS += $(call cc-option,-mhard-mul)
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index dca8f2de8cf5..88bee828400d 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -64,7 +64,7 @@ endif
 
 OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
 
-cflags-y	:= -pipe
+cflags-y	:=
 
 # These flags should be implied by an hppa-linux configuration, but they
 # are not in gcc 3.2.
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f35730548e42..0550b976157c 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -215,7 +215,7 @@ asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
-KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
+KBUILD_CFLAGS	+= $(CFLAGS-y)
 CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index e0e3a465bbfd..3ca3e3a29864 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -118,7 +118,7 @@ endif
 cfi := $(call as-instr,.cfi_startproc\n.cfi_val_offset 15$(comma)-160\n.cfi_endproc,-DCONFIG_AS_CFI_VAL_OFFSET=1)
 
 KBUILD_CFLAGS	+= -mbackchain -msoft-float $(cflags-y)
-KBUILD_CFLAGS	+= -pipe -Wno-sign-compare
+KBUILD_CFLAGS	+= -Wno-sign-compare
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables $(cfi)
 KBUILD_AFLAGS	+= $(aflags-y) $(cfi)
 export KBUILD_AFLAGS_DECOMPRESSOR
diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index b4a86f27e048..2e224b2a436b 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -194,7 +194,7 @@ drivers-$(CONFIG_OPROFILE)	+= arch/sh/oprofile/
 cflags-y	+= $(foreach d, $(cpuincdir-y), -I $(srctree)/arch/sh/include/$(d)) \
 		   $(foreach d, $(machdir-y), -I $(srctree)/arch/sh/include/$(d))
 
-KBUILD_CFLAGS		+= -pipe $(cflags-y)
+KBUILD_CFLAGS		+= $(cflags-y)
 KBUILD_CPPFLAGS		+= $(cflags-y)
 KBUILD_AFLAGS		+= $(cflags-y)
 
diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index 4a0919581697..ad30e7e668e0 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -29,7 +29,7 @@ UTS_MACHINE    := sparc
 # versions of gcc.  Some gcc versions won't pass -Av8 to binutils when you
 # give -mcpu=v8.  This silently worked with older bintutils versions but
 # does not any more.
-KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
+KBUILD_CFLAGS  += -m32 -mcpu=v8 -mno-fpu -fcall-used-g5 -fcall-used-g7
 KBUILD_CFLAGS  += -Wa,-Av8
 
 KBUILD_AFLAGS  += -m32 -Wa,-Av8
@@ -44,7 +44,7 @@ KBUILD_LDFLAGS := -m elf64_sparc
 export BITS   := 64
 UTS_MACHINE   := sparc64
 
-KBUILD_CFLAGS += -m64 -pipe -mno-fpu -mcpu=ultrasparc -mcmodel=medlow
+KBUILD_CFLAGS += -m64 -mno-fpu -mcpu=ultrasparc -mcmodel=medlow
 KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
 KBUILD_CFLAGS += -Wa,--undeclared-regs
 KBUILD_CFLAGS += $(call cc-option,-mtune=ultrasparc3)
diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
index 67a7d151d1e7..fdaa588c504c 100644
--- a/arch/xtensa/Makefile
+++ b/arch/xtensa/Makefile
@@ -42,7 +42,7 @@ export PLATFORM
 
 # temporarily until string.h is fixed
 KBUILD_CFLAGS += -ffreestanding -D__linux__
-KBUILD_CFLAGS += -pipe -mlongcalls -mtext-section-literals
+KBUILD_CFLAGS += -mlongcalls -mtext-section-literals
 KBUILD_CFLAGS += $(call cc-option,-mforce-no-pic,)
 KBUILD_CFLAGS += $(call cc-option,-mno-serialize-volatile,)
 
-- 
2.25.1

