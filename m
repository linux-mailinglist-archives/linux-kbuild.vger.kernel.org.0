Return-Path: <linux-kbuild+bounces-11199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKcnIopCjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11199-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:01:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462E129A04
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17BC63012BF3
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9A01A5B8B;
	Thu, 12 Feb 2026 03:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="dO6kUhBn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3834414;
	Thu, 12 Feb 2026 03:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865286; cv=none; b=WPgllH2xQuH/H+EpZHCo6WR5mnCmVGNVrK7xuW1amIphOPw1JtLJDE0uDta3f3gXafz+NFcIJz4HmJblbynUA544uBmX0hDMZvzTh3zrn4TxUbbJ0huyRtQHAK+lveH9k7Us3YwAssuKDNaiLhn5Gd6kDuVLrUz/yeqkzalMpng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865286; c=relaxed/simple;
	bh=HwUNx0MQt/VnOg2GHnzcRLYNcA3BcQbedLkoOArnpvo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XlqX6NL5YCl5Xmzu42UWjzgd+xSaCQojjQjBOOICiH+FhhnX44LB+7QtG0o8IB/zp77FWfDGKaaXK0sHo0LYvlKit+omkehx4pJrp6ZPHARO8C45+5pvsJ/Qw0MD1eHmfgHW0rnnWn57crPaoM9b9zoXP8uyGiWMWpF8lE+1Q/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=dO6kUhBn; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865285; x=1802401285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hcIM2QPZHzjzuquzQlPp2viA2Y2/npOOMsN3iH0l2+0=;
  b=dO6kUhBnliEgvZszOSeRLiKj0+dc67ugcjnsL+kdIMwNngx3Xnv8aWZT
   C32Izj+ZKdFrkrWkKE0sGxLxUyrsJwr+5iM37DOY+Y0Do5hIRKNOYMKST
   6EAxSkzcjGfTzxdnusCrTs6eeZKWKXaR7nt/tSv+p9u5PCwg7KRLhtPoO
   64JJWw2u4tnDMgYFFpLue/MuIg7B5AFIj4JKkymzzNeIT/aSkcdWh5x3Z
   8bGDP97AnsQ2Kkqn6HGQKJvvRrvzdolDDWKXoKCMn3OhOasGh+PjK1v3n
   VyUugz1bK7TuhffR3ACCTC5S2vBhqF3v5e7UIDAC+AQjy8yk+gp5M9GFW
   A==;
X-CSE-ConnectionGUID: oWQ5xUBZR+yjjKtxMzMC7A==
X-CSE-MsgGUID: 7FKYcYEnR3aD+dH9Xu/5cg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918024"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:01:25 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21642]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id d9355a1b-c65f-4f57-984b-ca1499704078; Thu, 12 Feb 2026 03:01:25 +0000 (UTC)
X-Farcaster-Flow-ID: d9355a1b-c65f-4f57-984b-ca1499704078
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:25 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:24 +0000
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
Subject: [PATCH 054/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_XCTR and CONFIG_CRYPTO_HCTR2 crypto
Date: Thu, 12 Feb 2026 02:46:30 +0000
Message-ID: <20260212024725.11264-55-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11199-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2462E129A04
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_XCTR- and CONFIG_CRYPTO_HCTR2-related crypto to convert
them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 4 ++--
 crypto/hctr2.c  | 4 ++--
 crypto/xctr.c   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 33e4e3a03c40..c3b0de034a47 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -95,8 +95,8 @@ crypto-objs-$(CONFIG_CRYPTO_CTS) += cts.o
 crypto-objs-$(CONFIG_CRYPTO_LRW) += lrw.o
 crypto-objs-$(CONFIG_CRYPTO_XTS) += xts.o
 crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
-obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
-obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
+crypto-objs-$(CONFIG_CRYPTO_XCTR) += xctr.o
+crypto-objs-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
 obj-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
 crypto-objs-$(CONFIG_CRYPTO_GCM) += gcm.o
 crypto-objs-$(CONFIG_CRYPTO_CCM) += ccm.o
diff --git a/crypto/hctr2.c b/crypto/hctr2.c
index f4cd6c29b4d3..78c0fc9faee5 100644
--- a/crypto/hctr2.c
+++ b/crypto/hctr2.c
@@ -472,8 +472,8 @@ static void __exit hctr2_module_exit(void)
 					   ARRAY_SIZE(hctr2_tmpls));
 }
 
-module_init(hctr2_module_init);
-module_exit(hctr2_module_exit);
+crypto_module_init(hctr2_module_init);
+crypto_module_exit(hctr2_module_exit);
 
 MODULE_DESCRIPTION("HCTR2 length-preserving encryption mode");
 MODULE_LICENSE("GPL v2");
diff --git a/crypto/xctr.c b/crypto/xctr.c
index 607ab82cb19b..e3dee674b941 100644
--- a/crypto/xctr.c
+++ b/crypto/xctr.c
@@ -182,8 +182,8 @@ static void __exit crypto_xctr_module_exit(void)
 	crypto_unregister_template(&crypto_xctr_tmpl);
 }
 
-module_init(crypto_xctr_module_init);
-module_exit(crypto_xctr_module_exit);
+crypto_module_init(crypto_xctr_module_init);
+crypto_module_exit(crypto_xctr_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XCTR block cipher mode of operation");
-- 
2.47.3


