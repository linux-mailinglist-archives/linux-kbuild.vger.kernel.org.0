Return-Path: <linux-kbuild+bounces-11198-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNcbBn5CjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11198-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:01:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 332561299ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E27FF3018797
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A290D1D5174;
	Thu, 12 Feb 2026 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="NXg0Gn7s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AF83EBF31;
	Thu, 12 Feb 2026 03:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865272; cv=none; b=uzb5HIOZiinpL+XS3z7yfgzrlji4x9eWq4pySviN98NvnXZKUgrRivbQK2eA6se6mQPRQZzY7LVpgqKnH43FXdpodJPOxkzTaZx9ENEIWqFFzlAQ0A97QAoOwZoA4Zh9yg6NF0Jw1L38UkSWkk6q7Q5738Funp5KwpI0TwIf8RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865272; c=relaxed/simple;
	bh=3r7ht40/dSaRUq4ENEZ95KqBrd4/VyP5gW2BtgBmqkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmnRey9Ici3KOWuQYMRcngH2lSfS0kUB5jRrE0BLvnfuTa419JlYiVdFJ0e8SpRzmhofavm1wBhan8DLRNZe5dLIpPf+FnDGTczp64m7m5jgv+D2NUv3S6pl9EgkNOFDZt8CAm3OMQee+ECJS9l+SjHLCR3kUwPyrvF463F1wds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=NXg0Gn7s; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865271; x=1802401271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H24b9NbQmIPZ7x8DsV1W6Gp6H2uPR71iqVVMu1piz/8=;
  b=NXg0Gn7svx1AfgXje2EoEDACJ+erUUJBoq1t1gV4mDbNSjiPLK689I5N
   ADq8QibeMRQXp8gPF1oFgDhQ5SUAEUXzRMoYX2gQlZh7CE6aLK+s+m4hh
   vls9aU5njKE2hnnNudU0RUoGh+FaJuY1JRJ6PLwcOzv0MBZ06QLf+Q1S+
   utiMvzIy5PppCQL0ehcMGeGKWiNLcQnhbDB6lv/LgCAoZQvu6GzEZVKw5
   EYOg9upCKEp2wF8QLqd24EcK0a5ghbxISKBRAanR20ybBEsOUYARvo4uV
   nHsg6ziQrrZX8CnwJ9dkNf/5lmG+FFOBFk7INc/VNYGo8nl98cgvBkRDp
   A==;
X-CSE-ConnectionGUID: cbW6MUqmRZ2RXJ2jsirDSA==
X-CSE-MsgGUID: rorEgPC6QU6gTtrgqgUcwQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803560"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:01:11 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:19058]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id a253ba3b-c276-4167-a844-fba602f81218; Thu, 12 Feb 2026 03:01:11 +0000 (UTC)
X-Farcaster-Flow-ID: a253ba3b-c276-4167-a844-fba602f81218
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:09 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:01:09 +0000
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
Subject: [PATCH 053/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_XTS crypto
Date: Thu, 12 Feb 2026 02:46:29 +0000
Message-ID: <20260212024725.11264-54-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D045UWA004.ant.amazon.com (10.13.139.91) To
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
	TAGGED_FROM(0.00)[bounces-11198-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 332561299ED
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_XTS-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/xts.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 73c700538792..33e4e3a03c40 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -93,7 +93,7 @@ crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
 crypto-objs-$(CONFIG_CRYPTO_PCBC) += pcbc.o
 crypto-objs-$(CONFIG_CRYPTO_CTS) += cts.o
 crypto-objs-$(CONFIG_CRYPTO_LRW) += lrw.o
-obj-$(CONFIG_CRYPTO_XTS) += xts.o
+crypto-objs-$(CONFIG_CRYPTO_XTS) += xts.o
 crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
 obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
 obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
diff --git a/crypto/xts.c b/crypto/xts.c
index 3da8f5e053d6..97e499893292 100644
--- a/crypto/xts.c
+++ b/crypto/xts.c
@@ -466,8 +466,8 @@ static void __exit xts_module_exit(void)
 	crypto_unregister_template(&xts_tmpl);
 }
 
-module_init(xts_module_init);
-module_exit(xts_module_exit);
+crypto_module_init(xts_module_init);
+crypto_module_exit(xts_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XTS block cipher mode");
-- 
2.47.3


