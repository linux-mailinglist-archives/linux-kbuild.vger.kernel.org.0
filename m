Return-Path: <linux-kbuild+bounces-8908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 063FEB8722E
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 23:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A580B636AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 21:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF872F5A2E;
	Thu, 18 Sep 2025 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qbeO8czd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1A2F8BD1
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 21:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230792; cv=none; b=BliUKxqPFo25LPRyWlDY4f8DYeku9lHwpXXAhLNGNHCtZTuSsVbsWkTg+SZ/Cy3UO3mY5kJBunmpLgtnK68yjLU5v65KOM7e0U4+RMp7wtbWOONYj6HBAt03PRrVrb6cFF6hK+PRC4B8eUlFCSCBsM3J1elkyQs24jH321wyfxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230792; c=relaxed/simple;
	bh=6lurflfcZLY9lBkiycaUE6+vRIA9N3PiZYjC2HI5vjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsExXcchf73Pfj4IeMli74UdPzulEziplOrFjgK2NsWP6vZmPYHAPGGVmprYkoKFZcJgp5CPQS83ggqYgGF6QEfBUXfms+vZsqucxaGGpNxpAbPakCDjxlOH9v8JTiQdjed3+ds6y+PVUSfshzrr9SSOfl55SPuFUQ0f3dtDP0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qbeO8czd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dec026c78so13496035e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758230786; x=1758835586; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlnjh+c5mlf0BAtXS8GQ76RVChldKpzM3ArSnwM9gZ4=;
        b=qbeO8czd+sKTdh8XSc031g69orL6GWqKAhYuWBDUSFJH8QqqyhTMhUufVwVaT0n2nf
         /Ad5bSBym7bgOldPkzW73ftv1E6ugYnKDFxCOcmOT6rCb7JBTlE3TdzJw3g9UjctIuQN
         G24zwteHETmLXjBsgrDEfYkD2uxE7BO6/IIQrxmNRH6EVfPduCK45BmwtKYY3hpr5a8I
         vLXj/W74XLQlBbj429r8u6mf4E0U+zEXj4GF/aZfxJZTQ/aoJUSNcyQOdTCjYLsdAl6M
         2ZPw6wc6vRxeN5mjH6gEhEdrL+4wwsvQtzfQ2QwuxSW7P/a71rHDUDi1X4fc1Lpmlqpb
         5dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230786; x=1758835586;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qlnjh+c5mlf0BAtXS8GQ76RVChldKpzM3ArSnwM9gZ4=;
        b=hxpJxsL2fLc7XM2RzIEFQKQjoG2firKdsIeWtCLbZP9XYQHS/FMrJ0hlX6nN5q9Tla
         WcA6LlJdbMVE7WteTA2H/1o7pe14xQvHWM6dao2fDqCDxcgbhjtDe990QFZ97VrUe9fs
         bZmHqDhWs6wJehhg1+PPPK0vP0ukJxCUce4ZmSMesQk9OCGhIt2ERm153eQX3Ngyzdlv
         fts9bxqXvP2ieKw+Zm9MFDvBMzde8GDtYhMDxEaGP7fK3d8XN9DAi9oBfXhbub1ixvEf
         agyt3w2FSCFmmmvklpWU+bxcCBu3xwgzLPhlTknWDHaTtHFC568Wbe23Puxp5Z25Qbjx
         EyDw==
X-Forwarded-Encrypted: i=1; AJvYcCXZPZVuJYR7UG0/cnX6RNbsuY2+Q3gFSxayKZTtHiAiqoEWH9L+gCbnJCN7S/TWHStUBc0EOk340dWmHPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxLBig4B8BYswhdkFRwVSJFg9qZIgVvhbSfPIygoFpl6zn9SE
	PjLwSuqQ+3MepJjXgWXby/iZok6Ty7NMIzLl2H7RM4mwP+9LFAFhISONYvTVjXFWuA==
X-Gm-Gg: ASbGncs2k5djatUUJo0Oe51jOYj5FBiAPDcuX3aYEWernAx071ESjMIR9QSCspVhGZy
	AzpKdypPdGlSVJxpCpV3g9cIt7ZGEkZpVwNJqHKkH/V+IXH9bKUB2t3VFTMGAqGHsGxTl6evSgZ
	MXm8kTvVU4ejWwJSckxiApU4pwLroU+ZdCOFVmqF7E3YV//zRyI+qOY/GU9MUtW5wN3txiRoxZr
	TpCuwnB+yfYGlLo+hrMsCV0lmC50hFVRNIAvLENmbMdFUWWU8FsurxIO+NW7U9hTemVJjmm0jjP
	EXhE/VB2y6ovGtRnuBm1qORAlKmFW2R/YdPRj/lUoFw2uNd0qlYhEFSaFfmPXGS/9LVd+8YKjQ2
	AE/t42G0LCnybkwqHrwGuEijzAxZD/MMeBDoy3+EbugYXwqJP3XouimwTEbde9sbDMheRt5z1w7
	wJSGGZt7K5Tbb+QikX4vU=
X-Google-Smtp-Source: AGHT+IGMtiwPsNbWfJnBBv9JGIRU+bQLPF7ZAhlfldivxo8u5uhAIK98oRxxcbAgw+UIqa6sty7d8Q==
X-Received: by 2002:a05:600c:3512:b0:45d:db2a:ce32 with SMTP id 5b1f17b1804b1-467ecb1843amr4673355e9.9.1758230785247;
        Thu, 18 Sep 2025 14:26:25 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:1f7a:8520:7568:dac6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613d14d564sm114132235e9.14.2025.09.18.14.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:26:24 -0700 (PDT)
Date: Thu, 18 Sep 2025 23:26:16 +0200
From: Marco Elver <elver@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, llvm@lists.linux.dev,
	rcu@vger.kernel.org
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
Message-ID: <aMx4-B_WAtX2aiKx@elver.google.com>
References: <20250918140451.1289454-1-elver@google.com>
 <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Thu, Sep 18, 2025 at 08:49AM -0700, Linus Torvalds wrote:

> I'd suggest just doing a search-and-replace of 's/capability/context/'
> and it would already make things a ton better. But maybe there are
> better names for this still?

Fair points. "Context Analysis" makes sense, but it makes the thing
(e.g. lock) used to establish that context a little awkward to refer to
-- see half-baked attempt at reworking the documentation below.

Maybe this:

  Instance that must be acquired to enter context = "Context Guard"?

We can then still call it "Context Analysis". And I need to be mindful
of calling the objects themselves "Context Guard" throughout that
search-and-replace. E.g. the macro to create a context-guard-enabled
struct would be "context_guard_struct(spinlock) { ..".

I also thought about "Guard Analysis", but that sounds wrong, too.
Because we also have overloaded "guard(..)" (<linux/cleanup.h>).

Preferences?

[...]
> And if not "context", maybe some other word? But really, absolutely
> *not* "capability". Because that's just crazy talk.
> 
> Please? Because other than this naming issue, I think this really is a
> good idea.

Thanks,
-- Marco

------ >8 ------

diff --git a/Documentation/dev-tools/capability-analysis.rst b/Documentation/dev-tools/capability-analysis.rst
index 3456132261c6..b0c0961d6af5 100644
--- a/Documentation/dev-tools/capability-analysis.rst
+++ b/Documentation/dev-tools/capability-analysis.rst
@@ -1,80 +1,79 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. Copyright (C) 2025, Google LLC.
 
-.. _capability-analysis:
+.. _context-analysis:
 
-Compiler-Based Capability Analysis
-==================================
+Compiler-Based Context Analysis
+===============================
 
-Capability analysis is a C language extension, which enables statically
-checking that user-definable "capabilities" are acquired and released where
-required. An obvious application is lock-safety checking for the kernel's
-various synchronization primitives (each of which represents a "capability"),
-and checking that locking rules are not violated.
+Context analysis is a C language extension, which enables statically checking
+that user-definable contexts are acquired and released where required. An
+obvious application is lock-safety checking for the kernel's various
+synchronization primitives (each of which represents a context if held), and
+checking that locking rules are not violated.
 
-The Clang compiler currently supports the full set of capability analysis
+The Clang compiler currently supports the full set of context analysis
 features. To enable for Clang, configure the kernel with::
 
-    CONFIG_WARN_CAPABILITY_ANALYSIS=y
+    CONFIG_WARN_CONTEXT_ANALYSIS=y
 
 The feature requires Clang 22 or later.
 
 The analysis is *opt-in by default*, and requires declaring which modules and
 subsystems should be analyzed in the respective `Makefile`::
 
-    CAPABILITY_ANALYSIS_mymodule.o := y
+    CONTEXT_ANALYSIS_mymodule.o := y
 
 Or for all translation units in the directory::
 
-    CAPABILITY_ANALYSIS := y
+    CONTEXT_ANALYSIS := y
 
 It is possible to enable the analysis tree-wide, however, which will result in
 numerous false positive warnings currently and is *not* generally recommended::
 
-    CONFIG_WARN_CAPABILITY_ANALYSIS_ALL=y
+    CONFIG_WARN_CONTEXT_ANALYSIS_ALL=y
 
 Programming Model
 -----------------
 
-The below describes the programming model around using capability-enabled
-types.
+The below describes the programming model around using context-enabled types.
 
 .. note::
-   Enabling capability analysis can be seen as enabling a dialect of Linux C with
-   a Capability System. Some valid patterns involving complex control-flow are
+   Enabling context analysis can be seen as enabling a dialect of Linux C with
+   a Context System. Some valid patterns involving complex control-flow are
    constrained (such as conditional acquisition and later conditional release
-   in the same function, or returning pointers to capabilities from functions.
+   in the same function).
 
-Capability analysis is a way to specify permissibility of operations to depend
-on capabilities being held (or not held). Typically we are interested in
-protecting data and code by requiring some capability to be held, for example a
-specific lock. The analysis ensures that the caller cannot perform the
-operation without holding the appropriate capability.
+Context analysis is a way to specify permissibility of operations to depend on
+contexts being held (or not held). Typically we are interested in protecting
+data and code in a critical section by requiring a specific context to be held,
+for example a specific lock. The analysis ensures that the caller cannot
+perform the operation without holding the appropriate context.
 
-Capabilities are associated with named structs, along with functions that
-operate on capability-enabled struct instances to acquire and release the
-associated capability.
+Contexts are associated with named structs, along with functions that operate
+on context-enabled struct instances to acquire and release the associated
+context.
 
-Capabilities can be held either exclusively or shared. This mechanism allows
-assign more precise privileges when holding a capability, typically to
+Contexts can be held either exclusively or shared. This mechanism allows
+assigning more precise privileges when holding a context, typically to
 distinguish where a thread may only read (shared) or also write (exclusive) to
 guarded data.
 
-The set of capabilities that are actually held by a given thread at a given
-point in program execution is a run-time concept. The static analysis works by
-calculating an approximation of that set, called the capability environment.
-The capability environment is calculated for every program point, and describes
-the set of capabilities that are statically known to be held, or not held, at
-that particular point. This environment is a conservative approximation of the
-full set of capabilities that will actually held by a thread at run-time.
+The set of contexts that are actually held by a given thread at a given point
+in program execution is a run-time concept. The static analysis works by
+calculating an approximation of that set, called the context environment.  The
+context environment is calculated for every program point, and describes the
+set of contexts that are statically known to be held, or not held, at that
+particular point. This environment is a conservative approximation of the full
+set of contexts that will actually held by a thread at run-time.
 
 More details are also documented `here
 <https://clang.llvm.org/docs/ThreadSafetyAnalysis.html>`_.
 
 .. note::
-   Clang's analysis explicitly does not infer capabilities acquired or released
+   Clang's analysis explicitly does not infer contexts acquired or released
    by inline functions. It requires explicit annotations to (a) assert that
-   it's not a bug if a capability is released or acquired, and (b) to retain
+   it's not a bug if a context is released or acquired, and (b) to retain
    consistency between inline and non-inline function declarations.
 
 Supported Kernel Primitives
@@ -85,13 +84,13 @@ Currently the following synchronization primitives are supported:
 `bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`, `local_lock_t`,
 `ww_mutex`.
 
-For capabilities with an initialization function (e.g., `spin_lock_init()`),
-calling this function on the capability instance before initializing any
-guarded members or globals prevents the compiler from issuing warnings about
-unguarded initialization.
+For contexts with an initialization function (e.g., `spin_lock_init()`),
+calling this function on the context instance before initializing any guarded
+members or globals prevents the compiler from issuing warnings about unguarded
+initialization.
 
 Lockdep assertions, such as `lockdep_assert_held()`, inform the compiler's
-capability analysis that the associated synchronization primitive is held after
+context analysis that the associated synchronization primitive is held after
 the assertion. This avoids false positives in complex control-flow scenarios
 and encourages the use of Lockdep where static analysis is limited. For
 example, this is useful when a function doesn't *always* require a lock, making
@@ -100,9 +99,9 @@ example, this is useful when a function doesn't *always* require a lock, making
 Keywords
 ~~~~~~~~
 
-.. kernel-doc:: include/linux/compiler-capability-analysis.h
-   :identifiers: struct_with_capability
-                 token_capability token_capability_instance
+.. kernel-doc:: include/linux/compiler-context-analysis.h
+   :identifiers: struct_with_context
+                 token_context token_context_instance
                  __guarded_by __pt_guarded_by
                  __must_hold
                  __must_not_hold
@@ -117,13 +116,13 @@ Keywords
                  __release
                  __acquire_shared
                  __release_shared
-                 capability_unsafe
-                 __capability_unsafe
-                 disable_capability_analysis enable_capability_analysis
+                 context_unsafe
+                 __context_unsafe
+                 disable_context_analysis enable_context_analysis
 
 .. note::
-   The function attribute `__no_capability_analysis` is reserved for internal
-   implementation of capability-enabled primitives, and should be avoided in
+   The function attribute `__no_context_analysis` is reserved for internal
+   implementation of context-enabled primitives, and should be avoided in
    normal code.
 
 Background
@@ -140,9 +139,10 @@ Indeed, its foundations can be found in `capability systems
 the permissibility of operations to depend on some capability being held (or
 not held).
 
-Because the feature is not just able to express capabilities related to
-synchronization primitives, the naming chosen for the kernel departs from
-Clang's initial "Thread Safety" nomenclature and refers to the feature as
-"Capability Analysis" to avoid confusion. The implementation still makes
-references to the older terminology in some places, such as `-Wthread-safety`
-being the warning option that also still appears in diagnostic messages.
+Because the feature is not just able to express contexts related to
+synchronization primitives, and "capability" is already overloaded in the
+kernel, the naming chosen for the kernel departs from Clang's initial "Thread
+Safety" and "Capability" nomenclature and refers to the feature as "Context
+Analysis" to avoid confusion. The internal implementation still makes
+references to Clang's terminology, such as `-Wthread-safety` being the warning
+option that also still appears in diagnostic messages.
diff --git a/include/linux/compiler-capability-analysis.h b/include/linux/compiler-capability-analysis.h
index f8a1da67589c..7882684a8308 100644
--- a/include/linux/compiler-capability-analysis.h
+++ b/include/linux/compiler-capability-analysis.h
@@ -1,42 +1,43 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Macros and attributes for compiler-based static capability analysis.
+ * Macros and attributes for compiler-based static context analysis.
  */
 
-#ifndef _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
-#define _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
+#ifndef _LINUX_COMPILER_CONTEXT_ANALYSIS_H
+#define _LINUX_COMPILER_CONTEXT_ANALYSIS_H
 
-#if defined(WARN_CAPABILITY_ANALYSIS)
+#if defined(WARN_CONTEXT_ANALYSIS)
 
 /*
- * The below attributes are used to define new capability types. Internal only.
- */
-# define __cap_type(name)			__attribute__((capability(#name)))
-# define __reentrant_cap			__attribute__((reentrant_capability))
-# define __acquires_cap(...)			__attribute__((acquire_capability(__VA_ARGS__)))
-# define __acquires_shared_cap(...)		__attribute__((acquire_shared_capability(__VA_ARGS__)))
-# define __try_acquires_cap(ret, var)		__attribute__((try_acquire_capability(ret, var)))
-# define __try_acquires_shared_cap(ret, var)	__attribute__((try_acquire_shared_capability(ret, var)))
-# define __releases_cap(...)			__attribute__((release_capability(__VA_ARGS__)))
-# define __releases_shared_cap(...)		__attribute__((release_shared_capability(__VA_ARGS__)))
-# define __assumes_cap(...)			__attribute__((assert_capability(__VA_ARGS__)))
-# define __assumes_shared_cap(...)		__attribute__((assert_shared_capability(__VA_ARGS__)))
-# define __returns_cap(var)			__attribute__((lock_returned(var)))
+ * The below attributes are used to define new context (Clang: capability) types.
+ * Internal only.
+ */
+# define __ctx_type(name)			__attribute__((capability(#name)))
+# define __reentrant_ctx			__attribute__((reentrant_capability))
+# define __acquires_ctx(...)			__attribute__((acquire_capability(__VA_ARGS__)))
+# define __acquires_shared_ctx(...)		__attribute__((acquire_shared_capability(__VA_ARGS__)))
+# define __try_acquires_ctx(ret, var)		__attribute__((try_acquire_capability(ret, var)))
+# define __try_acquires_shared_ctx(ret, var)	__attribute__((try_acquire_shared_capability(ret, var)))
+# define __releases_ctx(...)			__attribute__((release_capability(__VA_ARGS__)))
+# define __releases_shared_ctx(...)		__attribute__((release_shared_capability(__VA_ARGS__)))
+# define __assumes_ctx(...)			__attribute__((assert_capability(__VA_ARGS__)))
+# define __assumes_shared_ctx(...)		__attribute__((assert_shared_capability(__VA_ARGS__)))
+# define __returns_ctx(var)			__attribute__((lock_returned(var)))
 
 /*
  * The below are used to annotate code being checked. Internal only.
  */
-# define __excludes_cap(...)		__attribute__((locks_excluded(__VA_ARGS__)))
-# define __requires_cap(...)		__attribute__((requires_capability(__VA_ARGS__)))
-# define __requires_shared_cap(...)	__attribute__((requires_shared_capability(__VA_ARGS__)))
+# define __excludes_ctx(...)		__attribute__((locks_excluded(__VA_ARGS__)))
+# define __requires_ctx(...)		__attribute__((requires_capability(__VA_ARGS__)))
+# define __requires_shared_ctx(...)	__attribute__((requires_shared_capability(__VA_ARGS__)))
 
 /**
  * __guarded_by - struct member and globals attribute, declares variable
- *                protected by capability
+ *                protected by context
  *
  * Declares that the struct member or global variable must be guarded by the
- * given capabilities. Read operations on the data require shared access,
- * while write operations require exclusive access.
+ * given context. Read operations on the data require shared access, while write
+ * operations require exclusive access.
  *
  * .. code-block:: c
  *
@@ -49,11 +50,11 @@
 
 /**
  * __pt_guarded_by - struct member and globals attribute, declares pointed-to
- *                   data is protected by capability
+ *                   data is protected by context
  *
  * Declares that the data pointed to by the struct member pointer or global
- * pointer must be guarded by the given capabilities. Read operations on the
- * data require shared access, while write operations require exclusive access.
+ * pointer must be guarded by the given contexts. Read operations on the data
+ * require shared access, while write operations require exclusive access.
  *
  * .. code-block:: c
  *
@@ -65,14 +66,14 @@
 # define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
 
 /**
- * struct_with_capability() - declare or define a capability struct
+ * struct_with_context() - declare or define a context struct
  * @name: struct name
  *
- * Helper to declare or define a struct type with capability of the same name.
+ * Helper to declare or define a struct type with context of the same name.
  *
  * .. code-block:: c
  *
- *	struct_with_capability(my_handle) {
+ *	struct_with_context(my_handle) {
  *		int foo;
  *		long bar;
  *	};
@@ -81,98 +82,98 @@
  *		...
  *	};
  *	// ... declared elsewhere ...
- *	struct_with_capability(some_state);
+ *	struct_with_context(some_state);
  *
  * Note: The implementation defines several helper functions that can acquire,
- * release, and assert the capability.
- */
-# define struct_with_capability(name, ...)								\
-	struct __cap_type(name) __VA_ARGS__ name;							\
-	static __always_inline void __acquire_cap(const struct name *var)				\
-		__attribute__((overloadable)) __no_capability_analysis __acquires_cap(var) { }		\
-	static __always_inline void __acquire_shared_cap(const struct name *var)			\
-		__attribute__((overloadable)) __no_capability_analysis __acquires_shared_cap(var) { }	\
-	static __always_inline bool __try_acquire_cap(const struct name *var, bool ret)			\
-		__attribute__((overloadable)) __no_capability_analysis __try_acquires_cap(1, var)	\
+ * release, and assert the context is held.
+ */
+# define struct_with_context(name, ...)								\
+	struct __ctx_type(name) __VA_ARGS__ name;							\
+	static __always_inline void __acquire_ctx(const struct name *var)				\
+		__attribute__((overloadable)) __no_context_analysis __acquires_ctx(var) { }		\
+	static __always_inline void __acquire_shared_ctx(const struct name *var)			\
+		__attribute__((overloadable)) __no_context_analysis __acquires_shared_ctx(var) { }	\
+	static __always_inline bool __try_acquire_ctx(const struct name *var, bool ret)			\
+		__attribute__((overloadable)) __no_context_analysis __try_acquires_ctx(1, var)	\
 	{ return ret; }											\
-	static __always_inline bool __try_acquire_shared_cap(const struct name *var, bool ret)		\
-		__attribute__((overloadable)) __no_capability_analysis __try_acquires_shared_cap(1, var) \
+	static __always_inline bool __try_acquire_shared_ctx(const struct name *var, bool ret)		\
+		__attribute__((overloadable)) __no_context_analysis __try_acquires_shared_ctx(1, var) \
 	{ return ret; }											\
-	static __always_inline void __release_cap(const struct name *var)				\
-		__attribute__((overloadable)) __no_capability_analysis __releases_cap(var) { }		\
-	static __always_inline void __release_shared_cap(const struct name *var)			\
-		__attribute__((overloadable)) __no_capability_analysis __releases_shared_cap(var) { }	\
-	static __always_inline void __assume_cap(const struct name *var)				\
-		__attribute__((overloadable)) __assumes_cap(var) { }					\
-	static __always_inline void __assume_shared_cap(const struct name *var)				\
-		__attribute__((overloadable)) __assumes_shared_cap(var) { }				\
+	static __always_inline void __release_ctx(const struct name *var)				\
+		__attribute__((overloadable)) __no_context_analysis __releases_ctx(var) { }		\
+	static __always_inline void __release_shared_ctx(const struct name *var)			\
+		__attribute__((overloadable)) __no_context_analysis __releases_shared_ctx(var) { }	\
+	static __always_inline void __assume_ctx(const struct name *var)				\
+		__attribute__((overloadable)) __assumes_ctx(var) { }					\
+	static __always_inline void __assume_shared_ctx(const struct name *var)				\
+		__attribute__((overloadable)) __assumes_shared_ctx(var) { }				\
 	struct name
 
 /**
- * disable_capability_analysis() - disables capability analysis
+ * disable_context_analysis() - disables context analysis
  *
- * Disables capability analysis. Must be paired with a later
- * enable_capability_analysis().
+ * Disables context analysis. Must be paired with a later
+ * enable_context_analysis().
  */
-# define disable_capability_analysis()				\
+# define disable_context_analysis()				\
 	__diag_push();						\
 	__diag_ignore_all("-Wunknown-warning-option", "")	\
 	__diag_ignore_all("-Wthread-safety", "")		\
 	__diag_ignore_all("-Wthread-safety-pointer", "")
 
 /**
- * enable_capability_analysis() - re-enables capability analysis
+ * enable_context_analysis() - re-enables context analysis
  *
- * Re-enables capability analysis. Must be paired with a prior
- * disable_capability_analysis().
+ * Re-enables context analysis. Must be paired with a prior
+ * disable_context_analysis().
  */
-# define enable_capability_analysis() __diag_pop()
+# define enable_context_analysis() __diag_pop()
 
 /**
- * __no_capability_analysis - function attribute, disables capability analysis
- *
- * Function attribute denoting that capability analysis is disabled for the
- * whole function. Prefer use of `capability_unsafe()` where possible.
- */
-# define __no_capability_analysis	__attribute__((no_thread_safety_analysis))
-
-#else /* !WARN_CAPABILITY_ANALYSIS */
-
-# define __cap_type(name)
-# define __reentrant_cap
-# define __acquires_cap(...)
-# define __acquires_shared_cap(...)
-# define __try_acquires_cap(ret, var)
-# define __try_acquires_shared_cap(ret, var)
-# define __releases_cap(...)
-# define __releases_shared_cap(...)
-# define __assumes_cap(...)
-# define __assumes_shared_cap(...)
-# define __returns_cap(var)
+ * __no_context_analysis - function attribute, disables context analysis
+ *
+ * Function attribute denoting that context analysis is disabled for the
+ * whole function. Prefer use of `context_unsafe()` where possible.
+ */
+# define __no_context_analysis	__attribute__((no_thread_safety_analysis))
+
+#else /* !WARN_CONTEXT_ANALYSIS */
+
+# define __ctx_type(name)
+# define __reentrant_ctx
+# define __acquires_ctx(...)
+# define __acquires_shared_ctx(...)
+# define __try_acquires_ctx(ret, var)
+# define __try_acquires_shared_ctx(ret, var)
+# define __releases_ctx(...)
+# define __releases_shared_ctx(...)
+# define __assumes_ctx(...)
+# define __assumes_shared_ctx(...)
+# define __returns_ctx(var)
 # define __guarded_by(...)
 # define __pt_guarded_by(...)
-# define __excludes_cap(...)
-# define __requires_cap(...)
-# define __requires_shared_cap(...)
-# define __acquire_cap(var)			do { } while (0)
-# define __acquire_shared_cap(var)		do { } while (0)
-# define __try_acquire_cap(var, ret)		(ret)
-# define __try_acquire_shared_cap(var, ret)	(ret)
-# define __release_cap(var)			do { } while (0)
-# define __release_shared_cap(var)		do { } while (0)
-# define __assume_cap(var)			do { (void)(var); } while (0)
-# define __assume_shared_cap(var)		do { (void)(var); } while (0)
-# define struct_with_capability(name, ...)	struct __VA_ARGS__ name
-# define disable_capability_analysis()
-# define enable_capability_analysis()
-# define __no_capability_analysis
-
-#endif /* WARN_CAPABILITY_ANALYSIS */
+# define __excludes_ctx(...)
+# define __requires_ctx(...)
+# define __requires_shared_ctx(...)
+# define __acquire_ctx(var)			do { } while (0)
+# define __acquire_shared_ctx(var)		do { } while (0)
+# define __try_acquire_ctx(var, ret)		(ret)
+# define __try_acquire_shared_ctx(var, ret)	(ret)
+# define __release_ctx(var)			do { } while (0)
+# define __release_shared_ctx(var)		do { } while (0)
+# define __assume_ctx(var)			do { (void)(var); } while (0)
+# define __assume_shared_ctx(var)		do { (void)(var); } while (0)
+# define struct_with_context(name, ...)	struct __VA_ARGS__ name
+# define disable_context_analysis()
+# define enable_context_analysis()
+# define __no_context_analysis
+
+#endif /* WARN_CONTEXT_ANALYSIS */
 
 /**
- * capability_unsafe() - disable capability checking for contained code
+ * context_unsafe() - disable context checking for contained code
  *
- * Disables capability checking for contained statements or expression.
+ * Disables context checking for contained statements or expression.
  *
  * .. code-block:: c
  *
@@ -186,30 +187,30 @@
  *		// ...
  *		// other code that is still checked ...
  *		// ...
- *		return capability_unsafe(d->counter);
+ *		return context_unsafe(d->counter);
  *	}
  */
-#define capability_unsafe(...)		\
+#define context_unsafe(...)		\
 ({					\
-	disable_capability_analysis();	\
+	disable_context_analysis();	\
 	__VA_ARGS__;			\
-	enable_capability_analysis()	\
+	enable_context_analysis()	\
 })
 
 /**
- * __capability_unsafe() - function attribute, disable capability checking
+ * __context_unsafe() - function attribute, disable context checking
  * @comment: comment explaining why opt-out is safe
  *
- * Function attribute denoting that capability analysis is disabled for the
+ * Function attribute denoting that context analysis is disabled for the
  * whole function. Forces adding an inline comment as argument.
  */
-#define __capability_unsafe(comment) __no_capability_analysis
+#define __context_unsafe(comment) __no_context_analysis
 
 /**
- * capability_unsafe_alias() - helper to insert a capability "alias barrier"
- * @p: pointer aliasing a capability or object containing capabilities
+ * context_unsafe_alias() - helper to insert a context "alias barrier"
+ * @p: pointer aliasing a context or object containing context pointers
  *
- * No-op function that acts as a "capability alias barrier", where the analysis
+ * No-op function that acts as a "context alias barrier", where the analysis
  * rightfully detects that we're switching aliases, but the switch is considered
  * safe but beyond the analysis reasoning abilities.
  *
@@ -219,61 +220,61 @@
  * their value cannot be determined (e.g. when passing a non-const pointer to an
  * alias as a function argument).
  */
-#define capability_unsafe_alias(p) _capability_unsafe_alias((void **)&(p))
-static inline void _capability_unsafe_alias(void **p) { }
+#define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
+static inline void _context_unsafe_alias(void **p) { }
 
 /**
- * token_capability() - declare an abstract global capability instance
- * @name: token capability name
+ * token_context() - declare an abstract global context instance
+ * @name: token context name
  *
- * Helper that declares an abstract global capability instance @name that can be
- * used as a token capability, but not backed by a real data structure (linker
- * error if accidentally referenced). The type name is `__capability_@name`.
+ * Helper that declares an abstract global context instance @name that can be
+ * used as a token context, but not backed by a real data structure (linker
+ * error if accidentally referenced). The type name is `__context_@name`.
  */
-#define token_capability(name, ...)					\
-	struct_with_capability(__capability_##name, ##__VA_ARGS__) {};	\
-	extern const struct __capability_##name *name
+#define token_context(name, ...)					\
+	struct_with_context(__context_##name, ##__VA_ARGS__) {};	\
+	extern const struct __context_##name *name
 
 /**
- * token_capability_instance() - declare another instance of a global capability
- * @cap: token capability previously declared with token_capability()
- * @name: name of additional global capability instance
+ * token_context_instance() - declare another instance of a global context
+ * @ctx: token context previously declared with token_context()
+ * @name: name of additional global context instance
  *
  * Helper that declares an additional instance @name of the same token
- * capability class @name. This is helpful where multiple related token
- * capabilities are declared, as it also allows using the same underlying type
- * (`__capability_@cap`) as function arguments.
+ * context class @name. This is helpful where multiple related token
+ * contexts are declared, as it also allows using the same underlying type
+ * (`__context_@ctx`) as function arguments.
  */
-#define token_capability_instance(cap, name)		\
-	extern const struct __capability_##cap *name
+#define token_context_instance(ctx, name)		\
+	extern const struct __context_##ctx *name
 
 /*
- * Common keywords for static capability analysis.
+ * Common keywords for static context analysis.
  */
 
 /**
- * __must_hold() - function attribute, caller must hold exclusive capability
+ * __must_hold() - function attribute, caller must hold exclusive context
  *
- * Function attribute declaring that the caller must hold the given capability
+ * Function attribute declaring that the caller must hold the given context
  * instance(s) exclusively.
  */
-#define __must_hold(...)	__requires_cap(__VA_ARGS__)
+#define __must_hold(...)	__requires_ctx(__VA_ARGS__)
 
 /**
- * __must_not_hold() - function attribute, caller must not hold capability
+ * __must_not_hold() - function attribute, caller must not hold context
  *
  * Function attribute declaring that the caller must not hold the given
- * capability instance(s).
+ * context instance(s).
  */
-#define __must_not_hold(...)	__excludes_cap(__VA_ARGS__)
+#define __must_not_hold(...)	__excludes_ctx(__VA_ARGS__)
 
 /**
- * __acquires() - function attribute, function acquires capability exclusively
+ * __acquires() - function attribute, function acquires context exclusively
  *
  * Function attribute declaring that the function acquires the given
- * capability instance(s) exclusively, but does not release them.
+ * context instance(s) exclusively, but does not release them.
  */
-#define __acquires(...)		__acquires_cap(__VA_ARGS__)
+#define __acquires(...)		__acquires_ctx(__VA_ARGS__)
 
 /*
  * Clang's analysis does not care precisely about the value, only that it is
@@ -281,75 +282,75 @@ static inline void _capability_unsafe_alias(void **p) { }
  * misleading if we say that @ret is the value returned if acquired. Instead,
  * provide symbolic variants which we translate.
  */
-#define __cond_acquires_impl_true(x, ...)     __try_acquires##__VA_ARGS__##_cap(1, x)
-#define __cond_acquires_impl_false(x, ...)    __try_acquires##__VA_ARGS__##_cap(0, x)
-#define __cond_acquires_impl_nonzero(x, ...)  __try_acquires##__VA_ARGS__##_cap(1, x)
-#define __cond_acquires_impl_0(x, ...)        __try_acquires##__VA_ARGS__##_cap(0, x)
-#define __cond_acquires_impl_nonnull(x, ...)  __try_acquires##__VA_ARGS__##_cap(1, x)
-#define __cond_acquires_impl_NULL(x, ...)     __try_acquires##__VA_ARGS__##_cap(0, x)
+#define __cond_acquires_impl_true(x, ...)     __try_acquires##__VA_ARGS__##_ctx(1, x)
+#define __cond_acquires_impl_false(x, ...)    __try_acquires##__VA_ARGS__##_ctx(0, x)
+#define __cond_acquires_impl_nonzero(x, ...)  __try_acquires##__VA_ARGS__##_ctx(1, x)
+#define __cond_acquires_impl_0(x, ...)        __try_acquires##__VA_ARGS__##_ctx(0, x)
+#define __cond_acquires_impl_nonnull(x, ...)  __try_acquires##__VA_ARGS__##_ctx(1, x)
+#define __cond_acquires_impl_NULL(x, ...)     __try_acquires##__VA_ARGS__##_ctx(0, x)
 
 /**
  * __cond_acquires() - function attribute, function conditionally
- *                     acquires a capability exclusively
- * @ret: abstract value returned by function if capability acquired
- * @x: capability instance pointer
+ *                     acquires a context exclusively
+ * @ret: abstract value returned by function if context acquired
+ * @x: context instance pointer
  *
  * Function attribute declaring that the function conditionally acquires the
- * given capability instance @x exclusively, but does not release it. The
- * function return value @ret denotes when the capability is acquired.
+ * given context instance @x exclusively, but does not release it. The
+ * function return value @ret denotes when the context is acquired.
  *
  * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
  */
 #define __cond_acquires(ret, x) __cond_acquires_impl_##ret(x)
 
 /**
- * __releases() - function attribute, function releases a capability exclusively
+ * __releases() - function attribute, function releases a context exclusively
  *
- * Function attribute declaring that the function releases the given capability
- * instance(s) exclusively. The capability must be held on entry.
+ * Function attribute declaring that the function releases the given context
+ * instance(s) exclusively. The context must be held on entry.
  */
-#define __releases(...)		__releases_cap(__VA_ARGS__)
+#define __releases(...)		__releases_ctx(__VA_ARGS__)
 
 /**
- * __acquire() - function to acquire capability exclusively
- * @x: capability instance pointer
+ * __acquire() - function to acquire context exclusively
+ * @x: context instance pointer
  *
- * No-op function that acquires the given capability instance @x exclusively.
+ * No-op function that acquires the given context instance @x exclusively.
  */
-#define __acquire(x)		__acquire_cap(x)
+#define __acquire(x)		__acquire_ctx(x)
 
 /**
- * __release() - function to release capability exclusively
- * @x: capability instance pointer
+ * __release() - function to release context exclusively
+ * @x: context instance pointer
  *
- * No-op function that releases the given capability instance @x.
+ * No-op function that releases the given context instance @x.
  */
-#define __release(x)		__release_cap(x)
+#define __release(x)		__release_ctx(x)
 
 /**
- * __must_hold_shared() - function attribute, caller must hold shared capability
+ * __must_hold_shared() - function attribute, caller must hold shared context
  *
- * Function attribute declaring that the caller must hold the given capability
+ * Function attribute declaring that the caller must hold the given context
  * instance(s) with shared access.
  */
-#define __must_hold_shared(...)	__requires_shared_cap(__VA_ARGS__)
+#define __must_hold_shared(...)	__requires_shared_ctx(__VA_ARGS__)
 
 /**
- * __acquires_shared() - function attribute, function acquires capability shared
+ * __acquires_shared() - function attribute, function acquires context shared
  *
  * Function attribute declaring that the function acquires the given
- * capability instance(s) with shared access, but does not release them.
+ * context instance(s) with shared access, but does not release them.
  */
-#define __acquires_shared(...)	__acquires_shared_cap(__VA_ARGS__)
+#define __acquires_shared(...)	__acquires_shared_ctx(__VA_ARGS__)
 
 /**
  * __cond_acquires_shared() - function attribute, function conditionally
- *                            acquires a capability shared
- * @ret: abstract value returned by function if capability acquired
+ *                            acquires a context shared
+ * @ret: abstract value returned by function if context acquired
  *
  * Function attribute declaring that the function conditionally acquires the
- * given capability instance @x with shared access, but does not release it. The
- * function return value @ret denotes when the capability is acquired.
+ * given context instance @x with shared access, but does not release it. The
+ * function return value @ret denotes when the context is acquired.
  *
  * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
  */
@@ -357,33 +358,33 @@ static inline void _capability_unsafe_alias(void **p) { }
 
 /**
  * __releases_shared() - function attribute, function releases a
- *                       capability shared
+ *                       context shared
  *
- * Function attribute declaring that the function releases the given capability
- * instance(s) with shared access. The capability must be held on entry.
+ * Function attribute declaring that the function releases the given context
+ * instance(s) with shared access. The context must be held on entry.
  */
-#define __releases_shared(...)	__releases_shared_cap(__VA_ARGS__)
+#define __releases_shared(...)	__releases_shared_ctx(__VA_ARGS__)
 
 /**
- * __acquire_shared() - function to acquire capability shared
- * @x: capability instance pointer
+ * __acquire_shared() - function to acquire context shared
+ * @x: context instance pointer
  *
- * No-op function that acquires the given capability instance @x with shared
+ * No-op function that acquires the given context instance @x with shared
  * access.
  */
-#define __acquire_shared(x)	__acquire_shared_cap(x)
+#define __acquire_shared(x)	__acquire_shared_ctx(x)
 
 /**
- * __release_shared() - function to release capability shared
- * @x: capability instance pointer
+ * __release_shared() - function to release context shared
+ * @x: context instance pointer
  *
- * No-op function that releases the given capability instance @x with shared
+ * No-op function that releases the given context instance @x with shared
  * access.
  */
-#define __release_shared(x)	__release_shared_cap(x)
+#define __release_shared(x)	__release_shared_ctx(x)
 
 /**
- * __acquire_ret() - helper to acquire capability of return value
+ * __acquire_ret() - helper to acquire context of return value
  * @call: call expression
  * @ret_expr: acquire expression that uses __ret
  */
@@ -395,7 +396,7 @@ static inline void _capability_unsafe_alias(void **p) { }
 	})
 
 /**
- * __acquire_shared_ret() - helper to acquire capability shared of return value
+ * __acquire_shared_ret() - helper to acquire context shared of return value
  * @call: call expression
  * @ret_expr: acquire shared expression that uses __ret
  */
@@ -407,7 +408,7 @@ static inline void _capability_unsafe_alias(void **p) { }
 	})
 
 /*
- * Attributes to mark functions returning acquired capabilities. This is purely
+ * Attributes to mark functions returning acquired contexts. This is purely
  * cosmetic to help readability, and should be used with the above macros as
  * follows:
  *
@@ -417,7 +418,7 @@ static inline void _capability_unsafe_alias(void **p) { }
  *   struct foo *_myfunc(int bar) __acquires_ret;
  *   ...
  */
-#define __acquires_ret		__no_capability_analysis
-#define __acquires_shared_ret	__no_capability_analysis
+#define __acquires_ret		__no_context_analysis
+#define __acquires_shared_ret	__no_context_analysis
 
-#endif /* _LINUX_COMPILER_CAPABILITY_ANALYSIS_H */
+#endif /* _LINUX_COMPILER_CONTEXT_ANALYSIS_H */

