Return-Path: <linux-kbuild+bounces-8877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD70B85170
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77776188A75E
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A0E30CB2C;
	Thu, 18 Sep 2025 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2XUigOd6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ABA30C627
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204385; cv=none; b=BNCPSjJ06je1vQxgXwDfg90ZmeUsrusPsN+KYvY+QRm+JmCpQ284+2jFWeqCwQt+tFdl7tXXar0RlwGcX+4qSSBgvyRAaKIF6GeWiq1MGLXqdx5ruFY3cS5fNcGsa3sCa2ltEN8xq9PhEuBfmT3Te1cZBR5RnjImFnee1eZyH7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204385; c=relaxed/simple;
	bh=/MeW5F7ttix9WlkBnpTwOdLX6aNcpSlr0jVnFQ0tmdk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X82lPipxwWFpWndiTm3BcdotlrAr+7BqJ2HSDs9zbWnhWQtKoVxPPIJo5XHFF94PViqly54usgYTTwDjzoHNp4LAJbC48lRCVwqM6pnV9pLyjvZc5utsjjNMC2v/GS29fLSNZ+cROt8MwIy5US1p/10jyJMj3veRu+qlgxG1v5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2XUigOd6; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45f2f15003aso6521845e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204381; x=1758809181; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELhsFQQQ03C4hLdoxnucw/8+AkmAKW9zLdfFvUdcDbU=;
        b=2XUigOd6cafSJ2PXRUf9LgSTfbJ9U7Uhx2jcr5nE/PWRR/+lLYdFcAVfDFkAVuhzBc
         SbTEB6ifUQMplP3GjSPCU+8EKKeU7sXskac777AcitsqBmTK0V+ilTCh/ejOUcBM/LFy
         OLr0v4AT/brKPXbjsGUtyd+JcXFiWZ9l/2M7e4pjc+ezaXXuxgdZE9bisq9GeQTCVHi+
         kUpd7g178OSYRuIQiRlBZl1bcCDUz1H30cbwPgRSTkJxXBzRTUUilEMR4mjZHe7QFGwj
         MLlR+Sji90icggmnOr+Zx527vhe7Xz8WOEGTWzybKpKsw8EnbEzzxXMcRnWjC+6OllY/
         1cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204381; x=1758809181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ELhsFQQQ03C4hLdoxnucw/8+AkmAKW9zLdfFvUdcDbU=;
        b=FmesH9aiQIEDMZ7ankIzSwdrzuF2MFucsL4Nv3/iRUiEJS8leJ+PEc2Lln+sksXy47
         h2a0kmSGtyaBEeuqipkVmZbVX7j4gtEHu6GLJrqhf6RtWxJ6fVLgN55EdPAPjgtahE/e
         jypJB5SqLLdNzBfVlzk+N9mqGqmz3thV0iRJL/tvSy+5TpMH2mEZ8thwhlMo5e49AevP
         +YXW0kO/bL9WrbfrSpFjKk4exwUzTc0msC0WDrJc00LhXMXPlHo+RdGoGMGn58SMwPpU
         hr7v0vfxFxaNOaX7qxpDE2OKACPxLNlTB7JLuhpGHzRfrhbZshadEAKOVYVTPmaYcmsp
         vRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsUkzyWpaOQ+rG0ZCZq0H/8RYclbEEoXH9+PhSp/WMwI3OAHXaY2XpKj//EoVC9/RhaxznM2GUfPyu/Jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLGARpHTQqFWSpNPYwWNenqNlJhcSKgUc127TcBmUnKaPvieK
	z9tv5TkZV8ELgaKvrb5XJMG80kSeGSezzNDi4h3AB9rL8VZUsrXZp9/wvmcU22xTG3oQHpPJhzc
	MoA==
X-Google-Smtp-Source: AGHT+IHcd1Qh8kOAFxc/2t8MroiNimpccwG9uYdP8O4l5R/dxiF/pFNNICl8HtyF7NtKGjMQxkNUnXtHWQ==
X-Received: from wmbbi7.prod.google.com ([2002:a05:600c:3d87:b0:45d:d522:48a9])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:2a93:b0:462:cd41:c2f8
 with SMTP id 5b1f17b1804b1-464c6761397mr28424195e9.5.1758204381270; Thu, 18
 Sep 2025 07:06:21 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:31 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-21-elver@google.com>
Subject: [PATCH v3 20/35] locking/ww_mutex: Support Clang's capability analysis
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

Add support for Clang's capability analysis for ww_mutex.

The programming model for ww_mutex is subtly more complex than other
locking primitives when using ww_acquire_ctx. Encoding the respective
pre-conditions for ww_mutex lock/unlock based on ww_acquire_ctx state
using Clang's capability analysis makes incorrect use of the API harder.

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* __assert -> __assume rename

v2:
* New patch.
---
 .../dev-tools/capability-analysis.rst         |  3 +-
 include/linux/ww_mutex.h                      | 22 ++++--
 lib/test_capability-analysis.c                | 69 +++++++++++++++++++
 3 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/Documentation/dev-tools/capability-analysis.rst b/Documentation/dev-tools/capability-analysis.rst
index 9fb964e94920..2b89d346723b 100644
--- a/Documentation/dev-tools/capability-analysis.rst
+++ b/Documentation/dev-tools/capability-analysis.rst
@@ -82,7 +82,8 @@ Supported Kernel Primitives
 
 Currently the following synchronization primitives are supported:
 `raw_spinlock_t`, `spinlock_t`, `rwlock_t`, `mutex`, `seqlock_t`,
-`bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`, `local_lock_t`.
+`bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`, `local_lock_t`,
+`ww_mutex`.
 
 For capabilities with an initialization function (e.g., `spin_lock_init()`),
 calling this function on the capability instance before initializing any
diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 45ff6f7a872b..549d75aee76a 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -44,7 +44,7 @@ struct ww_class {
 	unsigned int is_wait_die;
 };
 
-struct ww_mutex {
+struct_with_capability(ww_mutex) {
 	struct WW_MUTEX_BASE base;
 	struct ww_acquire_ctx *ctx;
 #ifdef DEBUG_WW_MUTEXES
@@ -52,7 +52,7 @@ struct ww_mutex {
 #endif
 };
 
-struct ww_acquire_ctx {
+struct_with_capability(ww_acquire_ctx) {
 	struct task_struct *task;
 	unsigned long stamp;
 	unsigned int acquired;
@@ -107,6 +107,7 @@ struct ww_acquire_ctx {
  */
 static inline void ww_mutex_init(struct ww_mutex *lock,
 				 struct ww_class *ww_class)
+	__assumes_cap(lock)
 {
 	ww_mutex_base_init(&lock->base, ww_class->mutex_name, &ww_class->mutex_key);
 	lock->ctx = NULL;
@@ -141,6 +142,7 @@ static inline void ww_mutex_init(struct ww_mutex *lock,
  */
 static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
 				   struct ww_class *ww_class)
+	__acquires(ctx) __no_capability_analysis
 {
 	ctx->task = current;
 	ctx->stamp = atomic_long_inc_return_relaxed(&ww_class->stamp);
@@ -179,6 +181,7 @@ static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
  * data structures.
  */
 static inline void ww_acquire_done(struct ww_acquire_ctx *ctx)
+	__releases(ctx) __acquires_shared(ctx) __no_capability_analysis
 {
 #ifdef DEBUG_WW_MUTEXES
 	lockdep_assert_held(ctx);
@@ -196,6 +199,7 @@ static inline void ww_acquire_done(struct ww_acquire_ctx *ctx)
  * mutexes have been released with ww_mutex_unlock.
  */
 static inline void ww_acquire_fini(struct ww_acquire_ctx *ctx)
+	__releases_shared(ctx) __no_capability_analysis
 {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	mutex_release(&ctx->first_lock_dep_map, _THIS_IP_);
@@ -245,7 +249,8 @@ static inline void ww_acquire_fini(struct ww_acquire_ctx *ctx)
  *
  * A mutex acquired with this function must be released with ww_mutex_unlock.
  */
-extern int /* __must_check */ ww_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx);
+extern int /* __must_check */ ww_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+	__cond_acquires(0, lock) __must_hold(ctx);
 
 /**
  * ww_mutex_lock_interruptible - acquire the w/w mutex, interruptible
@@ -278,7 +283,8 @@ extern int /* __must_check */ ww_mutex_lock(struct ww_mutex *lock, struct ww_acq
  * A mutex acquired with this function must be released with ww_mutex_unlock.
  */
 extern int __must_check ww_mutex_lock_interruptible(struct ww_mutex *lock,
-						    struct ww_acquire_ctx *ctx);
+						    struct ww_acquire_ctx *ctx)
+	__cond_acquires(0, lock) __must_hold(ctx);
 
 /**
  * ww_mutex_lock_slow - slowpath acquiring of the w/w mutex
@@ -305,6 +311,7 @@ extern int __must_check ww_mutex_lock_interruptible(struct ww_mutex *lock,
  */
 static inline void
 ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+	__acquires(lock) __must_hold(ctx) __no_capability_analysis
 {
 	int ret;
 #ifdef DEBUG_WW_MUTEXES
@@ -342,6 +349,7 @@ ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
 static inline int __must_check
 ww_mutex_lock_slow_interruptible(struct ww_mutex *lock,
 				 struct ww_acquire_ctx *ctx)
+	__cond_acquires(0, lock) __must_hold(ctx)
 {
 #ifdef DEBUG_WW_MUTEXES
 	DEBUG_LOCKS_WARN_ON(!ctx->contending_lock);
@@ -349,10 +357,11 @@ ww_mutex_lock_slow_interruptible(struct ww_mutex *lock,
 	return ww_mutex_lock_interruptible(lock, ctx);
 }
 
-extern void ww_mutex_unlock(struct ww_mutex *lock);
+extern void ww_mutex_unlock(struct ww_mutex *lock) __releases(lock);
 
 extern int __must_check ww_mutex_trylock(struct ww_mutex *lock,
-					 struct ww_acquire_ctx *ctx);
+					 struct ww_acquire_ctx *ctx)
+	__cond_acquires(true, lock) __must_hold(ctx);
 
 /***
  * ww_mutex_destroy - mark a w/w mutex unusable
@@ -363,6 +372,7 @@ extern int __must_check ww_mutex_trylock(struct ww_mutex *lock,
  * this function is called.
  */
 static inline void ww_mutex_destroy(struct ww_mutex *lock)
+	__must_not_hold(lock)
 {
 #ifndef CONFIG_PREEMPT_RT
 	mutex_destroy(&lock->base);
diff --git a/lib/test_capability-analysis.c b/lib/test_capability-analysis.c
index e506dadb3933..12fd9716f0a4 100644
--- a/lib/test_capability-analysis.c
+++ b/lib/test_capability-analysis.c
@@ -14,6 +14,7 @@
 #include <linux/seqlock.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
+#include <linux/ww_mutex.h>
 
 /*
  * Test that helper macros work as expected.
@@ -523,3 +524,71 @@ static void __used test_local_trylock(void)
 		local_unlock(&test_local_trylock_data.lock);
 	}
 }
+
+static DEFINE_WD_CLASS(ww_class);
+
+struct test_ww_mutex_data {
+	struct ww_mutex mtx;
+	int counter __guarded_by(&mtx);
+};
+
+static void __used test_ww_mutex_init(struct test_ww_mutex_data *d)
+{
+	ww_mutex_init(&d->mtx, &ww_class);
+	d->counter = 0;
+}
+
+static void __used test_ww_mutex_lock_noctx(struct test_ww_mutex_data *d)
+{
+	if (!ww_mutex_lock(&d->mtx, NULL)) {
+		d->counter++;
+		ww_mutex_unlock(&d->mtx);
+	}
+
+	if (!ww_mutex_lock_interruptible(&d->mtx, NULL)) {
+		d->counter++;
+		ww_mutex_unlock(&d->mtx);
+	}
+
+	if (ww_mutex_trylock(&d->mtx, NULL)) {
+		d->counter++;
+		ww_mutex_unlock(&d->mtx);
+	}
+
+	ww_mutex_lock_slow(&d->mtx, NULL);
+	d->counter++;
+	ww_mutex_unlock(&d->mtx);
+
+	ww_mutex_destroy(&d->mtx);
+}
+
+static void __used test_ww_mutex_lock_ctx(struct test_ww_mutex_data *d)
+{
+	struct ww_acquire_ctx ctx;
+
+	ww_acquire_init(&ctx, &ww_class);
+
+	if (!ww_mutex_lock(&d->mtx, &ctx)) {
+		d->counter++;
+		ww_mutex_unlock(&d->mtx);
+	}
+
+	if (!ww_mutex_lock_interruptible(&d->mtx, &ctx)) {
+		d->counter++;
+		ww_mutex_unlock(&d->mtx);
+	}
+
+	if (ww_mutex_trylock(&d->mtx, &ctx)) {
+		d->counter++;
+		ww_mutex_unlock(&d->mtx);
+	}
+
+	ww_mutex_lock_slow(&d->mtx, &ctx);
+	d->counter++;
+	ww_mutex_unlock(&d->mtx);
+
+	ww_acquire_done(&ctx);
+	ww_acquire_fini(&ctx);
+
+	ww_mutex_destroy(&d->mtx);
+}
-- 
2.51.0.384.g4c02a37b29-goog


