Return-Path: <linux-kbuild+bounces-11263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GX7C35GjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11263-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:18:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A0112A036
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9D68301A9F9
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9976422A4EB;
	Thu, 12 Feb 2026 03:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OOPbT6d4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785BB21CC7B;
	Thu, 12 Feb 2026 03:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866299; cv=none; b=CQjvplmoX0QPtqJTKilAdn7UdPLhS3w2U+oopyjTCScv7ucEVNujQLgN1IAjuLFfZIbcQDodQ2DDa4ijzem42cGWyu9aligLg2KDAiKne25dheOLJeyc0g+v3ZJj/IdLjxDvAA7jQiS6Pb0v4be7nsByYqKD1iIIFXJdr69AAOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866299; c=relaxed/simple;
	bh=r7+KUwelzOI9zFeeoFolW0Fd2GNwiaB5qsmKYRKu2/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nk/ayZGVNOtA3eFRBt5DiNRS2RSQKj4JqFNJBUpcB3sQ5fPi6dujZziSCFxFKwJb/XLacjxz2M8AfrWVDORgoykK22XZo+4j5DcBk06wjr4m5aHdJ1jhTorDFlo4HBSRDfzTIlC4yNoyr37Gmzbayg3mLKKCjAQNMoAh9H8cY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OOPbT6d4; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866298; x=1802402298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2sgxCjhm5cJH8SjQ15OI9DSATcBhwakKChkzWtlILHI=;
  b=OOPbT6d4FfElHQbH7NauMRq0CbX67WiMJwR7rgsg7G9O66Negqb2ve/E
   AChV75ABXv4aOWhbIL41a/urCpmoR9sceFz0Tz5AcieZuVR4sveiFCa5p
   HBaQDUu0EU5fsppNMDBgnNLnTncEFCSBy3365iAnm2ZnEs3Asli7pP8MT
   WWxmBaEeglWGF6eV96nU6LJi2HXHEXwnJFXUYRtFhk6tTHtniDKG8Ofs0
   zE+6YSVgzEnpchNJQ5Bo74/6eJAV6PP71AbBKKCz82Ua11wQqmfHeBy28
   /YlNQjYHg1bA2Mh8dZ3szFdlAhwHGV08lHdskzrphRiWE4PRte2trvCZe
   A==;
X-CSE-ConnectionGUID: CXxigHAnSYiuPdXSwDrhrw==
X-CSE-MsgGUID: MKBysYrTQFG883cIN9bc6g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12915408"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:18:13 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:5328]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 2e50abd0-be15-4203-b2be-d79b7ee2fbed; Thu, 12 Feb 2026 03:18:12 +0000 (UTC)
X-Farcaster-Flow-ID: 2e50abd0-be15-4203-b2be-d79b7ee2fbed
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:12 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:12 +0000
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
Subject: [PATCH 11/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:09 +0000
Message-ID: <20260212031521.2124-12-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D045UWA001.ant.amazon.com (10.13.139.83) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11263-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6A0112A036
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile                  |  2 +-
 arch/x86/crypto/camellia.h                | 13 +++++++++----
 arch/x86/crypto/camellia_aesni_avx_glue.c |  4 ++--
 arch/x86/crypto/fips140/fips140-api.c     | 13 +++++++++++++
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index a3af66c98760..205b4467ab79 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -25,7 +25,7 @@ des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
 
 crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
 camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
-obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
 camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_glue.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
 camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
diff --git a/arch/x86/crypto/camellia.h b/arch/x86/crypto/camellia.h
index bca0b64ab8d7..6cfe3dd134ae 100644
--- a/arch/x86/crypto/camellia.h
+++ b/arch/x86/crypto/camellia.h
@@ -41,10 +41,15 @@ DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, camellia_dec_blk_2way, asmlink
 	(ctx, dst, src));
 
 /* 16-way parallel cipher functions (avx/aes-ni) */
-asmlinkage void camellia_ecb_enc_16way(const void *ctx, u8 *dst, const u8 *src);
-asmlinkage void camellia_ecb_dec_16way(const void *ctx, u8 *dst, const u8 *src);
-
-asmlinkage void camellia_cbc_dec_16way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64, camellia_ecb_enc_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64, camellia_ecb_dec_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64, camellia_cbc_dec_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 static inline void camellia_enc_blk(const void *ctx, u8 *dst, const u8 *src)
 {
diff --git a/arch/x86/crypto/camellia_aesni_avx_glue.c b/arch/x86/crypto/camellia_aesni_avx_glue.c
index 5c321f255eb7..14e70c0f6fb7 100644
--- a/arch/x86/crypto/camellia_aesni_avx_glue.c
+++ b/arch/x86/crypto/camellia_aesni_avx_glue.c
@@ -122,8 +122,8 @@ static void __exit camellia_aesni_fini(void)
 	crypto_unregister_skciphers(camellia_algs, ARRAY_SIZE(camellia_algs));
 }
 
-module_init(camellia_aesni_init);
-module_exit(camellia_aesni_fini);
+crypto_module_init(camellia_aesni_init);
+crypto_module_exit(camellia_aesni_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Camellia Cipher Algorithm, AES-NI/AVX optimized");
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index 57a1625219e0..8048f1568852 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -50,4 +50,17 @@ DEFINE_CRYPTO_API_STUB(__camellia_enc_blk_2way);
 DEFINE_CRYPTO_API_STUB(camellia_dec_blk_2way);
 DEFINE_CRYPTO_API_STUB(camellia_decrypt_cbc_2way);
 
+#endif
+
+/*
+ * arch/x86/crypto/camellia_aesni_avx_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64)
+
+#include <arch/x86/crypto/camellia.h>
+
+DEFINE_CRYPTO_API_STUB(camellia_ecb_enc_16way);
+DEFINE_CRYPTO_API_STUB(camellia_ecb_dec_16way);
+DEFINE_CRYPTO_API_STUB(camellia_cbc_dec_16way);
+
 #endif
\ No newline at end of file
-- 
2.47.3


