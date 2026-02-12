Return-Path: <linux-kbuild+bounces-11206-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M8/DvdCjWk80gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11206-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:03:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D129D129AB2
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 427CB302459B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE0521579F;
	Thu, 12 Feb 2026 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="gte8YKTi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240F34414;
	Thu, 12 Feb 2026 03:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865396; cv=none; b=vFjKw5MqGsotG9rykb4O/Wz9bUobo4xvlsvLFVGO3UQkaUySrWYPqZ9zCL9N97wMBLeVvRTHXOZlI/GEoqAKOB/etsSfSaKH06DV6JD3OOOKgOSTI2jJx2OH7jHD3DgRJ2BQ/8tkFDcTVgxrz33AjwdhGfAVO8HGURWTqARpan8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865396; c=relaxed/simple;
	bh=EixoE+nqeZVQ1GDBk0r1HUlX4AWLSZLGblOpWHy17+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJ6/eRSEnfjgPt9hdxN8dUeqZhlgd2L2q+RPZiKuz463yyoPp3AhM5TG4MKgtuC0FbHQJ/Aj1gBt24GiP+3t5ovu5+QF5rAU4UbIujhVkoLogiedCxvqINxplmA3qqCLBNX9xyo1BHRY8AgT9MUTuY/kbAKZdCujIZCrOjnU0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=gte8YKTi; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865395; x=1802401395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=89RAHbymNlpPr5HhU6ZsHWvoiW8igRCRiXYsg7/UfNg=;
  b=gte8YKTicvwdFKXv6T2Mfk+FTaN4D6P44UOf6YAo9IN+RNNDutlqDtdd
   gvGxPIeyKrwhuufvKFed2CY1IJ8/0tWTa80RDuGYVZHz74LQ7e1rz/Xu2
   1H0DtRNSBzanqDkzauvQXjUwqKcV8grCWqnbOJS7VcIm4FhBHhbhxZihY
   trzk0Z4itka5qcDzTkzIrUiyy8tZXeG46WnHJO4R7N2PLrcimwyHBR7uV
   yzn3EB9jRZttmGObmB8dkX+f+YSNkQs8xKsNskZa13f7/cOK+JAfzTjHf
   oJRjO+mHFnus9VEONsl7H5rn+5LZn6LfkrdFOhlLWvoWzr8uOKmo4eiGo
   g==;
X-CSE-ConnectionGUID: oRxsmPxTTBi0aXVA5yEpUA==
X-CSE-MsgGUID: ty0GsxmTTWayBMRs93rtCw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12698619"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:03:14 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:6394]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 4b5f2fa1-eb0e-468e-b07c-e089398f5ca2; Thu, 12 Feb 2026 03:03:14 +0000 (UTC)
X-Farcaster-Flow-ID: 4b5f2fa1-eb0e-468e-b07c-e089398f5ca2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:13 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:13 +0000
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
Subject: [PATCH 061/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_DES crypto
Date: Thu, 12 Feb 2026 02:46:37 +0000
Message-ID: <20260212024725.11264-62-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D045UWC002.ant.amazon.com (10.13.139.230) To
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
	TAGGED_FROM(0.00)[bounces-11206-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: D129D129AB2
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_DES-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile      | 2 +-
 crypto/des_generic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index f029e0decaa1..05fdb0e2f1be 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -126,7 +126,7 @@ CFLAGS_aegis128-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
 
 crypto-objs-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
-obj-$(CONFIG_CRYPTO_DES) += des_generic.o
+crypto-objs-$(CONFIG_CRYPTO_DES) += des_generic.o
 obj-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
 obj-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
 obj-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
diff --git a/crypto/des_generic.c b/crypto/des_generic.c
index fce341400914..8f767317d396 100644
--- a/crypto/des_generic.c
+++ b/crypto/des_generic.c
@@ -122,8 +122,8 @@ static void __exit des_generic_mod_fini(void)
 	crypto_unregister_algs(des_algs, ARRAY_SIZE(des_algs));
 }
 
-module_init(des_generic_mod_init);
-module_exit(des_generic_mod_fini);
+crypto_module_init(des_generic_mod_init);
+crypto_module_exit(des_generic_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("DES & Triple DES EDE Cipher Algorithms");
-- 
2.47.3


