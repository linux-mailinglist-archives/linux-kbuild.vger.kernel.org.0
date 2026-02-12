Return-Path: <linux-kbuild+bounces-11220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPg+E89DjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11220-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:06:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C61129C03
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D54A3063D46
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FD422A1D5;
	Thu, 12 Feb 2026 03:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="RioUHRgZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B83EBF36;
	Thu, 12 Feb 2026 03:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865612; cv=none; b=Q4AhtO2WC47vDPnTHlCcghKe6qhD5hFYVKs1wWYw71+EdMIkCmGZq4Q2uBnl3hl+ZMAHhlTF+aSBjoLWv/vARm3u9nC4pnybUWskvLumBPIhUhZm5MXqgz9zKNXN9etYHiywjeDPEcvLKxvltKSbDV4r69+VSrTOE0VnlGozHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865612; c=relaxed/simple;
	bh=xoyZUe3f5GOiLShd9Upbg/K1UGMARHg0HN5IXOnQlXI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZPXAeeVt1318tvejQ/B13XeqFQwD6naYKDSJfUzZGxWELXjRAzV4hFlraY05hYuPJpaof7nWnXJW7upDq8u+9Wy1EpFsgwXCDwp0bRiaInFw3gSoCF9kLiSrPV2L4HgQWVUuSchbV6ZDKlqA1NJg4clDusyw+QJDJPJMQFQzS1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=RioUHRgZ; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865611; x=1802401611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OXRc31HewtINDW/60Kk8Ctr2HOh9mqZlICBe5VcmIsI=;
  b=RioUHRgZ0TKbarTpMrUNw/bBspR0zH6dpn8QW8CbKM9d4JwWOUjhUrhy
   HgaTVAl5yGyK0vMn8zE9bqlKcrMPO+3X5pJ4WnaolAU07yNcDqISr1KKy
   EfK7D+X6ryhd2itp+Qw0txtwuHP5Wd/asKphyLafXVhxjZB6mWTGEludl
   rthOYAShvV7l/SAkKOShSnNy3O/f3Cy8rgoNpGU1mWPEkfFZv1+ub2wRo
   Y3ky345OzCmmMuSxkEW4YqCJq+Wv8zXqkY1cyE62uOFIGtTjkJQBQra9U
   ap2j7RZgcdUqs/HRejCqAHEV+DgsuVnRD9OLdauNqBe7yRHuvhrjk2Uw1
   w==;
X-CSE-ConnectionGUID: fLfw8lEdT22wj34mlHZrCQ==
X-CSE-MsgGUID: tHr9xS47Rz29tVMiB1ZqRQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925822"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:06:51 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:20371]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 21371ec5-7b2c-4c35-8d5b-c17f7dcfb95a; Thu, 12 Feb 2026 03:06:51 +0000 (UTC)
X-Farcaster-Flow-ID: 21371ec5-7b2c-4c35-8d5b-c17f7dcfb95a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:51 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:50 +0000
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
Subject: [PATCH 075/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SEED crypto
Date: Thu, 12 Feb 2026 02:46:51 +0000
Message-ID: <20260212024725.11264-76-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
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
	TAGGED_FROM(0.00)[bounces-11220-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: E0C61129C03
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SEED-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/seed.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index fb863dcef44f..3e515caa72f5 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -145,7 +145,7 @@ crypto-objs-$(CONFIG_CRYPTO_ARC4) += arc4.o
 crypto-objs-$(CONFIG_CRYPTO_TEA) += tea.o
 crypto-objs-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 crypto-objs-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
-obj-$(CONFIG_CRYPTO_SEED) += seed.o
+crypto-objs-$(CONFIG_CRYPTO_SEED) += seed.o
 obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
diff --git a/crypto/seed.c b/crypto/seed.c
index 815391f213de..f98ea0d623bd 100644
--- a/crypto/seed.c
+++ b/crypto/seed.c
@@ -460,8 +460,8 @@ static void __exit seed_fini(void)
 	crypto_unregister_alg(&seed_alg);
 }
 
-module_init(seed_init);
-module_exit(seed_fini);
+crypto_module_init(seed_init);
+crypto_module_exit(seed_fini);
 
 MODULE_DESCRIPTION("SEED Cipher Algorithm");
 MODULE_LICENSE("GPL");
-- 
2.47.3


