Return-Path: <linux-kbuild+bounces-11254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLxvGO1FjWmL0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11254-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:15:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C90129F52
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93EDF3034B09
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBFA1C5F13;
	Thu, 12 Feb 2026 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Or5Xa0FR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B1DE555;
	Thu, 12 Feb 2026 03:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866154; cv=none; b=Ua+vJEdfI79vwG6loxUB3mHffF7dD+fJefWNqx7hmF43fCQBeQuibmkjYApUnrLw3HsLlPUxuHeMTe2B7751C4jCGIFYPCxYy/GQohrXmlcHuMR3MOhSMROJGUizLzbqSGO5MouE/7q99bAhG40LQiIJ8E3of8cZOANr2GB9mbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866154; c=relaxed/simple;
	bh=JFdOQxd2VsGvXr99M/0wRMEPmnNuNHn2dXmBsEVotp8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hY8ktPn24nXG2e3UjYAIVvCfeEuwVyvVY1YqQapRpaS7mq0Gkkuy3Hzq4L8BSdwYUr9nlFNpYKHcx4O4/roEDNOXpRa1Ol7wFvNS3hGj5X//3Q/zJN8IBja7iNwzaoKnYPqx5qGWm27xi/4nM4ixBOy6IjnaYTSFLnlA9xWAq9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Or5Xa0FR; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866153; x=1802402153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Khd4IrezYwBcwL4fTfPoA/BZFLTNYjIcAIt3G2bI1ns=;
  b=Or5Xa0FRoDrHh4YxU+IoBNK1p7VCRJqiS7xKNP9GsbVy1VM+mUopO/eD
   ifPDb3JcKErXuS4rkEmZUjDXxtHQuGOUCjHr0vUuGnGwDUyh42MZgDUDj
   SU8pRlw7mYvA26LC2YLD1KGNu/88bSqSiXj2dWdkDjJB0i7phn3Eaj3y4
   ZOZRKB0SfxzU9vHB+4IfjF95DI7XqR+L4ujEjUmHC/ATv9iqYuQ2BAMuE
   2tV0cW0aQcPQYYFYVMUxw+j8/srBs7nxzUq62LrVXRjX7yHiRTjRjMLWi
   eKHfqMZqsfyodMZluDtFcVnfGanuc2M+ciALzpveQbAm7R2luM5gjC2yh
   Q==;
X-CSE-ConnectionGUID: BxlQrjRxRTCucEGKREG5Pg==
X-CSE-MsgGUID: 9KUPbNLtS9ezzM8XwSsBzw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919961"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:15:53 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:13910]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id ac7124a3-aca6-461a-b62d-dcdaec4fba08; Thu, 12 Feb 2026 03:15:53 +0000 (UTC)
X-Farcaster-Flow-ID: ac7124a3-aca6-461a-b62d-dcdaec4fba08
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:15:53 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:15:52 +0000
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
Subject: [PATCH 02/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_TWOFISH_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:00 +0000
Message-ID: <20260212031521.2124-3-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
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
	TAGGED_FROM(0.00)[bounces-11254-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: D3C90129F52
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_TWOFISH_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/fips140/fips140-api.c | 11 +++++++++++
 arch/x86/crypto/twofish.h             |  9 +++++++--
 arch/x86/crypto/twofish_glue.c        |  4 ++--
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 27010cb2326c..ed8958bffbc9 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -4,7 +4,7 @@
 
 obj-$(CONFIG_CRYPTO_TWOFISH_586) += twofish-i586.o
 twofish-i586-y := twofish-i586-asm_32.o twofish_glue.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
 twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
 obj-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
 twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index e69de29bb2d1..bb8ca949caef 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -0,0 +1,11 @@
+/*
+ * arch/x86/crypto/twofish_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_TWOFISH_X86_64)
+
+#include <arch/x86/crypto/twofish.h>
+
+DEFINE_CRYPTO_API_STUB(twofish_enc_blk);
+DEFINE_CRYPTO_API_STUB(twofish_dec_blk);
+
+#endif
\ No newline at end of file
diff --git a/arch/x86/crypto/twofish.h b/arch/x86/crypto/twofish.h
index 12df400e6d53..c44d2f53ee11 100644
--- a/arch/x86/crypto/twofish.h
+++ b/arch/x86/crypto/twofish.h
@@ -2,13 +2,18 @@
 #ifndef ASM_X86_TWOFISH_H
 #define ASM_X86_TWOFISH_H
 
+#include <crypto/api.h>
 #include <linux/crypto.h>
 #include <crypto/twofish.h>
 #include <crypto/b128ops.h>
 
 /* regular block cipher functions from twofish_x86_64 module */
-asmlinkage void twofish_enc_blk(const void *ctx, u8 *dst, const u8 *src);
-asmlinkage void twofish_dec_blk(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64, twofish_enc_blk, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64, twofish_dec_blk, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 /* 3-way parallel cipher functions */
 asmlinkage void __twofish_enc_blk_3way(const void *ctx, u8 *dst, const u8 *src,
diff --git a/arch/x86/crypto/twofish_glue.c b/arch/x86/crypto/twofish_glue.c
index 8e9906d36902..8787a1d2cec4 100644
--- a/arch/x86/crypto/twofish_glue.c
+++ b/arch/x86/crypto/twofish_glue.c
@@ -91,8 +91,8 @@ static void __exit twofish_glue_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(twofish_glue_init);
-module_exit(twofish_glue_fini);
+crypto_module_init(twofish_glue_init);
+crypto_module_exit(twofish_glue_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION ("Twofish Cipher Algorithm, asm optimized");
-- 
2.47.3


