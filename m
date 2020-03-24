Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE16519083D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 09:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgCXIvi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 04:51:38 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:17988 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbgCXIve (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 04:51:34 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 02O8mgsi011219;
        Tue, 24 Mar 2020 17:48:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02O8mgsi011219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585039738;
        bh=JqtixBVE5LvKs0Tzf5JjzcEl4PHKG6BuoyaSQFvvj58=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VT7u0p7jFX8rcAUgYEMLvfDun1br1MHBhbeua/d+C+39d4WsxGHO76aT3w95RqiNk
         7xw79J9Q8VThK+U0QGRwUovrbUbWBLwp7ocgOirKqBVBG54afPcz62tZMTHYQuPZsi
         WA/uA/+aHULGz9ptJNxGcIzBMMBkwPU7m360SCPMJsm9YAg46rOsnqgnFnnxQtpBYi
         MLghhO2/qsDEzoll1AmUXrCPFmz8I9MoSYWBWG/3YidFnHa1ZClqVlpGdy7PcrT0h5
         bLc21XxTv7MvSU4yXYXWRAy+GE6Kr8lJnv7FvUjm0NegsqhJudnvGPdLutlLehQPMy
         Utz983OFQpHGw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux@googlegroups.com,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 11/16] x86: probe assembler capabilities via kconfig instead of makefile
Date:   Tue, 24 Mar 2020 17:48:16 +0900
Message-Id: <20200324084821.29944-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
References: <20200324084821.29944-1-masahiroy@kernel.org>
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

 arch/x86/Kconfig           |  2 ++
 arch/x86/Kconfig.assembler | 22 ++++++++++++++++++++++
 arch/x86/Makefile          | 15 ---------------
 3 files changed, 24 insertions(+), 15 deletions(-)
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
index 000000000000..46868ec7b723
--- /dev/null
+++ b/arch/x86/Kconfig.assembler
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
+
+# binutils >= 2.22
+config AS_AVX2
+	def_bool $(as-instr,vpbroadcastb %xmm0$(comma)%ymm1)
+
+# binutils >= 2.25
+config AS_AVX512
+	def_bool $(as-instr,vpmovm2b %k1$(comma)%zmm5)
+
+# binutils >= 2.24
+config AS_SHA1_NI
+	def_bool $(as-instr,sha1msg1 %xmm0$(comma)%xmm1)
+
+# binutils >= 2.24
+config AS_SHA256_NI
+	def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
+
+# binutils >= 2.23
+config AS_ADX
+	def_bool $(as-instr,adox %eax$(comma)%eax)
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 4c57cb3018fb..b65ec63c7db7 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -177,21 +177,6 @@ ifeq ($(ACCUMULATE_OUTGOING_ARGS), 1)
 	KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args,)
 endif
 
-# does binutils support specific instructions?
-# binutils >= 2.22
-avx2_instr :=$(call as-instr,vpbroadcastb %xmm0$(comma)%ymm1,-DCONFIG_AS_AVX2=1)
-# binutils >= 2.25
-avx512_instr :=$(call as-instr,vpmovm2b %k1$(comma)%zmm5,-DCONFIG_AS_AVX512=1)
-# binutils >= 2.24
-sha1_ni_instr :=$(call as-instr,sha1msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA1_NI=1)
-# binutils >= 2.24
-sha256_ni_instr :=$(call as-instr,sha256msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA256_NI=1)
-# binutils >= 2.23
-adx_instr := $(call as-instr,adox %r10$(comma)%r10,-DCONFIG_AS_ADX=1)
-
-KBUILD_AFLAGS += $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
-KBUILD_CFLAGS += $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
-
 KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
 
 #
-- 
2.17.1

