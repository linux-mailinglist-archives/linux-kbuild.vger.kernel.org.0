Return-Path: <linux-kbuild+bounces-11155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFaFI+A/jWna0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11155-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:50:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6C1295D2
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBB5D300B766
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2AF21D59B;
	Thu, 12 Feb 2026 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="CrnqZqkL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C5126C03;
	Thu, 12 Feb 2026 02:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864604; cv=none; b=JDESgOJNs82u3kmp1oQ4wc0yNK/Jtn1F/3BxY/gPGYM4jd5NIS8u05CdKIELZENGBoQ9oYVVKTcRgU9JIWBiD4qS9cnEQAu2cv2maizpAjd5kWV8IT5ChppocC0itd57bRzbZ9wVGYLjX/dkxlkj7fErlb2zdnvP3qqOMm2+2ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864604; c=relaxed/simple;
	bh=q7m4JnpHZoWJIZiEAnH1x1/WFvY0aq6grZmm6pUX+K4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxI/vyV1hclpH7lJznaddxxVOYhuxbyravqF6eCpsHkE0Cyjg/uH1d95uflaidT997pjq2L3j75VQW0jqZR4MtHlT2nt0nAtF8MMsQ5USmxuFqp8fiMSH4NSjxu/rRk/+E0gw2XGvlrlcNU8WXTBiNBKCS4GE+zBC2NYA4Fj1iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=CrnqZqkL; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864603; x=1802400603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rpbhbPxg+gu3tJ1/w30KRtOqtaU7542YRWWeRnaMZHM=;
  b=CrnqZqkLdihU8X6KlO56XPgMhyxdQDndBgs/LL5lyyTliM1YXPDkpc65
   h9Oul2X8IyJVzaChDEBl+eDR2x2VsidHRXFgyNLkt+7dxQI2Xrau4uWWF
   3LoQSrsy/4K14jfDN8EbZWN8CTDdBVPTniiXiSWCzSV46mpzsmXxBh+67
   zLeFN+CNuMDUAjyy4DCx9QApLmV52m97A4g93W7ntPW3o/iS+2m1WMzDY
   Ay6Xbig5FkveRcOJZDplR7PnCQ8genmFaXAYXfeUV2Zet2Uvl8VkBUyn2
   vcJabXp/rVrheCyprKmiJPYeuGF0cF6lN3sRegEgL8U7GpfEbL2byUM1Y
   A==;
X-CSE-ConnectionGUID: 5F/E3f8dQNiVGg2UzmuqAg==
X-CSE-MsgGUID: +mw6SbhvQLqVBffFubyB3A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721377"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:50:03 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:26164]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 4601986b-18d6-45ee-8270-76dba3472325; Thu, 12 Feb 2026 02:50:02 +0000 (UTC)
X-Farcaster-Flow-ID: 4601986b-18d6-45ee-8270-76dba3472325
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:01 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:01 +0000
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
Subject: [PATCH 010/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SIG2 crypto
Date: Thu, 12 Feb 2026 02:45:46 +0000
Message-ID: <20260212024725.11264-11-wanjay@amazon.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11155-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04F6C1295D2
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SIG2-related crypto to convert them into pluggable
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
 crypto/fips140/fips140-api.c  | 16 ++++++++++++++++
 include/crypto/internal/sig.h | 12 +++++-------
 include/crypto/sig.h          |  3 ++-
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 7d55be467108..2e722f7961d4 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -34,7 +34,7 @@ crypto_hash-y += shash.o
 crypto-objs-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 
 crypto-objs-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
-obj-$(CONFIG_CRYPTO_SIG2) += sig.o
+crypto-objs-$(CONFIG_CRYPTO_SIG2) += sig.o
 obj-$(CONFIG_CRYPTO_KPP2) += kpp.o
 obj-$(CONFIG_CRYPTO_HKDF) += hkdf.o
 
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 8d4d07060d86..c97806cfdd05 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -270,4 +270,20 @@ DEFINE_CRYPTO_API_STUB(akcipher_register_instance);
 DEFINE_CRYPTO_API_STUB(crypto_akcipher_sync_encrypt);
 DEFINE_CRYPTO_API_STUB(crypto_akcipher_sync_decrypt);
 
+#endif
+
+/*
+ * crypto/sig.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SIG2)
+
+#include <crypto/sig.h>
+#include <crypto/internal/sig.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alloc_sig);
+DEFINE_CRYPTO_API_STUB(crypto_register_sig);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_sig);
+DEFINE_CRYPTO_API_STUB(sig_register_instance);
+DEFINE_CRYPTO_API_STUB(crypto_grab_sig);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/internal/sig.h b/include/crypto/internal/sig.h
index b16648c1a986..51d3a617c00d 100644
--- a/include/crypto/internal/sig.h
+++ b/include/crypto/internal/sig.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_INTERNAL_SIG_H
 #define _CRYPTO_INTERNAL_SIG_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <crypto/sig.h>
 
@@ -39,7 +40,7 @@ static inline void *crypto_sig_ctx(struct crypto_sig *tfm)
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_register_sig(struct sig_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, crypto_register_sig, int, (struct sig_alg *alg), (alg));
 
 /**
  * crypto_unregister_sig() -- Unregister public key signature algorithm
@@ -48,10 +49,9 @@ int crypto_register_sig(struct sig_alg *alg);
  *
  * @alg:	algorithm definition
  */
-void crypto_unregister_sig(struct sig_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, crypto_unregister_sig, void, (struct sig_alg *alg), (alg));
 
-int sig_register_instance(struct crypto_template *tmpl,
-			  struct sig_instance *inst);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, sig_register_instance, int, (struct crypto_template *tmpl, struct sig_instance *inst), (tmpl, inst));
 
 static inline struct sig_instance *sig_instance(struct crypto_instance *inst)
 {
@@ -74,9 +74,7 @@ static inline void *sig_instance_ctx(struct sig_instance *inst)
 	return crypto_instance_ctx(sig_crypto_instance(inst));
 }
 
-int crypto_grab_sig(struct crypto_sig_spawn *spawn,
-		    struct crypto_instance *inst,
-		    const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, crypto_grab_sig, int, (struct crypto_sig_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask), (spawn, inst, name, type, mask));
 
 static inline struct crypto_sig *crypto_spawn_sig(struct crypto_sig_spawn
 								   *spawn)
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index fa6dafafab3f..1b0595b3b245 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_SIG_H
 #define _CRYPTO_SIG_H
 
+#include <crypto/api.h>
 #include <linux/crypto.h>
 
 /**
@@ -91,7 +92,7 @@ struct sig_alg {
  * Return: allocated handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_sig *crypto_alloc_sig(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, crypto_alloc_sig, struct crypto_sig *, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_sig_tfm(struct crypto_sig *tfm)
 {
-- 
2.47.3


