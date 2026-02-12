Return-Path: <linux-kbuild+bounces-11221-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kONPGeNDjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11221-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:07:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA5129C2B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 208AD3007AD2
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B8222AE45;
	Thu, 12 Feb 2026 03:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="fA6vz38K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23222A4D8;
	Thu, 12 Feb 2026 03:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865628; cv=none; b=GkcjiMzdbOzOhuUxXLdXHsjnnttVbtUyogqpiaVv121mdSLGyfwvvjrv5fKZvy/K0uFNim8gM3skod/V5mY2SxDO4/WcTCgwk3fCH0VRW9IrdPtdBJ9/hrr9C7WB87DkFmLapGpXUyXepmAzFoy87RQWXEAIs7wd8EuQ8ca6iN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865628; c=relaxed/simple;
	bh=F2MQDDODL5sAu5Z0zXnvzzBLu9XeUE62bQqR+T5gd04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l78S3+YICxcGv35pFOEp8IvI6hwwkuiJRVXrrBKy5cBSmqiNZJNuncBrMIZB8mLw2CsX5Sf0hF2p7cYUPj6M+zsaNalitLfA9gC0goUbAKeOmWxYMc2M+7dtbrlQpILdY1607ymir3D0rJqhpVSvDcx06riF/dKZRei0oUshNzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=fA6vz38K; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865627; x=1802401627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NWVnzMKqZwXb7ujBa879sgo4S8DJVmDQ4KTRf7FzagM=;
  b=fA6vz38KJ/3HY9cek+uPdNv6aTH+9Wvc2obWzmh7zjaRpatoBrs1ul+I
   L3SYXvkqnyduO+ZgPairFNBj7p5hqiW7L8WwiNYsftSwZziJNDyz7T5UU
   CzsItJFK9wRxW6pl/R4UXTPEywkUgS5DzRhtj0L6lg2ZzgSLunS+6u5ad
   Mw6dPUm7nXOwOD6Dp4EYT7DVgghmMR9kwNFMWCIbkPC7H2fi0EHt1XHNW
   sXh/hFsZXuqgfugbah/lDKvY81yd4ros9LZWyWbv2fcrk6ZoWHoQ0QJEu
   B9J09pVhMLnEUVFDyJ0uXPy4FeSgoD21o8EXlarMGZEoCodU4YgomgeD0
   w==;
X-CSE-ConnectionGUID: LA2eZqqUSUK3tEPKrZtTWQ==
X-CSE-MsgGUID: I9l+eu1OSQKwsbiU+7WrUA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12698784"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:07:07 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:18877]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id 60bdb2f2-d74a-43cf-840a-82c272fcc309; Thu, 12 Feb 2026 03:07:07 +0000 (UTC)
X-Farcaster-Flow-ID: 60bdb2f2-d74a-43cf-840a-82c272fcc309
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:06 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:06 +0000
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
Subject: [PATCH 076/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ARIA crypto
Date: Thu, 12 Feb 2026 02:46:52 +0000
Message-ID: <20260212024725.11264-77-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D039UWA002.ant.amazon.com (10.13.139.32) To
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
	TAGGED_FROM(0.00)[bounces-11221-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBEA5129C2B
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ARIA-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/aria_generic.c        |  4 ++--
 crypto/fips140/fips140-api.c | 12 ++++++++++++
 include/crypto/aria.h        | 16 ++++++++++++----
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3e515caa72f5..c7dcc0e55325 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -146,7 +146,7 @@ crypto-objs-$(CONFIG_CRYPTO_TEA) += tea.o
 crypto-objs-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 crypto-objs-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
 crypto-objs-$(CONFIG_CRYPTO_SEED) += seed.o
-obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
diff --git a/crypto/aria_generic.c b/crypto/aria_generic.c
index faa7900383f6..7a66ae96312a 100644
--- a/crypto/aria_generic.c
+++ b/crypto/aria_generic.c
@@ -304,8 +304,8 @@ static void __exit aria_fini(void)
 	crypto_unregister_alg(&aria_alg);
 }
 
-module_init(aria_init);
-module_exit(aria_fini);
+crypto_module_init(aria_init);
+crypto_module_exit(aria_fini);
 
 MODULE_DESCRIPTION("ARIA Cipher Algorithm");
 MODULE_LICENSE("GPL");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index e20c9601637a..e6d2e3680792 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -763,3 +763,15 @@ DEFINE_CRYPTO_API_STUB(af_alg_alloc_areq);
 DEFINE_CRYPTO_API_STUB(af_alg_get_rsgl);
 
 #endif
+/*
+ * crypto/aria_generic.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ARIA)
+
+#include <crypto/aria.h>
+
+DEFINE_CRYPTO_API_STUB(aria_set_key);
+DEFINE_CRYPTO_API_STUB(aria_encrypt);
+DEFINE_CRYPTO_API_STUB(aria_decrypt);
+
+#endif
diff --git a/include/crypto/aria.h b/include/crypto/aria.h
index 73295146be11..55108db53ca3 100644
--- a/include/crypto/aria.h
+++ b/include/crypto/aria.h
@@ -18,6 +18,7 @@
 #ifndef _CRYPTO_ARIA_H
 #define _CRYPTO_ARIA_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -450,9 +451,16 @@ static inline void aria_gsrk(u32 *rk, u32 *x, u32 *y, u32 n)
 		((y[(q + 2) % 4]) << (32 - r));
 }
 
-void aria_encrypt(void *ctx, u8 *out, const u8 *in);
-void aria_decrypt(void *ctx, u8 *out, const u8 *in);
-int aria_set_key(struct crypto_tfm *tfm, const u8 *in_key,
-		 unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA, aria_encrypt, void,
+	(void *ctx, u8 *out, const u8 *in),
+	(ctx, out, in));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA, aria_decrypt, void,
+	(void *ctx, u8 *out, const u8 *in),
+	(ctx, out, in));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA, aria_set_key, int,
+	(struct crypto_tfm *tfm, const u8 *in_key, unsigned int key_len),
+	(tfm, in_key, key_len));
 
 #endif
-- 
2.47.3


