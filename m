Return-Path: <linux-kbuild+bounces-11234-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL7fA6lEjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11234-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:10:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFBF129D5C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 742A63014505
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53C9233D69;
	Thu, 12 Feb 2026 03:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="eVXmpjAc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EF1E55C;
	Thu, 12 Feb 2026 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865830; cv=none; b=H0qcZOiR/yK1MeQ+zxoVIv7SwE3Ua0CqrpNxAnYFFRXN+4iDA4tLoQENFhUpJ7Pl8Uhxcd+qI70NO1c4oxOX7fsefiXoo14bnIZqvFcu6eZEIndWcf72jiSjNXcZ9XY0blgdhc+CCcY+8EZ1UKtute34ps0EZiUdy+lY5HcFtKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865830; c=relaxed/simple;
	bh=Ttbo32PEDpVIxhB+eAToEuROZY+11AC/0XT9sJXLczM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fx+AUggDNZJ3Rn5ausQocaJ0RzIG+mnWohOZkVaJnnyUxoSjJi4CZ50u3xXV203l9lzWGlsg84q/4ZT0Mai0yiHhyXxI/c817dCLg/m7c4CU+pLEm11kM5o1dmfUbEGUC+ps356pX2f1DKVr751wtzAEzHxw8ILvSD+jPonD2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=eVXmpjAc; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865829; x=1802401829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oUt3E0bw1JOFhiOnnpZ3GNQ3ovfILofeZPuYyuxvGCQ=;
  b=eVXmpjAcloBqMDS5F2fgqxa3gs7RXIaJ6NAAjwb+ATnppSPAJrYmRbQA
   VhNasu1SrkhnsWL1yvtT1i5a6VANAflkxBktjPoXZm1nFu94lnPN4Y6Z3
   +h2A1ca+JYmHdK7bUkPo+mde7KGKYVP66eQDt5eQC+zczTe9/GkvK1R40
   ud/LxTWAGI4HwVuc0JNLxeywC5+2Q+qH7cMSAn+BB3kQZVp+e6B0Dpb1g
   TaiVO+8AOUmcxQ8wQ87x1JL77h6BXwGY+8ey5YOOzn1I05ih7G/5EDdJ4
   T3Cv/zsvhjK6cb9UuEdVVF6xSTVF5dgKrVBqNEvkSSoDOZW4UY+HBWdPm
   w==;
X-CSE-ConnectionGUID: G82QdE3cQBW4zod7BXqXLA==
X-CSE-MsgGUID: FSXSqSsXQRCId5lJU1Si8g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744640"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:10:29 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:25373]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id 66029a14-84c5-4afd-943d-452e9121052e; Thu, 12 Feb 2026 03:10:29 +0000 (UTC)
X-Farcaster-Flow-ID: 66029a14-84c5-4afd-943d-452e9121052e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:29 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:28 +0000
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
Subject: [PATCH 089/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ZSTD crypto
Date: Thu, 12 Feb 2026 02:47:05 +0000
Message-ID: <20260212024725.11264-90-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
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
	TAGGED_FROM(0.00)[bounces-11234-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 7CFBF129D5C
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ZSTD-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/zstd.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3f4cd954ef06..c4516e1943a7 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -177,7 +177,7 @@ crypto-objs-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
-obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
+crypto-objs-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 crypto-objs-$(CONFIG_CRYPTO_ECC) += ecc.o
 obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
diff --git a/crypto/zstd.c b/crypto/zstd.c
index cbbd0413751a..3b9fe204c68c 100644
--- a/crypto/zstd.c
+++ b/crypto/zstd.c
@@ -307,8 +307,8 @@ static void __exit zstd_mod_fini(void)
 	crypto_acomp_free_streams(&zstd_streams);
 }
 
-module_init(zstd_mod_init);
-module_exit(zstd_mod_fini);
+crypto_module_init(zstd_mod_init);
+crypto_module_exit(zstd_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Zstd Compression Algorithm");
-- 
2.47.3


