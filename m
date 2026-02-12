Return-Path: <linux-kbuild+bounces-11148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOH+GHE/jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11148-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:48:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA312952E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69F72302260C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F4A1FC104;
	Thu, 12 Feb 2026 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="EonPZQfp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044858460;
	Thu, 12 Feb 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864495; cv=none; b=bl6i52qsYHw0GLomwfhuhZI/vEiWJ56Rq9P3SC7kzT2+BXrA3b9anTQ08Rl1rA7xDAgxtWJZfKm/Lizl3pQt0SeZxfJ0C2c7AJWpzAjg2kt6dD40B/UO7mC7GumC4MUTWYUKrzOh6l/Sl47uB4cGHb+ucYIKpMwHCEwGGCK/oRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864495; c=relaxed/simple;
	bh=0jUd4ESl0P9zDaGyCVpHtFpoUm2FnPEV1XXpoqVPslY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=as5Yr29Ac4kJ0qMe9uiN5o7OaC8Y932dcNNz/860JR0L692whktcLfdw7Kbwb9nXqXAAEt6GGFN3UbTMZxqqHETPszxvhX75SuQC8K8Lmv0yOVhGz7RkvB6fQ6FDQ4sdFosbBWLOLhBqhA2phrhsDCu8ltxhZxPs2O7I25cL1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=EonPZQfp; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864494; x=1802400494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T59ZDYjkqB8iSHZod5Lepzkdortdas46hB/HXJuxoxE=;
  b=EonPZQfpYaGievAZk85lcP7mo5bnmhxAHwwNA8gDapyUiAG1P3VpE5lD
   L+Vs2jCwyp50SZ7T16FDZr6537zXGH9xRd+ClOXmZjpB3mkb/d04sMnoV
   ftysYuvNns/WN/o/oZzEG7Yg5kOX9r0o5ksdEnT/SPm4hHYqBAXDiGmfo
   nQqP91IHhPMpPo9GVbquDo+FXTMQlENbdumFY27imN1fhYtKuxIbSD2FS
   i5bDZ+IG4qzi6Qr4MDlq+GtimweHEB0T6jqz9GlyrO3rbZTZs2+zp9+dr
   PA6/ANk5zwdlkWaMK56HuM40M0tLLUTfDMMUGyyyamnzUqoIy/Oe/b36J
   Q==;
X-CSE-ConnectionGUID: fN6jCD9MTmWXOPeD1/A/Mw==
X-CSE-MsgGUID: q+49R8ukRNS/RH3/ogYAsg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803116"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:48:13 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:25691]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id e07e0737-9ebf-4bae-bde8-051b46464ed5; Thu, 12 Feb 2026 02:48:13 +0000 (UTC)
X-Farcaster-Flow-ID: e07e0737-9ebf-4bae-bde8-051b46464ed5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:13 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:12 +0000
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
Subject: [PATCH 003/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AEAD2 crypto
Date: Thu, 12 Feb 2026 02:45:39 +0000
Message-ID: <20260212024725.11264-4-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D032UWA003.ant.amazon.com (10.13.139.37) To
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
	TAGGED_FROM(0.00)[bounces-11148-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05AA312952E
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_AEAD2-related crypto to convert them into pluggable
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
 crypto/fips140/fips140-api.c   | 26 ++++++++++++++++++++++++++
 include/crypto/aead.h          | 30 ++++++++++++++++++++++--------
 include/crypto/internal/aead.h | 28 +++++++++++++++++++---------
 4 files changed, 68 insertions(+), 18 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index da5a7a4aa59b..9aa52ddebb05 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -15,7 +15,7 @@ crypto_algapi-$(CONFIG_PROC_FS) += proc.o
 crypto_algapi-y := algapi.o scatterwalk.o $(crypto_algapi-y)
 crypto-objs-$(CONFIG_CRYPTO_ALGAPI2) += crypto_algapi.o
 
-obj-$(CONFIG_CRYPTO_AEAD2) += aead.o
+crypto-objs-$(CONFIG_CRYPTO_AEAD2) += aead.o
 obj-$(CONFIG_CRYPTO_GENIV) += geniv.o
 
 crypto_skcipher-y += lskcipher.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 8a0e1d28615c..eb02a56cb8b3 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -103,4 +103,30 @@ DEFINE_CRYPTO_API_STUB(crypto_remove_final);
 DEFINE_CRYPTO_API_STUB(crypto_alg_extsize);
 DEFINE_CRYPTO_API_STUB(crypto_type_has_alg);
 
+#endif
+
+/*
+ * crypto/aead.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_AEAD2)
+
+#include <crypto/aead.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alloc_aead);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_sync_aead);
+DEFINE_CRYPTO_API_STUB(crypto_has_aead);
+DEFINE_CRYPTO_API_STUB(crypto_aead_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_aead_setauthsize);
+DEFINE_CRYPTO_API_STUB(crypto_aead_encrypt);
+DEFINE_CRYPTO_API_STUB(crypto_aead_decrypt);
+
+#include <crypto/internal/aead.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_grab_aead);
+DEFINE_CRYPTO_API_STUB(crypto_register_aead);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_aead);
+DEFINE_CRYPTO_API_STUB(crypto_register_aeads);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_aeads);
+DEFINE_CRYPTO_API_STUB(aead_register_instance);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/aead.h b/include/crypto/aead.h
index 8e66a1fa9c78..2d3e2bde5c1d 100644
--- a/include/crypto/aead.h
+++ b/include/crypto/aead.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_AEAD_H
 #define _CRYPTO_AEAD_H
 
+#include <crypto/api.h>
 #include <linux/atomic.h>
 #include <linux/container_of.h>
 #include <linux/crypto.h>
@@ -193,9 +194,13 @@ static inline struct crypto_aead *__crypto_aead_cast(struct crypto_tfm *tfm)
  * Return: allocated cipher handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_aead *crypto_alloc_aead(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_alloc_aead, struct crypto_aead *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
-struct crypto_sync_aead *crypto_alloc_sync_aead(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_alloc_sync_aead, struct crypto_sync_aead *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_aead_tfm(struct crypto_aead *tfm)
 {
@@ -233,7 +238,9 @@ static inline void crypto_free_sync_aead(struct crypto_sync_aead *tfm)
  * Return: true when the aead is known to the kernel crypto API; false
  *	   otherwise
  */
-int crypto_has_aead(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_has_aead, int,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
 static inline const char *crypto_aead_driver_name(struct crypto_aead *tfm)
 {
@@ -378,8 +385,9 @@ static inline void crypto_sync_aead_clear_flags(struct crypto_sync_aead *tfm, u3
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_aead_setkey(struct crypto_aead *tfm,
-		       const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_aead_setkey, int,
+	(struct crypto_aead *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
 
 static inline int crypto_sync_aead_setkey(struct crypto_sync_aead *tfm,
 					 const u8 *key, unsigned int keylen)
@@ -397,7 +405,9 @@ static inline int crypto_sync_aead_setkey(struct crypto_sync_aead *tfm,
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_aead_setauthsize(struct crypto_aead *tfm, unsigned int authsize);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_aead_setauthsize, int,
+	(struct crypto_aead *tfm, unsigned int authsize),
+	(tfm, authsize));
 
 static inline int crypto_sync_aead_setauthsize(struct crypto_sync_aead *tfm,
 					       unsigned int authsize)
@@ -436,7 +446,9 @@ static inline struct crypto_sync_aead *crypto_sync_aead_reqtfm(struct aead_reque
  *
  * Return: 0 if the cipher operation was successful; < 0 if an error occurred
  */
-int crypto_aead_encrypt(struct aead_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_aead_encrypt, int,
+	(struct aead_request *req),
+	(req));
 
 /**
  * crypto_aead_decrypt() - decrypt ciphertext
@@ -460,7 +472,9 @@ int crypto_aead_encrypt(struct aead_request *req);
  *	   integrity of the ciphertext or the associated data was violated);
  *	   < 0 if an error occurred.
  */
-int crypto_aead_decrypt(struct aead_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_aead_decrypt, int,
+	(struct aead_request *req),
+	(req));
 
 /**
  * DOC: Asynchronous AEAD Request Handle
diff --git a/include/crypto/internal/aead.h b/include/crypto/internal/aead.h
index 28a95eb3182d..773e6dbb34d6 100644
--- a/include/crypto/internal/aead.h
+++ b/include/crypto/internal/aead.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_INTERNAL_AEAD_H
 #define _CRYPTO_INTERNAL_AEAD_H
 
+#include <crypto/api.h>
 #include <crypto/aead.h>
 #include <crypto/algapi.h>
 #include <linux/stddef.h>
@@ -96,9 +97,9 @@ static inline struct aead_request *aead_request_cast(
 	return container_of(req, struct aead_request, base);
 }
 
-int crypto_grab_aead(struct crypto_aead_spawn *spawn,
-		     struct crypto_instance *inst,
-		     const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_grab_aead, int,
+	(struct crypto_aead_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask),
+	(spawn, inst, name, type, mask));
 
 static inline void crypto_drop_aead(struct crypto_aead_spawn *spawn)
 {
@@ -157,12 +158,21 @@ static inline unsigned int crypto_aead_chunksize(struct crypto_aead *tfm)
 	return crypto_aead_alg_chunksize(crypto_aead_alg(tfm));
 }
 
-int crypto_register_aead(struct aead_alg *alg);
-void crypto_unregister_aead(struct aead_alg *alg);
-int crypto_register_aeads(struct aead_alg *algs, int count);
-void crypto_unregister_aeads(struct aead_alg *algs, int count);
-int aead_register_instance(struct crypto_template *tmpl,
-			   struct aead_instance *inst);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_register_aead, int,
+	(struct aead_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_unregister_aead, void,
+	(struct aead_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_register_aeads, int,
+	(struct aead_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_unregister_aeads, void,
+	(struct aead_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, aead_register_instance, int,
+	(struct crypto_template *tmpl, struct aead_instance *inst),
+	(tmpl, inst));
 
 #endif	/* _CRYPTO_INTERNAL_AEAD_H */
 
-- 
2.47.3


