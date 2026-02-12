Return-Path: <linux-kbuild+bounces-11129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NAXJjg+jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11129-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:43:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707512935B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCC00308A438
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3876B1F4174;
	Thu, 12 Feb 2026 02:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Nly9w1vX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113DF1624C0;
	Thu, 12 Feb 2026 02:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864182; cv=none; b=uZHgsoQ967iQ/+AqEpBVsW6dY+eNGwmuluoWkcEQm715m+9xg3WEbZIHnxWWgeEJVstwGUWuriFxPB2pEMzX3FW3mfkOKUsKAVumt8eWV8TvnCIA6SjCmBwnnVyx0Qa/F0N4V/Pn9f0/8CaTUaZH1bvjMHfCvykxBDftn6TzMCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864182; c=relaxed/simple;
	bh=Mbn/TkCofA/7lpO6k8uLNOMPHt8oeFvxUeA9YBGQOXM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lK6ZgMeSCpFatP6+dKeVJja3+TBFcfWGYXZSTufoPRZ7umBl1xhF9s2zovj5e+Cw3Bx3nYFkLCakQT6ZVueGDyjsKtGFYX4mH1Mt1QuxkLoHJJGfB0sv9QOsiLau/UvWw3xWVKR0GyulqnVDw1pXAVVAddhWXTGwPOpy38m5k7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Nly9w1vX; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864181; x=1802400181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5TcxFOujMNKd+EhcTS55Wh7sNEppRM3HytCIJcJW7pY=;
  b=Nly9w1vXfBqHSTrO7mpsAZAgu9jB1yVl7vlWQpSU7t77cAODrwSK5PSa
   VYAnSp7UohN34bNevXcHq8R2pj45ocePhD9ySTe13phz32HDamOp6iMb/
   SdPt6ZXsjxSiGyfzhs+d1WXChSVoQILlMhh3inbY1QmunNxf2eYzjelQB
   O2QgvImWyrrvWebdAZEA8K5VGtjrRmunfKRWelxQ1DFDyfVU1gRxVBOhj
   eyEUEifzRFpJdYRoVTb5UO8F6hyUQhUPFQXF7vSrdyHTibTUcgAfIWdeO
   TMI/q5uAYImsDVm1+R+jbazzwAkBUflg45WB1OI16/b+L38GJ15BA9sdK
   w==;
X-CSE-ConnectionGUID: rEPiPVOaSpOulun4sfYhSg==
X-CSE-MsgGUID: XhSxBxQWSeSFOkcx2BZiAw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12793129"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:43:00 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:8690]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id ea1035ec-9c4e-45c6-a808-5879060501ed; Thu, 12 Feb 2026 02:43:00 +0000 (UTC)
X-Farcaster-Flow-ID: ea1035ec-9c4e-45c6-a808-5879060501ed
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:42:59 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:42:59 +0000
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
Subject: [PATCH 02/17] crypto: add module entry for standalone crypto kernel module
Date: Thu, 12 Feb 2026 02:42:06 +0000
Message-ID: <20260212024228.6267-3-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D040UWA003.ant.amazon.com (10.13.139.6) To
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
	TAGGED_FROM(0.00)[bounces-11129-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 0707512935B
X-Rspamd-Action: no action

Add the module entry for the standalone FIPS kernel crypto module.
This creates the basic structure for fips140.ko that will be linked
with built-in crypto implementations in later patches.

The implementation includes module initialization and exit functions
and add into build system.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile                 |  5 +++++
 crypto/fips140/Makefile         |  3 +++
 crypto/fips140/fips140-module.c | 36 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.h | 14 +++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 crypto/fips140/Makefile
 create mode 100644 crypto/fips140/fips140-module.c
 create mode 100644 crypto/fips140/fips140-module.h

diff --git a/crypto/Makefile b/crypto/Makefile
index 04e269117589..5129be5e7208 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -210,3 +210,8 @@ obj-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
 obj-$(CONFIG_CRYPTO_DF80090A) += df_sp80090a.o
 
 obj-$(CONFIG_CRYPTO_KRB5) += krb5/
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
+
+
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
new file mode 100644
index 000000000000..364ef52c190f
--- /dev/null
+++ b/crypto/fips140/Makefile
@@ -0,0 +1,3 @@
+
+
+	
\ No newline at end of file
diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
new file mode 100644
index 000000000000..a942de8780ef
--- /dev/null
+++ b/crypto/fips140/fips140-module.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * FIPS 140 Kernel Cryptographic Module
+ *
+ * This file is the module entry point for fips140.ko, which is linked with previously built-in cryptos
+ * to generate the fips140.ko module.
+ * At load time, this module plugs the previously built-in implementations contained within itself back to the kernel.
+ * It also runs self-tests on these algorithms and verifies the integrity of its code and data.
+ * If either of these steps fails, the kernel will panic.
+ */
+
+#include "fips140-module.h"
+
+#define FIPS140_MODULE_NAME "FIPS 140 Kernel Cryptographic Module"
+#define FIPS140_MODULE_VERSION "1.0.0"
+
+#define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
+
+/* Initialize the FIPS 140 module */
+static int __init fips140_init(void)
+{
+    return 0;
+}
+
+static void __exit fips140_exit(void)
+{
+    pr_info("Unloading " FIPS140_MODULE_NAME "\n");
+}
+
+module_init(fips140_init);
+module_exit(fips140_exit);
+
+MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION(FIPS140_MODULE_NAME);
+MODULE_VERSION(FIPS140_MODULE_VERSION);
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
new file mode 100644
index 000000000000..ed2b6e17969f
--- /dev/null
+++ b/crypto/fips140/fips140-module.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * FIPS 140 Kernel Cryptographic Module - Header File
+ */
+
+#ifndef _CRYPTO_FIPS140_MODULE_H
+#define _CRYPTO_FIPS140_MODULE_H
+
+#include <linux/module.h>
+#include <linux/crypto.h>
+#include <crypto/algapi.h>
+#include <linux/init.h>
+
+#endif /* _CRYPTO_FIPS140_MODULE_H */
-- 
2.47.3


