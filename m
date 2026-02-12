Return-Path: <linux-kbuild+bounces-11146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMAyCVU/jWnR0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11146-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:47:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C4129507
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EFC793016B08
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A4F126C03;
	Thu, 12 Feb 2026 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="PjFKelM0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0815E8460;
	Thu, 12 Feb 2026 02:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864464; cv=none; b=rWKQx1QHSwDaDp8aiZD7IVAXr7OhZxEr0U7HaZfYwgi/0h4tfROTUFpdq7fY3po9XVmeQPxJFcm8YZzm3ivFNjtooIAus7S9HSbEXkYYetCMIy3ahFn1Nl5t1jVcm/OLWF4dAE03eA2CUWm2gTBBHioo8XI/gEBJ36CsNC9EFbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864464; c=relaxed/simple;
	bh=31Tp1MGMAcjbvqY8F5iK+pX6ziKmd2am/hChxQqdMw8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwNdHZ9HyVdYcCjYNbm/LhTPXMcfgQ5Gv6TMTAqrc6Pm9YQ+Ef8rxLVe1SGftemQI74SSi4tYFozP7ulcHVFZya1lU6yg4tEhMhCOYPjDfU/8ckqm1JvumQdWqyHfMSdyC5xzBm4tGZcje3+awqxpNjBc/8VCr1lq5kUDb2vdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=PjFKelM0; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864463; x=1802400463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mfi4Qdp2YIpqa923yKfcT4SKQ3K2nBlt2dvjt3jEtlA=;
  b=PjFKelM0mkjFiLUZwRq6X/Ac4SzX5NhDMjWxARdfnTbi5MIXKNmR7B9M
   CQpC/M1W2OmEZ6w8RTkYTRb7lMLYxN093UGH2A1tkLXNAEBesnzKS2n8l
   P5IMbSbmOwYSESIH4drR9zYJnywW3pWizfD+UXQnmXsIXwI5sg1gh3JxO
   yC8pySjWD2nZ1ODf9fnSqRWHPagBreWJCYmUBhqf0y3bdzL7lkPBBEgzL
   NQNwMNVb4pW2h9dr0IY+fJMqIEwScF30iqCUyNbbog4rdSZaJohW0r5X/
   wT0JPKNm6lNcC+sV7PFwPfYCLk62K6p5856Phi1/LAISC4GJLqFFFSOJo
   g==;
X-CSE-ConnectionGUID: fMAmNWvqQpaPtEAXASEcpQ==
X-CSE-MsgGUID: HsL+kFNrSrWUfgx1uOXbNQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12454695"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:47:42 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:29822]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id e3744762-fd73-4ebc-a5cf-6074ebafeb89; Thu, 12 Feb 2026 02:47:42 +0000 (UTC)
X-Farcaster-Flow-ID: e3744762-fd73-4ebc-a5cf-6074ebafeb89
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:47:42 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:47:41 +0000
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
Subject: [PATCH 001/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO and CONFIG_CRYPTO_ALGAPI2 crypto
Date: Thu, 12 Feb 2026 02:45:37 +0000
Message-ID: <20260212024725.11264-2-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D043UWA002.ant.amazon.com (10.13.139.53) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11146-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 492C4129507
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO- and CONFIG_CRYPTO_ALGAPI2-related crypto to convert them
into pluggable interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile                  |   4 +-
 crypto/algapi.c                  |   4 +-
 crypto/fips140/fips140-api.c     | 109 +++++++++++++++++++++++++--
 crypto/internal.h                |  86 +++++++++++++--------
 include/crypto/algapi.h          | 125 +++++++++++++++++++++----------
 include/crypto/internal/cipher.h |  20 +++--
 include/crypto/scatterwalk.h     |  36 +++++----
 include/linux/crypto.h           |  22 ++++--
 8 files changed, 302 insertions(+), 104 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 5129be5e7208..88de6dcbd7c4 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -5,7 +5,7 @@
 
 CONTEXT_ANALYSIS := y
 
-obj-$(CONFIG_CRYPTO) += crypto.o
+crypto-objs-$(CONFIG_CRYPTO) += crypto.o
 crypto-y := api.o cipher.o
 
 obj-$(CONFIG_CRYPTO_ENGINE) += crypto_engine.o
@@ -13,7 +13,7 @@ obj-$(CONFIG_CRYPTO_FIPS) += fips.o
 
 crypto_algapi-$(CONFIG_PROC_FS) += proc.o
 crypto_algapi-y := algapi.o scatterwalk.o $(crypto_algapi-y)
-obj-$(CONFIG_CRYPTO_ALGAPI2) += crypto_algapi.o
+crypto-objs-$(CONFIG_CRYPTO_ALGAPI2) += crypto_algapi.o
 
 obj-$(CONFIG_CRYPTO_AEAD2) += aead.o
 obj-$(CONFIG_CRYPTO_GENIV) += geniv.o
diff --git a/crypto/algapi.c b/crypto/algapi.c
index 663698e0cd65..0a041a6f6668 100644
--- a/crypto/algapi.c
+++ b/crypto/algapi.c
@@ -1123,8 +1123,8 @@ static void __exit crypto_algapi_exit(void)
  * We run this at late_initcall so that all the built-in algorithms
  * have had a chance to register themselves first.
  */
-late_initcall(crypto_algapi_init);
-module_exit(crypto_algapi_exit);
+crypto_late_initcall(crypto_algapi_init);
+crypto_module_exit(crypto_algapi_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Cryptographic algorithms API");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index a11e898ff4bc..8a0e1d28615c 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -1,7 +1,106 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * crypto/api.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO)
+
+#include <linux/crypto.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_req_done);
+DEFINE_CRYPTO_API_STUB(crypto_has_alg);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_base);
+DEFINE_CRYPTO_API_STUB(crypto_destroy_tfm);
+DEFINE_CRYPTO_API_STUB(crypto_request_clone);
+
+#include <crypto/algapi.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_mod_put);
+
+#include <crypto/internal.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_mod_get);
+DEFINE_CRYPTO_API_STUB(crypto_alg_mod_lookup);
+DEFINE_CRYPTO_API_STUB(crypto_larval_alloc);
+DEFINE_CRYPTO_API_STUB(crypto_schedule_test);
+DEFINE_CRYPTO_API_STUB(crypto_shoot_alg);
+DEFINE_CRYPTO_API_STUB(__crypto_alloc_tfmgfp);
+DEFINE_CRYPTO_API_STUB(__crypto_alloc_tfm);
+DEFINE_CRYPTO_API_STUB(crypto_create_tfm_node);
+DEFINE_CRYPTO_API_STUB(crypto_clone_tfm);
+DEFINE_CRYPTO_API_STUB(crypto_find_alg);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_tfm_node);
+DEFINE_CRYPTO_API_STUB(crypto_probing_notify);
+DEFINE_CRYPTO_API_STUB(crypto_destroy_alg);
+
+#endif
+/*
+ * crypto/cipher.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO)
+
+#include <crypto/internal/cipher.h>
 
+DEFINE_CRYPTO_API_STUB(crypto_cipher_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_cipher_encrypt_one);
+DEFINE_CRYPTO_API_STUB(crypto_cipher_decrypt_one);
+DEFINE_CRYPTO_API_STUB(crypto_clone_cipher);
+
+#endif
+/*
+ * crypto/scatterwalk.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ALGAPI2)
+
+#include <crypto/scatterwalk.h>
+
+DEFINE_CRYPTO_API_STUB(scatterwalk_skip);
+DEFINE_CRYPTO_API_STUB(memcpy_from_scatterwalk);
+DEFINE_CRYPTO_API_STUB(memcpy_to_scatterwalk);
+DEFINE_CRYPTO_API_STUB(memcpy_from_sglist);
+DEFINE_CRYPTO_API_STUB(memcpy_to_sglist);
+DEFINE_CRYPTO_API_STUB(memcpy_sglist);
+DEFINE_CRYPTO_API_STUB(scatterwalk_ffwd);
+
+#endif
 /*
- * Define static call keys for any functions which are part of the crypto
- * API and used by the standalone FIPS module but which are not built into
- * vmlinux.
- */
\ No newline at end of file
+ * crypto/algapi.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ALGAPI2)
+
+#include <crypto/algapi.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_register_alg);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_alg);
+DEFINE_CRYPTO_API_STUB(crypto_register_algs);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_algs);
+DEFINE_CRYPTO_API_STUB(crypto_register_template);
+DEFINE_CRYPTO_API_STUB(crypto_register_templates);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_template);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_templates);
+DEFINE_CRYPTO_API_STUB(crypto_lookup_template);
+DEFINE_CRYPTO_API_STUB(crypto_register_instance);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_instance);
+DEFINE_CRYPTO_API_STUB(crypto_grab_spawn);
+DEFINE_CRYPTO_API_STUB(crypto_drop_spawn);
+DEFINE_CRYPTO_API_STUB(crypto_spawn_tfm);
+DEFINE_CRYPTO_API_STUB(crypto_spawn_tfm2);
+DEFINE_CRYPTO_API_STUB(crypto_get_attr_type);
+DEFINE_CRYPTO_API_STUB(crypto_check_attr_type);
+DEFINE_CRYPTO_API_STUB(crypto_attr_alg_name);
+DEFINE_CRYPTO_API_STUB(__crypto_inst_setname);
+DEFINE_CRYPTO_API_STUB(crypto_init_queue);
+DEFINE_CRYPTO_API_STUB(crypto_enqueue_request);
+DEFINE_CRYPTO_API_STUB(crypto_enqueue_request_head);
+DEFINE_CRYPTO_API_STUB(crypto_dequeue_request);
+DEFINE_CRYPTO_API_STUB(crypto_inc);
+DEFINE_CRYPTO_API_STUB(crypto_register_notifier);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_notifier);
+
+#include <crypto/internal.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alg_tested);
+DEFINE_CRYPTO_API_STUB(crypto_remove_spawns);
+DEFINE_CRYPTO_API_STUB(crypto_remove_final);
+DEFINE_CRYPTO_API_STUB(crypto_alg_extsize);
+DEFINE_CRYPTO_API_STUB(crypto_type_has_alg);
+
+#endif
\ No newline at end of file
diff --git a/crypto/internal.h b/crypto/internal.h
index 8fbe0226d48e..8ebe4dc336bc 100644
--- a/crypto/internal.h
+++ b/crypto/internal.h
@@ -109,25 +109,44 @@ static inline unsigned int crypto_compress_ctxsize(struct crypto_alg *alg)
 	return alg->cra_ctxsize;
 }
 
-struct crypto_alg *crypto_mod_get(struct crypto_alg *alg);
-struct crypto_alg *crypto_alg_mod_lookup(const char *name, u32 type, u32 mask);
-
-struct crypto_larval *crypto_larval_alloc(const char *name, u32 type, u32 mask);
-void crypto_schedule_test(struct crypto_larval *larval);
-void crypto_alg_tested(const char *name, int err);
-
-void crypto_remove_spawns(struct crypto_alg *alg, struct list_head *list,
-			  struct crypto_alg *nalg);
-void crypto_remove_final(struct list_head *list);
-void crypto_shoot_alg(struct crypto_alg *alg);
-struct crypto_tfm *__crypto_alloc_tfmgfp(struct crypto_alg *alg, u32 type,
-					 u32 mask, gfp_t gfp);
-struct crypto_tfm *__crypto_alloc_tfm(struct crypto_alg *alg, u32 type,
-				      u32 mask);
-void *crypto_create_tfm_node(struct crypto_alg *alg,
-			const struct crypto_type *frontend, int node);
-void *crypto_clone_tfm(const struct crypto_type *frontend,
-		       struct crypto_tfm *otfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_mod_get, struct crypto_alg *,
+	(struct crypto_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_alg_mod_lookup, struct crypto_alg *,
+	(const char *name, u32 type, u32 mask),
+	(name, type, mask));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_larval_alloc, struct crypto_larval *,
+	(const char *name, u32 type, u32 mask),
+	(name, type, mask));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_schedule_test, void,
+	(struct crypto_larval *larval),
+	(larval));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_alg_tested, void,
+	(const char *name, int err),
+	(name, err));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_remove_spawns, void,
+	(struct crypto_alg *alg, struct list_head *list, struct crypto_alg *nalg),
+	(alg, list, nalg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_remove_final, void,
+	(struct list_head *list),
+	(list));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_shoot_alg, void,
+	(struct crypto_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, __crypto_alloc_tfmgfp, struct crypto_tfm *,
+	(struct crypto_alg *alg, u32 type, u32 mask, gfp_t gfp),
+	(alg, type, mask, gfp));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, __crypto_alloc_tfm, struct crypto_tfm *,
+	(struct crypto_alg *alg, u32 type, u32 mask),
+	(alg, type, mask));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_create_tfm_node, void *,
+	(struct crypto_alg *alg, const struct crypto_type *frontend, int node),
+	(alg, frontend, node));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_clone_tfm, void *,
+	(const struct crypto_type *frontend, struct crypto_tfm *otfm),
+	(frontend, otfm));
 
 static inline void *crypto_create_tfm(struct crypto_alg *alg,
 			const struct crypto_type *frontend)
@@ -135,13 +154,13 @@ static inline void *crypto_create_tfm(struct crypto_alg *alg,
 	return crypto_create_tfm_node(alg, frontend, NUMA_NO_NODE);
 }
 
-struct crypto_alg *crypto_find_alg(const char *alg_name,
-				   const struct crypto_type *frontend,
-				   u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_find_alg, struct crypto_alg *,
+	(const char *alg_name, const struct crypto_type *frontend, u32 type, u32 mask),
+	(alg_name, frontend, type, mask));
 
-void *crypto_alloc_tfm_node(const char *alg_name,
-		       const struct crypto_type *frontend, u32 type, u32 mask,
-		       int node);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_alloc_tfm_node, void *,
+	(const char *alg_name, const struct crypto_type *frontend, u32 type, u32 mask, int node),
+	(alg_name, frontend, type, mask, node));
 
 static inline void *crypto_alloc_tfm(const char *alg_name,
 		       const struct crypto_type *frontend, u32 type, u32 mask)
@@ -149,12 +168,17 @@ static inline void *crypto_alloc_tfm(const char *alg_name,
 	return crypto_alloc_tfm_node(alg_name, frontend, type, mask, NUMA_NO_NODE);
 }
 
-int crypto_probing_notify(unsigned long val, void *v);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_probing_notify, int,
+	(unsigned long val, void *v),
+	(val, v));
 
-unsigned int crypto_alg_extsize(struct crypto_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_alg_extsize, unsigned int,
+	(struct crypto_alg *alg),
+	(alg));
 
-int crypto_type_has_alg(const char *name, const struct crypto_type *frontend,
-			u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_type_has_alg, int,
+	(const char *name, const struct crypto_type *frontend, u32 type, u32 mask),
+	(name, frontend, type, mask));
 
 static inline struct crypto_alg *crypto_alg_get(struct crypto_alg *alg)
 {
@@ -162,7 +186,9 @@ static inline struct crypto_alg *crypto_alg_get(struct crypto_alg *alg)
 	return alg;
 }
 
-void crypto_destroy_alg(struct crypto_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_destroy_alg, void,
+	(struct crypto_alg *alg),
+	(alg));
 
 static inline void crypto_alg_put(struct crypto_alg *alg)
 {
diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index 05deea9dac5e..455b7c190936 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_ALGAPI_H
 #define _CRYPTO_ALGAPI_H
 
+#include <crypto/api.h>
 #include <crypto/utils.h>
 #include <linux/align.h>
 #include <linux/cache.h>
@@ -131,35 +132,71 @@ struct crypto_attr_type {
 /*
  * Algorithm registration interface.
  */
-int crypto_register_alg(struct crypto_alg *alg);
-void crypto_unregister_alg(struct crypto_alg *alg);
-int crypto_register_algs(struct crypto_alg *algs, int count);
-void crypto_unregister_algs(struct crypto_alg *algs, int count);
-
-void crypto_mod_put(struct crypto_alg *alg);
-
-int crypto_register_template(struct crypto_template *tmpl);
-int crypto_register_templates(struct crypto_template *tmpls, int count);
-void crypto_unregister_template(struct crypto_template *tmpl);
-void crypto_unregister_templates(struct crypto_template *tmpls, int count);
-struct crypto_template *crypto_lookup_template(const char *name);
-
-int crypto_register_instance(struct crypto_template *tmpl,
-			     struct crypto_instance *inst);
-void crypto_unregister_instance(struct crypto_instance *inst);
-
-int crypto_grab_spawn(struct crypto_spawn *spawn, struct crypto_instance *inst,
-		      const char *name, u32 type, u32 mask);
-void crypto_drop_spawn(struct crypto_spawn *spawn);
-struct crypto_tfm *crypto_spawn_tfm(struct crypto_spawn *spawn, u32 type,
-				    u32 mask);
-void *crypto_spawn_tfm2(struct crypto_spawn *spawn);
-
-struct crypto_attr_type *crypto_get_attr_type(struct rtattr **tb);
-int crypto_check_attr_type(struct rtattr **tb, u32 type, u32 *mask_ret);
-const char *crypto_attr_alg_name(struct rtattr *rta);
-int __crypto_inst_setname(struct crypto_instance *inst, const char *name,
-			  const char *driver, struct crypto_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_register_alg, int,
+	(struct crypto_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_unregister_alg, void,
+	(struct crypto_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_register_algs, int,
+	(struct crypto_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_unregister_algs, void,
+	(struct crypto_alg *algs, int count),
+	(algs, count));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_mod_put, void,
+	(struct crypto_alg *alg),
+	(alg));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_register_template, int,
+	(struct crypto_template *tmpl),
+	(tmpl));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_register_templates, int,
+	(struct crypto_template *tmpls, int count),
+	(tmpls, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_unregister_template, void,
+	(struct crypto_template *tmpl),
+	(tmpl));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_unregister_templates, void,
+	(struct crypto_template *tmpls, int count),
+	(tmpls, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_lookup_template, struct crypto_template *,
+	(const char *name),
+	(name));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_register_instance, int,
+	(struct crypto_template *tmpl, struct crypto_instance *inst),
+	(tmpl, inst));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_unregister_instance, void,
+	(struct crypto_instance *inst),
+	(inst));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_grab_spawn, int,
+	(struct crypto_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask),
+	(spawn, inst, name, type, mask));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_drop_spawn, void,
+	(struct crypto_spawn *spawn),
+	(spawn));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_spawn_tfm, struct crypto_tfm *,
+	(struct crypto_spawn *spawn, u32 type, u32 mask),
+	(spawn, type, mask));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_spawn_tfm2, void *,
+	(struct crypto_spawn *spawn),
+	(spawn));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_get_attr_type, struct crypto_attr_type *,
+	(struct rtattr **tb),
+	(tb));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_check_attr_type, int,
+	(struct rtattr **tb, u32 type, u32 *mask_ret),
+	(tb, type, mask_ret));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_attr_alg_name, const char *,
+	(struct rtattr *rta),
+	(rta));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, __crypto_inst_setname, int,
+	(struct crypto_instance *inst, const char *name, const char *driver, struct crypto_alg *alg),
+	(inst, name, driver, alg));
 
 #define crypto_inst_setname(inst, name, ...) \
 	CONCATENATE(crypto_inst_setname_, COUNT_ARGS(__VA_ARGS__))( \
@@ -169,18 +206,26 @@ int __crypto_inst_setname(struct crypto_instance *inst, const char *name,
 #define crypto_inst_setname_2(inst, name, driver, alg) \
 	__crypto_inst_setname(inst, name, driver, alg)
 
-void crypto_init_queue(struct crypto_queue *queue, unsigned int max_qlen);
-int crypto_enqueue_request(struct crypto_queue *queue,
-			   struct crypto_async_request *request);
-void crypto_enqueue_request_head(struct crypto_queue *queue,
-				 struct crypto_async_request *request);
-struct crypto_async_request *crypto_dequeue_request(struct crypto_queue *queue);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_init_queue, void,
+	(struct crypto_queue *queue, unsigned int max_qlen),
+	(queue, max_qlen));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_enqueue_request, int,
+	(struct crypto_queue *queue, struct crypto_async_request *request),
+	(queue, request));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_enqueue_request_head, void,
+	(struct crypto_queue *queue, struct crypto_async_request *request),
+	(queue, request));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_dequeue_request, struct crypto_async_request *,
+	(struct crypto_queue *queue),
+	(queue));
 static inline unsigned int crypto_queue_len(struct crypto_queue *queue)
 {
 	return queue->qlen;
 }
 
-void crypto_inc(u8 *a, unsigned int size);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_inc, void,
+	(u8 *a, unsigned int size),
+	(a, size));
 
 static inline void *crypto_tfm_ctx(struct crypto_tfm *tfm)
 {
@@ -254,8 +299,12 @@ static inline u32 crypto_algt_inherited_mask(struct crypto_attr_type *algt)
 	return crypto_requires_off(algt, CRYPTO_ALG_INHERITED_FLAGS);
 }
 
-int crypto_register_notifier(struct notifier_block *nb);
-int crypto_unregister_notifier(struct notifier_block *nb);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_register_notifier, int,
+	(struct notifier_block *nb),
+	(nb));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, crypto_unregister_notifier, int,
+	(struct notifier_block *nb),
+	(nb));
 
 /* Crypto notification events. */
 enum {
diff --git a/include/crypto/internal/cipher.h b/include/crypto/internal/cipher.h
index 5030f6d2df31..62d18c0f5c11 100644
--- a/include/crypto/internal/cipher.h
+++ b/include/crypto/internal/cipher.h
@@ -11,6 +11,7 @@
 #ifndef _CRYPTO_INTERNAL_CIPHER_H
 #define _CRYPTO_INTERNAL_CIPHER_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 
 struct crypto_cipher {
@@ -149,8 +150,9 @@ static inline void crypto_cipher_clear_flags(struct crypto_cipher *tfm,
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_cipher_setkey(struct crypto_cipher *tfm,
-			 const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_cipher_setkey, int,
+	(struct crypto_cipher *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
 
 /**
  * crypto_cipher_encrypt_one() - encrypt one block of plaintext
@@ -161,8 +163,9 @@ int crypto_cipher_setkey(struct crypto_cipher *tfm,
  * Invoke the encryption operation of one block. The caller must ensure that
  * the plaintext and ciphertext buffers are at least one block in size.
  */
-void crypto_cipher_encrypt_one(struct crypto_cipher *tfm,
-			       u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_cipher_encrypt_one, void,
+	(struct crypto_cipher *tfm, u8 *dst, const u8 *src),
+	(tfm, dst, src));
 
 /**
  * crypto_cipher_decrypt_one() - decrypt one block of ciphertext
@@ -173,10 +176,13 @@ void crypto_cipher_encrypt_one(struct crypto_cipher *tfm,
  * Invoke the decryption operation of one block. The caller must ensure that
  * the plaintext and ciphertext buffers are at least one block in size.
  */
-void crypto_cipher_decrypt_one(struct crypto_cipher *tfm,
-			       u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_cipher_decrypt_one, void,
+	(struct crypto_cipher *tfm, u8 *dst, const u8 *src),
+	(tfm, dst, src));
 
-struct crypto_cipher *crypto_clone_cipher(struct crypto_cipher *cipher);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_clone_cipher, struct crypto_cipher *,
+	(struct crypto_cipher *cipher),
+	(cipher));
 
 struct crypto_cipher_spawn {
 	struct crypto_spawn base;
diff --git a/include/crypto/scatterwalk.h b/include/crypto/scatterwalk.h
index 624fab589c2c..4b7daf05719c 100644
--- a/include/crypto/scatterwalk.h
+++ b/include/crypto/scatterwalk.h
@@ -11,6 +11,7 @@
 #ifndef _CRYPTO_SCATTERWALK_H
 #define _CRYPTO_SCATTERWALK_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 
 #include <linux/highmem.h>
@@ -221,22 +222,29 @@ static inline void scatterwalk_done_dst(struct scatter_walk *walk,
 	scatterwalk_advance(walk, nbytes);
 }
 
-void scatterwalk_skip(struct scatter_walk *walk, unsigned int nbytes);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, scatterwalk_skip, void,
+	(struct scatter_walk *walk, unsigned int nbytes),
+	(walk, nbytes));
 
-void memcpy_from_scatterwalk(void *buf, struct scatter_walk *walk,
-			     unsigned int nbytes);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, memcpy_from_scatterwalk, void,
+	(void *buf, struct scatter_walk *walk, unsigned int nbytes),
+	(buf, walk, nbytes));
 
-void memcpy_to_scatterwalk(struct scatter_walk *walk, const void *buf,
-			   unsigned int nbytes);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, memcpy_to_scatterwalk, void,
+	(struct scatter_walk *walk, const void *buf, unsigned int nbytes),
+	(walk, buf, nbytes));
 
-void memcpy_from_sglist(void *buf, struct scatterlist *sg,
-			unsigned int start, unsigned int nbytes);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, memcpy_from_sglist, void,
+	(void *buf, struct scatterlist *sg, unsigned int start, unsigned int nbytes),
+	(buf, sg, start, nbytes));
 
-void memcpy_to_sglist(struct scatterlist *sg, unsigned int start,
-		      const void *buf, unsigned int nbytes);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, memcpy_to_sglist, void,
+	(struct scatterlist *sg, unsigned int start, const void *buf, unsigned int nbytes),
+	(sg, start, buf, nbytes));
 
-void memcpy_sglist(struct scatterlist *dst, struct scatterlist *src,
-		   unsigned int nbytes);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, memcpy_sglist, void,
+	(struct scatterlist *dst, struct scatterlist *src, unsigned int nbytes),
+	(dst, src, nbytes));
 
 /* In new code, please use memcpy_{from,to}_sglist() directly instead. */
 static inline void scatterwalk_map_and_copy(void *buf, struct scatterlist *sg,
@@ -249,8 +257,8 @@ static inline void scatterwalk_map_and_copy(void *buf, struct scatterlist *sg,
 		memcpy_from_sglist(buf, sg, start, nbytes);
 }
 
-struct scatterlist *scatterwalk_ffwd(struct scatterlist dst[2],
-				     struct scatterlist *src,
-				     unsigned int len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ALGAPI2, scatterwalk_ffwd, struct scatterlist *,
+	(struct scatterlist dst[2], struct scatterlist *src, unsigned int len),
+	(dst, src, len));
 
 #endif  /* _CRYPTO_SCATTERWALK_H */
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index a2137e19be7d..20eecf13d0e5 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -12,6 +12,7 @@
 #ifndef _LINUX_CRYPTO_H
 #define _LINUX_CRYPTO_H
 
+#include <crypto/api.h>
 #include <linux/completion.h>
 #include <linux/errno.h>
 #include <linux/refcount_types.h>
@@ -376,7 +377,9 @@ struct crypto_wait {
 /*
  * Async ops completion helper functioons
  */
-void crypto_req_done(void *req, int err);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_req_done, void,
+	(void *req, int err),
+	(req, err));
 
 static inline int crypto_wait_req(int err, struct crypto_wait *wait)
 {
@@ -400,7 +403,9 @@ static inline void crypto_init_wait(struct crypto_wait *wait)
 /*
  * Algorithm query interface.
  */
-int crypto_has_alg(const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_has_alg, int,
+	(const char *name, u32 type, u32 mask),
+	(name, type, mask));
 
 /*
  * Transforms: user-instantiated objects which encapsulate algorithms
@@ -428,8 +433,12 @@ struct crypto_tfm {
  * Transform user interface.
  */
  
-struct crypto_tfm *crypto_alloc_base(const char *alg_name, u32 type, u32 mask);
-void crypto_destroy_tfm(void *mem, struct crypto_tfm *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_alloc_base, struct crypto_tfm *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_destroy_tfm, void,
+	(void *mem, struct crypto_tfm *tfm),
+	(mem, tfm));
 
 static inline void crypto_free_tfm(struct crypto_tfm *tfm)
 {
@@ -514,8 +523,9 @@ static inline void crypto_request_set_tfm(struct crypto_async_request *req,
 	req->flags &= ~CRYPTO_TFM_REQ_ON_STACK;
 }
 
-struct crypto_async_request *crypto_request_clone(
-	struct crypto_async_request *req, size_t total, gfp_t gfp);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO, crypto_request_clone, struct crypto_async_request *,
+	(struct crypto_async_request *req, size_t total, gfp_t gfp),
+	(req, total, gfp));
 
 static inline void crypto_stack_request_init(struct crypto_async_request *req,
 					     struct crypto_tfm *tfm)
-- 
2.47.3


