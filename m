Return-Path: <linux-kbuild+bounces-10212-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E8CD09F5
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 16:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BABB53073784
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 15:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50D2337B95;
	Fri, 19 Dec 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m1EjBB2i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206733B95B
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159149; cv=none; b=n6DFxlRLuFNadhaY5p3rDFA5iGrEqBFQDJHVdbLOpkUHxk+gPzdmEPbxIYwqfg6hYkOf72jppzGJr0q++j7d/vOV5fdk0eriSHo5WcULoiNFZJINlcy4wW6jynArrrNzsgFKG2fmaqi12d9UsciGTzRia/vKusuSyOB2oG3rew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159149; c=relaxed/simple;
	bh=O5NjawtYIRdcH1Vd06kaXR9fJ3HeZPVaHdNaz9TNxP8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e+4ZV1BGwEe4emmP/lxI4n2y4DqxhcT4FU1svbx2m0500G3274dJj0u4fffMH2LNhMueuKHNvGxKX10g12LS4pUNesATEwsVKSNrq6KrlYY7nyY/rf5R0gIFtI1OVVNu4sZf7U8ajwXfak2hkK/3IOCFznfcCjInoXJz4u/ahL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m1EjBB2i; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-431054c09e3so1156425f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 07:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159145; x=1766763945; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kb0gLsOvOvTOd9/IwL391pJi9FHpm7GL0bThZeAVvoU=;
        b=m1EjBB2ixO4YvYybHcpr7Vou1ULMMSy2/hNK/ry3eHFviHhPvjbgCaDCaEW0/1lo4w
         4s395aBFc7Twn6cQvARdSV0pfNAROIzR1W8M/M/PSxWb+Z5FhnGlPt5Jiu3Hq1+9Z9hh
         v6wyMkfyMpe4/OoaxhWdEdEd9LVzY0iTk5nrvEOO1NmsO1VcqBSUw5Hp18J1FeAdD0Mu
         aQL0TvSH4vUkR+Q1h0+QazqrEC7OgTqlpcIVZr+QVOmq1SCJF1GLa66jK8oa14Q8fXOs
         2VOJUSp/UZGfRKR0NZASy2aNoWuQq7kTaHOonSBIV55sTSsdNYbBCQbR3JZajlr5sA0/
         z61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159145; x=1766763945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kb0gLsOvOvTOd9/IwL391pJi9FHpm7GL0bThZeAVvoU=;
        b=brjXvcbYXGEGfc/8y9UXT3BskFRYM1YUbGqZ/2hTdDZ3LrsTK3GY0SeIEArt5+LpYX
         EkME53Z2kNwARWxWZ9cVw76k/eRJLytmiB2gODEnYPoumt3QEdhPbaXBBiwZHSYwhzkQ
         Grxl0TYTFURxihlZ1yJYA9fboA3l96n6EQ9Mo4ORgcjEj0kPFZew90x9PwLue8AA3frs
         g0u1TCMLmC/YrwSeqerijyxrzV6oB4q5CSFrG2wKdRz/8vfTSN3BTXsxE62AAfkldtyd
         gKoWbTsYwcl+NtEazPH9FxnnBhZUhiOZMp01mYFLDIag+gKeY9Gc9Rg1aWXU8ttEOo9B
         L33w==
X-Forwarded-Encrypted: i=1; AJvYcCWBzKLrxvoYcIyBWLJltoKy00d5b8KLG9oBqBkE8SWxi6kfs2aOP3PK42FwnKxhx5zrylM5POq4w/eX1lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwBdhI8kBBWttnWYeU+PGTRpQkkYBuZv/xs5O9+CQI1cFmdVo
	zskTHrm9ztQOzEl8hvJBkVoucxqLLHP05ow8gJ+Rx+UuVLK5lv2KyEEvJlIePHS1EQRTlKnHEOg
	0gw==
X-Google-Smtp-Source: AGHT+IET+LEGDJRWCHLmorOjhXicoZnuOWLnFvU0WuT5JtyAAqi51qU04r6fOHC0UWSg/g7d1u9qxqHVsA==
X-Received: from wmv18.prod.google.com ([2002:a05:600c:26d2:b0:475:dadb:c8f2])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:820d:b0:477:7c7d:d9b7
 with SMTP id 5b1f17b1804b1-47d1958e475mr30951665e9.33.1766159144675; Fri, 19
 Dec 2025 07:45:44 -0800 (PST)
Date: Fri, 19 Dec 2025 16:39:55 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-7-elver@google.com>
Subject: [PATCH v5 06/36] cleanup: Basic compatibility with context analysis
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

Introduce basic compatibility with cleanup.h infrastructure.

We need to allow the compiler to see the acquisition and release of the
context lock at the start and end of a scope. However, the current
"cleanup" helpers wrap the lock in a struct passed through separate
helper functions, which hides the lock alias from the compiler (no
inter-procedural analysis).

While Clang supports scoped guards in C++, it's not possible to apply in
C code: https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#scoped-context

However, together with recent improvements to Clang's alias analysis
abilities, idioms such as this work correctly now:

        void spin_unlock_cleanup(spinlock_t **l) __releases(*l) { .. }
        ...
        {
            spinlock_t *lock_scope __cleanup(spin_unlock_cleanup) = &lock;
            spin_lock(&lock);  // lock through &lock
            ... critical section ...
        }  // unlock through lock_scope -[alias]-> &lock (no warnings)

To generalize this pattern and make it work with existing lock guards,
introduce DECLARE_LOCK_GUARD_1_ATTRS() and WITH_LOCK_GUARD_1_ATTRS().

These allow creating an explicit alias to the context lock instance that
is "cleaned" up with a separate cleanup helper. This helper is a dummy
function that does nothing at runtime, but has the release attributes to
tell the compiler what happens at the end of the scope.

Example usage:

  DECLARE_LOCK_GUARD_1_ATTRS(mutex, __acquires(_T), __releases(*(struct mutex **)_T))
  #define class_mutex_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex, _T)

Note: To support the for-loop based scoped helpers, the auxiliary
variable must be a pointer to the "class" type because it is defined in
the same statement as the guard variable. However, we initialize it with
the lock pointer (despite the type mismatch, the compiler's alias
analysis still works as expected). The "_unlock" attribute receives a
pointer to the auxiliary variable (a double pointer to the class type),
and must be cast and dereferenced appropriately.

Signed-off-by: Marco Elver <elver@google.com>
---
v5:
* Rework infrastructure to properly release at scope end with reworked
  WITH_LOCK_GUARD_1_ATTRS() and WITH_LOCK_GUARD_1_ATTRS().

v4:
* Rename capability -> context analysis.

v3:
* Add *_ATTRS helpers instead of implicit __assumes_cap (suggested by Peter)
* __assert -> __assume rename
---
 include/linux/cleanup.h | 50 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 8d41b917c77d..ee6df68c2177 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -278,16 +278,21 @@ const volatile void * __must_check_fn(const volatile void *val)
 
 #define DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)		\
 typedef _type class_##_name##_t;					\
+typedef _type lock_##_name##_t;						\
 static __always_inline void class_##_name##_destructor(_type *p)	\
+	__no_context_analysis						\
 { _type _T = *p; _exit; }						\
 static __always_inline _type class_##_name##_constructor(_init_args)	\
+	__no_context_analysis						\
 { _type t = _init; return t; }
 
 #define EXTEND_CLASS(_name, ext, _init, _init_args...)			\
+typedef lock_##_name##_t lock_##_name##ext##_t;			\
 typedef class_##_name##_t class_##_name##ext##_t;			\
 static __always_inline void class_##_name##ext##_destructor(class_##_name##_t *p) \
 { class_##_name##_destructor(p); }					\
 static __always_inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
+	__no_context_analysis \
 { class_##_name##_t t = _init; return t; }
 
 #define CLASS(_name, var)						\
@@ -474,12 +479,14 @@ _label:									\
  */
 
 #define __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, ...)		\
+typedef _type lock_##_name##_t;						\
 typedef struct {							\
 	_type *lock;							\
 	__VA_ARGS__;							\
 } class_##_name##_t;							\
 									\
 static __always_inline void class_##_name##_destructor(class_##_name##_t *_T) \
+	__no_context_analysis						\
 {									\
 	if (!__GUARD_IS_ERR(_T->lock)) { _unlock; }			\
 }									\
@@ -488,6 +495,7 @@ __DEFINE_GUARD_LOCK_PTR(_name, &_T->lock)
 
 #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)			\
 static __always_inline class_##_name##_t class_##_name##_constructor(_type *l) \
+	__no_context_analysis						\
 {									\
 	class_##_name##_t _t = { .lock = l }, *_T = &_t;		\
 	_lock;								\
@@ -496,6 +504,7 @@ static __always_inline class_##_name##_t class_##_name##_constructor(_type *l) \
 
 #define __DEFINE_LOCK_GUARD_0(_name, _lock)				\
 static __always_inline class_##_name##_t class_##_name##_constructor(void) \
+	__no_context_analysis						\
 {									\
 	class_##_name##_t _t = { .lock = (void*)1 },			\
 			 *_T __maybe_unused = &_t;			\
@@ -503,6 +512,47 @@ static __always_inline class_##_name##_t class_##_name##_constructor(void) \
 	return _t;							\
 }
 
+#define DECLARE_LOCK_GUARD_0_ATTRS(_name, _lock, _unlock)		\
+static inline class_##_name##_t class_##_name##_constructor(void) _lock;\
+static inline void class_##_name##_destructor(class_##_name##_t *_T) _unlock;
+
+/*
+ * To support Context Analysis, we need to allow the compiler to see the
+ * acquisition and release of the context lock. However, the "cleanup" helpers
+ * wrap the lock in a struct passed through separate helper functions, which
+ * hides the lock alias from the compiler (no inter-procedural analysis).
+ *
+ * To make it work, we introduce an explicit alias to the context lock instance
+ * that is "cleaned" up with a separate cleanup helper. This helper is a dummy
+ * function that does nothing at runtime, but has the "_unlock" attribute to
+ * tell the compiler what happens at the end of the scope.
+ *
+ * To generalize the pattern, the WITH_LOCK_GUARD_1_ATTRS() macro should be used
+ * to redefine the constructor, which then also creates the alias variable with
+ * the right "cleanup" attribute, *after* DECLARE_LOCK_GUARD_1_ATTRS() has been
+ * used.
+ *
+ * Example usage:
+ *
+ *   DECLARE_LOCK_GUARD_1_ATTRS(mutex, __acquires(_T), __releases(*(struct mutex **)_T))
+ *   #define class_mutex_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex, _T)
+ *
+ * Note: To support the for-loop based scoped helpers, the auxiliary variable
+ * must be a pointer to the "class" type because it is defined in the same
+ * statement as the guard variable. However, we initialize it with the lock
+ * pointer (despite the type mismatch, the compiler's alias analysis still works
+ * as expected). The "_unlock" attribute receives a pointer to the auxiliary
+ * variable (a double pointer to the class type), and must be cast and
+ * dereferenced appropriately.
+ */
+#define DECLARE_LOCK_GUARD_1_ATTRS(_name, _lock, _unlock)		\
+static inline class_##_name##_t class_##_name##_constructor(lock_##_name##_t *_T) _lock;\
+static __always_inline void __class_##_name##_cleanup_ctx(class_##_name##_t **_T) \
+	__no_context_analysis _unlock { }
+#define WITH_LOCK_GUARD_1_ATTRS(_name, _T)				\
+	class_##_name##_constructor(_T),				\
+	*__UNIQUE_ID(unlock) __cleanup(__class_##_name##_cleanup_ctx) = (void *)(unsigned long)(_T)
+
 #define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)		\
 __DEFINE_CLASS_IS_CONDITIONAL(_name, false);				\
 __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)		\
-- 
2.52.0.322.g1dd061c0dc-goog


