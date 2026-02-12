Return-Path: <linux-kbuild+bounces-11128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIgvICg+jWmo0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11128-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:42:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BBF129345
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47C7308A85F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDF5219A89;
	Thu, 12 Feb 2026 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OQCWBJ9l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4C1F4174;
	Thu, 12 Feb 2026 02:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864166; cv=none; b=XpoX9I9ZUFSB/2TL6h39KLLUv6ytRFHHf6CBe3mQQz3qiGrzz578XipBCvOB4J+KjoukR6Qa4wNDdGV5k1A12mfRtL15206EbcSHhrxqvLebdhRHpmt0Wkwgd2yiTNYU0eSpJsWkbfPIpODcf0DR6ckHYBlq4J0sHmb7UciJUhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864166; c=relaxed/simple;
	bh=aUcmsYIj6NpXRCrd8PST8QWjlloBjGGeGtMcJTM4swc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MSYLlE+vaHY2A1AsJ9FdmaWH/wRoYe1vBeta9lREsFIFe7bDm4v8d/OXZKMvhkkVGl5XW5qjW9AJhBjD8MtggS8XQIsIQXvecyuJu3H3jmY3aSHc94NO+P52ojloNhU3Sxh9asQJ2SXPE142kRwKCISzg4vIM4WhfkFdKuU0BqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OQCWBJ9l; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864165; x=1802400165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JkGQfRjyV9lo9tVx9lTNhKFQa2rP7zzwxq7FWhvpL9o=;
  b=OQCWBJ9ly6MqcJllP8yw9pvY1nmjQozuKVRObW2tAYzBWQXO8qg6s4aT
   r7Yi+4BQnuw+MKjan+aJDrQ5PsbfSHPac+4fOAORqZb+0iqhjBgTfQnlI
   DFQQYy9yk450ICoGHSLzOCawYvs1l6mDcD4oXjsLZKb7LwAwvc0wSB7qn
   4mUy+vCovk2HLnVGkWkPD+BLHG7xC/yXdlmnyjUQ6j0e3XHHqS7bOKcPA
   xH02v5NMIZCRGWwUbI0SdVSWroCNEAANuuGYjjkFVtcpJcV/xGvc8xlnK
   3D+vnzyemF1Oa/WmLn2k21mVfkloS1OZC18WJgH+1K8eEFKSiny1YnWcl
   w==;
X-CSE-ConnectionGUID: 9XrHk633Q3aLo1kmLbsNHg==
X-CSE-MsgGUID: NQa9TpyWTXOdC9/d2aixUQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12695987"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:42:44 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:12575]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id bddb51ec-5ba6-416f-bc4f-728add5d0a8d; Thu, 12 Feb 2026 02:42:44 +0000 (UTC)
X-Farcaster-Flow-ID: bddb51ec-5ba6-416f-bc4f-728add5d0a8d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:42:44 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:42:43 +0000
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
Subject: [PATCH 01/17] crypto: add Kconfig options for standalone crypto module
Date: Thu, 12 Feb 2026 02:42:05 +0000
Message-ID: <20260212024228.6267-2-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D041UWA004.ant.amazon.com (10.13.139.9) To
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
	TAGGED_FROM(0.00)[bounces-11128-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 06BBF129345
X-Rspamd-Action: no action

Add Kconfig option `CRYPTO_FIPS140_EXTMOD` to enable standalone crypto
module support that can override built-in cryptographic implementations.

Currently supports X86_64 and ARM64 architectures and requires CRYPTO
and MODULES to be enabled.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Kconfig         |  1 +
 crypto/fips140/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 crypto/fips140/Kconfig

diff --git a/crypto/Kconfig b/crypto/Kconfig
index e2b4106ac961..b4ce3c1cfa1b 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1415,6 +1415,7 @@ endif
 endif
 
 source "drivers/crypto/Kconfig"
+source "crypto/fips140/Kconfig"
 source "crypto/asymmetric_keys/Kconfig"
 source "certs/Kconfig"
 source "crypto/krb5/Kconfig"
diff --git a/crypto/fips140/Kconfig b/crypto/fips140/Kconfig
new file mode 100644
index 000000000000..0665e94b9fe0
--- /dev/null
+++ b/crypto/fips140/Kconfig
@@ -0,0 +1,15 @@
+config CRYPTO_FIPS140_EXTMOD
+	bool "FIPS 140 compliant algorithms as a kernel module"
+	depends on CRYPTO && (X86_64 || ARM64) && MODULES
+	select CRYPTO_FIPS
+	help
+	  This option enables building a kernel module that contains
+	  copies of crypto algorithms that are built in a way that
+	  complies with the FIPS 140 standard.
+
+	  The module registers the algorithms it contains with the
+	  kernel crypto API, and the kernel crypto API's FIPS 140 mode
+	  can be enabled to restrict crypto algorithm usage to only
+	  those provided by this module.
+
+	  If unsure, say N.
-- 
2.47.3


