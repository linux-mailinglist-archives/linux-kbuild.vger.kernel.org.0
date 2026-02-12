Return-Path: <linux-kbuild+bounces-11235-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPGPLLhEjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11235-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:10:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7CD129D72
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEAF1306FF58
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEE5233128;
	Thu, 12 Feb 2026 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mAnnpgaf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A64E55C;
	Thu, 12 Feb 2026 03:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865846; cv=none; b=VE8QT8VVfHQwdfpkajmSAVDxm3efznYOkMzbXucct7p0gcSbFG8zSEyJ7ZUMXzNiLQNtKUP6HlAThily+SPKeo1UmLeKHmD90dlkdgoSwm3PDIP0dcp7z92eShGzDNFzlRG6jIQZlUGSdXnFUsqb6PnomEDLa7Bn8IaYIheHxEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865846; c=relaxed/simple;
	bh=7F8hldvYR/AYFnzAkslUwUHJn4jLBbgw6KUf3xfaEoU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XszdIMQczHMrVEc3jRizqEZM75hU8WT6xHkA6yt6v6bc4JVJ7/wziF8NiEcN9JG1N+w/CAoi++lpYWbfbMRT105apXH329z2y3SdyqTuE5Tp04lVdRLFV9WGSl0jAedrk4arUJiAFc8JvMQ7NYU8pmU+J0MoY1Wv8Ylsk6jp4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mAnnpgaf; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865845; x=1802401845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WebAd8ZfZh59r/og+/x6xPoxpPJTiWqB/2oQVhSiDRQ=;
  b=mAnnpgafNxcZml+zMu9E8tq73Mdxbd5diSXcNtRj+aWxs+uyD1NCCSCU
   Ee2ZBhnDTh4YnYjpwWZOmwJViFNqYX8JejyonIEvVe7nO1S7OiONWYZM0
   TXhnsTlC/um9e81AMT8BU9bkPYHWWIttH1MfawrWIHLv1VM1vMTwLev74
   CcP+RzrMsDRu/tvsiLQPnJUHAbjp1WRdhRUtRo93Uc+SMch+gKLNSuE2x
   HyxV8UYMtRQxj1KSfZA/hOPQaxcajYzRn8Mw+DuzxwPUHlYo5B1thv4wH
   uSjNr3uDTMbyFt0JnS0IWfYq5YZww5Ui1BZ+HMfwv/FqArxwY/4LbgD1F
   g==;
X-CSE-ConnectionGUID: VAJK1QSWRxGag43g3nY5TQ==
X-CSE-MsgGUID: xmtkpD24TiOYq/UaJVGmQg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12697327"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:10:45 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:12283]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id ba555cae-571b-489b-b04b-3b4080f45ca8; Thu, 12 Feb 2026 03:10:44 +0000 (UTC)
X-Farcaster-Flow-ID: ba555cae-571b-489b-b04b-3b4080f45ca8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:44 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:44 +0000
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
Subject: [PATCH 090/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ESSIV crypto
Date: Thu, 12 Feb 2026 02:47:06 +0000
Message-ID: <20260212024725.11264-91-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D039UWB002.ant.amazon.com (10.13.138.79) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11235-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E7CD129D72
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ESSIV-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/essiv.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c4516e1943a7..3247d53c1fc6 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -179,7 +179,7 @@ crypto-objs-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 crypto-objs-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 crypto-objs-$(CONFIG_CRYPTO_ECC) += ecc.o
-obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
+crypto-objs-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
diff --git a/crypto/essiv.c b/crypto/essiv.c
index a47a3eab6935..859486b9b063 100644
--- a/crypto/essiv.c
+++ b/crypto/essiv.c
@@ -639,8 +639,8 @@ static void __exit essiv_module_exit(void)
 	crypto_unregister_template(&essiv_tmpl);
 }
 
-module_init(essiv_module_init);
-module_exit(essiv_module_exit);
+crypto_module_init(essiv_module_init);
+crypto_module_exit(essiv_module_exit);
 
 MODULE_DESCRIPTION("ESSIV skcipher/aead wrapper for block encryption");
 MODULE_LICENSE("GPL v2");
-- 
2.47.3


