Return-Path: <linux-kbuild+bounces-11141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIBUE/I+jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11141-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:46:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10307129484
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75D7C3021CB0
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376E3126C03;
	Thu, 12 Feb 2026 02:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="jcjkV1+u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524F8460;
	Thu, 12 Feb 2026 02:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864368; cv=none; b=d1jD6PaPfCCPNL/D3qxu+V5rXOp0LWjmeMOT1Iwzuuk8kAxmH7HLODzQt7mybG8K0lQLNlpGPAXcWCQsfchP+WDCwOpS4+Abq6EqdSHWRFzC9H5sqDzGYuJCPCusNZCPF+Q+6qZG/7BxxQzQyHpdt1LAf3n7oRdS9OFQNGX0t0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864368; c=relaxed/simple;
	bh=G0dRQMT9FdUNsUfj9gB4zXDy7qRZ4AS8VVyC5okbvMA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuIWwlZRSmTFHKbXAI7X/2xqJxoQceeyOoztYRMHil26wnSqTDjEH6hlwsTh0q6lK/N11jGTEYxzk/bgN+w/GhxoVFanjZqhbuee9YAvaYa/Jd+enh/zHkIBW177hfGvUURr2Erdk5reLDq0OzYA1ak36DI/0AWRhS4OaPz3Qtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=jcjkV1+u; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864367; x=1802400367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eEAseTC3S8JddkGZqDzPI8m8i5+Dvp7n7N+9tsPap0g=;
  b=jcjkV1+uNPmGtegczyU9g2B/bV0rT3Hq2VPAWAg5JX59dvoZ6JLGeaHn
   rwenOdKojc/82804HhaLVdN6wQ7oO7ujnhdHM2pmTL8Rp7ZcUnUe+PBQF
   HS6LqbjXrNlXN774ediKYnY8WyHKD5fFrv4xyArx0XzP7McMzTWiDNQ8X
   YGl/kqnLJKfCwz2jgYagStKZfo5QcW9xqiISJL6bOz1Gp6sZRyBK58p8k
   6bAVwmUEBAYFpnbh6ac/RJa3WD8/eewfqAvgiExMTsoq/fbrtLZ473h+7
   9ISl3Xv2Ih4I0HWFMv5+c9+ymxBI5xGSww050dukFtL1lBrOoxIrWgQAI
   A==;
X-CSE-ConnectionGUID: cHjmmm8mR/ucuO5dfBIcAQ==
X-CSE-MsgGUID: kMNMUwLtR8SiAIHpCz4R6Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918492"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:46:06 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:4344]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id ae339ba5-9c91-4f3f-a0bf-313fc35b4241; Thu, 12 Feb 2026 02:46:06 +0000 (UTC)
X-Farcaster-Flow-ID: ae339ba5-9c91-4f3f-a0bf-313fc35b4241
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:06 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:05 +0000
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
Subject: [PATCH 14/17] crypto: fips140: add module integrity self-check
Date: Thu, 12 Feb 2026 02:42:18 +0000
Message-ID: <20260212024228.6267-15-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D040UWB004.ant.amazon.com (10.13.138.91) To
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
	TAGGED_FROM(0.00)[bounces-11141-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10307129484
X-Rspamd-Action: no action

Add verify_integrity() function to perform HMAC-SHA256 self verification
of this standalone crypto module against pre-computed hash. This integrity
self-check is required by FIPS 140-3.

This patch is picked from Vegard Nossum <vegard.nossum@oracle.com> with
minor modifications.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-module.c | 52 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.h |  4 +++
 2 files changed, 56 insertions(+)

diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
index e0e669ba1b5e..3bc8865567cb 100644
--- a/crypto/fips140/fips140-module.c
+++ b/crypto/fips140/fips140-module.c
@@ -16,6 +16,54 @@
 
 #define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
 
+static const u8 fips140_integ_hmac_key[] = CONFIG_CRYPTO_FIPS140_HMAC_KEY;
+
+static int verify_integrity(void)
+{
+	extern const u8 *_binary_crypto_ko_start;
+	extern const u8 *_binary_crypto_ko_end;
+	extern const u8 *_binary_crypto_hmac_start;
+	
+	struct crypto_shash *tfm;
+	SHASH_DESC_ON_STACK(desc, tfm);
+	u8 digest[SHA256_DIGEST_SIZE];
+	int err;
+
+	tfm = crypto_alloc_shash("hmac(sha256)", 0, 0);
+	if (IS_ERR(tfm))
+		panic("FIPS 140: failed to allocate hmac tfm (%ld)\n", PTR_ERR(tfm));
+
+	desc->tfm = tfm;
+
+	err = crypto_shash_setkey(tfm, fips140_integ_hmac_key, sizeof(fips140_integ_hmac_key) - 1);
+	if (err)
+		panic("FIPS 140: crypto_shash_setkey() failed: %d\n", err);
+
+	err = crypto_shash_init(desc);
+	if (err)
+		panic("FIPS 140: crypto_shash_init() failed: %d\n", err);
+
+	err = crypto_shash_update(desc, _binary_crypto_ko_start, _binary_crypto_ko_end - _binary_crypto_ko_start);
+	if (err)
+		panic("FIPS 140: crypto_shash_update() failed: %d\n", err);
+
+	err = crypto_shash_final(desc, digest);
+	if (err)
+		panic("FIPS 140: crypto_shash_final() failed: %d\n", err);
+
+	shash_desc_zero(desc);
+
+	if (memcmp(digest, _binary_crypto_hmac_start, sizeof(digest)))
+		panic("FIPS 140: failed integrity check\n");
+
+	pr_info("FIPS 140: integrity verification passed\n");
+
+	crypto_free_shash(tfm);
+	memzero_explicit(digest, sizeof(digest));
+
+	return 0;
+}
+
 static int __init run_initcalls(void)
 {
 	typedef int (*initcall_t)(void);
@@ -68,6 +116,10 @@ static int __init fips140_init(void)
     pr_info("loading " FIPS140_MODULE_NAME "\n");
 
 	run_initcalls();
+
+	if (fips_enabled){
+		verify_integrity(); /* Panics if integrity check fails */
+	}
 	fips140_mark_module_level_complete(2);
     return 0;
 }
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
index e95dac8eeda9..b8968d54800e 100644
--- a/crypto/fips140/fips140-module.h
+++ b/crypto/fips140/fips140-module.h
@@ -9,9 +9,13 @@
 #include <linux/module.h>
 #include <linux/crypto.h>
 #include <crypto/algapi.h>
+#include <crypto/hash.h>
+#include <crypto/sha2.h>
 #include <linux/init.h>
+#include <linux/string.h>
 #include <linux/atomic.h>
 #include <linux/wait.h>
+#include <linux/fips.h>
 
 /* FIPS140 synchronization between kernel and module */
 extern atomic_t fips140_kernel_level_complete;
-- 
2.47.3


