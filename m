Return-Path: <linux-kbuild+bounces-11261-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKttO2pGjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11261-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:18:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E412A010
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10502302E928
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF2321CC7B;
	Thu, 12 Feb 2026 03:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Fg5vh8Le"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7622301;
	Thu, 12 Feb 2026 03:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866265; cv=none; b=pVbKDODishHsCMpHZMxLVT1DlhYJvKXVNRjVwAS7vRRC1CmksNzR0h4l1UsS4GkrTSZBnHxI6WSZ8EXQ/CcPDuNtKRwmVzTgmjhie2VqHpRYA1j76pFFnono6LJ8wnZFDbmSMpaCUrNseab3uoXFj0pfSN2SmE6s+G3ta+4/ezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866265; c=relaxed/simple;
	bh=zx3E8u7AuwcqXyL8fY3/oyVg4r/1zj6PwGN24cSukwk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9QURiUyojLAXuoNIPVIXoMTBzQ99rnkP2yIYB5So3wqI/cBt70npbli0yJBqu2x2q0Eu7lsru/k5B+7MSqDj7An76uEIHHLBlWXPPODjirJrRiaKCga1zMsScchkJuUISmVB6/JrmEzt4oafE2J48HHqq4R34IP6S3hD/q83qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Fg5vh8Le; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866264; x=1802402264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+1e2gtCCscDFXMUiZXIsNyKCO7JeXLOW0dkrr5pHyRE=;
  b=Fg5vh8Lex2nf2CdVRULTG3jVZzzJpyZJfZdDnLw7ZJfjLD597gNAO9LE
   Dh4gPEAvidjRzL5ZQ+EudsZNBUGgNWimYYMcevtcqY+lxE8C0gZWjJy1t
   96QbHPzZ+8viQCBPjKYdxHWlENNFk8OIzB0HvF2gImI6MFfYq9tJckC50
   TEfWQSqNqJJYEkUhcLvfpvEIYFNXndp/AORcWat5uA0CNCtDgwkdNxjkS
   9wWjVsNdZ+OsUzibI2WFNkJEoMhOlR5mIAaEnGspyewSX3IADXFX73dmj
   Qifkas4Zvf3Pr4rTy/prdYkkoCIiyGOHS6D0BfotCcgtTtcD0xZNZIb21
   w==;
X-CSE-ConnectionGUID: neE3vW8ET9G3EB65rklbqA==
X-CSE-MsgGUID: 8OojjDyGSeOn+r/4fCHq9w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920027"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:17:44 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:28295]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 2647a3dc-a92f-48bf-bfaf-fc4eb7907164; Thu, 12 Feb 2026 03:17:43 +0000 (UTC)
X-Farcaster-Flow-ID: 2647a3dc-a92f-48bf-bfaf-fc4eb7907164
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:41 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:41 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 09/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAMELLIA_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:07 +0000
Message-ID: <20260212031521.2124-10-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D042UWA004.ant.amazon.com (10.13.139.16) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11261-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 470E412A010
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CAMELLIA_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/camellia.h            | 29 ++++++++++++++++++---------
 arch/x86/crypto/camellia_glue.c       |  4 ++--
 arch/x86/crypto/fips140/fips140-api.c | 16 +++++++++++++++
 4 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 7118a7dba3c6..8751154e1328 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -23,7 +23,7 @@ serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
 crypto-objs-$(CONFIG_CRYPTO_DES3_EDE_X86_64) += des3_ede-x86_64.o
 des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
 
-obj-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
 camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
 camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_glue.o
diff --git a/arch/x86/crypto/camellia.h b/arch/x86/crypto/camellia.h
index 1dcea79e8f8e..bca0b64ab8d7 100644
--- a/arch/x86/crypto/camellia.h
+++ b/arch/x86/crypto/camellia.h
@@ -2,6 +2,7 @@
 #ifndef ASM_X86_CAMELLIA_H
 #define ASM_X86_CAMELLIA_H
 
+#include <crypto/api.h>
 #include <crypto/b128ops.h>
 #include <linux/crypto.h>
 #include <linux/kernel.h>
@@ -19,19 +20,25 @@ struct camellia_ctx {
 	u32 key_length;
 };
 
-extern int __camellia_setkey(struct camellia_ctx *cctx,
-			     const unsigned char *key,
-			     unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, __camellia_setkey, int,
+	(struct camellia_ctx *cctx, const unsigned char *key, unsigned int key_len),
+	(cctx, key, key_len));
 
 /* regular block cipher functions */
-asmlinkage void __camellia_enc_blk(const void *ctx, u8 *dst, const u8 *src,
-				   bool xor);
-asmlinkage void camellia_dec_blk(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, __camellia_enc_blk, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, bool xor),
+	(ctx, dst, src, xor));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, camellia_dec_blk, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 /* 2-way parallel cipher functions */
-asmlinkage void __camellia_enc_blk_2way(const void *ctx, u8 *dst, const u8 *src,
-					bool xor);
-asmlinkage void camellia_dec_blk_2way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, __camellia_enc_blk_2way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, bool xor),
+	(ctx, dst, src, xor));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, camellia_dec_blk_2way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 /* 16-way parallel cipher functions (avx/aes-ni) */
 asmlinkage void camellia_ecb_enc_16way(const void *ctx, u8 *dst, const u8 *src);
@@ -62,6 +69,8 @@ static inline void camellia_enc_blk_xor_2way(const void *ctx, u8 *dst,
 }
 
 /* glue helpers */
-extern void camellia_decrypt_cbc_2way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, camellia_decrypt_cbc_2way, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif /* ASM_X86_CAMELLIA_H */
diff --git a/arch/x86/crypto/camellia_glue.c b/arch/x86/crypto/camellia_glue.c
index cbede120e5f2..e545da7c8530 100644
--- a/arch/x86/crypto/camellia_glue.c
+++ b/arch/x86/crypto/camellia_glue.c
@@ -1408,8 +1408,8 @@ static void __exit camellia_fini(void)
 				    ARRAY_SIZE(camellia_skcipher_algs));
 }
 
-module_init(camellia_init);
-module_exit(camellia_fini);
+crypto_module_init(camellia_init);
+crypto_module_exit(camellia_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Camellia Cipher Algorithm, asm optimized");
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index 15a60258d4ee..57a1625219e0 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -34,4 +34,20 @@ DEFINE_CRYPTO_API_STUB(serpent_ecb_enc_8way_avx);
 DEFINE_CRYPTO_API_STUB(serpent_ecb_dec_8way_avx);
 DEFINE_CRYPTO_API_STUB(serpent_cbc_dec_8way_avx);
 
+#endif
+
+/*
+ * arch/x86/crypto/camellia_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAMELLIA_X86_64)
+
+#include <arch/x86/crypto/camellia.h>
+
+DEFINE_CRYPTO_API_STUB(__camellia_setkey);
+DEFINE_CRYPTO_API_STUB(__camellia_enc_blk);
+DEFINE_CRYPTO_API_STUB(camellia_dec_blk);
+DEFINE_CRYPTO_API_STUB(__camellia_enc_blk_2way);
+DEFINE_CRYPTO_API_STUB(camellia_dec_blk_2way);
+DEFINE_CRYPTO_API_STUB(camellia_decrypt_cbc_2way);
+
 #endif
\ No newline at end of file
-- 
2.47.3


