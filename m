Return-Path: <linux-kbuild+bounces-11277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHcNHmdHjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11277-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:22:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCDC12A178
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60806300B47F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040F821CC7B;
	Thu, 12 Feb 2026 03:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="KpIqPyiO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080325782A;
	Thu, 12 Feb 2026 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866531; cv=none; b=uJIW/AbPRf5YZoWEiuIrpJASDoLIty6RcLE1cp6VvK6WBtGENChvZnYecqD0T2AYhCepovzOPXeokWktLoUox0QebAS1RXZuumc+KbsnQbB6Y+P/muBjlb4qh+1hPG/UHWG1vZnwT2++c9iCE6yH0fsVJdNr/MUw5YMAOT9foyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866531; c=relaxed/simple;
	bh=o5OK6EebIn2R+2dAn0+YBBlPwr/qYeIsrO2VzrHZN3s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhY7eyzPy0/f9Zdvwm20gQfyc9+jLgkhlKbwmsg26cTb18Io7bVPDmoRJrJUQ8Qjzg7f2nUdI6yzEplZj2GRkGrvWcbZNTSs3RiW5IBQ3lgpAnjpSSW9rjIL3LwLB4PLVmWLl7n6+djoa+uFVwW9y91YHh8toxWnYXIp9kiEgpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=KpIqPyiO; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866525; x=1802402525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z/NVq/5n4YYeyvBLh8R7bGnXKtDgVWmW0jOnB9Jf7f4=;
  b=KpIqPyiOaAFWYjKLwNBF2EbdWFuMqXbw1iibcI89GpEPIadrAl2vwxBr
   5ODQOR6logLtHdZ0a2WEtSTUUN17YBGAO5wnaE9Ys9YzltVK/Au4bbr92
   GN0N8LYZ/ShV8fQ1+fkUf9A7aiaiUmTdScDjqNPoljaBo4Srw6cTjPS1S
   /cfv5BpfBHCt2IbOhrt9Fbs66hbT332arEHOe1+jbW8hbxhO4Q4bS+W+c
   myQzssxB+E9IEkZjq939wzgxfWg/dtjh5vhoBjf9cdYxIG97FX2gAfKIK
   U5sxmmdopTwCXyxZ5zLawgBLJqWLLc4VmKdkXfo4CT8QTKpQRzwuPbhx3
   w==;
X-CSE-ConnectionGUID: qgBWPn4GQjSN8sC1VvyiNA==
X-CSE-MsgGUID: cev0yhS+RGm64dZZkx3ucg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12722680"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:22:05 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:13076]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 40520674-8465-401b-878c-f2672665a45b; Thu, 12 Feb 2026 03:22:04 +0000 (UTC)
X-Farcaster-Flow-ID: 40520674-8465-401b-878c-f2672665a45b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:04 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:03 +0000
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
Subject: [PATCH 03/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_ARM64_CE crypto
Date: Thu, 12 Feb 2026 03:21:03 +0000
Message-ID: <20260212032117.9166-4-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
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
	TAGGED_FROM(0.00)[bounces-11277-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 1DCDC12A178
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SM4_ARM64_CE-related crypto to convert them into
pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile             | 2 +-
 arch/arm64/crypto/sm4-ce-cipher-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 43cac8d5738f..a4fe2bf71c6b 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -11,7 +11,7 @@ sm3-neon-y := sm3-neon-glue.o sm3-neon-core.o
 crypto-objs-$(CONFIG_CRYPTO_SM3_ARM64_CE) += sm3-ce.o
 sm3-ce-y := sm3-ce-glue.o sm3-ce-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
 sm4-ce-cipher-y := sm4-ce-cipher-glue.o sm4-ce-cipher-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
diff --git a/arch/arm64/crypto/sm4-ce-cipher-glue.c b/arch/arm64/crypto/sm4-ce-cipher-glue.c
index bceec833ef4e..0baa7dced9f9 100644
--- a/arch/arm64/crypto/sm4-ce-cipher-glue.c
+++ b/arch/arm64/crypto/sm4-ce-cipher-glue.c
@@ -76,5 +76,5 @@ static void __exit sm4_ce_mod_fini(void)
 	crypto_unregister_alg(&sm4_ce_alg);
 }
 
-module_cpu_feature_match(SM4, sm4_ce_mod_init);
-module_exit(sm4_ce_mod_fini);
+crypto_module_cpu_feature_match(SM4, sm4_ce_mod_init);
+crypto_module_exit(sm4_ce_mod_fini);
-- 
2.47.3


