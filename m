Return-Path: <linux-kbuild+bounces-11188-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EED+EN5BjWkT0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11188-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:58:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B60081298EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8C2A301CD98
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B186223705;
	Thu, 12 Feb 2026 02:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="tWtsT8Pi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24292222C0;
	Thu, 12 Feb 2026 02:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865115; cv=none; b=l3LJE+6rE7wXtySbG2GnWy+YqeZbBQw62OUw0SzvdsUDh1S5qau0+GQ9YYLbBEO+i4hWVcnGRE8HE0/toGkKD2/Yrk31AYWAgRTt4D/RFe/OPs1xOO6HUUnAmQW5M0fSsMQ8rxPBVR223N64GAutWzpIWyBNi9tXFghNH4ySRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865115; c=relaxed/simple;
	bh=VaXqqVIEakQaKGriPrqyfCxyybYTtxn/lOwvwbyGrj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aeHovOTWy3rZU9Xu5sKQIh1Ipx5F0BrN0IReBISUfE8ILPrMiJG6PSOokPxUINUvXjdbaJOYIe2zE4j1lJ6YC/tXYBkD8AyuoRwK6dOHCwdpI48gYKHYsUFmbTJjbnE3sQLqKDqd1XmDkXlZmsLPFomb5R1Lj6vbnFkRtJ24hC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=tWtsT8Pi; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865114; x=1802401114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=flzSj+E4vNp+VFuNiWmt4wZmmrAwtkhkLySSdZKQetk=;
  b=tWtsT8PiAdlopIdOL59vQAace4yD3+3uyCRM1m70DtUcas2Y0NNcpfSi
   guuenEFiz60SYX1ipiTDGixjtPzh9W8PsTPHg5xHQy31f7SOHshGGaAC1
   n4GbI4Cm7J88P4e+WXYyKNEZsFL81d7WJvuk9v0u4bKeJ3qjHsOV8v/WF
   3XgTa1mL1ljTYaMS17bTojiCGpiEOYNlOS4RANvQSfQ2U40VgFvIeftJB
   LVNFZCyTqaaNzX1W+T+i9dIuqS+l4grILn5RMGTFp0hiea6L0TLKQThWd
   cnRMgLLcsTPpnkbkuw6h+9+2Zc/QgRkxMfHLlfAA5u9jIuiLBOQTWIyQz
   Q==;
X-CSE-ConnectionGUID: 1enCQATrTYmHXsq6ADvyHA==
X-CSE-MsgGUID: EmF6xoqtT4uyvH1fB4umZw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12726889"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:58:34 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:23999]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 6fa141b7-5f7c-4da4-a5b3-31d5f2b0c84f; Thu, 12 Feb 2026 02:58:34 +0000 (UTC)
X-Farcaster-Flow-ID: 6fa141b7-5f7c-4da4-a5b3-31d5f2b0c84f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:34 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:33 +0000
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
Subject: [PATCH 043/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_MD4 crypto
Date: Thu, 12 Feb 2026 02:46:19 +0000
Message-ID: <20260212024725.11264-44-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D038UWC002.ant.amazon.com (10.13.139.238) To
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
	TAGGED_FROM(0.00)[bounces-11188-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: B60081298EC
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_MD4-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/md4.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 6d1077d11538..32f038ff47de 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -76,7 +76,7 @@ crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
 crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
 crypto-objs-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 crypto-objs-$(CONFIG_CRYPTO_NULL) += crypto_null.o
-obj-$(CONFIG_CRYPTO_MD4) += md4.o
+crypto-objs-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
diff --git a/crypto/md4.c b/crypto/md4.c
index 55bf47e23c13..04a7ce7eb460 100644
--- a/crypto/md4.c
+++ b/crypto/md4.c
@@ -233,8 +233,8 @@ static void __exit md4_mod_fini(void)
 	crypto_unregister_shash(&alg);
 }
 
-module_init(md4_mod_init);
-module_exit(md4_mod_fini);
+crypto_module_init(md4_mod_init);
+crypto_module_exit(md4_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MD4 Message Digest Algorithm");
-- 
2.47.3


