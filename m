Return-Path: <linux-kbuild+bounces-11241-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHW9DCxFjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11241-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA48129E23
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8557301DDBE
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF6E238C0F;
	Thu, 12 Feb 2026 03:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="i3XkjAxd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF122A4EB;
	Thu, 12 Feb 2026 03:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865940; cv=none; b=TAClMFTy5tsXKzlYNK8ytHQoEj+sd529P9C0ctyD2OXdPiy2pe7CVtcYlq/StujI1e/Gnrcz9WasWWE5zECo0LqxFvfJkErYCY3hxlqRCJ0irrvFlsI2dsiBZswCRKKwa+lTo5IbWAODQs5FFhqf/hK/xOHfKcKGIhPjbOtM6gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865940; c=relaxed/simple;
	bh=ghF48PT3xxwaaB0MJTiEi+twBKixGi68REc2C3R5U6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtD1GEFSXwvKjfPn+2rOZmrdT21X178pzCUbsYk8mqNgFoKekHBsYpQNZWM4iJtZr26YiCPwnz1yPjm/+D7oIXpqk9OCubW+oPk9eqCbN0EKDbqdYYZRj82YIsn94DmqIMb4A4nXJ6URW8pB5HauhMtlxnyorPTRHKh3jUA02RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=i3XkjAxd; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865939; x=1802401939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SO+/ZqK/Z/wAT3DBtC8iE9tyUyavUTI84Oy20JmjxKU=;
  b=i3XkjAxd2/sV6N4sWSofSBU+Bt8oyuYYLhtK4dlVRcvxJjSG6QkPGFVK
   Rq1a3qn9oyVg6Dee42xxC3pd8qiNb0GAJ9S9Tyw5oBDyqAKBfzD4d4Ntj
   aZp+LSRIhUxdpJfD6JogG0C6AX9oUQCh6Vqcyw6bSauPKNRlQxgGJTx6w
   kdIp+2gO2nxXQb7SGPXt65l+xDgBaCbVzProXmjSeklvy9LJGZR7yW2ki
   gBoAfqpUyX+K/Lli+OnT+uqypMHA96xl3nxD3sZm5a2jMl19GlrBi/Szs
   9KRhVDcFSQ4hUQ7IuPxf9hWe8ZynSdKslfA+dMhptOiYFiUgUZVzRJfyD
   Q==;
X-CSE-ConnectionGUID: tiTPjnSdTl6JfuF6oPW3PQ==
X-CSE-MsgGUID: 75CT+RXGQX2uRWxUjjJ5ww==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12698906"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:12:18 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:6538]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 829ec723-a681-4660-97af-06c3ee38fd23; Thu, 12 Feb 2026 03:12:18 +0000 (UTC)
X-Farcaster-Flow-ID: 829ec723-a681-4660-97af-06c3ee38fd23
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:17 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:17 +0000
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
Subject: [PATCH 096/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_XOR crypto
Date: Thu, 12 Feb 2026 02:47:12 +0000
Message-ID: <20260212024725.11264-97-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
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
	TAGGED_FROM(0.00)[bounces-11241-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: BFA48129E23
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_ASYNC_XOR-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile     |  2 +-
 crypto/fips140/fips140-api.c | 12 ++++++++++++
 include/linux/async_tx.h     | 21 +++++++++------------
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 9de69630d930..3ceb7c8d7598 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
 crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
-obj-$(CONFIG_ASYNC_XOR) += async_xor.o
+crypto-objs-$(CONFIG_ASYNC_XOR) += async_xor.o
 obj-$(CONFIG_ASYNC_PQ) += async_pq.o
 obj-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
 obj-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 6644fce6555a..67e7b03e4dc4 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -819,6 +819,18 @@ DEFINE_CRYPTO_API_STUB(async_tx_quiesce);
 
 DEFINE_CRYPTO_API_STUB(async_memcpy);
 
+#endif
+/*
+ * crypto/async_tx/async_xor.c
+ */
+#if IS_BUILTIN(CONFIG_ASYNC_XOR)
+
+#include <linux/async_tx.h>
+
+DEFINE_CRYPTO_API_STUB(async_xor);
+DEFINE_CRYPTO_API_STUB(async_xor_offs);
+DEFINE_CRYPTO_API_STUB(async_xor_val_offs);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/include/linux/async_tx.h b/include/linux/async_tx.h
index 194228a8d1c4..36bcc93c6944 100644
--- a/include/linux/async_tx.h
+++ b/include/linux/async_tx.h
@@ -161,20 +161,17 @@ DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_tx_submit, void,
 	(struct dma_chan *chan, struct dma_async_tx_descriptor *tx, struct async_submit_ctl *submit),
 	(chan, tx, submit));
 
-struct dma_async_tx_descriptor *
-async_xor(struct page *dest, struct page **src_list, unsigned int offset,
-	  int src_cnt, size_t len, struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_XOR, async_xor, struct dma_async_tx_descriptor *,
+	(struct page *dest, struct page **src_list, unsigned int offset, int src_cnt, size_t len, struct async_submit_ctl *submit),
+	(dest, src_list, offset, src_cnt, len, submit));
 
-struct dma_async_tx_descriptor *
-async_xor_offs(struct page *dest, unsigned int offset,
-		struct page **src_list, unsigned int *src_offset,
-		int src_cnt, size_t len, struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_XOR, async_xor_offs, struct dma_async_tx_descriptor *,
+	(struct page *dest, unsigned int offset, struct page **src_list, unsigned int *src_offset, int src_cnt, size_t len, struct async_submit_ctl *submit),
+	(dest, offset, src_list, src_offset, src_cnt, len, submit));
 
-struct dma_async_tx_descriptor *
-async_xor_val_offs(struct page *dest, unsigned int offset,
-		struct page **src_list, unsigned int *src_offset,
-		int src_cnt, size_t len, enum sum_check_flags *result,
-		struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_XOR, async_xor_val_offs, struct dma_async_tx_descriptor *,
+	(struct page *dest, unsigned int offset, struct page **src_list, unsigned int *src_offset, int src_cnt, size_t len, enum sum_check_flags *result, struct async_submit_ctl *submit),
+	(dest, offset, src_list, src_offset, src_cnt, len, result, submit));
 
 DECLARE_CRYPTO_API(CONFIG_ASYNC_MEMCPY, async_memcpy, struct dma_async_tx_descriptor *,
 	(struct page *dest, struct page *src, unsigned int dest_offset, unsigned int src_offset, size_t len, struct async_submit_ctl *submit),
-- 
2.47.3


