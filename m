Return-Path: <linux-kbuild+bounces-11231-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHQzN3xEjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11231-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:09:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D0129D16
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1F27301DF59
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E8B232785;
	Thu, 12 Feb 2026 03:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="JOYYT8U9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9351F12E0;
	Thu, 12 Feb 2026 03:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865786; cv=none; b=Eh4awOAVSagBlfhZ+P6zFx3AJXzHvgb7b62Fo1OXGDiplNGKhxfmWNdEGQyB8LGNSLaMcsVGX5q2FhAS3tsqOBSTGYFBJbocorAJQZnfaADAvLv0VhquIoGf0C3E4C7DrxAKfMYkGvycdABSYpPBe6SL39PMgqmztowiowjYz08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865786; c=relaxed/simple;
	bh=4qNHha6kbYNoaJz9FsVNHCWb9D8XmB2P+kzZuljIl9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHuhai7x3rFdmraD9EZhQTEoyKcedl5so4N86bDsQpsXemPAGn/6fLAn2UFPVApHpb0IgVI8r+rRJLdoywC6EASggmEZizhq6egSKwtPNPSYgz8YSnyntGF6IHmsXjtHF/MJHyaSSYR9dNPdwmTxyyU3Dd2QERQbBYYirO9oiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=JOYYT8U9; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865785; x=1802401785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tUzJ8aK1Uq53ZYDUBh4IkKALfInFWeWEiHBeEV75MNs=;
  b=JOYYT8U97YQ7dyZOZZVxzkBJyIZIeDqrRAe3x8ROzK7SRmaPLWTQjsR+
   PrqGLylbMPBJh/EBDcXP2nQ06ZvX67QnI3hL5dyfItRLccMZ2/Uh3GuPP
   lFizk8CL3LUI05U6A7Z/Jd4v8njMfMnqlQrJERntUksRCsU517lAOb5v6
   sSl0O2GRIHJRMJm+6Q1mFA58UWE6s1TUPNkXglzFHSkmzBXT+70ROK8Qk
   qB4sMEW8oGYl2aEL3hzI9GRWm9irQJsALJ5vbjHzAKOvf/uZ9347i99Dt
   D71rRDSVTh33NzukWiSt3gPNwz7t3dEXnLknt8Us+VsL9o4V6PaOGgREL
   w==;
X-CSE-ConnectionGUID: NP6Ha8QjQKmpY66UOBtDGA==
X-CSE-MsgGUID: mMaRphw+S3SBNcb6MoaMpw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12722247"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:09:45 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:12565]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id b8126939-da4a-48c1-a430-d0997f1c5823; Thu, 12 Feb 2026 03:09:45 +0000 (UTC)
X-Farcaster-Flow-ID: b8126939-da4a-48c1-a430-d0997f1c5823
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:09:42 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:09:41 +0000
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
Subject: [PATCH 086/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_USER_API_HASH crypto
Date: Thu, 12 Feb 2026 02:47:02 +0000
Message-ID: <20260212024725.11264-87-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D039UWA003.ant.amazon.com (10.13.139.49) To
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
	TAGGED_FROM(0.00)[bounces-11231-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D0D0129D16
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_USER_API_HASH-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile     | 2 +-
 crypto/algif_hash.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 39b42843d321..13d0ee856885 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -173,7 +173,7 @@ crypto-objs-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testin
 crypto-objs-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API) += af_alg.o
-obj-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
diff --git a/crypto/algif_hash.c b/crypto/algif_hash.c
index 4d3dfc60a16a..b5ec5cfb2ae8 100644
--- a/crypto/algif_hash.c
+++ b/crypto/algif_hash.c
@@ -464,7 +464,7 @@ static void __exit algif_hash_exit(void)
 	BUG_ON(err);
 }
 
-module_init(algif_hash_init);
-module_exit(algif_hash_exit);
+crypto_module_init(algif_hash_init);
+crypto_module_exit(algif_hash_exit);
 MODULE_DESCRIPTION("Userspace interface for hash algorithms");
 MODULE_LICENSE("GPL");
-- 
2.47.3


