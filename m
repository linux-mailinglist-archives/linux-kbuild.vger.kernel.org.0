Return-Path: <linux-kbuild+bounces-11225-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAJRKh9EjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11225-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:08:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 232A0129C7D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19CAF300E273
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBAC22AE45;
	Thu, 12 Feb 2026 03:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="bjoHl2cE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5323EBF36;
	Thu, 12 Feb 2026 03:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865691; cv=none; b=p0DZekRHmoCL21BANPap812U9odJd7TgN8KdyfdwwrAauABl3Og5tZCmSpb7E6/3wxj3D2O1Ab+vMLYtnt6mrnqwUSP6aTvVONDjZ7HDrfcG1KaFfV61/xFZAgS1vNgUpwN7Gn0FsKZxgApZMa1QdF5IbHKkdszeIdbBykny4Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865691; c=relaxed/simple;
	bh=/9Y+4rNknnT1fTkLKA7ic8zwX3E8TT9DFgqLN9D/ZI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LI3Y8H2mNLHahJ1TSi914KpeNTr0+dOsSCBcy/xk+xyh1v6cN52WwM1AeM0+/kr/GCY+S0FhWEqPV520WHxuCchKgsIKEeMyh/j1wudbfvkoUnHgIqCLogYgXsudpefmr6GjKIrfrxVv326PAK79Lvn8HeN+O6gvkxR02KI1LC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=bjoHl2cE; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865690; x=1802401690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q6QqEkBL7DgFsxQZDQrwC/3ZGjpQLYXS1PTCxfCJq3I=;
  b=bjoHl2cECDeHQgcPAaOPjzEfdL+xgmS3Cyoj95hOzTUXE5wY7WT31LVG
   Vqfc69Lbm2oKSqepY28hQMzk6azYW5PyzUHgFlgsthAp2PpfqbZdMtj8D
   cj8ZR2sqaDaTbh+4rSr6J0Oo8+o/gdPrfrWbuJdCAAqq6DHkgntEFKHLm
   DtbQNGmpK+RSWlpaNWPPSg26s446YfKm84uNzzID/xpgaiB21BB5otL0Y
   Ino0jhuZEl9otiySf16npDOELD+KA8h7OfED7sl7Ibpz3A2UOjKlBmGEr
   tYvUZALQ0S43++SsKmG/btHXscMPJW6IT48gxCYa0C5r5/xS5hd10Ri6w
   A==;
X-CSE-ConnectionGUID: IJnGLnGSS2uS35ymSHEjsA==
X-CSE-MsgGUID: uh6X7aJgRYqtNT60kNNJnw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913987"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:08:09 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:1536]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id a8ce263f-2af6-42be-aaea-cdcc071f605a; Thu, 12 Feb 2026 03:08:09 +0000 (UTC)
X-Farcaster-Flow-ID: a8ce263f-2af6-42be-aaea-cdcc071f605a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:09 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:08 +0000
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
Subject: [PATCH 080/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_KRB5ENC crypto
Date: Thu, 12 Feb 2026 02:46:56 +0000
Message-ID: <20260212024725.11264-81-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D042UWB003.ant.amazon.com (10.13.139.135) To
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
	TAGGED_FROM(0.00)[bounces-11225-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 232A0129C7D
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_KRB5ENC-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/fips140/fips140-api.c | 10 ++++++++++
 crypto/krb5enc.c             |  4 ++--
 include/crypto/authenc.h     |  6 ++++--
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 6d332c55fd4e..61fdf39dc1ec 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -156,7 +156,7 @@ crc32c-cryptoapi-y := crc32c.o
 crypto-objs-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
 crc32-cryptoapi-y := crc32.o
 crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
-obj-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
+crypto-objs-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
 crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
 obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index e6d2e3680792..70b57939c753 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -775,3 +775,13 @@ DEFINE_CRYPTO_API_STUB(aria_encrypt);
 DEFINE_CRYPTO_API_STUB(aria_decrypt);
 
 #endif
+/*
+ * crypto/krb5enc.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_KRB5ENC)
+
+#include <crypto/authenc.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_krb5enc_extractkeys);
+
+#endif
diff --git a/crypto/krb5enc.c b/crypto/krb5enc.c
index a1de55994d92..5688f8916fd0 100644
--- a/crypto/krb5enc.c
+++ b/crypto/krb5enc.c
@@ -496,8 +496,8 @@ static void __exit crypto_krb5enc_module_exit(void)
 	crypto_unregister_template(&crypto_krb5enc_tmpl);
 }
 
-module_init(crypto_krb5enc_module_init);
-module_exit(crypto_krb5enc_module_exit);
+crypto_module_init(crypto_krb5enc_module_init);
+crypto_module_exit(crypto_krb5enc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Simple AEAD wrapper for Kerberos 5 RFC3961");
diff --git a/include/crypto/authenc.h b/include/crypto/authenc.h
index 4871b7bdcd8e..710e0976b295 100644
--- a/include/crypto/authenc.h
+++ b/include/crypto/authenc.h
@@ -30,7 +30,9 @@ struct crypto_authenc_keys {
 DECLARE_CRYPTO_API(CONFIG_CRYPTO_AUTHENC, crypto_authenc_extractkeys, int,
 	(struct crypto_authenc_keys *keys, const u8 *key, unsigned int keylen),
 	(keys, key, keylen));
-int crypto_krb5enc_extractkeys(struct crypto_authenc_keys *keys, const u8 *key,
-			       unsigned int keylen);
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5ENC, crypto_krb5enc_extractkeys, int,
+	(struct crypto_authenc_keys *keys, const u8 *key, unsigned int keylen),
+	(keys, key, keylen));
 
 #endif	/* _CRYPTO_AUTHENC_H */
-- 
2.47.3


