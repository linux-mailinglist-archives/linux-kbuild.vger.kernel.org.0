Return-Path: <linux-kbuild+bounces-11213-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC5bHWZDjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11213-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:05:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED255129B5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E64DF300D915
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17D221CC43;
	Thu, 12 Feb 2026 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="YFkQaP7C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A210184540;
	Thu, 12 Feb 2026 03:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865506; cv=none; b=cA3j3GkOplV8RYu9DXgBgKUNks3LNrgacDvqySpgY2kuNpKk5cs06gYUsuRyAdrGoglABYe+uyRTAAD/m10fOHMKPRa3rTyIPmAAb2mWrxGX2GsYMNf1fhy1K4J27d0EwnY3ax/3rikxTUuIy6hYb1Oi2fETmuplhkMKQ6nJ8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865506; c=relaxed/simple;
	bh=7K7M3Xz1axiu2Ng/47g6paD63zNrDnmD4sKrzCHZDBU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKo442La2pS0I6Zn9QjkQdJJpdEefjzQ+MOsMN6/BeG8Hd7hp7dZlsPChW0WkBCOK3RDKZycfsUonLU7isHxSIjbQRO9zDyQiyq9O1dzP6u+5FOWIyCG99s0jpGNT6vaEwUtzx/XLOFmIfhNeGckw2zWXjLKqgg3iwl6VOKtGKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=YFkQaP7C; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865505; x=1802401505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w49qDPq+rQDtkwFtlcyW9tMGaHhTNclxaEhT6RpCKdA=;
  b=YFkQaP7C4L0AagF7+Q6rI8CQqV4dVwt8x0JmF2HP/XQGZwgP2XNZZTbZ
   ivOevIwR8FzzGdnxM5S71hGcpDzEZJhy/TYI8jW5zUaF74scHSYPMNbLO
   dyEHpquN3p56I7da0d/yjqoL4lr4qETz0mljiYw3tCP3eyQ1QDeVLb+iK
   K4mPxclSP8rwaOiQ2Vx0pLXz9fxccrI3cvypN89ZydnaXUwpJ9NlmHEG7
   AZBtwajf3BfgwxtI+C03Gy5ScnRz6f4LSM9clOuH0DhajwmucQcPW3wTf
   bfFFLiPgCWjaY1SJbaBAXpVry0iAinevqtv4HkxEBPCbi61c/7qclSDkS
   A==;
X-CSE-ConnectionGUID: xPtC0UHFQy+v2tcWROPvBQ==
X-CSE-MsgGUID: G8n403sgQta2fiOegM8+gw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918540"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:05:05 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:32050]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 005c2e7b-7f30-42c8-9bfd-293f240741ec; Thu, 12 Feb 2026 03:05:05 +0000 (UTC)
X-Farcaster-Flow-ID: 005c2e7b-7f30-42c8-9bfd-293f240741ec
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:02 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:02 +0000
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
Subject: [PATCH 068/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAST_COMMON, CONFIG_CRYPTO_CAST5, CONFIG_CRYPTO_CAST6 crypto
Date: Thu, 12 Feb 2026 02:46:44 +0000
Message-ID: <20260212024725.11264-69-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11213-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED255129B5B
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CAST_COMMON-, CONFIG_CRYPTO_CAST5-, and
CONFIG_CRYPTO_CAST6-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  6 +++---
 crypto/cast5_generic.c       |  4 ++--
 crypto/cast6_generic.c       |  4 ++--
 crypto/fips140/fips140-api.c | 42 ++++++++++++++++++++++++++++++++++++
 include/crypto/cast5.h       | 14 +++++++++---
 include/crypto/cast6.h       | 19 ++++++++++++----
 include/crypto/cast_common.h | 17 +++++++++++----
 7 files changed, 88 insertions(+), 18 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 4b6e56ad4d1c..7635fd4b698c 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -138,9 +138,9 @@ crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
 crypto-objs-$(CONFIG_CRYPTO_SM4) += sm4.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
-obj-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
-obj-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
-obj-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
+crypto-objs-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
 obj-$(CONFIG_CRYPTO_ARC4) += arc4.o
 obj-$(CONFIG_CRYPTO_TEA) += tea.o
 obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
diff --git a/crypto/cast5_generic.c b/crypto/cast5_generic.c
index f68330793e0c..241738e09945 100644
--- a/crypto/cast5_generic.c
+++ b/crypto/cast5_generic.c
@@ -531,8 +531,8 @@ static void __exit cast5_mod_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(cast5_mod_init);
-module_exit(cast5_mod_fini);
+crypto_module_init(cast5_mod_init);
+crypto_module_exit(cast5_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Cast5 Cipher Algorithm");
diff --git a/crypto/cast6_generic.c b/crypto/cast6_generic.c
index 4c08c42646f0..53deace18e63 100644
--- a/crypto/cast6_generic.c
+++ b/crypto/cast6_generic.c
@@ -271,8 +271,8 @@ static void __exit cast6_mod_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(cast6_mod_init);
-module_exit(cast6_mod_fini);
+crypto_module_init(cast6_mod_init);
+crypto_module_exit(cast6_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Cast6 Cipher Algorithm");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 475cab990549..f6d6a6e79a9e 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -696,3 +696,45 @@ DEFINE_CRYPTO_API_STUB(__serpent_encrypt);
 DEFINE_CRYPTO_API_STUB(__serpent_decrypt);
 
 #endif
+/*
+ * crypto/cast_common.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAST_COMMON)
+
+#include <crypto/cast_common.h>
+
+#undef cast_s1
+#undef cast_s2
+#undef cast_s3
+#undef cast_s4
+DEFINE_CRYPTO_VAR_STUB(cast_s1);
+DEFINE_CRYPTO_VAR_STUB(cast_s2);
+DEFINE_CRYPTO_VAR_STUB(cast_s3);
+DEFINE_CRYPTO_VAR_STUB(cast_s4);
+
+#endif
+/*
+ * crypto/cast5_generic.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAST5)
+
+#include <crypto/cast5.h>
+
+DEFINE_CRYPTO_API_STUB(cast5_setkey);
+DEFINE_CRYPTO_API_STUB(__cast5_encrypt);
+DEFINE_CRYPTO_API_STUB(__cast5_decrypt);
+
+#endif
+/*
+ * crypto/cast6_generic.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAST6)
+
+#include <crypto/cast6.h>
+
+DEFINE_CRYPTO_API_STUB(__cast6_setkey);
+DEFINE_CRYPTO_API_STUB(cast6_setkey);
+DEFINE_CRYPTO_API_STUB(__cast6_encrypt);
+DEFINE_CRYPTO_API_STUB(__cast6_decrypt);
+
+#endif
diff --git a/include/crypto/cast5.h b/include/crypto/cast5.h
index 3d4ed4ea9c3b..cdd85cd974bb 100644
--- a/include/crypto/cast5.h
+++ b/include/crypto/cast5.h
@@ -2,6 +2,7 @@
 #ifndef _CRYPTO_CAST5_H
 #define _CRYPTO_CAST5_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <linux/crypto.h>
 #include <crypto/cast_common.h>
@@ -16,9 +17,16 @@ struct cast5_ctx {
 	int rr;	/* rr ? rounds = 12 : rounds = 16; (rfc 2144) */
 };
 
-int cast5_setkey(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST5, cast5_setkey, int,
+	(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
 
-void __cast5_encrypt(struct cast5_ctx *ctx, u8 *dst, const u8 *src);
-void __cast5_decrypt(struct cast5_ctx *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST5, __cast5_encrypt, void,
+	(struct cast5_ctx *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST5, __cast5_decrypt, void,
+	(struct cast5_ctx *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif
diff --git a/include/crypto/cast6.h b/include/crypto/cast6.h
index 38f490cd50a8..5fd28d7ed70f 100644
--- a/include/crypto/cast6.h
+++ b/include/crypto/cast6.h
@@ -2,6 +2,7 @@
 #ifndef _CRYPTO_CAST6_H
 #define _CRYPTO_CAST6_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <linux/crypto.h>
 #include <crypto/cast_common.h>
@@ -15,10 +16,20 @@ struct cast6_ctx {
 	u8 Kr[12][4];
 };
 
-int __cast6_setkey(struct cast6_ctx *ctx, const u8 *key, unsigned int keylen);
-int cast6_setkey(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST6, __cast6_setkey, int,
+	(struct cast6_ctx *ctx, const u8 *key, unsigned int keylen),
+	(ctx, key, keylen));
 
-void __cast6_encrypt(const void *ctx, u8 *dst, const u8 *src);
-void __cast6_decrypt(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST6, cast6_setkey, int,
+	(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST6, __cast6_encrypt, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST6, __cast6_decrypt, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif
diff --git a/include/crypto/cast_common.h b/include/crypto/cast_common.h
index b90090244164..68f8b4b5ea76 100644
--- a/include/crypto/cast_common.h
+++ b/include/crypto/cast_common.h
@@ -2,9 +2,18 @@
 #ifndef _CRYPTO_CAST_COMMON_H
 #define _CRYPTO_CAST_COMMON_H
 
-extern const u32 cast_s1[256];
-extern const u32 cast_s2[256];
-extern const u32 cast_s3[256];
-extern const u32 cast_s4[256];
+#include <crypto/api.h>
+
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s1, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s2, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s3, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s4, const u32, [256]);
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_CRYPTO_CAST_COMMON)
+#define cast_s1 (((const u32*)CRYPTO_VAR_NAME(cast_s1)))
+#define cast_s2 (((const u32*)CRYPTO_VAR_NAME(cast_s2)))
+#define cast_s3 (((const u32*)CRYPTO_VAR_NAME(cast_s3)))
+#define cast_s4 (((const u32*)CRYPTO_VAR_NAME(cast_s4)))
+#endif
 
 #endif
-- 
2.47.3


