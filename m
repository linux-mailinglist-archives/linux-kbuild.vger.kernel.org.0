Return-Path: <linux-kbuild+bounces-11178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LrwOkdBjWn00QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11178-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:56:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F671297F5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D6E0308E497
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B349D221FA0;
	Thu, 12 Feb 2026 02:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="apifc5bu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE88C1F;
	Thu, 12 Feb 2026 02:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864964; cv=none; b=Jg5Kj1WjDPdXrlAz0QNhW6PylUtMTQvg1CMHDR57p66Vi6qJz0RalhpSdnP5N4hzowdTjQk9fGxbvgtWozltS9/cXSsrR7V+3I/RoHOWPrzSQvdrlHmGg9mwtPscRGcPaNsug30rPa+thGaPomto2R163TkTQeNZTzCuOrlG9cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864964; c=relaxed/simple;
	bh=dR+sw2dUv6EZ32pY9zP73IB3CPd0BflbR6AAqcHBVhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cszwHkd/RIW+DmcOPZ7j9O9Bf3JFO1Qs2okuRqWwSi8FjDWUDuKT7eoIBWLrU1gVlSketkld65VDNZ9eb0YEmKFk53Dg+yNW/7cXoZLOBlTNa3TcWUCBOFjIgrnUtjbzvV6vyYx+j5bSwYKRgLZnOaM5CbyFekbLBFrFd1KHO2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=apifc5bu; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864963; x=1802400963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y4yK8WicVdE8ixC2fqu9NxvZYG/kMokZid0aN9xc718=;
  b=apifc5buI5XbaKA+jOkPi2dugvH+WgQ5i/i2i/XpFa+REqYQEnak9H03
   rk0RyLv+YgOaCpglOA494sexhYMMK2zQoHOP8q8QYzggtFuh2NxDuibTD
   ZfBKq9mdMUu+PmGiFlwhs+94CbcFBudAAV3ZIAEkqt4k5QdmYeSV489Vs
   LvRoaJLD7DquAsasCMSrFBX3pxr4UjmP1+8cMSImlq4EK0GBTa7M3+lXt
   9FyINlSlvrs76BTY2vldyRWqK8b+U73nrKL5/Xw8OBq3WTXfl1QL8EHqN
   V2ISTeK4HNQYmU0FkVR2mge9CZLBK38WgDDAWAh8QdunwV0nGT3QEf2N6
   A==;
X-CSE-ConnectionGUID: CUld7qZWT3ehwR5Iwrnu6g==
X-CSE-MsgGUID: z3Jc180zR26kxXm3G8Fa1A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919570"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:56:03 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:7273]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 21bc2199-4b92-424a-8288-a9a4cc86a0eb; Thu, 12 Feb 2026 02:56:03 +0000 (UTC)
X-Farcaster-Flow-ID: 21bc2199-4b92-424a-8288-a9a4cc86a0eb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:58 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:58 +0000
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
Subject: [PATCH 033/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE crypto
Date: Thu, 12 Feb 2026 02:46:09 +0000
Message-ID: <20260212024725.11264-34-wanjay@amazon.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11178-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 96F671297F5
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE-related crypto to convert them into
pluggable interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/asymmetric_keys/Makefile |  2 +-
 crypto/fips140/fips140-api.c    | 14 ++++++++++++++
 include/crypto/public_key.h     | 15 +++++++++++----
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 252536153d73..4f29401016f1 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -10,7 +10,7 @@ asymmetric_keys-y := \
 	restrict.o \
 	signature.o
 
-obj-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
+crypto-objs-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
 
 #
 # X.509 Certificate handling
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 100f50ad7b43..6dce18f81e91 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -457,3 +457,17 @@ DEFINE_CRYPTO_API_STUB(restrict_link_by_signature);
 DEFINE_CRYPTO_API_STUB(restrict_link_by_digsig);
 
 #endif
+/*
+ * crypto/asymmetric_keys/public_key.c
+ */
+#if IS_BUILTIN(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+
+#include <crypto/public_key.h>
+
+DEFINE_CRYPTO_API_STUB(public_key_free);
+DEFINE_CRYPTO_API_STUB(public_key_verify_signature);
+
+#undef public_key_subtype
+DEFINE_CRYPTO_VAR_STUB(public_key_subtype);
+
+#endif
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index be789854fdcb..b0e737d1dc1a 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -36,7 +36,9 @@ struct public_key {
 #define KEY_EFLAG_KEYCERTSIGN	2	/* set if the keyCertSign usage is set */
 };
 
-extern void public_key_free(struct public_key *key);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE, public_key_free, void,
+	(struct public_key *key),
+	(key));
 
 /*
  * Public key cryptography signature data
@@ -58,7 +60,11 @@ DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, public_key_signature_free, void,
 	(struct public_key_signature *sig),
 	(sig));
 
-extern struct asymmetric_key_subtype public_key_subtype;
+DECLARE_CRYPTO_VAR(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE, public_key_subtype, struct asymmetric_key_subtype, );
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+#define public_key_subtype (*((struct asymmetric_key_subtype*)CRYPTO_VAR_NAME(public_key_subtype)))
+#endif
 
 struct key;
 struct key_type;
@@ -113,8 +119,9 @@ DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, verify_signature, int,
 	(arg1, arg2));
 
 #if IS_REACHABLE(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
-int public_key_verify_signature(const struct public_key *pkey,
-				const struct public_key_signature *sig);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE, public_key_verify_signature, int,
+	(const struct public_key *pkey, const struct public_key_signature *sig),
+	(pkey, sig));
 #else
 static inline
 int public_key_verify_signature(const struct public_key *pkey,
-- 
2.47.3


