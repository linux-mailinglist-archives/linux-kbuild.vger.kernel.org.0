Return-Path: <linux-kbuild+bounces-9730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC55C74FA9
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 16:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C1394F084F
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 15:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C7C36E55E;
	Thu, 20 Nov 2025 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tfd5+sNz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1492368296
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651687; cv=none; b=s5/nbjJf2akt06AsCT06G+iMYjwXboUQ3PhNpI1z+Z2JPk4Iivn8bbMMilGKIrvsTL/ozf8TSCwGR30CqnkWij86GLmug9z0XA4HTzmllnNrkxFXdLC1Ud7PFCafjElugI0oN2yPSK156I/vgZG5iDYDM2eQE2hyqvWyoYcKjWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651687; c=relaxed/simple;
	bh=G9IQ138jpwR+uE1NOvzTwqHJtpOPEovCGYGymNY85fg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k1DEbPY5N6bjeo3bHYaqbaPAuXTlIr2RJnHvYTkGqPUaae6uCuTFuM3OE1plZVHheLKp3xd+3TKiqrJyHLRyd+qUNQVKe4ymBjmikvgqQB60LEJL2loTWB3MV6G7Gr9PWxT1YAx1h0sydPyUv9qSXdYUtUp0rJudBypsreaWuLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tfd5+sNz; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6407bd092b6so1617586a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 07:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651632; x=1764256432; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6fdZE8GnxjevnV+ZPYXMwhSIUCp4xQbOOIBc42V/94A=;
        b=Tfd5+sNzidchE6sT77FoycNmQhH8CDs/sq8jYiABkNkr9Mip+6ZJd07+8UI6efMhIU
         z1yjZL+7glaN7soppNN7k8/79cdCOcE8/9/JuqcMbJ/Jw+iGdk4hOAjY29LSUU4kKC2S
         d5ZGZtQXljrGuGj5ZBpAV/n1DCpF3N3HjYjAIKH0Nakd/U9SSejjRvMpdmfsFo2Axg8K
         nSNvRKdtRbXrqaJaCDseHPv2ZtQz0gD8EnfMUbY9Qm+LmQGZPVRpBU022Jrrq0pFNn32
         /SM2myGI5i2utc773ypGqQB6b6PoJ3ayAjvZBE+igkKxKBJxip7NdiVDz48scHPaBmu1
         nMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651632; x=1764256432;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fdZE8GnxjevnV+ZPYXMwhSIUCp4xQbOOIBc42V/94A=;
        b=KxVbwBvVguvizmm0PkvjAraBwxPdzi6RgRzSv68rftpwIQcg9ZrLahdYyi1R3Cbh4E
         fBM9Iev+H8g0SZDX101bcvzBCYcMiaGj2Ekpv3WXmhEIyiXFbpMC19KFgwX0NhVUYu2r
         8anQPw/l5mxrJljcDxom8N8DRG/JQISHiyputJsb23TgEs87kBoQaxj+iXxokxkM6cSy
         HoqnpJGEyjcbwUCHmUI2r/pS2GosXMm2y2/o4LokCsyqnaCujnULkK4t3p1iyarS8FqF
         8JbL6gyLsHSyq3o4aWxWRugnUNHLfye2NTVVXKh0dSSRkjwaKrTqKCH8C+P3OqIErF48
         FliQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9NZI1WzC3ixvA3DGGX8FECZHXD2ppnUpoNtD3u8UP0sIOc7LfqLULEMuFLGHdrmcnDBnzVgE6X9fgG+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs4Bl+A6DCYMfA8isnmwWEz3QWGcG9YngEgPfgTuO3HBK0VQaz
	oAx7SdoS0/13ZSY+y9fGNXOjRDw0bUY5n+a7UQKNtLfjBJJbnkWRraPgjc0AG33fxaDC+LNNbFK
	eUg==
X-Google-Smtp-Source: AGHT+IG30dCuNBar8/1ZUCLz7Q8CeRd41MarYyChAvsUEwFL2biNgm+WJS8WZ3PYD5ZG2UR0ZpJ7H5ssIw==
X-Received: from edp1.prod.google.com ([2002:a05:6402:4381:b0:641:661a:2bff])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3586:b0:640:a7a9:289f
 with SMTP id 4fb4d7f45d1cf-645363c6b54mr3185434a12.2.1763651631398; Thu, 20
 Nov 2025 07:13:51 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:56 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-32-elver@google.com>
Subject: [PATCH v4 31/35] rhashtable: Enable context analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Enable context analysis for rhashtable, which was used as an initial
test as it contains a combination of RCU, mutex, and bit_spinlock usage.

Users of rhashtable now also benefit from annotations on the API, which
will now warn if the RCU read lock is not held where required.

Signed-off-by: Marco Elver <elver@google.com>
Cc: Thomas Graf <tgraf@suug.ch>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org
---
v4:
* Rename capability -> context analysis.

v2:
* Remove disable/enable_context_analysis() around headers.
---
 include/linux/rhashtable.h | 14 +++++++++++---
 lib/Makefile               |  2 ++
 lib/rhashtable.c           |  5 +++--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/rhashtable.h b/include/linux/rhashtable.h
index 05a221ce79a6..5ba7356d79f0 100644
--- a/include/linux/rhashtable.h
+++ b/include/linux/rhashtable.h
@@ -245,16 +245,17 @@ void *rhashtable_insert_slow(struct rhashtable *ht, const void *key,
 void rhashtable_walk_enter(struct rhashtable *ht,
 			   struct rhashtable_iter *iter);
 void rhashtable_walk_exit(struct rhashtable_iter *iter);
-int rhashtable_walk_start_check(struct rhashtable_iter *iter) __acquires(RCU);
+int rhashtable_walk_start_check(struct rhashtable_iter *iter) __acquires_shared(RCU);
 
 static inline void rhashtable_walk_start(struct rhashtable_iter *iter)
+	__acquires_shared(RCU)
 {
 	(void)rhashtable_walk_start_check(iter);
 }
 
 void *rhashtable_walk_next(struct rhashtable_iter *iter);
 void *rhashtable_walk_peek(struct rhashtable_iter *iter);
-void rhashtable_walk_stop(struct rhashtable_iter *iter) __releases(RCU);
+void rhashtable_walk_stop(struct rhashtable_iter *iter) __releases_shared(RCU);
 
 void rhashtable_free_and_destroy(struct rhashtable *ht,
 				 void (*free_fn)(void *ptr, void *arg),
@@ -325,6 +326,7 @@ static inline struct rhash_lock_head __rcu **rht_bucket_insert(
 
 static inline unsigned long rht_lock(struct bucket_table *tbl,
 				     struct rhash_lock_head __rcu **bkt)
+	__acquires(__bitlock(0, bkt))
 {
 	unsigned long flags;
 
@@ -337,6 +339,7 @@ static inline unsigned long rht_lock(struct bucket_table *tbl,
 static inline unsigned long rht_lock_nested(struct bucket_table *tbl,
 					struct rhash_lock_head __rcu **bucket,
 					unsigned int subclass)
+	__acquires(__bitlock(0, bucket))
 {
 	unsigned long flags;
 
@@ -349,6 +352,7 @@ static inline unsigned long rht_lock_nested(struct bucket_table *tbl,
 static inline void rht_unlock(struct bucket_table *tbl,
 			      struct rhash_lock_head __rcu **bkt,
 			      unsigned long flags)
+	__releases(__bitlock(0, bkt))
 {
 	lock_map_release(&tbl->dep_map);
 	bit_spin_unlock(0, (unsigned long *)bkt);
@@ -402,13 +406,14 @@ static inline void rht_assign_unlock(struct bucket_table *tbl,
 				     struct rhash_lock_head __rcu **bkt,
 				     struct rhash_head *obj,
 				     unsigned long flags)
+	__releases(__bitlock(0, bkt))
 {
 	if (rht_is_a_nulls(obj))
 		obj = NULL;
 	lock_map_release(&tbl->dep_map);
 	rcu_assign_pointer(*bkt, (void *)obj);
 	preempt_enable();
-	__release(bitlock);
+	__release(__bitlock(0, bkt));
 	local_irq_restore(flags);
 }
 
@@ -589,6 +594,7 @@ static inline int rhashtable_compare(struct rhashtable_compare_arg *arg,
 static __always_inline struct rhash_head *__rhashtable_lookup(
 	struct rhashtable *ht, const void *key,
 	const struct rhashtable_params params)
+	__must_hold_shared(RCU)
 {
 	struct rhashtable_compare_arg arg = {
 		.ht = ht,
@@ -642,6 +648,7 @@ static __always_inline struct rhash_head *__rhashtable_lookup(
 static __always_inline void *rhashtable_lookup(
 	struct rhashtable *ht, const void *key,
 	const struct rhashtable_params params)
+	__must_hold_shared(RCU)
 {
 	struct rhash_head *he = __rhashtable_lookup(ht, key, params);
 
@@ -692,6 +699,7 @@ static __always_inline void *rhashtable_lookup_fast(
 static __always_inline struct rhlist_head *rhltable_lookup(
 	struct rhltable *hlt, const void *key,
 	const struct rhashtable_params params)
+	__must_hold_shared(RCU)
 {
 	struct rhash_head *he = __rhashtable_lookup(&hlt->ht, key, params);
 
diff --git a/lib/Makefile b/lib/Makefile
index 2e983f37d173..4ca9e8ce66bb 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -50,6 +50,8 @@ lib-$(CONFIG_MIN_HEAP) += min_heap.o
 lib-y	+= kobject.o klist.o
 obj-y	+= lockref.o
 
+CONTEXT_ANALYSIS_rhashtable.o := y
+
 obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bust_spinlocks.o kasprintf.o bitmap.o scatterlist.o \
 	 list_sort.o uuid.o iov_iter.o clz_ctz.o \
diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index fde0f0e556f8..6074ed5f66f3 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -358,6 +358,7 @@ static int rhashtable_rehash_table(struct rhashtable *ht)
 static int rhashtable_rehash_alloc(struct rhashtable *ht,
 				   struct bucket_table *old_tbl,
 				   unsigned int size)
+	__must_hold(&ht->mutex)
 {
 	struct bucket_table *new_tbl;
 	int err;
@@ -392,6 +393,7 @@ static int rhashtable_rehash_alloc(struct rhashtable *ht,
  * bucket locks or concurrent RCU protected lookups and traversals.
  */
 static int rhashtable_shrink(struct rhashtable *ht)
+	__must_hold(&ht->mutex)
 {
 	struct bucket_table *old_tbl = rht_dereference(ht->tbl, ht);
 	unsigned int nelems = atomic_read(&ht->nelems);
@@ -724,7 +726,7 @@ EXPORT_SYMBOL_GPL(rhashtable_walk_exit);
  * resize events and always continue.
  */
 int rhashtable_walk_start_check(struct rhashtable_iter *iter)
-	__acquires(RCU)
+	__acquires_shared(RCU)
 {
 	struct rhashtable *ht = iter->ht;
 	bool rhlist = ht->rhlist;
@@ -940,7 +942,6 @@ EXPORT_SYMBOL_GPL(rhashtable_walk_peek);
  * hash table.
  */
 void rhashtable_walk_stop(struct rhashtable_iter *iter)
-	__releases(RCU)
 {
 	struct rhashtable *ht;
 	struct bucket_table *tbl = iter->walker.tbl;
-- 
2.52.0.rc1.455.g30608eb744-goog


