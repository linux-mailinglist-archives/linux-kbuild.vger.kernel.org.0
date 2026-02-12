Return-Path: <linux-kbuild+bounces-11182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL51OoRBjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11182-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:57:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDF8129851
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C47A3025A52
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D6D2222C0;
	Thu, 12 Feb 2026 02:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="n+SeREMA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0517221FBA;
	Thu, 12 Feb 2026 02:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865023; cv=none; b=ggoZptmcBTMyn5j0pZHfbN0O36V9MeEXcMataZoR3MceRktq5uKgelmV2Ft1HwGv9rW1zbdJb6AZYu6+cPC4DDH8ziO+rQQP6o870MIlHq+RKOahT+R8BT1ND4Zgr64EIKptEbgwQoA1500FunO5RwvdU6s1QTH/QquJO2bftTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865023; c=relaxed/simple;
	bh=dSLw6YHRuxz2cJYs5hrFvL8dgMS1T9FMypW4ebTTEFs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q8OPIBDAnqlV0edKxKuZUyKyNiSSwAQvQ/01YS/LuGjlyJ4WYCItsnE/LUD/Y5jvRhp3vWQVcIFE9L0yp493FCzrfRV5aKu9qEpDi2rtn3e7O4jeX5vedmE8DajJZTaLV9ZIdEBZR9VmzD4voX6pQkoHtttWw9CAMSTmNRjeRIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=n+SeREMA; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865022; x=1802401022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cmeYz5qWEvxPRrYbBGIa1zZYcjyr1kNfHJJ7PterXgM=;
  b=n+SeREMAhCYiwAGO83qY8ljJWxTvh+iau1jGIpYSflqbkoFDYwrVQIER
   oKCygza5B9U9zV9ZDddL3dSijmRSeMSX7ZrXhNaHwg71zKnkQpBoBk0n4
   GxFEYJHB5AgBZtj4nx30b4E1RPhn7FXobXfVOf/TewtR1Ta6lkQgkeZKY
   wIIhlXlmoN8RTKmp8S7+ISBfnzKbC8Yvxtyg8SxOn3A64yXqj79o+6P80
   sTPXWT2TRMWmDBLmK8Ud7MRg1j4FwvO+90PFQ4ixQfAanW7dYEj6KWoDF
   wmVWddTfTWUisDFI4e0GFlNYxdNd3PyoTNWhVbfImb1lLX06jy9gvbOpA
   g==;
X-CSE-ConnectionGUID: 4KkKxyivTOSrf8cymaSnRA==
X-CSE-MsgGUID: bzQllJsfR56CXTjZvNSsog==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721709"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:57:02 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:29620]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 7781a320-cc77-46ad-bc1a-d0ac18add058; Thu, 12 Feb 2026 02:57:02 +0000 (UTC)
X-Farcaster-Flow-ID: 7781a320-cc77-46ad-bc1a-d0ac18add058
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:57:00 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:57:00 +0000
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
Subject: [PATCH 037/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_HKDF crypto
Date: Thu, 12 Feb 2026 02:46:13 +0000
Message-ID: <20260212024725.11264-38-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D044UWA003.ant.amazon.com (10.13.139.43) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11182-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CDF8129851
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_HKDF-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/fips140/fips140-api.c | 22 ++++++++++++++++++++++
 crypto/hkdf.c                |  4 ++--
 include/crypto/hkdf.h        | 13 +++++++------
 4 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index f2b9532a0320..42b45a8941b4 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -36,7 +36,7 @@ crypto-objs-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 crypto-objs-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
 crypto-objs-$(CONFIG_CRYPTO_SIG2) += sig.o
 crypto-objs-$(CONFIG_CRYPTO_KPP2) += kpp.o
-obj-$(CONFIG_CRYPTO_HKDF) += hkdf.o
+crypto-objs-$(CONFIG_CRYPTO_HKDF) += hkdf.o
 
 dh_generic-y := dh.o
 dh_generic-y += dh_helper.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 05ada434d1ac..8db92603bd59 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -565,4 +565,26 @@ DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_skcipher);
 DEFINE_CRYPTO_API_STUB(crypto_engine_register_skciphers);
 DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_skciphers);
 
+#endif
+/*
+ * crypto/hkdf.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_HKDF)
+
+#include <crypto/hkdf.h>
+
+DEFINE_CRYPTO_API_STUB(hkdf_extract);
+DEFINE_CRYPTO_API_STUB(hkdf_expand);
+
+#endif
+/*
+ * crypto/hkdf.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_HKDF)
+
+#include <crypto/hkdf.h>
+
+DEFINE_CRYPTO_API_STUB(hkdf_extract);
+DEFINE_CRYPTO_API_STUB(hkdf_expand);
+
 #endif
\ No newline at end of file
diff --git a/crypto/hkdf.c b/crypto/hkdf.c
index 82d1b32ca6ce..c779353be68f 100644
--- a/crypto/hkdf.c
+++ b/crypto/hkdf.c
@@ -566,8 +566,8 @@ static int __init crypto_hkdf_module_init(void)
 
 static void __exit crypto_hkdf_module_exit(void) {}
 
-late_initcall(crypto_hkdf_module_init);
-module_exit(crypto_hkdf_module_exit);
+crypto_late_initcall(crypto_hkdf_module_init);
+crypto_module_exit(crypto_hkdf_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("HMAC-based Key Derivation Function (HKDF)");
diff --git a/include/crypto/hkdf.h b/include/crypto/hkdf.h
index 6a9678f508f5..8253aa2e004c 100644
--- a/include/crypto/hkdf.h
+++ b/include/crypto/hkdf.h
@@ -9,12 +9,13 @@
 #ifndef _CRYPTO_HKDF_H
 #define _CRYPTO_HKDF_H
 
+#include <crypto/api.h>
 #include <crypto/hash.h>
 
-int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
-		 unsigned int ikmlen, const u8 *salt, unsigned int saltlen,
-		 u8 *prk);
-int hkdf_expand(struct crypto_shash *hmac_tfm,
-		const u8 *info, unsigned int infolen,
-		u8 *okm, unsigned int okmlen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HKDF, hkdf_extract, int,
+	(struct crypto_shash *hmac_tfm, const u8 *ikm, unsigned int ikmlen, const u8 *salt, unsigned int saltlen, u8 *prk),
+	(hmac_tfm, ikm, ikmlen, salt, saltlen, prk));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HKDF, hkdf_expand, int,
+	(struct crypto_shash *hmac_tfm, const u8 *info, unsigned int infolen, u8 *okm, unsigned int okmlen),
+	(hmac_tfm, info, infolen, okm, okmlen));
 #endif
-- 
2.47.3


