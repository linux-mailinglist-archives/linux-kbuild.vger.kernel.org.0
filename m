Return-Path: <linux-kbuild+bounces-11215-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA8bKINDjWkK0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11215-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:05:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 41750129B89
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A47763018C08
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF772264CC;
	Thu, 12 Feb 2026 03:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="VAGemvru"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468822256B;
	Thu, 12 Feb 2026 03:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865535; cv=none; b=q9iFGXw/urUPUuygSM/6Uja187kVDa1SciWge5bToAnPvvD2r8FJADlksNIIlr/EKMfMFSpaOVZfM45fULhCIXGiOGTzpeyEZs1JXdeId4ddwgasJyMaz4JayTbqUE2TZ32mqgeMwPPs6v8IZDS/9TATWExDUBUlXQlaeXi99A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865535; c=relaxed/simple;
	bh=jGghpOkbVH3r3E4w6KL9hbPnIXmiOIdwMcrkurF3mtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MGIByw30KqR+mImndk66pgqlYbkCXcpBMzM+Zwh3vzQhA2vOOuy7by5PcA3l69Gb8HtDYAnnIlMN9WtIyYpdFxLEonrOfAKWc0wnXynBNI5FCI7121YxRXiuXwmlBYFrQkI571whmeU5RQyY1Vbt6VynRoaKtYFDRPlJ07OiHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=VAGemvru; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865534; x=1802401534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pMVeWebz5RIijvIGF12ub+Hg24QncwAb6GdAQ6JQEAU=;
  b=VAGemvruwbviKZ/AskqTMsyP9XQhYcxY8Kygdq28wLLaV9x6sorrvWkF
   qFLrhJQ64Yucb5UXtEAQPQZ9WX63LGBcg48U0/6YKQ9f+ZjL2AvuYvpfj
   AR6al1inuoY1jCQ3oEWwQPCBWIwnFQHBhD06A+FL/dDuQ6wb4P4Nc7yl6
   RtdTLIhHB2b8cpod/6LWdAj0V3LmHFk7RyeYpQ6sBR91UJEB2r6l/wM6w
   qxN3pC47Em87kbQ98BLXo4JH1DyFxbzrmhmzrXzr74DEMtwyWsKIse+Dy
   ehrKwLv5ineqTWTYatXbnT+2JOa4uChz2Ju898c0N1j46RzN/SBNl6ZGB
   A==;
X-CSE-ConnectionGUID: bUu8q7vfQYui2FFgJP5btA==
X-CSE-MsgGUID: UFoCLDmBSGuWZOEqu/TMcA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913888"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:05:34 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:9900]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 477ed574-4c66-41d8-a566-1f98381a3253; Thu, 12 Feb 2026 03:05:34 +0000 (UTC)
X-Farcaster-Flow-ID: 477ed574-4c66-41d8-a566-1f98381a3253
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:33 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:33 +0000
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
Subject: [PATCH 070/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_USER_API crypto
Date: Thu, 12 Feb 2026 02:46:46 +0000
Message-ID: <20260212024725.11264-71-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D045UWC003.ant.amazon.com (10.13.139.198) To
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
	TAGGED_FROM(0.00)[bounces-11215-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41750129B89
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_USER_API-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/af_alg.c              |  4 +-
 crypto/fips140/fips140-api.c | 25 +++++++++++
 include/crypto/if_alg.h      | 84 ++++++++++++++++++++++++++----------
 4 files changed, 89 insertions(+), 26 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 623651445612..5c363d865b45 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -172,7 +172,7 @@ jitterentropy_rng-y := jitterentropy.o jitterentropy-kcapi.o
 obj-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testing.o
 obj-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
-obj-$(CONFIG_CRYPTO_USER_API) += af_alg.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API) += af_alg.o
 obj-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 obj-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
diff --git a/crypto/af_alg.c b/crypto/af_alg.c
index e468714f539d..48ce5a420fed 100644
--- a/crypto/af_alg.c
+++ b/crypto/af_alg.c
@@ -1322,8 +1322,8 @@ static void __exit af_alg_exit(void)
 	proto_unregister(&alg_proto);
 }
 
-module_init(af_alg_init);
-module_exit(af_alg_exit);
+crypto_module_init(af_alg_init);
+crypto_module_exit(af_alg_exit);
 MODULE_DESCRIPTION("Crypto userspace interface");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_NETPROTO(AF_ALG);
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index f6d6a6e79a9e..e20c9601637a 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -738,3 +738,28 @@ DEFINE_CRYPTO_API_STUB(__cast6_encrypt);
 DEFINE_CRYPTO_API_STUB(__cast6_decrypt);
 
 #endif
+/*
+ * crypto/af_alg.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_USER_API)
+
+#include <crypto/if_alg.h>
+
+DEFINE_CRYPTO_API_STUB(af_alg_register_type);
+DEFINE_CRYPTO_API_STUB(af_alg_unregister_type);
+DEFINE_CRYPTO_API_STUB(af_alg_release);
+DEFINE_CRYPTO_API_STUB(af_alg_release_parent);
+DEFINE_CRYPTO_API_STUB(af_alg_accept);
+DEFINE_CRYPTO_API_STUB(af_alg_free_sg);
+DEFINE_CRYPTO_API_STUB(af_alg_count_tsgl);
+DEFINE_CRYPTO_API_STUB(af_alg_pull_tsgl);
+DEFINE_CRYPTO_API_STUB(af_alg_wmem_wakeup);
+DEFINE_CRYPTO_API_STUB(af_alg_wait_for_data);
+DEFINE_CRYPTO_API_STUB(af_alg_sendmsg);
+DEFINE_CRYPTO_API_STUB(af_alg_free_resources);
+DEFINE_CRYPTO_API_STUB(af_alg_async_cb);
+DEFINE_CRYPTO_API_STUB(af_alg_poll);
+DEFINE_CRYPTO_API_STUB(af_alg_alloc_areq);
+DEFINE_CRYPTO_API_STUB(af_alg_get_rsgl);
+
+#endif
diff --git a/include/crypto/if_alg.h b/include/crypto/if_alg.h
index 107b797c33ec..1c5f2ed140ea 100644
--- a/include/crypto/if_alg.h
+++ b/include/crypto/if_alg.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_IF_ALG_H
 #define _CRYPTO_IF_ALG_H
 
+#include <crypto/api.h>
 #include <linux/compiler.h>
 #include <linux/completion.h>
 #include <linux/if_alg.h>
@@ -163,15 +164,29 @@ struct af_alg_ctx {
 	unsigned int inflight;
 };
 
-int af_alg_register_type(const struct af_alg_type *type);
-int af_alg_unregister_type(const struct af_alg_type *type);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_register_type, int,
+	(const struct af_alg_type *type),
+	(type));
 
-int af_alg_release(struct socket *sock);
-void af_alg_release_parent(struct sock *sk);
-int af_alg_accept(struct sock *sk, struct socket *newsock,
-		  struct proto_accept_arg *arg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_unregister_type, int,
+	(const struct af_alg_type *type),
+	(type));
 
-void af_alg_free_sg(struct af_alg_sgl *sgl);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_release, int,
+	(struct socket *sock),
+	(sock));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_release_parent, void,
+	(struct sock *sk),
+	(sk));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_accept, int,
+	(struct sock *sk, struct socket *newsock, struct proto_accept_arg *arg),
+	(sk, newsock, arg));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_free_sg, void,
+	(struct af_alg_sgl *sgl),
+	(sgl));
 
 static inline struct alg_sock *alg_sk(struct sock *sk)
 {
@@ -230,21 +245,44 @@ static inline bool af_alg_readable(struct sock *sk)
 	return PAGE_SIZE <= af_alg_rcvbuf(sk);
 }
 
-unsigned int af_alg_count_tsgl(struct sock *sk, size_t bytes, size_t offset);
-void af_alg_pull_tsgl(struct sock *sk, size_t used, struct scatterlist *dst,
-		      size_t dst_offset);
-void af_alg_wmem_wakeup(struct sock *sk);
-int af_alg_wait_for_data(struct sock *sk, unsigned flags, unsigned min);
-int af_alg_sendmsg(struct socket *sock, struct msghdr *msg, size_t size,
-		   unsigned int ivsize);
-void af_alg_free_resources(struct af_alg_async_req *areq);
-void af_alg_async_cb(void *data, int err);
-__poll_t af_alg_poll(struct file *file, struct socket *sock,
-			 poll_table *wait);
-struct af_alg_async_req *af_alg_alloc_areq(struct sock *sk,
-					   unsigned int areqlen);
-int af_alg_get_rsgl(struct sock *sk, struct msghdr *msg, int flags,
-		    struct af_alg_async_req *areq, size_t maxsize,
-		    size_t *outlen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_count_tsgl, unsigned int,
+	(struct sock *sk, size_t bytes, size_t offset),
+	(sk, bytes, offset));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_pull_tsgl, void,
+	(struct sock *sk, size_t used, struct scatterlist *dst, size_t dst_offset),
+	(sk, used, dst, dst_offset));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_wmem_wakeup, void,
+	(struct sock *sk),
+	(sk));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_wait_for_data, int,
+	(struct sock *sk, unsigned flags, unsigned min),
+	(sk, flags, min));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_sendmsg, int,
+	(struct socket *sock, struct msghdr *msg, size_t size, unsigned int ivsize),
+	(sock, msg, size, ivsize));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_free_resources, void,
+	(struct af_alg_async_req *areq),
+	(areq));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_async_cb, void,
+	(void *data, int err),
+	(data, err));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_poll, __poll_t,
+	(struct file *file, struct socket *sock, poll_table *wait),
+	(file, sock, wait));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_alloc_areq, struct af_alg_async_req *,
+	(struct sock *sk, unsigned int areqlen),
+	(sk, areqlen));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_USER_API, af_alg_get_rsgl, int,
+	(struct sock *sk, struct msghdr *msg, int flags, struct af_alg_async_req *areq, size_t maxsize, size_t *outlen),
+	(sk, msg, flags, areq, maxsize, outlen));
 
 #endif	/* _CRYPTO_IF_ALG_H */
-- 
2.47.3


