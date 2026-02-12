Return-Path: <linux-kbuild+bounces-11177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMohLDVBjWn00QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11177-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:55:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E42141297DD
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D7E43019101
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B99221F0A;
	Thu, 12 Feb 2026 02:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="twhKgNCz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C15221290;
	Thu, 12 Feb 2026 02:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864945; cv=none; b=psyGp/lckYygWf/j7OKq5qAsQLp/ERwdfX7eU4gmas38EzfUhmu6IXD4Erh3VZl4Qih5FCzhP6wR23T0JeABIA6WgprfhBFTSruroXg1sTjopBew01lRZKwNd/Ejqnpl3jHfhD31TJblM99hB/UvFWI9SLoyL822BQR7tW4k+N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864945; c=relaxed/simple;
	bh=n0aEeTP6AkiqwLyu+djy1XKeie5U34IU0yid1YLvy5M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=obMlv0ym/0S8IoP7brc+Zw9L9vJ4I0U98yhaD4iMUvAjGl0b8WCgdHNCMFkPaLLR5NyIow6KNTM1cpdd1UlZ/SZQF3yW1kDWxlK9MOXIN2rA7nkUx/3sZNVu+GFfzay8he4J1N3jWyUNLAFExHts5mQONDSYvmiMVyaunqdozlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=twhKgNCz; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864943; x=1802400943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GNblcWiFGu7PUaA5mM3jGQXVVIBLdMNtOeACIvpKQfk=;
  b=twhKgNCz3dkIvQ4AgtNqtBDoF54PJrMrHmjFIZJMSFhRNHZZXYyi0/st
   PTqh1qBN4wudBHQRJDdflzJolSMQsGHLCfge39nRWsBKJKPMH5OpmWHER
   IcTnj6pCTi7pffB5kUT5Z6bL6Nli2oCaqXYSzhb+7nUxK4Mmt94JP2dKn
   hGmLP8AHaxf7UWRvJp/SBKTVgmyBawRWr0Pb7eKIiLLwAEXaTtZQZW/OE
   ruEQFDTM89l0zTsbZEOomB0LDZLmhreBuV7CB/gu/xAPix3KNHNgu3hlz
   2KpfERILTf7Lyvp2sfs5KNKlmrNmheVQHyC34ZjcS9jVOJBED3JWGH3mD
   Q==;
X-CSE-ConnectionGUID: olPNSzCiQ1C5E6+Erb/rjQ==
X-CSE-MsgGUID: /e7arvW0QV+PJxG5HW/ssQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744185"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:55:43 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:8553]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 8ffdba31-548e-41e0-bc5a-1e9c52fc606e; Thu, 12 Feb 2026 02:55:43 +0000 (UTC)
X-Farcaster-Flow-ID: 8ffdba31-548e-41e0-bc5a-1e9c52fc606e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:43 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:42 +0000
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
Subject: [PATCH 032/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYMMETRIC_KEY_TYPE crypto
Date: Thu, 12 Feb 2026 02:46:08 +0000
Message-ID: <20260212024725.11264-33-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11177-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E42141297DD
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_ASYMMETRIC_KEY_TYPE-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 certs/system_keyring.c                   |  1 +
 crypto/asymmetric_keys/Makefile          |  2 +-
 crypto/asymmetric_keys/asymmetric_type.c |  4 +--
 crypto/asymmetric_keys/restrict.c        |  3 +-
 crypto/fips140/fips140-api.c             | 44 ++++++++++++++++++++++++
 include/crypto/public_key.h              | 29 +++++++++-------
 include/keys/asymmetric-parser.h         |  8 +++--
 include/keys/asymmetric-type.h           | 32 +++++++++--------
 8 files changed, 90 insertions(+), 33 deletions(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 9de610bf1f4b..a53261dc5629 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -50,6 +50,7 @@ int restrict_link_by_builtin_trusted(struct key *dest_keyring,
 	return restrict_link_by_signature(dest_keyring, type, payload,
 					  builtin_trusted_keys);
 }
+EXPORT_SYMBOL_GPL(restrict_link_by_builtin_trusted);
 
 /**
  * restrict_link_by_digsig_builtin - Restrict digitalSignature key additions by the built-in keyring
diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index bc65d3b98dcb..252536153d73 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -3,7 +3,7 @@
 # Makefile for asymmetric cryptographic keys
 #
 
-obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
+crypto-objs-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
 
 asymmetric_keys-y := \
 	asymmetric_type.o \
diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 2326743310b1..9afc58536cf6 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -677,5 +677,5 @@ static void __exit asymmetric_key_cleanup(void)
 	unregister_key_type(&key_type_asymmetric);
 }
 
-module_init(asymmetric_key_init);
-module_exit(asymmetric_key_cleanup);
+crypto_module_init(asymmetric_key_init);
+crypto_module_exit(asymmetric_key_cleanup);
diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index 86292965f493..5d6ecf9eadbc 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -114,7 +114,7 @@ int restrict_link_by_signature(struct key *dest_keyring,
 	key_put(key);
 	return ret;
 }
-
+EXPORT_SYMBOL_GPL(restrict_link_by_signature);
 /**
  * restrict_link_by_ca - Restrict additions to a ring of CA keys
  * @dest_keyring: Keyring being linked to.
@@ -198,6 +198,7 @@ int restrict_link_by_digsig(struct key *dest_keyring,
 	return restrict_link_by_signature(dest_keyring, type, payload,
 					  trust_keyring);
 }
+EXPORT_SYMBOL_GPL(restrict_link_by_digsig);
 
 static bool match_either_id(const struct asymmetric_key_id **pair,
 			    const struct asymmetric_key_id *single)
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 20afa1c21cf0..100f50ad7b43 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -413,3 +413,47 @@ DEFINE_CRYPTO_API_STUB(crypto_unregister_rngs);
 DEFINE_CRYPTO_API_STUB(crypto_del_default_rng);
 
 #endif
+/*
+ * crypto/asymmetric_keys/asymmetric_type.c
+ */
+#if IS_BUILTIN(CONFIG_ASYMMETRIC_KEY_TYPE)
+
+#include <keys/asymmetric-parser.h>
+
+DEFINE_CRYPTO_API_STUB(register_asymmetric_key_parser);
+DEFINE_CRYPTO_API_STUB(unregister_asymmetric_key_parser);
+
+#include <keys/asymmetric-type.h>
+
+DEFINE_CRYPTO_API_STUB(asymmetric_key_id_same);
+DEFINE_CRYPTO_API_STUB(asymmetric_key_id_partial);
+DEFINE_CRYPTO_API_STUB(asymmetric_key_generate_id);
+DEFINE_CRYPTO_API_STUB(find_asymmetric_key);
+
+#undef key_type_asymmetric
+DEFINE_CRYPTO_VAR_STUB(key_type_asymmetric);
+
+#endif
+/*
+ * crypto/asymmetric_keys/signature.c
+ */
+#if IS_BUILTIN(CONFIG_ASYMMETRIC_KEY_TYPE)
+
+#include <crypto/public_key.h>
+
+DEFINE_CRYPTO_API_STUB(public_key_signature_free);
+DEFINE_CRYPTO_API_STUB(query_asymmetric_key);
+DEFINE_CRYPTO_API_STUB(verify_signature);
+
+#endif
+/*
+ * crypto/asymmetric_keys/restrict.c
+ */
+#if IS_BUILTIN(CONFIG_ASYMMETRIC_KEY_TYPE)
+
+#include <crypto/public_key.h>
+
+DEFINE_CRYPTO_API_STUB(restrict_link_by_signature);
+DEFINE_CRYPTO_API_STUB(restrict_link_by_digsig);
+
+#endif
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 4c5199b20338..be789854fdcb 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -10,6 +10,7 @@
 #ifndef _LINUX_PUBLIC_KEY_H
 #define _LINUX_PUBLIC_KEY_H
 
+#include <crypto/api.h>
 #include <linux/errno.h>
 #include <linux/keyctl.h>
 #include <linux/oid_registry.h>
@@ -53,7 +54,9 @@ struct public_key_signature {
 	const char *encoding;
 };
 
-extern void public_key_signature_free(struct public_key_signature *sig);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, public_key_signature_free, void,
+	(struct public_key_signature *sig),
+	(sig));
 
 extern struct asymmetric_key_subtype public_key_subtype;
 
@@ -61,10 +64,9 @@ struct key;
 struct key_type;
 union key_payload;
 
-extern int restrict_link_by_signature(struct key *dest_keyring,
-				      const struct key_type *type,
-				      const union key_payload *payload,
-				      struct key *trust_keyring);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, restrict_link_by_signature, int,
+	(struct key *dest_keyring, const struct key_type *type, const union key_payload *payload, struct key *trust_keyring),
+	(dest_keyring, type, payload, trust_keyring));
 
 extern int restrict_link_by_key_or_keyring(struct key *dest_keyring,
 					   const struct key_type *type,
@@ -81,10 +83,9 @@ extern int restrict_link_by_ca(struct key *dest_keyring,
 			       const struct key_type *type,
 			       const union key_payload *payload,
 			       struct key *trust_keyring);
-int restrict_link_by_digsig(struct key *dest_keyring,
-			    const struct key_type *type,
-			    const union key_payload *payload,
-			    struct key *trust_keyring);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, restrict_link_by_digsig, int,
+	(struct key *dest_keyring, const struct key_type *type, const union key_payload *payload, struct key *trust_keyring),
+	(dest_keyring, type, payload, trust_keyring));
 #else
 static inline int restrict_link_by_ca(struct key *dest_keyring,
 				      const struct key_type *type,
@@ -103,11 +104,13 @@ static inline int restrict_link_by_digsig(struct key *dest_keyring,
 }
 #endif
 
-extern int query_asymmetric_key(const struct kernel_pkey_params *,
-				struct kernel_pkey_query *);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, query_asymmetric_key, int,
+	(const struct kernel_pkey_params *arg1, struct kernel_pkey_query *arg2),
+	(arg1, arg2));
 
-extern int verify_signature(const struct key *,
-			    const struct public_key_signature *);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, verify_signature, int,
+	(const struct key *arg1, const struct public_key_signature *arg2),
+	(arg1, arg2));
 
 #if IS_REACHABLE(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
 int public_key_verify_signature(const struct public_key *pkey,
diff --git a/include/keys/asymmetric-parser.h b/include/keys/asymmetric-parser.h
index 516a3f51179e..13474b17055b 100644
--- a/include/keys/asymmetric-parser.h
+++ b/include/keys/asymmetric-parser.h
@@ -29,7 +29,11 @@ struct asymmetric_key_parser {
 	int (*parse)(struct key_preparsed_payload *prep);
 };
 
-extern int register_asymmetric_key_parser(struct asymmetric_key_parser *);
-extern void unregister_asymmetric_key_parser(struct asymmetric_key_parser *);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, register_asymmetric_key_parser, int,
+	(struct asymmetric_key_parser *parser),
+	(parser));
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, unregister_asymmetric_key_parser, void,
+	(struct asymmetric_key_parser *parser),
+	(parser));
 
 #endif /* _KEYS_ASYMMETRIC_PARSER_H */
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 1b91c8f98688..96e718a550a3 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -10,10 +10,15 @@
 #ifndef _KEYS_ASYMMETRIC_TYPE_H
 #define _KEYS_ASYMMETRIC_TYPE_H
 
+#include <crypto/api.h>
 #include <linux/key-type.h>
 #include <linux/verification.h>
 
-extern struct key_type key_type_asymmetric;
+DECLARE_CRYPTO_VAR(CONFIG_ASYMMETRIC_KEY_TYPE, key_type_asymmetric, struct key_type, );
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_ASYMMETRIC_KEY_TYPE)
+#define key_type_asymmetric (*((struct key_type*)CRYPTO_VAR_NAME(key_type_asymmetric)))
+#endif
 
 /*
  * The key payload is four words.  The asymmetric-type key uses them as
@@ -56,16 +61,17 @@ struct asymmetric_key_ids {
 	void		*id[3];
 };
 
-extern bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
-				   const struct asymmetric_key_id *kid2);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, asymmetric_key_id_same, bool,
+	(const struct asymmetric_key_id *kid1, const struct asymmetric_key_id *kid2),
+	(kid1, kid2));
 
-extern bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
-				      const struct asymmetric_key_id *kid2);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, asymmetric_key_id_partial, bool,
+	(const struct asymmetric_key_id *kid1, const struct asymmetric_key_id *kid2),
+	(kid1, kid2));
 
-extern struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
-							    size_t len_1,
-							    const void *val_2,
-							    size_t len_2);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, asymmetric_key_generate_id, struct asymmetric_key_id *,
+	(const void *val_1, size_t len_1, const void *val_2, size_t len_2),
+	(val_1, len_1, val_2, len_2));
 static inline
 const struct asymmetric_key_ids *asymmetric_key_ids(const struct key *key)
 {
@@ -78,11 +84,9 @@ const struct public_key *asymmetric_key_public_key(const struct key *key)
 	return key->payload.data[asym_crypto];
 }
 
-extern struct key *find_asymmetric_key(struct key *keyring,
-				       const struct asymmetric_key_id *id_0,
-				       const struct asymmetric_key_id *id_1,
-				       const struct asymmetric_key_id *id_2,
-				       bool partial);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, find_asymmetric_key, struct key *,
+	(struct key *keyring, const struct asymmetric_key_id *id_0, const struct asymmetric_key_id *id_1, const struct asymmetric_key_id *id_2, bool partial),
+	(keyring, id_0, id_1, id_2, partial));
 
 int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_size,
 			       const struct key *keyring);
-- 
2.47.3


