Return-Path: <linux-kbuild+bounces-11264-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPU6BZ1GjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11264-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:18:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7590B12A06D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84AAA30A6453
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4200823EA89;
	Thu, 12 Feb 2026 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ebyj8gRs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5CB21CC7B;
	Thu, 12 Feb 2026 03:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866310; cv=none; b=oignu4R7jIm4tFQE5PwUoh5COFaRf+c4xP/2Qe5ZdaB4Tzp3wH6RryM6j9qzTqedzqjLTS4Xv4jsBmXXhvEQjUCRWhEQ3CKmKoYzCNPO26YvsKyocFBn6Pi41NajoPvf8ZuePCUshNsDzJBPx6/MBg6zLzHvrV0ZU58qf1dFEXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866310; c=relaxed/simple;
	bh=WHr8jiE8/qC5yZ44bQh1dTDRz3/jNuMNBB21ro3KkQQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hTuJHyBAyHhsuXhEQGvZz7dL3MXYiMzo4fypFD+LnK0W1DeiCEDtM4289TvJxbvPkxOxlYrvykb8D/Ww+Sy6JOMZ0MCXqE+CyJXOz7wuvAHnEFW1IHVPLEvqQ0ejC5pT8i0fbUe4n3oHo4mVh95Q9hL85Af57yTGIPwgq074rAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ebyj8gRs; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866309; x=1802402309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JWmGCMiahk6rMIqmNHFYOGvVIqcEeeZgAqw/5vR9qgY=;
  b=ebyj8gRsyZJ6jzGvTVXaGn8cS4uHya5P8c+dOQvcsyxSt2dE9koyNUK+
   lmYcI3nijVSrjMXrT/PQc3uncM6XNGzJgIEdu/2hARkSJsxbvbvgu7/vk
   XLzgvBB67VVZqShqE9dT1lJLWm8r1zC1St3HnT5ZJ5xwouHZhmnYs6i/9
   6mVvAjdrnS+DcroSFtuGqBuY5GcAGCPG83KBchLD4u5L5P3k5xuASCvQ1
   I7sQY5eLftFAtR7tbKSF74WsxhDjGBjt6EzUx7oxvZP5gLXIMDyYHO+AO
   lX/3LwjKSkYPeebuhDmpVJR2AIbKL6u/UcUCjqUsd4ubPAYaeWyyUx9j4
   g==;
X-CSE-ConnectionGUID: TJeEmFZuR2SUIQHH5TdQ6A==
X-CSE-MsgGUID: tt/+nctbSO2jNBGFjDQSyQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918626"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:18:28 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:1346]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 41ee8e33-d059-4d09-993d-928189603acb; Thu, 12 Feb 2026 03:18:28 +0000 (UTC)
X-Farcaster-Flow-ID: 41ee8e33-d059-4d09-993d-928189603acb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:28 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:27 +0000
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
Subject: [PATCH 12/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:10 +0000
Message-ID: <20260212031521.2124-13-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWB002.ant.amazon.com (10.13.139.188) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11264-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7590B12A06D
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile                   | 2 +-
 arch/x86/crypto/camellia_aesni_avx2_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 205b4467ab79..7e68f6bcfa29 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -27,7 +27,7 @@ crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
 camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
 crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
 camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_glue.o
-obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
 camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
diff --git a/arch/x86/crypto/camellia_aesni_avx2_glue.c b/arch/x86/crypto/camellia_aesni_avx2_glue.c
index 2d2f4e16537c..4b270dc2b9f5 100644
--- a/arch/x86/crypto/camellia_aesni_avx2_glue.c
+++ b/arch/x86/crypto/camellia_aesni_avx2_glue.c
@@ -122,8 +122,8 @@ static void __exit camellia_aesni_fini(void)
 	crypto_unregister_skciphers(camellia_algs, ARRAY_SIZE(camellia_algs));
 }
 
-module_init(camellia_aesni_init);
-module_exit(camellia_aesni_fini);
+crypto_module_init(camellia_aesni_init);
+crypto_module_exit(camellia_aesni_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Camellia Cipher Algorithm, AES-NI/AVX2 optimized");
-- 
2.47.3


