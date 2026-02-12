Return-Path: <linux-kbuild+bounces-11134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG/uCYY+jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11134-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:44:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3071293CE
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4487D308AFD5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C9721B9E2;
	Thu, 12 Feb 2026 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="EfQhyjec"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1141F4174;
	Thu, 12 Feb 2026 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864259; cv=none; b=N89+IVqwj4GriDwH3CeDmEB6XI1AIOblQSe01EbzJ755Zz0NS6MT5ERTCJjqT8sPElrBtZxKi8mL8LnSX9RVnbg8tV2Pm3/EbrYTdl2BIJW9FHcYwevRH0gDBFMsxacFBXNoRnNu9KZQp1GfxAw5ugmP28pFvhiDUYLIPMjXsg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864259; c=relaxed/simple;
	bh=A5IKwEpuIqx/+umA8D/qO/f9PVLHTRVOwSYbyomqS2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C55KQ5dnsro+tJx8BK9IB2VOmOUG+5NKNPk5C2Bz1710jNg81tnBme6vg3eC9CkJvSSQ/NWiCP+z4kvQivMOUQxIPc6rGwcwCVhICkVhzfjfLESdus3wvTeWmh0sUkHGrzHOAubo+ws5RziuISmAfdhtf9dfTqBLV2bgOp0mFHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=EfQhyjec; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864258; x=1802400258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QmFq8yGyc70/+W2Glo7jC1OGxaGS0GaWe0UVpEa+H5k=;
  b=EfQhyjecbsR0Hr6yEKb8yVUxbGilr64EnxFdPflt0zRK7gkQB/hw6nfv
   DNTMgifDVPPNTUK1viXPBXbTx7pW1JVZdDtigcGtDpjie7qSyAcq13yHh
   FKHExwcXTw9xcVYFrOGA8uWveSh6aCljIdlQNjC5McSPCGe1rWFjoTfs8
   pHRowPhIgPCZIwnbqhbtB2pH62CSNd2kjKDbD6/nau0HFj/Uy7RRHkyFQ
   bsZMeB1+Xc2ZFaYtfEohug6HYkpam/TOz4VTRZ95PebwZc4cFjCFrjMD+
   VplMwSVLgz9wtmNU44NU7XLmLKPqnMw8h/JC/VM3W5XjKSmwlUSA/9/oA
   w==;
X-CSE-ConnectionGUID: cLPVIGHpTU6D/zAFLeUzSQ==
X-CSE-MsgGUID: A+alze5dR8Kg1HWLagSmAA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919210"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:44:18 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:30569]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 20fe8c9c-fcd3-4bbb-8b1b-e1dad286b9f7; Thu, 12 Feb 2026 02:44:18 +0000 (UTC)
X-Farcaster-Flow-ID: 20fe8c9c-fcd3-4bbb-8b1b-e1dad286b9f7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:44:17 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:44:17 +0000
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
Subject: [PATCH 07/17] crypto: dedicated ELF sections for collected crypto initcalls
Date: Thu, 12 Feb 2026 02:42:11 +0000
Message-ID: <20260212024228.6267-8-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
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
	TAGGED_FROM(0.00)[bounces-11134-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F3071293CE
X-Rspamd-Action: no action

The addresses of init functions for crypto collected into the standalone
modules are placed into a dedicated ELF section. This is achieved by
introducing a custom linker script crypto/fips140/fips140.lds. Since in
later patch the init crypto will be called in the proper ordering (e.g.,
device_initcall should be earlier than late_initcall), the linker script
allocates different levels of ELF section (e.g.,
__fips140_initcall0_start and __fips140_initcall1_start) to preserve the
proper ordering.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 Makefile                   |  2 +-
 crypto/fips140/fips140.lds | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 crypto/fips140/fips140.lds

diff --git a/Makefile b/Makefile
index b5ae385ed5f3..8413cc02665c 100644
--- a/Makefile
+++ b/Makefile
@@ -1313,7 +1313,7 @@ crypto/fips140/.fips140.symvers: fips140-ready
 	@:
 modpost: crypto/fips140/.fips140.symvers
 quiet_cmd_ld_fips140 = LD [M]  $@
-      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none --whole-archive $< --no-whole-archive -o $@
+      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none -T $(srctree)/crypto/fips140/fips140.lds --whole-archive $< --no-whole-archive -o $@
 
 cmd_fips140_mod = ar -t $< > $@
 
diff --git a/crypto/fips140/fips140.lds b/crypto/fips140/fips140.lds
new file mode 100644
index 000000000000..1adb3ccb5b9d
--- /dev/null
+++ b/crypto/fips140/fips140.lds
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+SECTIONS {
+	.init.data : {
+		__fips140_initcalls_start = .;
+		__fips140_initcall0_start = .;
+		*(.fips_initcall0)
+		__fips140_initcall0_end = .;
+		__fips140_initcall1_start = .;
+		*(.fips_initcall1)
+		__fips140_initcall1_end = .;
+		__fips140_initcall2_start = .;
+		*(.fips_initcall2)
+		__fips140_initcall2_end = .;
+		__fips140_initcalls_end = .;
+	}
+}
\ No newline at end of file
-- 
2.47.3


