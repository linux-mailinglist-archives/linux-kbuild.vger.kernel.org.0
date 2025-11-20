Return-Path: <linux-kbuild+bounces-9699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5FC74D45
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 16:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A60FE35FD51
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 15:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F6E34AAE9;
	Thu, 20 Nov 2025 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ccgMHPJl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0F30CDAA
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763650977; cv=none; b=KvDQt/tKhfCA7pW/w/97JRSEPe0W8svYwqReRkKXOebw8vTkz7XiEDZi+rPHzOoVu37V5mnkBLXOts9swPEURM4gv9iJuZScQVhRctoU6RgpXG18aIP2e4ytrZiV5rkZ7O4Y4+Yv4xhQfPzccClZnxcoFcZTyt9jztZ4LYwJ1BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763650977; c=relaxed/simple;
	bh=MaknYpOWVj4Hb2mM7rGBh+2UMrs6HYE8pHUeUcAsCqc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aswXVDuoP/NWJ1QatxWgkfjRVJW52huFR7F4DT7TqYcZTdS0Pmaqr+v0au6/o/rv4z6i7dO+3g61U5p/dTEyeVgPHShkHCnc3wqzkre964DtRkSYDnS8QoKRJzDqC29XdMKUgP0QSUBYiP1R/Rx6d2He7KJjUe25vUEMeT6qWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ccgMHPJl; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c76c8a1bso1042044f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 07:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763650971; x=1764255771; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pO9hFwvp+ZAw4faY1qJIaLxAu4rxu7t5oxtHI4nO9RE=;
        b=ccgMHPJl0tfa7cfCM6SGvUlO4KK2roGStGxtRYrucu+Mtq0sw1vHvgzcAdMBfu/1Fv
         QgWYcO9nKDkSCMT0mglkApzSDQlVqUMDc7kBmNaVevMAEWZ2/3s7hCmGT9iAQv+4q+3x
         jmTBgwcKGE2RH45xe5stxobhbLq60krDHROW8v32TAD+ubZ3BHQEyPw7J9pAzjAG4ggd
         d3z/wNFXHeVwajcfs251Q9DCFmLkgiI2lNCIshpHpDI0W7ZwYphObRPHVhtiEvx/3Qgw
         OUi0Dhu/3maQf5lq/QCtxPST9BkT5fjf31TyiFxD9HftWVpgGqg/M9F2bvXD6Edro5hI
         U1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763650971; x=1764255771;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pO9hFwvp+ZAw4faY1qJIaLxAu4rxu7t5oxtHI4nO9RE=;
        b=tJ8lc/P0LFo/Gr1TsKpJpcb9wJvF0Tb0FXXsNDlNMRq4GLSJwMN2fl0farjLx5aaFl
         4kqXRsqmk6KaCT+aHWw3oV+ZYrvmnP4jSX9g95aNZxfJFjPrSHdA/VKsIVp0G6li9pTn
         32CsbCWGj05xcyFzFKq0iPbUVIfbRTRNo8cVSUjhG9TFkCVMZgcHwYQbuLXRnyhLOi9j
         SjxKKrmRYDXiZsHYxFkhFUoS1Af5qET2R/VXJkoP2r5H5p1FOXJv+CpOkRiFkEiO+bsU
         vtPmPoSDdxM5IADqBtfl0EJHCCr4Z1ptpfRSJY2BP2Hb1GVdQTp3wphKPe7aILD9oq1q
         4YrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLnIIS89Mc+Lqx2OwDibS8q74342/azqw2vCUsTS5UgqOxlqeH03H3nL7tjIgDqKEsMBxSXeCfewnYjDw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/SUHBydiWN4aGCNSnm6L4SYdgMYY9hZskR3lR9oVQLLMfMXot
	r0phHd7lu8si81vPz0pSSx8u/bQVJALWQ7mKiqaCiXzC8RgwZV9KC2+FFk0RYc/IyMtWuIaFxHM
	n7A==
X-Google-Smtp-Source: AGHT+IHM/v/9QHeHspB9MXGvz9KS9VSUFd0lOA+Am+xXltzxMW2mqXoAyAyRJa7cm3HE0irfxHztOPPvIg==
X-Received: from wrsy7.prod.google.com ([2002:a5d:4ac7:0:b0:42b:3a01:7811])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:460f:0:b0:42b:396e:27fd
 with SMTP id ffacd0b85a97d-42cb9a5612emr2389445f8f.38.1763650970452; Thu, 20
 Nov 2025 07:02:50 -0800 (PST)
Date: Thu, 20 Nov 2025 15:49:04 +0100
In-Reply-To: <20251120145835.3833031-2-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120145835.3833031-4-elver@google.com>
Subject: [PATCH v4 02/35] compiler-context-analysis: Add infrastructure for
 Context Analysis with Clang
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

Context Analysis is a language extension, which enables statically
checking that required contexts are active (or inactive), by acquiring
and releasing user-definable "context guards". An obvious application is
lock-safety checking for the kernel's various synchronization primitives
(each of which represents a "context guard"), and checking that locking
rules are not violated.

Clang originally called the feature "Thread Safety Analysis" [1]. This
was later changed and the feature became more flexible, gaining the
ability to define custom "capabilities". Its foundations can be found in
"Capability Systems" [2], used to specify the permissibility of
operations to depend on some "capability" being held (or not held).

Because the feature is not just able to express "capabilities" related
to synchronization primitives, and "capability" is already overloaded in
the kernel, the naming chosen for the kernel departs from Clang's
"Thread Safety" and "capability" nomenclature; we refer to the feature
as "Context Analysis" to avoid confusion. The internal implementation
still makes references to Clang's terminology in a few places, such as
`-Wthread-safety` being the warning option that also still appears in
diagnostic messages.

 [1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
 [2] https://www.cs.cornell.edu/talc/papers/capabilities.pdf

See more details in the kernel-doc documentation added in this and
subsequent changes.

Clang version 22+ is required.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.

v3:
* Require Clang 22 or later (reentrant capabilities, basic alias analysis).
* Rename __assert_cap/__asserts_cap -> __assume_cap/__assumes_cap (suggested by Peter).
* Add __acquire_ret and __acquire_shared_ret helper macros - can be used
  to define function-like macros that return objects which contains a
  held capabilities. Works now because of capability alias analysis.
* Add capability_unsafe_alias() helper, where the analysis rightfully
  points out we're doing strange things with aliases but we don't care.
* Support multi-argument attributes.

v2:
* New -Wthread-safety feature rename to -Wthread-safety-pointer (was
  -Wthread-safety-addressof).
* Introduce __capability_unsafe() function attribute.
* Rename __var_guarded_by to simply __guarded_by. The initial idea was
  to be explicit if the variable or pointed-to data is guarded by, but
  having a shorter attribute name is likely better long-term.
* Rename __ref_guarded_by to __pt_guarded_by (pointed-to guarded by).
---
 Makefile                                  |   1 +
 include/linux/compiler-context-analysis.h | 452 +++++++++++++++++++++-
 lib/Kconfig.debug                         |  30 ++
 scripts/Makefile.context-analysis         |   7 +
 scripts/Makefile.lib                      |  10 +
 5 files changed, 493 insertions(+), 7 deletions(-)
 create mode 100644 scripts/Makefile.context-analysis

diff --git a/Makefile b/Makefile
index d763c2c75cdb..0cad6e76f801 100644
--- a/Makefile
+++ b/Makefile
@@ -1093,6 +1093,7 @@ include-$(CONFIG_RANDSTRUCT)	+= scripts/Makefile.randstruct
 include-$(CONFIG_KSTACK_ERASE)	+= scripts/Makefile.kstack_erase
 include-$(CONFIG_AUTOFDO_CLANG)	+= scripts/Makefile.autofdo
 include-$(CONFIG_PROPELLER_CLANG)	+= scripts/Makefile.propeller
+include-$(CONFIG_WARN_CONTEXT_ANALYSIS) += scripts/Makefile.context-analysis
 include-$(CONFIG_GCC_PLUGINS)	+= scripts/Makefile.gcc-plugins
 
 include $(addprefix $(srctree)/, $(include-y))
diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index f8af63045281..8c75e1d0034a 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -6,27 +6,465 @@
 #ifndef _LINUX_COMPILER_CONTEXT_ANALYSIS_H
 #define _LINUX_COMPILER_CONTEXT_ANALYSIS_H
 
+#if defined(WARN_CONTEXT_ANALYSIS)
+
+/*
+ * These attributes define new context guard (Clang: capability) types.
+ * Internal only.
+ */
+# define __ctx_guard_type(name)			__attribute__((capability(#name)))
+# define __reentrant_ctx_guard			__attribute__((reentrant_capability))
+# define __acquires_ctx_guard(...)		__attribute__((acquire_capability(__VA_ARGS__)))
+# define __acquires_shared_ctx_guard(...)	__attribute__((acquire_shared_capability(__VA_ARGS__)))
+# define __try_acquires_ctx_guard(ret, var)	__attribute__((try_acquire_capability(ret, var)))
+# define __try_acquires_shared_ctx_guard(ret, var) __attribute__((try_acquire_shared_capability(ret, var)))
+# define __releases_ctx_guard(...)		__attribute__((release_capability(__VA_ARGS__)))
+# define __releases_shared_ctx_guard(...)	__attribute__((release_shared_capability(__VA_ARGS__)))
+# define __assumes_ctx_guard(...)		__attribute__((assert_capability(__VA_ARGS__)))
+# define __assumes_shared_ctx_guard(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
+# define __returns_ctx_guard(var)		__attribute__((lock_returned(var)))
+
+/*
+ * The below are used to annotate code being checked. Internal only.
+ */
+# define __excludes_ctx_guard(...)		__attribute__((locks_excluded(__VA_ARGS__)))
+# define __requires_ctx_guard(...)		__attribute__((requires_capability(__VA_ARGS__)))
+# define __requires_shared_ctx_guard(...)	__attribute__((requires_shared_capability(__VA_ARGS__)))
+
+/**
+ * __guarded_by - struct member and globals attribute, declares variable
+ *                only accessible within active context
+ *
+ * Declares that the struct member or global variable is only accessible within
+ * the context entered by the given context guard. Read operations on the data
+ * require shared access, while write operations require exclusive access.
+ *
+ * .. code-block:: c
+ *
+ *	struct some_state {
+ *		spinlock_t lock;
+ *		long counter __guarded_by(&lock);
+ *	};
+ */
+# define __guarded_by(...)		__attribute__((guarded_by(__VA_ARGS__)))
+
+/**
+ * __pt_guarded_by - struct member and globals attribute, declares pointed-to
+ *                   data only accessible within active context
+ *
+ * Declares that the data pointed to by the struct member pointer or global
+ * pointer is only accessible within the context entered by the given context
+ * guard. Read operations on the data require shared access, while write
+ * operations require exclusive access.
+ *
+ * .. code-block:: c
+ *
+ *	struct some_state {
+ *		spinlock_t lock;
+ *		long *counter __pt_guarded_by(&lock);
+ *	};
+ */
+# define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
+
+/**
+ * context_guard_struct() - declare or define a context guard struct
+ * @name: struct name
+ *
+ * Helper to declare or define a struct type that is also a context guard.
+ *
+ * .. code-block:: c
+ *
+ *	context_guard_struct(my_handle) {
+ *		int foo;
+ *		long bar;
+ *	};
+ *
+ *	struct some_state {
+ *		...
+ *	};
+ *	// ... declared elsewhere ...
+ *	context_guard_struct(some_state);
+ *
+ * Note: The implementation defines several helper functions that can acquire
+ * and release the context guard.
+ */
+# define context_guard_struct(name, ...)								\
+	struct __ctx_guard_type(name) __VA_ARGS__ name;							\
+	static __always_inline void __acquire_ctx_guard(const struct name *var)				\
+		__attribute__((overloadable)) __no_context_analysis __acquires_ctx_guard(var) { }	\
+	static __always_inline void __acquire_shared_ctx_guard(const struct name *var)			\
+		__attribute__((overloadable)) __no_context_analysis __acquires_shared_ctx_guard(var) { } \
+	static __always_inline bool __try_acquire_ctx_guard(const struct name *var, bool ret)		\
+		__attribute__((overloadable)) __no_context_analysis __try_acquires_ctx_guard(1, var)	\
+	{ return ret; }											\
+	static __always_inline bool __try_acquire_shared_ctx_guard(const struct name *var, bool ret)	\
+		__attribute__((overloadable)) __no_context_analysis __try_acquires_shared_ctx_guard(1, var) \
+	{ return ret; }											\
+	static __always_inline void __release_ctx_guard(const struct name *var)				\
+		__attribute__((overloadable)) __no_context_analysis __releases_ctx_guard(var) { }	\
+	static __always_inline void __release_shared_ctx_guard(const struct name *var)			\
+		__attribute__((overloadable)) __no_context_analysis __releases_shared_ctx_guard(var) { } \
+	static __always_inline void __assume_ctx_guard(const struct name *var)				\
+		__attribute__((overloadable)) __assumes_ctx_guard(var) { }				\
+	static __always_inline void __assume_shared_ctx_guard(const struct name *var)			\
+		__attribute__((overloadable)) __assumes_shared_ctx_guard(var) { }			\
+	struct name
+
+/**
+ * disable_context_analysis() - disables context analysis
+ *
+ * Disables context analysis. Must be paired with a later
+ * enable_context_analysis().
+ */
+# define disable_context_analysis()				\
+	__diag_push();						\
+	__diag_ignore_all("-Wunknown-warning-option", "")	\
+	__diag_ignore_all("-Wthread-safety", "")		\
+	__diag_ignore_all("-Wthread-safety-pointer", "")
+
+/**
+ * enable_context_analysis() - re-enables context analysis
+ *
+ * Re-enables context analysis. Must be paired with a prior
+ * disable_context_analysis().
+ */
+# define enable_context_analysis() __diag_pop()
+
+/**
+ * __no_context_analysis - function attribute, disables context analysis
+ *
+ * Function attribute denoting that context analysis is disabled for the
+ * whole function. Prefer use of `context_unsafe()` where possible.
+ */
+# define __no_context_analysis	__attribute__((no_thread_safety_analysis))
+
+#else /* !WARN_CONTEXT_ANALYSIS */
+
+# define __ctx_guard_type(name)
+# define __reentrant_ctx_guard
+# define __acquires_ctx_guard(...)
+# define __acquires_shared_ctx_guard(...)
+# define __try_acquires_ctx_guard(ret, var)
+# define __try_acquires_shared_ctx_guard(ret, var)
+# define __releases_ctx_guard(...)
+# define __releases_shared_ctx_guard(...)
+# define __assumes_ctx_guard(...)
+# define __assumes_shared_ctx_guard(...)
+# define __returns_ctx_guard(var)
+# define __guarded_by(...)
+# define __pt_guarded_by(...)
+# define __excludes_ctx_guard(...)
+# define __requires_ctx_guard(...)
+# define __requires_shared_ctx_guard(...)
+# define __acquire_ctx_guard(var)			do { } while (0)
+# define __acquire_shared_ctx_guard(var)		do { } while (0)
+# define __try_acquire_ctx_guard(var, ret)		(ret)
+# define __try_acquire_shared_ctx_guard(var, ret)	(ret)
+# define __release_ctx_guard(var)			do { } while (0)
+# define __release_shared_ctx_guard(var)		do { } while (0)
+# define __assume_ctx_guard(var)			do { (void)(var); } while (0)
+# define __assume_shared_ctx_guard(var)			do { (void)(var); } while (0)
+# define context_guard_struct(name, ...)		struct __VA_ARGS__ name
+# define disable_context_analysis()
+# define enable_context_analysis()
+# define __no_context_analysis
+
+#endif /* WARN_CONTEXT_ANALYSIS */
+
+/**
+ * context_unsafe() - disable context checking for contained code
+ *
+ * Disables context checking for contained statements or expression.
+ *
+ * .. code-block:: c
+ *
+ *	struct some_data {
+ *		spinlock_t lock;
+ *		int counter __guarded_by(&lock);
+ *	};
+ *
+ *	int foo(struct some_data *d)
+ *	{
+ *		// ...
+ *		// other code that is still checked ...
+ *		// ...
+ *		return context_unsafe(d->counter);
+ *	}
+ */
+#define context_unsafe(...)		\
+({					\
+	disable_context_analysis();	\
+	__VA_ARGS__;			\
+	enable_context_analysis()	\
+})
+
+/**
+ * __context_unsafe() - function attribute, disable context checking
+ * @comment: comment explaining why opt-out is safe
+ *
+ * Function attribute denoting that context analysis is disabled for the
+ * whole function. Forces adding an inline comment as argument.
+ */
+#define __context_unsafe(comment) __no_context_analysis
+
+/**
+ * context_unsafe_alias() - helper to insert a context guard "alias barrier"
+ * @p: pointer aliasing a context guard or object containing context guards
+ *
+ * No-op function that acts as a "context guard alias barrier", where the
+ * analysis rightfully detects that we're switching aliases, but the switch is
+ * considered safe but beyond the analysis reasoning abilities.
+ *
+ * This should be inserted before the first use of such an alias.
+ *
+ * Implementation Note: The compiler ignores aliases that may be reassigned but
+ * their value cannot be determined (e.g. when passing a non-const pointer to an
+ * alias as a function argument).
+ */
+#define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
+static inline void _context_unsafe_alias(void **p) { }
+
+/**
+ * token_context_guard() - declare an abstract global context guard instance
+ * @name: token context guard name
+ *
+ * Helper that declares an abstract global context guard instance @name, but not
+ * backed by a real data structure (linker error if accidentally referenced).
+ * The type name is `__ctx_guard_@name`.
+ */
+#define token_context_guard(name, ...)					\
+	context_guard_struct(__ctx_guard_##name, ##__VA_ARGS__) {};	\
+	extern const struct __ctx_guard_##name *name
+
+/**
+ * token_context_guard_instance() - declare another instance of a global context guard
+ * @ctx: token context guard previously declared with token_context_guard()
+ * @name: name of additional global context guard instance
+ *
+ * Helper that declares an additional instance @name of the same token context
+ * guard class @ctx. This is helpful where multiple related token contexts are
+ * declared, to allow using the same underlying type (`__ctx_guard_@ctx`) as
+ * function arguments.
+ */
+#define token_context_guard_instance(ctx, name)		\
+	extern const struct __ctx_guard_##ctx *name
+
+/*
+ * Common keywords for static context analysis. Both Clang's "capability
+ * analysis" and Sparse's "context tracking" are currently supported.
+ */
 #ifdef __CHECKER__
 
 /* Sparse context/lock checking support. */
 # define __must_hold(x)		__attribute__((context(x,1,1)))
+# define __must_not_hold(x)
 # define __acquires(x)		__attribute__((context(x,0,1)))
 # define __cond_acquires(x)	__attribute__((context(x,0,-1)))
 # define __releases(x)		__attribute__((context(x,1,0)))
 # define __acquire(x)		__context__(x,1)
 # define __release(x)		__context__(x,-1)
 # define __cond_lock(x, c)	((c) ? ({ __acquire(x); 1; }) : 0)
+/* For Sparse, there's no distinction between exclusive and shared locks. */
+# define __must_hold_shared	__must_hold
+# define __acquires_shared	__acquires
+# define __cond_acquires_shared __cond_acquires
+# define __releases_shared	__releases
+# define __acquire_shared	__acquire
+# define __release_shared	__release
+# define __cond_lock_shared	__cond_acquire
 
 #else /* !__CHECKER__ */
 
-# define __must_hold(x)
-# define __acquires(x)
-# define __cond_acquires(x)
-# define __releases(x)
-# define __acquire(x)		(void)0
-# define __release(x)		(void)0
-# define __cond_lock(x, c)	(c)
+/**
+ * __must_hold() - function attribute, caller must hold exclusive context guard
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the caller must hold the given context
+ * guard instance @x exclusively.
+ */
+# define __must_hold(x)		__requires_ctx_guard(x)
+
+/**
+ * __must_not_hold() - function attribute, caller must not hold context guard
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the caller must not hold the given context
+ * guard instance @x.
+ */
+# define __must_not_hold(x)	__excludes_ctx_guard(x)
+
+/**
+ * __acquires() - function attribute, function acquires context guard exclusively
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the function acquires the given context
+ * guard instance @x exclusively, but does not release it.
+ */
+# define __acquires(x)		__acquires_ctx_guard(x)
+
+/**
+ * __cond_acquires() - function attribute, function conditionally
+ *                     acquires a context guard exclusively
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the function conditionally acquires the
+ * given context guard instance @x exclusively, but does not release it.
+ */
+# define __cond_acquires(x)	__try_acquires_ctx_guard(1, x)
+
+/**
+ * __releases() - function attribute, function releases a context guard exclusively
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the function releases the given context
+ * guard instance @x exclusively. The associated context must be active on
+ * entry.
+ */
+# define __releases(x)		__releases_ctx_guard(x)
+
+/**
+ * __acquire() - function to acquire context guard exclusively
+ * @x: context guard instance pointer
+ *
+ * No-op function that acquires the given context guard instance @x exclusively.
+ */
+# define __acquire(x)		__acquire_ctx_guard(x)
+
+/**
+ * __release() - function to release context guard exclusively
+ * @x: context guard instance pointer
+ *
+ * No-op function that releases the given context guard instance @x.
+ */
+# define __release(x)		__release_ctx_guard(x)
+
+/**
+ * __cond_lock() - function that conditionally acquires a context guard
+ *                 exclusively
+ * @x: context guard instance pinter
+ * @c: boolean expression
+ *
+ * Return: result of @c
+ *
+ * No-op function that conditionally acquires context guard instance @x
+ * exclusively, if the boolean expression @c is true. The result of @c is the
+ * return value; for example:
+ *
+ * .. code-block:: c
+ *
+ *	#define spin_trylock(l) __cond_lock(&lock, _spin_trylock(&lock))
+ */
+# define __cond_lock(x, c)	__try_acquire_ctx_guard(x, c)
+
+/**
+ * __must_hold_shared() - function attribute, caller must hold shared context guard
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the caller must hold the given context
+ * guard instance @x with shared access.
+ */
+# define __must_hold_shared(x)	__requires_shared_ctx_guard(x)
+
+/**
+ * __acquires_shared() - function attribute, function acquires context guard shared
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the function acquires the given
+ * context guard instance @x with shared access, but does not release it.
+ */
+# define __acquires_shared(x)	__acquires_shared_ctx_guard(x)
+
+/**
+ * __cond_acquires_shared() - function attribute, function conditionally
+ *                            acquires a context guard shared
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the function conditionally acquires the
+ * given context guard instance @x with shared access, but does not release it.
+ */
+# define __cond_acquires_shared(x) __try_acquires_shared_ctx_guard(1, x)
+
+/**
+ * __releases_shared() - function attribute, function releases a
+ *                       context guard shared
+ * @x: context guard instance pointer
+ *
+ * Function attribute declaring that the function releases the given context
+ * guard instance @x with shared access. The associated context must be active
+ * on entry.
+ */
+# define __releases_shared(x)	__releases_shared_ctx_guard(x)
+
+/**
+ * __acquire_shared() - function to acquire context guard shared
+ * @x: context guard instance pointer
+ *
+ * No-op function that acquires the given context guard instance @x with shared
+ * access.
+ */
+# define __acquire_shared(x)	__acquire_shared_ctx_guard(x)
+
+/**
+ * __release_shared() - function to release context guard shared
+ * @x: context guard instance pointer
+ *
+ * No-op function that releases the given context guard instance @x with shared
+ * access.
+ */
+# define __release_shared(x)	__release_shared_ctx_guard(x)
+
+/**
+ * __cond_lock_shared() - function that conditionally acquires a context guard shared
+ * @x: context guard instance pinter
+ * @c: boolean expression
+ *
+ * Return: result of @c
+ *
+ * No-op function that conditionally acquires context guard instance @x with
+ * shared access, if the boolean expression @c is true. The result of @c is the
+ * return value.
+ */
+# define __cond_lock_shared(x, c) __try_acquire_shared_ctx_guard(x, c)
 
 #endif /* __CHECKER__ */
 
+/**
+ * __acquire_ret() - helper to acquire context guard of return value
+ * @call: call expression
+ * @ret_expr: acquire expression that uses __ret
+ */
+#define __acquire_ret(call, ret_expr)		\
+	({					\
+		__auto_type __ret = call;	\
+		__acquire(ret_expr);		\
+		__ret;				\
+	})
+
+/**
+ * __acquire_shared_ret() - helper to acquire context guard shared of return value
+ * @call: call expression
+ * @ret_expr: acquire shared expression that uses __ret
+ */
+#define __acquire_shared_ret(call, ret_expr)	\
+	({					\
+		__auto_type __ret = call;	\
+		__acquire_shared(ret_expr);	\
+		__ret;				\
+	})
+
+/*
+ * Attributes to mark functions returning acquired context guards.
+ *
+ * This is purely cosmetic to help readability, and should be used with the
+ * above macros as follows:
+ *
+ *   struct foo { spinlock_t lock; ... };
+ *   ...
+ *   #define myfunc(...) __acquire_ret(_myfunc(__VA_ARGS__), &__ret->lock)
+ *   struct foo *_myfunc(int bar) __acquires_ret;
+ *   ...
+ */
+#define __acquires_ret		__no_context_analysis
+#define __acquires_shared_ret	__no_context_analysis
+
 #endif /* _LINUX_COMPILER_CONTEXT_ANALYSIS_H */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3034e294d50d..696e2a148a15 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -613,6 +613,36 @@ config DEBUG_FORCE_WEAK_PER_CPU
 	  To ensure that generic code follows the above rules, this
 	  option forces all percpu variables to be defined as weak.
 
+config WARN_CONTEXT_ANALYSIS
+	bool "Compiler context-analysis warnings"
+	depends on CC_IS_CLANG && CLANG_VERSION >= 220000
+	# Branch profiling re-defines "if", which messes with the compiler's
+	# ability to analyze __cond_acquires(..), resulting in false positives.
+	depends on !TRACE_BRANCH_PROFILING
+	default y
+	help
+	  Context Analysis is a language extension, which enables statically
+	  checking that required contexts are active (or inactive) by acquiring
+	  and releasing user-definable "context guards".
+
+	  Clang's name of the feature is "Thread Safety Analysis". Requires
+	  Clang 22 or later.
+
+	  Produces warnings by default. Select CONFIG_WERROR if you wish to
+	  turn these warnings into errors.
+
+	  For more details, see Documentation/dev-tools/context-analysis.rst.
+
+config WARN_CONTEXT_ANALYSIS_ALL
+	bool "Enable context analysis for all source files"
+	depends on WARN_CONTEXT_ANALYSIS
+	depends on EXPERT && !COMPILE_TEST
+	help
+	  Enable tree-wide context analysis. This is likely to produce a
+	  large number of false positives - enable at your own risk.
+
+	  If unsure, say N.
+
 endmenu # "Compiler options"
 
 menu "Generic Kernel Debugging Instruments"
diff --git a/scripts/Makefile.context-analysis b/scripts/Makefile.context-analysis
new file mode 100644
index 000000000000..70549f7fae1a
--- /dev/null
+++ b/scripts/Makefile.context-analysis
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+context-analysis-cflags := -DWARN_CONTEXT_ANALYSIS		\
+	-fexperimental-late-parse-attributes -Wthread-safety	\
+	-Wthread-safety-pointer -Wthread-safety-beta
+
+export CFLAGS_CONTEXT_ANALYSIS := $(context-analysis-cflags)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..aa45b3273f7c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -105,6 +105,16 @@ _c_flags += $(if $(patsubst n%,, \
 	-D__KCSAN_INSTRUMENT_BARRIERS__)
 endif
 
+#
+# Enable context analysis flags only where explicitly opted in.
+# (depends on variables CONTEXT_ANALYSIS_obj.o, CONTEXT_ANALYSIS)
+#
+ifeq ($(CONFIG_WARN_CONTEXT_ANALYSIS),y)
+_c_flags += $(if $(patsubst n%,, \
+		$(CONTEXT_ANALYSIS_$(target-stem).o)$(CONTEXT_ANALYSIS)$(if $(is-kernel-object),$(CONFIG_WARN_CONTEXT_ANALYSIS_ALL))), \
+		$(CFLAGS_CONTEXT_ANALYSIS))
+endif
+
 #
 # Enable AutoFDO build flags except some files or directories we don't want to
 # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE).
-- 
2.52.0.rc1.455.g30608eb744-goog


