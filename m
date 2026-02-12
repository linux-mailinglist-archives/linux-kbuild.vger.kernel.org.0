Return-Path: <linux-kbuild+bounces-11174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BNiMAZBjWn00QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11174-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:55:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38878129791
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2789130234F5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F9C22172C;
	Thu, 12 Feb 2026 02:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="lABdFPZy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FFF221290;
	Thu, 12 Feb 2026 02:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864898; cv=none; b=Fze2SEYa8jbtRgPAkX3IAy405ybPn9et8NPS3cQFEHyrTqwtjWhikgAiAFHKG3w3EqoMfnn3ZyG5DCflyHtgrIlw6xjhvyx282UOrrte7gm6E0seOaNfO3TS4aeOwkj7J85HgQSTO1S9JLAhoU1wNycFNyeLZC9/VorbLaqMqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864898; c=relaxed/simple;
	bh=angO4uZwErdXwOWlSlcrUQcdBzkmZoX9jRd8/8rczhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K29XAvrulrbkhl7OhoSQD7n3FdO1IHOmRy2a39cHisfuKbgJseRc38qa878izI2cgCHG5ajqis7aVC4RKkV2iTW8MjUcTHCotgU1rmo7dVZBMUIPbLOnUhOC75UXwOa+GzB5g94yP7Nc9sBYwm2GqXH6sghBeqcFj4v/eZeXLSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=lABdFPZy; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864897; x=1802400897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hvVcO6BartKxz5hQoyho81ZeR5L/+lOP68DaWIU2J2Q=;
  b=lABdFPZyW3PNiww7Mcdwgm0/I/vXBG7Hx6vjNK2ctDeixQqWuUMm19Kt
   NjjMVWCnUIHewNlcn2qzUvu4jOzwFNqCM2VJ4Zxtk2H4eI+8lEvHMZ8TS
   lKTHTtk5HaGnnYHLXnER2Zcm0KO8xehjrcuNHG5rXPK69PWZLxJmBcbYy
   WUZASHRdLo98FQ0tOqifWsBpARBjq+/ca/Cf7JoQ4Q6KJ0nOk5y2F1JkS
   yKbxb5xwA9l5Bwu+srt1WhckZuJJ3pmDhuHN6dRSlEJaFTMTwpnStQwyY
   WOa5egSZQ927B65C1qdm2z5o5ZINLrWuhntzgWXc6D/lwJFEhxS7yFhYA
   A==;
X-CSE-ConnectionGUID: +Rykoz2/SnKr09RbIkc48w==
X-CSE-MsgGUID: FsqPUuYxTb+CvFx38yBAUg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918045"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:54:57 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:3335]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id c0e30a81-a4d8-4277-8f24-085b6d4405ff; Thu, 12 Feb 2026 02:54:56 +0000 (UTC)
X-Farcaster-Flow-ID: c0e30a81-a4d8-4277-8f24-085b6d4405ff
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:56 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:56 +0000
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
Subject: [PATCH 029/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_DRBG crypto
Date: Thu, 12 Feb 2026 02:46:05 +0000
Message-ID: <20260212024725.11264-30-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D036UWB004.ant.amazon.com (10.13.139.170) To
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
	TAGGED_FROM(0.00)[bounces-11174-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38878129791
X-Rspamd-Action: no action

From: Vegard Nossum <vegard.nossum@oracle.com>

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_DRBG-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add drbg.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/drbg.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 4c87e141c961..25f0d9d56469 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -163,7 +163,7 @@ obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
 obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
 obj-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
-obj-$(CONFIG_CRYPTO_DRBG) += drbg.o
+crypto-objs-$(CONFIG_CRYPTO_DRBG) += drbg.o
 obj-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
 CFLAGS_jitterentropy.o = -O0
 KASAN_SANITIZE_jitterentropy.o = n
diff --git a/crypto/drbg.c b/crypto/drbg.c
index 5e7ed5f5c192..f4eba9ef6d59 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1882,8 +1882,8 @@ static void __exit drbg_exit(void)
 	crypto_unregister_rngs(drbg_algs, (ARRAY_SIZE(drbg_cores) * 2));
 }
 
-module_init(drbg_init);
-module_exit(drbg_exit);
+crypto_module_init(drbg_init);
+crypto_module_exit(drbg_exit);
 #ifndef CRYPTO_DRBG_HASH_STRING
 #define CRYPTO_DRBG_HASH_STRING ""
 #endif
-- 
2.47.3


