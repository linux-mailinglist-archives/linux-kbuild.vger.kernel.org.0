Return-Path: <linux-kbuild+bounces-8891-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39DB852A1
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19377188FFD9
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135A730CD8F;
	Thu, 18 Sep 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sND9cOIO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BDD31D728
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204423; cv=none; b=CWmZzg036plQYWGDb9/vr7tlWXNZaZKEEfWZ2QHbkBvVWZsQGnD3ONr6ai9/20rx5mkGy51xKs1jx9Z03hxBZvaGk7KgsogMZhVz7iX7pyTG8Ub/AHbtdHDJLpXpBhMwghyM9EeOkbgoyAVXjk3yjAvEzyVJVndxcnIf8up7pc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204423; c=relaxed/simple;
	bh=41zYcnwdahTtmTnsLSfjaNV/RBUfdx4KxCxFo+VAJKU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YsH6Ac8P5VdeKh3q73ZDVxLTLEJNlOPhUZWwWElBjfz7xo2T8q8kV+D3pY17u3+uhVNejD92qlV0WNcMXvuEPzyRYX8AcVRCgAkAIHT4Mbr6+kukX1fPrxe7KoxX9kBDGxKw5SOEv2bsm3FaI1/ARyp8M13EjdAKeq/ofSXxb0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sND9cOIO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45dd9a66c3fso3739925e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204419; x=1758809219; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5tu8oxzXQKTnOUiHAzfcXoFAwF2lpCAIFKrvKZ236c=;
        b=sND9cOIOHcWTcKp1+JrGNROEgUMTnj5gqUVlMB6zldArRhm7zZfVEXADwmP9DXxm9g
         d99Rywq0b1erqhbEc7QDdWAeqDRroxtdHJMYu04BNUAjll2xyhe+9vjch5cR9GEvpHI3
         RBw8RAAvXE3ASUAEWYBqkiRrGV0VVhSvNY9kW+pIKYf8IyPOoCAKR9Ptp65dhe2hHFM9
         eO/AS6aZpAmGojjIBQZHDLZMft/bBlCf+c22b+ZfjZUD6mPwFqD8PFpXl9ctkzBlZA81
         jCfHC3Kjh4R9Mtgc28oKaokvC2L85QiSA9FjOICIM9+sBC8AfSHDufZJutLreKXyoDqX
         BqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204419; x=1758809219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5tu8oxzXQKTnOUiHAzfcXoFAwF2lpCAIFKrvKZ236c=;
        b=n3n5LpNj6KYD2k3cESbBXWkm0UrGa5gWsR7F+48K469Z638Xccn2wJa8nK+Iqdftak
         QEvj6+PNhoQZ0vR8nP0g9EX/++hESq5Scv72/rCjf6wE5OytyDm5wYo+l13RlHgIfyIR
         /wB38F5OA1bHgNOu5bRaT8U63OxJNVIlCpJJLNfUhS2fwIxKKh6Luouiyw0sekyN+8Lj
         sk/TN6AhWB07fRlZaE7g8XgHktl8bv/AFr9XzPMLmxfql7ZiWPWDVfjm3J3SUK126V50
         ZZuQ+QDtnJku5JtL161O1sHjtivg1IErCEDXjZJfaXLYy13PxbE3XRxSg8MHiRfNXRBV
         v18w==
X-Forwarded-Encrypted: i=1; AJvYcCUH97mAEjiKGoNtNquQMwntmQU1gwlsEbPu5uxus+TO06WZS3kRS+Mz+qiEk17V2D1TEaAlfQeW5J834eM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Ld8OYFcynWDKurcrjm9xX5ylls1uG1z1ky4YZuNQsMS3Fq46
	kCSU5rrELMBYzSaorrhDH5NE7vjwD2qdT/Vm/f/+Oe4cTrfrtMpmlwHCzpsbuyLvmIun7BsCEqm
	fwg==
X-Google-Smtp-Source: AGHT+IH+umzdQR8EWriNaP0azXypNz5QaBQ31wAEGywI54fdXNfmDlDf3O1KLKu8hdrdKwLm79wsq3wW1g==
X-Received: from wmby18.prod.google.com ([2002:a05:600c:c052:b0:45b:883d:4704])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c4b8:b0:45b:8477:de1a
 with SMTP id 5b1f17b1804b1-46201f8a98fmr48626095e9.7.1758204418672; Thu, 18
 Sep 2025 07:06:58 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:45 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-35-elver@google.com>
Subject: [PATCH v3 34/35] crypto: Enable capability analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Enable capability analysis for crypto subsystem.

This demonstrates a larger conversion to use Clang's capability
analysis. The benefit is additional static checking of locking rules,
along with better documentation.

Note the use of the __acquire_ret macro how to define an API where a
function returns a pointer to an object (struct scomp_scratch) with a
lock held. Additionally, the analysis only resolves aliases where the
analysis unambiguously sees that a variable was not reassigned after
initialization, requiring minor code changes.

Signed-off-by: Marco Elver <elver@google.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
---
v3:
* Rebase - make use of __acquire_ret macro for new functions.
* Initialize variables once where we want the analysis to recognize aliases.

v2:
* New patch.
---
 crypto/Makefile                     |  2 ++
 crypto/acompress.c                  |  6 +++---
 crypto/algapi.c                     |  2 ++
 crypto/api.c                        |  1 +
 crypto/crypto_engine.c              |  2 +-
 crypto/drbg.c                       |  5 +++++
 crypto/internal.h                   |  2 +-
 crypto/proc.c                       |  3 +++
 crypto/scompress.c                  | 24 ++++++++++++------------
 include/crypto/internal/acompress.h |  7 ++++---
 include/crypto/internal/engine.h    |  2 +-
 11 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 6c5d59369dac..e73c50a54119 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -3,6 +3,8 @@
 # Cryptographic API
 #
 
+CAPABILITY_ANALYSIS := y
+
 obj-$(CONFIG_CRYPTO) += crypto.o
 crypto-y := api.o cipher.o
 
diff --git a/crypto/acompress.c b/crypto/acompress.c
index be28cbfd22e3..25df368df098 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -449,8 +449,8 @@ int crypto_acomp_alloc_streams(struct crypto_acomp_streams *s)
 }
 EXPORT_SYMBOL_GPL(crypto_acomp_alloc_streams);
 
-struct crypto_acomp_stream *crypto_acomp_lock_stream_bh(
-	struct crypto_acomp_streams *s) __acquires(stream)
+struct crypto_acomp_stream *_crypto_acomp_lock_stream_bh(
+	struct crypto_acomp_streams *s)
 {
 	struct crypto_acomp_stream __percpu *streams = s->streams;
 	int cpu = raw_smp_processor_id();
@@ -469,7 +469,7 @@ struct crypto_acomp_stream *crypto_acomp_lock_stream_bh(
 	spin_lock(&ps->lock);
 	return ps;
 }
-EXPORT_SYMBOL_GPL(crypto_acomp_lock_stream_bh);
+EXPORT_SYMBOL_GPL(_crypto_acomp_lock_stream_bh);
 
 void acomp_walk_done_src(struct acomp_walk *walk, int used)
 {
diff --git a/crypto/algapi.c b/crypto/algapi.c
index e604d0d8b7b4..abc9333327d4 100644
--- a/crypto/algapi.c
+++ b/crypto/algapi.c
@@ -244,6 +244,7 @@ EXPORT_SYMBOL_GPL(crypto_remove_spawns);
 
 static void crypto_alg_finish_registration(struct crypto_alg *alg,
 					   struct list_head *algs_to_put)
+	__must_hold(&crypto_alg_sem)
 {
 	struct crypto_alg *q;
 
@@ -299,6 +300,7 @@ static struct crypto_larval *crypto_alloc_test_larval(struct crypto_alg *alg)
 
 static struct crypto_larval *
 __crypto_register_alg(struct crypto_alg *alg, struct list_head *algs_to_put)
+	__must_hold(&crypto_alg_sem)
 {
 	struct crypto_alg *q;
 	struct crypto_larval *larval;
diff --git a/crypto/api.c b/crypto/api.c
index 5724d62e9d07..05629644a688 100644
--- a/crypto/api.c
+++ b/crypto/api.c
@@ -57,6 +57,7 @@ EXPORT_SYMBOL_GPL(crypto_mod_put);
 
 static struct crypto_alg *__crypto_alg_lookup(const char *name, u32 type,
 					      u32 mask)
+	__must_hold_shared(&crypto_alg_sem)
 {
 	struct crypto_alg *q, *alg = NULL;
 	int best = -2;
diff --git a/crypto/crypto_engine.c b/crypto/crypto_engine.c
index 18e1689efe12..1653a4bf5b31 100644
--- a/crypto/crypto_engine.c
+++ b/crypto/crypto_engine.c
@@ -453,8 +453,8 @@ struct crypto_engine *crypto_engine_alloc_init_and_set(struct device *dev,
 	snprintf(engine->name, sizeof(engine->name),
 		 "%s-engine", dev_name(dev));
 
-	crypto_init_queue(&engine->queue, qlen);
 	spin_lock_init(&engine->queue_lock);
+	crypto_init_queue(&engine->queue, qlen);
 
 	engine->kworker = kthread_run_worker(0, "%s", engine->name);
 	if (IS_ERR(engine->kworker)) {
diff --git a/crypto/drbg.c b/crypto/drbg.c
index dbe4c8bb5ceb..9684d952fdfd 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -231,6 +231,7 @@ static inline unsigned short drbg_sec_strength(drbg_flag_t flags)
  */
 static int drbg_fips_continuous_test(struct drbg_state *drbg,
 				     const unsigned char *entropy)
+	__must_hold(&drbg->drbg_mutex)
 {
 	unsigned short entropylen = drbg_sec_strength(drbg->core->flags);
 	int ret = 0;
@@ -1061,6 +1062,7 @@ static inline int __drbg_seed(struct drbg_state *drbg, struct list_head *seed,
 static inline int drbg_get_random_bytes(struct drbg_state *drbg,
 					unsigned char *entropy,
 					unsigned int entropylen)
+	__must_hold(&drbg->drbg_mutex)
 {
 	int ret;
 
@@ -1075,6 +1077,7 @@ static inline int drbg_get_random_bytes(struct drbg_state *drbg,
 }
 
 static int drbg_seed_from_random(struct drbg_state *drbg)
+	__must_hold(&drbg->drbg_mutex)
 {
 	struct drbg_string data;
 	LIST_HEAD(seedlist);
@@ -1132,6 +1135,7 @@ static bool drbg_nopr_reseed_interval_elapsed(struct drbg_state *drbg)
  */
 static int drbg_seed(struct drbg_state *drbg, struct drbg_string *pers,
 		     bool reseed)
+	__must_hold(&drbg->drbg_mutex)
 {
 	int ret;
 	unsigned char entropy[((32 + 16) * 2)];
@@ -1368,6 +1372,7 @@ static inline int drbg_alloc_state(struct drbg_state *drbg)
 static int drbg_generate(struct drbg_state *drbg,
 			 unsigned char *buf, unsigned int buflen,
 			 struct drbg_string *addtl)
+	__must_hold(&drbg->drbg_mutex)
 {
 	int len = 0;
 	LIST_HEAD(addtllist);
diff --git a/crypto/internal.h b/crypto/internal.h
index b9afd68767c1..8fbe0226d48e 100644
--- a/crypto/internal.h
+++ b/crypto/internal.h
@@ -61,8 +61,8 @@ enum {
 /* Maximum number of (rtattr) parameters for each template. */
 #define CRYPTO_MAX_ATTRS 32
 
-extern struct list_head crypto_alg_list;
 extern struct rw_semaphore crypto_alg_sem;
+extern struct list_head crypto_alg_list __guarded_by(&crypto_alg_sem);
 extern struct blocking_notifier_head crypto_chain;
 
 int alg_test(const char *driver, const char *alg, u32 type, u32 mask);
diff --git a/crypto/proc.c b/crypto/proc.c
index 82f15b967e85..5fb9fe86d023 100644
--- a/crypto/proc.c
+++ b/crypto/proc.c
@@ -19,17 +19,20 @@
 #include "internal.h"
 
 static void *c_start(struct seq_file *m, loff_t *pos)
+	__acquires_shared(&crypto_alg_sem)
 {
 	down_read(&crypto_alg_sem);
 	return seq_list_start(&crypto_alg_list, *pos);
 }
 
 static void *c_next(struct seq_file *m, void *p, loff_t *pos)
+	__must_hold_shared(&crypto_alg_sem)
 {
 	return seq_list_next(p, &crypto_alg_list, pos);
 }
 
 static void c_stop(struct seq_file *m, void *p)
+	__releases_shared(&crypto_alg_sem)
 {
 	up_read(&crypto_alg_sem);
 }
diff --git a/crypto/scompress.c b/crypto/scompress.c
index c651e7f2197a..fb87f3716426 100644
--- a/crypto/scompress.c
+++ b/crypto/scompress.c
@@ -28,8 +28,8 @@
 struct scomp_scratch {
 	spinlock_t	lock;
 	union {
-		void	*src;
-		unsigned long saddr;
+		void	*src __guarded_by(&lock);
+		unsigned long saddr __guarded_by(&lock);
 	};
 };
 
@@ -38,8 +38,8 @@ static DEFINE_PER_CPU(struct scomp_scratch, scomp_scratch) = {
 };
 
 static const struct crypto_type crypto_scomp_type;
-static int scomp_scratch_users;
 static DEFINE_MUTEX(scomp_lock);
+static int scomp_scratch_users __guarded_by(&scomp_lock);
 
 static cpumask_t scomp_scratch_want;
 static void scomp_scratch_workfn(struct work_struct *work);
@@ -67,6 +67,7 @@ static void crypto_scomp_show(struct seq_file *m, struct crypto_alg *alg)
 }
 
 static void crypto_scomp_free_scratches(void)
+	__capability_unsafe(/* frees @scratch */)
 {
 	struct scomp_scratch *scratch;
 	int i;
@@ -101,7 +102,7 @@ static void scomp_scratch_workfn(struct work_struct *work)
 		struct scomp_scratch *scratch;
 
 		scratch = per_cpu_ptr(&scomp_scratch, cpu);
-		if (scratch->src)
+		if (capability_unsafe(scratch->src))
 			continue;
 		if (scomp_alloc_scratch(scratch, cpu))
 			break;
@@ -111,6 +112,7 @@ static void scomp_scratch_workfn(struct work_struct *work)
 }
 
 static int crypto_scomp_alloc_scratches(void)
+	__capability_unsafe(/* allocates @scratch */)
 {
 	unsigned int i = cpumask_first(cpu_possible_mask);
 	struct scomp_scratch *scratch;
@@ -139,7 +141,8 @@ static int crypto_scomp_init_tfm(struct crypto_tfm *tfm)
 	return ret;
 }
 
-static struct scomp_scratch *scomp_lock_scratch(void) __acquires(scratch)
+#define scomp_lock_scratch(...) __acquire_ret(_scomp_lock_scratch(__VA_ARGS__), &__ret->lock)
+static struct scomp_scratch *_scomp_lock_scratch(void) __acquires_ret
 {
 	int cpu = raw_smp_processor_id();
 	struct scomp_scratch *scratch;
@@ -159,7 +162,7 @@ static struct scomp_scratch *scomp_lock_scratch(void) __acquires(scratch)
 }
 
 static inline void scomp_unlock_scratch(struct scomp_scratch *scratch)
-	__releases(scratch)
+	__releases(&scratch->lock)
 {
 	spin_unlock(&scratch->lock);
 }
@@ -171,8 +174,6 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 	bool src_isvirt = acomp_request_src_isvirt(req);
 	bool dst_isvirt = acomp_request_dst_isvirt(req);
 	struct crypto_scomp *scomp = *tfm_ctx;
-	struct crypto_acomp_stream *stream;
-	struct scomp_scratch *scratch;
 	unsigned int slen = req->slen;
 	unsigned int dlen = req->dlen;
 	struct page *spage, *dpage;
@@ -232,13 +233,12 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 		} while (0);
 	}
 
-	stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
+	struct crypto_acomp_stream *stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
 
 	if (!src_isvirt && !src) {
-		const u8 *src;
+		struct scomp_scratch *scratch = scomp_lock_scratch();
+		const u8 *src = scratch->src;
 
-		scratch = scomp_lock_scratch();
-		src = scratch->src;
 		memcpy_from_sglist(scratch->src, req->src, 0, slen);
 
 		if (dir)
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 2d97440028ff..9a3f28baa804 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -191,11 +191,12 @@ static inline bool crypto_acomp_req_virt(struct crypto_acomp *tfm)
 void crypto_acomp_free_streams(struct crypto_acomp_streams *s);
 int crypto_acomp_alloc_streams(struct crypto_acomp_streams *s);
 
-struct crypto_acomp_stream *crypto_acomp_lock_stream_bh(
-	struct crypto_acomp_streams *s) __acquires(stream);
+#define crypto_acomp_lock_stream_bh(...) __acquire_ret(_crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
+struct crypto_acomp_stream *_crypto_acomp_lock_stream_bh(
+		struct crypto_acomp_streams *s) __acquires_ret;
 
 static inline void crypto_acomp_unlock_stream_bh(
-	struct crypto_acomp_stream *stream) __releases(stream)
+	struct crypto_acomp_stream *stream) __releases(&stream->lock)
 {
 	spin_unlock_bh(&stream->lock);
 }
diff --git a/include/crypto/internal/engine.h b/include/crypto/internal/engine.h
index f19ef376833f..6a1d27880615 100644
--- a/include/crypto/internal/engine.h
+++ b/include/crypto/internal/engine.h
@@ -45,7 +45,7 @@ struct crypto_engine {
 
 	struct list_head	list;
 	spinlock_t		queue_lock;
-	struct crypto_queue	queue;
+	struct crypto_queue	queue __guarded_by(&queue_lock);
 	struct device		*dev;
 
 	struct kthread_worker           *kworker;
-- 
2.51.0.384.g4c02a37b29-goog


