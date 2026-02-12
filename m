Return-Path: <linux-kbuild+bounces-11150-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO1QBpE/jWnR0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11150-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:48:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AAC12955A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ABCD308D6CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3101FC104;
	Thu, 12 Feb 2026 02:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="C8GbyTyy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813B126C03;
	Thu, 12 Feb 2026 02:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864526; cv=none; b=EG9LBFtkwdTv1LKxHTEZRPCQYDD6Qf0uNAT5eeEIxqwCondHowOwyF1jXEOPcMegT91cF/6SEm6Du8dMRJx72ILUM1llsuaD3pDSTg/fewNMCzXWCeJ/lfZBdnGQWVa31lujN97gPdgaXa6oFLF6XDGtpjKN2LBhnImtIYNi5W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864526; c=relaxed/simple;
	bh=g0vevdUHZXQhGoalrua9L2gVc/qyBCs4/yjNeKYzdD4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZhr+eYmC+KwFzm/T0pjoInlxfB0tsfLe0REKG0CrbNyIOPdV+lxnwhYw2Z4PHh2bGYyXa/EYyU0+U3B4p8KwBHkJRBhrUeZsaGNk7yyoBhyNdRJBSTTWltWT0xePp5SCkTALq39tWkrD1XkEu2D9vfosgIwYF3ZTsDKlqnHzLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=C8GbyTyy; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864524; x=1802400524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yPN6TPdqPA/BBwQ1ERs5ElzeYZLRJPCXrHu5ms9lmAM=;
  b=C8GbyTyyv7eSINyP208R1CDtpfg0itOMawRchsUQpVagR/9HR4+KiUei
   Ix0kRy3dHbkTngOgnp/bXeOLRtGPItzSNP8YocKYfEnwaxJSsL0wE8puj
   HP0uSYnV5hgW0R2hU6mGJhXSFD1xH3g5Q9tfhrrZ9yhw2ByTDHKwKLGwD
   g/LSL/xm6XYbZOhDgguZNoTP2e9O/4GVNdL9ZMDRjHnE/86I7Khl2RhPq
   6ocMrTjDYtQL5OFBFaje+g/IqbfvVsdtu9mF79/o1zkuzfauz74+RZwkY
   ggaKztYoKBZ+MALO2lXFP6n7pWSWRB7ovALvFTwWrnHtwuy4RNnybWmDD
   A==;
X-CSE-ConnectionGUID: qPF4ALsvTBq/nrPCn/W7Kg==
X-CSE-MsgGUID: bkxCMMczRkaFnakAqdDt9Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12454721"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:48:44 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:24655]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id febe341e-5d58-4dc8-9f58-1957ece0c4a8; Thu, 12 Feb 2026 02:48:44 +0000 (UTC)
X-Farcaster-Flow-ID: febe341e-5d58-4dc8-9f58-1957ece0c4a8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:44 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:43 +0000
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
Subject: [PATCH 005/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SKCIPHER2 crypto
Date: Thu, 12 Feb 2026 02:45:41 +0000
Message-ID: <20260212024725.11264-6-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D042UWB001.ant.amazon.com (10.13.139.160) To
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
	TAGGED_FROM(0.00)[bounces-11150-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70AAC12955A
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SKCIPHER2-related crypto to convert them into pluggable
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
 crypto/Makefile                    |  4 +-
 crypto/bpf_crypto_skcipher.c       |  4 +-
 crypto/fips140/fips140-api.c       | 47 +++++++++++++++
 include/crypto/internal/skcipher.h | 91 +++++++++++++++++++-----------
 include/crypto/skcipher.h          | 56 +++++++++++-------
 5 files changed, 145 insertions(+), 57 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index b05fdfacf170..546f80e014e1 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -21,9 +21,9 @@ crypto-objs-$(CONFIG_CRYPTO_GENIV) += geniv.o
 crypto_skcipher-y += lskcipher.o
 crypto_skcipher-y += skcipher.o
 
-obj-$(CONFIG_CRYPTO_SKCIPHER2) += crypto_skcipher.o
+crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += crypto_skcipher.o
 ifeq ($(CONFIG_BPF_SYSCALL),y)
-obj-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
+crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
 endif
 
 obj-$(CONFIG_CRYPTO_SEQIV) += seqiv.o
diff --git a/crypto/bpf_crypto_skcipher.c b/crypto/bpf_crypto_skcipher.c
index a88798d3e8c8..764bfc27e477 100644
--- a/crypto/bpf_crypto_skcipher.c
+++ b/crypto/bpf_crypto_skcipher.c
@@ -77,7 +77,7 @@ static void __exit bpf_crypto_skcipher_exit(void)
 	WARN_ON_ONCE(err);
 }
 
-module_init(bpf_crypto_skcipher_init);
-module_exit(bpf_crypto_skcipher_exit);
+crypto_module_init(bpf_crypto_skcipher_init);
+crypto_module_exit(bpf_crypto_skcipher_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Symmetric key cipher support for BPF");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 55129c62d813..e256b0f3e4a6 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -142,4 +142,51 @@ DEFINE_CRYPTO_API_STUB(aead_geniv_alloc);
 DEFINE_CRYPTO_API_STUB(aead_init_geniv);
 DEFINE_CRYPTO_API_STUB(aead_exit_geniv);
 
+#endif
+
+/*
+ * crypto/lskcipher.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SKCIPHER2)
+
+#include <crypto/skcipher.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alloc_lskcipher);
+DEFINE_CRYPTO_API_STUB(crypto_lskcipher_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_lskcipher_encrypt);
+DEFINE_CRYPTO_API_STUB(crypto_lskcipher_decrypt);
+
+#include <crypto/internal/skcipher.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_grab_lskcipher);
+DEFINE_CRYPTO_API_STUB(crypto_register_lskcipher);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_lskcipher);
+DEFINE_CRYPTO_API_STUB(crypto_register_lskciphers);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_lskciphers);
+DEFINE_CRYPTO_API_STUB(lskcipher_register_instance);
+DEFINE_CRYPTO_API_STUB(lskcipher_alloc_instance_simple);
+
+/*
+ * crypto/skcipher.c
+ */
+DEFINE_CRYPTO_API_STUB(crypto_alloc_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_sync_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_has_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_skcipher_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_skcipher_encrypt);
+DEFINE_CRYPTO_API_STUB(crypto_skcipher_decrypt);
+DEFINE_CRYPTO_API_STUB(crypto_skcipher_export);
+DEFINE_CRYPTO_API_STUB(crypto_skcipher_import);
+DEFINE_CRYPTO_API_STUB(crypto_grab_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_register_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_register_skciphers);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_skciphers);
+DEFINE_CRYPTO_API_STUB(skcipher_register_instance);
+DEFINE_CRYPTO_API_STUB(skcipher_walk_done);
+DEFINE_CRYPTO_API_STUB(skcipher_walk_virt);
+DEFINE_CRYPTO_API_STUB(skcipher_walk_aead_encrypt);
+DEFINE_CRYPTO_API_STUB(skcipher_walk_aead_decrypt);
+DEFINE_CRYPTO_API_STUB(skcipher_alloc_instance_simple);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/internal/skcipher.h b/include/crypto/internal/skcipher.h
index a965b6aabf61..b571c58269bc 100644
--- a/include/crypto/internal/skcipher.h
+++ b/include/crypto/internal/skcipher.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_INTERNAL_SKCIPHER_H
 #define _CRYPTO_INTERNAL_SKCIPHER_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <crypto/internal/cipher.h>
 #include <crypto/skcipher.h>
@@ -136,13 +137,13 @@ static inline void skcipher_request_complete(struct skcipher_request *req, int e
 	crypto_request_complete(&req->base, err);
 }
 
-int crypto_grab_skcipher(struct crypto_skcipher_spawn *spawn,
-			 struct crypto_instance *inst,
-			 const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_grab_skcipher, int,
+	(struct crypto_skcipher_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask),
+	(spawn, inst, name, type, mask));
 
-int crypto_grab_lskcipher(struct crypto_lskcipher_spawn *spawn,
-			  struct crypto_instance *inst,
-			  const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_grab_lskcipher, int,
+	(struct crypto_lskcipher_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask),
+	(spawn, inst, name, type, mask));
 
 static inline void crypto_drop_skcipher(struct crypto_skcipher_spawn *spawn)
 {
@@ -197,30 +198,50 @@ static inline void crypto_skcipher_set_reqsize_dma(
 	skcipher->reqsize = reqsize;
 }
 
-int crypto_register_skcipher(struct skcipher_alg *alg);
-void crypto_unregister_skcipher(struct skcipher_alg *alg);
-int crypto_register_skciphers(struct skcipher_alg *algs, int count);
-void crypto_unregister_skciphers(struct skcipher_alg *algs, int count);
-int skcipher_register_instance(struct crypto_template *tmpl,
-			       struct skcipher_instance *inst);
-
-int crypto_register_lskcipher(struct lskcipher_alg *alg);
-void crypto_unregister_lskcipher(struct lskcipher_alg *alg);
-int crypto_register_lskciphers(struct lskcipher_alg *algs, int count);
-void crypto_unregister_lskciphers(struct lskcipher_alg *algs, int count);
-int lskcipher_register_instance(struct crypto_template *tmpl,
-				struct lskcipher_instance *inst);
-
-int skcipher_walk_done(struct skcipher_walk *walk, int res);
-int skcipher_walk_virt(struct skcipher_walk *__restrict walk,
-		       struct skcipher_request *__restrict req,
-		       bool atomic);
-int skcipher_walk_aead_encrypt(struct skcipher_walk *__restrict walk,
-			       struct aead_request *__restrict req,
-			       bool atomic);
-int skcipher_walk_aead_decrypt(struct skcipher_walk *__restrict walk,
-			       struct aead_request *__restrict req,
-			       bool atomic);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_register_skcipher, int,
+	(struct skcipher_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_unregister_skcipher, void,
+	(struct skcipher_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_register_skciphers, int,
+	(struct skcipher_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_unregister_skciphers, void,
+	(struct skcipher_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, skcipher_register_instance, int,
+	(struct crypto_template *tmpl, struct skcipher_instance *inst),
+	(tmpl, inst));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_register_lskcipher, int,
+	(struct lskcipher_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_unregister_lskcipher, void,
+	(struct lskcipher_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_register_lskciphers, int,
+	(struct lskcipher_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_unregister_lskciphers, void,
+	(struct lskcipher_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, lskcipher_register_instance, int,
+	(struct crypto_template *tmpl, struct lskcipher_instance *inst),
+	(tmpl, inst));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, skcipher_walk_done, int,
+	(struct skcipher_walk *walk, int res),
+	(walk, res));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, skcipher_walk_virt, int,
+	(struct skcipher_walk *__restrict walk, struct skcipher_request *__restrict req, bool atomic),
+	(walk, req, atomic));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, skcipher_walk_aead_encrypt, int,
+	(struct skcipher_walk *__restrict walk, struct aead_request *__restrict req, bool atomic),
+	(walk, req, atomic));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, skcipher_walk_aead_decrypt, int,
+	(struct skcipher_walk *__restrict walk, struct aead_request *__restrict req, bool atomic),
+	(walk, req, atomic));
 
 static inline void skcipher_walk_abort(struct skcipher_walk *walk)
 {
@@ -281,8 +302,9 @@ skcipher_cipher_simple(struct crypto_skcipher *tfm)
 	return ctx->cipher;
 }
 
-struct skcipher_instance *skcipher_alloc_instance_simple(
-	struct crypto_template *tmpl, struct rtattr **tb);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, skcipher_alloc_instance_simple, struct skcipher_instance *,
+	(struct crypto_template *tmpl, struct rtattr **tb),
+	(tmpl, tb));
 
 static inline struct crypto_alg *skcipher_ialg_simple(
 	struct skcipher_instance *inst)
@@ -300,8 +322,9 @@ static inline struct crypto_lskcipher *lskcipher_cipher_simple(
 	return *ctx;
 }
 
-struct lskcipher_instance *lskcipher_alloc_instance_simple(
-	struct crypto_template *tmpl, struct rtattr **tb);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, lskcipher_alloc_instance_simple, struct lskcipher_instance *,
+	(struct crypto_template *tmpl, struct rtattr **tb),
+	(tmpl, tb));
 
 static inline struct lskcipher_alg *lskcipher_ialg_simple(
 	struct lskcipher_instance *inst)
diff --git a/include/crypto/skcipher.h b/include/crypto/skcipher.h
index 9e5853464345..39282b83a280 100644
--- a/include/crypto/skcipher.h
+++ b/include/crypto/skcipher.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_SKCIPHER_H
 #define _CRYPTO_SKCIPHER_H
 
+#include <crypto/api.h>
 #include <linux/atomic.h>
 #include <linux/container_of.h>
 #include <linux/crypto.h>
@@ -276,11 +277,13 @@ static inline struct crypto_skcipher *__crypto_skcipher_cast(
  * Return: allocated cipher handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_skcipher *crypto_alloc_skcipher(const char *alg_name,
-					      u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_alloc_skcipher, struct crypto_skcipher *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
-struct crypto_sync_skcipher *crypto_alloc_sync_skcipher(const char *alg_name,
-					      u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_alloc_sync_skcipher, struct crypto_sync_skcipher *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
 
 /**
@@ -297,8 +300,9 @@ struct crypto_sync_skcipher *crypto_alloc_sync_skcipher(const char *alg_name,
  * Return: allocated cipher handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_lskcipher *crypto_alloc_lskcipher(const char *alg_name,
-						u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_alloc_lskcipher, struct crypto_lskcipher *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_skcipher_tfm(
 	struct crypto_skcipher *tfm)
@@ -355,7 +359,9 @@ static inline void crypto_free_lskcipher(struct crypto_lskcipher *tfm)
  * Return: true when the skcipher is known to the kernel crypto API; false
  *	   otherwise
  */
-int crypto_has_skcipher(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_has_skcipher, int,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
 static inline const char *crypto_skcipher_driver_name(
 	struct crypto_skcipher *tfm)
@@ -611,8 +617,9 @@ static inline void crypto_lskcipher_clear_flags(struct crypto_lskcipher *tfm,
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_skcipher_setkey(struct crypto_skcipher *tfm,
-			   const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_skcipher_setkey, int,
+	(struct crypto_skcipher *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
 
 static inline int crypto_sync_skcipher_setkey(struct crypto_sync_skcipher *tfm,
 					 const u8 *key, unsigned int keylen)
@@ -636,8 +643,9 @@ static inline int crypto_sync_skcipher_setkey(struct crypto_sync_skcipher *tfm,
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_lskcipher_setkey(struct crypto_lskcipher *tfm,
-			    const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_lskcipher_setkey, int,
+	(struct crypto_lskcipher *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
 
 static inline unsigned int crypto_skcipher_min_keysize(
 	struct crypto_skcipher *tfm)
@@ -697,7 +705,9 @@ static inline struct crypto_sync_skcipher *crypto_sync_skcipher_reqtfm(
  *
  * Return: 0 if the cipher operation was successful; < 0 if an error occurred
  */
-int crypto_skcipher_encrypt(struct skcipher_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_skcipher_encrypt, int,
+	(struct skcipher_request *req),
+	(req));
 
 /**
  * crypto_skcipher_decrypt() - decrypt ciphertext
@@ -710,7 +720,9 @@ int crypto_skcipher_encrypt(struct skcipher_request *req);
  *
  * Return: 0 if the cipher operation was successful; < 0 if an error occurred
  */
-int crypto_skcipher_decrypt(struct skcipher_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_skcipher_decrypt, int,
+	(struct skcipher_request *req),
+	(req));
 
 /**
  * crypto_skcipher_export() - export partial state
@@ -728,7 +740,9 @@ int crypto_skcipher_decrypt(struct skcipher_request *req);
  *
  * Return: 0 if the cipher operation was successful; < 0 if an error occurred
  */
-int crypto_skcipher_export(struct skcipher_request *req, void *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_skcipher_export, int,
+	(struct skcipher_request *req, void *out),
+	(req, out));
 
 /**
  * crypto_skcipher_import() - import partial state
@@ -743,7 +757,9 @@ int crypto_skcipher_export(struct skcipher_request *req, void *out);
  *
  * Return: 0 if the cipher operation was successful; < 0 if an error occurred
  */
-int crypto_skcipher_import(struct skcipher_request *req, const void *in);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_skcipher_import, int,
+	(struct skcipher_request *req, const void *in),
+	(req, in));
 
 /**
  * crypto_lskcipher_encrypt() - encrypt plaintext
@@ -761,8 +777,9 @@ int crypto_skcipher_import(struct skcipher_request *req, const void *in);
  *	   then this many bytes have been left unprocessed;
  *	   < 0 if an error occurred
  */
-int crypto_lskcipher_encrypt(struct crypto_lskcipher *tfm, const u8 *src,
-			     u8 *dst, unsigned len, u8 *siv);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_lskcipher_encrypt, int,
+	(struct crypto_lskcipher *tfm, const u8 *src, u8 *dst, unsigned len, u8 *siv),
+	(tfm, src, dst, len, siv));
 
 /**
  * crypto_lskcipher_decrypt() - decrypt ciphertext
@@ -781,8 +798,9 @@ int crypto_lskcipher_encrypt(struct crypto_lskcipher *tfm, const u8 *src,
  *	   then this many bytes have been left unprocessed;
  *	   < 0 if an error occurred
  */
-int crypto_lskcipher_decrypt(struct crypto_lskcipher *tfm, const u8 *src,
-			     u8 *dst, unsigned len, u8 *siv);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SKCIPHER2, crypto_lskcipher_decrypt, int,
+	(struct crypto_lskcipher *tfm, const u8 *src, u8 *dst, unsigned len, u8 *siv),
+	(tfm, src, dst, len, siv));
 
 /**
  * DOC: Symmetric Key Cipher Request Handle
-- 
2.47.3


