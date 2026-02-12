Return-Path: <linux-kbuild+bounces-11162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIW6IUxAjWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11162-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:51:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579A129675
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F42333020E88
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8456B2206B1;
	Thu, 12 Feb 2026 02:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="CVdZcozc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2F71BC46;
	Thu, 12 Feb 2026 02:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864712; cv=none; b=bYP0HNIQ6UsSAa9Y/78pvqIZUVz0Q6IKTSfuEEIARgL88Ut175W7xrWyBNEjnTocrZHdfXfkfBASOiwQYdoZUHRoEggObzvSE2efzsyDb/+rzCbNzXba4AK+VseP30Nm39sIsfKEYtR2q53pFHosuAfrTeSYAmq/tDbqWe394bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864712; c=relaxed/simple;
	bh=/YYaOYMxOWdjuwRYLOO4jAWWhJAxBZ6W/8OxJit/nsA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfYGik8qJibgqvCDImIvYkp4lYo6kg+Pbjr5hXoMyaq6mf9bejS/bfD20KQFfhLYsb93wa1TWCjQm1CG4WC7TNSDXKHEN7uEFJfn/z0mhmC69t8+DKZ1cpdTGZW6my5kxA3y+PMhsSlVLity0rVi7VFvuGGLZDzdYptgxh3xKNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=CVdZcozc; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864711; x=1802400711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oGjvxsaA2vMvrrtkyZwsViNZnq7rh42dZCtGNwpCGCU=;
  b=CVdZcozcsZyQlCM5ARCqIfyuAUcHJoo9Zdaino+Wi6JIbxdWezh5fQX0
   IRVpWDYMLQurUMhhifGM7VQTmzdKhTTz17AvcNDqaBi7+JoV9dcgRRzfR
   nGkQk+xmJhn97gJDRZdTzpHNw6KBDOZYeGAfdxxTn6FpTR+B9YiX6nZTv
   W0pPW2OiLaH8ponFyizF11Eim/5GcZKkDGe3iAWpE7NQgym/UP1ryisxV
   uL+IKqjINNnpRdTqzAV3LsKz62CeTx0CdkvceXqXvHdvMJ6EhjpbI1l9U
   Gln9orzvD3FkHQtC2acWsD2l7V8LDtf79R4k2Jx45PQbkO841W72Ft3sb
   g==;
X-CSE-ConnectionGUID: GEai6Ol8Qlmp9sOo0rlI4w==
X-CSE-MsgGUID: jS9CDnEDS2CWR4YJYbFiOA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918699"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:51:51 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:21475]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id bf2c3f47-f2af-44fa-910c-1b92b27d91e8; Thu, 12 Feb 2026 02:51:50 +0000 (UTC)
X-Farcaster-Flow-ID: bf2c3f47-f2af-44fa-910c-1b92b27d91e8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:50 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:50 +0000
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
Subject: [PATCH 017/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_MD5 crypto
Date: Thu, 12 Feb 2026 02:45:53 +0000
Message-ID: <20260212024725.11264-18-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11162-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0579A129675
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_MD5-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/fips140/fips140-api.c | 11 +++++++++++
 crypto/md5.c                 |  4 ++--
 include/crypto/md5.h         |  8 +++++++-
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 4d03d612b942..6310c3e88e4b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -77,7 +77,7 @@ crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
 obj-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 obj-$(CONFIG_CRYPTO_MD4) += md4.o
-obj-$(CONFIG_CRYPTO_MD5) += md5.o
+crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
 obj-$(CONFIG_CRYPTO_SHA256) += sha256.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 17e03d4c1c9a..77ed24a3cd3b 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -368,4 +368,15 @@ DEFINE_CRYPTO_API_STUB(crypto_unregister_scomps);
 
 DEFINE_CRYPTO_API_STUB(alg_test);
 
+#endif
+
+/*
+ * crypto/md5.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_MD5)
+
+#include <crypto/md5.h>
+
+#undef md5_zero_message_hash
+DEFINE_CRYPTO_VAR_STUB(md5_zero_message_hash);
 #endif
\ No newline at end of file
diff --git a/crypto/md5.c b/crypto/md5.c
index c167d203c710..3a11675585c7 100644
--- a/crypto/md5.c
+++ b/crypto/md5.c
@@ -219,13 +219,13 @@ static int __init crypto_md5_mod_init(void)
 {
 	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
 }
-module_init(crypto_md5_mod_init);
+crypto_module_init(crypto_md5_mod_init);
 
 static void __exit crypto_md5_mod_exit(void)
 {
 	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
 }
-module_exit(crypto_md5_mod_exit);
+crypto_module_exit(crypto_md5_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Crypto API support for MD5 and HMAC-MD5");
diff --git a/include/crypto/md5.h b/include/crypto/md5.h
index c47aedfe67ec..9ec82ce94c1a 100644
--- a/include/crypto/md5.h
+++ b/include/crypto/md5.h
@@ -2,6 +2,7 @@
 #ifndef _CRYPTO_MD5_H
 #define _CRYPTO_MD5_H
 
+#include <crypto/api.h>
 #include <crypto/hash.h>
 #include <linux/types.h>
 
@@ -20,7 +21,12 @@
 #define CRYPTO_MD5_STATESIZE \
 	CRYPTO_HASH_STATESIZE(MD5_STATE_SIZE, MD5_HMAC_BLOCK_SIZE)
 
-extern const u8 md5_zero_message_hash[MD5_DIGEST_SIZE];
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_MD5, md5_zero_message_hash, const u8, [MD5_DIGEST_SIZE]);
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_CRYPTO_MD5)
+#define md5_zero_message_hash (((const u8*)CRYPTO_VAR_NAME(md5_zero_message_hash)))
+#endif
+
 
 struct md5_state {
 	u32 hash[MD5_HASH_WORDS];
-- 
2.47.3


