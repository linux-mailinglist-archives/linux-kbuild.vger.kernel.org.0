Return-Path: <linux-kbuild+bounces-11153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHhfAcE/jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11153-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:49:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06C1295A1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19F66305148A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83A42192F5;
	Thu, 12 Feb 2026 02:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mhKBBLKl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B8126C03;
	Thu, 12 Feb 2026 02:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864573; cv=none; b=tnhnp7n6Yc6UpEEIv9bcazubde/zZmWxdKKnpbDuHbI611Jlmt0+K1L9otDcVqWc0ecayEnrSHu1pKoVtAFOUgl0VlLcBe6Zw+TAuZTMzl8GKSVDXo/junqK4TmAOtNFpGeZ0DJWMKkWcNW3DUeJDvbraOdvqdLqwZkMVhWzmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864573; c=relaxed/simple;
	bh=8aYHEm02sXM+V8UteU7ooJl8VUNkvQ+zCKNu4YB4CmY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kVX+bYLiuO/DH4DSoidLAXBAx351SQoHi6t0uH+eq7xKNZ3uQ8WQXETvbNxJmcHnNZOUeI8nO5Mt6ia9NYjyUPJ4K7ThH0xhY+kmII1TWiVxAcqG2j9z2XN3+LiftKsmd1uSAASqvbL608ujYWsxhs6fxqC4sd/urkavPElfoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mhKBBLKl; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864572; x=1802400572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N+pGvf/+xu0FcFk4db+YHRmjhyiqFhSNz1AFVFxYF10=;
  b=mhKBBLKlbxYsZ2WY86oh+53Ri8HMLzUE7sDNuIPg4nDZq9QSK4kr3Wta
   Q/PkNIMmFEJSahkwTUDcUjMv2zRLSAhasdvjkYU4hbUg67u7vEOzthbV7
   lM+p8HVovybFcHL8Zf/lSbmaua9+zwxNAk0LLDfRD3FkHaIGjE0e8AZg/
   iZ1Bbut5TkaAyj8k6Wb+WsN0Y1GXoEmwURQVxxwUtHmK7P6y94coJ6Xke
   7JqeXwpnBU4oOEG4XmYAF/+CtfnRSq4qRiWTuHcTtNri/AFSqxeHOS1Di
   XFOxrJM6sx4yMn3np/dEl726GBalBLHSHR21mN2FM60OC+5kaKY0nmkUe
   g==;
X-CSE-ConnectionGUID: Je7THBgpR06s6/j24pya2w==
X-CSE-MsgGUID: q+OSa3vJTjKEb63pJ98z0g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12793357"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:49:31 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:18376]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 9fbcd083-7266-4896-b18c-9fcd15e6af72; Thu, 12 Feb 2026 02:49:31 +0000 (UTC)
X-Farcaster-Flow-ID: 9fbcd083-7266-4896-b18c-9fcd15e6af72
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:49:30 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:49:30 +0000
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
Subject: [PATCH 008/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_HASH2 crypto
Date: Thu, 12 Feb 2026 02:45:44 +0000
Message-ID: <20260212024725.11264-9-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D036UWB004.ant.amazon.com (10.13.139.170) To
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
	TAGGED_FROM(0.00)[bounces-11153-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E06C1295A1
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_HASH2-related crypto to convert them into pluggable
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
 crypto/fips140/fips140-api.c   | 63 ++++++++++++++++++++++++++++++++++
 include/crypto/hash.h          | 53 +++++++++++++---------------
 include/crypto/internal/hash.h | 59 ++++++++++++++-----------------
 4 files changed, 113 insertions(+), 64 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index f14758177ee3..210e4aa3dbac 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -31,7 +31,7 @@ crypto-objs-$(CONFIG_CRYPTO_ECHAINIV) += echainiv.o
 
 crypto_hash-y += ahash.o
 crypto_hash-y += shash.o
-obj-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
+crypto-objs-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 
 obj-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
 obj-$(CONFIG_CRYPTO_SIG2) += sig.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index e256b0f3e4a6..e1c2f709ad3b 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -189,4 +189,67 @@ DEFINE_CRYPTO_API_STUB(skcipher_walk_aead_encrypt);
 DEFINE_CRYPTO_API_STUB(skcipher_walk_aead_decrypt);
 DEFINE_CRYPTO_API_STUB(skcipher_alloc_instance_simple);
 
+#endif
+
+/*
+ * crypto/ahash.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_HASH2)
+
+#include <crypto/hash.h>
+#include <crypto/internal/hash.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_hash_walk_first);
+DEFINE_CRYPTO_API_STUB(crypto_hash_walk_done);
+DEFINE_CRYPTO_API_STUB(shash_ahash_update);
+DEFINE_CRYPTO_API_STUB(shash_ahash_finup);
+DEFINE_CRYPTO_API_STUB(shash_ahash_digest);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_init);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_update);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_finup);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_digest);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_export_core);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_export);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_import_core);
+DEFINE_CRYPTO_API_STUB(crypto_ahash_import);
+DEFINE_CRYPTO_API_STUB(crypto_grab_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_has_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_hash_alg_has_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_clone_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_register_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_register_ahashes);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_ahashes);
+DEFINE_CRYPTO_API_STUB(ahash_register_instance);
+DEFINE_CRYPTO_API_STUB(ahash_request_free);
+DEFINE_CRYPTO_API_STUB(crypto_hash_digest);
+DEFINE_CRYPTO_API_STUB(ahash_free_singlespawn_instance);
+
+/*
+ * crypto/shash.c
+ */
+
+DEFINE_CRYPTO_API_STUB(shash_no_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_shash_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_shash_init);
+DEFINE_CRYPTO_API_STUB(crypto_shash_finup);
+DEFINE_CRYPTO_API_STUB(crypto_shash_digest);
+DEFINE_CRYPTO_API_STUB(crypto_shash_tfm_digest);
+DEFINE_CRYPTO_API_STUB(crypto_shash_export_core);
+DEFINE_CRYPTO_API_STUB(crypto_shash_export);
+DEFINE_CRYPTO_API_STUB(crypto_shash_import_core);
+DEFINE_CRYPTO_API_STUB(crypto_shash_import);
+DEFINE_CRYPTO_API_STUB(crypto_grab_shash);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_shash);
+DEFINE_CRYPTO_API_STUB(crypto_has_shash);
+DEFINE_CRYPTO_API_STUB(crypto_clone_shash);
+DEFINE_CRYPTO_API_STUB(crypto_register_shash);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_shash);
+DEFINE_CRYPTO_API_STUB(crypto_register_shashes);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_shashes);
+DEFINE_CRYPTO_API_STUB(shash_register_instance);
+DEFINE_CRYPTO_API_STUB(shash_free_singlespawn_instance);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/hash.h b/include/crypto/hash.h
index 586700332c73..10325879514a 100644
--- a/include/crypto/hash.h
+++ b/include/crypto/hash.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_HASH_H
 #define _CRYPTO_HASH_H
 
+#include <crypto/api.h>
 #include <linux/crypto.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
@@ -319,10 +320,9 @@ static inline struct crypto_ahash *__crypto_ahash_cast(struct crypto_tfm *tfm)
  * Return: allocated cipher handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_ahash *crypto_alloc_ahash(const char *alg_name, u32 type,
-					u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_alloc_ahash, struct crypto_ahash *, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
-struct crypto_ahash *crypto_clone_ahash(struct crypto_ahash *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_clone_ahash, struct crypto_ahash *, (struct crypto_ahash *tfm), (tfm));
 
 static inline struct crypto_tfm *crypto_ahash_tfm(struct crypto_ahash *tfm)
 {
@@ -350,7 +350,7 @@ static inline void crypto_free_ahash(struct crypto_ahash *tfm)
  * Return: true when the ahash is known to the kernel crypto API; false
  *	   otherwise
  */
-int crypto_has_ahash(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_has_ahash, int, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
 static inline const char *crypto_ahash_alg_name(struct crypto_ahash *tfm)
 {
@@ -476,8 +476,7 @@ static inline void *ahash_request_ctx(struct ahash_request *req)
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_ahash_setkey(struct crypto_ahash *tfm, const u8 *key,
-			unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_setkey, int, (struct crypto_ahash *tfm, const u8 *key, unsigned int keylen), (tfm, key, keylen));
 
 /**
  * crypto_ahash_finup() - update and finalize message digest
@@ -490,7 +489,7 @@ int crypto_ahash_setkey(struct crypto_ahash *tfm, const u8 *key,
  *
  * Return: see crypto_ahash_final()
  */
-int crypto_ahash_finup(struct ahash_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_finup, int, (struct ahash_request *req), (req));
 
 /**
  * crypto_ahash_final() - calculate message digest
@@ -524,7 +523,7 @@ static inline int crypto_ahash_final(struct ahash_request *req)
  *
  * Return: see crypto_ahash_final()
  */
-int crypto_ahash_digest(struct ahash_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_digest, int, (struct ahash_request *req), (req));
 
 /**
  * crypto_ahash_export() - extract current message digest state
@@ -537,7 +536,7 @@ int crypto_ahash_digest(struct ahash_request *req);
  *
  * Return: 0 if the export was successful; < 0 if an error occurred
  */
-int crypto_ahash_export(struct ahash_request *req, void *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_export, int, (struct ahash_request *req, void *out), (req, out));
 
 /**
  * crypto_ahash_import() - import message digest state
@@ -550,7 +549,7 @@ int crypto_ahash_export(struct ahash_request *req, void *out);
  *
  * Return: 0 if the import was successful; < 0 if an error occurred
  */
-int crypto_ahash_import(struct ahash_request *req, const void *in);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_import, int, (struct ahash_request *req, const void *in), (req, in));
 
 /**
  * crypto_ahash_init() - (re)initialize message digest handle
@@ -563,7 +562,7 @@ int crypto_ahash_import(struct ahash_request *req, const void *in);
  *
  * Return: see crypto_ahash_final()
  */
-int crypto_ahash_init(struct ahash_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_init, int, (struct ahash_request *req), (req));
 
 /**
  * crypto_ahash_update() - add data to message digest for processing
@@ -576,7 +575,7 @@ int crypto_ahash_init(struct ahash_request *req);
  *
  * Return: see crypto_ahash_final()
  */
-int crypto_ahash_update(struct ahash_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_update, int, (struct ahash_request *req), (req));
 
 /**
  * DOC: Asynchronous Hash Request Handle
@@ -634,7 +633,7 @@ static inline struct ahash_request *ahash_request_alloc_noprof(
  * ahash_request_free() - zeroize and free the request data structure
  * @req: request data structure cipher handle to be freed
  */
-void ahash_request_free(struct ahash_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, ahash_request_free, void, (struct ahash_request *req), (req));
 
 static inline void ahash_request_zero(struct ahash_request *req)
 {
@@ -756,12 +755,11 @@ static inline void ahash_request_set_virt(struct ahash_request *req,
  * Return: allocated cipher handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_shash *crypto_alloc_shash(const char *alg_name, u32 type,
-					u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_alloc_shash, struct crypto_shash *, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
-struct crypto_shash *crypto_clone_shash(struct crypto_shash *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_clone_shash, struct crypto_shash *, (struct crypto_shash *tfm), (tfm));
 
-int crypto_has_shash(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_has_shash, int, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_shash_tfm(struct crypto_shash *tfm)
 {
@@ -885,8 +883,7 @@ static inline void *shash_desc_ctx(struct shash_desc *desc)
  * Context: Softirq or process context.
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_shash_setkey(struct crypto_shash *tfm, const u8 *key,
-			unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_setkey, int, (struct crypto_shash *tfm, const u8 *key, unsigned int keylen), (tfm, key, keylen));
 
 /**
  * crypto_shash_digest() - calculate message digest for buffer
@@ -903,8 +900,7 @@ int crypto_shash_setkey(struct crypto_shash *tfm, const u8 *key,
  * Return: 0 if the message digest creation was successful; < 0 if an error
  *	   occurred
  */
-int crypto_shash_digest(struct shash_desc *desc, const u8 *data,
-			unsigned int len, u8 *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_digest, int, (struct shash_desc *desc, const u8 *data, unsigned int len, u8 *out), (desc, data, len, out));
 
 /**
  * crypto_shash_tfm_digest() - calculate message digest for buffer
@@ -922,11 +918,9 @@ int crypto_shash_digest(struct shash_desc *desc, const u8 *data,
  * Context: Softirq or process context.
  * Return: 0 on success; < 0 if an error occurred.
  */
-int crypto_shash_tfm_digest(struct crypto_shash *tfm, const u8 *data,
-			    unsigned int len, u8 *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_tfm_digest, int, (struct crypto_shash *tfm, const u8 *data, unsigned int len, u8 *out), (tfm, data, len, out));
 
-int crypto_hash_digest(struct crypto_ahash *tfm, const u8 *data,
-		       unsigned int len, u8 *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_hash_digest, int, (struct crypto_ahash *tfm, const u8 *data, unsigned int len, u8 *out), (tfm, data, len, out));
 
 /**
  * crypto_shash_export() - extract operational state for message digest
@@ -940,7 +934,7 @@ int crypto_hash_digest(struct crypto_ahash *tfm, const u8 *data,
  * Context: Softirq or process context.
  * Return: 0 if the export creation was successful; < 0 if an error occurred
  */
-int crypto_shash_export(struct shash_desc *desc, void *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_export, int, (struct shash_desc *desc, void *out), (desc, out));
 
 /**
  * crypto_shash_import() - import operational state
@@ -954,7 +948,7 @@ int crypto_shash_export(struct shash_desc *desc, void *out);
  * Context: Softirq or process context.
  * Return: 0 if the import was successful; < 0 if an error occurred
  */
-int crypto_shash_import(struct shash_desc *desc, const void *in);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_import, int, (struct shash_desc *desc, const void *in), (desc, in));
 
 /**
  * crypto_shash_init() - (re)initialize message digest
@@ -968,7 +962,7 @@ int crypto_shash_import(struct shash_desc *desc, const void *in);
  * Return: 0 if the message digest initialization was successful; < 0 if an
  *	   error occurred
  */
-int crypto_shash_init(struct shash_desc *desc);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_init, int, (struct shash_desc *desc), (desc));
 
 /**
  * crypto_shash_finup() - calculate message digest of buffer
@@ -985,8 +979,7 @@ int crypto_shash_init(struct shash_desc *desc);
  * Return: 0 if the message digest creation was successful; < 0 if an error
  *	   occurred
  */
-int crypto_shash_finup(struct shash_desc *desc, const u8 *data,
-		       unsigned int len, u8 *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_finup, int, (struct shash_desc *desc, const u8 *data, unsigned int len, u8 *out), (desc, data, len, out));
 
 /**
  * crypto_shash_update() - add data to message digest for processing
diff --git a/include/crypto/internal/hash.h b/include/crypto/internal/hash.h
index 6ec5f2f37ccb..7ab717d1fd9c 100644
--- a/include/crypto/internal/hash.h
+++ b/include/crypto/internal/hash.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_INTERNAL_HASH_H
 #define _CRYPTO_INTERNAL_HASH_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <crypto/hash.h>
 
@@ -75,32 +76,29 @@ struct crypto_shash_spawn {
 	struct crypto_spawn base;
 };
 
-int crypto_hash_walk_done(struct crypto_hash_walk *walk, int err);
-int crypto_hash_walk_first(struct ahash_request *req,
-			   struct crypto_hash_walk *walk);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_hash_walk_done, int, (struct crypto_hash_walk *walk, int err), (walk, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_hash_walk_first, int, (struct ahash_request *req, struct crypto_hash_walk *walk), (req, walk));
 
 static inline int crypto_hash_walk_last(struct crypto_hash_walk *walk)
 {
 	return !(walk->entrylen | walk->total);
 }
 
-int crypto_register_ahash(struct ahash_alg *alg);
-void crypto_unregister_ahash(struct ahash_alg *alg);
-int crypto_register_ahashes(struct ahash_alg *algs, int count);
-void crypto_unregister_ahashes(struct ahash_alg *algs, int count);
-int ahash_register_instance(struct crypto_template *tmpl,
-			    struct ahash_instance *inst);
-void ahash_free_singlespawn_instance(struct ahash_instance *inst);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_register_ahash, int, (struct ahash_alg *alg), (alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_unregister_ahash, void, (struct ahash_alg *alg), (alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_register_ahashes, int, (struct ahash_alg *algs, int count), (algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_unregister_ahashes, void, (struct ahash_alg *algs, int count), (algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, ahash_register_instance, int, (struct crypto_template *tmpl, struct ahash_instance *inst), (tmpl, inst));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, ahash_free_singlespawn_instance, void, (struct ahash_instance *inst), (inst));
 
-int shash_no_setkey(struct crypto_shash *tfm, const u8 *key,
-		    unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, shash_no_setkey, int, (struct crypto_shash *tfm, const u8 *key, unsigned int keylen), (tfm, key, keylen));
 
 static inline bool crypto_shash_alg_has_setkey(struct shash_alg *alg)
 {
 	return alg->setkey != shash_no_setkey;
 }
 
-bool crypto_hash_alg_has_setkey(struct hash_alg_common *halg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_hash_alg_has_setkey, bool, (struct hash_alg_common *halg), (halg));
 
 static inline bool crypto_shash_alg_needs_key(struct shash_alg *alg)
 {
@@ -120,9 +118,7 @@ static inline bool crypto_hash_no_export_core(struct crypto_ahash *tfm)
 	       CRYPTO_AHASH_ALG_NO_EXPORT_CORE;
 }
 
-int crypto_grab_ahash(struct crypto_ahash_spawn *spawn,
-		      struct crypto_instance *inst,
-		      const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_grab_ahash, int, (struct crypto_ahash_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask), (spawn, inst, name, type, mask));
 
 static inline void crypto_drop_ahash(struct crypto_ahash_spawn *spawn)
 {
@@ -135,17 +131,14 @@ static inline struct hash_alg_common *crypto_spawn_ahash_alg(
 	return __crypto_hash_alg_common(spawn->base.alg);
 }
 
-int crypto_register_shash(struct shash_alg *alg);
-void crypto_unregister_shash(struct shash_alg *alg);
-int crypto_register_shashes(struct shash_alg *algs, int count);
-void crypto_unregister_shashes(struct shash_alg *algs, int count);
-int shash_register_instance(struct crypto_template *tmpl,
-			    struct shash_instance *inst);
-void shash_free_singlespawn_instance(struct shash_instance *inst);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_register_shash, int, (struct shash_alg *alg), (alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_unregister_shash, void, (struct shash_alg *alg), (alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_register_shashes, int, (struct shash_alg *algs, int count), (algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_unregister_shashes, void, (struct shash_alg *algs, int count), (algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, shash_register_instance, int, (struct crypto_template *tmpl, struct shash_instance *inst), (tmpl, inst));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, shash_free_singlespawn_instance, void, (struct shash_instance *inst), (inst));
 
-int crypto_grab_shash(struct crypto_shash_spawn *spawn,
-		      struct crypto_instance *inst,
-		      const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_grab_shash, int, (struct crypto_shash_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask), (spawn, inst, name, type, mask));
 
 static inline void crypto_drop_shash(struct crypto_shash_spawn *spawn)
 {
@@ -158,9 +151,9 @@ static inline struct shash_alg *crypto_spawn_shash_alg(
 	return __crypto_shash_alg(spawn->base.alg);
 }
 
-int shash_ahash_update(struct ahash_request *req, struct shash_desc *desc);
-int shash_ahash_finup(struct ahash_request *req, struct shash_desc *desc);
-int shash_ahash_digest(struct ahash_request *req, struct shash_desc *desc);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, shash_ahash_update, int, (struct ahash_request *req, struct shash_desc *desc), (req, desc));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, shash_ahash_finup, int, (struct ahash_request *req, struct shash_desc *desc), (req, desc));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, shash_ahash_digest, int, (struct ahash_request *req, struct shash_desc *desc), (req, desc));
 
 static inline void *crypto_ahash_ctx(struct crypto_ahash *tfm)
 {
@@ -363,7 +356,7 @@ static inline unsigned int crypto_shash_coresize(struct crypto_shash *tfm)
  * Context: Softirq or process context.
  * Return: 0 if the export creation was successful; < 0 if an error occurred
  */
-int crypto_ahash_export_core(struct ahash_request *req, void *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_export_core, int, (struct ahash_request *req, void *out), (req, out));
 
 /**
  * crypto_ahash_import_core() - import core state
@@ -375,7 +368,7 @@ int crypto_ahash_export_core(struct ahash_request *req, void *out);
  * Context: Softirq or process context.
  * Return: 0 if the import was successful; < 0 if an error occurred
  */
-int crypto_ahash_import_core(struct ahash_request *req, const void *in);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_ahash_import_core, int, (struct ahash_request *req, const void *in), (req, in));
 
 /**
  * crypto_shash_export_core() - extract core state for message digest
@@ -387,7 +380,7 @@ int crypto_ahash_import_core(struct ahash_request *req, const void *in);
  * Context: Softirq or process context.
  * Return: 0 if the export creation was successful; < 0 if an error occurred
  */
-int crypto_shash_export_core(struct shash_desc *desc, void *out);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_export_core, int, (struct shash_desc *desc, void *out), (desc, out));
 
 /**
  * crypto_shash_import_core() - import core state
@@ -399,7 +392,7 @@ int crypto_shash_export_core(struct shash_desc *desc, void *out);
  * Context: Softirq or process context.
  * Return: 0 if the import was successful; < 0 if an error occurred
  */
-int crypto_shash_import_core(struct shash_desc *desc, const void *in);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HASH2, crypto_shash_import_core, int, (struct shash_desc *desc, const void *in), (desc, in));
 
 #endif	/* _CRYPTO_INTERNAL_HASH_H */
 
-- 
2.47.3


