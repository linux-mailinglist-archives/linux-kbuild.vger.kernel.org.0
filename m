Return-Path: <linux-kbuild+bounces-11140-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMS/OeM+jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11140-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:45:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D69B12946D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 212A7308E344
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3991D6DA9;
	Thu, 12 Feb 2026 02:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="aDUZzKkU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B47A137750;
	Thu, 12 Feb 2026 02:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864352; cv=none; b=Q+V+WKfCTPWvq40hF2q/evLZ3eZn4mZtUTZ0jNsYZicgIyimqlBqfU+AfFmRw4xpLEJD5b7QKu7aGRHF8JpUPz+9r9z5SnG1Qm0OxonC711AgvkBH3Uma0shJjvpEQ3uSWyirBGytQ5Ny6CGcsEmLEpERnLb1pZdzjcQ7yVYOno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864352; c=relaxed/simple;
	bh=ulf8auX9a/SwTh9nB2cJ/teViV8pSzTwRZKHeSsidQA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bviRial/GznTemMOfJzRen4hc7Rnk5gvmd+oWak7VeJu5x7qrdNFu7RnwcaoW5v396eOuaVlrdCodrHv1j67e6+35OjN/r4DnE3CoTfvPvmvOGc1aKwS1dMo3SXrt4ulTf9VqfyBrEHN6v7E/Gb0Qy76B80JXc97cBfnR1z/yEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=aDUZzKkU; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864351; x=1802400351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZJ04RmOf6LRn6rnzO11EEXCmrhv5/oA0dpWQtGrdIF8=;
  b=aDUZzKkU8Baab5kIOizcMnb5m916R4/3ziITLjIW38F0se6xKJEGhRwc
   ak+HBio94DxioZKOb5MLUxZfahdUjQp+GFa7p0gsCMTa6VcDZacEKDJHD
   +qTlMzRSxDdd81sHL6MroX/ZYLRQUkGJVGkaMuK7wfBH0BGVMnVYsv72a
   /VzRrga8+64ILMpjIHNg/Ypm4/pS+agTas4cNATrD0kBP9KdPhnTnwASd
   HeBn9AJPqJlV8haZC8IK7lcy0urjI+HxkZ5EKaw1KYUMZ2uc5N8vKc0nr
   kowNoGadPcFGfUHupZLr1/HdLST0kfQR1wFrhv4PuQtD0bKgFGDRqxhcU
   Q==;
X-CSE-ConnectionGUID: 0ZCeTKN2SXyY03JcSybZCg==
X-CSE-MsgGUID: 27vqGfmZQB2SpKNw0lFzdQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696145"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:45:51 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:2072]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id a1aa9c34-e48b-48b4-88ea-b27754c824f5; Thu, 12 Feb 2026 02:45:50 +0000 (UTC)
X-Farcaster-Flow-ID: a1aa9c34-e48b-48b4-88ea-b27754c824f5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:50 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:50 +0000
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
Subject: [PATCH 13/17] crypto/algapi.c: skip crypto_check_module_sig() for the standalone crypto module
Date: Thu, 12 Feb 2026 02:42:17 +0000
Message-ID: <20260212024228.6267-14-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D042UWB003.ant.amazon.com (10.13.139.135) To
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
	TAGGED_FROM(0.00)[bounces-11140-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 6D69B12946D
X-Rspamd-Action: no action

From: Vegard Nossum <vegard.nossum@oracle.com>

The signature check in regular module verification process
`crypto_check_module_sig()` is skipped for this standalone crypto module
because its signature has already been checked during load (as described
in later patch).

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[Revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/algapi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/crypto/algapi.c b/crypto/algapi.c
index 37de377719ae..663698e0cd65 100644
--- a/crypto/algapi.c
+++ b/crypto/algapi.c
@@ -24,7 +24,19 @@ static LIST_HEAD(crypto_template_list);
 
 static inline void crypto_check_module_sig(struct module *mod)
 {
-	if (fips_enabled && mod && !module_sig_ok(mod))
+#ifdef FIPS_MODULE
+	/*
+	 * The FIPS module should ignore its own signature check, as it was
+	 * already been verified elsewhere during loading.
+	 */
+	if (mod == THIS_MODULE)
+		return;
+#else
+	if (!fips_enabled)
+		return;
+#endif
+
+	if (mod && !module_sig_ok(mod))
 		panic("Module %s signature verification failed in FIPS mode\n",
 		      module_name(mod));
 }
-- 
2.47.3


