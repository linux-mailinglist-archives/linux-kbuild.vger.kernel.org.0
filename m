Return-Path: <linux-kbuild+bounces-8879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF2B851A9
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B898188DEAB
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69753164AE;
	Thu, 18 Sep 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dDO5d8mH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2FC315D43
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204391; cv=none; b=HDkG315rJxpCn6FZFto6HzV6moC/NSgUx5ruaQhLzXAEYvmRKOw73r8oYnDqhawuNpIwAOsrIOLGO6eejGLQWEy07HHYWbDupsWx0ZqCEce5kr+BLh+PeKuD5wdEH6ev9md6D0WMHjxNly5uMf3FJsXN8moyaKadWtGohI/m1mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204391; c=relaxed/simple;
	bh=yEzbFrSIlVK8MMgoiVU9ErjaZwwo0WE03sFxx8pRhqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iMKlHGe4sUPNJ5WcP6xVHHinoKk6pt+L+OMVSaj4/RbN0viUi7Cse6uOGoTjljGXtjpAJDr3d2gVApJSz1vRGtEbDMaqqEd6J7fTBYW1T+tJnOWQCCenTB2+SJikALzD5bKVFp3o+HmIRAqrvnYHyYlJjr5oAY0LY2J++fjfUTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dDO5d8mH; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3e997eb7232so453873f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204387; x=1758809187; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3E29rPCnN3EjGw7BZaVdq2KLgeK/DgzeRknIagImVk4=;
        b=dDO5d8mH65+f0XSCRdEo6KLDwI+mNXjnLxSKrTJIHpE1KDju5pjjQxGVXb3T3fYgyW
         3RAsay4Ly5vQEPxpfxx53M3HiTy9/7iNR5k2AUagM3IzvychSmZKC7czHH09x+3AQGWR
         nrSkEBBQvcBYidFVnq8mbvOvDGc/ZlrYgKMePt79QFhrBjLV6biHw7Y6zEuOfoj64xyE
         GbGjEI5CLZ8BFjXMXjkjga05U61KVZZaBtAWdq6+fHPNMnFws8VXhi9ulqRx/tGxNDj4
         xmUderTc3kP4D0sJz9jahvZOuQX15ZxRPVzqf1qpCssPYkOXoLMO8XC3I1uWOWdaHhli
         znaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204387; x=1758809187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3E29rPCnN3EjGw7BZaVdq2KLgeK/DgzeRknIagImVk4=;
        b=nu+t7ojKI3VD4c4WkGAfDMzjSpSywUyPKFmafBE0XVWg2CUtQHVxEbcRFBr8BUaGA7
         OxWhzSpnTiq5PzHRmOmhYanc/toEGJNjY2d6Sa7/GqslU+12S1OzDaveLP4ZHGATixiu
         WkDoqpcSXcQXo6lBvMZckDxadbhPOlqTG8IU15mHdV8bmxAobhXsQdgHEQZuh+jqqekx
         q4g79o30MiOFAwK0qrGgY+Nbk9ec36u11crRkGWExdfDoZOvJQMFTGawfSkknHehDD3W
         kFqqlAxZO+YqYATWcj6U+QcuA0kbN94FRpN/GFYvhTAl1M1lW8sGcZ5gotPeN2jG8PAj
         JP7A==
X-Forwarded-Encrypted: i=1; AJvYcCXmRlsDPmI2capR2fKnxeyfKvJ6eWB7HDU94gjx+M14oS6oyB8awBNOukpxiAIdj594YKPZu52FtkhL8h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhgFv2H9L3KHGIoTgWnfDctmrZ0KK8nSaZvChoIkXRBYF4qdjB
	kq4fQpXdhAaDwdAhSSJddzLCti1EVz4djuiGIz9O/Ip6DlQr0XQBS9uvt30YBMZ8CWheaiASsH5
	bTg==
X-Google-Smtp-Source: AGHT+IFHOcMXLGwqrVjcBRy1JE0YXyKuRo6WKOASUxR9vb7h90q+XczVWS1fXy1SoT97a7/Imh/y4s+FnQ==
X-Received: from wmben15.prod.google.com ([2002:a05:600c:828f:b0:45c:b62f:ca0d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1887:b0:3e7:615a:17f6
 with SMTP id ffacd0b85a97d-3ecdf9ec859mr5220873f8f.28.1758204386463; Thu, 18
 Sep 2025 07:06:26 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:33 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-23-elver@google.com>
Subject: [PATCH v3 22/35] compiler-capability-analysis: Remove Sparse support
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

Remove Sparse support as discussed at [1].

The kernel codebase is still scattered with numerous places that try to
appease Sparse's context tracking ("annotation for sparse", "fake out
sparse", "work around sparse", etc.). Eventually, as more subsystems
enable Clang's capability analysis, these places will show up and need
adjustment or removal of the workarounds altogether.

Link: https://lore.kernel.org/all/20250207083335.GW7145@noisy.programming.kicks-ass.net/ [1]
Link: https://lore.kernel.org/all/Z6XTKTo_LMj9KmbY@elver.google.com/ [2]
Cc: "Luc Van Oostenryck" <luc.vanoostenryck@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* New patch.
---
 Documentation/dev-tools/sparse.rst           | 19 -----
 include/linux/compiler-capability-analysis.h | 80 ++++++--------------
 include/linux/rcupdate.h                     | 15 +---
 3 files changed, 25 insertions(+), 89 deletions(-)

diff --git a/Documentation/dev-tools/sparse.rst b/Documentation/dev-tools/sparse.rst
index dc791c8d84d1..37b20170835d 100644
--- a/Documentation/dev-tools/sparse.rst
+++ b/Documentation/dev-tools/sparse.rst
@@ -53,25 +53,6 @@ sure that bitwise types don't get mixed up (little-endian vs big-endian
 vs cpu-endian vs whatever), and there the constant "0" really _is_
 special.
 
-Using sparse for lock checking
-------------------------------
-
-The following macros are undefined for gcc and defined during a sparse
-run to use the "context" tracking feature of sparse, applied to
-locking.  These annotations tell sparse when a lock is held, with
-regard to the annotated function's entry and exit.
-
-__must_hold - The specified lock is held on function entry and exit.
-
-__acquires - The specified lock is held on function exit, but not entry.
-
-__releases - The specified lock is held on function entry, but not exit.
-
-If the function enters and exits without the lock held, acquiring and
-releasing the lock inside the function in a balanced way, no
-annotation is needed.  The three annotations above are for cases where
-sparse would otherwise report a context imbalance.
-
 Getting sparse
 --------------
 
diff --git a/include/linux/compiler-capability-analysis.h b/include/linux/compiler-capability-analysis.h
index ccd312dbbf06..6046fca44f17 100644
--- a/include/linux/compiler-capability-analysis.h
+++ b/include/linux/compiler-capability-analysis.h
@@ -248,57 +248,32 @@ static inline void _capability_unsafe_alias(void **p) { }
 	extern const struct __capability_##cap *name
 
 /*
- * Common keywords for static capability analysis. Both Clang's capability
- * analysis and Sparse's context tracking are currently supported.
- */
-#ifdef __CHECKER__
-
-/* Sparse context/lock checking support. */
-# define __must_hold(x)		__attribute__((context(x,1,1)))
-# define __must_not_hold(x)
-# define __acquires(x)		__attribute__((context(x,0,1)))
-# define __cond_acquires(ret, x) __attribute__((context(x,0,-1)))
-# define __releases(x)		__attribute__((context(x,1,0)))
-# define __acquire(x)		__context__(x,1)
-# define __release(x)		__context__(x,-1)
-# define __cond_lock(x, c)	((c) ? ({ __acquire(x); 1; }) : 0)
-/* For Sparse, there's no distinction between exclusive and shared locks. */
-# define __must_hold_shared	__must_hold
-# define __acquires_shared	__acquires
-# define __cond_acquires_shared __cond_acquires
-# define __releases_shared	__releases
-# define __acquire_shared	__acquire
-# define __release_shared	__release
-# define __cond_lock_shared	__cond_acquire
-
-#else /* !__CHECKER__ */
+ * Common keywords for static capability analysis.
+ */
 
 /**
  * __must_hold() - function attribute, caller must hold exclusive capability
- * @x: capability instance pointer
  *
  * Function attribute declaring that the caller must hold the given capability
- * instance @x exclusively.
+ * instance(s) exclusively.
  */
-# define __must_hold(x)		__requires_cap(x)
+#define __must_hold(...)	__requires_cap(__VA_ARGS__)
 
 /**
  * __must_not_hold() - function attribute, caller must not hold capability
- * @x: capability instance pointer
  *
  * Function attribute declaring that the caller must not hold the given
- * capability instance @x.
+ * capability instance(s).
  */
-# define __must_not_hold(x)	__excludes_cap(x)
+#define __must_not_hold(...)	__excludes_cap(__VA_ARGS__)
 
 /**
  * __acquires() - function attribute, function acquires capability exclusively
- * @x: capability instance pointer
  *
  * Function attribute declaring that the function acquires the given
- * capability instance @x exclusively, but does not release it.
+ * capability instance(s) exclusively, but does not release them.
  */
-# define __acquires(x)		__acquires_cap(x)
+#define __acquires(...)		__acquires_cap(__VA_ARGS__)
 
 /*
  * Clang's analysis does not care precisely about the value, only that it is
@@ -325,16 +300,15 @@ static inline void _capability_unsafe_alias(void **p) { }
  *
  * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
  */
-# define __cond_acquires(ret, x) __cond_acquires_impl_##ret(x)
+#define __cond_acquires(ret, x) __cond_acquires_impl_##ret(x)
 
 /**
  * __releases() - function attribute, function releases a capability exclusively
- * @x: capability instance pointer
  *
  * Function attribute declaring that the function releases the given capability
- * instance @x exclusively. The capability must be held on entry.
+ * instance(s) exclusively. The capability must be held on entry.
  */
-# define __releases(x)		__releases_cap(x)
+#define __releases(...)		__releases_cap(__VA_ARGS__)
 
 /**
  * __acquire() - function to acquire capability exclusively
@@ -342,7 +316,7 @@ static inline void _capability_unsafe_alias(void **p) { }
  *
  * No-op function that acquires the given capability instance @x exclusively.
  */
-# define __acquire(x)		__acquire_cap(x)
+#define __acquire(x)		__acquire_cap(x)
 
 /**
  * __release() - function to release capability exclusively
@@ -350,7 +324,7 @@ static inline void _capability_unsafe_alias(void **p) { }
  *
  * No-op function that releases the given capability instance @x.
  */
-# define __release(x)		__release_cap(x)
+#define __release(x)		__release_cap(x)
 
 /**
  * __cond_lock() - function that conditionally acquires a capability
@@ -369,31 +343,28 @@ static inline void _capability_unsafe_alias(void **p) { }
  *
  *	#define spin_trylock(l) __cond_lock(&lock, _spin_trylock(&lock))
  */
-# define __cond_lock(x, c)	__try_acquire_cap(x, c)
+#define __cond_lock(x, c)	__try_acquire_cap(x, c)
 
 /**
  * __must_hold_shared() - function attribute, caller must hold shared capability
- * @x: capability instance pointer
  *
  * Function attribute declaring that the caller must hold the given capability
- * instance @x with shared access.
+ * instance(s) with shared access.
  */
-# define __must_hold_shared(x)	__requires_shared_cap(x)
+#define __must_hold_shared(...)	__requires_shared_cap(__VA_ARGS__)
 
 /**
  * __acquires_shared() - function attribute, function acquires capability shared
- * @x: capability instance pointer
  *
  * Function attribute declaring that the function acquires the given
- * capability instance @x with shared access, but does not release it.
+ * capability instance(s) with shared access, but does not release them.
  */
-# define __acquires_shared(x)	__acquires_shared_cap(x)
+#define __acquires_shared(...)	__acquires_shared_cap(__VA_ARGS__)
 
 /**
  * __cond_acquires_shared() - function attribute, function conditionally
  *                            acquires a capability shared
  * @ret: abstract value returned by function if capability acquired
- * @x: capability instance pointer
  *
  * Function attribute declaring that the function conditionally acquires the
  * given capability instance @x with shared access, but does not release it. The
@@ -401,17 +372,16 @@ static inline void _capability_unsafe_alias(void **p) { }
  *
  * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
  */
-# define __cond_acquires_shared(ret, x) __cond_acquires_impl_##ret(x, _shared)
+#define __cond_acquires_shared(ret, x) __cond_acquires_impl_##ret(x, _shared)
 
 /**
  * __releases_shared() - function attribute, function releases a
  *                       capability shared
- * @x: capability instance pointer
  *
  * Function attribute declaring that the function releases the given capability
- * instance @x with shared access. The capability must be held on entry.
+ * instance(s) with shared access. The capability must be held on entry.
  */
-# define __releases_shared(x)	__releases_shared_cap(x)
+#define __releases_shared(...)	__releases_shared_cap(__VA_ARGS__)
 
 /**
  * __acquire_shared() - function to acquire capability shared
@@ -420,7 +390,7 @@ static inline void _capability_unsafe_alias(void **p) { }
  * No-op function that acquires the given capability instance @x with shared
  * access.
  */
-# define __acquire_shared(x)	__acquire_shared_cap(x)
+#define __acquire_shared(x)	__acquire_shared_cap(x)
 
 /**
  * __release_shared() - function to release capability shared
@@ -429,7 +399,7 @@ static inline void _capability_unsafe_alias(void **p) { }
  * No-op function that releases the given capability instance @x with shared
  * access.
  */
-# define __release_shared(x)	__release_shared_cap(x)
+#define __release_shared(x)	__release_shared_cap(x)
 
 /**
  * __cond_lock_shared() - function that conditionally acquires a capability
@@ -443,9 +413,7 @@ static inline void _capability_unsafe_alias(void **p) { }
  * access, if the boolean expression @c is true. The result of @c is the return
  * value, to be able to create a capability-enabled interface.
  */
-# define __cond_lock_shared(x, c) __try_acquire_shared_cap(x, c)
-
-#endif /* __CHECKER__ */
+#define __cond_lock_shared(x, c) __try_acquire_shared_cap(x, c)
 
 /**
  * __acquire_ret() - helper to acquire capability of return value
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 8eeece72492c..aec28e98d3f2 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -1177,20 +1177,7 @@ rcu_head_after_call_rcu(struct rcu_head *rhp, rcu_callback_t f)
 extern int rcu_expedited;
 extern int rcu_normal;
 
-DEFINE_LOCK_GUARD_0(rcu,
-	do {
-		rcu_read_lock();
-		/*
-		 * sparse doesn't call the cleanup function,
-		 * so just release immediately and don't track
-		 * the context. We don't need to anyway, since
-		 * the whole point of the guard is to not need
-		 * the explicit unlock.
-		 */
-		__release(RCU);
-	} while (0),
-	rcu_read_unlock())
-
+DEFINE_LOCK_GUARD_0(rcu, rcu_read_lock(), rcu_read_unlock())
 DECLARE_LOCK_GUARD_0_ATTRS(rcu, __acquires_shared(RCU), __releases_shared(RCU))
 
 #endif /* __LINUX_RCUPDATE_H */
-- 
2.51.0.384.g4c02a37b29-goog


