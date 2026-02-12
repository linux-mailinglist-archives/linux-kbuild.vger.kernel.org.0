Return-Path: <linux-kbuild+bounces-11147-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP/EKGQ/jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11147-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:48:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EF12951F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3033308F806
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013B01FA272;
	Thu, 12 Feb 2026 02:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="knvjxhgz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8E8460;
	Thu, 12 Feb 2026 02:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864479; cv=none; b=XGVKwWWzkckY/I4WT74BoeNX9VlwEjtZMdkhxc6mpisvY0iZN5uGIeku5690p2ieOk9ux5Y//DmULFuN4i/4uJT0X6Hl/wxUAQ+rKwkFPP4iShpxdoxIC1saUriwvqBn6fNaU+jEghcIf45bquzYLXUD9DkzDW33fk6PL4/msOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864479; c=relaxed/simple;
	bh=6JkIjQX4YZPggS6vojmRGS9hz1ksxhKbyUprIamC4sI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jpP63geG2G2ebtDlPQ8H/UHb6YskPdPpVhB/lhtMCYxd5BGGntH6RmS2lwqJ8MZxIDi2VSrmmiOdQP9bZYn6yke1Pu/25BgtUp0S0KnBDZj7EiIJ/DFgiycrpllPzyj0ehLvFElwXEqjm5y1lyL+mheNCWIDs4stibUP7thAKOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=knvjxhgz; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864478; x=1802400478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z+DDGQ4ZUzmd3O/crIGH4EYx7vvVuN0RHu7GW85gsdA=;
  b=knvjxhgzKMnGb+wb8zihXLfH4zoLgovbtYxc+taPQqc5QXQhA/GjkrRt
   m4nTQCWXOpkMiILoLdtkXAKez6rZL0DlMQL0mimMHG3K0R5J1qtIPTBYG
   wE8/FirIyoZaiA5QXiqrdknZBxa3CL73nswUMEFnDB8MjPnswo/RQ49dC
   B2FZxG1ZrKue/iZ38JhhrwAd6d6D3bI2Dn2vAoXluaXTzUfvpSY7JBXJc
   7lIOuDtI9UfOGOcHaCrOyUhDWt+fBdNHqgi8PEqwxcKDgjaqCTTqJWYWE
   9gvDffUmvbbCv8UW/TI4PU144FkLPmmz40/54306+zkhU637taHt8NbJr
   A==;
X-CSE-ConnectionGUID: 8dsy0XEqRoOSA2AB/q9Peg==
X-CSE-MsgGUID: r/+a/rWQQV6ZLMTAXCU8hg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696253"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:47:58 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:30164]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id a67cd5c3-a7a0-47f5-983c-d19430df9733; Thu, 12 Feb 2026 02:47:58 +0000 (UTC)
X-Farcaster-Flow-ID: a67cd5c3-a7a0-47f5-983c-d19430df9733
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:47:57 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:47:57 +0000
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
Subject: [PATCH 002/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AES crypto
Date: Thu, 12 Feb 2026 02:45:38 +0000
Message-ID: <20260212024725.11264-3-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
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
	TAGGED_FROM(0.00)[bounces-11147-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 515EF12951F
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_AES-related crypto to convert them into pluggable
interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/aes.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 88de6dcbd7c4..da5a7a4aa59b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -134,7 +134,7 @@ obj-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
 obj-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
 obj-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
 CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
-obj-$(CONFIG_CRYPTO_AES) += aes.o
+crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
 obj-$(CONFIG_CRYPTO_SM4) += sm4.o
 obj-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
 obj-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
diff --git a/crypto/aes.c b/crypto/aes.c
index ae8385df0ce5..bda6a1cba552 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -52,13 +52,13 @@ static int __init crypto_aes_mod_init(void)
 {
 	return crypto_register_alg(&alg);
 }
-module_init(crypto_aes_mod_init);
+crypto_module_init(crypto_aes_mod_init);
 
 static void __exit crypto_aes_mod_exit(void)
 {
 	crypto_unregister_alg(&alg);
 }
-module_exit(crypto_aes_mod_exit);
+crypto_module_exit(crypto_aes_mod_exit);
 
 MODULE_DESCRIPTION("Crypto API support for AES block cipher");
 MODULE_LICENSE("GPL");
-- 
2.47.3


