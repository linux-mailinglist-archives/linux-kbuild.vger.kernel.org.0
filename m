Return-Path: <linux-kbuild+bounces-11258-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEveDS1GjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11258-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:17:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B9129FB8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03EAC304E0F6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235A3219A8E;
	Thu, 12 Feb 2026 03:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="s7Tr99oZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5011D5146;
	Thu, 12 Feb 2026 03:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866217; cv=none; b=tRdXs6YpVP8UOju/J1gvqRd/5mQWn8QmS9ky+LW9irSNDJMJ1HKvY2euk7NkPCeiFcwjSRl+CFkZLl1kfJJJeyta8NY613eGKbtk9T1sv/+QU2uiuLonmiNzCq7bs234DXlzbsVrv3TnD56l5o+nFTJzIXf/OxA8SccpOCMn+/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866217; c=relaxed/simple;
	bh=79MoBJwMF5M6gty6q5NxVze+1ccaSQL+95OUeBgm5pM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hu5wXg1rU0qRyuhyzaeGDu1g4lGufIcn+RO5cLdLPKn57SJlHxW7yGSPUdVAs7/7fWU2ZlPIqvwtk3iWvu2tIV753CuKHkFll76Rjq+r166gDxciXuuh82JTj9bZJ8gC5YO9Ce7Yutnh4gYcIPAXge9lGu/JoDMEkJfX+LTAqcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=s7Tr99oZ; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866215; x=1802402215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e3V4quBbOIFG09t6y5Tgt1YSCmqXUpYhT3hsnForu/4=;
  b=s7Tr99oZSnJVW/Qw1f5eLd5/nUo6ZVnTTy1iyuId2tzXZ8QVo8qV0zjq
   ZElqYGTcCM42WAn8SibmG7qml86Gk6r/aoVsd17lAVlHGAdY9dn1UiRWe
   o5efF//QAZB72+t/p4juyEIz17BdfUnF1B6hTy5b4nFA1xfnk+hBmzg61
   5loBRjtH2/kuU5kEF07mOZxiMhEyPI9FOzziirKlsnkEX7aBY48vq0MAy
   QKw0+522ikGs8SFoFl5a/hwOdPBZK+zKsjisADow50fEYVDXqp8v/sK9z
   8DhHwURjRxSlrqy7bv33IaoXKV6g8oTC6Pdy5yZEaOYdqm6Fde+FIUYm3
   Q==;
X-CSE-ConnectionGUID: +80tQamRSW2Boz3oyW592w==
X-CSE-MsgGUID: t0DrpEIQQFObMDEguCI/PA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920612"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:16:55 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:4426]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id c682c964-50de-491a-ac4a-8edf5074c1ac; Thu, 12 Feb 2026 03:16:55 +0000 (UTC)
X-Farcaster-Flow-ID: c682c964-50de-491a-ac4a-8edf5074c1ac
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:55 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:54 +0000
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
Subject: [PATCH 06/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SERPENT_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:04 +0000
Message-ID: <20260212031521.2124-7-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D045UWA004.ant.amazon.com (10.13.139.91) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11258-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A78B9129FB8
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SERPENT_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/fips140/fips140-api.c | 13 +++++++++++++
 arch/x86/crypto/serpent-avx.h         | 17 ++++++++++-------
 arch/x86/crypto/serpent_avx_glue.c    |  4 ++--
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 986ed1d64b51..8be124f5e05d 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_CRYPTO_SERPENT_SSE2_586) += serpent-sse2-i586.o
 serpent-sse2-i586-y := serpent-sse2-i586-asm_32.o serpent_sse2_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
 serpent-sse2-x86_64-y := serpent-sse2-x86_64-asm_64.o serpent_sse2_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
 serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
 obj-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
 serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index a1a207fa34cd..15a60258d4ee 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -21,4 +21,17 @@ DEFINE_CRYPTO_API_STUB(__twofish_enc_blk_3way);
 DEFINE_CRYPTO_API_STUB(twofish_dec_blk_3way);
 DEFINE_CRYPTO_API_STUB(twofish_dec_blk_cbc_3way);
 
+#endif
+
+/*
+ * arch/x86/crypto/serpent_avx_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SERPENT_AVX_X86_64)
+
+#include <arch/x86/crypto/serpent-avx.h>
+
+DEFINE_CRYPTO_API_STUB(serpent_ecb_enc_8way_avx);
+DEFINE_CRYPTO_API_STUB(serpent_ecb_dec_8way_avx);
+DEFINE_CRYPTO_API_STUB(serpent_cbc_dec_8way_avx);
+
 #endif
\ No newline at end of file
diff --git a/arch/x86/crypto/serpent-avx.h b/arch/x86/crypto/serpent-avx.h
index 23f3361a0e72..8e7f285273ca 100644
--- a/arch/x86/crypto/serpent-avx.h
+++ b/arch/x86/crypto/serpent-avx.h
@@ -2,6 +2,7 @@
 #ifndef ASM_X86_SERPENT_AVX_H
 #define ASM_X86_SERPENT_AVX_H
 
+#include <crypto/api.h>
 #include <crypto/b128ops.h>
 #include <crypto/serpent.h>
 #include <linux/types.h>
@@ -10,12 +11,14 @@ struct crypto_skcipher;
 
 #define SERPENT_PARALLEL_BLOCKS 8
 
-asmlinkage void serpent_ecb_enc_8way_avx(const void *ctx, u8 *dst,
-					 const u8 *src);
-asmlinkage void serpent_ecb_dec_8way_avx(const void *ctx, u8 *dst,
-					 const u8 *src);
-
-asmlinkage void serpent_cbc_dec_8way_avx(const void *ctx, u8 *dst,
-					 const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT_AVX_X86_64, serpent_ecb_enc_8way_avx, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT_AVX_X86_64, serpent_ecb_dec_8way_avx, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT_AVX_X86_64, serpent_cbc_dec_8way_avx, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif
diff --git a/arch/x86/crypto/serpent_avx_glue.c b/arch/x86/crypto/serpent_avx_glue.c
index 9c8b3a335d5c..43c877a2fc7e 100644
--- a/arch/x86/crypto/serpent_avx_glue.c
+++ b/arch/x86/crypto/serpent_avx_glue.c
@@ -117,8 +117,8 @@ static void __exit serpent_exit(void)
 	crypto_unregister_skciphers(serpent_algs, ARRAY_SIZE(serpent_algs));
 }
 
-module_init(serpent_init);
-module_exit(serpent_exit);
+crypto_module_init(serpent_init);
+crypto_module_exit(serpent_exit);
 
 MODULE_DESCRIPTION("Serpent Cipher Algorithm, AVX optimized");
 MODULE_LICENSE("GPL");
-- 
2.47.3


