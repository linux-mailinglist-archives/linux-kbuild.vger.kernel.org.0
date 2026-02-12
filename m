Return-Path: <linux-kbuild+bounces-11227-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFn3LT9EjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11227-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:08:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0C129CBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8CFC3024DD6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612A222FAFD;
	Thu, 12 Feb 2026 03:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="k1H4Fhib"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EDF227E95;
	Thu, 12 Feb 2026 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865723; cv=none; b=TFLhAdc/opER+kngORBMcuJWf8iWyOuPGzSHwQGruUAlEfTG2rIQK2f8yBob+wPM6T9bTUOOcCJLyU25Vv7WiODWiN1WeCUkJ1Me96+wgUc3LH7VDdFa+py3xfW9xufmPx4RmximIUMm5qxxAfmTouRwxnJTM/rNw+Hm8F57eNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865723; c=relaxed/simple;
	bh=7ZwgfvpCHUY7nG3u/xf8i4DL5LcQn1HGZ9LrBRdWzww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u651reGFQFD4eDEXnEdtdas2JNrXOEizeqUBFPEROF0uIeHRf5/cGMxQlQLWQ/cYNJago8mc5K0RaN8ZqfJxRYpAgB7lER8QBys6rCH+W9z2Vyqksf/jq9FctDWsObpiE8cI2C5IaZhv8Vr2wzbnKIAC7JQ84fzcqGPYoG4aikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=k1H4Fhib; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865722; x=1802401722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+V2quRZlGdrIOdi+q0YW/XxutMNjAuj5pi8P6bpEJ/I=;
  b=k1H4Fhib6zTenici8kV8v2J8Va8QfK8vYZoo3eGIvHCesk4Bn/19z+Dk
   qzXMM1m7MulEQ7WPwvnU1KOhrxuuXgQR7vcuBaa8Z807sFz5wrKy/onHl
   J5O+QhkUxByKu+V/6kDQ/xFeiS2bvM76UNx0F5FcITkzGg8BBVPTxNAVI
   hQFw8XU/cSzeNJvDMLemjT34aKG49SGmTW07FrPbJyCt4eMQi/cnt6zhs
   zn3T1e4XUMqY4XXXdAIFv8jmZLvGwe+l5mrZpJgUaM3HNJvXaWJB/PxcK
   Fotwmbd9xK3LV6qBtrLfKilSgnswtwYcncswEMPUzPq+n1xjV70KlyWJc
   w==;
X-CSE-ConnectionGUID: gL/DgmoITdSJXJcTUJP9AA==
X-CSE-MsgGUID: u8WqoBR5RIqpHa8zZwPCYw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925908"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:08:42 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:27150]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id 7faf14d3-b066-4081-9f1f-a3021f9d8bb6; Thu, 12 Feb 2026 03:08:41 +0000 (UTC)
X-Farcaster-Flow-ID: 7faf14d3-b066-4081-9f1f-a3021f9d8bb6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:40 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:39 +0000
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
Subject: [PATCH 082/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_XXHASH crypto
Date: Thu, 12 Feb 2026 02:46:58 +0000
Message-ID: <20260212024725.11264-83-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D043UWA002.ant.amazon.com (10.13.139.53) To
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
	TAGGED_FROM(0.00)[bounces-11227-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63A0C129CBA
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_XXHASH-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile         | 2 +-
 crypto/xxhash_generic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 665299fd5a5a..6dc023d0851c 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -160,7 +160,7 @@ crypto-objs-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
 crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 crypto-objs-$(CONFIG_CRYPTO_LZ4) += lz4.o
 crypto-objs-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
-obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
+crypto-objs-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
 obj-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
 crypto-objs-$(CONFIG_CRYPTO_DRBG) += drbg.o
diff --git a/crypto/xxhash_generic.c b/crypto/xxhash_generic.c
index 175bb7ae0fcd..4e41c4d213df 100644
--- a/crypto/xxhash_generic.c
+++ b/crypto/xxhash_generic.c
@@ -96,8 +96,8 @@ static void __exit xxhash_mod_fini(void)
 	crypto_unregister_shash(&alg);
 }
 
-module_init(xxhash_mod_init);
-module_exit(xxhash_mod_fini);
+crypto_module_init(xxhash_mod_init);
+crypto_module_exit(xxhash_mod_fini);
 
 MODULE_AUTHOR("Nikolay Borisov <nborisov@suse.com>");
 MODULE_DESCRIPTION("xxhash calculations wrapper for lib/xxhash.c");
-- 
2.47.3


