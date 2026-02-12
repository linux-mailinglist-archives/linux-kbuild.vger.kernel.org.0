Return-Path: <linux-kbuild+bounces-11272-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIuUJQRHjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11272-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:20:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37F12A117
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A367330257C2
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1B823FC54;
	Thu, 12 Feb 2026 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="pqaxNqrT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1701E1D5146;
	Thu, 12 Feb 2026 03:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866434; cv=none; b=ZmKo51CiAIt5y9PjkmxoHiZsJlJEr+1O8PGYGq9DtWFVQWQ8A8bzH9dkJABtoAM3vHecsYz9cPUI2DnjNlZID0SS0r8bFmPOLn8ke0B05uiUOWKWNp6oeUjbCJgXvQ1iCeoAbrn6BuFsO2nLZUO5eEz8UM5SsA/IWQtJL1U7GYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866434; c=relaxed/simple;
	bh=UDLBASICYdXNYqUE0AWzsAQvcj3BVY/pwYtVlTFbnrs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzmKMZrrFq//bytTUNg3nLLCyV/b/2WWmidmuPb596Ai5S/6en5nnbouDiLBRCHH5maeMEjCP1Yi820mLKbdX6CQil7Mt7StMdDNu2C9DrMWA7TCLlAvoy4m5HghSFBJRTokFBTr1501TriEDzy4YX7mtkMKB0n+dUB7N9ivsVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=pqaxNqrT; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866433; x=1802402433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5xGvL1J1uf2bkE2vJBLVKbbQ1epUeIGWBJcS2Tkl6SQ=;
  b=pqaxNqrTGq6FYEiLSvax6TjbgAfms4owlgWMGbubgNuumqHU6DLxjYpI
   nBjrY3Cp9QX8ajy5op7lQ2bdNfiLDzUyXHBAgei1Omw4ZAEkHn9Y7Y1ag
   aIKclMYYnS0VVOXJd9NlEPChe84lgibdONB5j+cH3MMAFcFLeXwKeNUDs
   3rKl5kW0dyy/YXIEA/nLZXRRr8vBS0oUfl6j5+ekj915JH+1zDmZdnFal
   WsyH/ckD7oyr0RrpU1Hanx/cjwDDGpTULSwOrrEpc02K2IE9w00Yc+hoC
   736KldU2Luz1XzincIdUAF6tF2Zf4SWZW1Vz9btg7QZu6OZv3qIp6tXZe
   A==;
X-CSE-ConnectionGUID: OXwOh6UVQk2gn1Y/uFs1vQ==
X-CSE-MsgGUID: ky+o7QqbTnGbceSOGTiNtA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12699226"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:20:32 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:7311]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id ff660b6e-e9f2-4a1d-8590-80432ce5d08e; Thu, 12 Feb 2026 03:20:32 +0000 (UTC)
X-Farcaster-Flow-ID: ff660b6e-e9f2-4a1d-8590-80432ce5d08e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:32 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:31 +0000
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
Subject: [PATCH 20/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:18 +0000
Message-ID: <20260212031521.2124-21-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
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
	TAGGED_FROM(0.00)[bounces-11272-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 3C37F12A117
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile               |  2 +-
 arch/x86/crypto/aria-avx.h             | 34 +++++++++++++++-----------
 arch/x86/crypto/aria_aesni_avx2_glue.c |  4 +--
 arch/x86/crypto/fips140/fips140-api.c  | 18 ++++++++++++++
 4 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index bda4e9cd5e2c..28ed31e7d6e3 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -65,7 +65,7 @@ sm4-aesni-avx2-x86_64-y := sm4-aesni-avx2-asm_64.o sm4_aesni_avx2_glue.o
 crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
 aria-aesni-avx-x86_64-y := aria-aesni-avx-asm_64.o aria_aesni_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
 aria-aesni-avx2-x86_64-y := aria-aesni-avx2-asm_64.o aria_aesni_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
diff --git a/arch/x86/crypto/aria-avx.h b/arch/x86/crypto/aria-avx.h
index e4109e67a640..9804d3f43fce 100644
--- a/arch/x86/crypto/aria-avx.h
+++ b/arch/x86/crypto/aria-avx.h
@@ -35,20 +35,26 @@ DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_gfni_ctr_
 	(ctx, dst, src, keystream, iv));
 #endif /* CONFIG_AS_GFNI */
 
-asmlinkage void aria_aesni_avx2_encrypt_32way(const void *ctx, u8 *dst,
-					      const u8 *src);
-asmlinkage void aria_aesni_avx2_decrypt_32way(const void *ctx, u8 *dst,
-					      const u8 *src);
-asmlinkage void aria_aesni_avx2_ctr_crypt_32way(const void *ctx, u8 *dst,
-						const u8 *src,
-						u8 *keystream, u8 *iv);
-asmlinkage void aria_aesni_avx2_gfni_encrypt_32way(const void *ctx, u8 *dst,
-						   const u8 *src);
-asmlinkage void aria_aesni_avx2_gfni_decrypt_32way(const void *ctx, u8 *dst,
-						   const u8 *src);
-asmlinkage void aria_aesni_avx2_gfni_ctr_crypt_32way(const void *ctx, u8 *dst,
-						     const u8 *src,
-						     u8 *keystream, u8 *iv);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_encrypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_decrypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_ctr_crypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, u8 *keystream, u8 *iv),
+	(ctx, dst, src, keystream, iv));
+#ifdef CONFIG_AS_GFNI
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_gfni_encrypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_gfni_decrypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_gfni_ctr_crypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, u8 *keystream, u8 *iv),
+	(ctx, dst, src, keystream, iv));
+#endif /* CONFIG_AS_GFNI */
 
 struct aria_avx_ops {
 	void (*aria_encrypt_16way)(const void *ctx, u8 *dst, const u8 *src);
diff --git a/arch/x86/crypto/aria_aesni_avx2_glue.c b/arch/x86/crypto/aria_aesni_avx2_glue.c
index 1487a49bfbac..26f9f10913a7 100644
--- a/arch/x86/crypto/aria_aesni_avx2_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx2_glue.c
@@ -235,8 +235,8 @@ static void __exit aria_avx2_exit(void)
 	crypto_unregister_skciphers(aria_algs, ARRAY_SIZE(aria_algs));
 }
 
-module_init(aria_avx2_init);
-module_exit(aria_avx2_exit);
+crypto_module_init(aria_avx2_init);
+crypto_module_exit(aria_avx2_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Taehee Yoo <ap420073@gmail.com>");
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index ed7a2ad31f24..ced6b58fcb81 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -96,4 +96,22 @@ DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_decrypt_16way);
 DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_ctr_crypt_16way);
 #endif /* CONFIG_AS_GFNI */
 
+#endif
+
+/*
+ * arch/x86/crypto/aria_aesni_avx2_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64)
+
+#include <arch/x86/crypto/aria-avx.h>
+
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_encrypt_32way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_decrypt_32way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_ctr_crypt_32way);
+#ifdef CONFIG_AS_GFNI
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_gfni_encrypt_32way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_gfni_decrypt_32way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_gfni_ctr_crypt_32way);
+#endif /* CONFIG_AS_GFNI */
+
 #endif
\ No newline at end of file
-- 
2.47.3


