Return-Path: <linux-kbuild+bounces-11242-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCHJCDBFjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11242-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80983129E3B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B85030185D2
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D38E238D42;
	Thu, 12 Feb 2026 03:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="lata/pvA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0120023184A;
	Thu, 12 Feb 2026 03:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865955; cv=none; b=A7Jy/CxIFgAB2EZu4hWUOdE2m5DyORbKzLQWe90eJcnjC2ZbaNzdRwaMyqYxGTLuVBz1IUYQfKvteCR4KR20uubPpOtqxzb9fA9P8Xiju+CNuY3EbAeVzgHzs4M4MOADaeOORmd+YeTrX+jh6Ito9t8WvWXxVPDuyCMMFj7hPH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865955; c=relaxed/simple;
	bh=Hw/EO1Unp/PAaWOTUHaCNSODpZvQ1Q+IJGHtJrTxZps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pA1iUNLMPH5f3tuoEp8+VIUlLtMbQyBEw6eAK82NrLzisx6GqtyHWySAtHHZ4VM2e0xBqTpgi/C72X0rXoaLblPDSRMfnToFI85ZP9drALmN795J85/ggcy09SIVpsXuYG6j0GIFPklnMffz5I+yeOdr7IwLtk92f2+E+hz+igg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=lata/pvA; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865954; x=1802401954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WX2hl8BKIm83A5+yPNUQyry8rvmHoia35jhgy7ZUw2k=;
  b=lata/pvAZkgpL5+xnQAtonkwUcJswo3bxAJxPApqqpipB4O6sLHaCvEU
   5jSD46ZEX5TZXCwTK0N0LTIQsqBsxwh1Q7ImlQdAGQBae9oCA3HPqa01M
   TVHxw6Ay9Y5aluLVsQgpF5VSO9tnY05o3rBy+dmofhL72DGCbIn3cAUlt
   mLbNXvBqF0J/UExCTsiPpHOPMlHi6qwdtGvW1Xn0bsuC7r5a70XhH4lV9
   V1IGrgsAODJEAch2KJpZ4eM0cnsmqkS7gP8yulO5zqnYUXwQAI+hIUNrE
   arJPGQejTqyBeS1GopS2ys3PZWJd18JnC3cO5/2emdb6DBuWGqNMU/XKk
   A==;
X-CSE-ConnectionGUID: e4/AFqkTS4+mxoMiYofzhA==
X-CSE-MsgGUID: 8Ql9dhSzT8WsZsyUA/y8ww==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12455807"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:12:33 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:9319]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id c4417ed6-d620-4118-a43e-5b7fbfc6b19a; Thu, 12 Feb 2026 03:12:33 +0000 (UTC)
X-Farcaster-Flow-ID: c4417ed6-d620-4118-a43e-5b7fbfc6b19a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:33 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:32 +0000
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
Subject: [PATCH 097/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_PQ crypto
Date: Thu, 12 Feb 2026 02:47:13 +0000
Message-ID: <20260212024725.11264-98-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D044UWA004.ant.amazon.com (10.13.139.7) To
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
	TAGGED_FROM(0.00)[bounces-11242-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 80983129E3B
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_ASYNC_PQ-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile     |  2 +-
 crypto/async_tx/async_pq.c   |  4 ++--
 crypto/fips140/fips140-api.c | 11 +++++++++++
 include/linux/async_tx.h     | 13 ++++++-------
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 3ceb7c8d7598..9b0277843bb3 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -2,6 +2,6 @@
 crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
 crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 crypto-objs-$(CONFIG_ASYNC_XOR) += async_xor.o
-obj-$(CONFIG_ASYNC_PQ) += async_pq.o
+crypto-objs-$(CONFIG_ASYNC_PQ) += async_pq.o
 obj-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
 obj-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
diff --git a/crypto/async_tx/async_pq.c b/crypto/async_tx/async_pq.c
index 9e4bb7fbde25..b80fb50fffb2 100644
--- a/crypto/async_tx/async_pq.c
+++ b/crypto/async_tx/async_pq.c
@@ -456,8 +456,8 @@ static void __exit async_pq_exit(void)
 	__free_page(pq_scribble_page);
 }
 
-module_init(async_pq_init);
-module_exit(async_pq_exit);
+crypto_module_init(async_pq_init);
+crypto_module_exit(async_pq_exit);
 
 MODULE_DESCRIPTION("asynchronous raid6 syndrome generation/validation");
 MODULE_LICENSE("GPL");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 67e7b03e4dc4..6c22baf0ce10 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -831,6 +831,17 @@ DEFINE_CRYPTO_API_STUB(async_xor);
 DEFINE_CRYPTO_API_STUB(async_xor_offs);
 DEFINE_CRYPTO_API_STUB(async_xor_val_offs);
 
+#endif
+/*
+ * crypto/async_tx/async_pq.c
+ */
+#if IS_BUILTIN(CONFIG_ASYNC_PQ)
+
+#include <linux/async_tx.h>
+
+DEFINE_CRYPTO_API_STUB(async_gen_syndrome);
+DEFINE_CRYPTO_API_STUB(async_syndrome_val);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/include/linux/async_tx.h b/include/linux/async_tx.h
index 36bcc93c6944..9f733d01f69e 100644
--- a/include/linux/async_tx.h
+++ b/include/linux/async_tx.h
@@ -181,14 +181,13 @@ DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_trigger_callback, struct dma_async_t
 	(struct async_submit_ctl *submit),
 	(submit));
 
-struct dma_async_tx_descriptor *
-async_gen_syndrome(struct page **blocks, unsigned int *offsets, int src_cnt,
-		   size_t len, struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_PQ, async_gen_syndrome, struct dma_async_tx_descriptor *,
+	(struct page **blocks, unsigned int *offsets, int src_cnt, size_t len, struct async_submit_ctl *submit),
+	(blocks, offsets, src_cnt, len, submit));
 
-struct dma_async_tx_descriptor *
-async_syndrome_val(struct page **blocks, unsigned int *offsets, int src_cnt,
-		   size_t len, enum sum_check_flags *pqres, struct page *spare,
-		   unsigned int s_off, struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_PQ, async_syndrome_val, struct dma_async_tx_descriptor *,
+	(struct page **blocks, unsigned int *offsets, int src_cnt, size_t len, enum sum_check_flags *pqres, struct page *spare, unsigned int s_off, struct async_submit_ctl *submit),
+	(blocks, offsets, src_cnt, len, pqres, spare, s_off, submit));
 
 struct dma_async_tx_descriptor *
 async_raid6_2data_recov(int src_num, size_t bytes, int faila, int failb,
-- 
2.47.3


