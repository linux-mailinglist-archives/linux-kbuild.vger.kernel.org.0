Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75445483108
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jan 2022 13:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbiACMcG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jan 2022 07:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiACMcF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jan 2022 07:32:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D04C061761;
        Mon,  3 Jan 2022 04:32:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E236E61031;
        Mon,  3 Jan 2022 12:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D92BC36AED;
        Mon,  3 Jan 2022 12:32:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="C6B+cSnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1641213121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jf7TcMcJ0XJB/1csIkjhQR9qWEjfqVJ7fHqEhv2FyJY=;
        b=C6B+cSnOe1bVEkgM5yRm3uYHxF5kZAYwz1DsoyO6gmGse09/a/qg60/B7XqRFR6m7pzSJL
        PRyVvxhYwVRT2CVU6RvLFx6fHrBMq1cpLNAC/wnhNbY+/gBky5i7Syi171pvnfYtJmmwR0
        tv1yahvPDlF24hKZMNQ/sFoLSuo9aHk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 673b4ffc (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Mon, 3 Jan 2022 12:32:01 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kernel@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org
Subject: [PATCH v7] lib/crypto: blake2s: include as built-in
Date:   Mon,  3 Jan 2022 13:31:52 +0100
Message-Id: <20220103123152.1043972-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9oPcEjRnqDesPNKJNOsT+i9vmWRxy9c62t+Xu9Nohsi2A@mail.gmail.com>
References: <CAHmME9oPcEjRnqDesPNKJNOsT+i9vmWRxy9c62t+Xu9Nohsi2A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for using blake2s in the RNG, we change the way that it
is wired-in to the build system. Instead of using ifdefs to select the
right symbol, we use weak symbols. And because ARM doesn't need the
generic implementation, we make the generic one default only if an arch
library doesn't need it already, and then have arch libraries that do
need it opt-in. So that the arch libraries can remain tristate rather
than bool, we then split the shash part from the glue code.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Herbert - As discussed, I still intend to take this via the
crng/random.git tree because it forms a dependency, and I'd like to send
a pull very early in the 5.17 cycle. I've taken some care to minimize
changes to the {arch/*/}crypto/Kconfig files, as you mentioned this
might cause some conflicts. Your tree should work cleanly on top of this
commit.

Changes v6->v7:
- Split arch shash implementations out from the glue code, so that they
  can remain as tristates, and we thus don't need to touch
  arch/*/crypto/Kconfig at all.
Changes v5->v6:
- Make accelerated versions bool instead of tristate.
Changes v4->v5:
- Move sourcing the lib/crypto Kconfig file outside of 'if CRYPTO'.

 arch/arm/crypto/Makefile          |  4 +-
 arch/arm/crypto/blake2s-core.S    |  8 ++--
 arch/arm/crypto/blake2s-glue.c    | 73 +----------------------------
 arch/arm/crypto/blake2s-shash.c   | 75 ++++++++++++++++++++++++++++++
 arch/x86/crypto/Makefile          |  4 +-
 arch/x86/crypto/blake2s-glue.c    | 68 +++------------------------
 arch/x86/crypto/blake2s-shash.c   | 77 +++++++++++++++++++++++++++++++
 crypto/Kconfig                    |  3 +-
 drivers/net/Kconfig               |  1 -
 include/crypto/internal/blake2s.h |  6 +--
 lib/crypto/Kconfig                | 23 +++------
 lib/crypto/Makefile               |  9 ++--
 lib/crypto/blake2s-generic.c      |  6 ++-
 lib/crypto/blake2s.c              |  6 ---
 14 files changed, 189 insertions(+), 174 deletions(-)
 create mode 100644 arch/arm/crypto/blake2s-shash.c
 create mode 100644 arch/x86/crypto/blake2s-shash.c

diff --git a/arch/arm/crypto/Makefile b/arch/arm/crypto/Makefile
index eafa898ba6a7..0274f81cc8ea 100644
--- a/arch/arm/crypto/Makefile
+++ b/arch/arm/crypto/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_CRYPTO_SHA1_ARM_NEON) += sha1-arm-neon.o
 obj-$(CONFIG_CRYPTO_SHA256_ARM) += sha256-arm.o
 obj-$(CONFIG_CRYPTO_SHA512_ARM) += sha512-arm.o
 obj-$(CONFIG_CRYPTO_BLAKE2S_ARM) += blake2s-arm.o
+obj-$(if $(CONFIG_CRYPTO_BLAKE2S_ARM),y) += libblake2s-arm.o
 obj-$(CONFIG_CRYPTO_BLAKE2B_NEON) += blake2b-neon.o
 obj-$(CONFIG_CRYPTO_CHACHA20_NEON) += chacha-neon.o
 obj-$(CONFIG_CRYPTO_POLY1305_ARM) += poly1305-arm.o
@@ -31,7 +32,8 @@ sha256-arm-neon-$(CONFIG_KERNEL_MODE_NEON) := sha256_neon_glue.o
 sha256-arm-y	:= sha256-core.o sha256_glue.o $(sha256-arm-neon-y)
 sha512-arm-neon-$(CONFIG_KERNEL_MODE_NEON) := sha512-neon-glue.o
 sha512-arm-y	:= sha512-core.o sha512-glue.o $(sha512-arm-neon-y)
-blake2s-arm-y   := blake2s-core.o blake2s-glue.o
+blake2s-arm-y   := blake2s-shash.o
+libblake2s-arm-y:= blake2s-core.o blake2s-glue.o
 blake2b-neon-y  := blake2b-neon-core.o blake2b-neon-glue.o
 sha1-arm-ce-y	:= sha1-ce-core.o sha1-ce-glue.o
 sha2-arm-ce-y	:= sha2-ce-core.o sha2-ce-glue.o
diff --git a/arch/arm/crypto/blake2s-core.S b/arch/arm/crypto/blake2s-core.S
index 86345751bbf3..df40e46601f1 100644
--- a/arch/arm/crypto/blake2s-core.S
+++ b/arch/arm/crypto/blake2s-core.S
@@ -167,8 +167,8 @@
 .endm
 
 //
-// void blake2s_compress_arch(struct blake2s_state *state,
-//			      const u8 *block, size_t nblocks, u32 inc);
+// void blake2s_compress(struct blake2s_state *state,
+//			 const u8 *block, size_t nblocks, u32 inc);
 //
 // Only the first three fields of struct blake2s_state are used:
 //	u32 h[8];	(inout)
@@ -176,7 +176,7 @@
 //	u32 f[2];	(in)
 //
 	.align		5
-ENTRY(blake2s_compress_arch)
+ENTRY(blake2s_compress)
 	push		{r0-r2,r4-r11,lr}	// keep this an even number
 
 .Lnext_block:
@@ -303,4 +303,4 @@ ENTRY(blake2s_compress_arch)
 	str		r3, [r12], #4
 	bne		1b
 	b		.Lcopy_block_done
-ENDPROC(blake2s_compress_arch)
+ENDPROC(blake2s_compress)
diff --git a/arch/arm/crypto/blake2s-glue.c b/arch/arm/crypto/blake2s-glue.c
index f2cc1e5fc9ec..0238a70d9581 100644
--- a/arch/arm/crypto/blake2s-glue.c
+++ b/arch/arm/crypto/blake2s-glue.c
@@ -1,78 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * BLAKE2s digest algorithm, ARM scalar implementation
- *
- * Copyright 2020 Google LLC
- */
 
 #include <crypto/internal/blake2s.h>
-#include <crypto/internal/hash.h>
-
 #include <linux/module.h>
 
 /* defined in blake2s-core.S */
-EXPORT_SYMBOL(blake2s_compress_arch);
-
-static int crypto_blake2s_update_arm(struct shash_desc *desc,
-				     const u8 *in, unsigned int inlen)
-{
-	return crypto_blake2s_update(desc, in, inlen, blake2s_compress_arch);
-}
-
-static int crypto_blake2s_final_arm(struct shash_desc *desc, u8 *out)
-{
-	return crypto_blake2s_final(desc, out, blake2s_compress_arch);
-}
-
-#define BLAKE2S_ALG(name, driver_name, digest_size)			\
-	{								\
-		.base.cra_name		= name,				\
-		.base.cra_driver_name	= driver_name,			\
-		.base.cra_priority	= 200,				\
-		.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,	\
-		.base.cra_blocksize	= BLAKE2S_BLOCK_SIZE,		\
-		.base.cra_ctxsize	= sizeof(struct blake2s_tfm_ctx), \
-		.base.cra_module	= THIS_MODULE,			\
-		.digestsize		= digest_size,			\
-		.setkey			= crypto_blake2s_setkey,	\
-		.init			= crypto_blake2s_init,		\
-		.update			= crypto_blake2s_update_arm,	\
-		.final			= crypto_blake2s_final_arm,	\
-		.descsize		= sizeof(struct blake2s_state),	\
-	}
-
-static struct shash_alg blake2s_arm_algs[] = {
-	BLAKE2S_ALG("blake2s-128", "blake2s-128-arm", BLAKE2S_128_HASH_SIZE),
-	BLAKE2S_ALG("blake2s-160", "blake2s-160-arm", BLAKE2S_160_HASH_SIZE),
-	BLAKE2S_ALG("blake2s-224", "blake2s-224-arm", BLAKE2S_224_HASH_SIZE),
-	BLAKE2S_ALG("blake2s-256", "blake2s-256-arm", BLAKE2S_256_HASH_SIZE),
-};
-
-static int __init blake2s_arm_mod_init(void)
-{
-	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
-		crypto_register_shashes(blake2s_arm_algs,
-					ARRAY_SIZE(blake2s_arm_algs)) : 0;
-}
-
-static void __exit blake2s_arm_mod_exit(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_HASH))
-		crypto_unregister_shashes(blake2s_arm_algs,
-					  ARRAY_SIZE(blake2s_arm_algs));
-}
-
-module_init(blake2s_arm_mod_init);
-module_exit(blake2s_arm_mod_exit);
-
-MODULE_DESCRIPTION("BLAKE2s digest algorithm, ARM scalar implementation");
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Eric Biggers <ebiggers@google.com>");
-MODULE_ALIAS_CRYPTO("blake2s-128");
-MODULE_ALIAS_CRYPTO("blake2s-128-arm");
-MODULE_ALIAS_CRYPTO("blake2s-160");
-MODULE_ALIAS_CRYPTO("blake2s-160-arm");
-MODULE_ALIAS_CRYPTO("blake2s-224");
-MODULE_ALIAS_CRYPTO("blake2s-224-arm");
-MODULE_ALIAS_CRYPTO("blake2s-256");
-MODULE_ALIAS_CRYPTO("blake2s-256-arm");
+EXPORT_SYMBOL(blake2s_compress);
diff --git a/arch/arm/crypto/blake2s-shash.c b/arch/arm/crypto/blake2s-shash.c
new file mode 100644
index 000000000000..17c1c3bfe2f5
--- /dev/null
+++ b/arch/arm/crypto/blake2s-shash.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * BLAKE2s digest algorithm, ARM scalar implementation
+ *
+ * Copyright 2020 Google LLC
+ */
+
+#include <crypto/internal/blake2s.h>
+#include <crypto/internal/hash.h>
+
+#include <linux/module.h>
+
+static int crypto_blake2s_update_arm(struct shash_desc *desc,
+				     const u8 *in, unsigned int inlen)
+{
+	return crypto_blake2s_update(desc, in, inlen, blake2s_compress);
+}
+
+static int crypto_blake2s_final_arm(struct shash_desc *desc, u8 *out)
+{
+	return crypto_blake2s_final(desc, out, blake2s_compress);
+}
+
+#define BLAKE2S_ALG(name, driver_name, digest_size)			\
+	{								\
+		.base.cra_name		= name,				\
+		.base.cra_driver_name	= driver_name,			\
+		.base.cra_priority	= 200,				\
+		.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,	\
+		.base.cra_blocksize	= BLAKE2S_BLOCK_SIZE,		\
+		.base.cra_ctxsize	= sizeof(struct blake2s_tfm_ctx), \
+		.base.cra_module	= THIS_MODULE,			\
+		.digestsize		= digest_size,			\
+		.setkey			= crypto_blake2s_setkey,	\
+		.init			= crypto_blake2s_init,		\
+		.update			= crypto_blake2s_update_arm,	\
+		.final			= crypto_blake2s_final_arm,	\
+		.descsize		= sizeof(struct blake2s_state),	\
+	}
+
+static struct shash_alg blake2s_arm_algs[] = {
+	BLAKE2S_ALG("blake2s-128", "blake2s-128-arm", BLAKE2S_128_HASH_SIZE),
+	BLAKE2S_ALG("blake2s-160", "blake2s-160-arm", BLAKE2S_160_HASH_SIZE),
+	BLAKE2S_ALG("blake2s-224", "blake2s-224-arm", BLAKE2S_224_HASH_SIZE),
+	BLAKE2S_ALG("blake2s-256", "blake2s-256-arm", BLAKE2S_256_HASH_SIZE),
+};
+
+static int __init blake2s_arm_mod_init(void)
+{
+	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
+		crypto_register_shashes(blake2s_arm_algs,
+					ARRAY_SIZE(blake2s_arm_algs)) : 0;
+}
+
+static void __exit blake2s_arm_mod_exit(void)
+{
+	if (IS_REACHABLE(CONFIG_CRYPTO_HASH))
+		crypto_unregister_shashes(blake2s_arm_algs,
+					  ARRAY_SIZE(blake2s_arm_algs));
+}
+
+module_init(blake2s_arm_mod_init);
+module_exit(blake2s_arm_mod_exit);
+
+MODULE_DESCRIPTION("BLAKE2s digest algorithm, ARM scalar implementation");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Eric Biggers <ebiggers@google.com>");
+MODULE_ALIAS_CRYPTO("blake2s-128");
+MODULE_ALIAS_CRYPTO("blake2s-128-arm");
+MODULE_ALIAS_CRYPTO("blake2s-160");
+MODULE_ALIAS_CRYPTO("blake2s-160-arm");
+MODULE_ALIAS_CRYPTO("blake2s-224");
+MODULE_ALIAS_CRYPTO("blake2s-224-arm");
+MODULE_ALIAS_CRYPTO("blake2s-256");
+MODULE_ALIAS_CRYPTO("blake2s-256-arm");
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index f307c93fc90a..c3af959648e6 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -62,7 +62,9 @@ obj-$(CONFIG_CRYPTO_SHA512_SSSE3) += sha512-ssse3.o
 sha512-ssse3-y := sha512-ssse3-asm.o sha512-avx-asm.o sha512-avx2-asm.o sha512_ssse3_glue.o
 
 obj-$(CONFIG_CRYPTO_BLAKE2S_X86) += blake2s-x86_64.o
-blake2s-x86_64-y := blake2s-core.o blake2s-glue.o
+blake2s-x86_64-y := blake2s-shash.o
+obj-$(if $(CONFIG_CRYPTO_BLAKE2S_X86),y) += libblake2s-x86_64.o
+libblake2s-x86_64-y := blake2s-core.o blake2s-glue.o
 
 obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
 ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
diff --git a/arch/x86/crypto/blake2s-glue.c b/arch/x86/crypto/blake2s-glue.c
index a40365ab301e..69853c13e8fb 100644
--- a/arch/x86/crypto/blake2s-glue.c
+++ b/arch/x86/crypto/blake2s-glue.c
@@ -5,7 +5,6 @@
 
 #include <crypto/internal/blake2s.h>
 #include <crypto/internal/simd.h>
-#include <crypto/internal/hash.h>
 
 #include <linux/types.h>
 #include <linux/jump_label.h>
@@ -28,9 +27,8 @@ asmlinkage void blake2s_compress_avx512(struct blake2s_state *state,
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(blake2s_use_ssse3);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(blake2s_use_avx512);
 
-void blake2s_compress_arch(struct blake2s_state *state,
-			   const u8 *block, size_t nblocks,
-			   const u32 inc)
+void blake2s_compress(struct blake2s_state *state, const u8 *block,
+		      size_t nblocks, const u32 inc)
 {
 	/* SIMD disables preemption, so relax after processing each page. */
 	BUILD_BUG_ON(SZ_4K / BLAKE2S_BLOCK_SIZE < 8);
@@ -56,49 +54,12 @@ void blake2s_compress_arch(struct blake2s_state *state,
 		block += blocks * BLAKE2S_BLOCK_SIZE;
 	} while (nblocks);
 }
-EXPORT_SYMBOL(blake2s_compress_arch);
-
-static int crypto_blake2s_update_x86(struct shash_desc *desc,
-				     const u8 *in, unsigned int inlen)
-{
-	return crypto_blake2s_update(desc, in, inlen, blake2s_compress_arch);
-}
-
-static int crypto_blake2s_final_x86(struct shash_desc *desc, u8 *out)
-{
-	return crypto_blake2s_final(desc, out, blake2s_compress_arch);
-}
-
-#define BLAKE2S_ALG(name, driver_name, digest_size)			\
-	{								\
-		.base.cra_name		= name,				\
-		.base.cra_driver_name	= driver_name,			\
-		.base.cra_priority	= 200,				\
-		.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,	\
-		.base.cra_blocksize	= BLAKE2S_BLOCK_SIZE,		\
-		.base.cra_ctxsize	= sizeof(struct blake2s_tfm_ctx), \
-		.base.cra_module	= THIS_MODULE,			\
-		.digestsize		= digest_size,			\
-		.setkey			= crypto_blake2s_setkey,	\
-		.init			= crypto_blake2s_init,		\
-		.update			= crypto_blake2s_update_x86,	\
-		.final			= crypto_blake2s_final_x86,	\
-		.descsize		= sizeof(struct blake2s_state),	\
-	}
-
-static struct shash_alg blake2s_algs[] = {
-	BLAKE2S_ALG("blake2s-128", "blake2s-128-x86", BLAKE2S_128_HASH_SIZE),
-	BLAKE2S_ALG("blake2s-160", "blake2s-160-x86", BLAKE2S_160_HASH_SIZE),
-	BLAKE2S_ALG("blake2s-224", "blake2s-224-x86", BLAKE2S_224_HASH_SIZE),
-	BLAKE2S_ALG("blake2s-256", "blake2s-256-x86", BLAKE2S_256_HASH_SIZE),
-};
+EXPORT_SYMBOL(blake2s_compress);
 
 static int __init blake2s_mod_init(void)
 {
-	if (!boot_cpu_has(X86_FEATURE_SSSE3))
-		return 0;
-
-	static_branch_enable(&blake2s_use_ssse3);
+	if (boot_cpu_has(X86_FEATURE_SSSE3))
+		static_branch_enable(&blake2s_use_ssse3);
 
 	if (IS_ENABLED(CONFIG_AS_AVX512) &&
 	    boot_cpu_has(X86_FEATURE_AVX) &&
@@ -109,26 +70,9 @@ static int __init blake2s_mod_init(void)
 			      XFEATURE_MASK_AVX512, NULL))
 		static_branch_enable(&blake2s_use_avx512);
 
-	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
-		crypto_register_shashes(blake2s_algs,
-					ARRAY_SIZE(blake2s_algs)) : 0;
-}
-
-static void __exit blake2s_mod_exit(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_HASH) && boot_cpu_has(X86_FEATURE_SSSE3))
-		crypto_unregister_shashes(blake2s_algs, ARRAY_SIZE(blake2s_algs));
+	return 0;
 }
 
 module_init(blake2s_mod_init);
-module_exit(blake2s_mod_exit);
 
-MODULE_ALIAS_CRYPTO("blake2s-128");
-MODULE_ALIAS_CRYPTO("blake2s-128-x86");
-MODULE_ALIAS_CRYPTO("blake2s-160");
-MODULE_ALIAS_CRYPTO("blake2s-160-x86");
-MODULE_ALIAS_CRYPTO("blake2s-224");
-MODULE_ALIAS_CRYPTO("blake2s-224-x86");
-MODULE_ALIAS_CRYPTO("blake2s-256");
-MODULE_ALIAS_CRYPTO("blake2s-256-x86");
 MODULE_LICENSE("GPL v2");
diff --git a/arch/x86/crypto/blake2s-shash.c b/arch/x86/crypto/blake2s-shash.c
new file mode 100644
index 000000000000..f9e2fecdb761
--- /dev/null
+++ b/arch/x86/crypto/blake2s-shash.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
+ */
+
+#include <crypto/internal/blake2s.h>
+#include <crypto/internal/simd.h>
+#include <crypto/internal/hash.h>
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sizes.h>
+
+#include <asm/cpufeature.h>
+#include <asm/processor.h>
+
+static int crypto_blake2s_update_x86(struct shash_desc *desc,
+				     const u8 *in, unsigned int inlen)
+{
+	return crypto_blake2s_update(desc, in, inlen, blake2s_compress);
+}
+
+static int crypto_blake2s_final_x86(struct shash_desc *desc, u8 *out)
+{
+	return crypto_blake2s_final(desc, out, blake2s_compress);
+}
+
+#define BLAKE2S_ALG(name, driver_name, digest_size)			\
+	{								\
+		.base.cra_name		= name,				\
+		.base.cra_driver_name	= driver_name,			\
+		.base.cra_priority	= 200,				\
+		.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,	\
+		.base.cra_blocksize	= BLAKE2S_BLOCK_SIZE,		\
+		.base.cra_ctxsize	= sizeof(struct blake2s_tfm_ctx), \
+		.base.cra_module	= THIS_MODULE,			\
+		.digestsize		= digest_size,			\
+		.setkey			= crypto_blake2s_setkey,	\
+		.init			= crypto_blake2s_init,		\
+		.update			= crypto_blake2s_update_x86,	\
+		.final			= crypto_blake2s_final_x86,	\
+		.descsize		= sizeof(struct blake2s_state),	\
+	}
+
+static struct shash_alg blake2s_algs[] = {
+	BLAKE2S_ALG("blake2s-128", "blake2s-128-x86", BLAKE2S_128_HASH_SIZE),
+	BLAKE2S_ALG("blake2s-160", "blake2s-160-x86", BLAKE2S_160_HASH_SIZE),
+	BLAKE2S_ALG("blake2s-224", "blake2s-224-x86", BLAKE2S_224_HASH_SIZE),
+	BLAKE2S_ALG("blake2s-256", "blake2s-256-x86", BLAKE2S_256_HASH_SIZE),
+};
+
+static int __init blake2s_mod_init(void)
+{
+	if (IS_REACHABLE(CONFIG_CRYPTO_HASH) && boot_cpu_has(X86_FEATURE_SSSE3))
+		return crypto_register_shashes(blake2s_algs, ARRAY_SIZE(blake2s_algs));
+	return 0;
+}
+
+static void __exit blake2s_mod_exit(void)
+{
+	if (IS_REACHABLE(CONFIG_CRYPTO_HASH) && boot_cpu_has(X86_FEATURE_SSSE3))
+		crypto_unregister_shashes(blake2s_algs, ARRAY_SIZE(blake2s_algs));
+}
+
+module_init(blake2s_mod_init);
+module_exit(blake2s_mod_exit);
+
+MODULE_ALIAS_CRYPTO("blake2s-128");
+MODULE_ALIAS_CRYPTO("blake2s-128-x86");
+MODULE_ALIAS_CRYPTO("blake2s-160");
+MODULE_ALIAS_CRYPTO("blake2s-160-x86");
+MODULE_ALIAS_CRYPTO("blake2s-224");
+MODULE_ALIAS_CRYPTO("blake2s-224-x86");
+MODULE_ALIAS_CRYPTO("blake2s-256");
+MODULE_ALIAS_CRYPTO("blake2s-256-x86");
+MODULE_LICENSE("GPL v2");
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 285f82647d2b..55718de56137 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1919,9 +1919,10 @@ config CRYPTO_STATS
 config CRYPTO_HASH_INFO
 	bool
 
-source "lib/crypto/Kconfig"
 source "drivers/crypto/Kconfig"
 source "crypto/asymmetric_keys/Kconfig"
 source "certs/Kconfig"
 
 endif	# if CRYPTO
+
+source "lib/crypto/Kconfig"
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 6cccc3dc00bc..b2a4f998c180 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -81,7 +81,6 @@ config WIREGUARD
 	select CRYPTO
 	select CRYPTO_LIB_CURVE25519
 	select CRYPTO_LIB_CHACHA20POLY1305
-	select CRYPTO_LIB_BLAKE2S
 	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
 	select CRYPTO_POLY1305_X86_64 if X86 && 64BIT
 	select CRYPTO_BLAKE2S_X86 if X86 && 64BIT
diff --git a/include/crypto/internal/blake2s.h b/include/crypto/internal/blake2s.h
index 8e50d487500f..d39cfa0d333e 100644
--- a/include/crypto/internal/blake2s.h
+++ b/include/crypto/internal/blake2s.h
@@ -11,11 +11,11 @@
 #include <crypto/internal/hash.h>
 #include <linux/string.h>
 
-void blake2s_compress_generic(struct blake2s_state *state,const u8 *block,
+void blake2s_compress_generic(struct blake2s_state *state, const u8 *block,
 			      size_t nblocks, const u32 inc);
 
-void blake2s_compress_arch(struct blake2s_state *state,const u8 *block,
-			   size_t nblocks, const u32 inc);
+void blake2s_compress(struct blake2s_state *state, const u8 *block,
+		      size_t nblocks, const u32 inc);
 
 bool blake2s_selftest(void);
 
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 545ccbddf6a1..8620f38e117c 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-comment "Crypto library routines"
-
 config CRYPTO_LIB_AES
 	tristate
 
@@ -9,14 +7,14 @@ config CRYPTO_LIB_ARC4
 	tristate
 
 config CRYPTO_ARCH_HAVE_LIB_BLAKE2S
-	tristate
+	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the Blake2s library interface,
 	  either builtin or as a module.
 
 config CRYPTO_LIB_BLAKE2S_GENERIC
-	tristate
+	def_bool !CRYPTO_ARCH_HAVE_LIB_BLAKE2S
 	help
 	  This symbol can be depended upon by arch implementations of the
 	  Blake2s library interface that require the generic code as a
@@ -24,15 +22,6 @@ config CRYPTO_LIB_BLAKE2S_GENERIC
 	  implementation is enabled, this implementation serves the users
 	  of CRYPTO_LIB_BLAKE2S.
 
-config CRYPTO_LIB_BLAKE2S
-	tristate "BLAKE2s hash function library"
-	depends on CRYPTO_ARCH_HAVE_LIB_BLAKE2S || !CRYPTO_ARCH_HAVE_LIB_BLAKE2S
-	select CRYPTO_LIB_BLAKE2S_GENERIC if CRYPTO_ARCH_HAVE_LIB_BLAKE2S=n
-	help
-	  Enable the Blake2s library interface. This interface may be fulfilled
-	  by either the generic implementation or an arch-specific one, if one
-	  is available and enabled.
-
 config CRYPTO_ARCH_HAVE_LIB_CHACHA
 	tristate
 	help
@@ -51,7 +40,7 @@ config CRYPTO_LIB_CHACHA_GENERIC
 	  of CRYPTO_LIB_CHACHA.
 
 config CRYPTO_LIB_CHACHA
-	tristate "ChaCha library interface"
+	tristate
 	depends on CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHACHA
 	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
 	help
@@ -76,7 +65,7 @@ config CRYPTO_LIB_CURVE25519_GENERIC
 	  of CRYPTO_LIB_CURVE25519.
 
 config CRYPTO_LIB_CURVE25519
-	tristate "Curve25519 scalar multiplication library"
+	tristate
 	depends on CRYPTO_ARCH_HAVE_LIB_CURVE25519 || !CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
 	help
@@ -111,7 +100,7 @@ config CRYPTO_LIB_POLY1305_GENERIC
 	  of CRYPTO_LIB_POLY1305.
 
 config CRYPTO_LIB_POLY1305
-	tristate "Poly1305 library interface"
+	tristate
 	depends on CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
 	help
@@ -120,7 +109,7 @@ config CRYPTO_LIB_POLY1305
 	  is available and enabled.
 
 config CRYPTO_LIB_CHACHA20POLY1305
-	tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
+	tristate
 	depends on CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHACHA
 	depends on CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_CHACHA
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 73205ed269ba..ed43a41f2dcc 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -10,11 +10,10 @@ libaes-y					:= aes.o
 obj-$(CONFIG_CRYPTO_LIB_ARC4)			+= libarc4.o
 libarc4-y					:= arc4.o
 
-obj-$(CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC)	+= libblake2s-generic.o
-libblake2s-generic-y				+= blake2s-generic.o
-
-obj-$(CONFIG_CRYPTO_LIB_BLAKE2S)		+= libblake2s.o
-libblake2s-y					+= blake2s.o
+# blake2s is used by the /dev/random driver which is always builtin
+obj-y						+= libblake2s.o
+libblake2s-y					:= blake2s.o
+libblake2s-$(CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC)	+= blake2s-generic.o
 
 obj-$(CONFIG_CRYPTO_LIB_CHACHA20POLY1305)	+= libchacha20poly1305.o
 libchacha20poly1305-y				+= chacha20poly1305.o
diff --git a/lib/crypto/blake2s-generic.c b/lib/crypto/blake2s-generic.c
index 04ff8df24513..75ccb3e633e6 100644
--- a/lib/crypto/blake2s-generic.c
+++ b/lib/crypto/blake2s-generic.c
@@ -37,7 +37,11 @@ static inline void blake2s_increment_counter(struct blake2s_state *state,
 	state->t[1] += (state->t[0] < inc);
 }
 
-void blake2s_compress_generic(struct blake2s_state *state,const u8 *block,
+void blake2s_compress(struct blake2s_state *state, const u8 *block,
+		      size_t nblocks, const u32 inc)
+		      __weak __alias(blake2s_compress_generic);
+
+void blake2s_compress_generic(struct blake2s_state *state, const u8 *block,
 			      size_t nblocks, const u32 inc)
 {
 	u32 m[16];
diff --git a/lib/crypto/blake2s.c b/lib/crypto/blake2s.c
index 4055aa593ec4..93f2ae051370 100644
--- a/lib/crypto/blake2s.c
+++ b/lib/crypto/blake2s.c
@@ -16,12 +16,6 @@
 #include <linux/init.h>
 #include <linux/bug.h>
 
-#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S)
-#  define blake2s_compress blake2s_compress_arch
-#else
-#  define blake2s_compress blake2s_compress_generic
-#endif
-
 void blake2s_update(struct blake2s_state *state, const u8 *in, size_t inlen)
 {
 	__blake2s_update(state, in, inlen, blake2s_compress);
-- 
2.34.1

