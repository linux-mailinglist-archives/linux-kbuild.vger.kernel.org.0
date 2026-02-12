Return-Path: <linux-kbuild+bounces-11255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAhfF/1FjWmL0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11255-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:16:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2377129F6A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6D0A3015A6D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B41F21765B;
	Thu, 12 Feb 2026 03:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="P9wLpUm5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A413635C;
	Thu, 12 Feb 2026 03:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866171; cv=none; b=K62zj0D+IqXG5Fx9WbezSnZh4MvzZq1E8127g2EN9SurDEI4AapXkjkzHN13Gca8FLjlxmRzp4d5QHCVrmK/qA6iRJj3JVEv2xjheZ61eirz9PzrqRFHuZ/3TdWXbY26u1rWi8dk8iYK3t8vGy/9Y7BCtcS3DatqPxyepfsw1lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866171; c=relaxed/simple;
	bh=CJJ0fw1SnSm3VgmmI5zLR0QhH2KFa0rubt1TeBU8S0U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxkhS9qQsRuIbdwwQDc/P26A1J2deADzBNACyTUbQfK4LBYlICUq+D0Aea6601TV8s9KEqTvqKiQaAFhEfpHW0cT0L2BK/unbphWBuYY1lIgtxZT7+aBKs1fkE0fsjCSSBrKnyif7f6cBYiJiBrW06wyvDnTVuw8ntMgFfFQIK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=P9wLpUm5; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866169; x=1802402169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LKekGaHkY9fyNUE3F7u6mii6wirT5AB2k2+JZzcvE8M=;
  b=P9wLpUm5P52jonKSGpW7LhtZrsdlzT0fN33m+n/T45byw1Fbd7C23xbm
   /ZpyYAkBbwTOxXZzkdq2+fnrNBva+RC+vLZUyXaJUlwCq2EpLh4w4y9CF
   ATNLyeV7RTc880Zg0/JFzVnAHavgRPmyWjHLRD8wM+v7BTJjIs01unkKy
   0GoOcf+R+R/xEevq6u8Ue3TCXn0B/JXa+7AQeUjoLmz4IkjFsQEQlvY19
   EEGMtpqrWUIgARj2lYJtcnO3a7OVEIFvdTNl/R8EXxEzF9Y2FdctnnBtT
   tF1wAMcptuq1vf7Owf/RQSQ75qgmQ6dne9Cx3vNUQJ2uTMuO9QWJV7Cx/
   A==;
X-CSE-ConnectionGUID: tNB0Y13qSi+0/ah4RJSkLg==
X-CSE-MsgGUID: 50nH3G+FQau4XB4d4wDD/A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12697578"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:16:09 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21170]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 52878b05-dfb2-4564-858c-1d5a74177643; Thu, 12 Feb 2026 03:16:09 +0000 (UTC)
X-Farcaster-Flow-ID: 52878b05-dfb2-4564-858c-1d5a74177643
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:08 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:08 +0000
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
Subject: [PATCH 03/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_TWOFISH_X86_64_3WAY crypto
Date: Thu, 12 Feb 2026 03:15:01 +0000
Message-ID: <20260212031521.2124-4-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D038UWC002.ant.amazon.com (10.13.139.238) To
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
	TAGGED_FROM(0.00)[bounces-11255-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: E2377129F6A
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/fips140/fips140-api.c | 13 +++++++++++++
 arch/x86/crypto/twofish.h             | 13 +++++++++----
 arch/x86/crypto/twofish_glue_3way.c   |  4 ++--
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index ed8958bffbc9..f224f5206bbb 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -6,7 +6,7 @@ obj-$(CONFIG_CRYPTO_TWOFISH_586) += twofish-i586.o
 twofish-i586-y := twofish-i586-asm_32.o twofish_glue.o
 crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
 twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
 twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
 obj-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
 twofish-avx-x86_64-y := twofish-avx-x86_64-asm_64.o twofish_avx_glue.o
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index bb8ca949caef..a1a207fa34cd 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -8,4 +8,17 @@
 DEFINE_CRYPTO_API_STUB(twofish_enc_blk);
 DEFINE_CRYPTO_API_STUB(twofish_dec_blk);
 
+#endif
+
+/*
+ * arch/x86/crypto/twofish_glue_3way.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY)
+
+#include <arch/x86/crypto/twofish.h>
+
+DEFINE_CRYPTO_API_STUB(__twofish_enc_blk_3way);
+DEFINE_CRYPTO_API_STUB(twofish_dec_blk_3way);
+DEFINE_CRYPTO_API_STUB(twofish_dec_blk_cbc_3way);
+
 #endif
\ No newline at end of file
diff --git a/arch/x86/crypto/twofish.h b/arch/x86/crypto/twofish.h
index c44d2f53ee11..3ee4caa05428 100644
--- a/arch/x86/crypto/twofish.h
+++ b/arch/x86/crypto/twofish.h
@@ -16,11 +16,16 @@ DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64, twofish_dec_blk, asmlinkage voi
 	(ctx, dst, src));
 
 /* 3-way parallel cipher functions */
-asmlinkage void __twofish_enc_blk_3way(const void *ctx, u8 *dst, const u8 *src,
-				       bool xor);
-asmlinkage void twofish_dec_blk_3way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY, __twofish_enc_blk_3way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, bool xor),
+	(ctx, dst, src, xor));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY, twofish_dec_blk_3way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 /* helpers from twofish_x86_64-3way module */
-extern void twofish_dec_blk_cbc_3way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY, twofish_dec_blk_cbc_3way, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif /* ASM_X86_TWOFISH_H */
diff --git a/arch/x86/crypto/twofish_glue_3way.c b/arch/x86/crypto/twofish_glue_3way.c
index 8ad77725bf60..996753732402 100644
--- a/arch/x86/crypto/twofish_glue_3way.c
+++ b/arch/x86/crypto/twofish_glue_3way.c
@@ -161,8 +161,8 @@ static void __exit twofish_3way_fini(void)
 	crypto_unregister_skciphers(tf_skciphers, ARRAY_SIZE(tf_skciphers));
 }
 
-module_init(twofish_3way_init);
-module_exit(twofish_3way_fini);
+crypto_module_init(twofish_3way_init);
+crypto_module_exit(twofish_3way_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Twofish Cipher Algorithm, 3-way parallel asm optimized");
-- 
2.47.3


