Return-Path: <linux-kbuild+bounces-12412-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NwwLasAzGkoNQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12412-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:13:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0D36E337
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 719A03194D94
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2B6426EA1;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtvtmcGm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772E7425CC4;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975046; cv=none; b=awZDuUsfKXGna8fIbJzEFPxbERcEgVZL8Lao3ksKtD3C5mMGlywwBwAaU2IVl1cgx2qQrIupVLi6xwBpH5bIqlqV9FquuzBGsyPXYdpnJ9Bm5NCDAd5nif/9/YI09M3Fuqhzaoro++SxZW/i2ww3vMKLou2PtJSq0R4MtkVJ72I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975046; c=relaxed/simple;
	bh=2ENkdacgL6qQ4CkwHQy9QBlqPlwlV1b5+fQmJvyLSq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mh8DHc1mmnUz/EQrurPfMiZcfpd9IOx3G3WIu8sV8SPfHq4mN+3vr53GGi/nvd71pp6XFLz6xB5+xJv5nZTf61pYKoYP4ijhIDhUiosD7KiqWppi+qDRQ6UnIC+CAs3Vlq0g4I5rL/PnNtH/kjEXz3mRwQmcbw1NROWmsb34rGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtvtmcGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD50C2BCB5;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975046;
	bh=2ENkdacgL6qQ4CkwHQy9QBlqPlwlV1b5+fQmJvyLSq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TtvtmcGmS5l+peWR1ZnLkhj8TegDKN1jsEuFF+CClQTvBZvGCuwXXZslN5C71bQn1
	 Du/rBINbcqgLtqhBHYK+V/21I37qsopO0hCNVzjoz5qbeCMCE7cEoLik26Jo8ZqVVo
	 YCIi0sK79jAU6xxBAueTu87BCGr950twhnbt9EjHf358252nUDDj79LRUZ0px28Hdw
	 UYaoI0bF0FjnWckPLRPxvGhVcAtOG3IvLUW1AhvpZ/BbuQwIe2hHIIpU9NML+mmfKl
	 EOv132QLa48ATqxc2x03asFg7ZQJzt0xAGpsPKxdsKdv7R6CSR+DorcbazmYkM5Opw
	 5Xv0fypQomxtw==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros __ob_trap and __ob_wrap
Date: Tue, 31 Mar 2026 09:37:21 -0700
Message-Id: <20260331163725.2765789-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331163716.work.696-kees@kernel.org>
References: <20260331163716.work.696-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18211; i=kees@kernel.org; h=from:subject; bh=/GZFvx+P9MNbVo6VGogk5CmI3c2mHRhKCUb448404GE=; b=owGbwMvMwCVmps19z/KJym7G02pJDJmnfzh6Zr6OD6y5E/7nWWV5dXHIvXQxhzlTsuSLrZUdV aYxnHnVUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMJHIG4wMJ9/KL0qKMexL33e/ vq6oxqF/jq5k7eJlUuxysuKC5qlbGBnalbpFO50kvxzek8/o4BMceJv/K+e9LV3H7227vaLDI4E RAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,lwn.net,linuxfoundation.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-12412-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,gnu.org:url,llvm.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21E0D36E337
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Justin Stitt <justinstitt@google.com>

When CONFIG_OVERFLOW_BEHAVIOR_TYPES=y, Clang 23+'s Overflow Behavior
Type[1] annotations are available (i.e. __ob_trap, __ob_wrap). When not
enabled, these need to be empty macros. Document the new annotation and
add links from sanitizer docs pointing to the arithmetic-overflow docs.

Link: https://clang.llvm.org/docs/OverflowBehaviorTypes.html [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
Co-developed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: <kasan-dev@googlegroups.com>
Cc: <linux-doc@vger.kernel.org>
Cc: <llvm@lists.linux.dev>
---
 Documentation/dev-tools/ubsan.rst             |  13 +
 Documentation/process/arithmetic-overflow.rst | 323 ++++++++++++++++++
 Documentation/process/deprecated.rst          |  39 +++
 Documentation/process/index.rst               |   1 +
 include/linux/compiler_attributes.h           |  12 +
 MAINTAINERS                                   |   1 +
 6 files changed, 389 insertions(+)
 create mode 100644 Documentation/process/arithmetic-overflow.rst

diff --git a/Documentation/dev-tools/ubsan.rst b/Documentation/dev-tools/ubsan.rst
index e3591f8e9d5b..9e0c0f048eef 100644
--- a/Documentation/dev-tools/ubsan.rst
+++ b/Documentation/dev-tools/ubsan.rst
@@ -71,6 +71,19 @@ unaligned accesses (CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y). One could
 still enable it in config, just note that it will produce a lot of UBSAN
 reports.
 
+Additional sanitizer options include::
+
+  CONFIG_OVERFLOW_BEHAVIOR_TYPES=y
+
+This enables checking for integer arithmetic wrap-around (overflow/underflow).
+It instruments signed and unsigned integer overflow, as well as implicit
+truncation operations. This option is currently limited to specific types
+via the ``__ob_trap`` and ``__ob_wrap`` annotations.
+
+For detailed information about arithmetic overflow handling, overflow behavior
+annotations, and best practices, see:
+Documentation/process/arithmetic-overflow.rst
+
 References
 ----------
 
diff --git a/Documentation/process/arithmetic-overflow.rst b/Documentation/process/arithmetic-overflow.rst
new file mode 100644
index 000000000000..2f19990f189b
--- /dev/null
+++ b/Documentation/process/arithmetic-overflow.rst
@@ -0,0 +1,323 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _arithmetic_overflow:
+
+Arithmetic Overflow Resolutions for Linux
+=========================================
+
+Background
+----------
+
+When a calculation's result exceeds the involved storage ranges, several
+strategies can be followed to handle such an overflow (or underflow),
+including:
+
+  - Undefined (i.e. pretend it's impossible and the result depends on hardware)
+  - Wrap around (this is what 2s-complement representation does by default)
+  - Trap (create an exception so the problem can be handled in another way)
+  - Saturate (explicitly hold the maximum or minimum representable value)
+
+In the C standard, three basic types can be involved in arithmetic, and each
+has a default strategy for solving the overflow problem:
+
+  - Signed overflow is undefined
+  - Unsigned overflow explicitly wraps around
+  - Pointer overflow is undefined
+
+The Linux kernel uses ``-fno-strict-overflow`` which implies ``-fwrapv``
+and ``-fwrapv-pointer`` which treats signed integer overflow and pointer
+overflow respectively as being consistent with two's complement. This flag
+allows for consistency within the codebase about the expectations of
+overflowing arithmetic as well as prevents eager compiler optimizations.
+Note that :ref:`open-coded intentional arithmetic wrap-around is deprecated <open_coded_wrap_around>`.
+
+From here on, arithmetic overflow concerning signed, unsigned, or
+pointer types will be referred to as "wrap-around" since it is the
+default strategy for the kernel. There is no such thing as "undefined
+behavior" for arithmetic in Linux: it always wraps.
+
+Overflow Behavior Types
+-----------------------
+
+The newly available ``__ob_trap`` and ``__ob_wrap`` annotations provide
+fine-grained control over overflow behavior. These can be applied to
+integer types to unambiguously specify how arithmetic operations are
+expected to behave upon overflow. Currently, only Clang supports these
+annotations. The annotation defines two possible overflow behaviors:
+
+* ``wrap``: Ensures arithmetic operations wrap on overflow, providing
+  well-defined two's complement semantics according to the bitwidth of the
+  underlying type, regardless of any associated ``-fwrapv`` options or
+  sanitizers (integer overflow and truncation checks are suppressed)
+* ``trap``: Enables overflow and truncation checking for the type, even when
+  associated ``-fwrapv`` options are enabled. Without the sanitizer enabled
+  the compiler emits a trap instruction, otherwise the integer overflow
+  and truncation warnings are emitted but execution continues.
+
+Note that the sanitizer infrastructure is used for instrumentation shows
+up in logs as the "Undefined Behavior" sanitizer (UBSan), which may be
+confusing. Instead this should be thought of as the "Unexpected Behavior"
+sanitizer. Its infrastructure is used to report on unexpected wrapping
+behaviors: none of integer operations are "undefined" any more, as per
+the use of ``-fno-strict-overflow``, but instead UBSan will kick in when
+a type is explicitly marked as non-wrapping (i.e. trapping).
+
+
+Enablement
+~~~~~~~~~~
+
+When supported by the compiler, kernels can build with either
+``CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP=y`` for trapping mode (i.e.
+mitigation enabled), or ``CONFIG_OVERFLOW_BEHAVIOR_TYPES_WARN=y`` which
+enables warn-only mode, which logs the overflows but will continue as
+if the type was not marked with ``__ob_trap``.
+
+Compiler Options
+^^^^^^^^^^^^^^^^
+
+Usage of the ``overflow_behavior`` attribute is gated behind the
+``-fexperimental-overflow-behavior-types`` compiler flag which
+is a ``-cc1`` flag, meaning the kernel passes it as ``-Xclang
+-fexperimental-overflow-behavior-types``.
+
+Sanitizer Case Lists
+^^^^^^^^^^^^^^^^^^^^
+
+Linux uses a Sanitizer Case List file to selectively enable certain
+sanitizers for specific types. Specifically, the overflow and truncation
+sanitizers have had their standard instrumentation disabled for all
+types. To "allowlist" specific types for instrumentation the kernel
+makes use of the in-source ``__ob_trap`` annotations to gain reporting
+by the sanitizers.
+
+Currently, type-based entries within a sanitizer case list are only
+supported by Clang. For more information on the syntax for SCL files
+refer to the Clang docs:
+https://clang.llvm.org/docs/SanitizerSpecialCaseList.html
+
+Syntax
+~~~~~~
+
+Creating Overflow Behavior Types is possible via two syntactic forms;
+
+**Attribute syntax:**
+
+.. code-block:: c
+
+  typedef unsigned int __attribute__((overflow_behavior(trap))) safe_uint;
+  typedef unsigned int __attribute__((overflow_behavior(wrap))) wrapping_uint;
+
+**Keyword syntax:**
+
+.. code-block:: c
+
+  typedef unsigned int __ob_trap safe_uint;
+  typedef unsigned int __ob_wrap wrapping_uint;
+
+Both forms are semantically identical. The keyword syntax is shorter and can
+appear in the same positions as ``const`` or ``volatile``. The attribute syntax
+is more self-documenting, so Linux uses this form.
+
+When ``-fexperimental-overflow-behavior-types`` is not enabled, both the
+keywords (``__ob_wrap``, ``__ob_trap``) and the attribute are ignored with a
+warning.
+
+The feature can be queried with either
+``__has_extension(overflow_behavior_types)`` or
+``__has_attribute(overflow_behavior)``.
+
+Basic Usage
+^^^^^^^^^^^
+
+.. code-block:: c
+
+  typedef unsigned int __ob_wrap counter_t;
+  typedef unsigned long __ob_trap safe_size_type;
+
+  counter_t increment_counter(counter_t count) {
+    return count + 1;
+  }
+
+  safe_size_type calculate_buffer_size(safe_size_type base,
+                                       safe_size_type extra) {
+    return base + extra;
+  }
+
+In the first function, arithmetic on ``counter_t`` is well-defined
+wrapping. Its overflow will never be reported and unlike an plain
+``unsigned int`` its purpose is unambiguous: it is expected to wrap
+around. In the second function, arithmetic on ``safe_size_type`` is
+checked -- overflow will result in a trap or sanitizer report depending
+on the build configuration.
+
+Variables can be annotated directly:
+
+.. code-block:: c
+
+  void foo(int num) {
+    int __ob_trap a = num;
+    a += 42;
+
+    unsigned char __ob_wrap b = 255;
+    b += 10;
+  }
+
+
+Interaction with Compiler Options
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Overflow behavior annotations override many global compiler flags and
+sanitizer configurations:
+
+* ``wrap`` types suppress UBSan's integer overflow checks
+  (``signed-integer-overflow``, ``unsigned-integer-overflow``) and implicit
+  truncation checks (``implicit-signed-integer-truncation``,
+  ``implicit-unsigned-integer-truncation``). They also suppress ``-ftrapv``
+  for the annotated type.
+* ``trap`` types enable overflow checking even when ``-fwrapv``
+  is globally enabled. When no sanitizer runtime is available, the compiler
+  emits a trap instruction directly.
+* Both forms override Sanitizer Special Case List (SSCL) entries.
+
+Common overflow idioms are excluded from instrumentation via
+``-fsanitize-undefined-ignore-overflow-pattern=``. These overflow idioms have
+their instrumentation withheld even under the presence of overflow behavior
+annotations. For more details see:
+https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html#disabling-instrumentation-for-common-overflow-patterns
+
+Truncation Semantics
+^^^^^^^^^^^^^^^^^^^^
+
+Truncation and overflow are related -- both are often desirable in some
+contexts and undesirable in others. Overflow behavior types control truncation
+instrumentation at the type level as well:
+
+* If a ``trap`` type is involved as source or destination of a truncation, the
+  compiler inserts truncation checks. These will either trap or report via
+  sanitizer depending on the build configuration.
+* If a ``wrap`` type is involved as source or destination, truncation checks
+  are suppressed regardless of compiler flags.
+* If both ``trap`` and ``wrap`` are involved in the same truncation, ``wrap``
+  takes precedence (truncation checks are suppressed) since the explicit
+  wrapping intent covers truncation as well.
+
+.. code-block:: c
+
+  void checked(char a, int __ob_trap b) {
+    a = b;
+  }
+
+  void wrapping(char a, int __ob_wrap b) {
+    a = b;
+  }
+
+
+Promotion Rules
+^^^^^^^^^^^^^^^
+
+Overflow behavior types follow standard C integer promotion rules while
+preserving the overflow behavior annotation through expressions:
+
+* When an overflow behavior type is mixed with a standard integer type, the
+  result carries the overflow behavior annotation. Standard C conversion rules
+  determine the resulting width and signedness.
+* When two overflow behavior types of the same kind (both ``wrap`` or both
+  ``trap``) are mixed, the result follows standard C arithmetic conversion
+  rules with that behavior applied.
+* When ``wrap`` and ``trap`` are mixed, ``trap`` dominates. The result follows
+  standard C conversions with ``trap`` behavior.
+
+.. code-block:: c
+
+  typedef int __ob_wrap wrap_int;
+  typedef int __ob_trap trap_int;
+
+  wrap_int a = 1;
+  trap_int b = 2;
+  /* a + b results in __ob_trap int (trap dominates) */
+
+
+Type Compatibility
+^^^^^^^^^^^^^^^^^^
+
+Overflow behavior types are distinct from their underlying types for type
+checking purposes. Assigning between types with different overflow behaviors
+(``wrap`` vs ``trap``) is an error:
+
+.. code-block:: c
+
+  int __ob_wrap w;
+  int __ob_trap t;
+  w = t; /* error: incompatible overflow behavior types */
+
+Assigning from an overflow behavior type to a plain integer type discards the
+overflow behavior. The compiler can warn about this with
+``-Wimplicit-overflow-behavior-conversion`` (implied by ``-Wconversion``).
+
+Intentionally discarding the overflow behavior should use an explicit
+cast:
+
+.. code-block:: c
+
+  unsigned long __ob_trap checked_size;
+  unsigned long regular_size;
+
+  regular_size = checked_size; /* warning: discards overflow behavior */
+  regular_size = (unsigned long)checked_size; /* OK, explicit cast */
+
+If truncation should be allowed for a cast away from ``trap``, an
+explicit ``wrap`` cast is needed to suppress run-time instrumentation:
+
+.. code-block:: c
+
+  unsigned long __ob_trap checked_size;
+  unsigned char small_size;
+
+  small_size = checked_size; /* may trap at run-time on truncation */
+  small_size = (unsigned long __ob_wrap)checked_size; /* OK, explicit cast */
+
+
+Pointer Semantics
+^^^^^^^^^^^^^^^^^
+
+Pointers to overflow behavior types are treated as distinct from pointers to
+their underlying types. Converting between them produces a warning controlled
+by ``-Wincompatible-pointer-types-discards-overflow-behavior``:
+
+.. code-block:: c
+
+  unsigned long *px;
+  unsigned long __ob_trap *py;
+
+  px = py; /* warning: discards overflow behavior */
+  py = px; /* warning: discards overflow behavior */
+
+
+Best Practices
+^^^^^^^^^^^^^^
+
+1. **Use ``__ob_trap`` for sizes and counts** where overflow indicates bugs:
+
+   .. code-block:: c
+
+     typedef unsigned long long __ob_trap no_wrap_u64;
+     no_wrap_u64 buffer_len = kmalloc_size + header_size;
+
+2. **Use ``__ob_wrap`` for arithmetic that intentionally overflows**:
+
+   .. code-block:: c
+
+     typedef u32 __ob_wrap hash_t;
+     hash_t hash = (hash * 31) + byte;
+
+3. **Don't mix different overflow behavior types**:
+
+   .. code-block:: c
+
+    int __ob_wrap a;
+    int __ob_trap b;
+
+    a = b; /* error: incompatible overflow behavior types */
+
+    a = (int __ob_wrap)b; /* OK, explicit cast */
+    a = (int)b; /* OK, cast to underlying type */
diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index fed56864d036..1c20f7ff0798 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -109,6 +109,45 @@ For more details, also see array3_size() and flex_array_size(),
 as well as the related check_mul_overflow(), check_add_overflow(),
 check_sub_overflow(), and check_shl_overflow() family of functions.
 
+.. _open_coded_wrap_around:
+
+open-coded intentional arithmetic wrap-around
+---------------------------------------------
+Depending on arithmetic wrap-around without annotations means the
+kernel cannot distinguish between intentional wrap-around and accidental
+wrap-around (when using things like the overflow sanitizers).
+
+For example, where an addition is intended to wrap around::
+
+	magic = counter + rotation;
+
+please use the wrapping_add() helper::
+
+	magic = wrapping_add(int, counter, rotation);
+
+To help minimize needless code churn, the kernel uses overflow idiom exclusions
+(currently only supported by Clang). Some commonly used overflow-dependent code
+patterns will not be instrumented by overflow sanitizers. The currently
+supported patterns are::
+
+	/* wrap-around test */
+	if (var + offset < var) ...
+
+	/* standalone unsigned decrement used in while loop */
+	while(size--)
+
+	/* negated unsigned constants */
+	-1UL;
+	-5U;
+
+In rare cases where helpers aren't available (e.g. in early boot code, etc) but
+overflow instrumentation still needs to be avoided, utilize wrap-around tests
+to check wrap-around outcomes before performing calculations::
+
+  if (var + offset < var) {
+    /* wrap-around has occurred */
+  }
+
 simple_strtol(), simple_strtoll(), simple_strtoul(), simple_strtoull()
 ----------------------------------------------------------------------
 The simple_strtol(), simple_strtoll(),
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index dbd6ea16aca7..620257eca00e 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -111,3 +111,4 @@ developers:
 
    kernel-docs
    deprecated
+   arithmetic-overflow
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index c16d4199bf92..65f57ff378bb 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -396,6 +396,18 @@
 # define __disable_sanitizer_instrumentation
 #endif
 
+/*
+ * Optional: only supported by Clang with -Xclang -experimental-foverflow-behavior-types
+ * passed via CONFIG_OVERFLOW_BEHAVIOR_TYPES. When not available, define empty macros for
+ * the trap/wrap annotations.
+ *
+ * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
+ */
+#if !__has_attribute(overflow_behavior) || !defined(OVERFLOW_BEHAVIOR_TYPES)
+# define __ob_trap
+# define __ob_wrap
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-weak-function-attribute
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-weak-variable-attribute
diff --git a/MAINTAINERS b/MAINTAINERS
index a9f067164203..342a550c25b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19925,6 +19925,7 @@ M:	Justin Stitt <justinstitt@google.com>
 L:	linux-hardening@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
+F:	Documentation/process/arithmetic-overflow.rst
 F:	scripts/integer-wrap-ignore.scl
 F:	scripts/Makefile.obt
 
-- 
2.34.1


