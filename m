Return-Path: <linux-kbuild+bounces-11181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKDgCXRBjWn00QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11181-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:56:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D89FD129834
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF9A03025A73
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E45F221FCA;
	Thu, 12 Feb 2026 02:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="o3tPzfjG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB4B8C1F;
	Thu, 12 Feb 2026 02:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865007; cv=none; b=lN5bRV77WLY3pUOAAGH6jdvT9A8oRZI9+tPEtsoxm5S8JJxO6O/lddHf2Y4tIeWRtpROtczJsveDbbVnRt9KLD8Rxo0Noory4ZHPrgBzAM7+gGiB5B7zUQF4ho3UlCofq+UHPEsfdex5QuEbUBNwLiH0QoFxAWRO/Vc1Jdo6Lpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865007; c=relaxed/simple;
	bh=ZZat31b7PaoXPV87DF3ewNQ8fTFVuDWoZssPPVww5DM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASsjlISHN7eUjumEJMrdmBCEBtjPqeFeyIfJu7MyT2NxsMnUwXTrqUlkP/Skn7T9Nc33LIm1ZjFOUOdlmGRuWTkLZycUi3hi5Q7Tx5lu3baqB6VeI60dF5A/dYi8PmKsToRmhNT08WCtE/6asbeNU63EGBd05ZU0JEq2rfugXPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=o3tPzfjG; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865006; x=1802401006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+HBU0nwclYf+6ttesv1icUIPfdfgwyseOCXiMKyjg10=;
  b=o3tPzfjGkQKenGPHnFOJk7QhxWwWupzLnmE4o01kG1N8VIsYgR/LHSya
   nsVcrss1GWlbw6V9f9V5i1OFu9vPM9KsyFLYO6cigyer9xn19mEL4vMth
   95QJufk0a9Et1RGJFQDrfcp2Uo9IOaGemzN6Q2+jdm0WiSj5GigU+lhoL
   35577mW4dgyPkNBpNSGXjWOsoiKdhFkdyv3Bl4/+yPCZTK7Uef+Rqpf0w
   reLYkrYZu7L4aQtiNSbvkc32mmt9wlXDRSOsdajM6Ltmydrxb3nYvxW7d
   TnoplC2FvS3FWCFQ3/I25bzxtBUA918t2/Sjkn2ZqP1ILnIMnefLU2+At
   w==;
X-CSE-ConnectionGUID: nJe8wMq6ST6bGVA1ZzwoLw==
X-CSE-MsgGUID: AF/jBofLR/KadomO1O/YPQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744217"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:56:45 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:31792]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 107c2b80-81e1-4181-b6c2-9e5ed19488ee; Thu, 12 Feb 2026 02:56:45 +0000 (UTC)
X-Farcaster-Flow-ID: 107c2b80-81e1-4181-b6c2-9e5ed19488ee
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:45 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:45 +0000
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
Subject: [PATCH 036/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ENGINE crypto
Date: Thu, 12 Feb 2026 02:46:12 +0000
Message-ID: <20260212024725.11264-37-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11181-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D89FD129834
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ENGINE-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |   2 +-
 crypto/fips140/fips140-api.c |  40 ++++++++++
 include/crypto/engine.h      | 140 +++++++++++++++++++++++------------
 3 files changed, 135 insertions(+), 47 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index d58b5e2b5b43..f2b9532a0320 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -8,7 +8,7 @@ CONTEXT_ANALYSIS := y
 crypto-objs-$(CONFIG_CRYPTO) += crypto.o
 crypto-y := api.o cipher.o
 
-obj-$(CONFIG_CRYPTO_ENGINE) += crypto_engine.o
+crypto-objs-$(CONFIG_CRYPTO_ENGINE) += crypto_engine.o
 obj-$(CONFIG_CRYPTO_FIPS) += fips.o
 
 crypto_algapi-$(CONFIG_PROC_FS) += proc.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index e679932ab552..05ada434d1ac 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -526,3 +526,43 @@ DEFINE_CRYPTO_API_STUB(pkcs7_verify);
 DEFINE_CRYPTO_API_STUB(pkcs7_supply_detached_data);
 
 #endif
+/*
+ * crypto/crypto_engine.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ENGINE)
+
+#include <crypto/engine.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_transfer_aead_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_transfer_akcipher_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_transfer_hash_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_transfer_kpp_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_transfer_skcipher_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_aead_request);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_akcipher_request);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_hash_request);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_kpp_request);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_skcipher_request);
+DEFINE_CRYPTO_API_STUB(crypto_engine_start);
+DEFINE_CRYPTO_API_STUB(crypto_engine_stop);
+DEFINE_CRYPTO_API_STUB(crypto_engine_alloc_init);
+DEFINE_CRYPTO_API_STUB(crypto_engine_alloc_init_and_set);
+DEFINE_CRYPTO_API_STUB(crypto_engine_exit);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_aead);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_aead);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_aeads);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_aeads);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_ahashes);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_ahashes);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_akcipher);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_akcipher);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_kpp);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_kpp);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_skciphers);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_skciphers);
+
+#endif
\ No newline at end of file
diff --git a/include/crypto/engine.h b/include/crypto/engine.h
index 2e60344437da..82552e11880a 100644
--- a/include/crypto/engine.h
+++ b/include/crypto/engine.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_ENGINE_H
 #define _CRYPTO_ENGINE_H
 
+#include <crypto/api.h>
 #include <crypto/aead.h>
 #include <crypto/akcipher.h>
 #include <crypto/hash.h>
@@ -51,56 +52,103 @@ struct skcipher_engine_alg {
 	struct crypto_engine_op op;
 };
 
-int crypto_transfer_aead_request_to_engine(struct crypto_engine *engine,
-					   struct aead_request *req);
-int crypto_transfer_akcipher_request_to_engine(struct crypto_engine *engine,
-					       struct akcipher_request *req);
-int crypto_transfer_hash_request_to_engine(struct crypto_engine *engine,
-					       struct ahash_request *req);
-int crypto_transfer_kpp_request_to_engine(struct crypto_engine *engine,
-					  struct kpp_request *req);
-int crypto_transfer_skcipher_request_to_engine(struct crypto_engine *engine,
-					       struct skcipher_request *req);
-void crypto_finalize_aead_request(struct crypto_engine *engine,
-				  struct aead_request *req, int err);
-void crypto_finalize_akcipher_request(struct crypto_engine *engine,
-				      struct akcipher_request *req, int err);
-void crypto_finalize_hash_request(struct crypto_engine *engine,
-				  struct ahash_request *req, int err);
-void crypto_finalize_kpp_request(struct crypto_engine *engine,
-				 struct kpp_request *req, int err);
-void crypto_finalize_skcipher_request(struct crypto_engine *engine,
-				      struct skcipher_request *req, int err);
-int crypto_engine_start(struct crypto_engine *engine);
-int crypto_engine_stop(struct crypto_engine *engine);
-struct crypto_engine *crypto_engine_alloc_init(struct device *dev, bool rt);
-struct crypto_engine *crypto_engine_alloc_init_and_set(struct device *dev,
-						       bool retry_support,
-						       bool rt, int qlen);
-void crypto_engine_exit(struct crypto_engine *engine);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_aead_request_to_engine, int,
+	(struct crypto_engine *engine, struct aead_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_akcipher_request_to_engine, int,
+	(struct crypto_engine *engine, struct akcipher_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_hash_request_to_engine, int,
+	(struct crypto_engine *engine, struct ahash_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_kpp_request_to_engine, int,
+	(struct crypto_engine *engine, struct kpp_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_skcipher_request_to_engine, int,
+	(struct crypto_engine *engine, struct skcipher_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_aead_request, void,
+	(struct crypto_engine *engine, struct aead_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_akcipher_request, void,
+	(struct crypto_engine *engine, struct akcipher_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_hash_request, void,
+	(struct crypto_engine *engine, struct ahash_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_kpp_request, void,
+	(struct crypto_engine *engine, struct kpp_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_skcipher_request, void,
+	(struct crypto_engine *engine, struct skcipher_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_start, int,
+	(struct crypto_engine *engine),
+	(engine));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_stop, int,
+	(struct crypto_engine *engine),
+	(engine));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_alloc_init, struct crypto_engine *,
+	(struct device *dev, bool rt),
+	(dev, rt));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_alloc_init_and_set, struct crypto_engine *,
+	(struct device *dev, bool retry_support, bool rt, int qlen),
+	(dev, retry_support, rt, qlen));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_exit, void,
+	(struct crypto_engine *engine),
+	(engine));
 
-int crypto_engine_register_aead(struct aead_engine_alg *alg);
-void crypto_engine_unregister_aead(struct aead_engine_alg *alg);
-int crypto_engine_register_aeads(struct aead_engine_alg *algs, int count);
-void crypto_engine_unregister_aeads(struct aead_engine_alg *algs, int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_aead, int,
+	(struct aead_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_aead, void,
+	(struct aead_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_aeads, int,
+	(struct aead_engine_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_aeads, void,
+	(struct aead_engine_alg *algs, int count),
+	(algs, count));
 
-int crypto_engine_register_ahash(struct ahash_engine_alg *alg);
-void crypto_engine_unregister_ahash(struct ahash_engine_alg *alg);
-int crypto_engine_register_ahashes(struct ahash_engine_alg *algs, int count);
-void crypto_engine_unregister_ahashes(struct ahash_engine_alg *algs,
-				      int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_ahash, int,
+	(struct ahash_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_ahash, void,
+	(struct ahash_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_ahashes, int,
+	(struct ahash_engine_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_ahashes, void,
+	(struct ahash_engine_alg *algs, int count),
+	(algs, count));
 
-int crypto_engine_register_akcipher(struct akcipher_engine_alg *alg);
-void crypto_engine_unregister_akcipher(struct akcipher_engine_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_akcipher, int,
+	(struct akcipher_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_akcipher, void,
+	(struct akcipher_engine_alg *alg),
+	(alg));
 
-int crypto_engine_register_kpp(struct kpp_engine_alg *alg);
-void crypto_engine_unregister_kpp(struct kpp_engine_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_kpp, int,
+	(struct kpp_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_kpp, void,
+	(struct kpp_engine_alg *alg),
+	(alg));
 
-int crypto_engine_register_skcipher(struct skcipher_engine_alg *alg);
-void crypto_engine_unregister_skcipher(struct skcipher_engine_alg *alg);
-int crypto_engine_register_skciphers(struct skcipher_engine_alg *algs,
-				     int count);
-void crypto_engine_unregister_skciphers(struct skcipher_engine_alg *algs,
-					int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_skcipher, int,
+	(struct skcipher_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_skcipher, void,
+	(struct skcipher_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_skciphers, int,
+	(struct skcipher_engine_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_skciphers, void,
+	(struct skcipher_engine_alg *algs, int count),
+	(algs, count));
 
 #endif /* _CRYPTO_ENGINE_H */
-- 
2.47.3


