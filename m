Return-Path: <linux-kbuild+bounces-11158-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP/0Gw9AjWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11158-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:50:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71C129617
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE4C23013738
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B59821FF46;
	Thu, 12 Feb 2026 02:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="MkpcyN+c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD671BC46;
	Thu, 12 Feb 2026 02:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864651; cv=none; b=Gq/3m41Tyg79RRL7UtHNf+y2/BYSrGkm5j8BwFI1nBkPpoxdJCrzBAW/BkO4H1RTkrSczHs7VXl1rAhpzH5V9ORnsN2zytwj8vaNE+mYOjlFuuEpUQVz0l+Sb18q5Hxi5WcTXDl1OJEMLc4pH6VvhD+082aSVBPQJbd8vGz8v1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864651; c=relaxed/simple;
	bh=84vFdqUwqUfj23TQ7i3PYCWH/F0AWdpkhkl+N8A3KDg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCTvUgZWppOgksIzz23Q6NDx+HJtxaq2XtmkJIkKTpWTzP300LKFerBtuK0NZk4AiPaIalRuQNOyssVN5u+XrcMmdjIIZeUOTrG0oOgXolb/tra8/qKy0uVMyIqBHFQzlHA+nBQ5pZxjG92OGYxsznNQSMUpKX+GOXHztR8f4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=MkpcyN+c; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864649; x=1802400649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=llTiMmMlJ0GyWnV3th6rLzU3WngxBPXPgfgrgxMgmTg=;
  b=MkpcyN+cj8HemmByfsoLHp+ajcczH9GlmcsxKNIcemz5qF/HEIBx/cpG
   G5Ihu7pa4vLtFgwKxk2JSH5TGjbG7s4fb6ANfGHYJ9x1No8+v7crWhSea
   Kk9r0yUC7JKlfnAK+M+9NagVbEJ/fUu6ty7dOreFAYjr26EwGy076nVWq
   n82Gde2FANFsWy2W2illeL6oTeAcB0cFUgrfdgdbDjoGl6ntbZFpezDRJ
   wFPFxmlT15QnxXegdlLBg5NqlRP/BFgx3tzFDHIH738MtRlKKvdwws5Qv
   yZztEecqHglfnVCROzrjXVCRZ5UVNyQ2eWVJnsNxr1S1Y68vu3OdKYvhu
   w==;
X-CSE-ConnectionGUID: jyXHOONbTWimwGXNQkrVvQ==
X-CSE-MsgGUID: /r7k9pssTziM9d1HoJ102Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918662"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:50:49 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:26998]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 5ca45784-e325-40bc-9f35-c400a4095129; Thu, 12 Feb 2026 02:50:49 +0000 (UTC)
X-Farcaster-Flow-ID: 5ca45784-e325-40bc-9f35-c400a4095129
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:48 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:48 +0000
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
Subject: [PATCH 013/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ACOMP2 crypto
Date: Thu, 12 Feb 2026 02:45:49 +0000
Message-ID: <20260212024725.11264-14-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D045UWC002.ant.amazon.com (10.13.139.230) To
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
	TAGGED_FROM(0.00)[bounces-11158-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: DD71C129617
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_ACOMP2-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile                     |  2 +-
 crypto/fips140/fips140-api.c        | 42 +++++++++++++++++++++++++++++
 include/crypto/acompress.h          | 14 +++++-----
 include/crypto/internal/acompress.h | 27 +++++++++----------
 include/crypto/internal/scompress.h |  9 ++++---
 5 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3e12b556bfa7..e940f9ed357d 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -66,7 +66,7 @@ obj-$(CONFIG_CRYPTO_MLDSA) += mldsa.o
 
 crypto_acompress-y := acompress.o
 crypto_acompress-y += scompress.o
-obj-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
+crypto-objs-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
 
 cryptomgr-y := algboss.o testmgr.o
 
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index d10eded6b61e..9a9c66cc1d90 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -315,4 +315,46 @@ DEFINE_CRYPTO_API_STUB(kpp_register_instance);
 DEFINE_CRYPTO_API_STUB(rsa_parse_pub_key);
 DEFINE_CRYPTO_API_STUB(rsa_parse_priv_key);
 
+#endif
+
+/*
+ * crypto/acompress.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ACOMP2)
+
+#include <crypto/acompress.h>
+#include <crypto/internal/acompress.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alloc_acomp);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_acomp_node);
+DEFINE_CRYPTO_API_STUB(crypto_acomp_compress);
+DEFINE_CRYPTO_API_STUB(crypto_acomp_decompress);
+DEFINE_CRYPTO_API_STUB(crypto_register_acomp);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_acomp);
+DEFINE_CRYPTO_API_STUB(crypto_register_acomps);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_acomps);
+DEFINE_CRYPTO_API_STUB(crypto_acomp_free_streams);
+DEFINE_CRYPTO_API_STUB(crypto_acomp_alloc_streams);
+DEFINE_CRYPTO_API_STUB(_crypto_acomp_lock_stream_bh);
+DEFINE_CRYPTO_API_STUB(acomp_walk_done_src);
+DEFINE_CRYPTO_API_STUB(acomp_walk_done_dst);
+DEFINE_CRYPTO_API_STUB(acomp_walk_next_src);
+DEFINE_CRYPTO_API_STUB(acomp_walk_next_dst);
+DEFINE_CRYPTO_API_STUB(acomp_walk_virt);
+DEFINE_CRYPTO_API_STUB(acomp_request_clone);
+
+#endif
+
+/*
+ * crypto/scompress.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ACOMP2)
+
+#include <crypto/internal/scompress.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_register_scomp);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_scomp);
+DEFINE_CRYPTO_API_STUB(crypto_register_scomps);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_scomps);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 9eacb9fa375d..54545cd3f2f8 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -9,6 +9,7 @@
 #ifndef _CRYPTO_ACOMP_H
 #define _CRYPTO_ACOMP_H
 
+#include <crypto/api.h>
 #include <linux/atomic.h>
 #include <linux/args.h>
 #include <linux/compiler_types.h>
@@ -143,8 +144,7 @@ struct comp_alg_common COMP_ALG_COMMON;
  * Return:	allocated handle in case of success; IS_ERR() is true in case
  *		of an error, PTR_ERR() returns the error code.
  */
-struct crypto_acomp *crypto_alloc_acomp(const char *alg_name, u32 type,
-					u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_alloc_acomp, struct crypto_acomp *, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 /**
  * crypto_alloc_acomp_node() -- allocate ACOMPRESS tfm handle with desired NUMA node
  * @alg_name:	is the cra_name / name or cra_driver_name / driver name of the
@@ -161,8 +161,7 @@ struct crypto_acomp *crypto_alloc_acomp(const char *alg_name, u32 type,
  * Return:	allocated handle in case of success; IS_ERR() is true in case
  *		of an error, PTR_ERR() returns the error code.
  */
-struct crypto_acomp *crypto_alloc_acomp_node(const char *alg_name, u32 type,
-					u32 mask, int node);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_alloc_acomp_node, struct crypto_acomp *, (const char *alg_name, u32 type, u32 mask, int node), (alg_name, type, mask, node));
 
 static inline struct crypto_tfm *crypto_acomp_tfm(struct crypto_acomp *tfm)
 {
@@ -529,7 +528,7 @@ static inline void acomp_request_set_dst_folio(struct acomp_req *req,
  *
  * Return:	zero on success; error code in case of error
  */
-int crypto_acomp_compress(struct acomp_req *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_acomp_compress, int, (struct acomp_req *req), (req));
 
 /**
  * crypto_acomp_decompress() -- Invoke asynchronous decompress operation
@@ -540,7 +539,7 @@ int crypto_acomp_compress(struct acomp_req *req);
  *
  * Return:	zero on success; error code in case of error
  */
-int crypto_acomp_decompress(struct acomp_req *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_acomp_decompress, int, (struct acomp_req *req), (req));
 
 static inline struct acomp_req *acomp_request_on_stack_init(
 	char *buf, struct crypto_acomp *tfm)
@@ -551,7 +550,6 @@ static inline struct acomp_req *acomp_request_on_stack_init(
 	return req;
 }
 
-struct acomp_req *acomp_request_clone(struct acomp_req *req,
-				      size_t total, gfp_t gfp);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_request_clone, struct acomp_req *, (struct acomp_req *req, size_t total, gfp_t gfp), (req, total, gfp));
 
 #endif
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 9a3f28baa804..20a9c4e96e0c 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -9,6 +9,7 @@
 #ifndef _CRYPTO_ACOMP_INT_H
 #define _CRYPTO_ACOMP_INT_H
 
+#include <crypto/api.h>
 #include <crypto/acompress.h>
 #include <crypto/algapi.h>
 #include <crypto/scatterwalk.h>
@@ -130,7 +131,7 @@ static inline void acomp_request_complete(struct acomp_req *req,
  *
  * Return:	zero on success; error code in case of error
  */
-int crypto_register_acomp(struct acomp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_register_acomp, int, (struct acomp_alg *alg), (alg));
 
 /**
  * crypto_unregister_acomp() -- Unregister asynchronous compression algorithm
@@ -140,10 +141,10 @@ int crypto_register_acomp(struct acomp_alg *alg);
  *
  * @alg:	algorithm definition
  */
-void crypto_unregister_acomp(struct acomp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_unregister_acomp, void, (struct acomp_alg *alg), (alg));
 
-int crypto_register_acomps(struct acomp_alg *algs, int count);
-void crypto_unregister_acomps(struct acomp_alg *algs, int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_register_acomps, int, (struct acomp_alg *algs, int count), (algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_unregister_acomps, void, (struct acomp_alg *algs, int count), (algs, count));
 
 static inline bool acomp_request_issg(struct acomp_req *req)
 {
@@ -188,12 +189,11 @@ static inline bool crypto_acomp_req_virt(struct crypto_acomp *tfm)
 	return crypto_tfm_req_virt(&tfm->base);
 }
 
-void crypto_acomp_free_streams(struct crypto_acomp_streams *s);
-int crypto_acomp_alloc_streams(struct crypto_acomp_streams *s);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_acomp_free_streams, void, (struct crypto_acomp_streams *s), (s));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_acomp_alloc_streams, int, (struct crypto_acomp_streams *s), (s));
 
 #define crypto_acomp_lock_stream_bh(...) __acquire_ret(_crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
-struct crypto_acomp_stream *_crypto_acomp_lock_stream_bh(
-		struct crypto_acomp_streams *s) __acquires_ret;
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, _crypto_acomp_lock_stream_bh, struct crypto_acomp_stream *, (struct crypto_acomp_streams *s), (s)) __acquires_ret;
 
 static inline void crypto_acomp_unlock_stream_bh(
 	struct crypto_acomp_stream *stream) __releases(&stream->lock)
@@ -201,12 +201,11 @@ static inline void crypto_acomp_unlock_stream_bh(
 	spin_unlock_bh(&stream->lock);
 }
 
-void acomp_walk_done_src(struct acomp_walk *walk, int used);
-void acomp_walk_done_dst(struct acomp_walk *walk, int used);
-int acomp_walk_next_src(struct acomp_walk *walk);
-int acomp_walk_next_dst(struct acomp_walk *walk);
-int acomp_walk_virt(struct acomp_walk *__restrict walk,
-		    struct acomp_req *__restrict req, bool atomic);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_done_src, void, (struct acomp_walk *walk, int used), (walk, used));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_done_dst, void, (struct acomp_walk *walk, int used), (walk, used));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_next_src, int, (struct acomp_walk *walk), (walk));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_next_dst, int, (struct acomp_walk *walk), (walk));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_virt, int, (struct acomp_walk *walk, struct acomp_req *req, bool atomic), (walk, req, atomic));
 
 static inline bool acomp_walk_more_src(const struct acomp_walk *walk, int cur)
 {
diff --git a/include/crypto/internal/scompress.h b/include/crypto/internal/scompress.h
index 6a2c5f2e90f9..02226b300ea8 100644
--- a/include/crypto/internal/scompress.h
+++ b/include/crypto/internal/scompress.h
@@ -9,6 +9,7 @@
 #ifndef _CRYPTO_SCOMP_INT_H
 #define _CRYPTO_SCOMP_INT_H
 
+#include <crypto/api.h>
 #include <crypto/internal/acompress.h>
 
 struct crypto_scomp {
@@ -90,7 +91,7 @@ static inline int crypto_scomp_decompress(struct crypto_scomp *tfm,
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_register_scomp(struct scomp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_register_scomp, int, (struct scomp_alg *alg), (alg));
 
 /**
  * crypto_unregister_scomp() -- Unregister synchronous compression algorithm
@@ -100,9 +101,9 @@ int crypto_register_scomp(struct scomp_alg *alg);
  *
  * @alg:	algorithm definition
  */
-void crypto_unregister_scomp(struct scomp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_unregister_scomp, void, (struct scomp_alg *alg), (alg));
 
-int crypto_register_scomps(struct scomp_alg *algs, int count);
-void crypto_unregister_scomps(struct scomp_alg *algs, int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_register_scomps, int, (struct scomp_alg *algs, int count), (algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_unregister_scomps, void, (struct scomp_alg *algs, int count), (algs, count));
 
 #endif
-- 
2.47.3


