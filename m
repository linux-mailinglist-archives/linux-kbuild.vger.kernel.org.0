Return-Path: <linux-kbuild+bounces-11250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDA1GKJFjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11250-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:14:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DCD129EF5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69E083024936
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608DE239567;
	Thu, 12 Feb 2026 03:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="qf2EOveI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9F52AE8D;
	Thu, 12 Feb 2026 03:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866079; cv=none; b=qBrllAlpmXMehnjnGFRm2tAXjR0sxMnNzC4dNvZJdsoqNswvQsriRYfexdNoMhsl90rLOLUkJC1etbMQWiJEqcrB9XWspgShVAR29/ZSLwd8cW/MBlHwLS3lfo1hbyDwNc5Se0WO0xWMLNISOqG73sGs8NpPEUXzt2hpz6Lfohg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866079; c=relaxed/simple;
	bh=mf5TnFCEL+1bs+cALVoYizQUisSYlDZyuvuJi+C+4dA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGzBvfEDjXm+jUdvKgX9dO5VWr7zfhxVNlvnZLM/KOnRk+rprWLcz9ShvPIYTfRZSGCehRmPjXDbKN1THyzq45KFytX39ptXEZ8xnMXRySXHhLkRwIsCDjgKmLNik0YFkxt1KjshQGPfsuSYmUvvRkM3Yhejmy85derX6BE5G/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=qf2EOveI; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866078; x=1802402078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NrfzSoQbYKEAHAMOMCrXzmBVp7QZGA3rOkELb9z5dlA=;
  b=qf2EOveIHxu4QYDrIIbgnK81fvhhW9LWcUMEqnxfwAnmQvmkrIrHEFDx
   t5PbtXznpzKbvgw2JKh2fV24n6BLpO+GZkYspuM6+pe2ZE01VVEyqEPKJ
   wW7ViWxEm237GcDEZarQ8V0xjXLZBb1VQnqg89VOzB8m0LZh3+/zQqu4m
   FzYggFP8oZmv+PIR9MG289Da5wVQmWGSOCR8uKZADhEZciGMn4ub6voMJ
   +Y5oEcI4nk+HYL9INo/9RFkEaeoDfT4ypQsCv7FAyWv6KgqHb8iicsiuc
   hgzhHfwj+ZkOrru7+aVMuWiI586bFegZZAPiU6zt1nbwcUWXI/NjF/ZOx
   A==;
X-CSE-ConnectionGUID: 9cF7UqbnSaKFuEwjqwxQsg==
X-CSE-MsgGUID: CNc4b7kbSeykPI4ft9DKHA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12697508"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:14:37 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:30549]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 0b32ee96-44a4-46d9-9e91-9f26a16eca2d; Thu, 12 Feb 2026 03:14:37 +0000 (UTC)
X-Farcaster-Flow-ID: 0b32ee96-44a4-46d9-9e91-9f26a16eca2d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:37 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:37 +0000
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
Subject: [PATCH 105/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SIMD crypto
Date: Thu, 12 Feb 2026 02:47:21 +0000
Message-ID: <20260212024725.11264-106-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D035UWB001.ant.amazon.com (10.13.138.33) To
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
	TAGGED_FROM(0.00)[bounces-11250-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oracle.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03DCD129EF5
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SIMD-related crypto to convert them into pluggable
interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile                |  2 +-
 crypto/fips140/fips140-api.c   | 15 +++++++++++++++
 include/crypto/internal/simd.h | 33 ++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c1088b10f49a..7403364c9afa 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -200,7 +200,7 @@ crypto-objs-$(CONFIG_XOR_BLOCKS) += xor.o
 obj-$(CONFIG_ASYNC_CORE) += async_tx/
 obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys/
 crypto_simd-y := simd.o
-obj-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
+crypto-objs-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
 
 #
 # Key derivation function
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 74eae8815067..126ecd09ae07 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -913,4 +913,19 @@ DEFINE_CRYPTO_API_STUB(crypto_ecdh_decode_key);
 
 DEFINE_CRYPTO_API_STUB(verify_pefile_signature);
 
+#endif
+/*
+ * crypto/simd.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SIMD)
+
+#include <crypto/internal/simd.h>
+
+DEFINE_CRYPTO_API_STUB(simd_skcipher_create_compat);
+DEFINE_CRYPTO_API_STUB(simd_skcipher_free);
+DEFINE_CRYPTO_API_STUB(simd_register_skciphers_compat);
+DEFINE_CRYPTO_API_STUB(simd_unregister_skciphers);
+DEFINE_CRYPTO_API_STUB(simd_register_aeads_compat);
+DEFINE_CRYPTO_API_STUB(simd_unregister_aeads);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/internal/simd.h b/include/crypto/internal/simd.h
index 9e338e7aafbd..be84d67f3ceb 100644
--- a/include/crypto/internal/simd.h
+++ b/include/crypto/internal/simd.h
@@ -6,6 +6,8 @@
 #ifndef _CRYPTO_INTERNAL_SIMD_H
 #define _CRYPTO_INTERNAL_SIMD_H
 
+#include <crypto/api.h>
+
 #include <asm/simd.h>
 #include <linux/percpu.h>
 #include <linux/types.h>
@@ -15,28 +17,33 @@
 struct simd_skcipher_alg;
 struct skcipher_alg;
 
-struct simd_skcipher_alg *simd_skcipher_create_compat(struct skcipher_alg *ialg,
-						      const char *algname,
-						      const char *drvname,
-						      const char *basename);
-void simd_skcipher_free(struct simd_skcipher_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_skcipher_create_compat, struct simd_skcipher_alg *,
+	(struct skcipher_alg *ialg, const char *algname, const char *drvname, const char *basename),
+	(ialg, algname, drvname, basename));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_skcipher_free, void,
+	(struct simd_skcipher_alg *alg),
+	(alg));
 
-int simd_register_skciphers_compat(struct skcipher_alg *algs, int count,
-				   struct simd_skcipher_alg **simd_algs);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_register_skciphers_compat, int,
+	(struct skcipher_alg *algs, int count, struct simd_skcipher_alg **simd_algs),
+	(algs, count, simd_algs));
 
-void simd_unregister_skciphers(struct skcipher_alg *algs, int count,
-			       struct simd_skcipher_alg **simd_algs);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_unregister_skciphers, void,
+	(struct skcipher_alg *algs, int count, struct simd_skcipher_alg **simd_algs),
+	(algs, count, simd_algs));
 
 /* AEAD support */
 
 struct simd_aead_alg;
 struct aead_alg;
 
-int simd_register_aeads_compat(struct aead_alg *algs, int count,
-			       struct simd_aead_alg **simd_algs);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_register_aeads_compat, int,
+	(struct aead_alg *algs, int count, struct simd_aead_alg **simd_algs),
+	(algs, count, simd_algs));
 
-void simd_unregister_aeads(struct aead_alg *algs, int count,
-			   struct simd_aead_alg **simd_algs);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_unregister_aeads, void,
+	(struct aead_alg *algs, int count, struct simd_aead_alg **simd_algs),
+	(algs, count, simd_algs));
 
 /*
  * crypto_simd_usable() - is it allowed at this time to use SIMD instructions or
-- 
2.47.3


