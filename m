Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055B13AF92A
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 01:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhFUXVW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 19:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbhFUXVP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 19:21:15 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E53C061760
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 16:19:00 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id q20-20020a0cf5d40000b029027498137223so3731702qvm.15
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=3H4F55NU/a97Frzuudhi6AfsU/8NQIqR0g56h0PgrJ4=;
        b=IlT5iHwHkCwvh6uYn+ad+nphzhTgSLGZUawwr+EN3103ID7mRMyLhAB2k37ebexrlg
         mZ6YADGfLg3RWnh/8J6dPSafdaIxhryorYpO4WZ65kLsEOtEQOTo678Ff0mBKBa92+lm
         UiPRARdH5oFaJblXeFxxmVtQ8fQLTpbZThalbfLdFxHLa8bgssAoRmkm6lrDVy82h7Rq
         WKj7ZghR225g7nXWC/K2/Ieyhmp5V3kW22O20xS3cdvW+rgCPxLd1sdehk30r0CHfs/Q
         cJQhZT8xOpRClWiQW98bNQtt2q3tWBvLd4NJIGEgbUUlNgcdPP7Jmw4+/8Dn+KLVCdPZ
         J0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3H4F55NU/a97Frzuudhi6AfsU/8NQIqR0g56h0PgrJ4=;
        b=EpnOdaUIC32V8zfG9kI/NCFV1EFgbuUHG4uTxG8zU+XrfC4s9ekDfIyIzj+FQibdsT
         /4wvlVsuKjp5bF3RZ+FFbjmv0J2wAAVQp9GaBkKvRENIbT6S57AQ6KsYCF7F6KUfqhrG
         gUnThsbV+SCGuGIL+JVshnZ4TwX4n8VOiAe/tKDQjLhBdUdzpmD07tFl56bFyWwoyHB8
         NGaLmHtecvZvTJ94LbB6TpufN8x5/qFBSjSGlX7WB4ecjVxKc4/lwaaFYASDWX/PvW18
         l91PT0qb4o+ejX8bFKnvm1y1PHpv+EJ8z6+HtIbV1xBh10S/XxWNEZG+JpgzUnSkgQdH
         4Grw==
X-Gm-Message-State: AOAM532JFAtG5OpxH5mkdmGYG445BPj+fEM21W1RrKTvvw3Iu2JcdjUU
        GSPhbCj//hFjPIZ8OtoGY1CMyGozymBLshh+Qns=
X-Google-Smtp-Source: ABdhPJy/ygCGleZhe+Yae0QNHj25BZbuCifVF1OqrOy3nkTDPiBTaZQUK7dvOsZGIrxFq3N+wJdOoVd1nH+tCsLaVVU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:dfd:ebf9:4ec7:1783])
 (user=ndesaulniers job=sendgmr) by 2002:a25:7a84:: with SMTP id
 v126mr752893ybc.153.1624317539374; Mon, 21 Jun 2021 16:18:59 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:18:22 -0700
In-Reply-To: <20210621231822.2848305-1-ndesaulniers@google.com>
Message-Id: <20210621231822.2848305-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210621231822.2848305-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH v2 3/3] Kconfig: add ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR,
 depend on for GCOV and PGO
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We don't want compiler instrumentation to touch noinstr functions, which
are annotated with the no_profile_instrument_function function
attribute. Add a Kconfig test for this and make PGO and GCOV depend on
it.

If an architecture is using noinstr, it should denote that via this
Kconfig value. That makes Kconfigs that depend on noinstr able to
express dependencies in an architecturally agnostic way.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* Add ARCH_WANTS_NO_INSTR
* Change depdendencies to be !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
  rather than list architectures explicitly, as per Nathan.
* s/no_profile/no_profile_instrument_function/

 arch/Kconfig        | 7 +++++++
 arch/arm64/Kconfig  | 1 +
 arch/s390/Kconfig   | 1 +
 arch/x86/Kconfig    | 1 +
 init/Kconfig        | 3 +++
 kernel/gcov/Kconfig | 1 +
 kernel/pgo/Kconfig  | 3 ++-
 7 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 2b4109b0edee..2113c6b3b801 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -285,6 +285,13 @@ config ARCH_THREAD_STACK_ALLOCATOR
 config ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	bool
 
+config ARCH_WANTS_NO_INSTR
+	bool
+	help
+	  An architecure should select this if the noinstr macro is being used on
+	  functions to denote that the toolchain should avoid instrumenting such
+	  functions and is required for correctness.
+
 config ARCH_32BIT_OFF_T
 	bool
 	depends on !64BIT
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9f1d8566bbf9..39bf982b06f8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -93,6 +93,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANTS_NO_INSTR
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARM_AMBA
 	select ARM_ARCH_TIMER
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index b4c7c34069f8..bd60310f33b9 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -117,6 +117,7 @@ config S390
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
+	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index da43fd046149..7d6a44bb9b0e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -114,6 +114,7 @@ config X86
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_DEFAULT_BPF_JIT	if X86_64
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
+	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANT_HUGE_PMD_SHARE
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_THP_SWAP		if X86_64
diff --git a/init/Kconfig b/init/Kconfig
index 1ea12c64e4c9..31397a7a45fb 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -83,6 +83,9 @@ config TOOLS_SUPPORT_RELR
 config CC_HAS_ASM_INLINE
 	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
 
+config CC_HAS_NO_PROFILE_FN_ATTR
+	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
+
 config CONSTRUCTORS
 	bool
 
diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
index 58f87a3092f3..053447183ac5 100644
--- a/kernel/gcov/Kconfig
+++ b/kernel/gcov/Kconfig
@@ -5,6 +5,7 @@ config GCOV_KERNEL
 	bool "Enable gcov-based kernel profiling"
 	depends on DEBUG_FS
 	depends on !CC_IS_CLANG || CLANG_VERSION >= 110000
+	depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
 	select CONSTRUCTORS
 	default n
 	help
diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
index d2053df1111c..ce7fe04f303d 100644
--- a/kernel/pgo/Kconfig
+++ b/kernel/pgo/Kconfig
@@ -8,7 +8,8 @@ config PGO_CLANG
 	bool "Enable clang's PGO-based kernel profiling"
 	depends on DEBUG_FS
 	depends on ARCH_SUPPORTS_PGO_CLANG
-	depends on CC_IS_CLANG && CLANG_VERSION >= 120000
+	depends on CC_IS_CLANG
+	depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
 	help
 	  This option enables clang's PGO (Profile Guided Optimization) based
 	  code profiling to better optimize the kernel.
-- 
2.32.0.288.g62a8d224e6-goog

