Return-Path: <linux-kbuild+bounces-11237-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBohDNhEjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11237-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:11:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6A129DA1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5503E306FF4B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2E923184A;
	Thu, 12 Feb 2026 03:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ca5ATE8S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E3E55C;
	Thu, 12 Feb 2026 03:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865877; cv=none; b=JimLcn4IvpNshAnY69h3Tm666ikrFqm5xM8RzNI5yzOvKmAozuvzxMNaYAynVwJwaFydwGyenl8xXHXnYFnYZIfvDsYYWpdYVGdDceiK87CpjpSMh8Ivc01vpa0FM6n0mNZdD1l8bQXVkGKS5PJ2Loz5rUt4xRtu8Mu7oghhUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865877; c=relaxed/simple;
	bh=TxW8S+PiytnJJFunsT78z65+GTIDuAclws+vZkEHOHA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wc0eLkMbPPhwO2GWuVozmYhwemPpXNP0zfwPGFUizgalxQMPa0PWiRVNwVX/ukmSxgT35V3Pf9UsmHQ03hcABWnxYBXLNQxVFhtio85rew/+b8L1RRYqmHw9ky2KX+m4rZDI5MzNZUFJ0Kh9lYWjDK64njEljiO7Bg/G/S4EeGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ca5ATE8S; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865876; x=1802401876;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=teRQ469Nql8dnjGK42odTTdwkBKcylLAZvUmdlwdLAM=;
  b=ca5ATE8SYqTFJzseKBgrhO2y88azMigUCPbYcQQAzUGv3H3pOvLE7lIW
   YSVcvnMgpfg4FwngD2rOu3GABSMHskqNA9z6HchyqxacBBTPLaEeePnj9
   IYaRz715EiehTbeCe9nK8XCG1sVVqRQEplKA8hTNMoRtigGBPaIXCAhLi
   Jg73D6Un3mJA70RXGc/cQ+2j5cgwKq6hMIlIcUdIXZPwyd6TEuYYXR1UE
   yF7mtCiUGOkP8mcu5RU52782Ue+1ty2HquPxiL/53JGGC+jP0CR3cY96F
   Z8GclUlcdOxoEq0DL+gNBuey+N/vMzjy6XeEWKkOdF1opLxxd5AI0WraZ
   A==;
X-CSE-ConnectionGUID: RhsYn6fHS7yYJIdYgt5VEQ==
X-CSE-MsgGUID: XmOXcqrQQguc+wadrHll/g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12727630"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:11:16 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:25574]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id f7d5bce0-9999-4b4a-aff5-5f74cf21e156; Thu, 12 Feb 2026 03:11:15 +0000 (UTC)
X-Farcaster-Flow-ID: f7d5bce0-9999-4b4a-aff5-5f74cf21e156
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:15 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:15 +0000
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
Subject: [PATCH 092/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ECRDSA crypto
Date: Thu, 12 Feb 2026 02:47:08 +0000
Message-ID: <20260212024725.11264-93-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D046UWA001.ant.amazon.com (10.13.139.112) To
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
	TAGGED_FROM(0.00)[bounces-11237-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[altlinux.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CE6A129DA1
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ECRDSA-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/ecrdsa.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index cdc74dcea2f1..dc70a464fc1a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -191,7 +191,7 @@ $(obj)/ecrdsa.o: $(obj)/ecrdsa_params.asn1.h $(obj)/ecrdsa_pub_key.asn1.h
 ecrdsa_generic-y += ecrdsa.o
 ecrdsa_generic-y += ecrdsa_params.asn1.o
 ecrdsa_generic-y += ecrdsa_pub_key.asn1.o
-obj-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
 
 #
 # generic algorithms and the async_tx api
diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
index 2c0602f0cd40..b9cd02a7e515 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -288,8 +288,8 @@ static void __exit ecrdsa_mod_fini(void)
 	crypto_unregister_sig(&ecrdsa_alg);
 }
 
-module_init(ecrdsa_mod_init);
-module_exit(ecrdsa_mod_fini);
+crypto_module_init(ecrdsa_mod_init);
+crypto_module_exit(ecrdsa_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vitaly Chikunov <vt@altlinux.org>");
-- 
2.47.3


