Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF31948C1
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 21:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgCZU0O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 16:26:14 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:45591 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbgCZU0O (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:26:14 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ed5895a;
        Thu, 26 Mar 2020 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=cwXz+tI/cz1Q+/k/0GWmnSkoD
        wU=; b=xUHCCIbMiAmR4K2rEvPjySfToqycsME5+CfwZALLX3phd3mLWyhcsug79
        FeetyaHuMkGeC9TZr0ZsvDhZduOGCgY40iRwsOOgH815IpLbTcihd6nJEVZwNArb
        2THzD5MoSgWT7uUD2PoXgt1SfYkw1y0n/PjHbcRAjCuDkYbME6FxvDaigJpsSs7P
        VEcStA8KjL0xXQN0gjO0egjD3AqB/CL2EqSyqdNZQSJEmQpgIpTvVGfXS2bmNYr2
        pWAiWC2NreNJQszYa1Cfq38lRj3FRJl5xPB5Uoa/QEljTHuIE0aN2fHa6wPo/0bA
        Hfd6FYWVzGTYG4HjkXTcwnpa/21yw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8cf84d34 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Thu, 26 Mar 2020 20:18:46 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] x86: update AS_* macros to binutils >=2.23, supporting ADX and AVX2
Date:   Thu, 26 Mar 2020 14:26:00 -0600
Message-Id: <20200326202600.7086-1-Jason@zx2c4.com>
In-Reply-To: <CAKwvOdmLWqVq_EQk2S4FUSUCU7yoppYD4oiL+P7taWoDTyrb9w@mail.gmail.com>
References: <CAKwvOdmLWqVq_EQk2S4FUSUCU7yoppYD4oiL+P7taWoDTyrb9w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that the kernel specifies binutils 2.23 as the minimum version, we
can remove ifdefs for AVX2 and ADX throughout.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---


Masahiro - here's an updated patch based on -next, as Nick requested.
Whether or not you'd prefer this one to the other one based on Linus'
tree is up to you, but here it is in case it's helpful.


 arch/x86/Kconfig.assembler                    | 10 ----------
 arch/x86/crypto/Makefile                      |  6 ++----
 arch/x86/crypto/aesni-intel_avx-x86_64.S      |  3 ---
 arch/x86/crypto/aesni-intel_glue.c            |  7 -------
 arch/x86/crypto/chacha_glue.c                 |  6 ++----
 arch/x86/crypto/poly1305-x86_64-cryptogams.pl |  8 --------
 arch/x86/crypto/poly1305_glue.c               |  5 ++---
 arch/x86/crypto/sha1_ssse3_glue.c             |  6 ------
 arch/x86/crypto/sha256-avx2-asm.S             |  3 ---
 arch/x86/crypto/sha256_ssse3_glue.c           |  6 ------
 arch/x86/crypto/sha512-avx2-asm.S             |  3 ---
 arch/x86/crypto/sha512_ssse3_glue.c           |  5 -----
 crypto/Kconfig                                |  8 ++++----
 lib/raid6/algos.c                             |  6 ------
 lib/raid6/avx2.c                              |  4 ----
 lib/raid6/recov_avx2.c                        |  6 ------
 lib/raid6/test/Makefile                       |  3 ---
 net/netfilter/Makefile                        |  2 --
 net/netfilter/nf_tables_api.c                 |  2 +-
 net/netfilter/nft_set_pipapo.c                |  2 +-
 net/netfilter/nft_set_pipapo_avx2.h           |  3 ---
 21 files changed, 12 insertions(+), 92 deletions(-)

diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
index a5a1d2766b3a..13de0db38d4e 100644
--- a/arch/x86/Kconfig.assembler
+++ b/arch/x86/Kconfig.assembler
@@ -1,11 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (C) 2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
 
-config AS_AVX2
-	def_bool $(as-instr,vpbroadcastb %xmm0$(comma)%ymm1)
-	help
-	  Supported by binutils >= 2.22 and LLVM integrated assembler
-
 config AS_AVX512
 	def_bool $(as-instr,vpmovm2b %k1$(comma)%zmm5)
 	help
@@ -20,8 +15,3 @@ config AS_SHA256_NI
 	def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
 	help
 	  Supported by binutils >= 2.24 and LLVM integrated assembler
-
-config AS_ADX
-	def_bool $(as-instr,adox %eax$(comma)%eax)
-	help
-	  Supported by binutils >= 2.23 and LLVM integrated assembler
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 2f23f08fdd4b..928aad453c72 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -47,8 +47,7 @@ obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
 aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
 
 obj-$(CONFIG_CRYPTO_CHACHA20_X86_64) += chacha-x86_64.o
-chacha-x86_64-y := chacha-ssse3-x86_64.o chacha_glue.o
-chacha-x86_64-$(CONFIG_AS_AVX2) += chacha-avx2-x86_64.o
+chacha-x86_64-y := chacha-avx2-x86_64.o chacha-ssse3-x86_64.o chacha_glue.o
 chacha-x86_64-$(CONFIG_AS_AVX512) += chacha-avx512vl-x86_64.o
 
 obj-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
@@ -56,8 +55,7 @@ aesni-intel-y := aesni-intel_asm.o aesni-intel_glue.o
 aesni-intel-$(CONFIG_64BIT) += aesni-intel_avx-x86_64.o aes_ctrby8_avx-x86_64.o
 
 obj-$(CONFIG_CRYPTO_SHA1_SSSE3) += sha1-ssse3.o
-sha1-ssse3-y := sha1_ssse3_asm.o sha1_ssse3_glue.o
-sha1-ssse3-$(CONFIG_AS_AVX2) += sha1_avx2_x86_64_asm.o
+sha1-ssse3-y := sha1_avx2_x86_64_asm.o sha1_ssse3_asm.o sha1_ssse3_glue.o
 sha1-ssse3-$(CONFIG_AS_SHA1_NI) += sha1_ni_asm.o
 
 obj-$(CONFIG_CRYPTO_SHA256_SSSE3) += sha256-ssse3.o
diff --git a/arch/x86/crypto/aesni-intel_avx-x86_64.S b/arch/x86/crypto/aesni-intel_avx-x86_64.S
index cc56ee43238b..0cea33295287 100644
--- a/arch/x86/crypto/aesni-intel_avx-x86_64.S
+++ b/arch/x86/crypto/aesni-intel_avx-x86_64.S
@@ -1868,7 +1868,6 @@ key_256_finalize:
         ret
 SYM_FUNC_END(aesni_gcm_finalize_avx_gen2)
 
-#ifdef CONFIG_AS_AVX2
 ###############################################################################
 # GHASH_MUL MACRO to implement: Data*HashKey mod (128,127,126,121,0)
 # Input: A and B (128-bits each, bit-reflected)
@@ -2836,5 +2835,3 @@ key_256_finalize4:
         FUNC_RESTORE
         ret
 SYM_FUNC_END(aesni_gcm_finalize_avx_gen4)
-
-#endif /* CONFIG_AS_AVX2 */
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 655ad6bc8810..ad8a7188a2bf 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -233,7 +233,6 @@ static const struct aesni_gcm_tfm_s aesni_gcm_tfm_avx_gen2 = {
 	.finalize = &aesni_gcm_finalize_avx_gen2,
 };
 
-#ifdef CONFIG_AS_AVX2
 /*
  * asmlinkage void aesni_gcm_init_avx_gen4()
  * gcm_data *my_ctx_data, context data
@@ -276,8 +275,6 @@ static const struct aesni_gcm_tfm_s aesni_gcm_tfm_avx_gen4 = {
 	.finalize = &aesni_gcm_finalize_avx_gen4,
 };
 
-#endif
-
 static inline struct
 aesni_rfc4106_gcm_ctx *aesni_rfc4106_gcm_ctx_get(struct crypto_aead *tfm)
 {
@@ -706,10 +703,8 @@ static int gcmaes_crypt_by_sg(bool enc, struct aead_request *req,
 	if (!enc)
 		left -= auth_tag_len;
 
-#ifdef CONFIG_AS_AVX2
 	if (left < AVX_GEN4_OPTSIZE && gcm_tfm == &aesni_gcm_tfm_avx_gen4)
 		gcm_tfm = &aesni_gcm_tfm_avx_gen2;
-#endif
 	if (left < AVX_GEN2_OPTSIZE && gcm_tfm == &aesni_gcm_tfm_avx_gen2)
 		gcm_tfm = &aesni_gcm_tfm_sse;
 
@@ -1069,12 +1064,10 @@ static int __init aesni_init(void)
 	if (!x86_match_cpu(aesni_cpu_id))
 		return -ENODEV;
 #ifdef CONFIG_X86_64
-#ifdef CONFIG_AS_AVX2
 	if (boot_cpu_has(X86_FEATURE_AVX2)) {
 		pr_info("AVX2 version of gcm_enc/dec engaged.\n");
 		aesni_gcm_tfm = &aesni_gcm_tfm_avx_gen4;
 	} else
-#endif
 	if (boot_cpu_has(X86_FEATURE_AVX)) {
 		pr_info("AVX version of gcm_enc/dec engaged.\n");
 		aesni_gcm_tfm = &aesni_gcm_tfm_avx_gen2;
diff --git a/arch/x86/crypto/chacha_glue.c b/arch/x86/crypto/chacha_glue.c
index 68a74953efaf..b412c21ee06e 100644
--- a/arch/x86/crypto/chacha_glue.c
+++ b/arch/x86/crypto/chacha_glue.c
@@ -79,8 +79,7 @@ static void chacha_dosimd(u32 *state, u8 *dst, const u8 *src,
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_AS_AVX2) &&
-	    static_branch_likely(&chacha_use_avx2)) {
+	if (static_branch_likely(&chacha_use_avx2)) {
 		while (bytes >= CHACHA_BLOCK_SIZE * 8) {
 			chacha_8block_xor_avx2(state, dst, src, bytes, nrounds);
 			bytes -= CHACHA_BLOCK_SIZE * 8;
@@ -288,8 +287,7 @@ static int __init chacha_simd_mod_init(void)
 
 	static_branch_enable(&chacha_use_simd);
 
-	if (IS_ENABLED(CONFIG_AS_AVX2) &&
-	    boot_cpu_has(X86_FEATURE_AVX) &&
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
 	    boot_cpu_has(X86_FEATURE_AVX2) &&
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL)) {
 		static_branch_enable(&chacha_use_avx2);
diff --git a/arch/x86/crypto/poly1305-x86_64-cryptogams.pl b/arch/x86/crypto/poly1305-x86_64-cryptogams.pl
index 5bac2d533104..137edcf038cb 100644
--- a/arch/x86/crypto/poly1305-x86_64-cryptogams.pl
+++ b/arch/x86/crypto/poly1305-x86_64-cryptogams.pl
@@ -1514,10 +1514,6 @@ ___
 
 if ($avx>1) {
 
-if ($kernel) {
-	$code .= "#ifdef CONFIG_AS_AVX2\n";
-}
-
 my ($H0,$H1,$H2,$H3,$H4, $MASK, $T4,$T0,$T1,$T2,$T3, $D0,$D1,$D2,$D3,$D4) =
     map("%ymm$_",(0..15));
 my $S4=$MASK;
@@ -2808,10 +2804,6 @@ ___
 poly1305_blocks_avxN(0);
 &end_function("poly1305_blocks_avx2");
 
-if($kernel) {
-	$code .= "#endif\n";
-}
-
 #######################################################################
 if ($avx>2) {
 # On entry we have input length divisible by 64. But since inner loop
diff --git a/arch/x86/crypto/poly1305_glue.c b/arch/x86/crypto/poly1305_glue.c
index 4a6226e1d15e..6dfec19f7d57 100644
--- a/arch/x86/crypto/poly1305_glue.c
+++ b/arch/x86/crypto/poly1305_glue.c
@@ -108,7 +108,7 @@ static void poly1305_simd_blocks(void *ctx, const u8 *inp, size_t len,
 		kernel_fpu_begin();
 		if (IS_ENABLED(CONFIG_AS_AVX512) && static_branch_likely(&poly1305_use_avx512))
 			poly1305_blocks_avx512(ctx, inp, bytes, padbit);
-		else if (IS_ENABLED(CONFIG_AS_AVX2) && static_branch_likely(&poly1305_use_avx2))
+		else if (static_branch_likely(&poly1305_use_avx2))
 			poly1305_blocks_avx2(ctx, inp, bytes, padbit);
 		else
 			poly1305_blocks_avx(ctx, inp, bytes, padbit);
@@ -264,8 +264,7 @@ static int __init poly1305_simd_mod_init(void)
 	if (boot_cpu_has(X86_FEATURE_AVX) &&
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
 		static_branch_enable(&poly1305_use_avx);
-	if (IS_ENABLED(CONFIG_AS_AVX2) && boot_cpu_has(X86_FEATURE_AVX) &&
-	    boot_cpu_has(X86_FEATURE_AVX2) &&
+	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_AVX2) &&
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
 		static_branch_enable(&poly1305_use_avx2);
 	if (IS_ENABLED(CONFIG_AS_AVX512) && boot_cpu_has(X86_FEATURE_AVX) &&
diff --git a/arch/x86/crypto/sha1_ssse3_glue.c b/arch/x86/crypto/sha1_ssse3_glue.c
index 275b65dd30c9..a801ffc10cbb 100644
--- a/arch/x86/crypto/sha1_ssse3_glue.c
+++ b/arch/x86/crypto/sha1_ssse3_glue.c
@@ -174,7 +174,6 @@ static void unregister_sha1_avx(void)
 		crypto_unregister_shash(&sha1_avx_alg);
 }
 
-#if defined(CONFIG_AS_AVX2)
 #define SHA1_AVX2_BLOCK_OPTSIZE	4	/* optimal 4*64 bytes of SHA1 blocks */
 
 asmlinkage void sha1_transform_avx2(struct sha1_state *state,
@@ -246,11 +245,6 @@ static void unregister_sha1_avx2(void)
 		crypto_unregister_shash(&sha1_avx2_alg);
 }
 
-#else
-static inline int register_sha1_avx2(void) { return 0; }
-static inline void unregister_sha1_avx2(void) { }
-#endif
-
 #ifdef CONFIG_AS_SHA1_NI
 asmlinkage void sha1_ni_transform(struct sha1_state *digest, const u8 *data,
 				  int rounds);
diff --git a/arch/x86/crypto/sha256-avx2-asm.S b/arch/x86/crypto/sha256-avx2-asm.S
index 499d9ec129de..11ff60c29c8b 100644
--- a/arch/x86/crypto/sha256-avx2-asm.S
+++ b/arch/x86/crypto/sha256-avx2-asm.S
@@ -48,7 +48,6 @@
 # This code schedules 2 blocks at a time, with 4 lanes per block
 ########################################################################
 
-#ifdef CONFIG_AS_AVX2
 #include <linux/linkage.h>
 
 ## assume buffers not aligned
@@ -767,5 +766,3 @@ _SHUF_00BA:
 .align 32
 _SHUF_DC00:
 	.octa 0x0b0a090803020100FFFFFFFFFFFFFFFF,0x0b0a090803020100FFFFFFFFFFFFFFFF
-
-#endif
diff --git a/arch/x86/crypto/sha256_ssse3_glue.c b/arch/x86/crypto/sha256_ssse3_glue.c
index 8bdc3be31f64..6394b5fe8db6 100644
--- a/arch/x86/crypto/sha256_ssse3_glue.c
+++ b/arch/x86/crypto/sha256_ssse3_glue.c
@@ -220,7 +220,6 @@ static void unregister_sha256_avx(void)
 				ARRAY_SIZE(sha256_avx_algs));
 }
 
-#if defined(CONFIG_AS_AVX2)
 asmlinkage void sha256_transform_rorx(struct sha256_state *state,
 				      const u8 *data, int blocks);
 
@@ -295,11 +294,6 @@ static void unregister_sha256_avx2(void)
 				ARRAY_SIZE(sha256_avx2_algs));
 }
 
-#else
-static inline int register_sha256_avx2(void) { return 0; }
-static inline void unregister_sha256_avx2(void) { }
-#endif
-
 #ifdef CONFIG_AS_SHA256_NI
 asmlinkage void sha256_ni_transform(struct sha256_state *digest,
 				    const u8 *data, int rounds);
diff --git a/arch/x86/crypto/sha512-avx2-asm.S b/arch/x86/crypto/sha512-avx2-asm.S
index 3dd886b14e7d..3a44bdcfd583 100644
--- a/arch/x86/crypto/sha512-avx2-asm.S
+++ b/arch/x86/crypto/sha512-avx2-asm.S
@@ -49,7 +49,6 @@
 # This code schedules 1 blocks at a time, with 4 lanes per block
 ########################################################################
 
-#ifdef CONFIG_AS_AVX2
 #include <linux/linkage.h>
 
 .text
@@ -749,5 +748,3 @@ PSHUFFLE_BYTE_FLIP_MASK:
 MASK_YMM_LO:
 	.octa 0x00000000000000000000000000000000
 	.octa 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
-
-#endif
diff --git a/arch/x86/crypto/sha512_ssse3_glue.c b/arch/x86/crypto/sha512_ssse3_glue.c
index 75214982a633..82cc1b3ced1d 100644
--- a/arch/x86/crypto/sha512_ssse3_glue.c
+++ b/arch/x86/crypto/sha512_ssse3_glue.c
@@ -218,7 +218,6 @@ static void unregister_sha512_avx(void)
 			ARRAY_SIZE(sha512_avx_algs));
 }
 
-#if defined(CONFIG_AS_AVX2)
 asmlinkage void sha512_transform_rorx(struct sha512_state *state,
 				      const u8 *data, int blocks);
 
@@ -293,10 +292,6 @@ static void unregister_sha512_avx2(void)
 		crypto_unregister_shashes(sha512_avx2_algs,
 			ARRAY_SIZE(sha512_avx2_algs));
 }
-#else
-static inline int register_sha512_avx2(void) { return 0; }
-static inline void unregister_sha512_avx2(void) { }
-#endif
 
 static int __init sha512_ssse3_mod_init(void)
 {
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 49aae167e75c..c24a47406f8f 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -267,7 +267,7 @@ config CRYPTO_CURVE25519
 
 config CRYPTO_CURVE25519_X86
 	tristate "x86_64 accelerated Curve25519 scalar multiplication library"
-	depends on X86 && 64BIT && AS_ADX
+	depends on X86 && 64BIT
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 
@@ -465,7 +465,7 @@ config CRYPTO_NHPOLY1305_SSE2
 
 config CRYPTO_NHPOLY1305_AVX2
 	tristate "NHPoly1305 hash function (x86_64 AVX2 implementation)"
-	depends on X86 && 64BIT && AS_AVX2
+	depends on X86 && 64BIT
 	select CRYPTO_NHPOLY1305
 	help
 	  AVX2 optimized implementation of the hash function used by the
@@ -1303,7 +1303,7 @@ config CRYPTO_CAMELLIA_AESNI_AVX_X86_64
 
 config CRYPTO_CAMELLIA_AESNI_AVX2_X86_64
 	tristate "Camellia cipher algorithm (x86_64/AES-NI/AVX2)"
-	depends on X86 && 64BIT && AS_AVX2
+	depends on X86 && 64BIT
 	depends on CRYPTO
 	select CRYPTO_CAMELLIA_AESNI_AVX_X86_64
 	help
@@ -1573,7 +1573,7 @@ config CRYPTO_SERPENT_AVX_X86_64
 
 config CRYPTO_SERPENT_AVX2_X86_64
 	tristate "Serpent cipher algorithm (x86_64/AVX2)"
-	depends on X86 && 64BIT && AS_AVX2
+	depends on X86 && 64BIT
 	select CRYPTO_SERPENT_AVX_X86_64
 	help
 	  Serpent cipher algorithm, by Anderson, Biham & Knudsen.
diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index b5a02326cfb7..2dc010be793e 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -34,10 +34,8 @@ const struct raid6_calls * const raid6_algos[] = {
 	&raid6_avx512x2,
 	&raid6_avx512x1,
 #endif
-#ifdef CONFIG_AS_AVX2
 	&raid6_avx2x2,
 	&raid6_avx2x1,
-#endif
 	&raid6_sse2x2,
 	&raid6_sse2x1,
 	&raid6_sse1x2,
@@ -51,11 +49,9 @@ const struct raid6_calls * const raid6_algos[] = {
 	&raid6_avx512x2,
 	&raid6_avx512x1,
 #endif
-#ifdef CONFIG_AS_AVX2
 	&raid6_avx2x4,
 	&raid6_avx2x2,
 	&raid6_avx2x1,
-#endif
 	&raid6_sse2x4,
 	&raid6_sse2x2,
 	&raid6_sse2x1,
@@ -101,9 +97,7 @@ const struct raid6_recov_calls *const raid6_recov_algos[] = {
 #ifdef CONFIG_AS_AVX512
 	&raid6_recov_avx512,
 #endif
-#ifdef CONFIG_AS_AVX2
 	&raid6_recov_avx2,
-#endif
 	&raid6_recov_ssse3,
 #endif
 #ifdef CONFIG_S390
diff --git a/lib/raid6/avx2.c b/lib/raid6/avx2.c
index 87184b6da28a..f299476e1d76 100644
--- a/lib/raid6/avx2.c
+++ b/lib/raid6/avx2.c
@@ -13,8 +13,6 @@
  *
  */
 
-#ifdef CONFIG_AS_AVX2
-
 #include <linux/raid/pq.h>
 #include "x86.h"
 
@@ -470,5 +468,3 @@ const struct raid6_calls raid6_avx2x4 = {
 	1			/* Has cache hints */
 };
 #endif
-
-#endif /* CONFIG_AS_AVX2 */
diff --git a/lib/raid6/recov_avx2.c b/lib/raid6/recov_avx2.c
index 7a3b5e7f66ee..4e8095403ee2 100644
--- a/lib/raid6/recov_avx2.c
+++ b/lib/raid6/recov_avx2.c
@@ -4,8 +4,6 @@
  * Author: Jim Kukunas <james.t.kukunas@linux.intel.com>
  */
 
-#ifdef CONFIG_AS_AVX2
-
 #include <linux/raid/pq.h>
 #include "x86.h"
 
@@ -313,7 +311,3 @@ const struct raid6_recov_calls raid6_recov_avx2 = {
 #endif
 	.priority = 2,
 };
-
-#else
-#warning "your version of binutils lacks AVX2 support"
-#endif
diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
index 60021319ac78..a4c7cd74cff5 100644
--- a/lib/raid6/test/Makefile
+++ b/lib/raid6/test/Makefile
@@ -35,9 +35,6 @@ endif
 ifeq ($(IS_X86),yes)
         OBJS   += mmx.o sse1.o sse2.o avx2.o recov_ssse3.o recov_avx2.o avx512.o recov_avx512.o
         CFLAGS += -DCONFIG_X86
-        CFLAGS += $(shell echo "vpbroadcastb %xmm0, %ymm1" |	\
-                    gcc -c -x assembler - >/dev/null 2>&1 &&	\
-                    rm ./-.o && echo -DCONFIG_AS_AVX2=1)
 	CFLAGS += $(shell echo "vpmovm2b %k1, %zmm5" |          \
 		    gcc -c -x assembler - >/dev/null 2>&1 &&	\
 		    rm ./-.o && echo -DCONFIG_AS_AVX512=1)
diff --git a/net/netfilter/Makefile b/net/netfilter/Makefile
index 292e71dc7ba4..cd0d6ad48650 100644
--- a/net/netfilter/Makefile
+++ b/net/netfilter/Makefile
@@ -83,10 +83,8 @@ nf_tables-objs := nf_tables_core.o nf_tables_api.o nft_chain_filter.o \
 		  nft_set_pipapo.o
 
 ifdef CONFIG_X86_64
-ifneq (,$(findstring -DCONFIG_AS_AVX2=1,$(KBUILD_CFLAGS)))
 nf_tables-objs += nft_set_pipapo_avx2.o
 endif
-endif
 
 obj-$(CONFIG_NF_TABLES)		+= nf_tables.o
 obj-$(CONFIG_NFT_COMPAT)	+= nft_compat.o
diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index 5659d67bd1bd..05090aae36cc 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -3290,7 +3290,7 @@ static const struct nft_set_type *nft_set_types[] = {
 	&nft_set_rhash_type,
 	&nft_set_bitmap_type,
 	&nft_set_rbtree_type,
-#if defined(CONFIG_X86_64) && defined(CONFIG_AS_AVX2)
+#if defined(CONFIG_X86_64)
 	&nft_set_pipapo_avx2_type,
 #endif
 	&nft_set_pipapo_type,
diff --git a/net/netfilter/nft_set_pipapo.c b/net/netfilter/nft_set_pipapo.c
index 87aabf651cfe..459a4758d6fa 100644
--- a/net/netfilter/nft_set_pipapo.c
+++ b/net/netfilter/nft_set_pipapo.c
@@ -2201,7 +2201,7 @@ const struct nft_set_type nft_set_pipapo_type = {
 	},
 };
 
-#if defined(CONFIG_X86_64) && defined(CONFIG_AS_AVX2)
+#if defined(CONFIG_X86_64)
 const struct nft_set_type nft_set_pipapo_avx2_type = {
 	.features	= NFT_SET_INTERVAL | NFT_SET_MAP | NFT_SET_OBJECT |
 			  NFT_SET_TIMEOUT,
diff --git a/net/netfilter/nft_set_pipapo_avx2.h b/net/netfilter/nft_set_pipapo_avx2.h
index 396caf7bfca8..8467337c5f4c 100644
--- a/net/netfilter/nft_set_pipapo_avx2.h
+++ b/net/netfilter/nft_set_pipapo_avx2.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _NFT_SET_PIPAPO_AVX2_H
 
-#ifdef CONFIG_AS_AVX2
 #include <asm/fpu/xstate.h>
 #define NFT_PIPAPO_ALIGN	(XSAVE_YMM_SIZE / BITS_PER_BYTE)
 
@@ -9,6 +8,4 @@ bool nft_pipapo_avx2_lookup(const struct net *net, const struct nft_set *set,
 			    const u32 *key, const struct nft_set_ext **ext);
 bool nft_pipapo_avx2_estimate(const struct nft_set_desc *desc, u32 features,
 			      struct nft_set_estimate *est);
-#endif /* CONFIG_AS_AVX2 */
-
 #endif /* _NFT_SET_PIPAPO_AVX2_H */
-- 
2.26.0

