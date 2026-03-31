Return-Path: <linux-kbuild+bounces-12414-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOYqByj7y2mcNAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12414-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:49:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2436D331
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B26733233B7C
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8D3426EB2;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdkrlQsA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D8B425CEA;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975046; cv=none; b=ssbn32sGVB9fHUPiLOpHp/z04s4CCgqO2Bpkf86aaFjQ510cSA/dPFCduhUc/kpI8wvTDkd9O/Hq+Nw8I9OBKyFGCb/CQXy2JhLMGmSzE/RcxfTnNVjedIG6DMAQ1297csx0WDKHWYNDjkyHIMuF2xwCYg+aXBAi3sYuk7AMTjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975046; c=relaxed/simple;
	bh=plwLZu034DP7ALedYET9m5sogF/wKfI7FZsY4DUGFzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hFC66APTRWu1wNVlrwES4bo/SMT+nJCU6IRPKZh53c7VInW25/EMTKyPWxFtw1ywVCCqYrwoa4NWXkVTVdZLXNe0HfHi9mcSfW3gHft8bEz5/98pDcZuG8uY/2LIkVyBNDyyc+Ai/+RP6GNNavb+yZWHe+uA0T1segd7+jpWSuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdkrlQsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DD9C2BCB3;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975046;
	bh=plwLZu034DP7ALedYET9m5sogF/wKfI7FZsY4DUGFzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MdkrlQsA0p/MiNam9XDR7gsxCIMEbTweDp37U1/JLB1BeMqdTH3X9LBvZUX0W9mTk
	 qddN7VdYdP4hyaVjE3EqvuOrGzj8qWKePJcNAPA4evoCgoTMNH0CwDMhdOd0LEeToz
	 NC0susD7dwZTqoSyMwOuEJhQQ/Mpghb1Cjfxum/EoyVIimg0Hf24hdXo2XKQcnQZix
	 MhrLkbqpOjRld78dorgBHb061F1i+YIhJ3ziFRsPHj1Vu7jmRpLhSlljnUOk4pRrBv
	 OvKzJzXY0lEs9NFSCxdEAhpzYGD+lCwo1E1ag6ePR9Hblk4DpUFIeZqNG7TJeLdSH7
	 D8Fd6XSxtRE3w==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/5] hardening: Introduce Overflow Behavior Types support
Date: Tue, 31 Mar 2026 09:37:20 -0700
Message-Id: <20260331163725.2765789-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331163716.work.696-kees@kernel.org>
References: <20260331163716.work.696-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=16204; i=kees@kernel.org; h=from:subject; bh=QyrELgDzPrDq6Kmgo5WNzb34FKfbRuVEzigDIZ2rX8w=; b=owGbwMvMwCVmps19z/KJym7G02pJDJmnfzhe56xflrDBh1uX/25Oyybh7qwLQsvsMjdert4y5 V5SyMU7HaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABN5s5SRobduyvYKCQe92/vP bQ0NMvi8pFlzMq+5p8rqmV379XUaJzD8lRF/IjvZh2HyFGutmuX8By4uEVM1L5/nIbG7gEHXgD+ VFQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12414-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,googlegroups.com:email,szeredi.hu:email]
X-Rspamd-Queue-Id: 63A2436D331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Justin Stitt <justinstitt@google.com>

Replace CONFIG_UBSAN_INTEGER_WRAP with CONFIG_OVERFLOW_BEHAVIOR_TYPES,
which a more distinct implementation of the integer wrapping logic,
with the introduction of the Overflow Behavior Types in Clang 23+. While
this uses sanitizers, it isn't really part of the "undefined behavior"
sanitizer collection (there is nothing "undefined" going on, but the
warn/trap infrastructure is still used for common instrumentation).

As OBTs will be annotated in code, we no longer need type annotation in
the sanitizer SCL file. A build with CONFIG_OVERFLOW_BEHAVIOR_TYPES=y
will result in no new instrumentation being added (as there are no users
of the coming __ob_trap and __ob_wrap annotations yet).

Signed-off-by: Justin Stitt <justinstitt@google.com>
Co-developed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <kasan-dev@googlegroups.com>
---
 lib/Kconfig.ubsan                | 18 ------------
 security/Kconfig.hardening       | 50 +++++++++++++++++++++++++++++++-
 Makefile                         |  1 +
 scripts/basic/Makefile           |  2 +-
 scripts/Makefile.lib             |  7 +++--
 scripts/Makefile.obt             | 28 ++++++++++++++++++
 scripts/Makefile.ubsan           | 10 -------
 scripts/Makefile.warn            |  7 +++++
 scripts/integer-wrap-ignore.scl  |  3 +-
 include/linux/compiler-version.h |  2 +-
 include/linux/sched.h            |  3 +-
 include/linux/ubsan.h            | 12 +++++++-
 lib/ubsan.c                      | 17 ++++++-----
 MAINTAINERS                      |  9 ++++++
 kernel/configs/hardening.config  |  1 -
 15 files changed, 125 insertions(+), 45 deletions(-)
 create mode 100644 scripts/Makefile.obt

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 1ecaae7064d2..666286e0d294 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -116,24 +116,6 @@ config UBSAN_UNREACHABLE
 	  This option enables -fsanitize=unreachable which checks for control
 	  flow reaching an expected-to-be-unreachable position.
 
-config UBSAN_INTEGER_WRAP
-	bool "Perform checking for integer arithmetic wrap-around"
-	# This is very experimental so drop the next line if you really want it
-	depends on BROKEN
-	depends on !COMPILE_TEST
-	depends on $(cc-option,-fsanitize-undefined-ignore-overflow-pattern=all)
-	depends on $(cc-option,-fsanitize=signed-integer-overflow)
-	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
-	depends on $(cc-option,-fsanitize=implicit-signed-integer-truncation)
-	depends on $(cc-option,-fsanitize=implicit-unsigned-integer-truncation)
-	depends on $(cc-option,-fsanitize-ignorelist=/dev/null)
-	help
-	  This option enables all of the sanitizers involved in integer overflow
-	  (wrap-around) mitigation: signed-integer-overflow, unsigned-integer-overflow,
-	  implicit-signed-integer-truncation, and implicit-unsigned-integer-truncation.
-	  This is currently limited only to the size_t type while testing and
-	  compiler development continues.
-
 config UBSAN_BOOL
 	bool "Perform checking for non-boolean values used as boolean"
 	default UBSAN
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 86f8768c63d4..0c9e03c8a5a7 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -211,7 +211,55 @@ config ZERO_CALL_USED_REGS
 
 endmenu
 
-menu "Bounds checking"
+menu "Bounds safety"
+
+config CC_HAS_OVERFLOW_BEHAVIOR_TYPES
+	# Clang 23+
+	depends on CC_IS_CLANG
+	def_bool $(cc-option,-Xclang -fexperimental-overflow-behavior-types)
+
+config OVERFLOW_BEHAVIOR_TYPES
+	bool
+	help
+	  Selected if either OVERFLOW_BEHAVIOR_TYPES_TRAP or
+	  OVERFLOW_BEHAVIOR_TYPES_WARN is chosen.
+
+choice
+	prompt "Perform checking for integer arithmetic wrap-around"
+	default OVERFLOW_BEHAVIOR_TYPES_TRAP if CC_HAS_OVERFLOW_BEHAVIOR_TYPES
+	default OVERFLOW_BEHAVIOR_TYPES_WARN if COMPILE_TEST && CC_HAS_OVERFLOW_BEHAVIOR_TYPES
+	default OVERFLOW_BEHAVIOR_TYPES_NONE
+	help
+	  This option enables Overflow Behavior Types and all of the
+	  sanitizers involved in integer overflow (wrap-around) mitigation:
+	  signed-integer-overflow, unsigned-integer-overflow,
+	  implicit-signed-integer-truncation, implicit-unsigned-integer-truncation,
+	  and implicit-integer-sign-change. Only types (and variables)
+	  annotated with __ob_wrap or __ob_trap will be instrumented by the
+	  compiler.
+
+	config OVERFLOW_BEHAVIOR_TYPES_TRAP
+		bool "Trap when __ob_trap types overflow (mitigate)"
+		depends on CC_HAS_OVERFLOW_BEHAVIOR_TYPES
+		select OVERFLOW_BEHAVIOR_TYPES
+		help
+		  Enables Overflow Behavior Types and traps when __ob_trap
+		  annotated variables overflow or underflow.
+
+	config OVERFLOW_BEHAVIOR_TYPES_WARN
+		bool "Warn when __ob_trap types overflow (informational)"
+		depends on CC_HAS_OVERFLOW_BEHAVIOR_TYPES
+		select OVERFLOW_BEHAVIOR_TYPES
+		help
+		  Enables Overflow Behavior Types and warns when __ob_trap
+		  annotated variables overflow or underflow.
+
+	config OVERFLOW_BEHAVIOR_TYPES_NONE
+		bool "Disable any handling of __ob_trap types (disabled)"
+		help
+		  No special handling of __ob_trap annotated types.
+
+endchoice
 
 config FORTIFY_SOURCE
 	bool "Harden common str/mem functions against buffer overflows"
diff --git a/Makefile b/Makefile
index 2446085983f7..8e7336d22488 100644
--- a/Makefile
+++ b/Makefile
@@ -1123,6 +1123,7 @@ include-$(CONFIG_KASAN)		+= scripts/Makefile.kasan
 include-$(CONFIG_KCSAN)		+= scripts/Makefile.kcsan
 include-$(CONFIG_KMSAN)		+= scripts/Makefile.kmsan
 include-$(CONFIG_UBSAN)		+= scripts/Makefile.ubsan
+include-$(CONFIG_OVERFLOW_BEHAVIOR_TYPES) += scripts/Makefile.obt
 include-$(CONFIG_KCOV)		+= scripts/Makefile.kcov
 include-$(CONFIG_RANDSTRUCT)	+= scripts/Makefile.randstruct
 include-$(CONFIG_KSTACK_ERASE)	+= scripts/Makefile.kstack_erase
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index fb8e2c38fbc7..098760fc403a 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -18,4 +18,4 @@ always-$(CONFIG_RANDSTRUCT) += randstruct.seed
 # integer-wrap: if the .scl file changes, we need to do a full rebuild.
 $(obj)/../../include/generated/integer-wrap.h: $(srctree)/scripts/integer-wrap-ignore.scl FORCE
 	$(call if_changed,touch)
-always-$(CONFIG_UBSAN_INTEGER_WRAP) += ../../include/generated/integer-wrap.h
+always-$(CONFIG_OVERFLOW_BEHAVIOR_TYPES) += ../../include/generated/integer-wrap.h
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0718e39cedda..d0e5cf2b0e3f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -76,9 +76,12 @@ ifeq ($(CONFIG_UBSAN),y)
 _c_flags += $(if $(patsubst n%,, \
 		$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_SANITIZE)$(is-kernel-object)), \
 		$(CFLAGS_UBSAN))
+endif
+
+ifeq ($(CONFIG_OVERFLOW_BEHAVIOR_TYPES),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(UBSAN_INTEGER_WRAP_$(target-stem).o)$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_INTEGER_WRAP)$(UBSAN_SANITIZE)$(is-kernel-object)), \
-		$(CFLAGS_UBSAN_INTEGER_WRAP))
+		$(OVERFLOW_BEHAVIOR_TYPES_$(target-stem).o)$(OVERFLOW_BEHAVIOR_TYPES)$(is-kernel-object)), \
+		$(CFLAGS_OVERFLOW_BEHAVIOR_TYPES))
 endif
 
 ifeq ($(CONFIG_KCOV),y)
diff --git a/scripts/Makefile.obt b/scripts/Makefile.obt
new file mode 100644
index 000000000000..f87f87e148f9
--- /dev/null
+++ b/scripts/Makefile.obt
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# Instead of specifying `all`, let's pick our patterns piecemeal so we aren't
+# blindsided by compiler upgrades.
+OVERFLOW_BEHAVIOR_TYPES_IGNORE_PATTERNS := negated-unsigned-const,$\
+					   unsigned-post-decr-while,$\
+					   add-signed-overflow-test,$\
+					   add-unsigned-overflow-test
+
+OVERFLOW_BEHAVIOR_TYPES_SANITIZERS := signed-integer-overflow,$\
+				      unsigned-integer-overflow,$\
+				      implicit-signed-integer-truncation,$\
+				      implicit-unsigned-integer-truncation,$\
+				      implicit-integer-sign-change
+
+overflow-behavior-types-cflags-$(CONFIG_OVERFLOW_BEHAVIOR_TYPES) +=	 \
+	-DOVERFLOW_BEHAVIOR_TYPES					 \
+	-Xclang -fexperimental-overflow-behavior-types			 \
+	-fsanitize=$(OVERFLOW_BEHAVIOR_TYPES_SANITIZERS)		 \
+	-fsanitize-undefined-ignore-overflow-pattern=$(OVERFLOW_BEHAVIOR_TYPES_IGNORE_PATTERNS) \
+	-fsanitize-ignorelist=$(srctree)/scripts/integer-wrap-ignore.scl \
+	-Wno-incompatible-pointer-types-discards-overflow-behavior
+overflow-behavior-types-cflags-$(CONFIG_OVERFLOW_BEHAVIOR_TYPES_WARN) += \
+	-fno-sanitize-trap=$(OVERFLOW_BEHAVIOR_TYPES_SANITIZERS)
+overflow-behavior-types-cflags-$(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP) += \
+	-fsanitize-trap=$(OVERFLOW_BEHAVIOR_TYPES_SANITIZERS)
+
+export CFLAGS_OVERFLOW_BEHAVIOR_TYPES := $(overflow-behavior-types-cflags-y)
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 734a102e6b56..fb49302078e5 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -16,13 +16,3 @@ ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
 ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(CFLAGS_UBSAN_TRAP)
 
 export CFLAGS_UBSAN := $(ubsan-cflags-y)
-
-ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
-	-DINTEGER_WRAP						\
-	-fsanitize-undefined-ignore-overflow-pattern=all	\
-	-fsanitize=signed-integer-overflow			\
-	-fsanitize=unsigned-integer-overflow			\
-	-fsanitize=implicit-signed-integer-truncation		\
-	-fsanitize=implicit-unsigned-integer-truncation		\
-	-fsanitize-ignorelist=$(srctree)/scripts/integer-wrap-ignore.scl
-export CFLAGS_UBSAN_INTEGER_WRAP := $(ubsan-integer-wrap-cflags-y)
diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
index 5567da6c7dfe..eae0ecb88da4 100644
--- a/scripts/Makefile.warn
+++ b/scripts/Makefile.warn
@@ -49,6 +49,13 @@ KBUILD_CFLAGS += $(call cc-option, -Wno-format-truncation-non-kprintf)
 # because -Wuninitialized will still flag when an uninitialized const variable
 # is used.
 KBUILD_CFLAGS += $(call cc-option, -Wno-default-const-init-unsafe)
+
+# Clang with Overflow Behavior Types support but building a kernel without
+# CONFIG_OVERFLOW_BEHAVIOR_TYPES needs to explicitly ignore the attribute.
+ifndef CONFIG_OVERFLOW_BEHAVIOR_TYPES
+KBUILD_CFLAGS += $(call cc-option, -Wno-overflow-behavior-attribute-ignored)
+endif
+
 else
 
 # gcc inanely warns about local variables called 'main'
diff --git a/scripts/integer-wrap-ignore.scl b/scripts/integer-wrap-ignore.scl
index 431c3053a4a2..8168d376ffff 100644
--- a/scripts/integer-wrap-ignore.scl
+++ b/scripts/integer-wrap-ignore.scl
@@ -1,3 +1,2 @@
-[{unsigned-integer-overflow,signed-integer-overflow,implicit-signed-integer-truncation,implicit-unsigned-integer-truncation}]
+[{unsigned-integer-overflow,signed-integer-overflow,implicit-signed-integer-truncation,implicit-unsigned-integer-truncation,implicit-integer-sign-change}]
 type:*
-type:size_t=sanitize
diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index ac1665a98a15..20033781ff15 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -39,6 +39,6 @@
  * may have changed, which may impact the expected behaviors that should
  * not differ between compilation units.
  */
-#ifdef INTEGER_WRAP
+#ifdef OVERFLOW_BEHAVIOR_TYPES
 #include <generated/integer-wrap.h>
 #endif
diff --git a/include/linux/sched.h b/include/linux/sched.h
index a7b4a980eb2f..d3e2ae0e2fe4 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -48,6 +48,7 @@
 #include <linux/uidgid_types.h>
 #include <linux/tracepoint-defs.h>
 #include <linux/unwind_deferred_types.h>
+#include <linux/ubsan.h>
 #include <asm/kmap_size.h>
 #include <linux/time64.h>
 #ifndef COMPILE_OFFSETS
@@ -1271,7 +1272,7 @@ struct task_struct {
 	struct held_lock		held_locks[MAX_LOCK_DEPTH];
 #endif
 
-#if defined(CONFIG_UBSAN) && !defined(CONFIG_UBSAN_TRAP)
+#ifdef NEED_SANITIZER_WARN_HANDLER
 	unsigned int			in_ubsan;
 #endif
 
diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
index 3ab8d38aedb8..7fedff0cdf8e 100644
--- a/include/linux/ubsan.h
+++ b/include/linux/ubsan.h
@@ -2,7 +2,17 @@
 #ifndef _LINUX_UBSAN_H
 #define _LINUX_UBSAN_H
 
-#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
+#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2) || \
+    defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP)
+# define NEED_SANITIZER_TRAP_HANDLER
+#endif
+
+#if (defined(CONFIG_UBSAN) && !defined(CONFIG_UBSAN_TRAP)) || \
+    defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES_WARN)
+# define NEED_SANITIZER_WARN_HANDLER
+#endif
+
+#ifdef NEED_SANITIZER_TRAP_HANDLER
 const char *report_ubsan_failure(u32 check_type);
 #else
 static inline const char *report_ubsan_failure(u32 check_type)
diff --git a/lib/ubsan.c b/lib/ubsan.c
index 456e3dd8f4ea..19edb5cedb5a 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -19,7 +19,7 @@
 
 #include "ubsan.h"
 
-#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
+#ifdef NEED_SANITIZER_TRAP_HANDLER
 /*
  * Only include matches for UBSAN checks that are actually compiled in.
  * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
@@ -44,7 +44,7 @@ const char *report_ubsan_failure(u32 check_type)
 	case ubsan_shift_out_of_bounds:
 		return "UBSAN: shift out of bounds";
 #endif
-#if defined(CONFIG_UBSAN_DIV_ZERO) || defined(CONFIG_UBSAN_INTEGER_WRAP)
+#if defined(CONFIG_UBSAN_DIV_ZERO) || defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES)
 	/*
 	 * SanitizerKind::IntegerDivideByZero and
 	 * SanitizerKind::SignedIntegerOverflow emit
@@ -79,7 +79,7 @@ const char *report_ubsan_failure(u32 check_type)
 	case ubsan_type_mismatch:
 		return "UBSAN: type mismatch";
 #endif
-#ifdef CONFIG_UBSAN_INTEGER_WRAP
+#ifdef CONFIG_OVERFLOW_BEHAVIOR_TYPES
 	/*
 	 * SanitizerKind::SignedIntegerOverflow emits
 	 * SanitizerHandler::AddOverflow, SanitizerHandler::SubOverflow,
@@ -91,15 +91,18 @@ const char *report_ubsan_failure(u32 check_type)
 		return "UBSAN: integer subtraction overflow";
 	case ubsan_mul_overflow:
 		return "UBSAN: integer multiplication overflow";
+	case ubsan_implicit_conversion:
+		return "UBSAN: integer truncation";
+	case ubsan_negate_overflow:
+		return "UBSAN: negation overflow";
 #endif
 	default:
 		return "UBSAN: unrecognized failure code";
 	}
 }
+#endif /* NEED_SANITIZER_TRAP_HANDLER */
 
-#endif
-
-#ifndef CONFIG_UBSAN_TRAP
+#ifdef NEED_SANITIZER_WARN_HANDLER
 static const char * const type_check_kinds[] = {
 	"load of",
 	"store to",
@@ -558,4 +561,4 @@ void __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
 }
 EXPORT_SYMBOL(__ubsan_handle_alignment_assumption);
 
-#endif /* !CONFIG_UBSAN_TRAP */
+#endif /* NEED_SANITIZER_WARN_HANDLER */
diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c..a9f067164203 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19919,6 +19919,15 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
 F:	drivers/media/i2c/ov2659.c
 F:	include/media/i2c/ov2659.h
 
+OVERFLOW BEHAVIOR TYPES
+M:	Kees Cook <kees@kernel.org>
+M:	Justin Stitt <justinstitt@google.com>
+L:	linux-hardening@vger.kernel.org
+S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
+F:	scripts/integer-wrap-ignore.scl
+F:	scripts/Makefile.obt
+
 OVERLAY FILESYSTEM
 M:	Miklos Szeredi <miklos@szeredi.hu>
 M:	Amir Goldstein <amir73il@gmail.com>
diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
index 7c3924614e01..aabe28005a3d 100644
--- a/kernel/configs/hardening.config
+++ b/kernel/configs/hardening.config
@@ -46,7 +46,6 @@ CONFIG_UBSAN_BOUNDS=y
 # CONFIG_UBSAN_SHIFT is not set
 # CONFIG_UBSAN_DIV_ZERO is not set
 # CONFIG_UBSAN_UNREACHABLE is not set
-# CONFIG_UBSAN_INTEGER_WRAP is not set
 # CONFIG_UBSAN_BOOL is not set
 # CONFIG_UBSAN_ENUM is not set
 # CONFIG_UBSAN_ALIGNMENT is not set
-- 
2.34.1


