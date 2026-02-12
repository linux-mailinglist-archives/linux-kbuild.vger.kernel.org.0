Return-Path: <linux-kbuild+bounces-11179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAtzNVJBjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11179-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:56:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3B129806
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4C58308A867
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281D3221FA0;
	Thu, 12 Feb 2026 02:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="PiNKIzB2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE485221290;
	Thu, 12 Feb 2026 02:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864976; cv=none; b=RWq4aW5JGDjvamjlw9sAlVDZ4Z71mHUewCYX3DnR7vmACL4rpD7aROVKoLpp4xrdjXqjyRUzEgctQYXtKYzHPLaZGmEYVDm7vv86bkClyZq026GQEHR0EwZLI14mi+5/5VO1M7Rsf8ZQShLWid0UUp0Ge/uQ+gCplzTsX2I8Jx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864976; c=relaxed/simple;
	bh=Ib5VqEqGrU4PFBLn3ltWnFodw7JUdhJ175BEn6kPkX8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QOq8T3FLg/B/VTUESHYB0iwmky+/6lEeJp0SJ1fQNPEPgfnTsEAzY7ai52xx2pF6Ap8TwSoJ22hwMcMmnkLpWi16E0R1vKGvSH0BG+bV47xCJakcrQOBDF4SpOcGjB7DSnDzFgGBiUpMuMmZbZgd77uzjtGBRpnE28qq0fY+lJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=PiNKIzB2; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864974; x=1802400974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V9uqEHT0wjXC+bQxH8T137ezoZZBdhvIZ8Goy0vY9qE=;
  b=PiNKIzB2rGXNEfZ5/f+KzHzzW3BMIb17RXPVpNU2kYtG07T4uR3hGT1A
   c9wIfm5X8yk8AIaByhp8WcuAYEV5cb6BdMRtyhmD/417zC7UtpDylp274
   Q+ZGYzdJmnIRSSneffBOdAPXCzEo+LngNCCa0kRK8v48NUaJ7/ewIdnaE
   an0a+FYobylJF73zOga514+uknIcDEc3jhYCl+oxZU4pdVQugZ9Ah6ks1
   mLuA6CEQiu2M5vCH+bMpqh0PEvBnvOysh2gBPTYKfRh+UeXLlyOuE5RB+
   MQmGgbro/aptbLFiFRHX7Mk/HI5eph+RgfMd74nYEJSzg12zPc7p4g3pS
   A==;
X-CSE-ConnectionGUID: nbeHQWtLTkSpS7JV7CbRJQ==
X-CSE-MsgGUID: 6Ax4YZHcQQuY9DMvkNcNYw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919599"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:56:14 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:7172]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id a06caf46-592c-4caa-8698-c9bd61ee5fa9; Thu, 12 Feb 2026 02:56:14 +0000 (UTC)
X-Farcaster-Flow-ID: a06caf46-592c-4caa-8698-c9bd61ee5fa9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:14 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:14 +0000
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
Subject: [PATCH 034/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_X509_CERTIFICATE_PARSER crypto
Date: Thu, 12 Feb 2026 02:46:10 +0000
Message-ID: <20260212024725.11264-35-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
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
	TAGGED_FROM(0.00)[bounces-11179-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 2DA3B129806
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_X509_CERTIFICATE_PARSER-related crypto to convert them into
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
 crypto/asymmetric_keys/Makefile          |  2 +-
 crypto/asymmetric_keys/x509_parser.h     | 15 ++++++++++-----
 crypto/asymmetric_keys/x509_public_key.c |  4 ++--
 crypto/fips140/fips140-api.c             | 22 ++++++++++++++++++++++
 include/keys/asymmetric-type.h           |  5 +++--
 5 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 4f29401016f1..b42c48d973d3 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -15,7 +15,7 @@ crypto-objs-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
 #
 # X.509 Certificate handling
 #
-obj-$(CONFIG_X509_CERTIFICATE_PARSER) += x509_key_parser.o
+crypto-objs-$(CONFIG_X509_CERTIFICATE_PARSER) += x509_key_parser.o
 x509_key_parser-y := \
 	x509.asn1.o \
 	x509_akid.asn1.o \
diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index b7aeebdddb36..53bfc5f807bb 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -5,6 +5,7 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
+#include <crypto/api.h>
 #include <linux/cleanup.h>
 #include <linux/time.h>
 #include <crypto/public_key.h>
@@ -46,13 +47,17 @@ struct x509_certificate {
 /*
  * x509_cert_parser.c
  */
-extern void x509_free_certificate(struct x509_certificate *cert);
+DECLARE_CRYPTO_API(CONFIG_X509_CERTIFICATE_PARSER, x509_free_certificate, void,
+	(struct x509_certificate *cert),
+	(cert));
 DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
 	    if (!IS_ERR(_T)) x509_free_certificate(_T))
-extern struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
-extern int x509_decode_time(time64_t *_t,  size_t hdrlen,
-			    unsigned char tag,
-			    const unsigned char *value, size_t vlen);
+DECLARE_CRYPTO_API(CONFIG_X509_CERTIFICATE_PARSER, x509_cert_parse, struct x509_certificate *,
+	(const void *data, size_t datalen),
+	(data, datalen));
+DECLARE_CRYPTO_API(CONFIG_X509_CERTIFICATE_PARSER, x509_decode_time, int,
+	(time64_t *_t, size_t hdrlen, unsigned char tag, const unsigned char *value, size_t vlen),
+	(_t, hdrlen, tag, value, vlen));
 
 /*
  * x509_public_key.c
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 27b4fea37845..e840bd8019be 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -258,8 +258,8 @@ static void __exit x509_key_exit(void)
 	unregister_asymmetric_key_parser(&x509_key_parser);
 }
 
-module_init(x509_key_init);
-module_exit(x509_key_exit);
+crypto_module_init(x509_key_init);
+crypto_module_exit(x509_key_exit);
 
 MODULE_DESCRIPTION("X.509 certificate parser");
 MODULE_AUTHOR("Red Hat, Inc.");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 6dce18f81e91..d08a001bb0db 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -471,3 +471,25 @@ DEFINE_CRYPTO_API_STUB(public_key_verify_signature);
 DEFINE_CRYPTO_VAR_STUB(public_key_subtype);
 
 #endif
+/*
+ * crypto/asymmetric_keys/x509_cert_parser.c
+ */
+#if IS_BUILTIN(CONFIG_X509_CERTIFICATE_PARSER)
+
+#include <crypto/asymmetric_keys/x509_parser.h>
+
+DEFINE_CRYPTO_API_STUB(x509_free_certificate);
+DEFINE_CRYPTO_API_STUB(x509_cert_parse);
+DEFINE_CRYPTO_API_STUB(x509_decode_time);
+
+#endif
+/*
+ * crypto/asymmetric_keys/x509_loader.c
+ */
+#if IS_BUILTIN(CONFIG_X509_CERTIFICATE_PARSER)
+
+#include <keys/asymmetric-type.h>
+
+DEFINE_CRYPTO_API_STUB(x509_load_certificate_list);
+
+#endif
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 96e718a550a3..dd5b4d9980c1 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -88,8 +88,9 @@ DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, find_asymmetric_key, struct key *
 	(struct key *keyring, const struct asymmetric_key_id *id_0, const struct asymmetric_key_id *id_1, const struct asymmetric_key_id *id_2, bool partial),
 	(keyring, id_0, id_1, id_2, partial));
 
-int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_size,
-			       const struct key *keyring);
+DECLARE_CRYPTO_API(CONFIG_X509_CERTIFICATE_PARSER, x509_load_certificate_list, int,
+	(const u8 cert_list[], const unsigned long list_size, const struct key *keyring),
+	(cert_list, list_size, keyring));
 
 /*
  * The payload is at the discretion of the subtype.
-- 
2.47.3


