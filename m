Return-Path: <linux-kbuild+bounces-11219-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMO7Lb9DjWlS0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11219-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:06:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BA8129BE6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3EB2306FF53
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D8D21C16A;
	Thu, 12 Feb 2026 03:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="RpcI+Uyh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE86FC5;
	Thu, 12 Feb 2026 03:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865597; cv=none; b=bqIttvND7kRCGzxIo86ui5Ght6QqH7vu36mP3xDTtSXSAc0i6k5uNsxZuheLb/qvZtxGPDgmMxnSOm0/YHR+Lfg/3FVHMtH7vhLxaSiqVLaxCJJUZZzjsK8op1W8+k8rCPs8mwUhv++xOp+1EjPIK1+RIo3IK8fQNNMvbqOiDaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865597; c=relaxed/simple;
	bh=FLJ5CYH/GQPhtCk0rfyw55Prxd4BwCppdc9z40Rr4fU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XCrP4yFPtyJ1nPwNUknQZBIfIz75x/OZQmgiPwAoPGy30S7jwix67cZNpMmA7ZENX7qphvoZxIwbnwROhYZGg6dp62aGYrVcFXoyrorFNfxzs+Dpj5ewxGyMZdsfguPhpZZIaiKpcyI/e7AN3bWGfUXQ0f9CHtz5v//DDQkEaFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=RpcI+Uyh; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865596; x=1802401596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TC9YwJma8KBAf8fwbPJGdiMNy3qGt5GVF+YbsQP//Zk=;
  b=RpcI+UyhSkUq4AOdEaHFcmtUpAgdMeAmz4w9ZIXeU9rtDuKlAKG0vKO7
   DxY1VyUr3fvrE03PKasHy9DVzKjey62rrhUNSmkn49YvOBPQZ3/fxaTL1
   G/wxRkisZQJ4w44dItGy2LtAckMXyPZE65VxEO3cQsdVjOR4aOKoHWrNj
   VzOnNFH3IrjjGu3BOWi+JibysgfkyhbYCef9hpxutzEgbTQd6uR+lD8p2
   LrUcLHhaRZAywPahowbS2D8VQMlkUe/rBFhFj330FdsKn+Tu9VZFFbr0Y
   3zq4jywOa/Jw5A9aM4tx2BKUjjGoWwjRIo/a18DkXlptyg53NHYQh+JUp
   w==;
X-CSE-ConnectionGUID: l72oRZZjSp+qHRXzxmZvRg==
X-CSE-MsgGUID: OyZzLncOTnqD/AgpLx1teg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12697108"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:06:36 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:11385]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 8da3713f-578d-4a6c-851c-76dc4e1bc59e; Thu, 12 Feb 2026 03:06:35 +0000 (UTC)
X-Farcaster-Flow-ID: 8da3713f-578d-4a6c-851c-76dc4e1bc59e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:35 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:35 +0000
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
Subject: [PATCH 074/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ANUBIS crypto
Date: Thu, 12 Feb 2026 02:46:50 +0000
Message-ID: <20260212024725.11264-75-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D046UWB003.ant.amazon.com (10.13.139.174) To
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
	TAGGED_FROM(0.00)[bounces-11219-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 23BA8129BE6
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ANUBIS-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/anubis.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 87f1b0e315f2..fb863dcef44f 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -144,7 +144,7 @@ crypto-objs-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
 crypto-objs-$(CONFIG_CRYPTO_ARC4) += arc4.o
 crypto-objs-$(CONFIG_CRYPTO_TEA) += tea.o
 crypto-objs-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
-obj-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
+crypto-objs-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
 obj-$(CONFIG_CRYPTO_SEED) += seed.o
 obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
diff --git a/crypto/anubis.c b/crypto/anubis.c
index 4b01b6ec961a..3d179d739fbd 100644
--- a/crypto/anubis.c
+++ b/crypto/anubis.c
@@ -691,8 +691,8 @@ static void __exit anubis_mod_fini(void)
 	crypto_unregister_alg(&anubis_alg);
 }
 
-module_init(anubis_mod_init);
-module_exit(anubis_mod_fini);
+crypto_module_init(anubis_mod_init);
+crypto_module_exit(anubis_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Anubis Cryptographic Algorithm");
-- 
2.47.3


