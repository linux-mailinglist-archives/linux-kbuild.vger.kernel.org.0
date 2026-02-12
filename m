Return-Path: <linux-kbuild+bounces-11164-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DiEZJG5AjWn00QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11164-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:52:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E271296AD
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 903CF3019A21
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3CE221271;
	Thu, 12 Feb 2026 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Meytf1Ul"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8D8C1F;
	Thu, 12 Feb 2026 02:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864743; cv=none; b=pJ/TMISBr6biQqO/ZmQ9+qJ4WyVlamgKQbPT7y/MyG9RCzhEa2QmAf4Mdu+RbIPIWm/X29dmUt81/X4+Z/eNEgQ6Iv9rXjFBOpw6lT1cY18oCcULxtmUWEGuhQN51wNkdDjLd+OKyeRtbLJfrnxUJ/6CVlxH9hj3RqxcuLPEVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864743; c=relaxed/simple;
	bh=/amtgAfsRP2Mh+kH0zLW0650WyME5CQSHJcrNpWqT5Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/+FxYjkW7BlC22MlSZYuzXj64VZiYRQmZ144LIsd6H7pO2Bl3zKXZPh6MZCM9epEIRxRRTrxHKj9xYlxKHjfEdNiljsoP1Ik611jOviQxgPragSqkcmo6CCRKutbaJRNWQSsgWIZTTfXLJwPq/mhH2KCgwh/FG8rcnaACTlDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Meytf1Ul; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864742; x=1802400742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IHc1xX6Ny/1KQete+3SBOc4q1ddi9Vs8bpEGEtoXe6U=;
  b=Meytf1Ul+L6CcqgrgGocdPrkShAhqnlaRTFfC5uq4k10BtpCqL4VFH9k
   AMZZZ9vIoHGONFQrEcF65d8A7d/yh0v75ZjgztcEDPcwYCi6zDSyAtxpY
   Qvxf6etQapmU8S5YS/2rMRCZTol2EsiiYhzJmQgmlZXN8gElYB5+JINvN
   M7I0mbJ0E1yBYVGcapr/HQdC8G826SbgMc+IUM8qwfg8997vRHYHoAYIO
   FMuGDLAE43RQECF/pvMqDQ6wYOIB9v/ioMpZPfT3miifSvda1wyhmRA7x
   TZR6p1oyf6k0GJAHeyK70kQrojb1KqgOTLJR0r3VD4KQVAjPguvKw1ys3
   Q==;
X-CSE-ConnectionGUID: v9N6cePqQwi3BSYKvGOi0w==
X-CSE-MsgGUID: sMTwPccuT7G3uzl4uzIUFQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744052"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:52:22 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:29933]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 052a295b-db9f-4b93-9d72-fea55f17e200; Thu, 12 Feb 2026 02:52:22 +0000 (UTC)
X-Farcaster-Flow-ID: 052a295b-db9f-4b93-9d72-fea55f17e200
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:52:21 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:52:21 +0000
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
Subject: [PATCH 019/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SHA512 crypto
Date: Thu, 12 Feb 2026 02:45:55 +0000
Message-ID: <20260212024725.11264-20-wanjay@amazon.com>
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
	TAGGED_FROM(0.00)[bounces-11164-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oracle.com:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4E271296AD
X-Rspamd-Action: no action

From: Vegard Nossum <vegard.nossum@oracle.com>

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SHA512-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add sha512.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/sha512.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 45e055a8c0f4..47ff0136c7c5 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -81,7 +81,7 @@ crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
 crypto-objs-$(CONFIG_CRYPTO_SHA256) += sha256.o
-obj-$(CONFIG_CRYPTO_SHA512) += sha512.o
+crypto-objs-$(CONFIG_CRYPTO_SHA512) += sha512.o
 obj-$(CONFIG_CRYPTO_SHA3) += sha3.o
 obj-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
 obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
diff --git a/crypto/sha512.c b/crypto/sha512.c
index d320fe53913f..6e40932862d5 100644
--- a/crypto/sha512.c
+++ b/crypto/sha512.c
@@ -404,13 +404,13 @@ static int __init crypto_sha512_mod_init(void)
 {
 	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
 }
-module_init(crypto_sha512_mod_init);
+crypto_module_init(crypto_sha512_mod_init);
 
 static void __exit crypto_sha512_mod_exit(void)
 {
 	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
 }
-module_exit(crypto_sha512_mod_exit);
+crypto_module_exit(crypto_sha512_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Crypto API support for SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512");
-- 
2.47.3


