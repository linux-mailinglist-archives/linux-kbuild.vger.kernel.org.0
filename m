Return-Path: <linux-kbuild+bounces-6488-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFEA7D9FD
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 11:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78623AE2D7
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 09:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F18823312D;
	Mon,  7 Apr 2025 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiQZrMSf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF562309A7;
	Mon,  7 Apr 2025 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018903; cv=none; b=E7VuAdwgTU7NIuV4lRcblVUp4sblXIVacWP7o57OYwLS7SHDLC768hYrMsKCjISNSkz+yvFFVVKKSL1me9U+L44utASysqmxgrgZaAyt+ylIEnLXeZeWlZoiZSN4Rr9FHka97uot3GjkgeHoT4hK7ujGsjM9k7qLdztCO4HvfbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018903; c=relaxed/simple;
	bh=mI+3bipaOmJUH4knYr06+/ku52LKZqYWrp8NqbHkcd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iPfxdDx0vCzpX7N+PRXqzsu4vWqPhbMEPmy60T1EJo1fcjp6hwch/wRiiWPw5pOyqRwtk9xjyp0oZaoU/JmKO5YPqKC6Fdc4ZczDzVpG/9GFRu91IdGWn7/H4GdM6Qi0zDaPZ8+rKji/Gpuat1dhfvJW8Qhnf95Y2jCumKpzJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiQZrMSf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC04AC4CEE9;
	Mon,  7 Apr 2025 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744018902;
	bh=mI+3bipaOmJUH4knYr06+/ku52LKZqYWrp8NqbHkcd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RiQZrMSf4cNZa9BmaotwhAZwNNoNYnrwSlbZ+FF1MwzkJ5HVB/CdgR/cS10z10e9y
	 CCFUNoXHCH7PLfGnnbAEHkkRb/iuxIl+xzcTXOpZUZLjuC30+liamrYRydGgOhWVv6
	 jfI/C/rsj06A9qOgwppgwdxiwuKFdp8DBcnL1r+B/66v1p3PqW5RELs07VBgGohbB2
	 BU+Igb17E6kaJlVl0R4aiJ6Qi4BpjTk0/UlnlKyNqF0ZFoQ3NxH3UiXZd6t+5kHCEd
	 sDrBXZGjvYsrtHUHG82AxVqWfOTA3uWDMzpoXBoxIcdRfz+JMiaL35yeIdih2Wnkjn
	 wxPus0uLoS/xw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 3/4] x86: remove checks for binutils-2.30 and earlier
Date: Mon,  7 Apr 2025 11:41:15 +0200
Message-Id: <20250407094116.1339199-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094116.1339199-1-arnd@kernel.org>
References: <20250407094116.1339199-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Linux now requires binutils-2.30, so a lot of the compile time
checks are unnecessary and can be removed.

Building with earlier assembler versions now causes a build failure
on the crypto drivers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/Kconfig.assembler                    | 29 -------------------
 arch/x86/crypto/Kconfig                       |  2 +-
 arch/x86/crypto/Makefile                      | 12 ++++----
 arch/x86/crypto/aes-ctr-avx-x86_64.S          |  2 --
 arch/x86/crypto/aes-xts-avx-x86_64.S          |  2 --
 arch/x86/crypto/aesni-intel_glue.c            | 21 ++------------
 arch/x86/crypto/aria-aesni-avx-asm_64.S       | 10 -------
 arch/x86/crypto/aria-aesni-avx2-asm_64.S      | 10 +------
 arch/x86/crypto/aria_aesni_avx2_glue.c        |  4 +--
 arch/x86/crypto/aria_aesni_avx_glue.c         |  4 +--
 arch/x86/crypto/blake2s-core.S                |  4 ---
 arch/x86/crypto/blake2s-glue.c                |  6 ++--
 arch/x86/crypto/chacha_glue.c                 |  6 ++--
 arch/x86/crypto/poly1305-x86_64-cryptogams.pl |  8 -----
 arch/x86/crypto/poly1305_glue.c               |  4 +--
 arch/x86/crypto/sha1_ssse3_glue.c             | 10 -------
 arch/x86/crypto/sha256_ssse3_glue.c           | 10 -------
 17 files changed, 17 insertions(+), 127 deletions(-)

diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
index 6d20a6ce0507..977a08b3746d 100644
--- a/arch/x86/Kconfig.assembler
+++ b/arch/x86/Kconfig.assembler
@@ -1,40 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (C) 2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
 
-config AS_AVX512
-	def_bool $(as-instr,vpmovm2b %k1$(comma)%zmm5)
-	help
-	  Supported by binutils >= 2.25 and LLVM integrated assembler
-
-config AS_SHA1_NI
-	def_bool $(as-instr,sha1msg1 %xmm0$(comma)%xmm1)
-	help
-	  Supported by binutils >= 2.24 and LLVM integrated assembler
-
-config AS_SHA256_NI
-	def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
-	help
-	  Supported by binutils >= 2.24 and LLVM integrated assembler
 config AS_TPAUSE
 	def_bool $(as-instr,tpause %ecx)
 	help
 	  Supported by binutils >= 2.31.1 and LLVM integrated assembler >= V7
 
-config AS_GFNI
-	def_bool $(as-instr,vgf2p8mulb %xmm0$(comma)%xmm1$(comma)%xmm2)
-	help
-	  Supported by binutils >= 2.30 and LLVM integrated assembler
-
-config AS_VAES
-	def_bool $(as-instr,vaesenc %ymm0$(comma)%ymm1$(comma)%ymm2)
-	help
-	  Supported by binutils >= 2.30 and LLVM integrated assembler
-
-config AS_VPCLMULQDQ
-	def_bool $(as-instr,vpclmulqdq \$0x10$(comma)%ymm0$(comma)%ymm1$(comma)%ymm2)
-	help
-	  Supported by binutils >= 2.30 and LLVM integrated assembler
-
 config AS_WRUSS
 	def_bool $(as-instr64,wrussq %rax$(comma)(%rbx))
 	help
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 3d948f10c94c..91954bd3d441 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -332,7 +332,7 @@ config CRYPTO_ARIA_AESNI_AVX2_X86_64
 
 config CRYPTO_ARIA_GFNI_AVX512_X86_64
 	tristate "Ciphers: ARIA with modes: ECB, CTR (AVX512/GFNI)"
-	depends on X86 && 64BIT && AS_AVX512 && AS_GFNI
+	depends on X86 && 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SIMD
 	select CRYPTO_ALGAPI
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 5d19f41bde58..f9234af53353 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -44,24 +44,22 @@ aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
 
 obj-$(CONFIG_CRYPTO_CHACHA20_X86_64) += chacha-x86_64.o
 chacha-x86_64-y := chacha-avx2-x86_64.o chacha-ssse3-x86_64.o chacha_glue.o
-chacha-x86_64-$(CONFIG_AS_AVX512) += chacha-avx512vl-x86_64.o
+chacha-x86_64-y += chacha-avx512vl-x86_64.o
 
 obj-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
 aesni-intel-y := aesni-intel_asm.o aesni-intel_glue.o
 aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-gcm-aesni-x86_64.o \
 			       aes-xts-avx-x86_64.o
-ifeq ($(CONFIG_AS_VAES)$(CONFIG_AS_VPCLMULQDQ),yy)
 aesni-intel-$(CONFIG_64BIT) += aes-gcm-avx10-x86_64.o
-endif
 
 obj-$(CONFIG_CRYPTO_SHA1_SSSE3) += sha1-ssse3.o
-sha1-ssse3-y := sha1_avx2_x86_64_asm.o sha1_ssse3_asm.o sha1_ssse3_glue.o
-sha1-ssse3-$(CONFIG_AS_SHA1_NI) += sha1_ni_asm.o
+sha1-ssse3-y := sha1_avx2_x86_64_asm.o sha1_ssse3_asm.o sha1_ssse3_glue.o \
+		sha1_ni_asm.o
 
 obj-$(CONFIG_CRYPTO_SHA256_SSSE3) += sha256-ssse3.o
-sha256-ssse3-y := sha256-ssse3-asm.o sha256-avx-asm.o sha256-avx2-asm.o sha256_ssse3_glue.o
-sha256-ssse3-$(CONFIG_AS_SHA256_NI) += sha256_ni_asm.o
+sha256-ssse3-y := sha256-ssse3-asm.o sha256-avx-asm.o sha256-avx2-asm.o \
+		  sha256_ssse3_glue.o sha256_ni_asm.o
 
 obj-$(CONFIG_CRYPTO_SHA512_SSSE3) += sha512-ssse3.o
 sha512-ssse3-y := sha512-ssse3-asm.o sha512-avx-asm.o sha512-avx2-asm.o sha512_ssse3_glue.o
diff --git a/arch/x86/crypto/aes-ctr-avx-x86_64.S b/arch/x86/crypto/aes-ctr-avx-x86_64.S
index 1685d8b24b2c..c7189f3f3669 100644
--- a/arch/x86/crypto/aes-ctr-avx-x86_64.S
+++ b/arch/x86/crypto/aes-ctr-avx-x86_64.S
@@ -562,7 +562,6 @@ SYM_TYPED_FUNC_START(aes_xctr_crypt_aesni_avx)
 	_aes_ctr_crypt	1
 SYM_FUNC_END(aes_xctr_crypt_aesni_avx)
 
-#if defined(CONFIG_AS_VAES) && defined(CONFIG_AS_VPCLMULQDQ)
 .set	VL, 32
 .set	USE_AVX10, 0
 SYM_TYPED_FUNC_START(aes_ctr64_crypt_vaes_avx2)
@@ -589,4 +588,3 @@ SYM_FUNC_END(aes_ctr64_crypt_vaes_avx10_512)
 SYM_TYPED_FUNC_START(aes_xctr_crypt_vaes_avx10_512)
 	_aes_ctr_crypt	1
 SYM_FUNC_END(aes_xctr_crypt_vaes_avx10_512)
-#endif // CONFIG_AS_VAES && CONFIG_AS_VPCLMULQDQ
diff --git a/arch/x86/crypto/aes-xts-avx-x86_64.S b/arch/x86/crypto/aes-xts-avx-x86_64.S
index 93ba0ddbe009..617c17e69b9f 100644
--- a/arch/x86/crypto/aes-xts-avx-x86_64.S
+++ b/arch/x86/crypto/aes-xts-avx-x86_64.S
@@ -861,7 +861,6 @@ SYM_TYPED_FUNC_START(aes_xts_decrypt_aesni_avx)
 	_aes_xts_crypt	0
 SYM_FUNC_END(aes_xts_decrypt_aesni_avx)
 
-#if defined(CONFIG_AS_VAES) && defined(CONFIG_AS_VPCLMULQDQ)
 .set	VL, 32
 .set	USE_AVX10, 0
 SYM_TYPED_FUNC_START(aes_xts_encrypt_vaes_avx2)
@@ -888,4 +887,3 @@ SYM_FUNC_END(aes_xts_encrypt_vaes_avx10_512)
 SYM_TYPED_FUNC_START(aes_xts_decrypt_vaes_avx10_512)
 	_aes_xts_crypt	0
 SYM_FUNC_END(aes_xts_decrypt_vaes_avx10_512)
-#endif /* CONFIG_AS_VAES && CONFIG_AS_VPCLMULQDQ */
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index bc655d794a95..684fbfb12345 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -842,11 +842,9 @@ static struct simd_skcipher_alg *					       \
 simd_skcipher_algs_##suffix[ARRAY_SIZE(skcipher_algs_##suffix)]
 
 DEFINE_AVX_SKCIPHER_ALGS(aesni_avx, "aesni-avx", 500);
-#if defined(CONFIG_AS_VAES) && defined(CONFIG_AS_VPCLMULQDQ)
 DEFINE_AVX_SKCIPHER_ALGS(vaes_avx2, "vaes-avx2", 600);
 DEFINE_AVX_SKCIPHER_ALGS(vaes_avx10_256, "vaes-avx10_256", 700);
 DEFINE_AVX_SKCIPHER_ALGS(vaes_avx10_512, "vaes-avx10_512", 800);
-#endif
 
 /* The common part of the x86_64 AES-GCM key struct */
 struct aes_gcm_key {
@@ -927,17 +925,8 @@ struct aes_gcm_key_avx10 {
 #define FLAG_RFC4106	BIT(0)
 #define FLAG_ENC	BIT(1)
 #define FLAG_AVX	BIT(2)
-#if defined(CONFIG_AS_VAES) && defined(CONFIG_AS_VPCLMULQDQ)
-#  define FLAG_AVX10_256	BIT(3)
-#  define FLAG_AVX10_512	BIT(4)
-#else
-   /*
-    * This should cause all calls to the AVX10 assembly functions to be
-    * optimized out, avoiding the need to ifdef each call individually.
-    */
-#  define FLAG_AVX10_256	0
-#  define FLAG_AVX10_512	0
-#endif
+#define FLAG_AVX10_256	BIT(3)
+#define FLAG_AVX10_512	BIT(4)
 
 static inline struct aes_gcm_key *
 aes_gcm_key_get(struct crypto_aead *tfm, int flags)
@@ -1538,7 +1527,6 @@ DEFINE_GCM_ALGS(aesni_avx, FLAG_AVX,
 		"generic-gcm-aesni-avx", "rfc4106-gcm-aesni-avx",
 		AES_GCM_KEY_AESNI_SIZE, 500);
 
-#if defined(CONFIG_AS_VAES) && defined(CONFIG_AS_VPCLMULQDQ)
 /* aes_gcm_algs_vaes_avx10_256 */
 DEFINE_GCM_ALGS(vaes_avx10_256, FLAG_AVX10_256,
 		"generic-gcm-vaes-avx10_256", "rfc4106-gcm-vaes-avx10_256",
@@ -1548,7 +1536,6 @@ DEFINE_GCM_ALGS(vaes_avx10_256, FLAG_AVX10_256,
 DEFINE_GCM_ALGS(vaes_avx10_512, FLAG_AVX10_512,
 		"generic-gcm-vaes-avx10_512", "rfc4106-gcm-vaes-avx10_512",
 		AES_GCM_KEY_AVX10_SIZE, 800);
-#endif /* CONFIG_AS_VAES && CONFIG_AS_VPCLMULQDQ */
 
 static int __init register_avx_algs(void)
 {
@@ -1572,7 +1559,6 @@ static int __init register_avx_algs(void)
 	 * Similarly, the assembler support was added at about the same time.
 	 * For simplicity, just always check for VAES and VPCLMULQDQ together.
 	 */
-#if defined(CONFIG_AS_VAES) && defined(CONFIG_AS_VPCLMULQDQ)
 	if (!boot_cpu_has(X86_FEATURE_AVX2) ||
 	    !boot_cpu_has(X86_FEATURE_VAES) ||
 	    !boot_cpu_has(X86_FEATURE_VPCLMULQDQ) ||
@@ -1622,7 +1608,6 @@ static int __init register_avx_algs(void)
 					 aes_gcm_simdalgs_vaes_avx10_512);
 	if (err)
 		return err;
-#endif /* CONFIG_AS_VAES && CONFIG_AS_VPCLMULQDQ */
 	return 0;
 }
 
@@ -1636,7 +1621,6 @@ static void unregister_avx_algs(void)
 		simd_unregister_aeads(aes_gcm_algs_aesni_avx,
 				      ARRAY_SIZE(aes_gcm_algs_aesni_avx),
 				      aes_gcm_simdalgs_aesni_avx);
-#if defined(CONFIG_AS_VAES) && defined(CONFIG_AS_VPCLMULQDQ)
 	if (simd_skcipher_algs_vaes_avx2[0])
 		simd_unregister_skciphers(skcipher_algs_vaes_avx2,
 					  ARRAY_SIZE(skcipher_algs_vaes_avx2),
@@ -1657,7 +1641,6 @@ static void unregister_avx_algs(void)
 		simd_unregister_aeads(aes_gcm_algs_vaes_avx10_512,
 				      ARRAY_SIZE(aes_gcm_algs_vaes_avx10_512),
 				      aes_gcm_simdalgs_vaes_avx10_512);
-#endif
 }
 #else /* CONFIG_X86_64 */
 static struct aead_alg aes_gcm_algs_aesni[0];
diff --git a/arch/x86/crypto/aria-aesni-avx-asm_64.S b/arch/x86/crypto/aria-aesni-avx-asm_64.S
index 9556dacd9841..932fb17308e7 100644
--- a/arch/x86/crypto/aria-aesni-avx-asm_64.S
+++ b/arch/x86/crypto/aria-aesni-avx-asm_64.S
@@ -295,7 +295,6 @@
 	vpshufb t1, t0, t2;				\
 	vpxor t2, x7, x7;
 
-#ifdef CONFIG_AS_GFNI
 #define aria_sbox_8way_gfni(x0, x1, x2, x3,		\
 			    x4, x5, x6, x7,		\
 			    t0, t1, t2, t3,		\
@@ -318,8 +317,6 @@
 	vgf2p8affineinvqb $0, t2, x3, x3;		\
 	vgf2p8affineinvqb $0, t2, x7, x7
 
-#endif /* CONFIG_AS_GFNI */
-
 #define aria_sbox_8way(x0, x1, x2, x3,            	\
 		       x4, x5, x6, x7,			\
 		       t0, t1, t2, t3,			\
@@ -561,7 +558,6 @@
 			     y4, y5, y6, y7,		\
 			     mem_tmp, 8);
 
-#ifdef CONFIG_AS_GFNI
 #define aria_fe_gfni(x0, x1, x2, x3,			\
 		     x4, x5, x6, x7,			\
 		     y0, y1, y2, y3,			\
@@ -719,8 +715,6 @@
 			     y4, y5, y6, y7,		\
 			     mem_tmp, 8);
 
-#endif /* CONFIG_AS_GFNI */
-
 /* NB: section is mergeable, all elements must be aligned 16-byte blocks */
 .section	.rodata.cst16, "aM", @progbits, 16
 .align 16
@@ -772,7 +766,6 @@
 .Ltf_hi__x2__and__fwd_aff:
 	.octa 0x3F893781E95FE1576CDA64D2BA0CB204
 
-#ifdef CONFIG_AS_GFNI
 /* AES affine: */
 #define tf_aff_const BV8(1, 1, 0, 0, 0, 1, 1, 0)
 .Ltf_aff_bitmatrix:
@@ -871,7 +864,6 @@
 		    BV8(0, 0, 0, 0, 0, 1, 0, 0),
 		    BV8(0, 0, 0, 0, 0, 0, 1, 0),
 		    BV8(0, 0, 0, 0, 0, 0, 0, 1))
-#endif /* CONFIG_AS_GFNI */
 
 /* 4-bit mask */
 .section	.rodata.cst4.L0f0f0f0f, "aM", @progbits, 4
@@ -1140,7 +1132,6 @@ SYM_TYPED_FUNC_START(aria_aesni_avx_ctr_crypt_16way)
 	RET;
 SYM_FUNC_END(aria_aesni_avx_ctr_crypt_16way)
 
-#ifdef CONFIG_AS_GFNI
 SYM_FUNC_START_LOCAL(__aria_aesni_avx_gfni_crypt_16way)
 	/* input:
 	*      %r9: rk
@@ -1359,4 +1350,3 @@ SYM_TYPED_FUNC_START(aria_aesni_avx_gfni_ctr_crypt_16way)
 	FRAME_END
 	RET;
 SYM_FUNC_END(aria_aesni_avx_gfni_ctr_crypt_16way)
-#endif /* CONFIG_AS_GFNI */
diff --git a/arch/x86/crypto/aria-aesni-avx2-asm_64.S b/arch/x86/crypto/aria-aesni-avx2-asm_64.S
index c60fa2980630..ed53d4f46bd7 100644
--- a/arch/x86/crypto/aria-aesni-avx2-asm_64.S
+++ b/arch/x86/crypto/aria-aesni-avx2-asm_64.S
@@ -302,7 +302,6 @@
 	vpbroadcastb ((round * 16) + idx + 4)(rk), t0;	\
 	vpxor t0, x7, x7;
 
-#ifdef CONFIG_AS_GFNI
 #define aria_sbox_8way_gfni(x0, x1, x2, x3,		\
 			    x4, x5, x6, x7,		\
 			    t0, t1, t2, t3,		\
@@ -325,7 +324,6 @@
 	vgf2p8affineinvqb $0, t2, x3, x3;		\
 	vgf2p8affineinvqb $0, t2, x7, x7
 
-#endif /* CONFIG_AS_GFNI */
 #define aria_sbox_8way(x0, x1, x2, x3,			\
 		       x4, x5, x6, x7,			\
 		       t0, t1, t2, t3,			\
@@ -598,7 +596,7 @@
 	aria_load_state_8way(y0, y1, y2, y3,		\
 			     y4, y5, y6, y7,		\
 			     mem_tmp, 8);
-#ifdef CONFIG_AS_GFNI
+
 #define aria_fe_gfni(x0, x1, x2, x3,			\
 		     x4, x5, x6, x7,			\
 		     y0, y1, y2, y3,			\
@@ -752,7 +750,6 @@
 	aria_load_state_8way(y0, y1, y2, y3,		\
 			     y4, y5, y6, y7,		\
 			     mem_tmp, 8);
-#endif /* CONFIG_AS_GFNI */
 
 .section        .rodata.cst32.shufb_16x16b, "aM", @progbits, 32
 .align 32
@@ -806,7 +803,6 @@
 .Ltf_hi__x2__and__fwd_aff:
 	.octa 0x3F893781E95FE1576CDA64D2BA0CB204
 
-#ifdef CONFIG_AS_GFNI
 .section	.rodata.cst8, "aM", @progbits, 8
 .align 8
 /* AES affine: */
@@ -868,8 +864,6 @@
 		    BV8(0, 0, 0, 0, 0, 0, 1, 0),
 		    BV8(0, 0, 0, 0, 0, 0, 0, 1))
 
-#endif /* CONFIG_AS_GFNI */
-
 /* 4-bit mask */
 .section	.rodata.cst4.L0f0f0f0f, "aM", @progbits, 4
 .align 4
@@ -1219,7 +1213,6 @@ SYM_TYPED_FUNC_START(aria_aesni_avx2_ctr_crypt_32way)
 	RET;
 SYM_FUNC_END(aria_aesni_avx2_ctr_crypt_32way)
 
-#ifdef CONFIG_AS_GFNI
 SYM_FUNC_START_LOCAL(__aria_aesni_avx2_gfni_crypt_32way)
 	/* input:
 	 *      %r9: rk
@@ -1438,4 +1431,3 @@ SYM_TYPED_FUNC_START(aria_aesni_avx2_gfni_ctr_crypt_32way)
 	FRAME_END
 	RET;
 SYM_FUNC_END(aria_aesni_avx2_gfni_ctr_crypt_32way)
-#endif /* CONFIG_AS_GFNI */
diff --git a/arch/x86/crypto/aria_aesni_avx2_glue.c b/arch/x86/crypto/aria_aesni_avx2_glue.c
index 87a11804fc77..95fccc6dc420 100644
--- a/arch/x86/crypto/aria_aesni_avx2_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx2_glue.c
@@ -26,7 +26,6 @@ asmlinkage void aria_aesni_avx2_ctr_crypt_32way(const void *ctx, u8 *dst,
 						const u8 *src,
 						u8 *keystream, u8 *iv);
 EXPORT_SYMBOL_GPL(aria_aesni_avx2_ctr_crypt_32way);
-#ifdef CONFIG_AS_GFNI
 asmlinkage void aria_aesni_avx2_gfni_encrypt_32way(const void *ctx, u8 *dst,
 						   const u8 *src);
 EXPORT_SYMBOL_GPL(aria_aesni_avx2_gfni_encrypt_32way);
@@ -37,7 +36,6 @@ asmlinkage void aria_aesni_avx2_gfni_ctr_crypt_32way(const void *ctx, u8 *dst,
 						     const u8 *src,
 						     u8 *keystream, u8 *iv);
 EXPORT_SYMBOL_GPL(aria_aesni_avx2_gfni_ctr_crypt_32way);
-#endif /* CONFIG_AS_GFNI */
 
 static struct aria_avx_ops aria_ops;
 
@@ -217,7 +215,7 @@ static int __init aria_avx2_init(void)
 		return -ENODEV;
 	}
 
-	if (boot_cpu_has(X86_FEATURE_GFNI) && IS_ENABLED(CONFIG_AS_GFNI)) {
+	if (boot_cpu_has(X86_FEATURE_GFNI)) {
 		aria_ops.aria_encrypt_16way = aria_aesni_avx_gfni_encrypt_16way;
 		aria_ops.aria_decrypt_16way = aria_aesni_avx_gfni_decrypt_16way;
 		aria_ops.aria_ctr_crypt_16way = aria_aesni_avx_gfni_ctr_crypt_16way;
diff --git a/arch/x86/crypto/aria_aesni_avx_glue.c b/arch/x86/crypto/aria_aesni_avx_glue.c
index 4e1516b76669..487094d64863 100644
--- a/arch/x86/crypto/aria_aesni_avx_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx_glue.c
@@ -26,7 +26,6 @@ asmlinkage void aria_aesni_avx_ctr_crypt_16way(const void *ctx, u8 *dst,
 					       const u8 *src,
 					       u8 *keystream, u8 *iv);
 EXPORT_SYMBOL_GPL(aria_aesni_avx_ctr_crypt_16way);
-#ifdef CONFIG_AS_GFNI
 asmlinkage void aria_aesni_avx_gfni_encrypt_16way(const void *ctx, u8 *dst,
 						  const u8 *src);
 EXPORT_SYMBOL_GPL(aria_aesni_avx_gfni_encrypt_16way);
@@ -37,7 +36,6 @@ asmlinkage void aria_aesni_avx_gfni_ctr_crypt_16way(const void *ctx, u8 *dst,
 						    const u8 *src,
 						    u8 *keystream, u8 *iv);
 EXPORT_SYMBOL_GPL(aria_aesni_avx_gfni_ctr_crypt_16way);
-#endif /* CONFIG_AS_GFNI */
 
 static struct aria_avx_ops aria_ops;
 
@@ -203,7 +201,7 @@ static int __init aria_avx_init(void)
 		return -ENODEV;
 	}
 
-	if (boot_cpu_has(X86_FEATURE_GFNI) && IS_ENABLED(CONFIG_AS_GFNI)) {
+	if (boot_cpu_has(X86_FEATURE_GFNI)) {
 		aria_ops.aria_encrypt_16way = aria_aesni_avx_gfni_encrypt_16way;
 		aria_ops.aria_decrypt_16way = aria_aesni_avx_gfni_decrypt_16way;
 		aria_ops.aria_ctr_crypt_16way = aria_aesni_avx_gfni_ctr_crypt_16way;
diff --git a/arch/x86/crypto/blake2s-core.S b/arch/x86/crypto/blake2s-core.S
index b50b35ff1fdb..ac1c845445a4 100644
--- a/arch/x86/crypto/blake2s-core.S
+++ b/arch/x86/crypto/blake2s-core.S
@@ -29,7 +29,6 @@ SIGMA:
 .byte 13,  7, 12,  3, 11, 14,  1,  9,  2,  5, 15,  8, 10,  0,  4,  6
 .byte  6, 14, 11,  0, 15,  9,  3,  8, 10, 12, 13,  1,  5,  2,  7,  4
 .byte 10,  8,  7,  1,  2,  4,  6,  5, 13, 15,  9,  3,  0, 11, 14, 12
-#ifdef CONFIG_AS_AVX512
 .section .rodata.cst64.BLAKE2S_SIGMA2, "aM", @progbits, 640
 .align 64
 SIGMA2:
@@ -43,7 +42,6 @@ SIGMA2:
 .long  6, 13,  0, 14, 12,  2,  1, 11, 15,  4,  5,  8,  7,  9,  3, 10
 .long 15,  5,  4, 13, 10,  7,  3, 11, 12,  2,  0,  6,  9,  8,  1, 14
 .long  8,  7, 14, 11, 13, 15,  0, 12, 10,  4,  5,  6,  3,  2,  1,  9
-#endif /* CONFIG_AS_AVX512 */
 
 .text
 SYM_FUNC_START(blake2s_compress_ssse3)
@@ -174,7 +172,6 @@ SYM_FUNC_START(blake2s_compress_ssse3)
 	RET
 SYM_FUNC_END(blake2s_compress_ssse3)
 
-#ifdef CONFIG_AS_AVX512
 SYM_FUNC_START(blake2s_compress_avx512)
 	vmovdqu		(%rdi),%xmm0
 	vmovdqu		0x10(%rdi),%xmm1
@@ -253,4 +250,3 @@ SYM_FUNC_START(blake2s_compress_avx512)
 	vzeroupper
 	RET
 SYM_FUNC_END(blake2s_compress_avx512)
-#endif /* CONFIG_AS_AVX512 */
diff --git a/arch/x86/crypto/blake2s-glue.c b/arch/x86/crypto/blake2s-glue.c
index 0313f9673f56..00f84f29cc8c 100644
--- a/arch/x86/crypto/blake2s-glue.c
+++ b/arch/x86/crypto/blake2s-glue.c
@@ -41,8 +41,7 @@ void blake2s_compress(struct blake2s_state *state, const u8 *block,
 					    SZ_4K / BLAKE2S_BLOCK_SIZE);
 
 		kernel_fpu_begin();
-		if (IS_ENABLED(CONFIG_AS_AVX512) &&
-		    static_branch_likely(&blake2s_use_avx512))
+		if (static_branch_likely(&blake2s_use_avx512))
 			blake2s_compress_avx512(state, block, blocks, inc);
 		else
 			blake2s_compress_ssse3(state, block, blocks, inc);
@@ -59,8 +58,7 @@ static int __init blake2s_mod_init(void)
 	if (boot_cpu_has(X86_FEATURE_SSSE3))
 		static_branch_enable(&blake2s_use_ssse3);
 
-	if (IS_ENABLED(CONFIG_AS_AVX512) &&
-	    boot_cpu_has(X86_FEATURE_AVX) &&
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
 	    boot_cpu_has(X86_FEATURE_AVX2) &&
 	    boot_cpu_has(X86_FEATURE_AVX512F) &&
 	    boot_cpu_has(X86_FEATURE_AVX512VL) &&
diff --git a/arch/x86/crypto/chacha_glue.c b/arch/x86/crypto/chacha_glue.c
index 8bb74a272879..ce12ad807af1 100644
--- a/arch/x86/crypto/chacha_glue.c
+++ b/arch/x86/crypto/chacha_glue.c
@@ -48,8 +48,7 @@ static unsigned int chacha_advance(unsigned int len, unsigned int maxblocks)
 static void chacha_dosimd(u32 *state, u8 *dst, const u8 *src,
 			  unsigned int bytes, int nrounds)
 {
-	if (IS_ENABLED(CONFIG_AS_AVX512) &&
-	    static_branch_likely(&chacha_use_avx512vl)) {
+	if (static_branch_likely(&chacha_use_avx512vl)) {
 		while (bytes >= CHACHA_BLOCK_SIZE * 8) {
 			chacha_8block_xor_avx512vl(state, dst, src, bytes,
 						   nrounds);
@@ -282,8 +281,7 @@ static int __init chacha_simd_mod_init(void)
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL)) {
 		static_branch_enable(&chacha_use_avx2);
 
-		if (IS_ENABLED(CONFIG_AS_AVX512) &&
-		    boot_cpu_has(X86_FEATURE_AVX512VL) &&
+		if (boot_cpu_has(X86_FEATURE_AVX512VL) &&
 		    boot_cpu_has(X86_FEATURE_AVX512BW)) /* kmovq */
 			static_branch_enable(&chacha_use_avx512vl);
 	}
diff --git a/arch/x86/crypto/poly1305-x86_64-cryptogams.pl b/arch/x86/crypto/poly1305-x86_64-cryptogams.pl
index b9abcd79c1f4..409ec6955733 100644
--- a/arch/x86/crypto/poly1305-x86_64-cryptogams.pl
+++ b/arch/x86/crypto/poly1305-x86_64-cryptogams.pl
@@ -2811,18 +2811,10 @@ if ($avx>2) {
 # reason stack layout is kept identical to poly1305_blocks_avx2. If not
 # for this tail, we wouldn't have to even allocate stack frame...
 
-if($kernel) {
-	$code .= "#ifdef CONFIG_AS_AVX512\n";
-}
-
 &declare_function("poly1305_blocks_avx512", 32, 4);
 poly1305_blocks_avxN(1);
 &end_function("poly1305_blocks_avx512");
 
-if ($kernel) {
-	$code .= "#endif\n";
-}
-
 if (!$kernel && $avx>3) {
 ########################################################################
 # VPMADD52 version using 2^44 radix.
diff --git a/arch/x86/crypto/poly1305_glue.c b/arch/x86/crypto/poly1305_glue.c
index 08ff4b489f7e..506a6f2beb78 100644
--- a/arch/x86/crypto/poly1305_glue.c
+++ b/arch/x86/crypto/poly1305_glue.c
@@ -107,7 +107,7 @@ static void poly1305_simd_blocks(void *ctx, const u8 *inp, size_t len,
 		const size_t bytes = min_t(size_t, len, SZ_4K);
 
 		kernel_fpu_begin();
-		if (IS_ENABLED(CONFIG_AS_AVX512) && static_branch_likely(&poly1305_use_avx512))
+		if (static_branch_likely(&poly1305_use_avx512))
 			poly1305_blocks_avx512(ctx, inp, bytes, padbit);
 		else if (static_branch_likely(&poly1305_use_avx2))
 			poly1305_blocks_avx2(ctx, inp, bytes, padbit);
@@ -265,7 +265,7 @@ static int __init poly1305_simd_mod_init(void)
 	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_AVX2) &&
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
 		static_branch_enable(&poly1305_use_avx2);
-	if (IS_ENABLED(CONFIG_AS_AVX512) && boot_cpu_has(X86_FEATURE_AVX) &&
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
 	    boot_cpu_has(X86_FEATURE_AVX2) && boot_cpu_has(X86_FEATURE_AVX512F) &&
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM | XFEATURE_MASK_AVX512, NULL) &&
 	    /* Skylake downclocks unacceptably much when using zmm, but later generations are fast. */
diff --git a/arch/x86/crypto/sha1_ssse3_glue.c b/arch/x86/crypto/sha1_ssse3_glue.c
index ab8bc54f254d..abb793cbad01 100644
--- a/arch/x86/crypto/sha1_ssse3_glue.c
+++ b/arch/x86/crypto/sha1_ssse3_glue.c
@@ -28,9 +28,7 @@
 #include <asm/simd.h>
 
 static const struct x86_cpu_id module_cpu_ids[] = {
-#ifdef CONFIG_AS_SHA1_NI
 	X86_MATCH_FEATURE(X86_FEATURE_SHA_NI, NULL),
-#endif
 	X86_MATCH_FEATURE(X86_FEATURE_AVX2, NULL),
 	X86_MATCH_FEATURE(X86_FEATURE_AVX, NULL),
 	X86_MATCH_FEATURE(X86_FEATURE_SSSE3, NULL),
@@ -256,7 +254,6 @@ static void unregister_sha1_avx2(void)
 		crypto_unregister_shash(&sha1_avx2_alg);
 }
 
-#ifdef CONFIG_AS_SHA1_NI
 asmlinkage void sha1_ni_transform(struct sha1_state *digest, const u8 *data,
 				  int rounds);
 
@@ -306,11 +303,6 @@ static void unregister_sha1_ni(void)
 		crypto_unregister_shash(&sha1_ni_alg);
 }
 
-#else
-static inline int register_sha1_ni(void) { return 0; }
-static inline void unregister_sha1_ni(void) { }
-#endif
-
 static int __init sha1_ssse3_mod_init(void)
 {
 	if (!x86_match_cpu(module_cpu_ids))
@@ -360,6 +352,4 @@ MODULE_ALIAS_CRYPTO("sha1");
 MODULE_ALIAS_CRYPTO("sha1-ssse3");
 MODULE_ALIAS_CRYPTO("sha1-avx");
 MODULE_ALIAS_CRYPTO("sha1-avx2");
-#ifdef CONFIG_AS_SHA1_NI
 MODULE_ALIAS_CRYPTO("sha1-ni");
-#endif
diff --git a/arch/x86/crypto/sha256_ssse3_glue.c b/arch/x86/crypto/sha256_ssse3_glue.c
index e04a43d9f7d5..429a3cefbab4 100644
--- a/arch/x86/crypto/sha256_ssse3_glue.c
+++ b/arch/x86/crypto/sha256_ssse3_glue.c
@@ -45,9 +45,7 @@ asmlinkage void sha256_transform_ssse3(struct sha256_state *state,
 				       const u8 *data, int blocks);
 
 static const struct x86_cpu_id module_cpu_ids[] = {
-#ifdef CONFIG_AS_SHA256_NI
 	X86_MATCH_FEATURE(X86_FEATURE_SHA_NI, NULL),
-#endif
 	X86_MATCH_FEATURE(X86_FEATURE_AVX2, NULL),
 	X86_MATCH_FEATURE(X86_FEATURE_AVX, NULL),
 	X86_MATCH_FEATURE(X86_FEATURE_SSSE3, NULL),
@@ -329,7 +327,6 @@ static void unregister_sha256_avx2(void)
 				ARRAY_SIZE(sha256_avx2_algs));
 }
 
-#ifdef CONFIG_AS_SHA256_NI
 asmlinkage void sha256_ni_transform(struct sha256_state *digest,
 				    const u8 *data, int rounds);
 
@@ -403,11 +400,6 @@ static void unregister_sha256_ni(void)
 				ARRAY_SIZE(sha256_ni_algs));
 }
 
-#else
-static inline int register_sha256_ni(void) { return 0; }
-static inline void unregister_sha256_ni(void) { }
-#endif
-
 static int __init sha256_ssse3_mod_init(void)
 {
 	if (!x86_match_cpu(module_cpu_ids))
@@ -461,7 +453,5 @@ MODULE_ALIAS_CRYPTO("sha224");
 MODULE_ALIAS_CRYPTO("sha224-ssse3");
 MODULE_ALIAS_CRYPTO("sha224-avx");
 MODULE_ALIAS_CRYPTO("sha224-avx2");
-#ifdef CONFIG_AS_SHA256_NI
 MODULE_ALIAS_CRYPTO("sha256-ni");
 MODULE_ALIAS_CRYPTO("sha224-ni");
-#endif
-- 
2.39.5


