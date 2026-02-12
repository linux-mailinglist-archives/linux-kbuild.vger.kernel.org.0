Return-Path: <linux-kbuild+bounces-11157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNb4CgBAjWna0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11157-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:50:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A34EC129600
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C7F030234C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041A821FF35;
	Thu, 12 Feb 2026 02:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="H9L/7Mac"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB568C1F;
	Thu, 12 Feb 2026 02:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864634; cv=none; b=DmsX+wr+jAg/lAp5i687EkUBcDZCU27fnmx92rKEOA0gYH3vqM9mhZyEDngt6OCCEXWNzwqZ3HZ+v8cLHLODUX2o0Bjx0ajAIUivcPvGK9Rn8Uw1vGjGMNAjbikMQlkWDZ1topHG3uN0a8MbwDV/VTEJ69iogbFxbZ+1/paj7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864634; c=relaxed/simple;
	bh=zw/wmI+gen1A+K+S4WL5QAyYz1Q16KXuNz6ptaVRzPA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRWe0LPyV8ZIdK316oqE+kft/hajjefuhxjKT6a8VUanLyWO+WpMr9e58bkT0LMtNFAYA1ZvnXNb110RlcdNL+K8ewqRla2P4Wx5Gdvfa+IFLkpijVMnRLJ0NONVDVaraCVRuhPZAAPlAquy3YMoIpEmj9jBdbmBzzSby1TWJmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=H9L/7Mac; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864633; x=1802400633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B2QGhhwgO9GU4JuAgmE7Qr14C7r7lixkHMTZvpvG73M=;
  b=H9L/7MacWsdm9pFx+cQvhRp/sjAOIcetNt/7efxqiYKGbri7H0zWy+qQ
   Q4u2az4l28EZg7iSUDflO1W32bfOsd0nFoVHMAcpwPmaOf1eWXjgi7ugw
   rggXN4/6TPTIthH/jwFIna0qKcFzxmim8Ewj0ZxjuSOmQE5f9kX8m1pK/
   36mbNFmlq7a27jh0Wx+D0IwRTG13Md5U5XTqqzcNpNbkZxsdjZ2zVVuUR
   wvlYNZ/RSsLxy+62sthM5jveBY54qr/EmEn9oMlnDQ9DtJgCeD6+cJftw
   5BhC81ZqlbAu6lQZL/mxq/O2mn6JabdplfOajsA2TL4OluMl2vePrZWJ9
   Q==;
X-CSE-ConnectionGUID: C46VZ+2USWCaG1DS5W6CjA==
X-CSE-MsgGUID: pfk2Fw++Q1eex6s2lT6Dxg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12917593"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:50:33 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:29396]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 24755a17-82cc-4341-9c1e-604ecd8bb02b; Thu, 12 Feb 2026 02:50:33 +0000 (UTC)
X-Farcaster-Flow-ID: 24755a17-82cc-4341-9c1e-604ecd8bb02b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:33 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:32 +0000
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
Subject: [PATCH 012/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_RSA crypto
Date: Thu, 12 Feb 2026 02:45:48 +0000
Message-ID: <20260212024725.11264-13-wanjay@amazon.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11157-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: A34EC129600
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_RSA-related crypto to convert them into pluggable
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
 crypto/fips140/fips140-api.c  | 12 ++++++++++++
 crypto/rsa.c                  |  4 ++--
 include/crypto/internal/rsa.h |  7 +++----
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 21197857ad7d..3e12b556bfa7 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -52,7 +52,7 @@ rsa_generic-y += rsa.o
 rsa_generic-y += rsa_helper.o
 rsa_generic-y += rsa-pkcs1pad.o
 rsa_generic-y += rsassa-pkcs1.o
-obj-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
+crypto-objs-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
 
 $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature.asn1.h
 $(obj)/ecdsa-x962.o: $(obj)/ecdsasignature.asn1.h
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 50603e7a8bb0..d10eded6b61e 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -303,4 +303,16 @@ DEFINE_CRYPTO_API_STUB(crypto_register_kpp);
 DEFINE_CRYPTO_API_STUB(crypto_unregister_kpp);
 DEFINE_CRYPTO_API_STUB(kpp_register_instance);
 
+#endif
+
+/*
+ * crypto/rsa_helper.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_RSA)
+
+#include <crypto/internal/rsa.h>
+
+DEFINE_CRYPTO_API_STUB(rsa_parse_pub_key);
+DEFINE_CRYPTO_API_STUB(rsa_parse_priv_key);
+
 #endif
\ No newline at end of file
diff --git a/crypto/rsa.c b/crypto/rsa.c
index 6c7734083c98..44eef74ebad8 100644
--- a/crypto/rsa.c
+++ b/crypto/rsa.c
@@ -430,8 +430,8 @@ static void __exit rsa_exit(void)
 	crypto_unregister_akcipher(&rsa);
 }
 
-module_init(rsa_init);
-module_exit(rsa_exit);
+crypto_module_init(rsa_init);
+crypto_module_exit(rsa_exit);
 MODULE_ALIAS_CRYPTO("rsa");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("RSA generic algorithm");
diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.h
index 071a1951b992..3d8fe098eaae 100644
--- a/include/crypto/internal/rsa.h
+++ b/include/crypto/internal/rsa.h
@@ -7,6 +7,7 @@
  */
 #ifndef _RSA_HELPER_
 #define _RSA_HELPER_
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <crypto/akcipher.h>
 
@@ -48,11 +49,9 @@ struct rsa_key {
 	size_t qinv_sz;
 };
 
-int rsa_parse_pub_key(struct rsa_key *rsa_key, const void *key,
-		      unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RSA, rsa_parse_pub_key, int, (struct rsa_key *rsa_key, const void *key, unsigned int key_len), (rsa_key, key, key_len));
 
-int rsa_parse_priv_key(struct rsa_key *rsa_key, const void *key,
-		       unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RSA, rsa_parse_priv_key, int, (struct rsa_key *rsa_key, const void *key, unsigned int key_len), (rsa_key, key, key_len));
 
 #define RSA_PUB (true)
 #define RSA_PRIV (false)
-- 
2.47.3


