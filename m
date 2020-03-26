Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18867193A3A
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgCZIDr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:03:47 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:18549 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgCZIDq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:03:46 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 02Q81Wpd002183;
        Thu, 26 Mar 2020 17:01:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02Q81Wpd002183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585209711;
        bh=fxIIn+ZInoY5PaLn5E0uj7poqY5wTi2d6aVUXentPeM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AEjWLzxRpE7jdteec3i8x1IIk3eY0Is3nC8la0MOxztM4+xIPWL9Qu1ocPVvSoMmM
         54DqfgAVmtTkK69JQacWsBW+5jvygVfqasCaqUBOSNoin8XLb8ePQS/zCZasnchtR5
         68Gs254NQOI5uDPRF8lJCOgHRepTKKB7+rMoKogzBO9atCN8ZvXz2vK2Vakd07vO+F
         ohmb6mg2pR6YAt9hRi1TnUyVASxggAjy1FUquAyg/6fLZc8s0o7If+hur3gqLixfAZ
         YWEOlBRoIWLEvsLX9wRIFLydfoOF5FTxWtPs86b5qWyH2NfyQyScelyzhhnYP8to34
         4BGhIy31g6Fuw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/16] x86: probe assembler capabilities via kconfig instead of makefile
Date:   Thu, 26 Mar 2020 17:00:58 +0900
Message-Id: <20200326080104.27286-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Doing this probing inside of the Makefiles means we have a maze of
ifdefs inside the source code and child Makefiles that need to make
proper decisions on this too. Instead, we do it at Kconfig time, like
many other compiler and assembler options, which allows us to set up the
dependencies normally for full compilation units. In the process, the
ADX test changes to use %eax instead of %r10 so that it's valid in both
32-bit and 64-bit mode.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 arch/x86/Kconfig           |  2 ++
 arch/x86/Kconfig.assembler | 17 +++++++++++++++++
 arch/x86/Makefile          | 10 ----------
 3 files changed, 19 insertions(+), 10 deletions(-)
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
index 000000000000..91230bf11a14
--- /dev/null
+++ b/arch/x86/Kconfig.assembler
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
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
+	def_bool $(as-instr,adox %eax$(comma)%eax)
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index f32ef7b8d5ca..b65ec63c7db7 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -177,16 +177,6 @@ ifeq ($(ACCUMULATE_OUTGOING_ARGS), 1)
 	KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args,)
 endif
 
-# does binutils support specific instructions?
-avx2_instr :=$(call as-instr,vpbroadcastb %xmm0$(comma)%ymm1,-DCONFIG_AS_AVX2=1)
-avx512_instr :=$(call as-instr,vpmovm2b %k1$(comma)%zmm5,-DCONFIG_AS_AVX512=1)
-sha1_ni_instr :=$(call as-instr,sha1msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA1_NI=1)
-sha256_ni_instr :=$(call as-instr,sha256msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA256_NI=1)
-adx_instr := $(call as-instr,adox %r10$(comma)%r10,-DCONFIG_AS_ADX=1)
-
-KBUILD_AFLAGS += $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
-KBUILD_CFLAGS += $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
-
 KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
 
 #
-- 
2.17.1

