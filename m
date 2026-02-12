Return-Path: <linux-kbuild+bounces-11271-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBUSMvRGjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11271-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:20:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E212A0FF
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 073CC3031327
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694FB21CC7B;
	Thu, 12 Feb 2026 03:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="JJ38z8Pm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B91D5146;
	Thu, 12 Feb 2026 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866418; cv=none; b=TCMluMctkU1uRRZSQDWTuadeHhex2G4t9MtZPvkYYwac/FJfgtijrOf20ac1v9vxlqIFhItET8KTU7EU5RbqkkmP3m4lloisuBxg1WzYAMvxMbqe9feU3pt8g9QfaWmnDn56XIqNCY0GOPvXXx1fO30TnF8zuhQXa7dvwgS0Spo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866418; c=relaxed/simple;
	bh=1W3ZHRH9Ov6Xj6DIUEsHCJyySQpm7KNfsmz2YXn0vKY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFRBntHmSFyKn5ukeJgGBvAmjlggpmtm848p98V0b5GW/8cJgOPoAPqyjPNynq2eYOhykC8EccutYhsGQt7taQcAMvipSzVtRevwZWaRGQZWzPSmW3PyfV7SDvQqD6uiJgS9qcczF9vwjKIn+/amvN3M4r8afpwuFO4i3hnEomA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=JJ38z8Pm; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866417; x=1802402417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hekAfqvesKLSO81lBkrtLnqa/7EsknP3bbaT26p15Kw=;
  b=JJ38z8Pmuwhjxhu6kK8vRzjDyJYhmzVkB8zSoeppCpvhBVl9FvnV/L0G
   SvnGYsgr2kDgdyei4N2NJGYRQnU8PQ6AGAvul7PQhwNeL7+nUsqi2t1uz
   RsRh87Mv1rVfhLEdz7g5MGHY4ojrmmd8Y8Uunwg6pfjdcTsvimm6yD6L+
   dcpfBNsfL/FeyX3mkiM3OrRiAAj0dQvdvx3az4Px8BrVwQZOdpqLsrS0n
   LQiD4mmLyQYCo6Yq/zqJLGMqEjPAZyvsVa96qYQ6OGCqE/NPj+uIsCLM+
   m6DDn/XuD1joBrTIZ82QJX9d5UqDGSkI9yhL3JGFjFD+gIBgmsPcST8si
   A==;
X-CSE-ConnectionGUID: g4ltCrs4QwyT2+0iPYTpYA==
X-CSE-MsgGUID: RSFFzlKjR+il92qZsbqFsg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12699216"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:20:17 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:16169]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id e7d9fef8-ac4d-49f5-8288-f4d34bb1ee95; Thu, 12 Feb 2026 03:20:16 +0000 (UTC)
X-Farcaster-Flow-ID: e7d9fef8-ac4d-49f5-8288-f4d34bb1ee95
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:16 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:16 +0000
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
Subject: [PATCH 19/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:17 +0000
Message-ID: <20260212031521.2124-20-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D040UWB003.ant.amazon.com (10.13.138.8) To
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
	TAGGED_FROM(0.00)[bounces-11271-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 464E212A0FF
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/aria-avx.h            | 35 ++++++++++++++++-----------
 arch/x86/crypto/aria_aesni_avx_glue.c |  4 +--
 arch/x86/crypto/fips140/fips140-api.c | 18 ++++++++++++++
 4 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 103a49fbbac8..bda4e9cd5e2c 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -62,7 +62,7 @@ sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
 sm4-aesni-avx2-x86_64-y := sm4-aesni-avx2-asm_64.o sm4_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
 aria-aesni-avx-x86_64-y := aria-aesni-avx-asm_64.o aria_aesni_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
diff --git a/arch/x86/crypto/aria-avx.h b/arch/x86/crypto/aria-avx.h
index 6e1b2d8a31ed..e4109e67a640 100644
--- a/arch/x86/crypto/aria-avx.h
+++ b/arch/x86/crypto/aria-avx.h
@@ -2,6 +2,7 @@
 #ifndef ASM_X86_ARIA_AVX_H
 #define ASM_X86_ARIA_AVX_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 
 #define ARIA_AESNI_PARALLEL_BLOCKS 16
@@ -13,20 +14,26 @@
 #define ARIA_GFNI_AVX512_PARALLEL_BLOCKS 64
 #define ARIA_GFNI_AVX512_PARALLEL_BLOCK_SIZE  (ARIA_BLOCK_SIZE * ARIA_GFNI_AVX512_PARALLEL_BLOCKS)
 
-asmlinkage void aria_aesni_avx_encrypt_16way(const void *ctx, u8 *dst,
-					     const u8 *src);
-asmlinkage void aria_aesni_avx_decrypt_16way(const void *ctx, u8 *dst,
-					     const u8 *src);
-asmlinkage void aria_aesni_avx_ctr_crypt_16way(const void *ctx, u8 *dst,
-					       const u8 *src,
-					       u8 *keystream, u8 *iv);
-asmlinkage void aria_aesni_avx_gfni_encrypt_16way(const void *ctx, u8 *dst,
-						  const u8 *src);
-asmlinkage void aria_aesni_avx_gfni_decrypt_16way(const void *ctx, u8 *dst,
-						  const u8 *src);
-asmlinkage void aria_aesni_avx_gfni_ctr_crypt_16way(const void *ctx, u8 *dst,
-						    const u8 *src,
-						    u8 *keystream, u8 *iv);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_encrypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_decrypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_ctr_crypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, u8 *keystream, u8 *iv),
+	(ctx, dst, src, keystream, iv));
+#ifdef CONFIG_AS_GFNI
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_gfni_encrypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_gfni_decrypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_gfni_ctr_crypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, u8 *keystream, u8 *iv),
+	(ctx, dst, src, keystream, iv));
+#endif /* CONFIG_AS_GFNI */
 
 asmlinkage void aria_aesni_avx2_encrypt_32way(const void *ctx, u8 *dst,
 					      const u8 *src);
diff --git a/arch/x86/crypto/aria_aesni_avx_glue.c b/arch/x86/crypto/aria_aesni_avx_glue.c
index e4e3d78915a5..4a0bb385515a 100644
--- a/arch/x86/crypto/aria_aesni_avx_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx_glue.c
@@ -215,8 +215,8 @@ static void __exit aria_avx_exit(void)
 	crypto_unregister_skciphers(aria_algs, ARRAY_SIZE(aria_algs));
 }
 
-module_init(aria_avx_init);
-module_exit(aria_avx_exit);
+crypto_module_init(aria_avx_init);
+crypto_module_exit(aria_avx_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Taehee Yoo <ap420073@gmail.com>");
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index 1333b1ce6cdf..ed7a2ad31f24 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -78,4 +78,22 @@ DEFINE_CRYPTO_API_STUB(sm4_cbc_encrypt);
 DEFINE_CRYPTO_API_STUB(sm4_avx_cbc_decrypt);
 DEFINE_CRYPTO_API_STUB(sm4_avx_ctr_crypt);
 
+#endif
+
+/*
+ * arch/x86/crypto/aria_aesni_avx_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64)
+
+#include <arch/x86/crypto/aria-avx.h>
+
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_encrypt_16way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_decrypt_16way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_ctr_crypt_16way);
+#ifdef CONFIG_AS_GFNI
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_encrypt_16way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_decrypt_16way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_ctr_crypt_16way);
+#endif /* CONFIG_AS_GFNI */
+
 #endif
\ No newline at end of file
-- 
2.47.3


