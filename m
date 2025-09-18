Return-Path: <linux-kbuild+bounces-8861-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD64B8501D
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED101C85784
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF33C30CB2B;
	Thu, 18 Sep 2025 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RfocYX6F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6C930C103
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204341; cv=none; b=ucEFIqumUnp9U3TVmGlb9S8XJdma6o2nvFIqxwyOVOPxpraBu0AKJRFMZJp0A7HITmK2ALiFqNcnnlSI5F0IgnD25u6xt67oio2uVjSchrMChut9mya+ctBGBOpvR4BHRsTfVZMNXeQS/DHaIGefdpuZU4fzxaRBvgMnOBgdnNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204341; c=relaxed/simple;
	bh=p9BNTrF01jbHrpDCnfagSLcvFkVa7MW59OZsR/1BzBM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BrKJxHH4yVE2aOb9eB9sJSYeCmg5EuIrbGKSvLACk7VcMabCO25CP+Pbuq7QZj3R4zO1ag69mhcbCZ79uzeH00ptipBvnkBetf9x4mBq+FJ3t4855MJhtGHlgkEH8tanjKD9TTx7DO1s4HQxEF8GjcqI4dG3DQfDJiuugHg0enM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RfocYX6F; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45df609b181so11125595e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204337; x=1758809137; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bj3A6JwSdDEEkQDBIc6+7Le1EULqvByaO8E+vTXCoDc=;
        b=RfocYX6FCmgPJCCDE0hg4NcdLPMxQ0k2FLCWKY0QZ0TQfDz22BZkx+V3yma8D+/u03
         dsp2vkhhrHDcBxxRTcmsBdlcIO2D1z0S5dHjqZWujzoKnBb2VcRXh6zqaEORHvrBKggn
         N966kcOXzvC+L6rvcBq8Go2zcs36SFVayAA5+thoOb5WZIqRZV9ohuZsKDvu0RBK4u27
         Pop/jzIzQB6DhSXez45OnC0E8i9ndCv4YgMn4doCfi59QgYf6y3211MTqt3e9+nStGcO
         nh1ZcSDabSo7GZEC1UVKpDbd62LMafR1sC+q+rGRmoa18/W/J1B7rhdpJmsUWY/UEMRQ
         UCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204337; x=1758809137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bj3A6JwSdDEEkQDBIc6+7Le1EULqvByaO8E+vTXCoDc=;
        b=X7qIvtU+Xpjf+2XKvybtWseoJkJ7FMomiPrK0NtqoGfQy6wZomhvEmBAYBxjU9nC63
         VQzKVTb4OOu/TJyfnvDgC8YI3A3q+SECY5HGBXOKpNrn8I1Jefi+zoilnFHX2zKN1RD+
         JVm/wUCQVUvtnXNvJDYyVB9bsPdqXkKtg3hvAaJL7oGctg0sxHBPj/R3kRRC0UP9syI2
         RBElKnawS/Bk4mIRczbPrEqmXiFZG5dO93NblFcFDmSgZ78n1uEf5h7zTgIkQb3YzHq/
         0NeU6GIkJ6d4nLakZpQ+WOr5Be6vT0eiKpPMOuvgnhnEYqxHTEyijhmgzNRaurxwuMKn
         QlwA==
X-Forwarded-Encrypted: i=1; AJvYcCXXPkvzIlrVdJZHWbLM7/yob8EcjgQPXAVPBwqKmmzyAuJHt902Hz/kg8/V9l7suhm1oBEgFo0b8vgVPaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOLykUycDwxwASR+pW+U3vO80XB9CkZQvZrnxThbJkumqgVhl
	YNXq62MWe7amT8uiotjDbIYA75DYfy3fniTganWkmoowEzC8brD8aspWyI9BOnuiD74MS9Wkph0
	u/A==
X-Google-Smtp-Source: AGHT+IHT5Brsou9B7UeMlIcTu5UHA8gJn1pm6+1NzfMBumyM9LF1Hzj80sUwk3WvPBDRv08Z5EVR42viWQ==
X-Received: from wrum18.prod.google.com ([2002:a5d:6a12:0:b0:3ee:15bb:3d66])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:adf:b19a:0:b0:3ec:dfe5:17d0
 with SMTP id ffacd0b85a97d-3ecdfe51b3emr3102866f8f.9.1758204337306; Thu, 18
 Sep 2025 07:05:37 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:15 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-5-elver@google.com>
Subject: [PATCH v3 04/35] Documentation: Add documentation for Compiler-Based
 Capability Analysis
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

Adds documentation in Documentation/dev-tools/capability-analysis.rst,
and adds it to the index and cross-references from Sparse's document.

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Remove cross-reference to Sparse, since we plan to remove Sparse
  support anyway.
* Mention __no_capability_analysis should be avoided.
---
 .../dev-tools/capability-analysis.rst         | 147 ++++++++++++++++++
 Documentation/dev-tools/index.rst             |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 Documentation/dev-tools/capability-analysis.rst

diff --git a/Documentation/dev-tools/capability-analysis.rst b/Documentation/dev-tools/capability-analysis.rst
new file mode 100644
index 000000000000..1287f792f6cd
--- /dev/null
+++ b/Documentation/dev-tools/capability-analysis.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. Copyright (C) 2025, Google LLC.
+
+.. _capability-analysis:
+
+Compiler-Based Capability Analysis
+==================================
+
+Capability analysis is a C language extension, which enables statically
+checking that user-definable "capabilities" are acquired and released where
+required. An obvious application is lock-safety checking for the kernel's
+various synchronization primitives (each of which represents a "capability"),
+and checking that locking rules are not violated.
+
+The Clang compiler currently supports the full set of capability analysis
+features. To enable for Clang, configure the kernel with::
+
+    CONFIG_WARN_CAPABILITY_ANALYSIS=y
+
+The feature requires Clang 22 or later.
+
+The analysis is *opt-in by default*, and requires declaring which modules and
+subsystems should be analyzed in the respective `Makefile`::
+
+    CAPABILITY_ANALYSIS_mymodule.o := y
+
+Or for all translation units in the directory::
+
+    CAPABILITY_ANALYSIS := y
+
+It is possible to enable the analysis tree-wide, however, which will result in
+numerous false positive warnings currently and is *not* generally recommended::
+
+    CONFIG_WARN_CAPABILITY_ANALYSIS_ALL=y
+
+Programming Model
+-----------------
+
+The below describes the programming model around using capability-enabled
+types.
+
+.. note::
+   Enabling capability analysis can be seen as enabling a dialect of Linux C with
+   a Capability System. Some valid patterns involving complex control-flow are
+   constrained (such as conditional acquisition and later conditional release
+   in the same function, or returning pointers to capabilities from functions.
+
+Capability analysis is a way to specify permissibility of operations to depend
+on capabilities being held (or not held). Typically we are interested in
+protecting data and code by requiring some capability to be held, for example a
+specific lock. The analysis ensures that the caller cannot perform the
+operation without holding the appropriate capability.
+
+Capabilities are associated with named structs, along with functions that
+operate on capability-enabled struct instances to acquire and release the
+associated capability.
+
+Capabilities can be held either exclusively or shared. This mechanism allows
+assign more precise privileges when holding a capability, typically to
+distinguish where a thread may only read (shared) or also write (exclusive) to
+guarded data.
+
+The set of capabilities that are actually held by a given thread at a given
+point in program execution is a run-time concept. The static analysis works by
+calculating an approximation of that set, called the capability environment.
+The capability environment is calculated for every program point, and describes
+the set of capabilities that are statically known to be held, or not held, at
+that particular point. This environment is a conservative approximation of the
+full set of capabilities that will actually held by a thread at run-time.
+
+More details are also documented `here
+<https://clang.llvm.org/docs/ThreadSafetyAnalysis.html>`_.
+
+.. note::
+   Clang's analysis explicitly does not infer capabilities acquired or released
+   by inline functions. It requires explicit annotations to (a) assert that
+   it's not a bug if a capability is released or acquired, and (b) to retain
+   consistency between inline and non-inline function declarations.
+
+Supported Kernel Primitives
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. Currently the following synchronization primitives are supported:
+
+For capabilities with an initialization function (e.g., `spin_lock_init()`),
+calling this function on the capability instance before initializing any
+guarded members or globals prevents the compiler from issuing warnings about
+unguarded initialization.
+
+Lockdep assertions, such as `lockdep_assert_held()`, inform the compiler's
+capability analysis that the associated synchronization primitive is held after
+the assertion. This avoids false positives in complex control-flow scenarios
+and encourages the use of Lockdep where static analysis is limited. For
+example, this is useful when a function doesn't *always* require a lock, making
+`__must_hold()` inappropriate.
+
+Keywords
+~~~~~~~~
+
+.. kernel-doc:: include/linux/compiler-capability-analysis.h
+   :identifiers: struct_with_capability
+                 token_capability token_capability_instance
+                 __guarded_by __pt_guarded_by
+                 __must_hold
+                 __must_not_hold
+                 __acquires
+                 __cond_acquires
+                 __releases
+                 __must_hold_shared
+                 __acquires_shared
+                 __cond_acquires_shared
+                 __releases_shared
+                 __acquire
+                 __release
+                 __cond_lock
+                 __acquire_shared
+                 __release_shared
+                 __cond_lock_shared
+                 capability_unsafe
+                 __capability_unsafe
+                 disable_capability_analysis enable_capability_analysis
+
+.. note::
+   The function attribute `__no_capability_analysis` is reserved for internal
+   implementation of capability-enabled primitives, and should be avoided in
+   normal code.
+
+Background
+----------
+
+Clang originally called the feature `Thread Safety Analysis
+<https://clang.llvm.org/docs/ThreadSafetyAnalysis.html>`_, with some
+terminology still using the thread-safety-analysis-only names. This was later
+changed and the feature became more flexible, gaining the ability to define
+custom "capabilities".
+
+Indeed, its foundations can be found in `capability systems
+<https://www.cs.cornell.edu/talc/papers/capabilities.pdf>`_, used to specify
+the permissibility of operations to depend on some capability being held (or
+not held).
+
+Because the feature is not just able to express capabilities related to
+synchronization primitives, the naming chosen for the kernel departs from
+Clang's initial "Thread Safety" nomenclature and refers to the feature as
+"Capability Analysis" to avoid confusion. The implementation still makes
+references to the older terminology in some places, such as `-Wthread-safety`
+being the warning option that also still appears in diagnostic messages.
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 65c54b27a60b..62ac23f797cd 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -18,6 +18,7 @@ Documentation/process/debugging/index.rst
    :maxdepth: 2
 
    testing-overview
+   capability-analysis
    checkpatch
    clang-format
    coccinelle
-- 
2.51.0.384.g4c02a37b29-goog


