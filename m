Return-Path: <linux-kbuild+bounces-11236-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCYPHMhEjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11236-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:11:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBBE129D89
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 912AD306FF63
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066BB23184A;
	Thu, 12 Feb 2026 03:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="H4Tsp3/4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA5E55C;
	Thu, 12 Feb 2026 03:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865861; cv=none; b=HPm3bsiCVfCCMWt+ic2WiJ+dz99K1cVdksgZdnsTO0oduZTEZjAVI2c0GrxfI7li2bJCmVjxh91EK83LKyKWQLzNz29+ASGH8KxHU3nLlVJ2TwlGWNpqxbTt62joLbo6Dz7MscDfcqteY3ozpFL/cYlJF0ecTqEKViXOtyD/cr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865861; c=relaxed/simple;
	bh=ctChQyQpkoGFd//uh9Z05NooxiUkc7yV8IHn2dE2zNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=elw0G8KTjc7RK1Q0t+JgybDxRTr9rhbu4tnXYPkVgPsreylPSU/yZHA5BJceSNJGSRMatHMP1fbRJ3EMnunZSG3LA3W5GsoHKK5hL1KJxmRyzXY7Om519ARK1VVPRL6ZCMRzHVq2stuP4OBtajw94dljqwYVJZBZ939nu8epzDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=H4Tsp3/4; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865860; x=1802401860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D8bcaqST4sT4ka4W2kdwlqwU26a79PQUu0UVPZFgKms=;
  b=H4Tsp3/4tWMbZdYau58I51wH38A/UiIG3ovBGQ2mQpUdlbi1UUcpV61Y
   9SJUYeG79rUSw1ujyqyLLzk2/BP/Oer0xs4y/30Bf5pibvWBaymXsY+mi
   C0jJlU6b1BKM7zwJVU+xkKygU6juaDFp3C9Q5ZDIXG90GLgLV9LnZrTBu
   MhjSO55qBT2pJs7B9/YXafR9/9OoHnIvao/7bHbP/kwOljz5MDWMzU3Dx
   pNKId0BZE6d9WS72PV7hd1ZZgQ1KaIlgpmrv9KiD7fzHx3RLWmFHGn4Q7
   kBqzUI0w7IRdlycPIpSWmCBM6cWfMsoFtH0M48xLmLBFGzUmJyDZ16bZQ
   Q==;
X-CSE-ConnectionGUID: /MRZWbgRRSeXxs1knJCqwA==
X-CSE-MsgGUID: L/0FLelGS0CSfdWWfo/LRA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918811"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:11:00 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:14512]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 3015654e-2db3-4441-95bf-57da6a2d7a1a; Thu, 12 Feb 2026 03:11:00 +0000 (UTC)
X-Farcaster-Flow-ID: 3015654e-2db3-4441-95bf-57da6a2d7a1a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:00 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:59 +0000
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
Subject: [PATCH 091/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ECDH crypto
Date: Thu, 12 Feb 2026 02:47:07 +0000
Message-ID: <20260212024725.11264-92-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWA003.ant.amazon.com (10.13.139.42) To
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
	TAGGED_FROM(0.00)[bounces-11236-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFBBE129D89
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ECDH-related crypto to convert them into pluggable
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
 crypto/Makefile              |  2 +-
 crypto/ecdh.c                |  4 ++--
 crypto/fips140/fips140-api.c | 12 ++++++++++++
 include/crypto/ecdh.h        | 14 +++++++++++---
 4 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3247d53c1fc6..cdc74dcea2f1 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -183,7 +183,7 @@ crypto-objs-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
-obj-$(CONFIG_CRYPTO_ECDH) += ecdh_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ECDH) += ecdh_generic.o
 
 $(obj)/ecrdsa_params.asn1.o: $(obj)/ecrdsa_params.asn1.c $(obj)/ecrdsa_params.asn1.h
 $(obj)/ecrdsa_pub_key.asn1.o: $(obj)/ecrdsa_pub_key.asn1.c $(obj)/ecrdsa_pub_key.asn1.h
diff --git a/crypto/ecdh.c b/crypto/ecdh.c
index 9f0b93b3166d..32c98cebfda6 100644
--- a/crypto/ecdh.c
+++ b/crypto/ecdh.c
@@ -240,8 +240,8 @@ static void __exit ecdh_exit(void)
 	crypto_unregister_kpp(&ecdh_nist_p384);
 }
 
-module_init(ecdh_init);
-module_exit(ecdh_exit);
+crypto_module_init(ecdh_init);
+crypto_module_exit(ecdh_exit);
 MODULE_ALIAS_CRYPTO("ecdh");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("ECDH generic algorithm");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 70b57939c753..298ab496a395 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -785,3 +785,15 @@ DEFINE_CRYPTO_API_STUB(aria_decrypt);
 DEFINE_CRYPTO_API_STUB(crypto_krb5enc_extractkeys);
 
 #endif
+/*
+ * crypto/ecdh_helper.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ECDH)
+
+#include <crypto/ecdh.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_ecdh_key_len);
+DEFINE_CRYPTO_API_STUB(crypto_ecdh_encode_key);
+DEFINE_CRYPTO_API_STUB(crypto_ecdh_decode_key);
+
+#endif
\ No newline at end of file
diff --git a/include/crypto/ecdh.h b/include/crypto/ecdh.h
index 9784ecdd2fb4..03d54f531ca2 100644
--- a/include/crypto/ecdh.h
+++ b/include/crypto/ecdh.h
@@ -8,6 +8,8 @@
 #ifndef _CRYPTO_ECDH_
 #define _CRYPTO_ECDH_
 
+#include <crypto/api.h>
+
 /**
  * DOC: ECDH Helper Functions
  *
@@ -49,7 +51,9 @@ struct ecdh {
  *
  * Return: size of the key in bytes
  */
-unsigned int crypto_ecdh_key_len(const struct ecdh *params);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECDH, crypto_ecdh_key_len, unsigned int,
+	(const struct ecdh *params),
+	(params));
 
 /**
  * crypto_ecdh_encode_key() - encode the private key
@@ -64,7 +68,9 @@ unsigned int crypto_ecdh_key_len(const struct ecdh *params);
  *
  * Return:	-EINVAL if buffer has insufficient size, 0 on success
  */
-int crypto_ecdh_encode_key(char *buf, unsigned int len, const struct ecdh *p);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECDH, crypto_ecdh_encode_key, int,
+	(char *buf, unsigned int len, const struct ecdh *p),
+	(buf, len, p));
 
 /**
  * crypto_ecdh_decode_key() - decode a private key
@@ -78,6 +84,8 @@ int crypto_ecdh_encode_key(char *buf, unsigned int len, const struct ecdh *p);
  *
  * Return:	-EINVAL if buffer has insufficient size, 0 on success
  */
-int crypto_ecdh_decode_key(const char *buf, unsigned int len, struct ecdh *p);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECDH, crypto_ecdh_decode_key, int,
+	(const char *buf, unsigned int len, struct ecdh *p),
+	(buf, len, p));
 
 #endif
-- 
2.47.3


