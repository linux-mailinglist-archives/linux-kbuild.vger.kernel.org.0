Return-Path: <linux-kbuild+bounces-11187-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PxqJ85BjWkT0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11187-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:58:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C591298D5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32F5B3021D03
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8540C223DC6;
	Thu, 12 Feb 2026 02:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OD6fAWIM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742192222C8;
	Thu, 12 Feb 2026 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865100; cv=none; b=ot2mbBKyykra/N1etBUFooXED2k+Go2gpAO+MOX2qlfwgPi8QidCaC/fy4S/Uf69WvHLNCDQ0PvTrdD0OpY8vNldpWnrf3hn/Xd8/skP84GVekD694De2bLmgKTu9v8yX32H1ZWpv6hw55ulXUMxkq1owek3vSSczeNODUhaD7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865100; c=relaxed/simple;
	bh=qxU0xLjlk6lJDkipBAVP/wvqEWu1YUGOgGadL9xSIxY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F0DnsugeZqmgOD6jBtk4cv7hGaofjYSOa63EwqXsVMtK6PqNoShfsoEFTSdskkriVNUPW7HA7C5Tlddv+MtO9GP5WNa3+4IodARaXRL4zL+4BOkVywJ/i2wYDLkzLV1AFwGFIxM5FcZOvIRJ0yr4auMFMAxmgoWYIyO74IgBhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OD6fAWIM; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865099; x=1802401099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zMrSmFzqkih8XAOQRY3DcYOYFr0kswNosCsHfdq5uis=;
  b=OD6fAWIMkyLlNrMDtPkI9s0km5JjTMEtj+Pj3F/ltIqM4tNNWFTgaIQK
   wUTATTgVefISy99Yv0m0Lgy7PnLWnlF+3/A03V8CGYhVe7x5uwetDJVDg
   8Ny+iAXY+vg+1mBzNlhttDz54gv9/M5kRUx2TkINfsZsXpdjUwj6M6jOA
   WfJD9+nnuNPZYRaOVt+In+5OkAyjP3UaptoR6FzaqlZPVth7ieXkJGhBl
   392DB7+TtpqxRO94Rpm6HN75ZP/7vJI9uZKLDJRujjPEuwCSYG2x/FSui
   m2zVwBn4AmIoZ0V/x5gSHLu/D+1lrLVTBEkL+tCbeSYRxshb9wjwQ5ce7
   Q==;
X-CSE-ConnectionGUID: WwInPJvcQLO1/NapbcYCpQ==
X-CSE-MsgGUID: M2PUsBEqRkO6HAvadnFuuA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721749"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:58:19 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:21076]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id d44ca3cd-180a-4131-8664-17ac9bbd4088; Thu, 12 Feb 2026 02:58:18 +0000 (UTC)
X-Farcaster-Flow-ID: d44ca3cd-180a-4131-8664-17ac9bbd4088
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:18 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:18 +0000
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
Subject: [PATCH 042/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_NULL crypto
Date: Thu, 12 Feb 2026 02:46:18 +0000
Message-ID: <20260212024725.11264-43-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D036UWC004.ant.amazon.com (10.13.139.205) To
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
	TAGGED_FROM(0.00)[bounces-11187-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 47C591298D5
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_NULL-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile      | 2 +-
 crypto/crypto_null.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c98e6a397159..6d1077d11538 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -75,7 +75,7 @@ crypto-objs-$(CONFIG_CRYPTO_USER) += crypto_user.o
 crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
 crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
 crypto-objs-$(CONFIG_CRYPTO_XCBC) += xcbc.o
-obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
+crypto-objs-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 obj-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
diff --git a/crypto/crypto_null.c b/crypto/crypto_null.c
index 34588f39fdfc..e2245e691585 100644
--- a/crypto/crypto_null.c
+++ b/crypto/crypto_null.c
@@ -148,8 +148,8 @@ static void __exit crypto_null_mod_fini(void)
 	crypto_unregister_skcipher(&skcipher_null);
 }
 
-module_init(crypto_null_mod_init);
-module_exit(crypto_null_mod_fini);
+crypto_module_init(crypto_null_mod_init);
+crypto_module_exit(crypto_null_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Null Cryptographic Algorithms");
-- 
2.47.3


