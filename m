Return-Path: <linux-kbuild+bounces-11266-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDiCLrZGjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11266-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:19:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2C12A08B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D59B6302E423
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666D223D2B2;
	Thu, 12 Feb 2026 03:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="IGqhPuEC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA9C21CC7B;
	Thu, 12 Feb 2026 03:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866356; cv=none; b=e9DYyciMvDhBuOGzwdCHM8YfHPCNTjChjsf33k8tg4/LmRLABTtvEmWI16d9VZxyG3OmNCshoMH21evRgovkwm1WRroMR6hZgW1KcE8jGONahf+tyrJirq7iDHU7ZpTxsan991TvLCxjIjDGIW8MKgm5So3pt1vGxm75W/5vJno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866356; c=relaxed/simple;
	bh=XciVuV2IZ72U/fNsq3ULUnjDFQFScQbjMmL9HW2gpK4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IfKqqjYXyRe+EShpTE0AKsk3rCy051pi2Q22k/4R6OqRyj5YsctKb/z7WZL7gTVkszDk+aAayHBoA1hLM73cl5dbu5tSUyiplSHcRODsKwsBxc8Qa3ZLvt5psZJ7WWur+eMv9I8Q4ffn1AnTyS9MJz6y51tNGabvqj1/UxZBZ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=IGqhPuEC; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866355; x=1802402355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1XeDfYrq0hOTcBCf2HrS8kRzGovR+lou0alnynujV+4=;
  b=IGqhPuECX2k+wvjeeQi4oii0r7E6SCheqeCjZVAmTrViT6rtrMe6h9jZ
   aC6XBRcOoF67Fce2/ltSMvPqwXz7RybDe6kXr3qH1wM24/6mhL9LqUPIa
   dW6XwDOdWEq2bsqOYGGsSoL+fvg8iH797ukdhhTemN/FcZ/6bXTHSxUsx
   NptHsJcCgSY+hm5f8e651Uh2MqQt5Mjnd+eBEC3I24VwMvuKtvOiWERNj
   8KNgnY4we35HAjIheQXkwpg1vC7Jlrg/Yq18xZuXT02n5Jp8BfIoGfdmD
   kVXLrmve+nw/AEvggs4YuzwPzXIPCNp7rQwHv8G9HMTf3BJAfE1nCMCct
   w==;
X-CSE-ConnectionGUID: DhQbE13mT1WKtdhiOCuAOw==
X-CSE-MsgGUID: 4n/P123+QS+PclXJZZ4w3g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12456010"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:19:15 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:7031]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id ffbcda7a-381a-4f66-a172-049b77184616; Thu, 12 Feb 2026 03:19:14 +0000 (UTC)
X-Farcaster-Flow-ID: ffbcda7a-381a-4f66-a172-049b77184616
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:19:14 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:19:14 +0000
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
Subject: [PATCH 15/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL crypto
Date: Thu, 12 Feb 2026 03:15:13 +0000
Message-ID: <20260212031521.2124-16-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D043UWA004.ant.amazon.com (10.13.139.41) To
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
	TAGGED_FROM(0.00)[bounces-11266-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 27D2C12A08B
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile                   | 2 +-
 arch/x86/crypto/ghash-clmulni-intel_glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 601e4c8a9e7c..b65f66577ffe 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -50,7 +50,7 @@ aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-gcm-vaes-avx512.o \
 			       aes-xts-avx-x86_64.o
 
-obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
+crypto-objs-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
 ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 
 obj-$(CONFIG_CRYPTO_SM3_AVX_X86_64) += sm3-avx-x86_64.o
diff --git a/arch/x86/crypto/ghash-clmulni-intel_glue.c b/arch/x86/crypto/ghash-clmulni-intel_glue.c
index aea5d4d06be7..02301df7fef3 100644
--- a/arch/x86/crypto/ghash-clmulni-intel_glue.c
+++ b/arch/x86/crypto/ghash-clmulni-intel_glue.c
@@ -155,8 +155,8 @@ static void __exit ghash_pclmulqdqni_mod_exit(void)
 	crypto_unregister_shash(&ghash_alg);
 }
 
-module_init(ghash_pclmulqdqni_mod_init);
-module_exit(ghash_pclmulqdqni_mod_exit);
+crypto_module_init(ghash_pclmulqdqni_mod_init);
+crypto_module_exit(ghash_pclmulqdqni_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GHASH hash function, accelerated by PCLMULQDQ-NI");
-- 
2.47.3


