Return-Path: <linux-kbuild+bounces-11152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC5AJLI/jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11152-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:49:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16656129592
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBEF3308F2CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4A621B196;
	Thu, 12 Feb 2026 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="twKleUxr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E66126C03;
	Thu, 12 Feb 2026 02:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864558; cv=none; b=KpuFCBmDkdiU85IVXc6KUd54PEjDbIgoKhKOEI2B3XeMk/9V2bz811ZL50baXKa23vA/MVlNXG5hDgn4RzzGMBsESXeWrrLiDnv2pDejZsGI68jksLu2EJbiM+UhfV58ba8bwHezcHWc+g+8Y/rNaIo6ml1yVMdCb+gAoiB9YmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864558; c=relaxed/simple;
	bh=NDZaS2G16tPwkVjRna9XmklJ4YsuB6tPcTclrU3FkVY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnqiUwjIc1D05/aRnjUVkAHQrlACcWbzE5cu5KhZDSV/cLU8Hd7MhOAHlOgPbAac0DM3gKgZlbkJDBj+CxhRB8ZW5H/vyut0nPctp/xKCChjmgd90OLIJFf51V2Ps2bWvhPRQdmaclZEUwAClY0t8cEUku+qfEyZ2xiRGhiV1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=twKleUxr; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864558; x=1802400558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XkYRmBeLlVK96xipe1wH+Gv+FhwFfQJv88wu7hrGthw=;
  b=twKleUxrXivHKQgpKT+fZQg7BSGtKeyFYGDrE+qcFWd7VJoZ54ciPU/I
   jcLTUy5HGizqzdiyQJ4EhIZMA5wB28/1BCxMZtXet9NzWcUtXsANvvVKz
   MK8ZMKlL50IUMjTjCkwjYdkRKkvLgBfc/q3xE2L+AJyCnKAPeBY4HV6JW
   0N0oAxdkMTXppPhp+n4wIXcmgXJjzfCVAjnQEh0fhPD61+RArcAqnb8gK
   qARlmf/gc6MrB3MhIMZT37JQnjermwrpU5yyNZQJVHlAnrkurQ7zvh/71
   DLw3tOn4OFm0zG2iMiJvumOHL14YfBGPBFIi9/B+k64anN4IZZ2e/g07U
   A==;
X-CSE-ConnectionGUID: N8v+bGPXRWqD9L2z0DA0Qw==
X-CSE-MsgGUID: y2LGAyxbQVWddxKrLncY2g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12743911"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:49:17 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:11453]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 16bcda96-ab50-4cd2-beb5-55617a94c476; Thu, 12 Feb 2026 02:49:17 +0000 (UTC)
X-Farcaster-Flow-ID: 16bcda96-ab50-4cd2-beb5-55617a94c476
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:49:15 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:49:14 +0000
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
Subject: [PATCH 007/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ECHAINIV crypto
Date: Thu, 12 Feb 2026 02:45:43 +0000
Message-ID: <20260212024725.11264-8-wanjay@amazon.com>
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
	TAGGED_FROM(0.00)[bounces-11152-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16656129592
X-Rspamd-Action: no action

From: Vegard Nossum <vegard.nossum@oracle.com>

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ECHAINIV-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add echainiv.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile   | 2 +-
 crypto/echainiv.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 4d6f1c927db4..f14758177ee3 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -27,7 +27,7 @@ crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
 endif
 
 crypto-objs-$(CONFIG_CRYPTO_SEQIV) += seqiv.o
-obj-$(CONFIG_CRYPTO_ECHAINIV) += echainiv.o
+crypto-objs-$(CONFIG_CRYPTO_ECHAINIV) += echainiv.o
 
 crypto_hash-y += ahash.o
 crypto_hash-y += shash.o
diff --git a/crypto/echainiv.c b/crypto/echainiv.c
index e0a2d3209938..d409b4169e83 100644
--- a/crypto/echainiv.c
+++ b/crypto/echainiv.c
@@ -145,8 +145,8 @@ static void __exit echainiv_module_exit(void)
 	crypto_unregister_template(&echainiv_tmpl);
 }
 
-module_init(echainiv_module_init);
-module_exit(echainiv_module_exit);
+crypto_module_init(echainiv_module_init);
+crypto_module_exit(echainiv_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Encrypted Chain IV Generator");
-- 
2.47.3


