Return-Path: <linux-kbuild+bounces-11251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PcEC7FFjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11251-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:14:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E27129F0C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 142F4303B4C8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7580523B615;
	Thu, 12 Feb 2026 03:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="rRf+bB2c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421361668;
	Thu, 12 Feb 2026 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866094; cv=none; b=kvzsVQnvsDxi5Ye7NoKJgT3dNc6kaRBfquzxfFWNnWcEyLF57lgaooKQdHdAY0p/0tJMGyhJEuVktEKTIvLzUCVmJor/bRqa7Dr6qyAsUgIE1oykfJNlE9egZFuSv3pwWXVB4FSFbj5IQbmzEHiD45OXt+UGm9KMnpJcB8d2p3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866094; c=relaxed/simple;
	bh=4vgrGPivMpTeMlyigamr/ljqiLEncAWuP4EOYHW3wSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q6ieCIfepO1Qn0/cnIFXvRscxb96nnE3zI14gGdmh7kajXezW0wXR8rzjhkUS2h5OVIldToZpGVI8/r2vAEm/fNzYDo2PyrKKCI4aalHJQ+dbxbay67PHLruVuoQwIOa/sb+te2sroE+BktmeHKhMUsf/EGDOO+3yEl9s4zoBzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=rRf+bB2c; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866093; x=1802402093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x3Tbz7uW23+2yTiWoJ7b61SNKsHq0ndcE0ASJpwDVQY=;
  b=rRf+bB2ctjHJrc1DxMitrJENPqVEnP4Mufobq2G55RqLceKJZsh4YlKY
   g4DxUYJULU6Awaq4wM2oatZToD3SyZOlzMctHY5j2kMfMCvcfpehgGwH7
   IFcr1sm75wX0abSMvQQeiTCOzQlBONkmrHvCVL+Gc2uh3FyxB90aUAO4G
   NqiCXhqktU6TTJ7YyEud0aLhVLRzUXlN9M1IvUGwhA20jJHRoXbH3QhoY
   oNE0PFAZ1zj80l5lb4tg7diR7EkMPzZlwOpXs/FzGOtepohIkOldnM1n+
   twcQrSwtd3x0JU4Y4X/eOlOYQBr1qht5lMt7WVEUYShyHoGB83QUoDOOm
   Q==;
X-CSE-ConnectionGUID: HoDVOiInQAe+YDblwVEMuQ==
X-CSE-MsgGUID: bcy9emDbSlKFFmYpgbU5JQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919906"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:14:53 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:30841]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 8e9bc734-2d3c-4aed-9b7b-297267be430e; Thu, 12 Feb 2026 03:14:52 +0000 (UTC)
X-Farcaster-Flow-ID: 8e9bc734-2d3c-4aed-9b7b-297267be430e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:52 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:52 +0000
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
Subject: [PATCH 106/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYNC_RAID6_TEST crypto
Date: Thu, 12 Feb 2026 02:47:22 +0000
Message-ID: <20260212024725.11264-107-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D046UWB001.ant.amazon.com (10.13.139.187) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11251-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63E27129F0C
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_ASYNC_RAID6_TEST-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/async_tx/Makefile    | 2 +-
 crypto/async_tx/raid6test.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 2f700c2312af..9642987ebd71 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -4,4 +4,4 @@ crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
 crypto-objs-$(CONFIG_ASYNC_XOR) += async_xor.o
 crypto-objs-$(CONFIG_ASYNC_PQ) += async_pq.o
 crypto-objs-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
-obj-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
+crypto-objs-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
diff --git a/crypto/async_tx/raid6test.c b/crypto/async_tx/raid6test.c
index d3fbee1e03e5..253aa4787f5a 100644
--- a/crypto/async_tx/raid6test.c
+++ b/crypto/async_tx/raid6test.c
@@ -243,8 +243,8 @@ static void __exit raid6_test_exit(void)
 /* when compiled-in wait for drivers to load first (assumes dma drivers
  * are also compiled-in)
  */
-late_initcall(raid6_test);
-module_exit(raid6_test_exit);
+crypto_late_initcall(raid6_test);
+crypto_module_exit(raid6_test_exit);
 MODULE_AUTHOR("Dan Williams <dan.j.williams@intel.com>");
 MODULE_DESCRIPTION("asynchronous RAID-6 recovery self tests");
 MODULE_LICENSE("GPL");
-- 
2.47.3


