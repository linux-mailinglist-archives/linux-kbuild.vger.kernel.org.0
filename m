Return-Path: <linux-kbuild+bounces-11171-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFnKKdhAjWn00QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11171-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:54:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36261129751
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 246973024A11
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A815221554;
	Thu, 12 Feb 2026 02:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mJY1wouJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F28C1F;
	Thu, 12 Feb 2026 02:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864852; cv=none; b=TII2pC5ylSXsgumimA0rfF5cFOmHjHoLhc591KF8IoRbNRjFq47P9fugcSF6nqyXRKcwusrh3/eumN3AGxwMgi4oGdXJxON7XkqaK4LonhlCf/XJQRBxXiBJJcFMGyI0WfU/2A+OBuYuwFROg1GniXBDY7kKPfC9NyBkm4jQEzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864852; c=relaxed/simple;
	bh=0NNH6ugZoxsiKPhXA+FpTHwZLDh8HBTmsYxFHERWY4I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgvHytzAw0y69zoeWy548ZZJZKeYA9gTKfQxG+umwlxazHKXCp/VFh6fMoV+iPeS0LmvFw2LkWqNezkJs13CJ8UUlpHge+Zd+TyKmKfOG9OK25OlJeWkwXRWjw60pl2EakTNGYho1rRg5nV9gIGAb4j0tg/UXhcE9YuV8WQrAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mJY1wouJ; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864851; x=1802400851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dd1i966UbHbohsXYyD1lNX8OHFyJUWZHZw+gT8gzz8E=;
  b=mJY1wouJgY64U2Kz2I96od9K5m+Fl+2GcXApIN4/hn5AqwrC7RiWdTFS
   zPU2EpTrDbFBYMCNmulIoQy9LDBybUA48LFtPWA2y2d6pKHD0fEGAc4D+
   WZxWIBzYAxKHkMNOKmR1ouuQkkpbcJj0g/uzINe8aaXxbPN6PCabq/lxX
   hopCSzXN7ALA5kOzfdprp3b5J4Daklo1UPQUWj8f/M5I6D7MK6Wu1b9J5
   5wncuxAdHsA6sQMRuXu7D0b+siNuMNnlhPSnyXYR2Rpclwz8RZgVuEKo6
   M0mGWu+ZTTlJjwBn9A6/VUgM6wuI5n+Xb+fjcxrH67u6ixUBQEaf+x8+v
   Q==;
X-CSE-ConnectionGUID: bygMv3X3R4mAvly89Y+CJg==
X-CSE-MsgGUID: GIi41z0gQ6eiF61t1qCmUg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914350"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:54:10 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:11353]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 6f3e2035-981b-466a-8912-97bec792f14e; Thu, 12 Feb 2026 02:54:10 +0000 (UTC)
X-Farcaster-Flow-ID: 6f3e2035-981b-466a-8912-97bec792f14e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:10 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:09 +0000
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
Subject: [PATCH 026/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AUTHENC crypto
Date: Thu, 12 Feb 2026 02:46:02 +0000
Message-ID: <20260212024725.11264-27-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D043UWA003.ant.amazon.com (10.13.139.31) To
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
	TAGGED_FROM(0.00)[bounces-11171-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,secunet.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36261129751
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_AUTHENC-related crypto to convert them into pluggable
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
 crypto/authenc.c             |  4 ++--
 crypto/authencesn.c          |  4 ++--
 crypto/fips140/fips140-api.c | 12 ++++++++++++
 include/crypto/authenc.h     |  6 ++++--
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 9dc0d5d55eaa..3a2da61b4581 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -155,7 +155,7 @@ obj-$(CONFIG_CRYPTO_CRC32C) += crc32c-cryptoapi.o
 crc32c-cryptoapi-y := crc32c.o
 obj-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
 crc32-cryptoapi-y := crc32.o
-obj-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
+crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 obj-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
 obj-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
diff --git a/crypto/authenc.c b/crypto/authenc.c
index ac679ce2cb95..132c30d75165 100644
--- a/crypto/authenc.c
+++ b/crypto/authenc.c
@@ -446,8 +446,8 @@ static void __exit crypto_authenc_module_exit(void)
 	crypto_unregister_template(&crypto_authenc_tmpl);
 }
 
-module_init(crypto_authenc_module_init);
-module_exit(crypto_authenc_module_exit);
+crypto_module_init(crypto_authenc_module_init);
+crypto_module_exit(crypto_authenc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Simple AEAD wrapper for IPsec");
diff --git a/crypto/authencesn.c b/crypto/authencesn.c
index 542a978663b9..6279d877a95a 100644
--- a/crypto/authencesn.c
+++ b/crypto/authencesn.c
@@ -439,8 +439,8 @@ static void __exit crypto_authenc_esn_module_exit(void)
 	crypto_unregister_template(&crypto_authenc_esn_tmpl);
 }
 
-module_init(crypto_authenc_esn_module_init);
-module_exit(crypto_authenc_esn_module_exit);
+crypto_module_init(crypto_authenc_esn_module_init);
+crypto_module_exit(crypto_authenc_esn_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Steffen Klassert <steffen.klassert@secunet.com>");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 77ed24a3cd3b..3cfe147b984c 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -379,4 +379,16 @@ DEFINE_CRYPTO_API_STUB(alg_test);
 
 #undef md5_zero_message_hash
 DEFINE_CRYPTO_VAR_STUB(md5_zero_message_hash);
+
+#endif
+
+/*
+ * crypto/authenc.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_AUTHENC)
+
+#include <crypto/authenc.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_authenc_extractkeys);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/authenc.h b/include/crypto/authenc.h
index 15a9caa2354a..4871b7bdcd8e 100644
--- a/include/crypto/authenc.h
+++ b/include/crypto/authenc.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_AUTHENC_H
 #define _CRYPTO_AUTHENC_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 
 enum {
@@ -26,8 +27,9 @@ struct crypto_authenc_keys {
 	unsigned int enckeylen;
 };
 
-int crypto_authenc_extractkeys(struct crypto_authenc_keys *keys, const u8 *key,
-			       unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AUTHENC, crypto_authenc_extractkeys, int,
+	(struct crypto_authenc_keys *keys, const u8 *key, unsigned int keylen),
+	(keys, key, keylen));
 int crypto_krb5enc_extractkeys(struct crypto_authenc_keys *keys, const u8 *key,
 			       unsigned int keylen);
 
-- 
2.47.3


