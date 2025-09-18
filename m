Return-Path: <linux-kbuild+bounces-8859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3DB84FB1
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DACEB541A1F
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767D530C113;
	Thu, 18 Sep 2025 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TCJ8Xpct"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1C7304BD4
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204337; cv=none; b=NSCbGAXqj1uiO92FSeJxWxnC4/XgJ8USY5IRUDzUVNs3ugzOpRSsjTY1EhEQzs0c3awlKGbyGHEUWsGs4wEReghL8mk4PfpM5KiQgmAdz2THc5C2uRi6rdOMrMgjdwDGu1tU4o5a+K+oiqUysxqYEBkYZSZ+qkXC5lCgNZTd1Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204337; c=relaxed/simple;
	bh=WwPYyU6yaRk3iOE7qWMJl0whWT5WkM6tcWWFpyBaBM4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LI2ycJ5dY4a8NH9dzAzt6VkdEQRhfl1L+DzvtJwbiYsirlDVSL3CgGJCyPBpAAnTY/oZf8D26k/f3REUUFJpkDI7VTwx1Mpegl4l2Dl1PTXWZxwdQ8zQUb9vcUIuKcgql3VRWmegLyBmkFPP2EpoK4K86opuAdwtyr988g+qibc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TCJ8Xpct; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b920e0c25so7405175e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204332; x=1758809132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/GO4ArtW2OIx6jkhKXXV1jkBs4yDkVLm8FwRBFeGHc=;
        b=TCJ8XpctbRsSXYzMsB6TvWYPARdsVq0jA81YMuO2ikMrYTR9j5AeJ6Y0Mj1mdP/TI+
         355X9A/EH85IRMN1R7YpWuJqmvJIaK+9NbZadqADddEKGfG/ueVL/31d38pMyWwkkHgS
         +LAANcmMpyBWTfmnXWeTjejLXi/q1m7M3nZOLGxQuiuGOOXrfQT7NX9g4cXeJ4FXsjOw
         LU96vIAsdfrSHuMPnxndZxXIzwv+SOBZ2PFA3fSDSgL4tj9YpBKK642+75IdcvSCBlkH
         3QuW6Qd1eI78wAFY1pTOlTaiGSDpNQoPTkgOWg5e5aHTA8YJgvZMHosMeQkUk2b1oIJR
         1kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204332; x=1758809132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/GO4ArtW2OIx6jkhKXXV1jkBs4yDkVLm8FwRBFeGHc=;
        b=YLpBylq7SztfOGfetHkWLO+MRqkpn8nTiZW80NRmwnxVU0GLW6msXpfurbDCUiz3WY
         MeeiD9JPi9uqXaOA83tEvURz52b8GCYSNWtAkXMGhPg7GOOQn3tJdgYPLDAwImT0MFD5
         FYT30qHfa/EUsoYTSKidVcr6f+SVexY5Wj6JSKm2z8b5IIfHnOyDnluX5/hxtlPbBtN0
         B8d4LICzrPVUioQ0DyKcB8qMF77o5Sw4wXuQNqB2JwDh7lxhlpM9s8Atd7X3kS7E0G43
         IzSLeA7usOIS3JTFEB2ZX7KdvNmSonn262Pjck0dtiC/6r/fmEbFCSm9RGUWjAxh8G7Q
         FQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTSWrhUVN1b4qL9LO/QClffEoyCQBiLXGTT7Lkc/P3QjDBQLWp0iYUyri0T6fjhILl4jdYRZD1wgILm+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyALPVBfOpMvhYzYFKcGpDky66Yx1bn/b6qCJKZyxJRXYGX3wFn
	aJxv+LW4OxBvqrGVht4yGKVvJmcGtx+BefrOI6t8VM+Ic8Y8m3syZ8KGUe1hARmcKc8XUo6S6RM
	7sA==
X-Google-Smtp-Source: AGHT+IGL64R68SLUyV8p8fnQMRmwNs38xYkNCUycugJPRNDTpsKr8zSWpPLsmf4Plj7ZDky6HCrs46lD6w==
X-Received: from wmbel12.prod.google.com ([2002:a05:600c:3e0c:b0:45e:613:c03])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f8c:b0:45d:7d88:edcd
 with SMTP id 5b1f17b1804b1-46206b2e1admr70451265e9.30.1758204331829; Thu, 18
 Sep 2025 07:05:31 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:13 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-3-elver@google.com>
Subject: [PATCH v3 02/35] compiler-capability-analysis: Add infrastructure for
 Clang's capability analysis
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

Capability analysis is a C language extension, which enables statically
checking that user-definable "capabilities" are acquired and released where
required. An obvious application is lock-safety checking for the kernel's
various synchronization primitives (each of which represents a "capability"),
and checking that locking rules are not violated.

Clang originally called the feature "Thread Safety Analysis" [1], with
some terminology still using the thread-safety-analysis-only names. This
was later changed and the feature became more flexible, gaining the
ability to define custom "capabilities". Its foundations can be found in
"capability systems", used to specify the permissibility of operations
to depend on some capability being held (or not held).

[1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
[2] https://www.cs.cornell.edu/talc/papers/capabilities.pdf

Because the feature is not just able to express capabilities related to
synchronization primitives, the naming chosen for the kernel departs
from Clang's initial "Thread Safety" nomenclature and refers to the
feature as "Capability Analysis" to avoid confusion. The implementation
still makes references to the older terminology in some places, such as
`-Wthread-safety` being the warning enabled option that also still
appears in diagnostic messages.

See more details in the kernel-doc documentation added in this and the
subsequent changes.

Clang version 22+ is required.

Signed-off-by: Marco Elver <elver@google.com>
---
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
 Makefile                                     |   1 +
 include/linux/compiler-capability-analysis.h | 449 ++++++++++++++++++-
 lib/Kconfig.debug                            |  31 ++
 scripts/Makefile.capability-analysis         |   7 +
 scripts/Makefile.lib                         |  10 +
 5 files changed, 491 insertions(+), 7 deletions(-)
 create mode 100644 scripts/Makefile.capability-analysis

diff --git a/Makefile b/Makefile
index cf37b9407821..2c91730e513b 100644
--- a/Makefile
+++ b/Makefile
@@ -1096,6 +1096,7 @@ include-$(CONFIG_RANDSTRUCT)	+= scripts/Makefile.randstruct
 include-$(CONFIG_KSTACK_ERASE)	+= scripts/Makefile.kstack_erase
 include-$(CONFIG_AUTOFDO_CLANG)	+= scripts/Makefile.autofdo
 include-$(CONFIG_PROPELLER_CLANG)	+= scripts/Makefile.propeller
+include-$(CONFIG_WARN_CAPABILITY_ANALYSIS) += scripts/Makefile.capability-analysis
 include-$(CONFIG_GCC_PLUGINS)	+= scripts/Makefile.gcc-plugins
 
 include $(addprefix $(srctree)/, $(include-y))
diff --git a/include/linux/compiler-capability-analysis.h b/include/linux/compiler-capability-analysis.h
index 7546ddb83f86..6f3f185478bc 100644
--- a/include/linux/compiler-capability-analysis.h
+++ b/include/linux/compiler-capability-analysis.h
@@ -6,27 +6,462 @@
 #ifndef _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
 #define _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
 
+#if defined(WARN_CAPABILITY_ANALYSIS)
+
+/*
+ * The below attributes are used to define new capability types. Internal only.
+ */
+# define __cap_type(name)			__attribute__((capability(#name)))
+# define __reentrant_cap			__attribute__((reentrant_capability))
+# define __acquires_cap(...)			__attribute__((acquire_capability(__VA_ARGS__)))
+# define __acquires_shared_cap(...)		__attribute__((acquire_shared_capability(__VA_ARGS__)))
+# define __try_acquires_cap(ret, var)		__attribute__((try_acquire_capability(ret, var)))
+# define __try_acquires_shared_cap(ret, var)	__attribute__((try_acquire_shared_capability(ret, var)))
+# define __releases_cap(...)			__attribute__((release_capability(__VA_ARGS__)))
+# define __releases_shared_cap(...)		__attribute__((release_shared_capability(__VA_ARGS__)))
+# define __assumes_cap(...)			__attribute__((assert_capability(__VA_ARGS__)))
+# define __assumes_shared_cap(...)		__attribute__((assert_shared_capability(__VA_ARGS__)))
+# define __returns_cap(var)			__attribute__((lock_returned(var)))
+
+/*
+ * The below are used to annotate code being checked. Internal only.
+ */
+# define __excludes_cap(...)		__attribute__((locks_excluded(__VA_ARGS__)))
+# define __requires_cap(...)		__attribute__((requires_capability(__VA_ARGS__)))
+# define __requires_shared_cap(...)	__attribute__((requires_shared_capability(__VA_ARGS__)))
+
+/**
+ * __guarded_by - struct member and globals attribute, declares variable
+ *                protected by capability
+ *
+ * Declares that the struct member or global variable must be guarded by the
+ * given capabilities. Read operations on the data require shared access,
+ * while write operations require exclusive access.
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
+ *                   data is protected by capability
+ *
+ * Declares that the data pointed to by the struct member pointer or global
+ * pointer must be guarded by the given capabilities. Read operations on the
+ * data require shared access, while write operations require exclusive access.
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
+ * struct_with_capability() - declare or define a capability struct
+ * @name: struct name
+ *
+ * Helper to declare or define a struct type with capability of the same name.
+ *
+ * .. code-block:: c
+ *
+ *	struct_with_capability(my_handle) {
+ *		int foo;
+ *		long bar;
+ *	};
+ *
+ *	struct some_state {
+ *		...
+ *	};
+ *	// ... declared elsewhere ...
+ *	struct_with_capability(some_state);
+ *
+ * Note: The implementation defines several helper functions that can acquire,
+ * release, and assert the capability.
+ */
+# define struct_with_capability(name, ...)								\
+	struct __cap_type(name) __VA_ARGS__ name;							\
+	static __always_inline void __acquire_cap(const struct name *var)				\
+		__attribute__((overloadable)) __no_capability_analysis __acquires_cap(var) { }		\
+	static __always_inline void __acquire_shared_cap(const struct name *var)			\
+		__attribute__((overloadable)) __no_capability_analysis __acquires_shared_cap(var) { }	\
+	static __always_inline bool __try_acquire_cap(const struct name *var, bool ret)			\
+		__attribute__((overloadable)) __no_capability_analysis __try_acquires_cap(1, var)	\
+	{ return ret; }											\
+	static __always_inline bool __try_acquire_shared_cap(const struct name *var, bool ret)		\
+		__attribute__((overloadable)) __no_capability_analysis __try_acquires_shared_cap(1, var) \
+	{ return ret; }											\
+	static __always_inline void __release_cap(const struct name *var)				\
+		__attribute__((overloadable)) __no_capability_analysis __releases_cap(var) { }		\
+	static __always_inline void __release_shared_cap(const struct name *var)			\
+		__attribute__((overloadable)) __no_capability_analysis __releases_shared_cap(var) { }	\
+	static __always_inline void __assume_cap(const struct name *var)				\
+		__attribute__((overloadable)) __assumes_cap(var) { }					\
+	static __always_inline void __assume_shared_cap(const struct name *var)				\
+		__attribute__((overloadable)) __assumes_shared_cap(var) { }				\
+	struct name
+
+/**
+ * disable_capability_analysis() - disables capability analysis
+ *
+ * Disables capability analysis. Must be paired with a later
+ * enable_capability_analysis().
+ */
+# define disable_capability_analysis()				\
+	__diag_push();						\
+	__diag_ignore_all("-Wunknown-warning-option", "")	\
+	__diag_ignore_all("-Wthread-safety", "")		\
+	__diag_ignore_all("-Wthread-safety-pointer", "")
+
+/**
+ * enable_capability_analysis() - re-enables capability analysis
+ *
+ * Re-enables capability analysis. Must be paired with a prior
+ * disable_capability_analysis().
+ */
+# define enable_capability_analysis() __diag_pop()
+
+/**
+ * __no_capability_analysis - function attribute, disables capability analysis
+ *
+ * Function attribute denoting that capability analysis is disabled for the
+ * whole function. Prefer use of `capability_unsafe()` where possible.
+ */
+# define __no_capability_analysis	__attribute__((no_thread_safety_analysis))
+
+#else /* !WARN_CAPABILITY_ANALYSIS */
+
+# define __cap_type(name)
+# define __reentrant_cap
+# define __acquires_cap(...)
+# define __acquires_shared_cap(...)
+# define __try_acquires_cap(ret, var)
+# define __try_acquires_shared_cap(ret, var)
+# define __releases_cap(...)
+# define __releases_shared_cap(...)
+# define __assumes_cap(...)
+# define __assumes_shared_cap(...)
+# define __returns_cap(var)
+# define __guarded_by(...)
+# define __pt_guarded_by(...)
+# define __excludes_cap(...)
+# define __requires_cap(...)
+# define __requires_shared_cap(...)
+# define __acquire_cap(var)			do { } while (0)
+# define __acquire_shared_cap(var)		do { } while (0)
+# define __try_acquire_cap(var, ret)		(ret)
+# define __try_acquire_shared_cap(var, ret)	(ret)
+# define __release_cap(var)			do { } while (0)
+# define __release_shared_cap(var)		do { } while (0)
+# define __assume_cap(var)			do { (void)(var); } while (0)
+# define __assume_shared_cap(var)		do { (void)(var); } while (0)
+# define struct_with_capability(name, ...)	struct __VA_ARGS__ name
+# define disable_capability_analysis()
+# define enable_capability_analysis()
+# define __no_capability_analysis
+
+#endif /* WARN_CAPABILITY_ANALYSIS */
+
+/**
+ * capability_unsafe() - disable capability checking for contained code
+ *
+ * Disables capability checking for contained statements or expression.
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
+ *		return capability_unsafe(d->counter);
+ *	}
+ */
+#define capability_unsafe(...)		\
+({					\
+	disable_capability_analysis();	\
+	__VA_ARGS__;			\
+	enable_capability_analysis()	\
+})
+
+/**
+ * __capability_unsafe() - function attribute, disable capability checking
+ * @comment: comment explaining why opt-out is safe
+ *
+ * Function attribute denoting that capability analysis is disabled for the
+ * whole function. Forces adding an inline comment as argument.
+ */
+#define __capability_unsafe(comment) __no_capability_analysis
+
+/**
+ * capability_unsafe_alias() - helper to insert a capability "alias barrier"
+ * @p: pointer aliasing a capability or object containing capabilities
+ *
+ * No-op function that acts as a "capability alias barrier", where the analysis
+ * rightfully detects that we're switching aliases, but the switch is considered
+ * safe but beyond the analysis reasoning abilities.
+ *
+ * This should be inserted before the first use of such an alias.
+ *
+ * Implementation Note: The compiler ignores aliases that may be reassigned but
+ * their value cannot be determined (e.g. when passing a non-const pointer to an
+ * alias as a function argument).
+ */
+#define capability_unsafe_alias(p) _capability_unsafe_alias((void **)&(p))
+static inline void _capability_unsafe_alias(void **p) { }
+
+/**
+ * token_capability() - declare an abstract global capability instance
+ * @name: token capability name
+ *
+ * Helper that declares an abstract global capability instance @name that can be
+ * used as a token capability, but not backed by a real data structure (linker
+ * error if accidentally referenced). The type name is `__capability_@name`.
+ */
+#define token_capability(name, ...)					\
+	struct_with_capability(__capability_##name, ##__VA_ARGS__) {};	\
+	extern const struct __capability_##name *name
+
+/**
+ * token_capability_instance() - declare another instance of a global capability
+ * @cap: token capability previously declared with token_capability()
+ * @name: name of additional global capability instance
+ *
+ * Helper that declares an additional instance @name of the same token
+ * capability class @name. This is helpful where multiple related token
+ * capabilities are declared, as it also allows using the same underlying type
+ * (`__capability_@cap`) as function arguments.
+ */
+#define token_capability_instance(cap, name)		\
+	extern const struct __capability_##cap *name
+
+/*
+ * Common keywords for static capability analysis. Both Clang's capability
+ * analysis and Sparse's context tracking are currently supported.
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
+ * __must_hold() - function attribute, caller must hold exclusive capability
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the caller must hold the given capability
+ * instance @x exclusively.
+ */
+# define __must_hold(x)		__requires_cap(x)
+
+/**
+ * __must_not_hold() - function attribute, caller must not hold capability
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the caller must not hold the given
+ * capability instance @x.
+ */
+# define __must_not_hold(x)	__excludes_cap(x)
+
+/**
+ * __acquires() - function attribute, function acquires capability exclusively
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the function acquires the given
+ * capability instance @x exclusively, but does not release it.
+ */
+# define __acquires(x)		__acquires_cap(x)
+
+/**
+ * __cond_acquires() - function attribute, function conditionally
+ *                     acquires a capability exclusively
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the function conditionally acquires the
+ * given capability instance @x exclusively, but does not release it.
+ */
+# define __cond_acquires(x)	__try_acquires_cap(1, x)
+
+/**
+ * __releases() - function attribute, function releases a capability exclusively
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the function releases the given capability
+ * instance @x exclusively. The capability must be held on entry.
+ */
+# define __releases(x)		__releases_cap(x)
+
+/**
+ * __acquire() - function to acquire capability exclusively
+ * @x: capability instance pointer
+ *
+ * No-op function that acquires the given capability instance @x exclusively.
+ */
+# define __acquire(x)		__acquire_cap(x)
+
+/**
+ * __release() - function to release capability exclusively
+ * @x: capability instance pointer
+ *
+ * No-op function that releases the given capability instance @x.
+ */
+# define __release(x)		__release_cap(x)
+
+/**
+ * __cond_lock() - function that conditionally acquires a capability
+ *                 exclusively
+ * @x: capability instance pinter
+ * @c: boolean expression
+ *
+ * Return: result of @c
+ *
+ * No-op function that conditionally acquires capability instance @x
+ * exclusively, if the boolean expression @c is true. The result of @c is the
+ * return value, to be able to create a capability-enabled interface; for
+ * example:
+ *
+ * .. code-block:: c
+ *
+ *	#define spin_trylock(l) __cond_lock(&lock, _spin_trylock(&lock))
+ */
+# define __cond_lock(x, c)	__try_acquire_cap(x, c)
+
+/**
+ * __must_hold_shared() - function attribute, caller must hold shared capability
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the caller must hold the given capability
+ * instance @x with shared access.
+ */
+# define __must_hold_shared(x)	__requires_shared_cap(x)
+
+/**
+ * __acquires_shared() - function attribute, function acquires capability shared
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the function acquires the given
+ * capability instance @x with shared access, but does not release it.
+ */
+# define __acquires_shared(x)	__acquires_shared_cap(x)
+
+/**
+ * __cond_acquires_shared() - function attribute, function conditionally
+ *                            acquires a capability shared
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the function conditionally acquires the
+ * given capability instance @x with shared access, but does not release it.
+ */
+# define __cond_acquires_shared(x) __try_acquires_shared_cap(1, x)
+
+/**
+ * __releases_shared() - function attribute, function releases a
+ *                       capability shared
+ * @x: capability instance pointer
+ *
+ * Function attribute declaring that the function releases the given capability
+ * instance @x with shared access. The capability must be held on entry.
+ */
+# define __releases_shared(x)	__releases_shared_cap(x)
+
+/**
+ * __acquire_shared() - function to acquire capability shared
+ * @x: capability instance pointer
+ *
+ * No-op function that acquires the given capability instance @x with shared
+ * access.
+ */
+# define __acquire_shared(x)	__acquire_shared_cap(x)
+
+/**
+ * __release_shared() - function to release capability shared
+ * @x: capability instance pointer
+ *
+ * No-op function that releases the given capability instance @x with shared
+ * access.
+ */
+# define __release_shared(x)	__release_shared_cap(x)
+
+/**
+ * __cond_lock_shared() - function that conditionally acquires a capability
+ *                        shared
+ * @x: capability instance pinter
+ * @c: boolean expression
+ *
+ * Return: result of @c
+ *
+ * No-op function that conditionally acquires capability instance @x with shared
+ * access, if the boolean expression @c is true. The result of @c is the return
+ * value, to be able to create a capability-enabled interface.
+ */
+# define __cond_lock_shared(x, c) __try_acquire_shared_cap(x, c)
 
 #endif /* __CHECKER__ */
 
+/**
+ * __acquire_ret() - helper to acquire capability of return value
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
+ * __acquire_shared_ret() - helper to acquire capability shared of return value
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
+ * Attributes to mark functions returning acquired capabilities. This is purely
+ * cosmetic to help readability, and should be used with the above macros as
+ * follows:
+ *
+ *   struct foo { spinlock_t lock; ... };
+ *   ...
+ *   #define myfunc(...) __acquire_ret(_myfunc(__VA_ARGS__), &__ret->lock)
+ *   struct foo *_myfunc(int bar) __acquires_ret;
+ *   ...
+ */
+#define __acquires_ret		__no_capability_analysis
+#define __acquires_shared_ret	__no_capability_analysis
+
 #endif /* _LINUX_COMPILER_CAPABILITY_ANALYSIS_H */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index dc0e0c6ed075..57e09615f88d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -613,6 +613,37 @@ config DEBUG_FORCE_WEAK_PER_CPU
 	  To ensure that generic code follows the above rules, this
 	  option forces all percpu variables to be defined as weak.
 
+config WARN_CAPABILITY_ANALYSIS
+	bool "Compiler capability-analysis warnings"
+	depends on CC_IS_CLANG && CLANG_VERSION >= 220000
+	# Branch profiling re-defines "if", which messes with the compiler's
+	# ability to analyze __cond_acquires(..), resulting in false positives.
+	depends on !TRACE_BRANCH_PROFILING
+	default y
+	help
+	  Capability analysis is a C language extension, which enables
+	  statically checking that user-definable "capabilities" are acquired
+	  and released where required.
+
+	  Clang's name of the feature ("Thread Safety Analysis") refers to
+	  the original name of the feature; it was later expanded to be a
+	  generic "Capability Analysis" framework.
+
+	  Requires Clang 22 or later.
+
+	  Produces warnings by default. Select CONFIG_WERROR if you wish to
+	  turn these warnings into errors.
+
+config WARN_CAPABILITY_ANALYSIS_ALL
+	bool "Enable capability analysis for all source files"
+	depends on WARN_CAPABILITY_ANALYSIS
+	depends on EXPERT && !COMPILE_TEST
+	help
+	  Enable tree-wide capability analysis. This is likely to produce a
+	  large number of false positives - enable at your own risk.
+
+	  If unsure, say N.
+
 endmenu # "Compiler options"
 
 menu "Generic Kernel Debugging Instruments"
diff --git a/scripts/Makefile.capability-analysis b/scripts/Makefile.capability-analysis
new file mode 100644
index 000000000000..e137751a4c9a
--- /dev/null
+++ b/scripts/Makefile.capability-analysis
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+capability-analysis-cflags := -DWARN_CAPABILITY_ANALYSIS	\
+	-fexperimental-late-parse-attributes -Wthread-safety	\
+	-Wthread-safety-pointer -Wthread-safety-beta
+
+export CFLAGS_CAPABILITY_ANALYSIS := $(capability-analysis-cflags)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..e0ac273bf9eb 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -105,6 +105,16 @@ _c_flags += $(if $(patsubst n%,, \
 	-D__KCSAN_INSTRUMENT_BARRIERS__)
 endif
 
+#
+# Enable capability analysis flags only where explicitly opted in.
+# (depends on variables CAPABILITY_ANALYSIS_obj.o, CAPABILITY_ANALYSIS)
+#
+ifeq ($(CONFIG_WARN_CAPABILITY_ANALYSIS),y)
+_c_flags += $(if $(patsubst n%,, \
+		$(CAPABILITY_ANALYSIS_$(target-stem).o)$(CAPABILITY_ANALYSIS)$(if $(is-kernel-object),$(CONFIG_WARN_CAPABILITY_ANALYSIS_ALL))), \
+		$(CFLAGS_CAPABILITY_ANALYSIS))
+endif
+
 #
 # Enable AutoFDO build flags except some files or directories we don't want to
 # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE).
-- 
2.51.0.384.g4c02a37b29-goog


