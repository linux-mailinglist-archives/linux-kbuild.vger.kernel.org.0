Return-Path: <linux-kbuild+bounces-11238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDM6COhEjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11238-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:11:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C21129DB8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B839301589A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D3A238166;
	Thu, 12 Feb 2026 03:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="JPoXgdrW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1223184A;
	Thu, 12 Feb 2026 03:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865893; cv=none; b=rxr6gCNTUFve1v258Eg12kj5U2b6Aye1GKKL/wU5ZFPYqwDB/our2YhtnQNweuLtnXnK5b6xh86ZUrJq8XdICPkyxxNMQj/XJVvzLQe2usCy+/0aZssuaqRXbIjbrzs1ZcgehkOIgujlAP/v74pJfxLA2hvlEAVRF77ti0rT5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865893; c=relaxed/simple;
	bh=k+ch6eQv7PRKvTXmGp3N2s8I9yoTS1m+WxSN+xjGrgU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAsxspFfHKzLI3xVUtOk8N8Tffdhmqcq8Jo7xHMgn5zdCw7HNNIp/3TqqLJEr7/VH4j/w6azXQjzRt/FGzS+XpjA8WgAv5Qnis2aes5JYLqtWCYExvCMXx2RZgAUnGoP77rMMikRh0xwF17kN56NAg1Yyr+w+IpKGh4aZmlZxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=JPoXgdrW; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865892; x=1802401892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9y+iYdUq+u5qbwmOO4BGZaf5PyftfuT4Y2o/ZY6WxE=;
  b=JPoXgdrW338e5JFD7b9DGgpa2mQbqKCNxdO5bWK5rm9O8yrTt3tezfZx
   yYhD9U2lhD75NVMWxejNlAUTi/ArNL+bzQEka485hY0n5CTo62rijz329
   Dfe1i6uEFIdlWTFaGwg33VRWSQ6WrEG8/JSIw+RmuYEFKOhZRlrQprSNt
   /kvQoNgasTbjRYvzZmihoDRPIS3nP1ObVDX/ouiJm76IAo+MMysPq/uSh
   80JqJyuh0C9O/nMmgdP2eTLdwfSnL4zwOntOrTpkJ/lUNfVXm+lV0sWtq
   mFybAj4GWCFjaTuuN4Sg5HzLgKsFBefuxp8xvmqI3nl66/1SWs7zdWfBS
   A==;
X-CSE-ConnectionGUID: zcksdY7eSiOWHvTvVWfLfw==
X-CSE-MsgGUID: k/+9mgozSXmbG3kM9R8kPw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918423"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:11:32 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:6718]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 259bb3e1-9ae2-44b1-9200-a816fa42078f; Thu, 12 Feb 2026 03:11:32 +0000 (UTC)
X-Farcaster-Flow-ID: 259bb3e1-9ae2-44b1-9200-a816fa42078f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:31 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:30 +0000
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
Subject: [PATCH 093/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_XOR_BLOCKS crypto
Date: Thu, 12 Feb 2026 02:47:09 +0000
Message-ID: <20260212024725.11264-94-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
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
	TAGGED_FROM(0.00)[bounces-11238-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92C21129DB8
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_XOR_BLOCKS-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/fips140/fips140-api.c | 10 ++++++++++
 crypto/xor.c                 |  4 ++--
 include/linux/raid/xor.h     |  7 +++++--
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index dc70a464fc1a..29e674c1f2ad 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -196,7 +196,7 @@ crypto-objs-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
 #
 # generic algorithms and the async_tx api
 #
-obj-$(CONFIG_XOR_BLOCKS) += xor.o
+crypto-objs-$(CONFIG_XOR_BLOCKS) += xor.o
 obj-$(CONFIG_ASYNC_CORE) += async_tx/
 obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys/
 crypto_simd-y := simd.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 298ab496a395..5bcfc1a3cc7e 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -784,6 +784,16 @@ DEFINE_CRYPTO_API_STUB(aria_decrypt);
 
 DEFINE_CRYPTO_API_STUB(crypto_krb5enc_extractkeys);
 
+#endif
+/*
+ * crypto/xor.c
+ */
+#if IS_BUILTIN(CONFIG_XOR_BLOCKS)
+
+#include <linux/raid/xor.h>
+
+DEFINE_CRYPTO_API_STUB(xor_blocks);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/crypto/xor.c b/crypto/xor.c
index f39621a57bb3..a6b4e3b88f67 100644
--- a/crypto/xor.c
+++ b/crypto/xor.c
@@ -170,5 +170,5 @@ MODULE_LICENSE("GPL");
 core_initcall(register_xor_blocks);
 #endif
 
-module_init(calibrate_xor_blocks);
-module_exit(xor_exit);
+crypto_module_init(calibrate_xor_blocks);
+crypto_module_exit(xor_exit);
diff --git a/include/linux/raid/xor.h b/include/linux/raid/xor.h
index 51b811b62322..df8797d00b78 100644
--- a/include/linux/raid/xor.h
+++ b/include/linux/raid/xor.h
@@ -2,10 +2,13 @@
 #ifndef _XOR_H
 #define _XOR_H
 
+#include <crypto/api.h>
+
 #define MAX_XOR_BLOCKS 4
 
-extern void xor_blocks(unsigned int count, unsigned int bytes,
-	void *dest, void **srcs);
+DECLARE_CRYPTO_API(CONFIG_XOR_BLOCKS, xor_blocks, void,
+	(unsigned int count, unsigned int bytes, void *dest, void **srcs),
+	(count, bytes, dest, srcs));
 
 struct xor_block_template {
         struct xor_block_template *next;
-- 
2.47.3


