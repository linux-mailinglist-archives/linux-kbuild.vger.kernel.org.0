Return-Path: <linux-kbuild+bounces-11186-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONAvLMNBjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11186-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:58:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 162AA1298BB
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC583308A9DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C980D22256B;
	Thu, 12 Feb 2026 02:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="gwwV6KvU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6A1F03D2;
	Thu, 12 Feb 2026 02:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865088; cv=none; b=sQJo/0/weqrxNSL2yuEmb9azQFWW9TVy7kPX8XXSPhQjciEMWrCNioqWwEA5hwJZ7tJeHzBfSzxFHKYbTcXPagibGLX7RAmbCO3F75nCzK7RWrnhnQkXoTZbdAQZpAmvi7VEkIj6GmRoW6FMT0LztOckVwqSaRp8yNQnp9uGCk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865088; c=relaxed/simple;
	bh=YI1YIy04E3DBgAundSxq6Y2thBeStDNoI0WYOqEgPw8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AK9MbIqTlCN+UacQGWcVXXOhtS8/Q7WaFtwMfh0RSF5JlAQLP4sE01uzOI1+zmovsBUFQCdN3wWxycyc7v2G6kd1Jle+EqHxsGjMxoyZyNuvtYXpjYwSwKaaxR8SZ7gOCpPVE2CG1tkYsEx/bar05GK6hsl+CqqReEdJk0uZKlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=gwwV6KvU; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865087; x=1802401087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/NI2PfmD6OuyEoTp2u9rN9HWYc/bWOUYLMyNOSV5ios=;
  b=gwwV6KvU43qfyF80MZawjK7iuUsbiLXMPRW1dBw41kwxmnGncKjTyXeL
   9mdpoEFqhipehJ0gUeQ9Fw6CE/Q2mAyH8wXoBk7cSRMFjU2kQ9+Gd7c+N
   pG6dzBYb4piqxjwfKiG6Uqsg5Yp04GWTkJx9+69DDBYfi0KZXKaeUSTeA
   E9PJT6XfwvWtI1QN912t/sKVccqygHMyvPHPrNKu+lt25/i1YuHI4BXMN
   tfF3sN7hmACwiJjyosgrjnzfIeWwN2rTOS+Rp4KKWIQKN3VzabD+nkEZR
   qvaAvpqM2zjieXZPXg2uMdmqEmyZRPo6a9oxluemZ0Y80ss0N6nveCNtM
   w==;
X-CSE-ConnectionGUID: iY17iKHqRii/0rwsUreXAQ==
X-CSE-MsgGUID: OLoTjgcMQj++yJMF1IUxQg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721724"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:58:07 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:5793]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 90e4dd92-6de5-4519-8f52-cbf819f55310; Thu, 12 Feb 2026 02:58:07 +0000 (UTC)
X-Farcaster-Flow-ID: 90e4dd92-6de5-4519-8f52-cbf819f55310
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:03 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:02 +0000
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
Subject: [PATCH 041/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_XCBC crypto
Date: Thu, 12 Feb 2026 02:46:17 +0000
Message-ID: <20260212024725.11264-42-wanjay@amazon.com>
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
	TAGGED_FROM(0.00)[bounces-11186-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 162AA1298BB
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_XCBC-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/xcbc.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 390d38d17e4b..c98e6a397159 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -74,7 +74,7 @@ crypto-objs-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
 crypto-objs-$(CONFIG_CRYPTO_USER) += crypto_user.o
 crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
 crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
-obj-$(CONFIG_CRYPTO_XCBC) += xcbc.o
+crypto-objs-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 obj-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
diff --git a/crypto/xcbc.c b/crypto/xcbc.c
index 6c5f6766fdd6..90da46fe3bb7 100644
--- a/crypto/xcbc.c
+++ b/crypto/xcbc.c
@@ -199,8 +199,8 @@ static void __exit crypto_xcbc_module_exit(void)
 	crypto_unregister_template(&crypto_xcbc_tmpl);
 }
 
-module_init(crypto_xcbc_module_init);
-module_exit(crypto_xcbc_module_exit);
+crypto_module_init(crypto_xcbc_module_init);
+crypto_module_exit(crypto_xcbc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XCBC keyed hash algorithm");
-- 
2.47.3


