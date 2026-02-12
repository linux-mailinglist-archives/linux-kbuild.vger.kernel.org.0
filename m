Return-Path: <linux-kbuild+bounces-11208-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Gx0CRVDjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11208-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:03:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FAC129AE0
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1863F3044153
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7A121C9E5;
	Thu, 12 Feb 2026 03:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="PyTlnW6i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D78A4414;
	Thu, 12 Feb 2026 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865426; cv=none; b=IcecwGXLnQPJvxSjUWhrZwMpzc/VkS6ph6gu7nUYVdHr5sk5ziY8ulcYSRCXk3V72ca+dX/kKZG6MLOmWiZgUOWjpCu0Mf0zO3bHOQai8zuWcpXAYoUIhUaU5CBSevXMuVjSMjkn0B2j7xthpJCqQlo3lSxZGZGWxl3W3sg5HGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865426; c=relaxed/simple;
	bh=1ypGEwW50M0Uvr1p3c2c5kmelVE9Zh2BoI7Tl/8jQts=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJfiPOYkaqSzTiHXzDlmahcFDj2Xg2E9CrzPB2o8IBQWPt+Tj1qOF/Ch2FJl4I+RMd6GAGrrhyDJOU/rM/9w7baNPEo51w/p66Wmj3JZSmxdmzMUUOQy6XAYhxMxAuyGC2Jrz/VGSmr0WGYt/imthDf/PASqepZt0V3q8QHnnO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=PyTlnW6i; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865425; x=1802401425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UHNtR/7QmTtVnnCUoECKwYmPTr1Y+/bXdGh1XWQ/a9c=;
  b=PyTlnW6irp95yBYkVEzjtKStQWqu2+C5kL9e1foSpNGuz1up4n6tG4Qn
   JO571s+/OwuutDnz7L7klMjSKrkLUu1mZLs+PAZHla/6vlO+u+LxYHgaf
   +UHq4J5reaQ6OlUJCM404yPRD/hWNidMlTJojIryH8BAsCyykhVyirS4p
   /RUVRbYg6zCa172i93B+HKqtIFskVqSDo1TnacoyI3c/fpfFy64+d3It/
   n+IuAiTN/pxEz/E3XaCgHwzKotApylzUtwvfHZl5jhAuP5N9A/8NbpQQA
   TvB3fLhTVc2iWR5+3pfZxRpipWvD04v+OnPdalZS0eYKseTqB6dMERG/C
   w==;
X-CSE-ConnectionGUID: Ke5dWnhcTiGEXnO/dKWRpA==
X-CSE-MsgGUID: LsFdnx7CQuuTxWP814qExQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919329"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:03:45 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:9588]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 8f779d84-4316-482a-8876-b63bf89d9abe; Thu, 12 Feb 2026 03:03:45 +0000 (UTC)
X-Farcaster-Flow-ID: 8f779d84-4316-482a-8876-b63bf89d9abe
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:44 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:44 +0000
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
Subject: [PATCH 063/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_BLOWFISH and CONFIG_CRYPTO_BLOWFISH_COMMON crypto
Date: Thu, 12 Feb 2026 02:46:39 +0000
Message-ID: <20260212024725.11264-64-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D046UWB001.ant.amazon.com (10.13.139.187) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11208-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85FAC129AE0
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_BLOWFISH- and CONFIG_CRYPTO_BLOWFISH_COMMON-related crypto
to convert them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  4 ++--
 crypto/blowfish_generic.c    |  4 ++--
 crypto/fips140/fips140-api.c | 10 ++++++++++
 include/crypto/blowfish.h    |  6 ++++--
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 84dff7084f71..795c76357bff 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -128,8 +128,8 @@ crypto-objs-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
 crypto-objs-$(CONFIG_CRYPTO_DES) += des_generic.o
 crypto-objs-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
-obj-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
-obj-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
 obj-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
 obj-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
 obj-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
diff --git a/crypto/blowfish_generic.c b/crypto/blowfish_generic.c
index f3c5f9b09850..8a0390b14867 100644
--- a/crypto/blowfish_generic.c
+++ b/crypto/blowfish_generic.c
@@ -124,8 +124,8 @@ static void __exit blowfish_mod_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(blowfish_mod_init);
-module_exit(blowfish_mod_fini);
+crypto_module_init(blowfish_mod_init);
+crypto_module_exit(blowfish_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Blowfish Cipher Algorithm");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 1452439319cc..61f7884d0f34 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -644,3 +644,13 @@ DEFINE_CRYPTO_API_STUB(cryptd_aead_queued);
 DEFINE_CRYPTO_API_STUB(cryptd_free_aead);
 
 #endif
+/*
+ * crypto/blowfish_common.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_BLOWFISH_COMMON)
+
+#include <crypto/blowfish.h>
+
+DEFINE_CRYPTO_API_STUB(blowfish_setkey);
+
+#endif
diff --git a/include/crypto/blowfish.h b/include/crypto/blowfish.h
index 9b384670b356..46e42a89bdf9 100644
--- a/include/crypto/blowfish.h
+++ b/include/crypto/blowfish.h
@@ -6,6 +6,7 @@
 #ifndef _CRYPTO_BLOWFISH_H
 #define _CRYPTO_BLOWFISH_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <linux/crypto.h>
 
@@ -18,7 +19,8 @@ struct bf_ctx {
 	u32 s[1024];
 };
 
-int blowfish_setkey(struct crypto_tfm *tfm, const u8 *key,
-		    unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_BLOWFISH_COMMON, blowfish_setkey, int,
+	(struct crypto_tfm *tfm, const u8 *key, unsigned int key_len),
+	(tfm, key, key_len));
 
 #endif
-- 
2.47.3


