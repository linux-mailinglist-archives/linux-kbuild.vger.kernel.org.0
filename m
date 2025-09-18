Return-Path: <linux-kbuild+bounces-8874-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D68B8512B
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE671882AC1
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5C130C61F;
	Thu, 18 Sep 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o0T2bVsf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2F1313D5C
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204379; cv=none; b=qJE7rYUAXTKLSaar3HPMOKe5zkGiUbnbe3q45fUlpqxXnxMNszx7m8gBQhUW06SWnwwMbICYzEq5I/rC52biqVB73QT4wEtQNeSiuhouMpVlNt8nMGOSSFunTdMIHmhiCZURiwXNWfJmrM2hZyJ6Fbkoxq8LHegAjWfKVCmvW4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204379; c=relaxed/simple;
	bh=lh+juF6tQaJEmUGWNNDY3p4WONkiLLFrXthBzIn6Oao=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XKjrO6Ki7NvUmsqsKNprpzK2gfa0Lk0A4lPQV3QIP8EsK8TxCR9iJIxurWiVAo6jQvYmyxKGoZrl4mGoad3VJA/p2JatWydmc0gzLcBt6grIYcG5lpKOLmgvrsucn6LlcecO/i9F77W56lO47j1Wap0HopYh0i1HW7HM4s+L5YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o0T2bVsf; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45cb604427fso6365975e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204373; x=1758809173; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCChN5JBLfNZD2oPUgHX86ngAxvuyY3UmlRN7HFHi28=;
        b=o0T2bVsfnjvLjvO1tk5gDw4h4As+Ia6uBTRc6AnQit6Ejja/DzeU9WvnfQ52TbSGdP
         CAsFiN0Rq4J4Ino9nJvIJLqg9SY/efYxFryQKRw2VDRMEdEEDSQw3RFCxp5KcwdYZaoZ
         Xki8C5Zxo4WrFIE1SYLZVEn0rscyjNsaPoPjoNwK64el8PL4XfsDXcp9oLFpI6zSGW1r
         ixdZmQAcHDp0tMxmypaOjIIQQZN3IA2VrlYhoIj0fJBZErJLel0GiWc3HLm+OntROrAw
         p9KHK5pKn+6q3d8/QLywVfkaVf3UGW6cg/TB9qHo7oErtv3Z7TIWwQQrCYzkcazvqE4B
         PixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204373; x=1758809173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCChN5JBLfNZD2oPUgHX86ngAxvuyY3UmlRN7HFHi28=;
        b=eyD9LyPXqLfelx/GWSx3ZTxYyTAz2THJg8lXl6Bg91eGMop71+JWP7a+yttqw0/EIF
         wPw/NPd4Xi2untkAZkCpYCmtz0D7iUyF84ysR0RZkngvQoNJ/JyirqSMrC1rKQ4mSEQo
         1RuR4CkImcnxRlSG4r8lMu9Y1auWXjdT7NMBOzITcI2LgI23JeodUO91UTqyFwlg15HL
         AlW0sPZl8lNI0OQZjN/Sln1y30aM7yRrLfkrZDLrHWM5bMjJMSgjvhYkCxJy91reYD4L
         PDNJzo0arMfS9TQHthb8cQE6U1a7HfQMII5jPoWLWZP/dqrXvKWYXPGGs83PKipzyVQH
         oYuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEbeEXPm/uUQHb9hIYmoDKXFeIvpJ5Qbj08GlkyIE5YYQSdfxHhAS1RgDRSWdiBu3O4wXcwotsnpVyHKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76wVLIfvd9gats/Yq7ex9EyVL1Z2dSx6ZqnOYgy71DFu4z142
	X5dWAMO8744pI6ovSll1BY5MDKHEi/djak8HOTl8DR7gD+HWmcgnOSVw/3F52maS8BJUWV91eTJ
	aFw==
X-Google-Smtp-Source: AGHT+IFywd4jmUzTfq+hVJgQHHlmO5wjtm30W/ijPajLEYScbPyp1aDSfv2uSoivAjyNaLs8ORl1XcY9lg==
X-Received: from wmth19.prod.google.com ([2002:a05:600c:8b73:b0:45f:28ed:6e20])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:548f:b0:45f:2c7c:c1ed
 with SMTP id 5b1f17b1804b1-46201f8b0f7mr54930115e9.2.1758204373378; Thu, 18
 Sep 2025 07:06:13 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:28 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-18-elver@google.com>
Subject: [PATCH v3 17/35] locking/rwsem: Support Clang's capability analysis
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

Add support for Clang's capability analysis for rw_semaphore.

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Switch to DECLARE_LOCK_GUARD_1_ATTRS() (suggested by Peter)
* __assert -> __assume rename
---
 .../dev-tools/capability-analysis.rst         |  2 +-
 include/linux/rwsem.h                         | 66 ++++++++++++-------
 lib/test_capability-analysis.c                | 64 ++++++++++++++++++
 3 files changed, 106 insertions(+), 26 deletions(-)

diff --git a/Documentation/dev-tools/capability-analysis.rst b/Documentation/dev-tools/capability-analysis.rst
index 779ecb5ec17a..7a4c2238c910 100644
--- a/Documentation/dev-tools/capability-analysis.rst
+++ b/Documentation/dev-tools/capability-analysis.rst
@@ -82,7 +82,7 @@ Supported Kernel Primitives
 
 Currently the following synchronization primitives are supported:
 `raw_spinlock_t`, `spinlock_t`, `rwlock_t`, `mutex`, `seqlock_t`,
-`bit_spinlock`, RCU, SRCU (`srcu_struct`).
+`bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`.
 
 For capabilities with an initialization function (e.g., `spin_lock_init()`),
 calling this function on the capability instance before initializing any
diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index f1aaf676a874..d2bce28be68b 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -45,7 +45,7 @@
  * reduce the chance that they will share the same cacheline causing
  * cacheline bouncing problem.
  */
-struct rw_semaphore {
+struct_with_capability(rw_semaphore) {
 	atomic_long_t count;
 	/*
 	 * Write owner or one of the read owners as well flags regarding
@@ -76,11 +76,13 @@ static inline int rwsem_is_locked(struct rw_semaphore *sem)
 }
 
 static inline void rwsem_assert_held_nolockdep(const struct rw_semaphore *sem)
+	__assumes_cap(sem)
 {
 	WARN_ON(atomic_long_read(&sem->count) == RWSEM_UNLOCKED_VALUE);
 }
 
 static inline void rwsem_assert_held_write_nolockdep(const struct rw_semaphore *sem)
+	__assumes_cap(sem)
 {
 	WARN_ON(!(atomic_long_read(&sem->count) & RWSEM_WRITER_LOCKED));
 }
@@ -119,6 +121,7 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
+	__assume_cap(sem);					\
 } while (0)
 
 /*
@@ -148,7 +151,7 @@ extern bool is_rwsem_reader_owned(struct rw_semaphore *sem);
 
 #include <linux/rwbase_rt.h>
 
-struct rw_semaphore {
+struct_with_capability(rw_semaphore) {
 	struct rwbase_rt	rwbase;
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lockdep_map	dep_map;
@@ -172,6 +175,7 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
+	__assume_cap(sem);					\
 } while (0)
 
 static __always_inline int rwsem_is_locked(const struct rw_semaphore *sem)
@@ -180,11 +184,13 @@ static __always_inline int rwsem_is_locked(const struct rw_semaphore *sem)
 }
 
 static __always_inline void rwsem_assert_held_nolockdep(const struct rw_semaphore *sem)
+	__assumes_cap(sem)
 {
 	WARN_ON(!rwsem_is_locked(sem));
 }
 
 static __always_inline void rwsem_assert_held_write_nolockdep(const struct rw_semaphore *sem)
+	__assumes_cap(sem)
 {
 	WARN_ON(!rw_base_is_write_locked(&sem->rwbase));
 }
@@ -202,6 +208,7 @@ static __always_inline int rwsem_is_contended(struct rw_semaphore *sem)
  */
 
 static inline void rwsem_assert_held(const struct rw_semaphore *sem)
+	__assumes_cap(sem)
 {
 	if (IS_ENABLED(CONFIG_LOCKDEP))
 		lockdep_assert_held(sem);
@@ -210,6 +217,7 @@ static inline void rwsem_assert_held(const struct rw_semaphore *sem)
 }
 
 static inline void rwsem_assert_held_write(const struct rw_semaphore *sem)
+	__assumes_cap(sem)
 {
 	if (IS_ENABLED(CONFIG_LOCKDEP))
 		lockdep_assert_held_write(sem);
@@ -220,48 +228,56 @@ static inline void rwsem_assert_held_write(const struct rw_semaphore *sem)
 /*
  * lock for reading
  */
-extern void down_read(struct rw_semaphore *sem);
-extern int __must_check down_read_interruptible(struct rw_semaphore *sem);
-extern int __must_check down_read_killable(struct rw_semaphore *sem);
+extern void down_read(struct rw_semaphore *sem) __acquires_shared(sem);
+extern int __must_check down_read_interruptible(struct rw_semaphore *sem) __cond_acquires_shared(0, sem);
+extern int __must_check down_read_killable(struct rw_semaphore *sem) __cond_acquires_shared(0, sem);
 
 /*
  * trylock for reading -- returns 1 if successful, 0 if contention
  */
-extern int down_read_trylock(struct rw_semaphore *sem);
+extern int down_read_trylock(struct rw_semaphore *sem) __cond_acquires_shared(true, sem);
 
 /*
  * lock for writing
  */
-extern void down_write(struct rw_semaphore *sem);
-extern int __must_check down_write_killable(struct rw_semaphore *sem);
+extern void down_write(struct rw_semaphore *sem) __acquires(sem);
+extern int __must_check down_write_killable(struct rw_semaphore *sem) __cond_acquires(0, sem);
 
 /*
  * trylock for writing -- returns 1 if successful, 0 if contention
  */
-extern int down_write_trylock(struct rw_semaphore *sem);
+extern int down_write_trylock(struct rw_semaphore *sem) __cond_acquires(true, sem);
 
 /*
  * release a read lock
  */
-extern void up_read(struct rw_semaphore *sem);
+extern void up_read(struct rw_semaphore *sem) __releases_shared(sem);
 
 /*
  * release a write lock
  */
-extern void up_write(struct rw_semaphore *sem);
+extern void up_write(struct rw_semaphore *sem) __releases(sem);
 
-DEFINE_GUARD(rwsem_read, struct rw_semaphore *, down_read(_T), up_read(_T))
-DEFINE_GUARD_COND(rwsem_read, _try, down_read_trylock(_T))
-DEFINE_GUARD_COND(rwsem_read, _intr, down_read_interruptible(_T), _RET == 0)
+DEFINE_LOCK_GUARD_1(rwsem_read, struct rw_semaphore, down_read(_T->lock), up_read(_T->lock))
+DEFINE_LOCK_GUARD_1_COND(rwsem_read, _try, down_read_trylock(_T->lock))
+DEFINE_LOCK_GUARD_1_COND(rwsem_read, _intr, down_read_interruptible(_T->lock), _RET == 0)
 
-DEFINE_GUARD(rwsem_write, struct rw_semaphore *, down_write(_T), up_write(_T))
-DEFINE_GUARD_COND(rwsem_write, _try, down_write_trylock(_T))
-DEFINE_GUARD_COND(rwsem_write, _kill, down_write_killable(_T), _RET == 0)
+DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read, __assumes_cap(_T), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read_try, __assumes_cap(_T), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read_intr, __assumes_cap(_T), /* */)
+
+DEFINE_LOCK_GUARD_1(rwsem_write, struct rw_semaphore, down_write(_T->lock), up_write(_T->lock))
+DEFINE_LOCK_GUARD_1_COND(rwsem_write, _try, down_write_trylock(_T->lock))
+DEFINE_LOCK_GUARD_1_COND(rwsem_write, _kill, down_write_killable(_T->lock), _RET == 0)
+
+DECLARE_LOCK_GUARD_1_ATTRS(rwsem_write, __assumes_cap(_T), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(rwsem_write_try, __assumes_cap(_T), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(rwsem_write_kill, __assumes_cap(_T), /* */)
 
 /*
  * downgrade write lock to read lock
  */
-extern void downgrade_write(struct rw_semaphore *sem);
+extern void downgrade_write(struct rw_semaphore *sem) __releases(sem) __acquires_shared(sem);
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 /*
@@ -277,11 +293,11 @@ extern void downgrade_write(struct rw_semaphore *sem);
  * lockdep_set_class() at lock initialization time.
  * See Documentation/locking/lockdep-design.rst for more details.)
  */
-extern void down_read_nested(struct rw_semaphore *sem, int subclass);
-extern int __must_check down_read_killable_nested(struct rw_semaphore *sem, int subclass);
-extern void down_write_nested(struct rw_semaphore *sem, int subclass);
-extern int down_write_killable_nested(struct rw_semaphore *sem, int subclass);
-extern void _down_write_nest_lock(struct rw_semaphore *sem, struct lockdep_map *nest_lock);
+extern void down_read_nested(struct rw_semaphore *sem, int subclass) __acquires_shared(sem);
+extern int __must_check down_read_killable_nested(struct rw_semaphore *sem, int subclass) __cond_acquires_shared(0, sem);
+extern void down_write_nested(struct rw_semaphore *sem, int subclass) __acquires(sem);
+extern int down_write_killable_nested(struct rw_semaphore *sem, int subclass) __cond_acquires(0, sem);
+extern void _down_write_nest_lock(struct rw_semaphore *sem, struct lockdep_map *nest_lock) __acquires(sem);
 
 # define down_write_nest_lock(sem, nest_lock)			\
 do {								\
@@ -295,8 +311,8 @@ do {								\
  * [ This API should be avoided as much as possible - the
  *   proper abstraction for this case is completions. ]
  */
-extern void down_read_non_owner(struct rw_semaphore *sem);
-extern void up_read_non_owner(struct rw_semaphore *sem);
+extern void down_read_non_owner(struct rw_semaphore *sem) __acquires_shared(sem);
+extern void up_read_non_owner(struct rw_semaphore *sem) __releases_shared(sem);
 #else
 # define down_read_nested(sem, subclass)		down_read(sem)
 # define down_read_killable_nested(sem, subclass)	down_read_killable(sem)
diff --git a/lib/test_capability-analysis.c b/lib/test_capability-analysis.c
index 5b17fd94f31e..3c6dad0ba065 100644
--- a/lib/test_capability-analysis.c
+++ b/lib/test_capability-analysis.c
@@ -8,6 +8,7 @@
 #include <linux/build_bug.h>
 #include <linux/mutex.h>
 #include <linux/rcupdate.h>
+#include <linux/rwsem.h>
 #include <linux/seqlock.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
@@ -255,6 +256,69 @@ static void __used test_seqlock_writer(struct test_seqlock_data *d)
 	write_sequnlock_irqrestore(&d->sl, flags);
 }
 
+struct test_rwsem_data {
+	struct rw_semaphore sem;
+	int counter __guarded_by(&sem);
+};
+
+static void __used test_rwsem_init(struct test_rwsem_data *d)
+{
+	init_rwsem(&d->sem);
+	d->counter = 0;
+}
+
+static void __used test_rwsem_reader(struct test_rwsem_data *d)
+{
+	down_read(&d->sem);
+	(void)d->counter;
+	up_read(&d->sem);
+
+	if (down_read_trylock(&d->sem)) {
+		(void)d->counter;
+		up_read(&d->sem);
+	}
+}
+
+static void __used test_rwsem_writer(struct test_rwsem_data *d)
+{
+	down_write(&d->sem);
+	d->counter++;
+	up_write(&d->sem);
+
+	down_write(&d->sem);
+	d->counter++;
+	downgrade_write(&d->sem);
+	(void)d->counter;
+	up_read(&d->sem);
+
+	if (down_write_trylock(&d->sem)) {
+		d->counter++;
+		up_write(&d->sem);
+	}
+}
+
+static void __used test_rwsem_assert(struct test_rwsem_data *d)
+{
+	rwsem_assert_held_nolockdep(&d->sem);
+	d->counter++;
+}
+
+static void __used test_rwsem_guard(struct test_rwsem_data *d)
+{
+	{ guard(rwsem_read)(&d->sem); (void)d->counter; }
+	{ guard(rwsem_write)(&d->sem); d->counter++; }
+}
+
+static void __used test_rwsem_cond_guard(struct test_rwsem_data *d)
+{
+	scoped_cond_guard(rwsem_read_try, return, &d->sem) {
+		(void)d->counter;
+	}
+	scoped_cond_guard(rwsem_write_try, return, &d->sem) {
+		d->counter++;
+	}
+}
+
 struct test_bit_spinlock_data {
 	unsigned long bits;
 	int counter __guarded_by(__bitlock(3, &bits));
-- 
2.51.0.384.g4c02a37b29-goog


