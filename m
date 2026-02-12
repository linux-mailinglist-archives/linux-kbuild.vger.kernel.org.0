Return-Path: <linux-kbuild+bounces-11243-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP1rJDdFjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11243-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF89129E43
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 399BA30156F5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953A522FDEA;
	Thu, 12 Feb 2026 03:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="i7VcGbYr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84CE23EA89;
	Thu, 12 Feb 2026 03:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865971; cv=none; b=YQ9MAT1ejQjPYDHj8FTnMVGh/yfsrq6Q4qZTBQJraBwwW+S8HNlwDujGvCSznqOaZhUYXvQL3HNe1SLUUob2hQzhEarglPIZnXedE320qx+i0OaLqwYWZFvMtS8nYcxJGQP4tUcnhbtaoyTCnznBWwgRpT+ZulOWDm7q7S3JBTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865971; c=relaxed/simple;
	bh=rjl9CEx+GmZ58nHZv4/D4S1m00lElakksXCTwDMXzJ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MnxrOblS6MB6uNY38reY8MMRBLZm7ibeDmK//lzoeT26LpwX7dRJ32JTO5T5MQcPmo3OKSVb5M8NnHfT8gQooAvTYIQdLnKPN2NcVn/wenkVG4kv+edCyzellFlFBldXcfi8lBaw16yvRfz+ysi+xFU/q7BtdtYGv5zxaQVCpXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=i7VcGbYr; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865970; x=1802401970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mrxPwx98+PCEPXtHwegbpc8CFG0s/zBXZtiApdt7ovQ=;
  b=i7VcGbYru3qMoFBIFx98zyGc7gCfT8Mr++jH4elHH3g2GV40xTZn894j
   rByz88LgCtrO/cAP/8irj5FSBQxkhXmBEoOuIZk4oOBV1OQiE1hhKmRdg
   wtHVkaKh8Jojl2ImmKlNgpnTjQv+TtUTWgBk10VSsxLJcdoqzQK6khejW
   ki1kd1tgPvAKZ/jnNXc8oNvY2D9T4XEHmi5E0ZEUmBnVi3XTJv5LtFzVT
   nV6UTna931vqO2EM8u8BvKrYMux9FhojMwPtIHWMY1rEoS/x+fawY1MfR
   ZlwD6ZkXLYm1xrn0EmmBomT4wWpEQsalT7oBz5xpn6GMz3LyTqU2VOeTT
   A==;
X-CSE-ConnectionGUID: YzHOosEoRrK1E1ptguSRaQ==
X-CSE-MsgGUID: sudD6iiwQ36k32Jgd+n05w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744721"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:12:49 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:1252]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id fd578883-05bc-4610-9374-9e0751ee70fe; Thu, 12 Feb 2026 03:12:49 +0000 (UTC)
X-Farcaster-Flow-ID: fd578883-05bc-4610-9374-9e0751ee70fe
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:48 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:48 +0000
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
Subject: [PATCH 098/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_RAID6_RECOV crypto
Date: Thu, 12 Feb 2026 02:47:14 +0000
Message-ID: <20260212024725.11264-99-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D041UWB003.ant.amazon.com (10.13.139.176) To
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
	TAGGED_FROM(0.00)[bounces-11243-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 3FF89129E43
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_ASYNC_RAID6_RECOV-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile     |  2 +-
 crypto/fips140/fips140-api.c | 11 +++++++++++
 include/linux/async_tx.h     | 16 +++++++---------
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 9b0277843bb3..2f700c2312af 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -3,5 +3,5 @@ crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
 crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 crypto-objs-$(CONFIG_ASYNC_XOR) += async_xor.o
 crypto-objs-$(CONFIG_ASYNC_PQ) += async_pq.o
-obj-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
+crypto-objs-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
 obj-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 6c22baf0ce10..7159c796d87f 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -842,6 +842,17 @@ DEFINE_CRYPTO_API_STUB(async_xor_val_offs);
 DEFINE_CRYPTO_API_STUB(async_gen_syndrome);
 DEFINE_CRYPTO_API_STUB(async_syndrome_val);
 
+#endif
+/*
+ * crypto/async_tx/async_raid6_recov.c
+ */
+#if IS_BUILTIN(CONFIG_ASYNC_RAID6_RECOV)
+
+#include <linux/async_tx.h>
+
+DEFINE_CRYPTO_API_STUB(async_raid6_2data_recov);
+DEFINE_CRYPTO_API_STUB(async_raid6_datap_recov);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/include/linux/async_tx.h b/include/linux/async_tx.h
index 9f733d01f69e..4e791a978ac3 100644
--- a/include/linux/async_tx.h
+++ b/include/linux/async_tx.h
@@ -189,15 +189,13 @@ DECLARE_CRYPTO_API(CONFIG_ASYNC_PQ, async_syndrome_val, struct dma_async_tx_desc
 	(struct page **blocks, unsigned int *offsets, int src_cnt, size_t len, enum sum_check_flags *pqres, struct page *spare, unsigned int s_off, struct async_submit_ctl *submit),
 	(blocks, offsets, src_cnt, len, pqres, spare, s_off, submit));
 
-struct dma_async_tx_descriptor *
-async_raid6_2data_recov(int src_num, size_t bytes, int faila, int failb,
-			struct page **ptrs, unsigned int *offs,
-			struct async_submit_ctl *submit);
-
-struct dma_async_tx_descriptor *
-async_raid6_datap_recov(int src_num, size_t bytes, int faila,
-			struct page **ptrs, unsigned int *offs,
-			struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_RAID6_RECOV, async_raid6_2data_recov, struct dma_async_tx_descriptor *,
+	(int src_num, size_t bytes, int faila, int failb, struct page **ptrs, unsigned int *offs, struct async_submit_ctl *submit),
+	(src_num, bytes, faila, failb, ptrs, offs, submit));
+
+DECLARE_CRYPTO_API(CONFIG_ASYNC_RAID6_RECOV, async_raid6_datap_recov, struct dma_async_tx_descriptor *,
+	(int src_num, size_t bytes, int faila, struct page **ptrs, unsigned int *offs, struct async_submit_ctl *submit),
+	(src_num, bytes, faila, ptrs, offs, submit));
 
 DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_tx_quiesce, void,
 	(struct dma_async_tx_descriptor **tx),
-- 
2.47.3


