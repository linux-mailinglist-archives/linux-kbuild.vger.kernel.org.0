Return-Path: <linux-kbuild+bounces-11159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF1TDB1AjWna0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11159-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:51:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D0129630
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 373B43021CA3
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA37921E0AF;
	Thu, 12 Feb 2026 02:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="J+y4MtSx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79861E511;
	Thu, 12 Feb 2026 02:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864665; cv=none; b=d4xSG77mh9SwaDwkrxntsf1mdSnddji0UWfYOp+DFJHoacq4xKfN7/jYHvyvQVG+C5vTXihwbNbLzdJ0vaepftKAxVtH2wjY/oa8NSBT0JPTmGn3CrwwhuIixoAGfQjKkUDH5EWVHnu1fx9eqEFr7NLUYmKSlslT0/kjaGC17S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864665; c=relaxed/simple;
	bh=Foi44v41lBb/X6hDxxfem/9OTogHSzWqVI/peHnI93w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEkSdX/bqbk6jW3KRYBJgMkfJXJXLjw5faXJjB+ivtqNBzcMJdViE0vWA3Tzwx/PzaoxDsNAQhEUwjZFbPDEF05iHvdgHJLZC1lrTi3HacjMr/kn6c3KF4SUzP8OXbkMijWj8mm+Jjj5jNlmgHVzJTt0qBx5SnTpXtIDQGbB2gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=J+y4MtSx; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864664; x=1802400664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ObrnNwKgvBVT1qOLixa6iU3SVBsh83IAm47IsCVBx9c=;
  b=J+y4MtSx8e0xSA9s4uA+zsk5HRGh2in4HFA8hPxFLsq3BFjHYHmTRTHa
   nRoORRmSWAAb6mbJhPTGVmXUQWktJSCtrPxX41799eDcoeAe8i3I0FyMZ
   ytNAnNedzS+MvSpg/s2JIzcHWCnul9pu43lkou1gOnYlgPGt51TautJNR
   +chfNet4JjjmFqY48mKxQCOC9ENxuJT30ny0oCp882pORRHVKTnBwQEoV
   98qc97d3uvstgCaJhmBtxoCokHlBFgKeBenKC6O4fN0mZQlMEixis/lTc
   bKeng42pU0g2uiiq1/u0neUecB7Dhzdn6rIO+CftrthG21iYKYXjMAuz5
   w==;
X-CSE-ConnectionGUID: DhkAt3PJRZijzPiRQDargA==
X-CSE-MsgGUID: bX5fTuB6QvSwC8fIylEgyw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12454828"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:51:04 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:27605]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 709cb468-4e01-4eab-bb04-e49139add5d0; Thu, 12 Feb 2026 02:51:04 +0000 (UTC)
X-Farcaster-Flow-ID: 709cb468-4e01-4eab-bb04-e49139add5d0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:04 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:03 +0000
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
Subject: [PATCH 014/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_MANAGER2 crypto
Date: Thu, 12 Feb 2026 02:45:50 +0000
Message-ID: <20260212024725.11264-15-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D037UWB004.ant.amazon.com (10.13.138.84) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11159-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C70D0129630
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_MANAGER2-related crypto to convert them into pluggable
interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/algboss.c             |  4 ++--
 crypto/fips140/fips140-api.c | 11 +++++++++++
 crypto/internal.h            |  3 ++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index e940f9ed357d..10cf1c6991fa 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -70,7 +70,7 @@ crypto-objs-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
 
 cryptomgr-y := algboss.o testmgr.o
 
-obj-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
+crypto-objs-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
 obj-$(CONFIG_CRYPTO_USER) += crypto_user.o
 obj-$(CONFIG_CRYPTO_CMAC) += cmac.o
 obj-$(CONFIG_CRYPTO_HMAC) += hmac.o
diff --git a/crypto/algboss.c b/crypto/algboss.c
index 846f586889ee..1c26524e2541 100644
--- a/crypto/algboss.c
+++ b/crypto/algboss.c
@@ -247,8 +247,8 @@ static void __exit cryptomgr_exit(void)
 	BUG_ON(err);
 }
 
-module_init(cryptomgr_init);
-module_exit(cryptomgr_exit);
+crypto_module_init(cryptomgr_init);
+crypto_module_exit(cryptomgr_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Crypto Algorithm Manager");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 9a9c66cc1d90..17e03d4c1c9a 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -357,4 +357,15 @@ DEFINE_CRYPTO_API_STUB(crypto_unregister_scomp);
 DEFINE_CRYPTO_API_STUB(crypto_register_scomps);
 DEFINE_CRYPTO_API_STUB(crypto_unregister_scomps);
 
+#endif
+
+/*
+ * crypto/testmgr.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_MANAGER2)
+
+#include <crypto/internal.h>
+
+DEFINE_CRYPTO_API_STUB(alg_test);
+
 #endif
\ No newline at end of file
diff --git a/crypto/internal.h b/crypto/internal.h
index 8ebe4dc336bc..0296d9830c62 100644
--- a/crypto/internal.h
+++ b/crypto/internal.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_INTERNAL_H
 #define _CRYPTO_INTERNAL_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -65,7 +66,7 @@ extern struct rw_semaphore crypto_alg_sem;
 extern struct list_head crypto_alg_list __guarded_by(&crypto_alg_sem);
 extern struct blocking_notifier_head crypto_chain;
 
-int alg_test(const char *driver, const char *alg, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_MANAGER2, alg_test, int, (const char *driver, const char *alg, u32 type, u32 mask), (driver, alg, type, mask));
 
 #if !IS_BUILTIN(CONFIG_CRYPTO_ALGAPI) || !IS_ENABLED(CONFIG_CRYPTO_SELFTESTS)
 static inline bool crypto_boot_test_finished(void)
-- 
2.47.3


