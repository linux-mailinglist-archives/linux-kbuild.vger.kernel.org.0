Return-Path: <linux-kbuild+bounces-11156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPvJAO8/jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11156-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:50:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1981295E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D440302261A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CA11BC46;
	Thu, 12 Feb 2026 02:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="B4cme2iz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D918C1F;
	Thu, 12 Feb 2026 02:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864619; cv=none; b=t1uY/QO0xaEPeFIaBknrNHoeHeKc2ALHdTAXNb31qQBWxxP1MQr6/Wg1DbcSAssXKRMwCoLqzeZJ6bz1KUdlmHq3S8sPCIBDbKX0iJ4Ve1uu2AhwzGln5S8W+y+u9O3FZNiM9VSt3Y4n+p4cLTiI4JNbm9TlrrAvxdHgJBpJMW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864619; c=relaxed/simple;
	bh=z6hqwITF6Rrhi5tKhSZzMmCxWHlEA269DxhojTFGFbw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TYAnsfJySYcg0wENEI6igV4TyK87uGTg0QxW9JBhBELDmyU8EJL3qs5qo1SE7yNa/aGZ9NUCpVFaJl5KQ6CU09/amLLZ9el+2IiE+jT0k2A34WyPQQRLQKWUzVYNQWTg+RHpYjBm6J6rizHxYJvm8ZS/RZ0TUl15uv+4fYtXclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=B4cme2iz; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864618; x=1802400618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wgB3wurLjiYUioWjeSGxIO2fnPDJLoOj7l8RtV37cRU=;
  b=B4cme2izNGb4GXoTiVsEPbMmwFyur4nwIlCOXRoF/+98wboTOwsUpuzl
   vV3/S1zxol9/x7IAjP+1sF8WrsNdCY9F/lQgr84GfAPjHkAZdEUJZNyat
   gTzr0d97RET8hbmFj7jnFqugmfesC/j4fGsmwBKxWwwRjSRcnZ7mWQrRS
   3ASd26sqWJdCeCe0G/HgXGUaIdXGiwKSvyCICxUHOcVAXEB308XvyNoZf
   91lEUW0unmK9wEVwDCTuV00ZYA15VWQBhD9pMK6MIVXMsw+0ZJvZkhxQh
   6iM1u5RszOUhLpkZaZ2Wz8jqzKNQpTFA8PGMbKWnNDMhq3kxL0VDdiYmV
   Q==;
X-CSE-ConnectionGUID: 16Dqkm6HS+Gvb0Xtt8/cEA==
X-CSE-MsgGUID: yhMAxWYoSTGoZiba0p3Egw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721399"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:50:18 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:24554]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 968ce779-54cd-4bd2-94f5-597723c36c97; Thu, 12 Feb 2026 02:50:17 +0000 (UTC)
X-Farcaster-Flow-ID: 968ce779-54cd-4bd2-94f5-597723c36c97
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:17 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:17 +0000
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
Subject: [PATCH 011/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_KPP2 crypto
Date: Thu, 12 Feb 2026 02:45:47 +0000
Message-ID: <20260212024725.11264-12-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D038UWC001.ant.amazon.com (10.13.139.213) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11156-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oracle.com:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD1981295E9
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_KPP2-related crypto to convert them into pluggable
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
 crypto/Makefile               |  2 +-
 crypto/fips140/fips140-api.c  | 17 +++++++++++++++++
 include/crypto/internal/kpp.h | 12 +++++-------
 include/crypto/kpp.h          |  5 +++--
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 2e722f7961d4..21197857ad7d 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -35,7 +35,7 @@ crypto-objs-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 
 crypto-objs-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
 crypto-objs-$(CONFIG_CRYPTO_SIG2) += sig.o
-obj-$(CONFIG_CRYPTO_KPP2) += kpp.o
+crypto-objs-$(CONFIG_CRYPTO_KPP2) += kpp.o
 obj-$(CONFIG_CRYPTO_HKDF) += hkdf.o
 
 dh_generic-y := dh.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index c97806cfdd05..50603e7a8bb0 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -286,4 +286,21 @@ DEFINE_CRYPTO_API_STUB(crypto_unregister_sig);
 DEFINE_CRYPTO_API_STUB(sig_register_instance);
 DEFINE_CRYPTO_API_STUB(crypto_grab_sig);
 
+#endif
+
+/*
+ * crypto/kpp.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_KPP2)
+
+#include <crypto/kpp.h>
+#include <crypto/internal/kpp.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alloc_kpp);
+DEFINE_CRYPTO_API_STUB(crypto_grab_kpp);
+DEFINE_CRYPTO_API_STUB(crypto_has_kpp);
+DEFINE_CRYPTO_API_STUB(crypto_register_kpp);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_kpp);
+DEFINE_CRYPTO_API_STUB(kpp_register_instance);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/internal/kpp.h b/include/crypto/internal/kpp.h
index 0a6db8c4a9a0..eff35727f700 100644
--- a/include/crypto/internal/kpp.h
+++ b/include/crypto/internal/kpp.h
@@ -7,6 +7,7 @@
  */
 #ifndef _CRYPTO_KPP_INT_H
 #define _CRYPTO_KPP_INT_H
+#include <crypto/api.h>
 #include <crypto/kpp.h>
 #include <crypto/algapi.h>
 
@@ -159,7 +160,7 @@ static inline void *kpp_instance_ctx(struct kpp_instance *inst)
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_register_kpp(struct kpp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KPP2, crypto_register_kpp, int, (struct kpp_alg *alg), (alg));
 
 /**
  * crypto_unregister_kpp() -- Unregister key-agreement protocol primitive
@@ -170,7 +171,7 @@ int crypto_register_kpp(struct kpp_alg *alg);
  *
  * @alg:	algorithm definition
  */
-void crypto_unregister_kpp(struct kpp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KPP2, crypto_unregister_kpp, void, (struct kpp_alg *alg), (alg));
 
 /**
  * kpp_register_instance() - Register a KPP template instance.
@@ -178,8 +179,7 @@ void crypto_unregister_kpp(struct kpp_alg *alg);
  * @inst: The KPP template instance to be registered.
  * Return: %0 on success, negative error code otherwise.
  */
-int kpp_register_instance(struct crypto_template *tmpl,
-			  struct kpp_instance *inst);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KPP2, kpp_register_instance, int, (struct crypto_template *tmpl, struct kpp_instance *inst), (tmpl, inst));
 
 /*
  * KPP spawn related functions.
@@ -193,9 +193,7 @@ int kpp_register_instance(struct crypto_template *tmpl,
  * @mask: The mask bismask to pass on to the lookup.
  * Return: %0 on success, a negative error code otherwise.
  */
-int crypto_grab_kpp(struct crypto_kpp_spawn *spawn,
-		    struct crypto_instance *inst,
-		    const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KPP2, crypto_grab_kpp, int, (struct crypto_kpp_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask), (spawn, inst, name, type, mask));
 
 /**
  * crypto_drop_kpp() - Release a spawn previously bound via crypto_grab_kpp().
diff --git a/include/crypto/kpp.h b/include/crypto/kpp.h
index 2d9c4de57b69..068a6e218344 100644
--- a/include/crypto/kpp.h
+++ b/include/crypto/kpp.h
@@ -9,6 +9,7 @@
 #ifndef _CRYPTO_KPP_
 #define _CRYPTO_KPP_
 
+#include <crypto/api.h>
 #include <linux/atomic.h>
 #include <linux/container_of.h>
 #include <linux/crypto.h>
@@ -107,9 +108,9 @@ struct kpp_alg {
  * Return: allocated handle in case of success; IS_ERR() is true in case of
  *	   an error, PTR_ERR() returns the error code.
  */
-struct crypto_kpp *crypto_alloc_kpp(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KPP2, crypto_alloc_kpp, struct crypto_kpp *, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
-int crypto_has_kpp(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KPP2, crypto_has_kpp, int, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_kpp_tfm(struct crypto_kpp *tfm)
 {
-- 
2.47.3


