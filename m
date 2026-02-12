Return-Path: <linux-kbuild+bounces-11278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EqrCnRHjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11278-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:22:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75012A1A8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23FA8300A5BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F7223BCE3;
	Thu, 12 Feb 2026 03:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="BkCr6I7d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6811922301;
	Thu, 12 Feb 2026 03:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866541; cv=none; b=oBj1j58iYGxRqA5fs/g8B95jLkbQkLyxLwjvtaHqe4HLWTJLoGLTm+kenTOz3unjJF12GIJqwTVHImvlueVuLnl8SX0eusptuax5jQrAcDczfSDOAEy+5EkASJbQMamzkLojxSDWyINlUJrX+neAk9hZEaNEtHa0u8kCcxhDZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866541; c=relaxed/simple;
	bh=mpq1fsz0e3lAjU6dmryn9C32vTO/PnsndlO3E2m7pUU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tt9fAbyv0gpZo5xfdetgDgwF707uQVc08YyOW7AR0v3WXQXf35M7YmK+Bz0zOr6eieX816u/eJ3PE/8NWNprS78Yor2yukX4vea97AVozTlQjL9kebDSAsggqdeDT5BEFN9PNuMxbYGbRSMBcjREPkDbE9NhhNvPdfvsgO4yd6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=BkCr6I7d; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866540; x=1802402540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dRIBs9Wsgog8IU+nYjdPvBpy4OpKlnmgXZ0sO3jgkQI=;
  b=BkCr6I7d5IzLvAvt5MKqmNUo/MlwtIRNw/yLCIxc5wp7nOGAxsd7wqGE
   9lHS0r449NIVIIfkKmCFqiPmq+WTZ0F2eByOBXSQK6fpm5MFygNERKJt1
   z1siQh0TwkrgeJOgBBKhzpJIVWYRW5fqyDdV8yGdmUw/JkdR4q9+whlTE
   NWqDACh9Rc5P/5jLZ3AWlDFQYrsZ87i0T1dqvQ3WZcfhhQPvBBdMjLX1f
   HTWpBpOpmlZw7unApCRV0FnZVzhp/y7Gd5V1EioQFSyxnrzgXw+iqCIDm
   4z14+TBUMyjGbbQtjFdVJ0ddc5o1fn/Cd+q1hpUcFlsipgAsifib1Fb73
   g==;
X-CSE-ConnectionGUID: pWM+c+Z2Qw2rx/MbQP4rvw==
X-CSE-MsgGUID: Pn0AxGWYT3+tJ/RxOZQhQg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12456113"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:22:20 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:15288]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 17ec802b-88aa-4cc3-8f8b-6a017524a26f; Thu, 12 Feb 2026 03:22:19 +0000 (UTC)
X-Farcaster-Flow-ID: 17ec802b-88aa-4cc3-8f8b-6a017524a26f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:19 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:19 +0000
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
Subject: [PATCH 04/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_ARM64_CE_BLK crypto
Date: Thu, 12 Feb 2026 03:21:04 +0000
Message-ID: <20260212032117.9166-5-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWB004.ant.amazon.com (10.13.138.57) To
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
	TAGGED_FROM(0.00)[bounces-11278-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alibaba.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E75012A1A8
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SM4_ARM64_CE_BLK-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile              |  2 +-
 arch/arm64/crypto/fips140/fips140-api.c | 12 ++++++++++++
 arch/arm64/crypto/sm4-ce-glue.c         |  4 ++--
 arch/arm64/crypto/sm4-ce.h              | 16 +++++++++++-----
 4 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index a4fe2bf71c6b..59e94f714ef9 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -14,7 +14,7 @@ sm3-ce-y := sm3-ce-glue.o sm3-ce-core.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
 sm4-ce-cipher-y := sm4-ce-cipher-glue.o sm4-ce-cipher-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
 sm4-ce-y := sm4-ce-glue.o sm4-ce-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_CCM) += sm4-ce-ccm.o
diff --git a/arch/arm64/crypto/fips140/fips140-api.c b/arch/arm64/crypto/fips140/fips140-api.c
index e69de29bb2d1..a36c8f3b0741 100644
--- a/arch/arm64/crypto/fips140/fips140-api.c
+++ b/arch/arm64/crypto/fips140/fips140-api.c
@@ -0,0 +1,12 @@
+/*
+ * arch/arm64/crypto/sm4-ce-glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SM4_ARM64_CE_BLK)
+
+#include <arch/arm64/crypto/sm4-ce.h>
+
+DEFINE_CRYPTO_API_STUB(sm4_ce_expand_key);
+DEFINE_CRYPTO_API_STUB(sm4_ce_crypt_block);
+DEFINE_CRYPTO_API_STUB(sm4_ce_cbc_enc);
+
+#endif
diff --git a/arch/arm64/crypto/sm4-ce-glue.c b/arch/arm64/crypto/sm4-ce-glue.c
index 0eeabfa9ef25..cf90b53ef46a 100644
--- a/arch/arm64/crypto/sm4-ce-glue.c
+++ b/arch/arm64/crypto/sm4-ce-glue.c
@@ -701,8 +701,8 @@ static void __exit sm4_exit(void)
 	crypto_unregister_skciphers(sm4_algs, ARRAY_SIZE(sm4_algs));
 }
 
-module_cpu_feature_match(SM4, sm4_init);
-module_exit(sm4_exit);
+crypto_module_cpu_feature_match(SM4, sm4_init);
+crypto_module_exit(sm4_exit);
 
 MODULE_DESCRIPTION("SM4 ECB/CBC/CTR/XTS using ARMv8 Crypto Extensions");
 MODULE_ALIAS_CRYPTO("sm4-ce");
diff --git a/arch/arm64/crypto/sm4-ce.h b/arch/arm64/crypto/sm4-ce.h
index 1e235c4371eb..189f69762248 100644
--- a/arch/arm64/crypto/sm4-ce.h
+++ b/arch/arm64/crypto/sm4-ce.h
@@ -4,10 +4,16 @@
  * Copyright (C) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  */
 
-void sm4_ce_expand_key(const u8 *key, u32 *rkey_enc, u32 *rkey_dec,
-		       const u32 *fk, const u32 *ck);
+#include <crypto/api.h>
 
-void sm4_ce_crypt_block(const u32 *rkey, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_ARM64_CE_BLK, sm4_ce_expand_key, void,
+	(const u8 *key, u32 *rkey_enc, u32 *rkey_dec, const u32 *fk, const u32 *ck),
+	(key, rkey_enc, rkey_dec, fk, ck));
 
-void sm4_ce_cbc_enc(const u32 *rkey_enc, u8 *dst, const u8 *src,
-		    u8 *iv, unsigned int nblocks);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_ARM64_CE_BLK, sm4_ce_crypt_block, void,
+	(const u32 *rkey, u8 *dst, const u8 *src),
+	(rkey, dst, src));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_ARM64_CE_BLK, sm4_ce_cbc_enc, void,
+	(const u32 *rkey_enc, u8 *dst, const u8 *src, u8 *iv, unsigned int nblocks),
+	(rkey_enc, dst, src, iv, nblocks));
-- 
2.47.3


