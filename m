Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C567518DCCE
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2020 01:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgCUAuI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Mar 2020 20:50:08 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:35097 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbgCUAuH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Mar 2020 20:50:07 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7470a52d;
        Sat, 21 Mar 2020 00:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=ItvPY5FNibfX183ur1mVj7K+l
        rU=; b=0r8srfqlkxHXtMkgsPNcA+K6UfDWMAfG4WmWgPi04x/nE0FDPWjV7m9kQ
        lT4EZ1TrLFQ0LC8d4zSB75ZDm+Tzw2ipnjIMrlsBup22jlfWlBlhq2R3R/Oie2J2
        bI02C/CJj77rY/6jpTwIJySexN+FgFiuP4B7yggQ0mRn2jzsPVvztglXoVSF1U6s
        Ugqu30KPgTRZwbmcWftcjCp61+gsxYVJ8T7zb186tQ++NTFI46vRiDzJ/0oqmGXW
        Ez2GbkjtWi20SpRIRBzXLpTn+xobolmt9p6weYso/yUZuCLHQzUlJ08ee3rYdIe7
        gGb4AUjtf1+0a5R17ScFpyQGI0YKw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f4ee996a (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Sat, 21 Mar 2020 00:43:24 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        x86@kernel.org, linux-crypto@vger.kernel.org
Subject: [PATCH RFC 1/3] x86: probe assembler instead of kconfig instead of makefile
Date:   Fri, 20 Mar 2020 18:49:43 -0600
Message-Id: <20200321004945.451497-2-Jason@zx2c4.com>
In-Reply-To: <20200321004945.451497-1-Jason@zx2c4.com>
References: <CAHk-=wjbTF2iw3EbKgfiRRq_keb4fHwLO8xJyRXbfK3Q7cscuQ@mail.gmail.com>
 <20200321004945.451497-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Doing this probing inside of the Makefiles means we have a maze of
ifdefs inside the source code and child Makefiles that need to make
proper decisions on this too. Instead, we do it at Kconfig time, like
many other compiler and assembler options, which allows us to set up the
dependencies normally for full compilation units.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/x86/Kconfig              |  2 ++
 arch/x86/Kconfig.assembler    | 36 +++++++++++++++++++++++++++++++++++
 arch/x86/Makefile             | 22 ---------------------
 drivers/gpu/drm/i915/Makefile |  3 ---
 lib/raid6/test/Makefile       |  9 ---------
 5 files changed, 38 insertions(+), 34 deletions(-)
 create mode 100644 arch/x86/Kconfig.assembler

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index beea77046f9b..707673227837 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2935,3 +2935,5 @@ config HAVE_ATOMIC_IOMAP
 source "drivers/firmware/Kconfig"
 
 source "arch/x86/kvm/Kconfig"
+
+source "arch/x86/Kconfig.assembler"
diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
new file mode 100644
index 000000000000..d90ed2d7adae
--- /dev/null
+++ b/arch/x86/Kconfig.assembler
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
+
+config AS_CFI
+	def_bool $(as-instr,.cfi_startproc\n.cfi_rel_offset rsp$(comma)0\n.cfi_endproc) if 64BIT
+	def_bool $(as-instr,.cfi_startproc\n.cfi_rel_offset esp$(comma)0\n.cfi_endproc) if !64BIT
+
+config AS_CFI_SIGNAL_FRAME
+	def_bool $(as-instr,.cfi_startproc\n.cfi_signal_frame\n.cfi_endproc)
+
+config AS_CFI_SECTIONS
+	def_bool $(as-instr,.cfi_sections .debug_frame)
+
+config AS_SSSE3
+	def_bool $(as-instr,pshufb %xmm0$(comma)%xmm0)
+
+config AS_AVX
+	def_bool $(as-instr,vxorps %ymm0$(comma)%ymm1$(comma)%ymm2)
+
+config AS_AVX2
+	def_bool $(as-instr,vpbroadcastb %xmm0$(comma)%ymm1)
+
+config AS_AVX512
+	def_bool $(as-instr,vpmovm2b %k1$(comma)%zmm5)
+
+config AS_SHA1_NI
+	def_bool $(as-instr,sha1msg1 %xmm0$(comma)%xmm1)
+
+config AS_SHA256_NI
+	def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
+
+config AS_ADX
+	def_bool $(as-instr,adox %r10$(comma)%r10)
+
+config AS_MOVNTDQA
+	def_bool $(as-instr,movntdqa (%eax)$(comma)%xmm0)
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 513a55562d75..b65ec63c7db7 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -177,28 +177,6 @@ ifeq ($(ACCUMULATE_OUTGOING_ARGS), 1)
 	KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args,)
 endif
 
-# Stackpointer is addressed different for 32 bit and 64 bit x86
-sp-$(CONFIG_X86_32) := esp
-sp-$(CONFIG_X86_64) := rsp
-
-# do binutils support CFI?
-cfi := $(call as-instr,.cfi_startproc\n.cfi_rel_offset $(sp-y)$(comma)0\n.cfi_endproc,-DCONFIG_AS_CFI=1)
-# is .cfi_signal_frame supported too?
-cfi-sigframe := $(call as-instr,.cfi_startproc\n.cfi_signal_frame\n.cfi_endproc,-DCONFIG_AS_CFI_SIGNAL_FRAME=1)
-cfi-sections := $(call as-instr,.cfi_sections .debug_frame,-DCONFIG_AS_CFI_SECTIONS=1)
-
-# does binutils support specific instructions?
-asinstr += $(call as-instr,pshufb %xmm0$(comma)%xmm0,-DCONFIG_AS_SSSE3=1)
-avx_instr := $(call as-instr,vxorps %ymm0$(comma)%ymm1$(comma)%ymm2,-DCONFIG_AS_AVX=1)
-avx2_instr :=$(call as-instr,vpbroadcastb %xmm0$(comma)%ymm1,-DCONFIG_AS_AVX2=1)
-avx512_instr :=$(call as-instr,vpmovm2b %k1$(comma)%zmm5,-DCONFIG_AS_AVX512=1)
-sha1_ni_instr :=$(call as-instr,sha1msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA1_NI=1)
-sha256_ni_instr :=$(call as-instr,sha256msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA256_NI=1)
-adx_instr := $(call as-instr,adox %r10$(comma)%r10,-DCONFIG_AS_ADX=1)
-
-KBUILD_AFLAGS += $(cfi) $(cfi-sigframe) $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
-KBUILD_CFLAGS += $(cfi) $(cfi-sigframe) $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
-
 KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
 
 #
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index a1f2411aa21b..e559e53fc634 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -28,9 +28,6 @@ subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
 CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 
-subdir-ccflags-y += \
-	$(call as-instr,movntdqa (%eax)$(comma)%xmm0,-DCONFIG_AS_MOVNTDQA)
-
 subdir-ccflags-y += -I$(srctree)/$(src)
 
 # Please keep these build lists sorted!
diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
index 3ab8720aa2f8..f8d4a44bc03d 100644
--- a/lib/raid6/test/Makefile
+++ b/lib/raid6/test/Makefile
@@ -34,15 +34,6 @@ endif
 
 ifeq ($(IS_X86),yes)
         OBJS   += mmx.o sse1.o sse2.o avx2.o recov_ssse3.o recov_avx2.o avx512.o recov_avx512.o
-        CFLAGS += $(shell echo "pshufb %xmm0, %xmm0" |		\
-                    gcc -c -x assembler - >&/dev/null &&	\
-                    rm ./-.o && echo -DCONFIG_AS_SSSE3=1)
-        CFLAGS += $(shell echo "vpbroadcastb %xmm0, %ymm1" |	\
-                    gcc -c -x assembler - >&/dev/null &&	\
-                    rm ./-.o && echo -DCONFIG_AS_AVX2=1)
-	CFLAGS += $(shell echo "vpmovm2b %k1, %zmm5" |          \
-		    gcc -c -x assembler - >&/dev/null &&        \
-		    rm ./-.o && echo -DCONFIG_AS_AVX512=1)
 else ifeq ($(HAS_NEON),yes)
         OBJS   += neon.o neon1.o neon2.o neon4.o neon8.o recov_neon.o recov_neon_inner.o
         CFLAGS += -DCONFIG_KERNEL_MODE_NEON=1
-- 
2.25.1

