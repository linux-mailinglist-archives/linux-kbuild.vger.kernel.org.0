Return-Path: <linux-kbuild+bounces-11180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIUZOmFBjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11180-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:56:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F4112981D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1448130115AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1151221FA0;
	Thu, 12 Feb 2026 02:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="T9kyi/Xv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703C48C1F;
	Thu, 12 Feb 2026 02:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864991; cv=none; b=nqP8Uth0GoyQxnW/lmWsTQteYRvbyww+DhqN3EyrubXR4CdlNbneX05NSiD5hJmXY7J8N4XtPfbQuEWeXIUJAtxQMSFXhFQ5TRAHCEKfw7VKnygDsWFOCfxJNPiMazqntJrofiQBV5CPpbL7ULWc0QmwDnPg3PvEZoiIDiUm6aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864991; c=relaxed/simple;
	bh=ijXnmWVmyh2w1a4/YCVdQ9GrNz8Tka8RsYsDZCDwkoU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BqoUrccEYYcnBM7BfU4kwtV3Wb+wg42JCzlDJsrjF7xtVVB9eCKJHtmaOjx8JMCA3c2xDGbMUihiVNAXCg/S+WvB8CWNmNZAwIxKHgNYWTgeq+D6uqd44IM+QJEtzerT9GYyCsaem6Rx7BvfQU7X6jT0YKmzVMn5/37KvUQMaXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=T9kyi/Xv; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864990; x=1802400990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LaXTANj3WdYLelf3OpIkwm0i1K8wVreZrvfuIhUYIUY=;
  b=T9kyi/Xv9tAwKiQdMTor1nZgdPuz410aMQ6sFaJz/VaSVhsKLsAcPgW/
   KmUQBPEYboY5ST9CV2aRYEBE4ByKFZwNWOq6vTIz6H/VfvKlbHvuKTyXa
   JKmuXmsp7KVglzpHbRPS/60utdnE5j3SnMfR1eP2wmfTqp47DOTXoQ/SK
   suDuv31PjuRYnfvq0zqD9LdnaAgz3hwq8SNMTTuywu8caSIFT2aifWH46
   Wlck3NvK/pFN6KOD1RoiuM1mi5t3HgFX25PPUU7fNTE8iG7X1Y+HAZ/2e
   oKQ9nqNSFgulqNjBIbzZ0uJC4t2s5w8VGsGLnx3JN9ZC/5FdRzQgU3dVh
   Q==;
X-CSE-ConnectionGUID: zZCaXZiOSGKoaKte3aZE+A==
X-CSE-MsgGUID: Qn2UBKQRQjaa9D5AJlI8lQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918104"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:56:30 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:4788]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 1538a963-b225-4216-9d58-6549fac3c68b; Thu, 12 Feb 2026 02:56:30 +0000 (UTC)
X-Farcaster-Flow-ID: 1538a963-b225-4216-9d58-6549fac3c68b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:29 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:29 +0000
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
Subject: [PATCH 035/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_PKCS7_MESSAGE_PARSER crypto
Date: Thu, 12 Feb 2026 02:46:11 +0000
Message-ID: <20260212024725.11264-36-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D044UWB004.ant.amazon.com (10.13.139.134) To
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
	TAGGED_FROM(0.00)[bounces-11180-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 57F4112981D
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_PKCS7_MESSAGE_PARSER-related crypto to convert them into pluggable
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
 crypto/asymmetric_keys/Makefile |  2 +-
 crypto/fips140/fips140-api.c    | 33 +++++++++++++++++++++++++++++++++
 include/crypto/pkcs7.h          | 31 +++++++++++++++++++------------
 3 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index b42c48d973d3..c68fdcd2c5cf 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -50,7 +50,7 @@ clean-files	+= pkcs8.asn1.c pkcs8.asn1.h
 #
 # PKCS#7 message handling
 #
-obj-$(CONFIG_PKCS7_MESSAGE_PARSER) += pkcs7_message.o
+crypto-objs-$(CONFIG_PKCS7_MESSAGE_PARSER) += pkcs7_message.o
 pkcs7_message-y := \
 	pkcs7.asn1.o \
 	pkcs7_parser.o \
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index d08a001bb0db..e679932ab552 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -493,3 +493,36 @@ DEFINE_CRYPTO_API_STUB(x509_decode_time);
 DEFINE_CRYPTO_API_STUB(x509_load_certificate_list);
 
 #endif
+/*
+ * crypto/asymmetric_keys/pkcs7_parser.c
+ */
+#if IS_BUILTIN(CONFIG_PKCS7_MESSAGE_PARSER)
+
+#include <crypto/pkcs7.h>
+
+DEFINE_CRYPTO_API_STUB(pkcs7_parse_message);
+DEFINE_CRYPTO_API_STUB(pkcs7_free_message);
+DEFINE_CRYPTO_API_STUB(pkcs7_get_content_data);
+
+#endif
+/*
+ * crypto/asymmetric_keys/pkcs7_trust.c
+ */
+#if IS_BUILTIN(CONFIG_PKCS7_MESSAGE_PARSER)
+
+#include <crypto/pkcs7.h>
+
+DEFINE_CRYPTO_API_STUB(pkcs7_validate_trust);
+
+#endif
+/*
+ * crypto/asymmetric_keys/pkcs7_verify.c
+ */
+#if IS_BUILTIN(CONFIG_PKCS7_MESSAGE_PARSER)
+
+#include <crypto/pkcs7.h>
+
+DEFINE_CRYPTO_API_STUB(pkcs7_verify);
+DEFINE_CRYPTO_API_STUB(pkcs7_supply_detached_data);
+
+#endif
diff --git a/include/crypto/pkcs7.h b/include/crypto/pkcs7.h
index 38ec7f5f9041..63a7f2dbe627 100644
--- a/include/crypto/pkcs7.h
+++ b/include/crypto/pkcs7.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_PKCS7_H
 #define _CRYPTO_PKCS7_H
 
+#include <crypto/api.h>
 #include <linux/verification.h>
 #include <linux/hash_info.h>
 #include <crypto/public_key.h>
@@ -18,28 +19,34 @@ struct pkcs7_message;
 /*
  * pkcs7_parser.c
  */
-extern struct pkcs7_message *pkcs7_parse_message(const void *data,
-						 size_t datalen);
-extern void pkcs7_free_message(struct pkcs7_message *pkcs7);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_parse_message, struct pkcs7_message *,
+	(const void *data, size_t datalen),
+	(data, datalen));
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_free_message, void,
+	(struct pkcs7_message *pkcs7),
+	(pkcs7));
 
-extern int pkcs7_get_content_data(const struct pkcs7_message *pkcs7,
-				  const void **_data, size_t *_datalen,
-				  size_t *_headerlen);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_get_content_data, int,
+	(const struct pkcs7_message *pkcs7, const void **_data, size_t *_datalen, size_t *_headerlen),
+	(pkcs7, _data, _datalen, _headerlen));
 
 /*
  * pkcs7_trust.c
  */
-extern int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
-				struct key *trust_keyring);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_validate_trust, int,
+	(struct pkcs7_message *pkcs7, struct key *trust_keyring),
+	(pkcs7, trust_keyring));
 
 /*
  * pkcs7_verify.c
  */
-extern int pkcs7_verify(struct pkcs7_message *pkcs7,
-			enum key_being_used_for usage);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_verify, int,
+	(struct pkcs7_message *pkcs7, enum key_being_used_for usage),
+	(pkcs7, usage));
 
-extern int pkcs7_supply_detached_data(struct pkcs7_message *pkcs7,
-				      const void *data, size_t datalen);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_supply_detached_data, int,
+	(struct pkcs7_message *pkcs7, const void *data, size_t datalen),
+	(pkcs7, data, datalen));
 
 extern int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf,
 			    u32 *len, enum hash_algo *hash_algo);
-- 
2.47.3


