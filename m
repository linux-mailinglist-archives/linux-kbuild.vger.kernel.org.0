Return-Path: <linux-kbuild+bounces-11226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF9iAC5EjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11226-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:08:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF28129C96
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F32130117A6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D40A22D795;
	Thu, 12 Feb 2026 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="tHvqE7zo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36192227E95;
	Thu, 12 Feb 2026 03:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865706; cv=none; b=jhvKsi5ieogZoN9yLHl6c3duc9kmBTVh4Cjk+jvXDWvLSq9KhKVZo5k7h73SMO0LYabRX2xTnW/WTQQVPeztV6aec4D/+p2vh/uGJf5ornqBZtjuXDUaC4jWpURvzBZXDBJRdl5JDUfXvlULBqWrt/kjayqFJ1YMeuMED4nN1/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865706; c=relaxed/simple;
	bh=PpNigO8nzFJXPJSFG6TcnwK3dtA01h16/aHdLAtZKDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=st2s4c9x1eyhk+qP/E6cdESitnhvKhwj7VO2DQGonvJRC2LL/WLZU/sbw7E+KBkRc586b3qp707w+O3Z7+J+BhVdZeyEXnietNUyRljqc/81kfDw9QKtMqslJzNbOkPOCWz7+W0wXGaIPWkDcUSpKU0E2tT42dPwbwKkmqQ8wtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=tHvqE7zo; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865705; x=1802401705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SigH3qhT1W02fti+ozYpcWAH5G7ujZMQz/JJay17EIY=;
  b=tHvqE7zoIq31JJfDaL29A4WW6FVuHMWpbo1WbCY2k9Sd98JXLy7zvrCQ
   SFHXKpDT/KyL89zrE9l4rebvu2BXDTV/RgkMEESEu2z7vDJs0iPQZqngk
   WpVCcUp6urwm4iIHOJAzumdeTgtuEqPuAf4WutNFi4JSTYbaOPeFIlB8R
   3vnbTG5qWfr+X47J1FfOFRoJotSpDStJLMLKM8OZ/jP4fYcA1PsWuRq69
   QZLoWwHx6AjYC6Sgk07H0JTxm5IMMwkVRfepBdlVsd0bm6etL8OHjqwHR
   HWEEE8HLPRv6wQY+g0QSf4+Zc5xPw/+/fu18HRonqLLfPMnTSczyl5tpK
   g==;
X-CSE-ConnectionGUID: 2OidXK/+TVq3rTmdDfU9ag==
X-CSE-MsgGUID: v/sxFuY8Riu4Q9629OZE9w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803833"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:08:24 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:22822]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 25d80b04-d4d0-460b-89b9-632ebe728b0c; Thu, 12 Feb 2026 03:08:24 +0000 (UTC)
X-Farcaster-Flow-ID: 25d80b04-d4d0-460b-89b9-632ebe728b0c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:24 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:24 +0000
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
Subject: [PATCH 081/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_LZ4 and CONFIG_CRYPTO_LZ4HC crypto
Date: Thu, 12 Feb 2026 02:46:57 +0000
Message-ID: <20260212024725.11264-82-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D046UWB002.ant.amazon.com (10.13.139.181) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11226-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BF28129C96
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_LZ4- and CONFIG_CRYPTO_LZ4HC-related crypto to convert
them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 4 ++--
 crypto/lz4.c    | 4 ++--
 crypto/lz4hc.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 61fdf39dc1ec..665299fd5a5a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -158,8 +158,8 @@ crc32-cryptoapi-y := crc32.o
 crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 crypto-objs-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
 crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
-obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
-obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
+crypto-objs-$(CONFIG_CRYPTO_LZ4) += lz4.o
+crypto-objs-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
 obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
 obj-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
diff --git a/crypto/lz4.c b/crypto/lz4.c
index 57b713516aef..e0aa6f465627 100644
--- a/crypto/lz4.c
+++ b/crypto/lz4.c
@@ -91,8 +91,8 @@ static void __exit lz4_mod_fini(void)
 	crypto_unregister_scomp(&scomp);
 }
 
-module_init(lz4_mod_init);
-module_exit(lz4_mod_fini);
+crypto_module_init(lz4_mod_init);
+crypto_module_exit(lz4_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("LZ4 Compression Algorithm");
diff --git a/crypto/lz4hc.c b/crypto/lz4hc.c
index bb84f8a68cb5..5365a0a8477d 100644
--- a/crypto/lz4hc.c
+++ b/crypto/lz4hc.c
@@ -89,8 +89,8 @@ static void __exit lz4hc_mod_fini(void)
 	crypto_unregister_scomp(&scomp);
 }
 
-module_init(lz4hc_mod_init);
-module_exit(lz4hc_mod_fini);
+crypto_module_init(lz4hc_mod_init);
+crypto_module_exit(lz4hc_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("LZ4HC Compression Algorithm");
-- 
2.47.3


