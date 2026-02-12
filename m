Return-Path: <linux-kbuild+bounces-11268-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MIUMNdGjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11268-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:19:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B27212A0B8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFAB33030EA1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583C522301;
	Thu, 12 Feb 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="PxKs2hqq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4DE23EA97;
	Thu, 12 Feb 2026 03:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866389; cv=none; b=s4esWfFCsQ7Q2TFYIHfF02fuwdRu9om+U9UKvfffpv7bfjW7h/5ZUf26LKn7YX/geNWG1T8HT+rmmbyEepOy+CtWc7cg+d1MB1NB62hLcrWA1yJbCKmFG4dIUbDIf9NhGdn25OI7CLdCn4TcDKo0k+Rr3DsRdmiplJlbIFPY5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866389; c=relaxed/simple;
	bh=Fruswn/azFiJpYVipOIukHs1RKbYw+/6Oq8KIbECAvs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Utafi3PGUHtkLYJSWRycA5AJCQwjNGG9Lt5uI2PCDLTNCKbNHHf405BDa+PZF1tsUOzYLc3XysnO6OFaNJTKbAOI5EdcPXbV7oAtUHKWzc6rzzKwNnwizvy6mi8qDYtoMUy9iGuKj3uNpz70ILORS0EGxxMT+H9lTgCZ89zeVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=PxKs2hqq; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866387; x=1802402387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3y3Y/YahMHu/cI3CnH2Kckur43X2LodXOqWgadEueQc=;
  b=PxKs2hqqqsZ48d67PX8+DQ+plvnq4DNKPKnit2uArE48uUxQA8FaU5ba
   YS9/Ojm4rMpwzgvcLkypGdBg4raR8I/Ps2wnuMRbl9xq5BqSqL/paqv46
   tOsAVi9+RnkkpzIjkPBAxYCeHOptgNeddztN0p1pL2jLc8tYu92z2xWZr
   GYfk49YgAH5E6ekDmKXNRyLJUpDB/A9BC4JVfor3ZAQHqq8zjqBIaPE0n
   PX9aY89pZ6a1fSQw2x7p1uRH5K2Bs9wWRJzh9Q8yp12gbqgsmPgW2FDGj
   yA2gYXRYB8/LHbi88qY1adcaKGQWIcEo3fU+vTrAMcQtNEIerZSqTPPmd
   A==;
X-CSE-ConnectionGUID: C8uMKJAAQKOAV2lfJKuiFg==
X-CSE-MsgGUID: aHxu2BR6T6adhSZnVdZONw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12915462"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:19:47 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:2200]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id b5021a5e-12c2-45fa-84cb-b65883112639; Thu, 12 Feb 2026 03:19:47 +0000 (UTC)
X-Farcaster-Flow-ID: b5021a5e-12c2-45fa-84cb-b65883112639
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:19:45 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:19:45 +0000
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
Subject: [PATCH 17/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:15 +0000
Message-ID: <20260212031521.2124-18-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWA003.ant.amazon.com (10.13.139.42) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11268-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alibaba.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B27212A0B8
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/fips140/fips140-api.c | 15 +++++++++++++++
 arch/x86/crypto/sm4-avx.h             | 26 +++++++++++++++++---------
 arch/x86/crypto/sm4_aesni_avx_glue.c  |  4 ++--
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index ffe37f4d4a7b..ce00d3e0e451 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -56,7 +56,7 @@ ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SM3_AVX_X86_64) += sm3-avx-x86_64.o
 sm3-avx-x86_64-y := sm3-avx-asm_64.o sm3_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
 sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index 8048f1568852..1333b1ce6cdf 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -63,4 +63,19 @@ DEFINE_CRYPTO_API_STUB(camellia_ecb_enc_16way);
 DEFINE_CRYPTO_API_STUB(camellia_ecb_dec_16way);
 DEFINE_CRYPTO_API_STUB(camellia_cbc_dec_16way);
 
+#endif
+
+/*
+ * arch/x86/crypto/sm4_aesni_avx_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64)
+
+#include <arch/x86/crypto/sm4-avx.h>
+
+DEFINE_CRYPTO_API_STUB(sm4_avx_ecb_encrypt);
+DEFINE_CRYPTO_API_STUB(sm4_avx_ecb_decrypt);
+DEFINE_CRYPTO_API_STUB(sm4_cbc_encrypt);
+DEFINE_CRYPTO_API_STUB(sm4_avx_cbc_decrypt);
+DEFINE_CRYPTO_API_STUB(sm4_avx_ctr_crypt);
+
 #endif
\ No newline at end of file
diff --git a/arch/x86/crypto/sm4-avx.h b/arch/x86/crypto/sm4-avx.h
index b5b5e67e40ed..2a8c05e6f255 100644
--- a/arch/x86/crypto/sm4-avx.h
+++ b/arch/x86/crypto/sm4-avx.h
@@ -2,19 +2,27 @@
 #ifndef ASM_X86_SM4_AVX_H
 #define ASM_X86_SM4_AVX_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <crypto/sm4.h>
 
 typedef void (*sm4_crypt_func)(const u32 *rk, u8 *dst, const u8 *src, u8 *iv);
 
-int sm4_avx_ecb_encrypt(struct skcipher_request *req);
-int sm4_avx_ecb_decrypt(struct skcipher_request *req);
-
-int sm4_cbc_encrypt(struct skcipher_request *req);
-int sm4_avx_cbc_decrypt(struct skcipher_request *req,
-			unsigned int bsize, sm4_crypt_func func);
-
-int sm4_avx_ctr_crypt(struct skcipher_request *req,
-			unsigned int bsize, sm4_crypt_func func);
+struct skcipher_request;
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_avx_ecb_encrypt, int,
+	(struct skcipher_request *req),
+	(req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_avx_ecb_decrypt, int,
+	(struct skcipher_request *req),
+	(req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_cbc_encrypt, int,
+	(struct skcipher_request *req),
+	(req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_avx_cbc_decrypt, int,
+	(struct skcipher_request *req, unsigned int bsize, sm4_crypt_func func),
+	(req, bsize, func));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_avx_ctr_crypt, int,
+	(struct skcipher_request *req, unsigned int bsize, sm4_crypt_func func),
+	(req, bsize, func));
 
 #endif
diff --git a/arch/x86/crypto/sm4_aesni_avx_glue.c b/arch/x86/crypto/sm4_aesni_avx_glue.c
index 88caf418a06f..787468f9dcf2 100644
--- a/arch/x86/crypto/sm4_aesni_avx_glue.c
+++ b/arch/x86/crypto/sm4_aesni_avx_glue.c
@@ -339,8 +339,8 @@ static void __exit sm4_exit(void)
 				    ARRAY_SIZE(sm4_aesni_avx_skciphers));
 }
 
-module_init(sm4_init);
-module_exit(sm4_exit);
+crypto_module_init(sm4_init);
+crypto_module_exit(sm4_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
-- 
2.47.3


