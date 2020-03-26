Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62756193A55
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgCZIEO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:04:14 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:19375 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgCZIEO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:04:14 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 02Q81Wpf002183;
        Thu, 26 Mar 2020 17:01:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02Q81Wpf002183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585209713;
        bh=cPIEThBc4Irm4nWA19YAjNO5mJ0+ArFJUQ9YsOY4Q5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kOSooawtsEmwKO2JX/LVo8b76eQLIZDllzdeTJSIys1PEsgWuzrjRpRNa+zP0Ha/B
         DueBZG6RKf3rIeP3QF84+KZ3GErO/26NjvxL4Kj7vococFT36coBU/YPaRCTGxIjaT
         gBtXT8TYNVBQVclrWS7nt4rWvNHK8Ck9HeJO0WQ4Zh2qtP9JsNe+0MK6QpgNl/tXS2
         LWVc+0VzmFlvDs356G2J3z9Umrm1cYCsiLhksPP5Tttr5q1Lu9YcKfVdCyvaKntDFY
         qqT8SHMCT+RSu5IvqmaBnf2cI8R6L36dLD+64oBD0RjdJnRoUijlbSTnifags9YFYk
         VlzGW1+ELY91Q==
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
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] crypto: x86 - rework configuration based on Kconfig
Date:   Thu, 26 Mar 2020 17:01:00 +0900
Message-Id: <20200326080104.27286-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Now that assembler capabilities are probed inside of Kconfig, we can set
up proper Kconfig-based dependencies. We also take this opportunity to
reorder the Makefile, so that items are grouped logically by primitive.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 arch/x86/crypto/Makefile | 152 +++++++++++++++++----------------------
 crypto/Kconfig           |   8 +--
 2 files changed, 69 insertions(+), 91 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 1a044908d42d..2f23f08fdd4b 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -1,122 +1,100 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-# Arch-specific CryptoAPI modules.
-#
+# x86 crypto algorithms
 
 OBJECT_FILES_NON_STANDARD := y
 
-avx2_supported := $(call as-instr,vpgatherdd %ymm0$(comma)(%eax$(comma)%ymm1\
-				$(comma)4)$(comma)%ymm2,yes,no)
-avx512_supported :=$(call as-instr,vpmovm2b %k1$(comma)%zmm5,yes,no)
-sha1_ni_supported :=$(call as-instr,sha1msg1 %xmm0$(comma)%xmm1,yes,no)
-sha256_ni_supported :=$(call as-instr,sha256msg1 %xmm0$(comma)%xmm1,yes,no)
-adx_supported := $(call as-instr,adox %r10$(comma)%r10,yes,no)
-
 obj-$(CONFIG_CRYPTO_GLUE_HELPER_X86) += glue_helper.o
 
 obj-$(CONFIG_CRYPTO_TWOFISH_586) += twofish-i586.o
+twofish-i586-y := twofish-i586-asm_32.o twofish_glue.o
+obj-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
+twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
+obj-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
+twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
+obj-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
+twofish-avx-x86_64-y := twofish-avx-x86_64-asm_64.o twofish_avx_glue.o
+
 obj-$(CONFIG_CRYPTO_SERPENT_SSE2_586) += serpent-sse2-i586.o
+serpent-sse2-i586-y := serpent-sse2-i586-asm_32.o serpent_sse2_glue.o
+obj-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
+serpent-sse2-x86_64-y := serpent-sse2-x86_64-asm_64.o serpent_sse2_glue.o
+obj-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
+serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
+obj-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
+serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_DES3_EDE_X86_64) += des3_ede-x86_64.o
+des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
+
 obj-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
+camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
+obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
+camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_glue.o
+obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
+camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
+
 obj-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
+blowfish-x86_64-y := blowfish-x86_64-asm_64.o blowfish_glue.o
+
+obj-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
+cast5-avx-x86_64-y := cast5-avx-x86_64-asm_64.o cast5_avx_glue.o
+
+obj-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
+cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
+
+obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
+aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
+
 obj-$(CONFIG_CRYPTO_CHACHA20_X86_64) += chacha-x86_64.o
-obj-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
+chacha-x86_64-y := chacha-ssse3-x86_64.o chacha_glue.o
+chacha-x86_64-$(CONFIG_AS_AVX2) += chacha-avx2-x86_64.o
+chacha-x86_64-$(CONFIG_AS_AVX512) += chacha-avx512vl-x86_64.o
+
 obj-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
-obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
+aesni-intel-y := aesni-intel_asm.o aesni-intel_glue.o
+aesni-intel-$(CONFIG_64BIT) += aesni-intel_avx-x86_64.o aes_ctrby8_avx-x86_64.o
 
-obj-$(CONFIG_CRYPTO_CRC32C_INTEL) += crc32c-intel.o
 obj-$(CONFIG_CRYPTO_SHA1_SSSE3) += sha1-ssse3.o
-obj-$(CONFIG_CRYPTO_CRC32_PCLMUL) += crc32-pclmul.o
-obj-$(CONFIG_CRYPTO_SHA256_SSSE3) += sha256-ssse3.o
-obj-$(CONFIG_CRYPTO_SHA512_SSSE3) += sha512-ssse3.o
-obj-$(CONFIG_CRYPTO_CRCT10DIF_PCLMUL) += crct10dif-pclmul.o
-obj-$(CONFIG_CRYPTO_POLY1305_X86_64) += poly1305-x86_64.o
-
-obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
+sha1-ssse3-y := sha1_ssse3_asm.o sha1_ssse3_glue.o
+sha1-ssse3-$(CONFIG_AS_AVX2) += sha1_avx2_x86_64_asm.o
+sha1-ssse3-$(CONFIG_AS_SHA1_NI) += sha1_ni_asm.o
 
-obj-$(CONFIG_CRYPTO_NHPOLY1305_SSE2) += nhpoly1305-sse2.o
-obj-$(CONFIG_CRYPTO_NHPOLY1305_AVX2) += nhpoly1305-avx2.o
+obj-$(CONFIG_CRYPTO_SHA256_SSSE3) += sha256-ssse3.o
+sha256-ssse3-y := sha256-ssse3-asm.o sha256-avx-asm.o sha256-avx2-asm.o sha256_ssse3_glue.o
+sha256-ssse3-$(CONFIG_AS_SHA256_NI) += sha256_ni_asm.o
 
-# These modules require the assembler to support ADX.
-ifeq ($(adx_supported),yes)
-	obj-$(CONFIG_CRYPTO_CURVE25519_X86) += curve25519-x86_64.o
-endif
+obj-$(CONFIG_CRYPTO_SHA512_SSSE3) += sha512-ssse3.o
+sha512-ssse3-y := sha512-ssse3-asm.o sha512-avx-asm.o sha512-avx2-asm.o sha512_ssse3_glue.o
 
-# These modules require assembler to support AVX.
-obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
-obj-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
-obj-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
-obj-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
-obj-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
 obj-$(CONFIG_CRYPTO_BLAKE2S_X86) += blake2s-x86_64.o
+blake2s-x86_64-y := blake2s-core.o blake2s-glue.o
 
-# These modules require assembler to support AVX2.
-ifeq ($(avx2_supported),yes)
-	obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
-	obj-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
-endif
+obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
+ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 
-twofish-i586-y := twofish-i586-asm_32.o twofish_glue.o
-serpent-sse2-i586-y := serpent-sse2-i586-asm_32.o serpent_sse2_glue.o
+obj-$(CONFIG_CRYPTO_CRC32C_INTEL) += crc32c-intel.o
+crc32c-intel-y := crc32c-intel_glue.o
+crc32c-intel-$(CONFIG_64BIT) += crc32c-pcl-intel-asm_64.o
 
-des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
-camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
-blowfish-x86_64-y := blowfish-x86_64-asm_64.o blowfish_glue.o
-twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
-twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
-chacha-x86_64-y := chacha-ssse3-x86_64.o chacha_glue.o
-serpent-sse2-x86_64-y := serpent-sse2-x86_64-asm_64.o serpent_sse2_glue.o
+obj-$(CONFIG_CRYPTO_CRC32_PCLMUL) += crc32-pclmul.o
+crc32-pclmul-y := crc32-pclmul_asm.o crc32-pclmul_glue.o
 
-aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
+obj-$(CONFIG_CRYPTO_CRCT10DIF_PCLMUL) += crct10dif-pclmul.o
+crct10dif-pclmul-y := crct10dif-pcl-asm_64.o crct10dif-pclmul_glue.o
 
-nhpoly1305-sse2-y := nh-sse2-x86_64.o nhpoly1305-sse2-glue.o
-blake2s-x86_64-y := blake2s-core.o blake2s-glue.o
+obj-$(CONFIG_CRYPTO_POLY1305_X86_64) += poly1305-x86_64.o
 poly1305-x86_64-y := poly1305-x86_64-cryptogams.o poly1305_glue.o
 ifneq ($(CONFIG_CRYPTO_POLY1305_X86_64),)
 targets += poly1305-x86_64-cryptogams.S
 endif
 
-camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o \
-				camellia_aesni_avx_glue.o
-cast5-avx-x86_64-y := cast5-avx-x86_64-asm_64.o cast5_avx_glue.o
-cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
-twofish-avx-x86_64-y := twofish-avx-x86_64-asm_64.o twofish_avx_glue.o
-serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
-
-ifeq ($(avx2_supported),yes)
-	camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
-	chacha-x86_64-y += chacha-avx2-x86_64.o
-	serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
-
-	nhpoly1305-avx2-y := nh-avx2-x86_64.o nhpoly1305-avx2-glue.o
-endif
-
-ifeq ($(avx512_supported),yes)
-	chacha-x86_64-y += chacha-avx512vl-x86_64.o
-endif
+obj-$(CONFIG_CRYPTO_NHPOLY1305_SSE2) += nhpoly1305-sse2.o
+nhpoly1305-sse2-y := nh-sse2-x86_64.o nhpoly1305-sse2-glue.o
+obj-$(CONFIG_CRYPTO_NHPOLY1305_AVX2) += nhpoly1305-avx2.o
+nhpoly1305-avx2-y := nh-avx2-x86_64.o nhpoly1305-avx2-glue.o
 
-aesni-intel-y := aesni-intel_asm.o aesni-intel_glue.o
-aesni-intel-$(CONFIG_64BIT) += aesni-intel_avx-x86_64.o aes_ctrby8_avx-x86_64.o
-ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
-sha1-ssse3-y := sha1_ssse3_asm.o sha1_ssse3_glue.o
-ifeq ($(avx2_supported),yes)
-sha1-ssse3-y += sha1_avx2_x86_64_asm.o
-endif
-ifeq ($(sha1_ni_supported),yes)
-sha1-ssse3-y += sha1_ni_asm.o
-endif
-crc32c-intel-y := crc32c-intel_glue.o
-crc32c-intel-$(CONFIG_64BIT) += crc32c-pcl-intel-asm_64.o
-crc32-pclmul-y := crc32-pclmul_asm.o crc32-pclmul_glue.o
-sha256-ssse3-y := sha256-ssse3-asm.o sha256-avx-asm.o sha256-avx2-asm.o sha256_ssse3_glue.o
-ifeq ($(sha256_ni_supported),yes)
-sha256-ssse3-y += sha256_ni_asm.o
-endif
-sha512-ssse3-y := sha512-ssse3-asm.o sha512-avx-asm.o sha512-avx2-asm.o sha512_ssse3_glue.o
-crct10dif-pclmul-y := crct10dif-pcl-asm_64.o crct10dif-pclmul_glue.o
+obj-$(CONFIG_CRYPTO_CURVE25519_X86) += curve25519-x86_64.o
 
 quiet_cmd_perlasm = PERLASM $@
       cmd_perlasm = $(PERL) $< > $@
diff --git a/crypto/Kconfig b/crypto/Kconfig
index c24a47406f8f..49aae167e75c 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -267,7 +267,7 @@ config CRYPTO_CURVE25519
 
 config CRYPTO_CURVE25519_X86
 	tristate "x86_64 accelerated Curve25519 scalar multiplication library"
-	depends on X86 && 64BIT
+	depends on X86 && 64BIT && AS_ADX
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 
@@ -465,7 +465,7 @@ config CRYPTO_NHPOLY1305_SSE2
 
 config CRYPTO_NHPOLY1305_AVX2
 	tristate "NHPoly1305 hash function (x86_64 AVX2 implementation)"
-	depends on X86 && 64BIT
+	depends on X86 && 64BIT && AS_AVX2
 	select CRYPTO_NHPOLY1305
 	help
 	  AVX2 optimized implementation of the hash function used by the
@@ -1303,7 +1303,7 @@ config CRYPTO_CAMELLIA_AESNI_AVX_X86_64
 
 config CRYPTO_CAMELLIA_AESNI_AVX2_X86_64
 	tristate "Camellia cipher algorithm (x86_64/AES-NI/AVX2)"
-	depends on X86 && 64BIT
+	depends on X86 && 64BIT && AS_AVX2
 	depends on CRYPTO
 	select CRYPTO_CAMELLIA_AESNI_AVX_X86_64
 	help
@@ -1573,7 +1573,7 @@ config CRYPTO_SERPENT_AVX_X86_64
 
 config CRYPTO_SERPENT_AVX2_X86_64
 	tristate "Serpent cipher algorithm (x86_64/AVX2)"
-	depends on X86 && 64BIT
+	depends on X86 && 64BIT && AS_AVX2
 	select CRYPTO_SERPENT_AVX_X86_64
 	help
 	  Serpent cipher algorithm, by Anderson, Biham & Knudsen.
-- 
2.17.1

