Return-Path: <linux-kbuild+bounces-11196-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIKpHF1CjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11196-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:00:45 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE41299C4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB34F3013036
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527CA1C861D;
	Thu, 12 Feb 2026 03:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="QTy4nH7k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFC01E511;
	Thu, 12 Feb 2026 03:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865240; cv=none; b=XbZ/i0pPGPrgmY1ANjbwhTpZ3mdWSLKAoJMH+kPP8eUS+p9qgF7yOZeWcgXH8i9qP8uSQZGADhP9YqpbOneIbDAQePx7GOehjDeKJC7aqkHlYrJU4Z7X4qjQaHGEcxE1x9QuUvgxCC17Q37MfW2SGdR3VYJ0h/H9n3vmQONtgZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865240; c=relaxed/simple;
	bh=I5QIYp2ff9qWcQ6roizUoyv+yIMsux8H0Q9S16UFakk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzxE+rpg1ZhLFmZ8TWVn0XyFSFtV42SrubRb37vfDPo3Pgg/D46DUE3EuMGdNqtc1m8wF8zZPFkF1KbT1qb9dmbHC6jilgBDCdGKzMCwminbxENyd4PMO8DdjGJDKz6RoOnaItWKQOvSlXz3snrjvLHIcKfbrbPYXoA70C8DV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=QTy4nH7k; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865239; x=1802401239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z2BiAK82ZyCvI/cSM48g8qS815qVY+F+Hq/I4dNjWDU=;
  b=QTy4nH7k9LdGqEhTaof5rE6FfX2JpjMkNhLEElajIl7V03D9KU8cEQMY
   GS3Xd+xwoaf6LQ44O8lD1tSI+mPVMW01+rev0Bjo6HG5pxSpt5CC/uRe6
   5u41TKtFX+H6+XS3tf7vgnJH64/56LXdFssv7nWVt7jocxN++NCUopwsp
   3H9IrWuE+D78+aQyTKQuIrOeNPQdZHbrNyA/IRb0dHyRCQ2oZcHnmKS4F
   VDqIoUR2KiwuYsna32jMutENJbMq/9IQUh3mLl7BIwiAYHyV1xOIoD3UC
   NHgyDMMkS6EiAHmVJfJrGJXXlP9kP/kuT+v4HItrGYiIiAjFIg3W3tHzy
   A==;
X-CSE-ConnectionGUID: 69yKWZdjQE+p+ET7mtDxdQ==
X-CSE-MsgGUID: n6O9Xe2xTsC/QY5YGn85Ag==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925450"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:00:38 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:11458]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 68ea4819-7549-4021-942d-5f632ee336ed; Thu, 12 Feb 2026 03:00:38 +0000 (UTC)
X-Farcaster-Flow-ID: 68ea4819-7549-4021-942d-5f632ee336ed
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:38 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:38 +0000
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
Subject: [PATCH 051/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CTS crypto
Date: Thu, 12 Feb 2026 02:46:27 +0000
Message-ID: <20260212024725.11264-52-wanjay@amazon.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11196-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9AE41299C4
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CTS-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/cts.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 6515459115d8..9ee71f7c0af7 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -91,7 +91,7 @@ crypto-objs-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
 crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
 crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
 crypto-objs-$(CONFIG_CRYPTO_PCBC) += pcbc.o
-obj-$(CONFIG_CRYPTO_CTS) += cts.o
+crypto-objs-$(CONFIG_CRYPTO_CTS) += cts.o
 obj-$(CONFIG_CRYPTO_LRW) += lrw.o
 obj-$(CONFIG_CRYPTO_XTS) += xts.o
 crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
diff --git a/crypto/cts.c b/crypto/cts.c
index 48898d5e24ff..8b762d0d42cd 100644
--- a/crypto/cts.c
+++ b/crypto/cts.c
@@ -402,8 +402,8 @@ static void __exit crypto_cts_module_exit(void)
 	crypto_unregister_template(&crypto_cts_tmpl);
 }
 
-module_init(crypto_cts_module_init);
-module_exit(crypto_cts_module_exit);
+crypto_module_init(crypto_cts_module_init);
+crypto_module_exit(crypto_cts_module_exit);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("CTS-CBC CipherText Stealing for CBC");
-- 
2.47.3


