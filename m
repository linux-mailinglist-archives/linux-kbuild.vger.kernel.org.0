Return-Path: <linux-kbuild+bounces-12819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKYGOJPO4mm6+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12819-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:21:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B58C41F571
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAB5830803FC
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB910175A97;
	Sat, 18 Apr 2026 00:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="fpwOYHWp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A61A0728;
	Sat, 18 Apr 2026 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471666; cv=none; b=IVJRv9flU22pmqX9tWMyJoLqu8vGkXsNRRuPfqYXRuakbRVE/LcEy3iuAe6dQcZ75xHJ+ndmWpNFQ6xHBUEqyEADj03pHyH8IP8j5KmOZgtSK9jRooJbEPmj+GkoKlsfkHakflE6/SzSUHw6Urd6tk5gaSVcGqsV1ikbgDPap8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471666; c=relaxed/simple;
	bh=vgHI6RPM9CCvRXzCCf+Hs22jjXJlW5SjZOE+j2XgunM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXKnsozUpUue54i8oSsGOrgatrg2Cl09hRJnos4jp1vnJbyIH+CyKuV8t/pL9+4cqzM7i/CaTEwcf4nrp54d8CDJxs7KYPPogzzsRei2LW2wNEvZaB0+vE7H5u3+NEY2Dbv8qSVMrwJTBPlTQAZHYH7+blEg+MNRl2qUAoce1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=fpwOYHWp; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471665; x=1808007665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sC8zO7WisB/BVnpXYeCbasCeuuyH1ggPcPQwQiSAKEk=;
  b=fpwOYHWp97ASPKVIEJvsCFwjFh1WSOW4RQh7e9Hc/P9G3XqOIHci/9Fi
   5AXTP8a09+w3UtQKL95FZXpifYMXs0DRkeDp/9GkbubE3/q1bU0KWBZUi
   YRhLcpEQvRLTu378P71y2zCgZz01YXNb8kHwrmo4iC5kN9n9rW1JS6U2j
   v47hHFRwiW7J/EuQaa6AVpvBPaEeOHhbnxrMTGTbH/9nqnqBD8sJbAaR1
   Jpy74vsW9CoBmnBy5BkkdS/xx+dn9GUManBPUltCN0W6lB+wqfSYhRhgh
   WOOolj/SacCoW2WuSWAjQOS/x507zY2yfg6JxyovGL1oxrKrUQIcduCPt
   A==;
X-CSE-ConnectionGUID: duxKE2eBSmq5n0oRXlLEGQ==
X-CSE-MsgGUID: bmvgKGJDSZ+60DrIR2R09g==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17587111"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:21:05 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:7812]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.232:2525] with esmtp (Farcaster)
 id 563553b0-9fd4-4e32-be57-b68618a85df0; Sat, 18 Apr 2026 00:21:04 +0000 (UTC)
X-Farcaster-Flow-ID: 563553b0-9fd4-4e32-be57-b68618a85df0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:04 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:04 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 02/19] crypto: add module entry for standalone crypto kernel module
Date: Sat, 18 Apr 2026 00:20:10 +0000
Message-ID: <20260418002032.2877-3-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12819-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B58C41F571
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index d9bec7c6dc417..b48017ca84cc0 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -207,3 +207,8 @@ obj-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
 obj-$(CONFIG_CRYPTO_DF80090A) += df_sp80090a.o
 
 obj-$(CONFIG_CRYPTO_KRB5) += krb5/
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
+
+
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
new file mode 100644
index 0000000000000..364ef52c190fb
--- /dev/null
+++ b/crypto/fips140/Makefile
@@ -0,0 +1,3 @@
+
+
+	
\ No newline at end of file
diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
new file mode 100644
index 0000000000000..a942de8780efb
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
index 0000000000000..ed2b6e17969fc
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


