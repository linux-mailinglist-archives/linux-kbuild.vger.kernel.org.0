Return-Path: <linux-kbuild+bounces-11228-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIHAM01EjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11228-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:09:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B5129CD1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC4A2302458B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FEA22FDEA;
	Thu, 12 Feb 2026 03:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="T7KYLLvc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653C322D795;
	Thu, 12 Feb 2026 03:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865737; cv=none; b=clAN3evGbzzl2fiMD9zMZdefgHidIXQn3o7nD+b2zDBownqgNDmXJq/DvdC6ubr73IvHX5C30UxTGzSMh8WuSUSCW9uF4yhONAFVp0q5J5CUgCulKCN8tv3+OsaBCTRwchVZBlDMEFX1kOJcKTlAWXkUDU+mxOwxFZAwh1AipJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865737; c=relaxed/simple;
	bh=42PSC95CyVbKczIIB8rYyL8cfA5I+W++JdG/ND3W5sM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJvtebrhvicefi0Mk9waLwhQYIpc4i7aEfvDgsmopzPRtnHUkKixOkpXH9ebk/ukho8jgkSi9f0mNfW2twCZGKeEVg0urtInJQyLnR1NuLnAI0yYK+ENy4sYS7WKMY0zs9tpKkvo4Od9F7pPRoM64M+7K/PgGyXgYIh1u67yVaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=T7KYLLvc; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865736; x=1802401736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WoPmFpm9N8PVSdQbWTHgmeK+0qipWTL5L3vL+6JEhVw=;
  b=T7KYLLvchN3Caiv6wX7P3OxHWTqdK763IBthzwLwwS6HQJh7AxBrL7H6
   /ho2P3GfzymVv86vvQdEbuki+IsaCl4YqcBVUzuVKHRdYHEEGSJOJncfA
   diLl6WLW4E7LQiDJprN97kgrLuC5S1gSAOCWn/vR3z9sE9YDfQZg1d96M
   gvqxMcY2wfRMtdgUFFkVCR2ddGvkdw4sAsdlLlPjQywLi3wOaGMhBrLy4
   ASmAbZXezo86bCoS+AAo89Knw3zJmA3b4XwG9y/fQdbasyHJRyCf44q6/
   I1NaWmLriTVElRq8j+oAwSh7GRnl6kdOTpxp9o29eQKuITgOGDBUUamgA
   A==;
X-CSE-ConnectionGUID: lD/xf+3TRR2P1PsZ7o7kLA==
X-CSE-MsgGUID: 5GLoAUTvQSado51svUKZ6w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925927"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:08:56 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:29936]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id ec550a5e-460a-44dc-a4e2-d7753333fc80; Thu, 12 Feb 2026 03:08:55 +0000 (UTC)
X-Farcaster-Flow-ID: ec550a5e-460a-44dc-a4e2-d7753333fc80
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:55 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:55 +0000
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
Subject: [PATCH 083/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_842 crypto
Date: Thu, 12 Feb 2026 02:46:59 +0000
Message-ID: <20260212024725.11264-84-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D042UWB004.ant.amazon.com (10.13.139.150) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11228-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D2B5129CD1
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_842-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/842.c    | 4 ++--
 crypto/Makefile | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/842.c b/crypto/842.c
index 4007e87bed80..965f0f8dbc43 100644
--- a/crypto/842.c
+++ b/crypto/842.c
@@ -72,13 +72,13 @@ static int __init crypto842_mod_init(void)
 {
 	return crypto_register_scomp(&scomp);
 }
-module_init(crypto842_mod_init);
+crypto_module_init(crypto842_mod_init);
 
 static void __exit crypto842_mod_exit(void)
 {
 	crypto_unregister_scomp(&scomp);
 }
-module_exit(crypto842_mod_exit);
+crypto_module_exit(crypto842_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("842 Software Compression Algorithm");
diff --git a/crypto/Makefile b/crypto/Makefile
index 6dc023d0851c..66319c92a983 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -161,7 +161,7 @@ crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 crypto-objs-$(CONFIG_CRYPTO_LZ4) += lz4.o
 crypto-objs-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
 crypto-objs-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
-obj-$(CONFIG_CRYPTO_842) += 842.o
+crypto-objs-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
 crypto-objs-$(CONFIG_CRYPTO_DRBG) += drbg.o
 crypto-objs-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
-- 
2.47.3


