Return-Path: <linux-kbuild+bounces-11285-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCoeDvNHjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11285-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:24:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BA12A282
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 302483040773
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E6D245008;
	Thu, 12 Feb 2026 03:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Fd/Ep0gj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB2246BA7;
	Thu, 12 Feb 2026 03:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866650; cv=none; b=IemSfuT7cNgZQ3iqi2tSXdJ4z0YcvhgtfqeApF1IlEuw7J9oXID2DyVBdqHpvjeNZqnTvNVu+oFOmEwY8zG/B1EdjGWo6p9qgNfDge/EwqWk58GlTQ71XVvpf6o/RH4a5SwxQDN9eqqNgKgqeTctZcQexs8w8YkkerComZ8yJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866650; c=relaxed/simple;
	bh=fA6JVpIkkfy/SzgPjXV0kXIRffAvksUJAPr3dItbYXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5VfsHqo2ozrw0Qv4snmq2B9hvNJFy1xwOmQkc92Zn9OIlv55ou4EUhYccrPeG6Yfdx1ADWp2IE+ZZlWhrIhu+Pkljw2FgmjSTpXim9qGABBLi5P9qT7e8StX4JhmWyJAfFm/c28LQ5K7v5Qyzk72rEJOPYBaBOqb701eq/5cCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Fd/Ep0gj; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866649; x=1802402649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TzajV4hdDT8nUMRXu4CUYmr4jMi4PR2yYHzWw4+bwdg=;
  b=Fd/Ep0gjpaExMlPuLSaRpV+JlhyUNxmWFL3fwHlAnS+nGVonwQEVcoau
   HO7i5wjKq9AP1iQhhgNqFKyIErG/1vK/Dn//500YLfFUQ/tnr0tqC/URS
   x5naUx86ZV3tGBw6Nk83p54Lh5fr4yOArbzgGTirVxGCwtjWZ9Y2VnYaw
   3JsgAXJEg5u+abaCpdiAO2lTjIeQggZMRs9bnF0lfvaqpjWS+Q+vcLenw
   d6I5f8J+rkBA9pUpgnZFfuKSDdK9+L2UqvUgIPHAoZhBE9XJ74GRHgNso
   wy5dJUPeeO2Rp3z4i1YzsMo4rOfvKvXwdChfzn02KyByS1HnFsYZ62j5+
   Q==;
X-CSE-ConnectionGUID: Js9z9nkSQx+R1x2LQr+sFg==
X-CSE-MsgGUID: 0A1dD/IzTxenPsPeZpRr7w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12699324"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:24:09 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:17097]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 0e27582d-1f88-46f2-a41e-dee8ff9c3e5a; Thu, 12 Feb 2026 03:24:09 +0000 (UTC)
X-Farcaster-Flow-ID: 0e27582d-1f88-46f2-a41e-dee8ff9c3e5a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:24:08 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:24:08 +0000
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
Subject: [PATCH 11/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AES_ARM64_NEON_BLK crypto
Date: Thu, 12 Feb 2026 03:21:11 +0000
Message-ID: <20260212032117.9166-12-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D039UWB002.ant.amazon.com (10.13.138.79) To
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
	TAGGED_FROM(0.00)[bounces-11285-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: A80BA12A282
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_AES_ARM64_NEON_BLK-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index a98342e64eb1..6053065c18cc 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -35,7 +35,7 @@ aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
 crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
 aes-ce-blk-y := aes-glue-ce.o aes-ce.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
+crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
 aes-neon-blk-y := aes-glue-neon.o aes-neon.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
-- 
2.47.3


