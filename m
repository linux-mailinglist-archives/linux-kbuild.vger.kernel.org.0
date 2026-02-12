Return-Path: <linux-kbuild+bounces-11195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIpMEk1CjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11195-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:00:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB621299AD
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76A8B30257E4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB42D19C540;
	Thu, 12 Feb 2026 03:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="f9zQHDzQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81883EBF31;
	Thu, 12 Feb 2026 03:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865224; cv=none; b=cjHRt7H5F1U7hjn3k2vdpgO0x4lqVbxJXld138IC6+cw/3kFuJrQWQvCCY+GcCSljEqgqnGg6VrY+UycgOyPiLRFrnrh+ba5ePkjc86av5HyOu6uFZN/SxD4t0jxtjz1db2BxAllyVU3JDa9olm14FOTw0DJAXjJvvMW5pH/kho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865224; c=relaxed/simple;
	bh=pJF2ea7N7NoZrh/4fihqyP/0agNTbxLLLWn/jLw2dcU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hxHWAPa7a2jtLSzSz/8fW6vfh/5Vwrs3cggDAA92RUcW9GY3vdCgQrSJsH0CPuDZVgZpsvK6EczJnQ1hQiCNLX4ceeprWtseusGy7xbYThgaHLcscTYP2ICvKCl96E6lDrQt/iFsWLJ+9N4qOmktHlgXH6/R+T6c9a/ANhJT9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=f9zQHDzQ; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865223; x=1802401223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wv5uBZN7AGEzCLoYq2GhjRdJJtr3r5ZhMOJL4OyOMMg=;
  b=f9zQHDzQICDsVPhtW/WQXi9ZRijQFHOZ8mB57j1pm3am6hKniBtgF1FL
   lA8cdVRdUObu56D1gJossEaZpjLDH5z/95BXPSGXYRAN+H2D2ionPQ75I
   I5BJ0P9aPYWD1E8sItMXasdHpYiXx4jki4p60bhdPebbQX81nRqTezaEU
   7TcfC4yclGPkAwH4GtuOr1mDwQWM69h5MNK1s6bwPx5QYBfixxsM3b2C0
   9lvsyOijzbymXqfPxrpgsbOWAzoV3FiJsq7YNr0ENCCnFj7BvXcLQU5YG
   5bbtgmbRFyfLFULkpAQ8glh9wSTdT2G9hj5P+d4RUJt6ynmlbpW8Rj2YP
   Q==;
X-CSE-ConnectionGUID: J/aw7rlaSSSFoFKmNVHg7w==
X-CSE-MsgGUID: M1KCh34QQ4GD9wocY39Lcw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918317"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:00:23 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:11760]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id 0e499385-4917-45a7-9a15-8af9415d510e; Thu, 12 Feb 2026 03:00:23 +0000 (UTC)
X-Farcaster-Flow-ID: 0e499385-4917-45a7-9a15-8af9415d510e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:22 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:22 +0000
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
Subject: [PATCH 050/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_PCBC crypto
Date: Thu, 12 Feb 2026 02:46:26 +0000
Message-ID: <20260212024725.11264-51-wanjay@amazon.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11195-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gnu.org:url];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DB621299AD
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_PCBC-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/pcbc.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index dfcfcd0601dd..6515459115d8 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -90,7 +90,7 @@ CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/b
 crypto-objs-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
 crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
 crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
-obj-$(CONFIG_CRYPTO_PCBC) += pcbc.o
+crypto-objs-$(CONFIG_CRYPTO_PCBC) += pcbc.o
 obj-$(CONFIG_CRYPTO_CTS) += cts.o
 obj-$(CONFIG_CRYPTO_LRW) += lrw.o
 obj-$(CONFIG_CRYPTO_XTS) += xts.o
diff --git a/crypto/pcbc.c b/crypto/pcbc.c
index d092717ea4fc..a0f3e16f049f 100644
--- a/crypto/pcbc.c
+++ b/crypto/pcbc.c
@@ -186,8 +186,8 @@ static void __exit crypto_pcbc_module_exit(void)
 	crypto_unregister_template(&crypto_pcbc_tmpl);
 }
 
-module_init(crypto_pcbc_module_init);
-module_exit(crypto_pcbc_module_exit);
+crypto_module_init(crypto_pcbc_module_init);
+crypto_module_exit(crypto_pcbc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("PCBC block cipher mode of operation");
-- 
2.47.3


