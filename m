Return-Path: <linux-kbuild+bounces-11253-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EnvJd1FjWmL0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11253-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:15:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29148129F3C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B2AA301586D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9DF156678;
	Thu, 12 Feb 2026 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="atozbKdW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A0E555;
	Thu, 12 Feb 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866139; cv=none; b=EZOX+SLjrevCpmMf5rAk0DfZOZ8Z9WA6b8Tf3iJyQlbKtYs2jwbQkMpxk5N5sICyhtD6wuEapki6KS1EDlNDKzkmijy3VPhzo9eIvNg+7b7ntYr7MV/R60CapOPXfZK1MEy5IHtUhHzgI0fdAogTAav+x6FPosf3JXfKmt9Z2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866139; c=relaxed/simple;
	bh=L/8nFcP0pekBxZmAOXN4FmWLaAgdD3U3jVZv2ktIzdk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nO/wGNLFsfLfobSpKjchhf/3KxvwQIH6SfqsgQbKwfUDbrbtAdp/cZYPjy3+px8LDwnNCOWC2EOG9GZYrRVnuKcYVXazQbBHy+fChFyUFbjgjOzE29iZmHSz4EHGpgBFaLsASsztO1yCWlFaB7pftJRl9cWPC5rBGj6KowfqEEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=atozbKdW; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866138; x=1802402138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oTjo9ROXVjI/2wmUrUsKoQpSZIzGlVO4//e07fvuDBo=;
  b=atozbKdWCW1EZgkCUzLan/Z9zRCP9bMZ5hYcc011+pjQnprTO0cwDvm2
   w6c8uykHZHNkL8A/1HEMHRXKSfgwUVgSdwb2/usL8wVmNndpJJlDSUehe
   PwbR5X4G04v8WvEm+THqiHROON1dFvZxwWMo5aiWsY8QvmmHDzqHx4sDW
   C6a5Ynq8msZhnK4NuaF1173xQloRyT/E1RjBMUhjPRb6wIvFkoR+B9LaZ
   iKh2J9uyR1njfbi9XyWvKwnyv7j4tSIqgW9grDNeGdToRGxb5/OEMBVE6
   MDrWP2u4l2F28CYQSmIY5cn+YHzCcOlMV2rGqljnfyHcV+pGY5k0N0IP0
   w==;
X-CSE-ConnectionGUID: u7DjWA5SRICknfviD/cRpw==
X-CSE-MsgGUID: oWjtkTmXRxaD6345yCZV7g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744825"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:15:37 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:11956]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id fd90b74e-190a-4bb2-8091-a71622062c87; Thu, 12 Feb 2026 03:15:37 +0000 (UTC)
X-Farcaster-Flow-ID: fd90b74e-190a-4bb2-8091-a71622062c87
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:15:37 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:15:37 +0000
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
Subject: [PATCH 01/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAST5_AVX_X86_64 and CONFIG_CRYPTO_CAST6_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:14:59 +0000
Message-ID: <20260212031521.2124-2-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWA001.ant.amazon.com (10.13.139.103) To
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
	TAGGED_FROM(0.00)[bounces-11253-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 29148129F3C
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CAST5_AVX_X86_64- and CONFIG_CRYPTO_CAST6_AVX_X86_64-
related crypto to convert them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile         | 4 ++--
 arch/x86/crypto/cast5_avx_glue.c | 4 ++--
 arch/x86/crypto/cast6_avx_glue.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index ab248a1beb00..27010cb2326c 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -33,10 +33,10 @@ camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
 obj-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
 blowfish-x86_64-y := blowfish-x86_64-asm_64.o blowfish_glue.o
 
-obj-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
 cast5-avx-x86_64-y := cast5-avx-x86_64-asm_64.o cast5_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
 cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
diff --git a/arch/x86/crypto/cast5_avx_glue.c b/arch/x86/crypto/cast5_avx_glue.c
index 3aca04d43b34..267fc2948288 100644
--- a/arch/x86/crypto/cast5_avx_glue.c
+++ b/arch/x86/crypto/cast5_avx_glue.c
@@ -109,8 +109,8 @@ static void __exit cast5_exit(void)
 	crypto_unregister_skciphers(cast5_algs, ARRAY_SIZE(cast5_algs));
 }
 
-module_init(cast5_init);
-module_exit(cast5_exit);
+crypto_module_init(cast5_init);
+crypto_module_exit(cast5_exit);
 
 MODULE_DESCRIPTION("Cast5 Cipher Algorithm, AVX optimized");
 MODULE_LICENSE("GPL");
diff --git a/arch/x86/crypto/cast6_avx_glue.c b/arch/x86/crypto/cast6_avx_glue.c
index c4dd28c30303..5ab35cf5817a 100644
--- a/arch/x86/crypto/cast6_avx_glue.c
+++ b/arch/x86/crypto/cast6_avx_glue.c
@@ -108,8 +108,8 @@ static void __exit cast6_exit(void)
 	crypto_unregister_skciphers(cast6_algs, ARRAY_SIZE(cast6_algs));
 }
 
-module_init(cast6_init);
-module_exit(cast6_exit);
+crypto_module_init(cast6_init);
+crypto_module_exit(cast6_exit);
 
 MODULE_DESCRIPTION("Cast6 Cipher Algorithm, AVX optimized");
 MODULE_LICENSE("GPL");
-- 
2.47.3


