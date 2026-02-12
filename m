Return-Path: <linux-kbuild+bounces-11245-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEavAVlFjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11245-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:13:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECE129E72
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B07E7301FC85
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0F3238176;
	Thu, 12 Feb 2026 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="A5ReQmeh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2AD22A4EB;
	Thu, 12 Feb 2026 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866004; cv=none; b=ZqSyhR+i7XCN7BghGffQ5xlEoDeCtGOR25XIPeJfYBGajy5lpe6dS4jP83doD0J2fmS/BoPviysVnNLwlwaHiYtqh5lFOQz/tApzT3aC/lD5dbqhHk9PZ5IqOXShkzdJo8jwsrxpW6vftkZqqxJ7wZtKiyHqOJKlh16MDVuQ/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866004; c=relaxed/simple;
	bh=ivk6lyLKOu3/7I8SZIHq7zC8FcFq6XsWMHvr7sVaZPQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYZuNGh9Emi/h+Dcg+J0tVqDuAsZ+mLm8DL80xEp1x/ZEwt0AiYWxbx1yq4TU+aQj/do3N9tc6zHgt41+Hg57LFljxZPMd0tjU6kqiQfKhBpIADy86+QtdoW76uzvAiMy0vStJRstiWSqoz/znoLO4nxbsKnNmbpc9hXVgRLFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=A5ReQmeh; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866003; x=1802402003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EsFF6qYmobupnEVilsxg26zjFMI/RVZBIunkgvjfv6w=;
  b=A5ReQmehIOxaHMZ+ZWAuvzgC5F6sSrZY09XsLzccA79Cm83BUphJMpHr
   aDuVxuqM7476V9on7EoVqmKvG8exwWDIXNbWMI3edYhHVMP+eg0FSmo8V
   IuAAqspU/ZQpR5Whc3Rc8ht8p6iItgshRGpZ2uMnMLMzuGI6piKTSLjNl
   NWHNtwRA5ZDa+1e54wngs3tYLdurWdQQ7sQpqpNsIhTfJ6xqRNksWU+LE
   EzX9kpNgiehrx3912peigwUzCFqqpUkQQ4IKf3TWAqEBwBdzWAQWKXHwD
   4Do8TFwOVN1iRNoyLi/YctmFsjfOgXaiKb6q7h21k9ieBCx2VIBmK1jmL
   Q==;
X-CSE-ConnectionGUID: 3p5C+m1cTcawZj/T/aJh9g==
X-CSE-MsgGUID: H+Is+MO7RJenMAiG6MNy7A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918481"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:13:23 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:28955]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id b7fd1c74-e6bb-4b5b-bae5-f668a08df5e2; Thu, 12 Feb 2026 03:13:22 +0000 (UTC)
X-Farcaster-Flow-ID: b7fd1c74-e6bb-4b5b-bae5-f668a08df5e2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:19 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:19 +0000
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
Subject: [PATCH 100/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_KRB5 crypto
Date: Thu, 12 Feb 2026 02:47:16 +0000
Message-ID: <20260212024725.11264-101-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D045UWC001.ant.amazon.com (10.13.139.223) To
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
	TAGGED_FROM(0.00)[bounces-11245-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: B7ECE129E72
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_KRB5-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-api.c | 27 +++++++++++++
 crypto/krb5/Makefile         |  2 +-
 crypto/krb5/krb5_api.c       |  4 +-
 include/crypto/krb5.h        | 78 ++++++++++++++++--------------------
 4 files changed, 65 insertions(+), 46 deletions(-)

diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 0ed89baa3865..3e4203dd2aeb 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -864,6 +864,33 @@ DEFINE_CRYPTO_API_STUB(async_raid6_datap_recov);
 DEFINE_CRYPTO_API_STUB(crypto_kdf108_ctr_generate);
 DEFINE_CRYPTO_API_STUB(crypto_kdf108_setkey);
 
+#endif
+/*
+ * crypto/krb5/krb5.o
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_KRB5)
+
+#include <crypto/krb5.h>
+
+/*
+ * crypto/krb5/krb5_kdf.c
+ */
+DEFINE_CRYPTO_API_STUB(crypto_krb5_calc_PRFplus);
+
+/*
+ * crypto/krb5/krb5_api.c
+ */
+DEFINE_CRYPTO_API_STUB(crypto_krb5_find_enctype);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_how_much_buffer);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_how_much_data);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_where_is_the_data);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_prepare_encryption);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_prepare_checksum);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_encrypt);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_decrypt);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_get_mic);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_verify_mic);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/crypto/krb5/Makefile b/crypto/krb5/Makefile
index d38890c0b247..513759fc8dcc 100644
--- a/crypto/krb5/Makefile
+++ b/crypto/krb5/Makefile
@@ -15,4 +15,4 @@ krb5-$(CONFIG_CRYPTO_KRB5_SELFTESTS) += \
 	selftest.o \
 	selftest_data.o
 
-obj-$(CONFIG_CRYPTO_KRB5) += krb5.o
+crypto-objs-$(CONFIG_CRYPTO_KRB5) += krb5.o
diff --git a/crypto/krb5/krb5_api.c b/crypto/krb5/krb5_api.c
index 23026d4206c8..5725ed1cb4b7 100644
--- a/crypto/krb5/krb5_api.c
+++ b/crypto/krb5/krb5_api.c
@@ -444,9 +444,9 @@ static int __init crypto_krb5_init(void)
 {
 	return krb5_selftest();
 }
-module_init(crypto_krb5_init);
+crypto_module_init(crypto_krb5_init);
 
 static void __exit crypto_krb5_exit(void)
 {
 }
-module_exit(crypto_krb5_exit);
+crypto_module_exit(crypto_krb5_exit);
diff --git a/include/crypto/krb5.h b/include/crypto/krb5.h
index 71dd38f59be1..e2de2d0391a1 100644
--- a/include/crypto/krb5.h
+++ b/include/crypto/krb5.h
@@ -8,6 +8,8 @@
 #ifndef _CRYPTO_KRB5_H
 #define _CRYPTO_KRB5_H
 
+#include <crypto/api.h>
+
 #include <linux/crypto.h>
 #include <crypto/aead.h>
 #include <crypto/hash.h>
@@ -114,52 +116,42 @@ struct krb5_enctype {
 /*
  * krb5_api.c
  */
-const struct krb5_enctype *crypto_krb5_find_enctype(u32 enctype);
-size_t crypto_krb5_how_much_buffer(const struct krb5_enctype *krb5,
-				   enum krb5_crypto_mode mode,
-				   size_t data_size, size_t *_offset);
-size_t crypto_krb5_how_much_data(const struct krb5_enctype *krb5,
-				 enum krb5_crypto_mode mode,
-				 size_t *_buffer_size, size_t *_offset);
-void crypto_krb5_where_is_the_data(const struct krb5_enctype *krb5,
-				   enum krb5_crypto_mode mode,
-				   size_t *_offset, size_t *_len);
-struct crypto_aead *crypto_krb5_prepare_encryption(const struct krb5_enctype *krb5,
-						   const struct krb5_buffer *TK,
-						   u32 usage, gfp_t gfp);
-struct crypto_shash *crypto_krb5_prepare_checksum(const struct krb5_enctype *krb5,
-						  const struct krb5_buffer *TK,
-						  u32 usage, gfp_t gfp);
-ssize_t crypto_krb5_encrypt(const struct krb5_enctype *krb5,
-			    struct crypto_aead *aead,
-			    struct scatterlist *sg, unsigned int nr_sg,
-			    size_t sg_len,
-			    size_t data_offset, size_t data_len,
-			    bool preconfounded);
-int crypto_krb5_decrypt(const struct krb5_enctype *krb5,
-			struct crypto_aead *aead,
-			struct scatterlist *sg, unsigned int nr_sg,
-			size_t *_offset, size_t *_len);
-ssize_t crypto_krb5_get_mic(const struct krb5_enctype *krb5,
-			    struct crypto_shash *shash,
-			    const struct krb5_buffer *metadata,
-			    struct scatterlist *sg, unsigned int nr_sg,
-			    size_t sg_len,
-			    size_t data_offset, size_t data_len);
-int crypto_krb5_verify_mic(const struct krb5_enctype *krb5,
-			   struct crypto_shash *shash,
-			   const struct krb5_buffer *metadata,
-			   struct scatterlist *sg, unsigned int nr_sg,
-			   size_t *_offset, size_t *_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_find_enctype, const struct krb5_enctype *,
+	(u32 enctype),
+	(enctype));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_how_much_buffer, size_t,
+	(const struct krb5_enctype *krb5, enum krb5_crypto_mode mode, size_t data_size, size_t *_offset),
+	(krb5, mode, data_size, _offset));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_how_much_data, size_t,
+	(const struct krb5_enctype *krb5, enum krb5_crypto_mode mode, size_t *_buffer_size, size_t *_offset),
+	(krb5, mode, _buffer_size, _offset));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_where_is_the_data, void,
+	(const struct krb5_enctype *krb5, enum krb5_crypto_mode mode, size_t *_offset, size_t *_len),
+	(krb5, mode, _offset, _len));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_prepare_encryption, struct crypto_aead *,
+	(const struct krb5_enctype *krb5, const struct krb5_buffer *TK, u32 usage, gfp_t gfp),
+	(krb5, TK, usage, gfp));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_prepare_checksum, struct crypto_shash *,
+	(const struct krb5_enctype *krb5, const struct krb5_buffer *TK, u32 usage, gfp_t gfp),
+	(krb5, TK, usage, gfp));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_encrypt, ssize_t,
+	(const struct krb5_enctype *krb5, struct crypto_aead *aead, struct scatterlist *sg, unsigned int nr_sg, size_t sg_len, size_t data_offset, size_t data_len, bool preconfounded),
+	(krb5, aead, sg, nr_sg, sg_len, data_offset, data_len, preconfounded));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_decrypt, int,
+	(const struct krb5_enctype *krb5, struct crypto_aead *aead, struct scatterlist *sg, unsigned int nr_sg, size_t *_offset, size_t *_len),
+	(krb5, aead, sg, nr_sg, _offset, _len));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_get_mic, ssize_t,
+	(const struct krb5_enctype *krb5, struct crypto_shash *shash, const struct krb5_buffer *metadata, struct scatterlist *sg, unsigned int nr_sg, size_t sg_len, size_t data_offset, size_t data_len),
+	(krb5, shash, metadata, sg, nr_sg, sg_len, data_offset, data_len));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_verify_mic, int,
+	(const struct krb5_enctype *krb5, struct crypto_shash *shash, const struct krb5_buffer *metadata, struct scatterlist *sg, unsigned int nr_sg, size_t *_offset, size_t *_len),
+	(krb5, shash, metadata, sg, nr_sg, _offset, _len));
 
 /*
  * krb5_kdf.c
  */
-int crypto_krb5_calc_PRFplus(const struct krb5_enctype *krb5,
-			     const struct krb5_buffer *K,
-			     unsigned int L,
-			     const struct krb5_buffer *S,
-			     struct krb5_buffer *result,
-			     gfp_t gfp);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_calc_PRFplus, int,
+	(const struct krb5_enctype *krb5, const struct krb5_buffer *K, unsigned int L, const struct krb5_buffer *S, struct krb5_buffer *result, gfp_t gfp),
+	(krb5, K, L, S, result, gfp));
 
 #endif /* _CRYPTO_KRB5_H */
-- 
2.47.3


