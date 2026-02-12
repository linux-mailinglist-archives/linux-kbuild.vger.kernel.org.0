Return-Path: <linux-kbuild+bounces-11239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BZkIwRFjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11239-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C1129DE6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31C6A303077C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21ED23C4E9;
	Thu, 12 Feb 2026 03:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="NU494p4C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01A618C33;
	Thu, 12 Feb 2026 03:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865908; cv=none; b=GeyQxLFf4oGlNSmhPDg6YLOws1RHcb1SfX42WDXJTFVFs7XcA2R3KMFVOAGRSgtI70IzgNReBFmAxobijPgrw6pNkYF+vK+3m5NgzF5MjLoxgEMNQBB2yx9rXcl62CS50VdgrzeV9bJ8qcZnyx9jtbUh0jCzZjjsrImxXgKgDH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865908; c=relaxed/simple;
	bh=Q/E/ViJF/q8EBKgambIj0nbAAe1JWQNaE1jq17neVFM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KceMMNpqszNeu4vUi4RmwmAxN2xgw5XmwX/skWwz5Zjb1WhA2PT3xYElHljijPJo3DaqIv3wP6uMY96vgi2DVjmkaCf2XDS0ivsloce3ZkxOtzWARwGfjrbSD66wQXRTg603UVNU14XJEI4YYKLEQOV8O/wEeBTIbfbuQR9GjSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=NU494p4C; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865907; x=1802401907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fq+ksnWYafcbyAsLjuFTQigGbWxrQvva7btpVdGcRB4=;
  b=NU494p4Cmsthp01WbAcI+APm6Zb/WDUXWbTSP3k7QTwXGDsKTN0RcFdh
   jq5RvYaKKTpCUv4R7edLn6T4l+uThz2SkZDZjjsNzMGBboKTrZRy7v1Df
   k4h63sN6g0+ynTXM2SG9DtTUGQnDGsPbvjRjcfnCYzDW6UxPFj65EiNuT
   2yzlHKBzzaP9uU0AeNd0/gbOUf646cm4cX8S0/O0DloezwiwbaCEPlfJ/
   j/Kipqia5PNgt1iQcHUNI5+RvNdVOAtbQq3ap+lafc8Vy9tfGljam2ESu
   sNyVJJJpdqdhmRnVCWBAKhmb3T/Jt9prk//RkiXWcZnVv6D6bfUy0aykd
   A==;
X-CSE-ConnectionGUID: /+x4ZNpjRlGuFmrf99Ougw==
X-CSE-MsgGUID: 7oFiedWTQj6zjrtKK6J1hA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920420"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:11:47 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:26562]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id f140671b-9228-42ae-a1b1-ff3855cb900b; Thu, 12 Feb 2026 03:11:47 +0000 (UTC)
X-Farcaster-Flow-ID: f140671b-9228-42ae-a1b1-ff3855cb900b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:46 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:46 +0000
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
Subject: [PATCH 094/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_CORE crypto
Date: Thu, 12 Feb 2026 02:47:10 +0000
Message-ID: <20260212024725.11264-95-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
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
	TAGGED_FROM(0.00)[bounces-11239-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 1F1C1129DE6
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_ASYNC_CORE-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile     |  2 +-
 crypto/async_tx/async_tx.c   |  4 ++--
 crypto/fips140/fips140-api.c | 15 +++++++++++++++
 include/linux/async_tx.h     | 21 ++++++++++++++-------
 4 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 056e48245373..2cfa2dc1947d 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_ASYNC_CORE) += async_tx.o
+crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
 obj-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 obj-$(CONFIG_ASYNC_XOR) += async_xor.o
 obj-$(CONFIG_ASYNC_PQ) += async_pq.o
diff --git a/crypto/async_tx/async_tx.c b/crypto/async_tx/async_tx.c
index ad72057a5e0d..4df0363f4764 100644
--- a/crypto/async_tx/async_tx.c
+++ b/crypto/async_tx/async_tx.c
@@ -30,8 +30,8 @@ static void __exit async_tx_exit(void)
 	async_dmaengine_put();
 }
 
-module_init(async_tx_init);
-module_exit(async_tx_exit);
+crypto_module_init(async_tx_init);
+crypto_module_exit(async_tx_exit);
 
 /**
  * __async_tx_find_channel - find a channel to carry out the operation or let
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 5bcfc1a3cc7e..ff58e8946821 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -794,6 +794,21 @@ DEFINE_CRYPTO_API_STUB(crypto_krb5enc_extractkeys);
 
 DEFINE_CRYPTO_API_STUB(xor_blocks);
 
+#endif
+/*
+ * crypto/async_tx/async_tx.c
+ */
+#if IS_BUILTIN(CONFIG_ASYNC_CORE)
+
+#include <linux/async_tx.h>
+
+#ifdef CONFIG_DMA_ENGINE
+DEFINE_CRYPTO_API_STUB(__async_tx_find_channel);
+#endif
+DEFINE_CRYPTO_API_STUB(async_tx_submit);
+DEFINE_CRYPTO_API_STUB(async_trigger_callback);
+DEFINE_CRYPTO_API_STUB(async_tx_quiesce);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/include/linux/async_tx.h b/include/linux/async_tx.h
index 1ca9f9e05f4f..25dfd3750859 100644
--- a/include/linux/async_tx.h
+++ b/include/linux/async_tx.h
@@ -4,6 +4,8 @@
  */
 #ifndef _ASYNC_TX_H_
 #define _ASYNC_TX_H_
+
+#include <crypto/api.h>
 #include <linux/dmaengine.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
@@ -99,9 +101,9 @@ static inline void async_tx_issue_pending(struct dma_async_tx_descriptor *tx)
 #else
 #define async_tx_find_channel(dep, type, dst, dst_count, src, src_count, len) \
 	 __async_tx_find_channel(dep, type)
-struct dma_chan *
-__async_tx_find_channel(struct async_submit_ctl *submit,
-			enum dma_transaction_type tx_type);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, __async_tx_find_channel, struct dma_chan *,
+	(struct async_submit_ctl *submit, enum dma_transaction_type tx_type),
+	(submit, tx_type));
 #endif /* CONFIG_ARCH_HAS_ASYNC_TX_FIND_CHANNEL */
 #else
 static inline void async_tx_issue_pending_all(void)
@@ -155,8 +157,9 @@ init_async_submit(struct async_submit_ctl *args, enum async_tx_flags flags,
 	args->scribble = scribble;
 }
 
-void async_tx_submit(struct dma_chan *chan, struct dma_async_tx_descriptor *tx,
-		     struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_tx_submit, void,
+	(struct dma_chan *chan, struct dma_async_tx_descriptor *tx, struct async_submit_ctl *submit),
+	(chan, tx, submit));
 
 struct dma_async_tx_descriptor *
 async_xor(struct page *dest, struct page **src_list, unsigned int offset,
@@ -178,7 +181,9 @@ async_memcpy(struct page *dest, struct page *src, unsigned int dest_offset,
 	     unsigned int src_offset, size_t len,
 	     struct async_submit_ctl *submit);
 
-struct dma_async_tx_descriptor *async_trigger_callback(struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_trigger_callback, struct dma_async_tx_descriptor *,
+	(struct async_submit_ctl *submit),
+	(submit));
 
 struct dma_async_tx_descriptor *
 async_gen_syndrome(struct page **blocks, unsigned int *offsets, int src_cnt,
@@ -199,5 +204,7 @@ async_raid6_datap_recov(int src_num, size_t bytes, int faila,
 			struct page **ptrs, unsigned int *offs,
 			struct async_submit_ctl *submit);
 
-void async_tx_quiesce(struct dma_async_tx_descriptor **tx);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_tx_quiesce, void,
+	(struct dma_async_tx_descriptor **tx),
+	(tx));
 #endif /* _ASYNC_TX_H_ */
-- 
2.47.3


