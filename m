Return-Path: <linux-kbuild+bounces-11260-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB0ZE01GjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11260-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:17:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 734DC12A002
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72B63300693E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD49225415;
	Thu, 12 Feb 2026 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="RSpzvsVs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF23722301;
	Thu, 12 Feb 2026 03:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866247; cv=none; b=Kk9s8yc7MMOjPVGmV/pz8Rm3uOo/4AVIFTwoPRON41D0ajx1gdzgy5tuNKufvjvgudUgd9BPPR4wNLWRiaN8290LPWhkTNEmNxQeeRSfSomdL22MWJqQZgZc7IGgnz41RXoA+IfL5WMYvQNgQmpMM7VYTtgYa0JkxdAbauEduc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866247; c=relaxed/simple;
	bh=0KXRVYZCHRR79SFJoJ714087iscvIIT6/CGc9XkaVCM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d7uGlWR5IVmYb1qAUtMdRJiJ6N6NutN6DnDet5RbOA7iDKCVBZsrMoU/oMRQzO3HlehJLviGluOTGeqVEk+VB0nxosJXfAkU4SKrhFzPXCeMnjq4kcaAatesIu2btcZVTjBcU7N7vOm6ZYWTCOtVfW3s0iJ0zfR3cTpoOZsX7fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=RSpzvsVs; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866246; x=1802402246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ks5RRjIgkxTbfasAWkG78UQ32BoSv39pFoWSn/7AVNI=;
  b=RSpzvsVsFf+N1wziTzBTAapSkwQdJ/6Tfox16wOGL7TlG8PvazW2HC7Y
   CYYtfMfyHGvlXP/p1biHM/7zoEI3Ljx2B3eDER/ovXUlvHV1ZzaukgzxL
   864K/i1VQwncc3B84K4E8Khoj3CdKHO7NtzsCeNH7i/6Rbl7chTtmuYqr
   k+QHsW4KR2bknKvo4tH9WtY3RWtAN0Is3G2sjqQqoAl4qM3B58gJ3ZIgO
   mC102m9jll2wGBoUacAm6G0wyFsSPaELp+z5yFdhVG/qZkwNje3twrGma
   snIWrZkU/HOvM+Z2A3RKYbaF0ZqonCHp7JiDvOtnq0U/1zXfd9EExSYfL
   Q==;
X-CSE-ConnectionGUID: oQvgtM6sRpOitCMX/AZjzw==
X-CSE-MsgGUID: 9ldyTFF4Tiq3Er7oO076KQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12804115"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:17:26 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:25165]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 7a096068-6ef6-4dd8-8351-a0bdce9aad5a; Thu, 12 Feb 2026 03:17:26 +0000 (UTC)
X-Farcaster-Flow-ID: 7a096068-6ef6-4dd8-8351-a0bdce9aad5a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:26 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:25 +0000
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
Subject: [PATCH 08/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_DES3_EDE_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:06 +0000
Message-ID: <20260212031521.2124-9-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D032UWA002.ant.amazon.com (10.13.139.81) To
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
	TAGGED_FROM(0.00)[bounces-11260-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 734DC12A002
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_DES3_EDE_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile        | 2 +-
 arch/x86/crypto/des3_ede_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 5f7d35f8d313..7118a7dba3c6 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -20,7 +20,7 @@ serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
 serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_DES3_EDE_X86_64) += des3_ede-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_DES3_EDE_X86_64) += des3_ede-x86_64.o
 des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
 
 obj-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
diff --git a/arch/x86/crypto/des3_ede_glue.c b/arch/x86/crypto/des3_ede_glue.c
index 34600f90d8a6..1d1ce0f862ff 100644
--- a/arch/x86/crypto/des3_ede_glue.c
+++ b/arch/x86/crypto/des3_ede_glue.c
@@ -381,8 +381,8 @@ static void __exit des3_ede_x86_fini(void)
 				    ARRAY_SIZE(des3_ede_skciphers));
 }
 
-module_init(des3_ede_x86_init);
-module_exit(des3_ede_x86_fini);
+crypto_module_init(des3_ede_x86_init);
+crypto_module_exit(des3_ede_x86_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Triple DES EDE Cipher Algorithm, asm optimized");
-- 
2.47.3


