Return-Path: <linux-kbuild+bounces-11212-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BPRN1pDjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11212-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:04:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99042129B52
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64CE43012BF0
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118D5225788;
	Thu, 12 Feb 2026 03:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="LGRj7g4c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52B4414;
	Thu, 12 Feb 2026 03:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865489; cv=none; b=EbSoAbdzXkNzTEiSMs2hSFYx4p8pOfpNg/npg44cAHs8wM1f2HS+unFagaXHDCv2DvTi89xZcF87ocf4swSzMTT3Hnb+j7oJZIO6gUZODbmWWsrjKqNPL0EQ3tEYcqNaktAGFkOWBiwz0dgs8pw1eclgHw1lfHqpXrkJ4AVkQpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865489; c=relaxed/simple;
	bh=5tjJrPtIvYZJLX/I/xeJrCDLPGj/ZZz5Q4VCV0UL5wA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OmEFYZV7vX5GDr63EKwcski32C825DbLO0wwEpNkSY5+vrr2UxUy/lZWdMFf05brDp4yHbQEmfuQo4BZn3QwlOQIwTmTCojvDs6EOj7r/0nEUDOHutJv1MgXptDDxMqLU6luCNQERHgOMbbVB5y6hquZ4jZlaYsjDe8Fmiyv7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=LGRj7g4c; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865488; x=1802401488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UVGkpJTVsL+FyCWcWP400rPsQjsveSWDb4RH3dOg7gE=;
  b=LGRj7g4cQ5dHxwSyH+OYhRATuYPB7t9aqP99f60blf4IRamQBpEdm7sG
   fD7WP7SMIcOr8t0cF1LOcDwxO1afZghOFY5eH6dSs2RVP/jDzVz3/1me6
   Z8TZPZ9qum1w2M4PFXhySy5X89DjdwTf0DI+EFAoNErhTqkNf3a4PX7/O
   b6YcLaTySS+oyvfu772XDfEM8K4Xd9CnZubRdNF56paG65Bn7Xkjo2WiE
   TIG/MLQ9KvebgkGdmcU0+7z7JkUolGdWifQa9osYLBAJFJfWOom8D5Du4
   VvrBNzgY677JdOAsm1iohnF3GPsveSnVXwgaIku/MYheUyF6tShl2F0xy
   Q==;
X-CSE-ConnectionGUID: 18Sxd1zRRqO0OqvE4GnGhg==
X-CSE-MsgGUID: C+082kb1R5iNgXAyweXmng==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925744"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:04:47 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:9044]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 14d16219-9707-449e-baf1-fbb72541182d; Thu, 12 Feb 2026 03:04:47 +0000 (UTC)
X-Farcaster-Flow-ID: 14d16219-9707-449e-baf1-fbb72541182d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:04:47 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:04:46 +0000
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
Subject: [PATCH 067/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAMELLIA crypto
Date: Thu, 12 Feb 2026 02:46:43 +0000
Message-ID: <20260212024725.11264-68-wanjay@amazon.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11212-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 99042129B52
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CAMELLIA-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile           | 2 +-
 crypto/camellia_generic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c14713e9cc55..4b6e56ad4d1c 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -137,7 +137,7 @@ CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gn
 crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
 crypto-objs-$(CONFIG_CRYPTO_SM4) += sm4.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
-obj-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
 obj-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
 obj-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
 obj-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
diff --git a/crypto/camellia_generic.c b/crypto/camellia_generic.c
index ee4336a04b93..15a68abc387b 100644
--- a/crypto/camellia_generic.c
+++ b/crypto/camellia_generic.c
@@ -1064,8 +1064,8 @@ static void __exit camellia_fini(void)
 	crypto_unregister_alg(&camellia_alg);
 }
 
-module_init(camellia_init);
-module_exit(camellia_fini);
+crypto_module_init(camellia_init);
+crypto_module_exit(camellia_fini);
 
 MODULE_DESCRIPTION("Camellia Cipher Algorithm");
 MODULE_LICENSE("GPL");
-- 
2.47.3


