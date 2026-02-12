Return-Path: <linux-kbuild+bounces-11240-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDc7LxVFjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11240-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:21 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4039129DFE
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 335683007B2F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2608238C3A;
	Thu, 12 Feb 2026 03:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Jh92v8YX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1273233D69;
	Thu, 12 Feb 2026 03:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865923; cv=none; b=ZG14GLts+wZxpORLPqksuAPI+S9scoGxT2tpiUtJ8jOZk7U4ik8Ihls9NtIlWxzAMEvXJZu12yj6K7hEQbJiSUjJACUp+croIdEzDvjCtLAKzjn1IkuRwrgy2WJ7T7zJL9dqAOZVR7/fV2IZ7Rwwj3rPbkfMc6hXcAE11tndsmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865923; c=relaxed/simple;
	bh=Y+v5i3+7/v64x9zUNGLlbS5T/CMdRFx7KkRPLCk9K0Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CX1Na4vRUq8q9Vz22CHiCy3BI60kCdT8IHsAWeFu9LbjPjo9L70PcW5HsPrHGtolepGJlChIZTOFOL7usvUTMAkDUXASLa1Y7scKbyLQ2tSe6ecMepfbsW0Em9i6piII/ZqpS9jQ1KmzCTlMm4plkQZxDXaksVa8IOfmKLv8BY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Jh92v8YX; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865922; x=1802401922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r4gBE91GqNXtVWfJI7PG4CFBpAoCdUPRS6agT7qUgnI=;
  b=Jh92v8YXeDkXkqkAE0Z6RA8oYpdoRnJbitBJI3kzVLfMWgrqLx3X0iCR
   RMIvHlqfF6COkHhXLAwGBUOB5cbZtvOQNCKJbxGEuDGjj5HMAM+qfAyaf
   dxeWuqPSuJ+ftyfcDeaAXMo+hG99TnMsYXSBfRneqXLj5SG52gM7Z0bx1
   YhCoNg2bTsWcM4OVeaMqQEVZW4itp6CxETfasFEDsDKs/3NxiEj222yOY
   S6dnYrJzADSVfOMFQLwp10AqumCYJRcxgf9dWQpSHzgSHQNxXp4GguyMU
   rCqBfE0g9IRG8i2mt9gX1Vu4oX8QgqwFW544II/l6/Pq28c5ELe6EEu3h
   A==;
X-CSE-ConnectionGUID: SJ8swN36RTe80JixRX9yJA==
X-CSE-MsgGUID: CU4uHtGQTUijsNTFfqC8IA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744675"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:12:02 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:24969]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id fef52040-0c5a-4462-8c63-0beab6c32bb9; Thu, 12 Feb 2026 03:12:02 +0000 (UTC)
X-Farcaster-Flow-ID: fef52040-0c5a-4462-8c63-0beab6c32bb9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:02 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:12:01 +0000
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
Subject: [PATCH 095/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_MEMCPY crypto
Date: Thu, 12 Feb 2026 02:47:11 +0000
Message-ID: <20260212024725.11264-96-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D035UWB002.ant.amazon.com (10.13.138.97) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11240-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4039129DFE
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_ASYNC_MEMCPY-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile     |  2 +-
 crypto/fips140/fips140-api.c | 10 ++++++++++
 include/linux/async_tx.h     |  7 +++----
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 2cfa2dc1947d..9de69630d930 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
-obj-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
+crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 obj-$(CONFIG_ASYNC_XOR) += async_xor.o
 obj-$(CONFIG_ASYNC_PQ) += async_pq.o
 obj-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index ff58e8946821..6644fce6555a 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -809,6 +809,16 @@ DEFINE_CRYPTO_API_STUB(async_tx_submit);
 DEFINE_CRYPTO_API_STUB(async_trigger_callback);
 DEFINE_CRYPTO_API_STUB(async_tx_quiesce);
 
+#endif
+/*
+ * crypto/async_tx/async_memcpy.c
+ */
+#if IS_BUILTIN(CONFIG_ASYNC_MEMCPY)
+
+#include <linux/async_tx.h>
+
+DEFINE_CRYPTO_API_STUB(async_memcpy);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/include/linux/async_tx.h b/include/linux/async_tx.h
index 25dfd3750859..194228a8d1c4 100644
--- a/include/linux/async_tx.h
+++ b/include/linux/async_tx.h
@@ -176,10 +176,9 @@ async_xor_val_offs(struct page *dest, unsigned int offset,
 		int src_cnt, size_t len, enum sum_check_flags *result,
 		struct async_submit_ctl *submit);
 
-struct dma_async_tx_descriptor *
-async_memcpy(struct page *dest, struct page *src, unsigned int dest_offset,
-	     unsigned int src_offset, size_t len,
-	     struct async_submit_ctl *submit);
+DECLARE_CRYPTO_API(CONFIG_ASYNC_MEMCPY, async_memcpy, struct dma_async_tx_descriptor *,
+	(struct page *dest, struct page *src, unsigned int dest_offset, unsigned int src_offset, size_t len, struct async_submit_ctl *submit),
+	(dest, src, dest_offset, src_offset, len, submit));
 
 DECLARE_CRYPTO_API(CONFIG_ASYNC_CORE, async_trigger_callback, struct dma_async_tx_descriptor *,
 	(struct async_submit_ctl *submit),
-- 
2.47.3


