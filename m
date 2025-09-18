Return-Path: <linux-kbuild+bounces-8892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3DBB8529E
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 646403AA2A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D0230DEC0;
	Thu, 18 Sep 2025 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zFuN8pJh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A4131E884
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204428; cv=none; b=X8bqPNd+pWtNymrcW/tsu79Uoemdhunb+XRIsa0Dhu7ud8piuYousvBqxcqQHqSIkE8MHvn3dZtpepYl6ScGa3UnVN1gvz/JqXTmIZHZe2yKa2QH7EVSIFG345/TxnBLSgzEl1NQHdvlhDZrwoHK9wRSR9AgLFhXoMSOZRh2Z8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204428; c=relaxed/simple;
	bh=P+m2hq1VBaPMAVAqLUSkQm3sbDtfMbamdi5AFwmxhhw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nEtOy6ZyXsLuPJ5ruUxIfoRnN3A2XErlJqOGRhx+pqjOtLz1rPN2e2uigt3JyvGU+SaykJ2U0yUzlPZLl+tdNDsnqeDhSf0m1o3Lb+RDlPGIxtm/ywKSiBLj3hdmIL8cqOL0tkak/oFStwn7F+NKLEkksVR3TNFGkvEQrO1u0UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zFuN8pJh; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45deddf34b9so13312215e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204422; x=1758809222; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WomSGtWawsTd2Mgk2tqHBd30UOYOl6qXE+iCSOwdG5I=;
        b=zFuN8pJhOebaCezIdPQGcFpDR2W5GZgalkv6UeOYRHf11kUz5ZqlRyHS4h8NJvEa5B
         aAx8DhOXV4K2NtGwcCRRa5WCOnWu4cmb1HWPLzgQODo3anlBy01dF3JRcof4VQwQTj5t
         fxHaGq+gDSMmfsGSUNwsB39MYBRfTXvU9rClVEiK5Xzn3jY/I8BGYf9s4+neu9umsZyv
         hMuDotS83+FRrnQ9wKPFaIPX/pAMKUUNyiAQTXYL+ZmUAzTwv8ZYRKckayxlXo7Lsu73
         6SU8+v/RbLPaRS6FHPvUFO1r1JRBh7envLNY2lneRIezRjOCuABgZDSKHPRqVv/RoOWq
         fmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204422; x=1758809222;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WomSGtWawsTd2Mgk2tqHBd30UOYOl6qXE+iCSOwdG5I=;
        b=wYK2Gk9sUIJoz96Onyz4CrIz29qdQKrgpTgnL6P5F1bROjIO9rXfIUTvCI2FZMF+P6
         VQDoZchu9z89mVOkH9JDxMVZhxFSx6dRRLc9O1n8cytTExjXKvmLBkzVPej1r4Gcm89I
         9L6sgswgUJ4m+8DggBa3R0/nH1FdUWda1/BQRHmfcCDVf/FyWQWzzUh36K/6Ig6et2yx
         nobPqTxkO+YOynUQjKn9YqQlFVhFP3kad/j/QDmwump2eIppjFmQncW/I48yMMyNY1/I
         zi7HH6xRliygzSHstlG0gMpKWPuCOjZ5CcT0xl/dboZOsjh0PZhXe/hrMUeU6+yABMo1
         wusg==
X-Forwarded-Encrypted: i=1; AJvYcCXQX/TYj21QgipOgJFl1HNph9vmgDbfJmRxuV/sjs+fA7hOquvgpxZg+EoNkPOawUNBISNKAVYFAfq5CFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKHjgfnHkTHRY38iTaPKZKxc6eemDLE5jhDrUV5tGD4NcUstMv
	VOHuQjYZsAJ+lqnTurWG4gqJFGeceNaFH1UOUAYFsd6TlVSBTjRo9kJjCvQExbTV+pm9zQKT5vJ
	F0w==
X-Google-Smtp-Source: AGHT+IG3Wu45SfcLeW7xiCPHcGZ7NbsG/a+FjGT/lBV6ri7Cb5nflAOr6DVXW0houbGMVbZxXoIBORuNzg==
X-Received: from wmmu8.prod.google.com ([2002:a05:600c:c8:b0:45b:890a:14d1])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a208:b0:45d:e4d6:a7db
 with SMTP id 5b1f17b1804b1-464f79beba7mr21088805e9.5.1758204421679; Thu, 18
 Sep 2025 07:07:01 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:46 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-36-elver@google.com>
Subject: [PATCH v3 35/35] sched: Enable capability analysis for core.c and fair.c
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
	llvm@lists.linux.dev, rcu@vger.kernel.org, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

This demonstrates a larger conversion to use Clang's capability
analysis. The benefit is additional static checking of locking rules,
along with better documentation.

Notably, kernel/sched contains sufficiently complex synchronization
patterns, and application to core.c & fair.c demonstrates that the
latest Clang version has become powerful enough to start applying this
to more complex subsystems (with some modest annotations and changes).

Signed-off-by: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
---
v3:
* New patch.
---
 include/linux/sched.h                       |   6 +-
 include/linux/sched/signal.h                |   4 +-
 include/linux/sched/task.h                  |   5 +-
 include/linux/sched/wake_q.h                |   3 +
 kernel/sched/Makefile                       |   3 +
 kernel/sched/core.c                         |  89 +++++++++++-----
 kernel/sched/fair.c                         |   9 +-
 kernel/sched/sched.h                        | 110 +++++++++++++-------
 scripts/capability-analysis-suppression.txt |   1 +
 9 files changed, 162 insertions(+), 68 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f8188b833350..bc2be55a9f47 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2102,9 +2102,9 @@ static inline int _cond_resched(void)
 	_cond_resched();			\
 })
 
-extern int __cond_resched_lock(spinlock_t *lock);
-extern int __cond_resched_rwlock_read(rwlock_t *lock);
-extern int __cond_resched_rwlock_write(rwlock_t *lock);
+extern int __cond_resched_lock(spinlock_t *lock) __must_hold(lock);
+extern int __cond_resched_rwlock_read(rwlock_t *lock) __must_hold_shared(lock);
+extern int __cond_resched_rwlock_write(rwlock_t *lock) __must_hold(lock);
 
 #define MIGHT_RESCHED_RCU_SHIFT		8
 #define MIGHT_RESCHED_PREEMPT_MASK	((1U << MIGHT_RESCHED_RCU_SHIFT) - 1)
diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index bc7f83b012fb..6f581a750e84 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -734,10 +734,12 @@ static inline int thread_group_empty(struct task_struct *p)
 		(thread_group_leader(p) && !thread_group_empty(p))
 
 extern struct sighand_struct *lock_task_sighand(struct task_struct *task,
-						unsigned long *flags);
+						unsigned long *flags)
+	__acquires(&task->sighand->siglock);
 
 static inline void unlock_task_sighand(struct task_struct *task,
 						unsigned long *flags)
+	__releases(&task->sighand->siglock)
 {
 	spin_unlock_irqrestore(&task->sighand->siglock, *flags);
 }
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index ea41795a352b..4db5c9323989 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -215,15 +215,18 @@ static inline struct vm_struct *task_stack_vm_area(const struct task_struct *t)
  * neither inside nor outside.
  */
 static inline void task_lock(struct task_struct *p)
+	__acquires(&p->alloc_lock)
 {
 	spin_lock(&p->alloc_lock);
 }
 
 static inline void task_unlock(struct task_struct *p)
+	__releases(&p->alloc_lock)
 {
 	spin_unlock(&p->alloc_lock);
 }
 
-DEFINE_GUARD(task_lock, struct task_struct *, task_lock(_T), task_unlock(_T))
+DEFINE_LOCK_GUARD_1(task_lock, struct task_struct, task_lock(_T->lock), task_unlock(_T->lock))
+DECLARE_LOCK_GUARD_1_ATTRS(task_lock, __assumes_cap(_T->alloc_lock), /* */)
 
 #endif /* _LINUX_SCHED_TASK_H */
diff --git a/include/linux/sched/wake_q.h b/include/linux/sched/wake_q.h
index 0f28b4623ad4..765bbc3d54be 100644
--- a/include/linux/sched/wake_q.h
+++ b/include/linux/sched/wake_q.h
@@ -66,6 +66,7 @@ extern void wake_up_q(struct wake_q_head *head);
 /* Spin unlock helpers to unlock and call wake_up_q with preempt disabled */
 static inline
 void raw_spin_unlock_wake(raw_spinlock_t *lock, struct wake_q_head *wake_q)
+	__releases(lock)
 {
 	guard(preempt)();
 	raw_spin_unlock(lock);
@@ -77,6 +78,7 @@ void raw_spin_unlock_wake(raw_spinlock_t *lock, struct wake_q_head *wake_q)
 
 static inline
 void raw_spin_unlock_irq_wake(raw_spinlock_t *lock, struct wake_q_head *wake_q)
+	__releases(lock)
 {
 	guard(preempt)();
 	raw_spin_unlock_irq(lock);
@@ -89,6 +91,7 @@ void raw_spin_unlock_irq_wake(raw_spinlock_t *lock, struct wake_q_head *wake_q)
 static inline
 void raw_spin_unlock_irqrestore_wake(raw_spinlock_t *lock, unsigned long flags,
 				     struct wake_q_head *wake_q)
+	__releases(lock)
 {
 	guard(preempt)();
 	raw_spin_unlock_irqrestore(lock, flags);
diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index 8ae86371ddcd..8603987ce4c1 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CAPABILITY_ANALYSIS_core.o := y
+CAPABILITY_ANALYSIS_fair.o := y
+
 # The compilers are complaining about unused variables inside an if(0) scope
 # block. This is daft, shut them up.
 ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index be00629f0ba4..233f774754b6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -393,6 +393,8 @@ static atomic_t sched_core_count;
 static struct cpumask sched_core_mask;
 
 static void sched_core_lock(int cpu, unsigned long *flags)
+	__capability_unsafe(/* acquires multiple */)
+	__acquires(&runqueues.__lock) /* overapproximation */
 {
 	const struct cpumask *smt_mask = cpu_smt_mask(cpu);
 	int t, i = 0;
@@ -403,6 +405,8 @@ static void sched_core_lock(int cpu, unsigned long *flags)
 }
 
 static void sched_core_unlock(int cpu, unsigned long *flags)
+	__capability_unsafe(/* releases multiple */)
+	__releases(&runqueues.__lock) /* overapproximation */
 {
 	const struct cpumask *smt_mask = cpu_smt_mask(cpu);
 	int t;
@@ -627,6 +631,7 @@ EXPORT_SYMBOL(__trace_set_current_state);
  */
 
 void raw_spin_rq_lock_nested(struct rq *rq, int subclass)
+	__capability_unsafe()
 {
 	raw_spinlock_t *lock;
 
@@ -652,6 +657,7 @@ void raw_spin_rq_lock_nested(struct rq *rq, int subclass)
 }
 
 bool raw_spin_rq_trylock(struct rq *rq)
+	__capability_unsafe()
 {
 	raw_spinlock_t *lock;
 	bool ret;
@@ -693,15 +699,16 @@ void double_rq_lock(struct rq *rq1, struct rq *rq2)
 	raw_spin_rq_lock(rq1);
 	if (__rq_lockp(rq1) != __rq_lockp(rq2))
 		raw_spin_rq_lock_nested(rq2, SINGLE_DEPTH_NESTING);
+	else
+		__acquire_cap(__rq_lockp(rq2)); /* fake acquire */
 
 	double_rq_clock_clear_update(rq1, rq2);
 }
 
 /*
- * __task_rq_lock - lock the rq @p resides on.
+ * ___task_rq_lock - lock the rq @p resides on.
  */
-struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
-	__acquires(rq->lock)
+struct rq *___task_rq_lock(struct task_struct *p, struct rq_flags *rf)
 {
 	struct rq *rq;
 
@@ -724,9 +731,7 @@ struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
 /*
  * task_rq_lock - lock p->pi_lock and lock the rq @p resides on.
  */
-struct rq *task_rq_lock(struct task_struct *p, struct rq_flags *rf)
-	__acquires(p->pi_lock)
-	__acquires(rq->lock)
+struct rq *_task_rq_lock(struct task_struct *p, struct rq_flags *rf)
 {
 	struct rq *rq;
 
@@ -2498,6 +2503,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
  */
 static struct rq *move_queued_task(struct rq *rq, struct rq_flags *rf,
 				   struct task_struct *p, int new_cpu)
+	__must_hold(__rq_lockp(rq))
 {
 	lockdep_assert_rq_held(rq);
 
@@ -2544,6 +2550,7 @@ struct set_affinity_pending {
  */
 static struct rq *__migrate_task(struct rq *rq, struct rq_flags *rf,
 				 struct task_struct *p, int dest_cpu)
+	__must_hold(__rq_lockp(rq))
 {
 	/* Affinity changed (again). */
 	if (!is_cpu_allowed(p, dest_cpu))
@@ -2580,6 +2587,12 @@ static int migration_cpu_stop(void *data)
 	 */
 	flush_smp_call_function_queue();
 
+	/*
+	 * We may change the underlying rq, but the locks held will
+	 * appropriately be "transferred" when switching.
+	 */
+	capability_unsafe_alias(rq);
+
 	raw_spin_lock(&p->pi_lock);
 	rq_lock(rq, &rf);
 
@@ -2689,6 +2702,8 @@ int push_cpu_stop(void *arg)
 	if (!lowest_rq)
 		goto out_unlock;
 
+	lockdep_assert_rq_held(lowest_rq);
+
 	// XXX validate p is still the highest prio task
 	if (task_rq(p) == rq) {
 		move_queued_task_locked(rq, lowest_rq, p);
@@ -2934,8 +2949,7 @@ void release_user_cpus_ptr(struct task_struct *p)
  */
 static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flags *rf,
 			    int dest_cpu, unsigned int flags)
-	__releases(rq->lock)
-	__releases(p->pi_lock)
+	__releases(__rq_lockp(rq), &p->pi_lock)
 {
 	struct set_affinity_pending my_pending = { }, *pending = NULL;
 	bool stop_pending, complete = false;
@@ -3090,8 +3104,7 @@ static int __set_cpus_allowed_ptr_locked(struct task_struct *p,
 					 struct affinity_context *ctx,
 					 struct rq *rq,
 					 struct rq_flags *rf)
-	__releases(rq->lock)
-	__releases(p->pi_lock)
+	__releases(__rq_lockp(rq), &p->pi_lock)
 {
 	const struct cpumask *cpu_allowed_mask = task_cpu_possible_mask(p);
 	const struct cpumask *cpu_valid_mask = cpu_active_mask;
@@ -4383,29 +4396,30 @@ static bool __task_needs_rq_lock(struct task_struct *p)
  */
 int task_call_func(struct task_struct *p, task_call_f func, void *arg)
 {
-	struct rq *rq = NULL;
 	struct rq_flags rf;
 	int ret;
 
 	raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
 
-	if (__task_needs_rq_lock(p))
-		rq = __task_rq_lock(p, &rf);
+	if (__task_needs_rq_lock(p)) {
+		struct rq *rq = __task_rq_lock(p, &rf);
 
-	/*
-	 * At this point the task is pinned; either:
-	 *  - blocked and we're holding off wakeups	 (pi->lock)
-	 *  - woken, and we're holding off enqueue	 (rq->lock)
-	 *  - queued, and we're holding off schedule	 (rq->lock)
-	 *  - running, and we're holding off de-schedule (rq->lock)
-	 *
-	 * The called function (@func) can use: task_curr(), p->on_rq and
-	 * p->__state to differentiate between these states.
-	 */
-	ret = func(p, arg);
+		/*
+		 * At this point the task is pinned; either:
+		 *  - blocked and we're holding off wakeups	 (pi->lock)
+		 *  - woken, and we're holding off enqueue	 (rq->lock)
+		 *  - queued, and we're holding off schedule	 (rq->lock)
+		 *  - running, and we're holding off de-schedule (rq->lock)
+		 *
+		 * The called function (@func) can use: task_curr(), p->on_rq and
+		 * p->__state to differentiate between these states.
+		 */
+		ret = func(p, arg);
 
-	if (rq)
 		rq_unlock(rq, &rf);
+	} else {
+		ret = func(p, arg);
+	}
 
 	raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
 	return ret;
@@ -5078,6 +5092,8 @@ void balance_callbacks(struct rq *rq, struct balance_callback *head)
 
 static inline void
 prepare_lock_switch(struct rq *rq, struct task_struct *next, struct rq_flags *rf)
+	__releases(__rq_lockp(rq))
+	__acquires(__rq_lockp(this_rq()))
 {
 	/*
 	 * Since the runqueue lock will be released by the next
@@ -5091,9 +5107,15 @@ prepare_lock_switch(struct rq *rq, struct task_struct *next, struct rq_flags *rf
 	/* this is a valid case when another task releases the spinlock */
 	rq_lockp(rq)->owner = next;
 #endif
+	/*
+	 * Model the rq reference switcheroo.
+	 */
+	__release(__rq_lockp(rq));
+	__acquire(__rq_lockp(this_rq()));
 }
 
 static inline void finish_lock_switch(struct rq *rq)
+	__releases(__rq_lockp(rq))
 {
 	/*
 	 * If we are tracking spinlock dependencies then we have to
@@ -5149,6 +5171,7 @@ static inline void kmap_local_sched_in(void)
 static inline void
 prepare_task_switch(struct rq *rq, struct task_struct *prev,
 		    struct task_struct *next)
+	__must_hold(__rq_lockp(rq))
 {
 	kcov_prepare_switch(prev);
 	sched_info_switch(rq, prev, next);
@@ -5180,7 +5203,7 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
  * because prev may have moved to another CPU.
  */
 static struct rq *finish_task_switch(struct task_struct *prev)
-	__releases(rq->lock)
+	__releases(__rq_lockp(this_rq()))
 {
 	struct rq *rq = this_rq();
 	struct mm_struct *mm = rq->prev_mm;
@@ -5268,7 +5291,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
  * @prev: the thread we just switched away from.
  */
 asmlinkage __visible void schedule_tail(struct task_struct *prev)
-	__releases(rq->lock)
+	__releases(__rq_lockp(this_rq()))
 {
 	/*
 	 * New tasks start with FORK_PREEMPT_COUNT, see there and
@@ -5300,6 +5323,7 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
 static __always_inline struct rq *
 context_switch(struct rq *rq, struct task_struct *prev,
 	       struct task_struct *next, struct rq_flags *rf)
+	__releases(__rq_lockp(rq))
 {
 	prepare_task_switch(rq, prev, next);
 
@@ -5980,6 +6004,7 @@ static void prev_balance(struct rq *rq, struct task_struct *prev,
  */
 static inline struct task_struct *
 __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
+	__must_hold(__rq_lockp(rq))
 {
 	const struct sched_class *class;
 	struct task_struct *p;
@@ -6072,6 +6097,7 @@ static void queue_core_balance(struct rq *rq);
 
 static struct task_struct *
 pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
+	__must_hold(__rq_lockp(rq))
 {
 	struct task_struct *next, *p, *max = NULL;
 	const struct cpumask *smt_mask;
@@ -6371,6 +6397,7 @@ static bool steal_cookie_task(int cpu, struct sched_domain *sd)
 }
 
 static void sched_core_balance(struct rq *rq)
+	__must_hold(__rq_lockp(rq))
 {
 	struct sched_domain *sd;
 	int cpu = cpu_of(rq);
@@ -6516,6 +6543,7 @@ static inline void sched_core_cpu_dying(unsigned int cpu) {}
 
 static struct task_struct *
 pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
+	__must_hold(__rq_lockp(rq))
 {
 	return __pick_next_task(rq, prev, rf);
 }
@@ -8173,6 +8201,12 @@ static int __balance_push_cpu_stop(void *arg)
 	struct rq_flags rf;
 	int cpu;
 
+	/*
+	 * We may change the underlying rq, but the locks held will
+	 * appropriately be "transferred" when switching.
+	 */
+	capability_unsafe_alias(rq);
+
 	raw_spin_lock_irq(&p->pi_lock);
 	rq_lock(rq, &rf);
 
@@ -8200,6 +8234,7 @@ static DEFINE_PER_CPU(struct cpu_stop_work, push_work);
  * effective when the hotplug motion is down.
  */
 static void balance_push(struct rq *rq)
+	__must_hold(__rq_lockp(rq))
 {
 	struct task_struct *push_task = rq->curr;
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b173a059315c..4c4663d99996 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2876,6 +2876,7 @@ static int preferred_group_nid(struct task_struct *p, int nid)
 }
 
 static void task_numa_placement(struct task_struct *p)
+	__capability_unsafe(/* conditional locking */)
 {
 	int seq, nid, max_nid = NUMA_NO_NODE;
 	unsigned long max_faults = 0;
@@ -4806,7 +4807,8 @@ static inline unsigned long cfs_rq_load_avg(struct cfs_rq *cfs_rq)
 	return cfs_rq->avg.load_avg;
 }
 
-static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf);
+static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
+	__must_hold(__rq_lockp(this_rq));
 
 static inline unsigned long task_util(struct task_struct *p)
 {
@@ -6155,6 +6157,7 @@ static bool distribute_cfs_runtime(struct cfs_bandwidth *cfs_b)
  * used to track this state.
  */
 static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun, unsigned long flags)
+	__must_hold(&cfs_b->lock)
 {
 	int throttled;
 
@@ -8622,6 +8625,7 @@ static void set_cpus_allowed_fair(struct task_struct *p, struct affinity_context
 
 static int
 balance_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
+	__must_hold(__rq_lockp(rq))
 {
 	if (sched_fair_runnable(rq))
 		return 1;
@@ -8769,6 +8773,7 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
 
 struct task_struct *
 pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
+	__must_hold(__rq_lockp(rq))
 {
 	struct sched_entity *se;
 	struct task_struct *p;
@@ -8855,6 +8860,7 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 }
 
 static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_struct *prev)
+	__must_hold(__rq_lockp(rq))
 {
 	return pick_next_task_fair(rq, prev, NULL);
 }
@@ -12691,6 +12697,7 @@ static inline void nohz_newidle_balance(struct rq *this_rq) { }
  *   > 0 - success, new (fair) tasks present
  */
 static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
+	__must_hold(__rq_lockp(this_rq))
 {
 	unsigned long next_balance = jiffies + HZ;
 	int this_cpu = this_rq->cpu;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index be9745d104f7..8fdbf2e3fb1e 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1322,8 +1322,13 @@ static inline bool is_migration_disabled(struct task_struct *p)
 
 DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 
+static __always_inline struct rq *__this_rq(void)
+{
+	return this_cpu_ptr(&runqueues);
+}
+
 #define cpu_rq(cpu)		(&per_cpu(runqueues, (cpu)))
-#define this_rq()		this_cpu_ptr(&runqueues)
+#define this_rq()		__this_rq()
 #define task_rq(p)		cpu_rq(task_cpu(p))
 #define cpu_curr(cpu)		(cpu_rq(cpu)->curr)
 #define raw_rq()		raw_cpu_ptr(&runqueues)
@@ -1368,6 +1373,7 @@ static inline raw_spinlock_t *rq_lockp(struct rq *rq)
 }
 
 static inline raw_spinlock_t *__rq_lockp(struct rq *rq)
+	__returns_cap(rq_lockp(rq)) /* alias them */
 {
 	if (rq->core_enabled)
 		return &rq->core->__lock;
@@ -1464,6 +1470,7 @@ static inline raw_spinlock_t *rq_lockp(struct rq *rq)
 }
 
 static inline raw_spinlock_t *__rq_lockp(struct rq *rq)
+	__returns_cap(rq_lockp(rq)) /* alias them */
 {
 	return &rq->__lock;
 }
@@ -1506,32 +1513,42 @@ static inline bool rt_group_sched_enabled(void)
 #endif /* !CONFIG_RT_GROUP_SCHED */
 
 static inline void lockdep_assert_rq_held(struct rq *rq)
+	__assumes_cap(__rq_lockp(rq))
 {
 	lockdep_assert_held(__rq_lockp(rq));
 }
 
-extern void raw_spin_rq_lock_nested(struct rq *rq, int subclass);
-extern bool raw_spin_rq_trylock(struct rq *rq);
-extern void raw_spin_rq_unlock(struct rq *rq);
+extern void raw_spin_rq_lock_nested(struct rq *rq, int subclass)
+	__acquires(__rq_lockp(rq));
+
+extern bool raw_spin_rq_trylock(struct rq *rq)
+	__cond_acquires(true, __rq_lockp(rq));
+
+extern void raw_spin_rq_unlock(struct rq *rq)
+	__releases(__rq_lockp(rq));
 
 static inline void raw_spin_rq_lock(struct rq *rq)
+	__acquires(__rq_lockp(rq))
 {
 	raw_spin_rq_lock_nested(rq, 0);
 }
 
 static inline void raw_spin_rq_lock_irq(struct rq *rq)
+	__acquires(__rq_lockp(rq))
 {
 	local_irq_disable();
 	raw_spin_rq_lock(rq);
 }
 
 static inline void raw_spin_rq_unlock_irq(struct rq *rq)
+	__releases(__rq_lockp(rq))
 {
 	raw_spin_rq_unlock(rq);
 	local_irq_enable();
 }
 
 static inline unsigned long _raw_spin_rq_lock_irqsave(struct rq *rq)
+	__acquires(__rq_lockp(rq))
 {
 	unsigned long flags;
 
@@ -1542,6 +1559,7 @@ static inline unsigned long _raw_spin_rq_lock_irqsave(struct rq *rq)
 }
 
 static inline void raw_spin_rq_unlock_irqrestore(struct rq *rq, unsigned long flags)
+	__releases(__rq_lockp(rq))
 {
 	raw_spin_rq_unlock(rq);
 	local_irq_restore(flags);
@@ -1790,17 +1808,15 @@ static inline void rq_repin_lock(struct rq *rq, struct rq_flags *rf)
 	rq->clock_update_flags |= rf->clock_update_flags;
 }
 
-extern
-struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
-	__acquires(rq->lock);
+#define __task_rq_lock(...) __acquire_ret(___task_rq_lock(__VA_ARGS__), __rq_lockp(__ret))
+extern struct rq *___task_rq_lock(struct task_struct *p, struct rq_flags *rf) __acquires_ret;
 
-extern
-struct rq *task_rq_lock(struct task_struct *p, struct rq_flags *rf)
-	__acquires(p->pi_lock)
-	__acquires(rq->lock);
+#define task_rq_lock(...) __acquire_ret(_task_rq_lock(__VA_ARGS__), __rq_lockp(__ret))
+extern struct rq *_task_rq_lock(struct task_struct *p, struct rq_flags *rf)
+	__acquires(&p->pi_lock) __acquires_ret;
 
 static inline void __task_rq_unlock(struct rq *rq, struct rq_flags *rf)
-	__releases(rq->lock)
+	__releases(__rq_lockp(rq))
 {
 	rq_unpin_lock(rq, rf);
 	raw_spin_rq_unlock(rq);
@@ -1808,8 +1824,7 @@ static inline void __task_rq_unlock(struct rq *rq, struct rq_flags *rf)
 
 static inline void
 task_rq_unlock(struct rq *rq, struct task_struct *p, struct rq_flags *rf)
-	__releases(rq->lock)
-	__releases(p->pi_lock)
+	__releases(__rq_lockp(rq), &p->pi_lock)
 {
 	rq_unpin_lock(rq, rf);
 	raw_spin_rq_unlock(rq);
@@ -1820,44 +1835,45 @@ DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
 		    _T->rq = task_rq_lock(_T->lock, &_T->rf),
 		    task_rq_unlock(_T->rq, _T->lock, &_T->rf),
 		    struct rq *rq; struct rq_flags rf)
+DECLARE_LOCK_GUARD_1_ATTRS(task_rq_lock, __assumes_cap(_T->pi_lock), /* */)
 
 static inline void rq_lock_irqsave(struct rq *rq, struct rq_flags *rf)
-	__acquires(rq->lock)
+	__acquires(__rq_lockp(rq))
 {
 	raw_spin_rq_lock_irqsave(rq, rf->flags);
 	rq_pin_lock(rq, rf);
 }
 
 static inline void rq_lock_irq(struct rq *rq, struct rq_flags *rf)
-	__acquires(rq->lock)
+	__acquires(__rq_lockp(rq))
 {
 	raw_spin_rq_lock_irq(rq);
 	rq_pin_lock(rq, rf);
 }
 
 static inline void rq_lock(struct rq *rq, struct rq_flags *rf)
-	__acquires(rq->lock)
+	__acquires(__rq_lockp(rq))
 {
 	raw_spin_rq_lock(rq);
 	rq_pin_lock(rq, rf);
 }
 
 static inline void rq_unlock_irqrestore(struct rq *rq, struct rq_flags *rf)
-	__releases(rq->lock)
+	__releases(__rq_lockp(rq))
 {
 	rq_unpin_lock(rq, rf);
 	raw_spin_rq_unlock_irqrestore(rq, rf->flags);
 }
 
 static inline void rq_unlock_irq(struct rq *rq, struct rq_flags *rf)
-	__releases(rq->lock)
+	__releases(__rq_lockp(rq))
 {
 	rq_unpin_lock(rq, rf);
 	raw_spin_rq_unlock_irq(rq);
 }
 
 static inline void rq_unlock(struct rq *rq, struct rq_flags *rf)
-	__releases(rq->lock)
+	__releases(__rq_lockp(rq))
 {
 	rq_unpin_lock(rq, rf);
 	raw_spin_rq_unlock(rq);
@@ -1868,18 +1884,24 @@ DEFINE_LOCK_GUARD_1(rq_lock, struct rq,
 		    rq_unlock(_T->lock, &_T->rf),
 		    struct rq_flags rf)
 
+DECLARE_LOCK_GUARD_1_ATTRS(rq_lock, __assumes_cap(__rq_lockp(_T)), /* */);
+
 DEFINE_LOCK_GUARD_1(rq_lock_irq, struct rq,
 		    rq_lock_irq(_T->lock, &_T->rf),
 		    rq_unlock_irq(_T->lock, &_T->rf),
 		    struct rq_flags rf)
 
+DECLARE_LOCK_GUARD_1_ATTRS(rq_lock_irq, __assumes_cap(__rq_lockp(_T)), /* */);
+
 DEFINE_LOCK_GUARD_1(rq_lock_irqsave, struct rq,
 		    rq_lock_irqsave(_T->lock, &_T->rf),
 		    rq_unlock_irqrestore(_T->lock, &_T->rf),
 		    struct rq_flags rf)
 
-static inline struct rq *this_rq_lock_irq(struct rq_flags *rf)
-	__acquires(rq->lock)
+DECLARE_LOCK_GUARD_1_ATTRS(rq_lock_irqsave, __assumes_cap(__rq_lockp(_T)), /* */);
+
+#define this_rq_lock_irq(...) __acquire_ret(_this_rq_lock_irq(__VA_ARGS__), __rq_lockp(__ret))
+static inline struct rq *_this_rq_lock_irq(struct rq_flags *rf) __acquires_ret
 {
 	struct rq *rq;
 
@@ -2877,8 +2899,13 @@ static inline void double_rq_clock_clear_update(struct rq *rq1, struct rq *rq2)
 #define DEFINE_LOCK_GUARD_2(name, type, _lock, _unlock, ...)				\
 __DEFINE_UNLOCK_GUARD(name, type, _unlock, type *lock2; __VA_ARGS__)			\
 static inline class_##name##_t class_##name##_constructor(type *lock, type *lock2)	\
+	__no_capability_analysis							\
 { class_##name##_t _t = { .lock = lock, .lock2 = lock2 }, *_T = &_t;			\
   _lock; return _t; }
+#define DECLARE_LOCK_GUARD_2_ATTRS(_name, _lock, _unlock)				\
+static inline class_##_name##_t class_##_name##_constructor(lock_##_name##_t *_T1,	\
+							    lock_##_name##_t *_T2) _lock; \
+static inline void class_##_name##_destructor(class_##_name##_t *_T) _unlock
 
 static inline bool rq_order_less(struct rq *rq1, struct rq *rq2)
 {
@@ -2906,7 +2933,8 @@ static inline bool rq_order_less(struct rq *rq1, struct rq *rq2)
 	return rq1->cpu < rq2->cpu;
 }
 
-extern void double_rq_lock(struct rq *rq1, struct rq *rq2);
+extern void double_rq_lock(struct rq *rq1, struct rq *rq2)
+	__acquires(__rq_lockp(rq1), __rq_lockp(rq2));
 
 #ifdef CONFIG_PREEMPTION
 
@@ -2919,9 +2947,8 @@ extern void double_rq_lock(struct rq *rq1, struct rq *rq2);
  * also adds more overhead and therefore may reduce throughput.
  */
 static inline int _double_lock_balance(struct rq *this_rq, struct rq *busiest)
-	__releases(this_rq->lock)
-	__acquires(busiest->lock)
-	__acquires(this_rq->lock)
+	__must_hold(__rq_lockp(this_rq))
+	__acquires(__rq_lockp(busiest))
 {
 	raw_spin_rq_unlock(this_rq);
 	double_rq_lock(this_rq, busiest);
@@ -2938,12 +2965,16 @@ static inline int _double_lock_balance(struct rq *this_rq, struct rq *busiest)
  * regardless of entry order into the function.
  */
 static inline int _double_lock_balance(struct rq *this_rq, struct rq *busiest)
-	__releases(this_rq->lock)
-	__acquires(busiest->lock)
-	__acquires(this_rq->lock)
+	__must_hold(__rq_lockp(this_rq))
+	__acquires(__rq_lockp(busiest))
 {
-	if (__rq_lockp(this_rq) == __rq_lockp(busiest) ||
-	    likely(raw_spin_rq_trylock(busiest))) {
+	if (__rq_lockp(this_rq) == __rq_lockp(busiest)) {
+		__acquire(__rq_lockp(busiest)); /* already held */
+		double_rq_clock_clear_update(this_rq, busiest);
+		return 0;
+	}
+
+	if (likely(raw_spin_rq_trylock(busiest))) {
 		double_rq_clock_clear_update(this_rq, busiest);
 		return 0;
 	}
@@ -2966,6 +2997,8 @@ static inline int _double_lock_balance(struct rq *this_rq, struct rq *busiest)
  * double_lock_balance - lock the busiest runqueue, this_rq is locked already.
  */
 static inline int double_lock_balance(struct rq *this_rq, struct rq *busiest)
+	__must_hold(__rq_lockp(this_rq))
+	__acquires(__rq_lockp(busiest))
 {
 	lockdep_assert_irqs_disabled();
 
@@ -2973,14 +3006,17 @@ static inline int double_lock_balance(struct rq *this_rq, struct rq *busiest)
 }
 
 static inline void double_unlock_balance(struct rq *this_rq, struct rq *busiest)
-	__releases(busiest->lock)
+	__releases(__rq_lockp(busiest))
 {
 	if (__rq_lockp(this_rq) != __rq_lockp(busiest))
 		raw_spin_rq_unlock(busiest);
+	else
+		__release(__rq_lockp(busiest)); /* fake release */
 	lock_set_subclass(&__rq_lockp(this_rq)->dep_map, 0, _RET_IP_);
 }
 
 static inline void double_lock(spinlock_t *l1, spinlock_t *l2)
+	__acquires(l1, l2)
 {
 	if (l1 > l2)
 		swap(l1, l2);
@@ -2990,6 +3026,7 @@ static inline void double_lock(spinlock_t *l1, spinlock_t *l2)
 }
 
 static inline void double_lock_irq(spinlock_t *l1, spinlock_t *l2)
+	__acquires(l1, l2)
 {
 	if (l1 > l2)
 		swap(l1, l2);
@@ -2999,6 +3036,7 @@ static inline void double_lock_irq(spinlock_t *l1, spinlock_t *l2)
 }
 
 static inline void double_raw_lock(raw_spinlock_t *l1, raw_spinlock_t *l2)
+	__acquires(l1, l2)
 {
 	if (l1 > l2)
 		swap(l1, l2);
@@ -3008,6 +3046,7 @@ static inline void double_raw_lock(raw_spinlock_t *l1, raw_spinlock_t *l2)
 }
 
 static inline void double_raw_unlock(raw_spinlock_t *l1, raw_spinlock_t *l2)
+	__releases(l1, l2)
 {
 	raw_spin_unlock(l1);
 	raw_spin_unlock(l2);
@@ -3017,6 +3056,8 @@ DEFINE_LOCK_GUARD_2(double_raw_spinlock, raw_spinlock_t,
 		    double_raw_lock(_T->lock, _T->lock2),
 		    double_raw_unlock(_T->lock, _T->lock2))
 
+DECLARE_LOCK_GUARD_2_ATTRS(double_raw_spinlock, __assumes_cap(_T1) __assumes_cap(_T2), /* */);
+
 /*
  * double_rq_unlock - safely unlock two runqueues
  *
@@ -3024,13 +3065,12 @@ DEFINE_LOCK_GUARD_2(double_raw_spinlock, raw_spinlock_t,
  * you need to do so manually after calling.
  */
 static inline void double_rq_unlock(struct rq *rq1, struct rq *rq2)
-	__releases(rq1->lock)
-	__releases(rq2->lock)
+	__releases(__rq_lockp(rq1), __rq_lockp(rq2))
 {
 	if (__rq_lockp(rq1) != __rq_lockp(rq2))
 		raw_spin_rq_unlock(rq2);
 	else
-		__release(rq2->lock);
+		__release(__rq_lockp(rq2)); /* fake release */
 	raw_spin_rq_unlock(rq1);
 }
 
diff --git a/scripts/capability-analysis-suppression.txt b/scripts/capability-analysis-suppression.txt
index 95fb0b65a8e6..7ecd888ac522 100644
--- a/scripts/capability-analysis-suppression.txt
+++ b/scripts/capability-analysis-suppression.txt
@@ -26,6 +26,7 @@ src:*include/linux/refcount.h=emit
 src:*include/linux/rhashtable.h=emit
 src:*include/linux/rwlock*.h=emit
 src:*include/linux/rwsem.h=emit
+src:*include/linux/sched*=emit
 src:*include/linux/seqlock*.h=emit
 src:*include/linux/spinlock*.h=emit
 src:*include/linux/srcu*.h=emit
-- 
2.51.0.384.g4c02a37b29-goog


