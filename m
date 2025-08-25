Return-Path: <linux-kbuild+bounces-8573-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47DB343CF
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 16:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D2B23AAF34
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 14:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1FD2FCC0E;
	Mon, 25 Aug 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swxeKeQ+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0F2FC88E;
	Mon, 25 Aug 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131964; cv=none; b=BKm1Siltg8H4/uHPKjbdVz099KV2+MI86lz8yoq4fbl10/e2M2VpvA3GkAy8FhGBkOIWiPJwpZrvT4yv84yzHUgCxpoOO786evfF/pD2Rxuiw62myI1JSqMwreKFWqRtGz8xkejHQ9+nafAWaooqPl8SKW6CcBKoAlek+b2/N4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131964; c=relaxed/simple;
	bh=Q+gRJpg5hXP6uGH96y1InY0qAIKQeD++o9khfoIaIdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uSlN7SbPB6SeatlnNYxCrvc/lxvpWEIcVxD/ikDC3INptDHDFJsRzX4SuIjkyu9q5vHaU9L25pyE4rkIzR1icyq9CoHnEOFcEPxO0Pw9HblqsGh0yKm+TBfJQ265itHyminXC8FNkpBU2vbafGa4c1fnKotJ/xnTX4G6XejGqlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swxeKeQ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC750C2BCB0;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131964;
	bh=Q+gRJpg5hXP6uGH96y1InY0qAIKQeD++o9khfoIaIdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=swxeKeQ+ssCfMLesuTRdKjYne2svPZDtvnT05RetpO2bS4C1DilOLTBd5QXcstZ0i
	 2V8yle2fpBAi0QG3QOFSjCTspfGkJprvcfQ7mHlVey9No/4kMhcKUW+elKKruQa2BF
	 Q5GjPLPkvidPIXs6Pb0Y+UTC9GF8LFIe1rK22RvQf7cTKlY88twfpRv+1IOBgC9asZ
	 vaKVW8ooDp99U+RdpNyb5uq3Smcw5eDYpw9EMqWh0PmW2DNQgwbRhwsjcwInvwQIM6
	 4sFHH+xwYchuEaBByqm6uww4Ds8vNLZED7kLf5T74zxL/Ka1Jf7k9AusCeFx9ugrTL
	 0y/vRo5Hto6Eg==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Date: Mon, 25 Aug 2025 07:25:52 -0700
Message-Id: <20250825142603.1907143-5-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
References: <20250825141316.work.967-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kees Cook <kees@outflux.net>

The kernel's CFI implementation uses the KCFI ABI specifically, and is
not strictly tied to a particular compiler. In preparation for GCC
supporting KCFI[1], rename CONFIG_CFI_CLANG to CONFIG_CFI (along with
associated options).

Link: https://lore.kernel.org/linux-hardening/20250821064202.work.893-kees@kernel.org [1]
Signed-off-by: Kees Cook <kees@outflux.net>
---
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Puranjay Mohan <puranjay@kernel.org>
---
 arch/Kconfig                            | 22 +++++++++++-----------
 arch/arm/Kconfig                        |  2 +-
 arch/arm64/Kconfig                      |  4 ++--
 arch/riscv/Kconfig                      |  6 +++---
 arch/x86/Kconfig                        | 12 ++++++------
 init/Kconfig                            |  4 ++--
 kernel/module/Kconfig                   |  2 +-
 lib/Kconfig.debug                       |  2 +-
 Makefile                                |  2 +-
 arch/arm/mm/Makefile                    |  2 +-
 arch/riscv/kernel/Makefile              |  2 +-
 arch/riscv/purgatory/Makefile           |  2 +-
 arch/x86/kernel/Makefile                |  2 +-
 arch/x86/purgatory/Makefile             |  2 +-
 kernel/Makefile                         |  2 +-
 arch/riscv/include/asm/cfi.h            |  4 ++--
 arch/x86/include/asm/cfi.h              |  4 ++--
 include/asm-generic/vmlinux.lds.h       |  2 +-
 include/linux/cfi.h                     |  6 +++---
 include/linux/cfi_types.h               |  8 ++++----
 include/linux/compiler.h                |  2 +-
 include/linux/compiler_types.h          |  2 +-
 tools/include/linux/cfi_types.h         |  6 +++---
 tools/perf/util/include/linux/linkage.h |  2 +-
 arch/arm/mm/cache-fa.S                  |  2 +-
 arch/arm/mm/cache-v4.S                  |  2 +-
 arch/arm/mm/cache-v4wb.S                |  4 ++--
 arch/arm/mm/cache-v4wt.S                |  2 +-
 arch/arm/mm/cache-v6.S                  |  2 +-
 arch/arm/mm/cache-v7.S                  |  2 +-
 arch/arm/mm/cache-v7m.S                 |  2 +-
 arch/arm/mm/proc-arm1020.S              |  2 +-
 arch/arm/mm/proc-arm1020e.S             |  2 +-
 arch/arm/mm/proc-arm1022.S              |  2 +-
 arch/arm/mm/proc-arm1026.S              |  2 +-
 arch/arm/mm/proc-arm920.S               |  2 +-
 arch/arm/mm/proc-arm922.S               |  2 +-
 arch/arm/mm/proc-arm925.S               |  2 +-
 arch/arm/mm/proc-arm926.S               |  2 +-
 arch/arm/mm/proc-arm940.S               |  2 +-
 arch/arm/mm/proc-arm946.S               |  2 +-
 arch/arm/mm/proc-feroceon.S             |  2 +-
 arch/arm/mm/proc-mohawk.S               |  2 +-
 arch/arm/mm/proc-xsc3.S                 |  2 +-
 arch/arm/mm/tlb-v4.S                    |  2 +-
 arch/arm/kernel/hw_breakpoint.c         |  2 +-
 arch/arm64/kernel/debug-monitors.c      |  2 +-
 arch/arm64/kernel/traps.c               |  4 ++--
 arch/arm64/kvm/handle_exit.c            |  2 +-
 arch/arm64/net/bpf_jit_comp.c           |  2 +-
 arch/riscv/net/bpf_jit_comp64.c         |  4 ++--
 arch/x86/kernel/alternative.c           |  4 ++--
 arch/x86/kernel/kprobes/core.c          |  2 +-
 drivers/misc/lkdtm/cfi.c                |  2 +-
 kernel/module/tree_lookup.c             |  2 +-
 kernel/configs/hardening.config         |  2 +-
 56 files changed, 88 insertions(+), 88 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index d1b4ffd6e085..c25a45d9aa96 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -867,7 +867,7 @@ config PROPELLER_CLANG
 
 	  If unsure, say N.
 
-config ARCH_SUPPORTS_CFI_CLANG
+config ARCH_SUPPORTS_CFI
 	bool
 	help
 	  An architecture should select this option if it can support Clang's
@@ -876,13 +876,13 @@ config ARCH_SUPPORTS_CFI_CLANG
 config ARCH_USES_CFI_TRAPS
 	bool
 
-config CFI_CLANG
-	bool "Use Clang's Control Flow Integrity (CFI)"
-	depends on ARCH_SUPPORTS_CFI_CLANG
+config CFI
+	bool "Use Kernel Control Flow Integrity (kCFI)"
+	depends on ARCH_SUPPORTS_CFI
 	depends on $(cc-option,-fsanitize=kcfi)
 	help
-	  This option enables Clang's forward-edge Control Flow Integrity
-	  (CFI) checking, where the compiler injects a runtime check to each
+	  This option enables forward-edge Control Flow Integrity (CFI)
+	  checking, where the compiler injects a runtime check to each
 	  indirect function call to ensure the target is a valid function with
 	  the correct static type. This restricts possible call targets and
 	  makes it more difficult for an attacker to exploit bugs that allow
@@ -893,8 +893,8 @@ config CFI_CLANG
 
 config CFI_ICALL_NORMALIZE_INTEGERS
 	bool "Normalize CFI tags for integers"
-	depends on CFI_CLANG
-	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
+	depends on CFI
+	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
 	help
 	  This option normalizes the CFI tags for integer types so that all
 	  integer types of the same size and signedness receive the same CFI
@@ -907,7 +907,7 @@ config CFI_ICALL_NORMALIZE_INTEGERS
 
 	  This option is necessary for using CFI with Rust. If unsure, say N.
 
-config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
+config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
 	def_bool y
 	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
 	# With GCOV/KASAN we need this fix: https://github.com/llvm/llvm-project/pull/104826
@@ -915,7 +915,7 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
 
 config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	def_bool y
-	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
+	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
 	depends on RUSTC_VERSION >= 107900
 	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull/129373
 	depends on (RUSTC_LLVM_VERSION >= 190103 && RUSTC_VERSION >= 108200) || \
@@ -923,7 +923,7 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 
 config CFI_PERMISSIVE
 	bool "Use CFI in permissive mode"
-	depends on CFI_CLANG
+	depends on CFI
 	help
 	  When selected, Control Flow Integrity (CFI) violations result in a
 	  warning instead of a kernel panic. This option should only be used
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b1f3df39ed40..36ab8625be72 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -38,7 +38,7 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_NEED_CMPXCHG_1_EMU if CPU_V6
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	select ARCH_SUPPORTS_CFI_CLANG
+	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a6..1e38b8885a46 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -100,7 +100,7 @@ config ARM64
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
 	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
-	select ARCH_SUPPORTS_CFI_CLANG
+	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
@@ -212,7 +212,7 @@ config ARM64
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
 		if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CALL_OPS
 	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
-		if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG && \
+		if (DYNAMIC_FTRACE_WITH_ARGS && !CFI && \
 		    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
 	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY \
 		if DYNAMIC_FTRACE_WITH_ARGS
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4b233a0659e..6043ad82b73c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -60,7 +60,7 @@ config RISCV
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	# clang >= 17: https://github.com/llvm/llvm-project/commit/62fa708ceb027713b386c7e0efda994f8bdc27e2
-	select ARCH_SUPPORTS_CFI_CLANG if CLANG_VERSION >= 170000
+	select ARCH_SUPPORTS_CFI if (!CC_IS_CLANG || CLANG_VERSION >= 170000)
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
@@ -76,7 +76,7 @@ config RISCV
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_SYM_ANNOTATIONS
-	select ARCH_USES_CFI_TRAPS if CFI_CLANG
+	select ARCH_USES_CFI_TRAPS if CFI
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if MMU
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
@@ -154,7 +154,7 @@ config RISCV
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
 	select FUNCTION_ALIGNMENT_4B if HAVE_DYNAMIC_FTRACE && RISCV_ISA_C
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS if HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
-	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG)
+	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_WITH_ARGS && !CFI)
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_GRAPH_FUNC
 	select HAVE_FUNCTION_GRAPH_TRACER if HAVE_DYNAMIC_FTRACE_WITH_ARGS
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58d890fe2100..b6da2d37cfd1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -127,8 +127,8 @@ config X86
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK	if X86_64
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
-	select ARCH_SUPPORTS_CFI_CLANG		if X86_64
-	select ARCH_USES_CFI_TRAPS		if X86_64 && CFI_CLANG
+	select ARCH_SUPPORTS_CFI		if X86_64
+	select ARCH_USES_CFI_TRAPS		if X86_64 && CFI
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_RT
@@ -2396,11 +2396,11 @@ config FUNCTION_PADDING_CFI
 	default  3 if FUNCTION_ALIGNMENT_8B
 	default  0
 
-# Basically: FUNCTION_ALIGNMENT - 5*CFI_CLANG
+# Basically: FUNCTION_ALIGNMENT - 5*CFI
 # except Kconfig can't do arithmetic :/
 config FUNCTION_PADDING_BYTES
 	int
-	default FUNCTION_PADDING_CFI if CFI_CLANG
+	default FUNCTION_PADDING_CFI if CFI
 	default FUNCTION_ALIGNMENT
 
 config CALL_PADDING
@@ -2410,7 +2410,7 @@ config CALL_PADDING
 
 config FINEIBT
 	def_bool y
-	depends on X86_KERNEL_IBT && CFI_CLANG && MITIGATION_RETPOLINE
+	depends on X86_KERNEL_IBT && CFI && MITIGATION_RETPOLINE
 	select CALL_PADDING
 
 config FINEIBT_BHI
@@ -2427,7 +2427,7 @@ config CALL_THUNKS
 
 config PREFIX_SYMBOLS
 	def_bool y
-	depends on CALL_PADDING && !CFI_CLANG
+	depends on CALL_PADDING && !CFI
 
 menuconfig CPU_MITIGATIONS
 	bool "Mitigations for CPU vulnerabilities"
diff --git a/init/Kconfig b/init/Kconfig
index 836320251219..67f10d8a33b7 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2063,8 +2063,8 @@ config RUST
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || (PAHOLE_HAS_LANG_EXCLUDE && !LTO)
-	depends on !CFI_CLANG || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
-	select CFI_ICALL_NORMALIZE_INTEGERS if CFI_CLANG
+	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
+	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
 	depends on !KASAN_SW_TAGS
 	depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 39278737bb68..2a1beebf1d37 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -460,6 +460,6 @@ config UNUSED_KSYMS_WHITELIST
 
 config MODULES_TREE_LOOKUP
 	def_bool y
-	depends on PERF_EVENTS || TRACING || CFI_CLANG
+	depends on PERF_EVENTS || TRACING || CFI
 
 endif # MODULES
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index dc0e0c6ed075..e3e69df19e78 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2894,7 +2894,7 @@ config FORTIFY_KUNIT_TEST
 config LONGEST_SYM_KUNIT_TEST
 	tristate "Test the longest symbol possible" if !KUNIT_ALL_TESTS
 	depends on KUNIT && KPROBES
-	depends on !PREFIX_SYMBOLS && !CFI_CLANG && !GCOV_KERNEL
+	depends on !PREFIX_SYMBOLS && !CFI && !GCOV_KERNEL
 	default KUNIT_ALL_TESTS
 	help
 	  Tests the longest symbol possible
diff --git a/Makefile b/Makefile
index d1adb78c3596..437989d6e0be 100644
--- a/Makefile
+++ b/Makefile
@@ -1020,7 +1020,7 @@ KBUILD_AFLAGS	+= -fno-lto
 export CC_FLAGS_LTO
 endif
 
-ifdef CONFIG_CFI_CLANG
+ifdef CONFIG_CFI
 CC_FLAGS_CFI	:= -fsanitize=kcfi
 ifdef CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
 	CC_FLAGS_CFI	+= -fsanitize-cfi-icall-experimental-normalize-integers
diff --git a/arch/arm/mm/Makefile b/arch/arm/mm/Makefile
index a195cd1d3e6d..1e2201013371 100644
--- a/arch/arm/mm/Makefile
+++ b/arch/arm/mm/Makefile
@@ -89,7 +89,7 @@ obj-$(CONFIG_CPU_V6)		+= proc-v6.o
 obj-$(CONFIG_CPU_V6K)		+= proc-v6.o
 obj-$(CONFIG_CPU_V7)		+= proc-v7.o proc-v7-bugs.o
 obj-$(CONFIG_CPU_V7M)		+= proc-v7m.o
-obj-$(CONFIG_CFI_CLANG)		+= proc.o
+obj-$(CONFIG_CFI)		+= proc.o
 
 obj-$(CONFIG_OUTER_CACHE)	+= l2c-common.o
 obj-$(CONFIG_CACHE_B15_RAC)	+= cache-b15-rac.o
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index c7b542573407..f60fce69b725 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -113,7 +113,7 @@ obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
 
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
-obj-$(CONFIG_CFI_CLANG)		+= cfi.o
+obj-$(CONFIG_CFI)		+= cfi.o
 
 obj-$(CONFIG_EFI)		+= efi.o
 obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index 240592e3f5c2..530e497ca2f9 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -71,7 +71,7 @@ ifdef CONFIG_STACKPROTECTOR_STRONG
 PURGATORY_CFLAGS_REMOVE		+= -fstack-protector-strong
 endif
 
-ifdef CONFIG_CFI_CLANG
+ifdef CONFIG_CFI
 PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_CFI)
 endif
 
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 0d2a6d953be9..bc184dd38d99 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -148,7 +148,7 @@ obj-$(CONFIG_UNWINDER_ORC)		+= unwind_orc.o
 obj-$(CONFIG_UNWINDER_FRAME_POINTER)	+= unwind_frame.o
 obj-$(CONFIG_UNWINDER_GUESS)		+= unwind_guess.o
 
-obj-$(CONFIG_CFI_CLANG)			+= cfi.o
+obj-$(CONFIG_CFI)			+= cfi.o
 
 obj-$(CONFIG_CALL_THUNKS)		+= callthunks.o
 
diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index e0a607a14e7e..5ce1d4263000 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -57,7 +57,7 @@ ifdef CONFIG_MITIGATION_RETPOLINE
 PURGATORY_CFLAGS_REMOVE		+= $(RETPOLINE_CFLAGS)
 endif
 
-ifdef CONFIG_CFI_CLANG
+ifdef CONFIG_CFI
 PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_CFI)
 endif
 
diff --git a/kernel/Makefile b/kernel/Makefile
index c60623448235..27e0e6a33610 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -122,7 +122,7 @@ obj-$(CONFIG_KCSAN) += kcsan/
 obj-$(CONFIG_SHADOW_CALL_STACK) += scs.o
 obj-$(CONFIG_HAVE_STATIC_CALL) += static_call.o
 obj-$(CONFIG_HAVE_STATIC_CALL_INLINE) += static_call_inline.o
-obj-$(CONFIG_CFI_CLANG) += cfi.o
+obj-$(CONFIG_CFI) += cfi.o
 
 obj-$(CONFIG_PERF_EVENTS) += events/
 
diff --git a/arch/riscv/include/asm/cfi.h b/arch/riscv/include/asm/cfi.h
index 4508aaa7a2fd..710aa8192edd 100644
--- a/arch/riscv/include/asm/cfi.h
+++ b/arch/riscv/include/asm/cfi.h
@@ -11,7 +11,7 @@
 
 struct pt_regs;
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
 #define __bpfcall
 #else
@@ -19,6 +19,6 @@ static inline enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
 {
 	return BUG_TRAP_TYPE_NONE;
 }
-#endif /* CONFIG_CFI_CLANG */
+#endif /* CONFIG_CFI */
 
 #endif /* _ASM_RISCV_CFI_H */
diff --git a/arch/x86/include/asm/cfi.h b/arch/x86/include/asm/cfi.h
index 1751f1eb95ef..976b90a3d190 100644
--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -113,7 +113,7 @@ extern bhi_thunk __bhi_args_end[];
 
 struct pt_regs;
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
 #define __bpfcall
 
@@ -157,7 +157,7 @@ static inline int cfi_get_func_arity(void *func)
 {
 	return 0;
 }
-#endif /* CONFIG_CFI_CLANG */
+#endif /* CONFIG_CFI */
 
 #if HAS_KERNEL_IBT == 1
 #define CFI_NOSEAL(x)	asm(IBT_NOSEAL(__stringify(x)))
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ae2d2359b79e..a65a87366c48 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -157,7 +157,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 #define PATCHABLE_DISCARDS	*(__patchable_function_entries)
 #endif
 
-#ifndef CONFIG_ARCH_SUPPORTS_CFI_CLANG
+#ifndef CONFIG_ARCH_SUPPORTS_CFI
 /*
  * Simply points to ftrace_stub, but with the proper protocol.
  * Defined by the linker script in linux/vmlinux.lds.h
diff --git a/include/linux/cfi.h b/include/linux/cfi.h
index 52a98886a455..1fd22ea6eba4 100644
--- a/include/linux/cfi.h
+++ b/include/linux/cfi.h
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <asm/cfi.h>
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 extern bool cfi_warn;
 
 enum bug_trap_type report_cfi_failure(struct pt_regs *regs, unsigned long addr,
@@ -52,7 +52,7 @@ static inline u32 cfi_get_func_hash(void *func)
 extern u32 cfi_bpf_hash;
 extern u32 cfi_bpf_subprog_hash;
 
-#else /* CONFIG_CFI_CLANG */
+#else /* CONFIG_CFI */
 
 static inline int cfi_get_offset(void) { return 0; }
 static inline u32 cfi_get_func_hash(void *func) { return 0; }
@@ -60,7 +60,7 @@ static inline u32 cfi_get_func_hash(void *func) { return 0; }
 #define cfi_bpf_hash 0U
 #define cfi_bpf_subprog_hash 0U
 
-#endif /* CONFIG_CFI_CLANG */
+#endif /* CONFIG_CFI */
 
 #ifdef CONFIG_ARCH_USES_CFI_TRAPS
 bool is_cfi_trap(unsigned long addr);
diff --git a/include/linux/cfi_types.h b/include/linux/cfi_types.h
index 685f7181780f..a86af9bc8bdc 100644
--- a/include/linux/cfi_types.h
+++ b/include/linux/cfi_types.h
@@ -8,7 +8,7 @@
 #ifdef __ASSEMBLY__
 #include <linux/linkage.h>
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 /*
  * Use the __kcfi_typeid_<function> type identifier symbol to
  * annotate indirectly called assembly functions. The compiler emits
@@ -29,12 +29,12 @@
 #define SYM_TYPED_START(name, linkage, align...)	\
 	SYM_TYPED_ENTRY(name, linkage, align)
 
-#else /* CONFIG_CFI_CLANG */
+#else /* CONFIG_CFI */
 
 #define SYM_TYPED_START(name, linkage, align...)	\
 	SYM_START(name, linkage, align)
 
-#endif /* CONFIG_CFI_CLANG */
+#endif /* CONFIG_CFI */
 
 #ifndef SYM_TYPED_FUNC_START
 #define SYM_TYPED_FUNC_START(name) 			\
@@ -43,7 +43,7 @@
 
 #else /* __ASSEMBLY__ */
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 #define DEFINE_CFI_TYPE(name, func)						\
 	/*									\
 	 * Force a reference to the function so the compiler generates		\
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 6f04a1d8c720..fb27da2221ee 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -248,7 +248,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 
 #endif /* __KERNEL__ */
 
-#if defined(CONFIG_CFI_CLANG) && !defined(__DISABLE_EXPORTS) && !defined(BUILD_VDSO)
+#if defined(CONFIG_CFI) && !defined(__DISABLE_EXPORTS) && !defined(BUILD_VDSO)
 /*
  * Force a reference to the external symbol so the compiler generates
  * __kcfi_typid.
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index a910f9fa5341..27026752aec8 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -432,7 +432,7 @@ struct ftrace_likely_data {
 # define __noscs
 #endif
 
-#if defined(CONFIG_CFI_CLANG)
+#if defined(CONFIG_CFI)
 # define __nocfi		__attribute__((__no_sanitize__("kcfi")))
 #else
 # define __nocfi
diff --git a/tools/include/linux/cfi_types.h b/tools/include/linux/cfi_types.h
index 6b8713675765..2e098274e45c 100644
--- a/tools/include/linux/cfi_types.h
+++ b/tools/include/linux/cfi_types.h
@@ -8,7 +8,7 @@
 #ifdef __ASSEMBLY__
 #include <linux/linkage.h>
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 /*
  * Use the __kcfi_typeid_<function> type identifier symbol to
  * annotate indirectly called assembly functions. The compiler emits
@@ -29,12 +29,12 @@
 #define SYM_TYPED_START(name, linkage, align...)	\
 	SYM_TYPED_ENTRY(name, linkage, align)
 
-#else /* CONFIG_CFI_CLANG */
+#else /* CONFIG_CFI */
 
 #define SYM_TYPED_START(name, linkage, align...)	\
 	SYM_START(name, linkage, align)
 
-#endif /* CONFIG_CFI_CLANG */
+#endif /* CONFIG_CFI */
 
 #ifndef SYM_TYPED_FUNC_START
 #define SYM_TYPED_FUNC_START(name) 			\
diff --git a/tools/perf/util/include/linux/linkage.h b/tools/perf/util/include/linux/linkage.h
index 89979ca23c3f..34e2fdfe7300 100644
--- a/tools/perf/util/include/linux/linkage.h
+++ b/tools/perf/util/include/linux/linkage.h
@@ -120,7 +120,7 @@
 #endif
 
 // In the kernel sources (include/linux/cfi_types.h), this has a different
-// definition when CONFIG_CFI_CLANG is used, for tools/ just use the !clang
+// definition when CONFIG_CFI is used, for tools/ just use the !cfi
 // definition:
 #ifndef SYM_TYPED_START
 #define SYM_TYPED_START(name, linkage, align...)        \
diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index 4a3668b52a2d..e1641799569b 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -112,7 +112,7 @@ SYM_FUNC_END(fa_flush_user_cache_range)
  *	- end	 - virtual end address
  */
 SYM_TYPED_FUNC_START(fa_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	fa_coherent_user_range
 #endif
 SYM_FUNC_END(fa_coherent_kern_range)
diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
index 0e94e5193dbd..001d7042bd46 100644
--- a/arch/arm/mm/cache-v4.S
+++ b/arch/arm/mm/cache-v4.S
@@ -104,7 +104,7 @@ SYM_FUNC_END(v4_coherent_user_range)
  *	- size	- region size
  */
 SYM_TYPED_FUNC_START(v4_flush_kern_dcache_area)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	v4_dma_flush_range
 #endif
 SYM_FUNC_END(v4_flush_kern_dcache_area)
diff --git a/arch/arm/mm/cache-v4wb.S b/arch/arm/mm/cache-v4wb.S
index ce55a2eef5da..874fe5310f9a 100644
--- a/arch/arm/mm/cache-v4wb.S
+++ b/arch/arm/mm/cache-v4wb.S
@@ -136,7 +136,7 @@ SYM_FUNC_END(v4wb_flush_user_cache_range)
  */
 SYM_TYPED_FUNC_START(v4wb_flush_kern_dcache_area)
 	add	r1, r0, r1
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	v4wb_coherent_user_range
 #endif
 SYM_FUNC_END(v4wb_flush_kern_dcache_area)
@@ -152,7 +152,7 @@ SYM_FUNC_END(v4wb_flush_kern_dcache_area)
  *	- end	 - virtual end address
  */
 SYM_TYPED_FUNC_START(v4wb_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	v4wb_coherent_user_range
 #endif
 SYM_FUNC_END(v4wb_coherent_kern_range)
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index a97dc267b3b0..2ee62e4b2b07 100644
--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -108,7 +108,7 @@ SYM_FUNC_END(v4wt_flush_user_cache_range)
  *	- end	 - virtual end address
  */
 SYM_TYPED_FUNC_START(v4wt_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	v4wt_coherent_user_range
 #endif
 SYM_FUNC_END(v4wt_coherent_kern_range)
diff --git a/arch/arm/mm/cache-v6.S b/arch/arm/mm/cache-v6.S
index 9f415476e218..5ceea8965ea1 100644
--- a/arch/arm/mm/cache-v6.S
+++ b/arch/arm/mm/cache-v6.S
@@ -117,7 +117,7 @@ SYM_FUNC_END(v6_flush_user_cache_range)
  *	- the Icache does not read data from the write buffer
  */
 SYM_TYPED_FUNC_START(v6_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	v6_coherent_user_range
 #endif
 SYM_FUNC_END(v6_coherent_kern_range)
diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
index 201ca05436fa..726681fb7d4d 100644
--- a/arch/arm/mm/cache-v7.S
+++ b/arch/arm/mm/cache-v7.S
@@ -261,7 +261,7 @@ SYM_FUNC_END(v7_flush_user_cache_range)
  *	- the Icache does not read data from the write buffer
  */
 SYM_TYPED_FUNC_START(v7_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	v7_coherent_user_range
 #endif
 SYM_FUNC_END(v7_coherent_kern_range)
diff --git a/arch/arm/mm/cache-v7m.S b/arch/arm/mm/cache-v7m.S
index 14d719eba729..7f9cfad2ea21 100644
--- a/arch/arm/mm/cache-v7m.S
+++ b/arch/arm/mm/cache-v7m.S
@@ -286,7 +286,7 @@ SYM_FUNC_END(v7m_flush_user_cache_range)
  *	- the Icache does not read data from the write buffer
  */
 SYM_TYPED_FUNC_START(v7m_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	v7m_coherent_user_range
 #endif
 SYM_FUNC_END(v7m_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index d0ce3414a13e..4612a4961e81 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -203,7 +203,7 @@ SYM_FUNC_END(arm1020_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm1020_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm1020_coherent_user_range
 #endif
 SYM_FUNC_END(arm1020_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index 64f031bf6eff..b4a8a3a8eda3 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -200,7 +200,7 @@ SYM_FUNC_END(arm1020e_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm1020e_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm1020e_coherent_user_range
 #endif
 SYM_FUNC_END(arm1020e_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index 42ed5ed07252..709870e99e19 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -199,7 +199,7 @@ SYM_FUNC_END(arm1022_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm1022_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm1022_coherent_user_range
 #endif
 SYM_FUNC_END(arm1022_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index b3ae62cd553a..02f7370a8c5c 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -194,7 +194,7 @@ SYM_FUNC_END(arm1026_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm1026_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm1026_coherent_user_range
 #endif
 SYM_FUNC_END(arm1026_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index a30df54ad5fa..4727f4b5b6e8 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -180,7 +180,7 @@ SYM_FUNC_END(arm920_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm920_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm920_coherent_user_range
 #endif
 SYM_FUNC_END(arm920_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index aac4e048100d..5a4a3f4f2683 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -182,7 +182,7 @@ SYM_FUNC_END(arm922_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm922_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm922_coherent_user_range
 #endif
 SYM_FUNC_END(arm922_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 035941faeb2e..1c4830afe1d3 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -229,7 +229,7 @@ SYM_FUNC_END(arm925_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm925_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm925_coherent_user_range
 #endif
 SYM_FUNC_END(arm925_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 6f43d6af2d9a..a09cc3e02efd 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -192,7 +192,7 @@ SYM_FUNC_END(arm926_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm926_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm926_coherent_user_range
 #endif
 SYM_FUNC_END(arm926_coherent_kern_range)
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index 0d30bb25c42b..545c076c36d2 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -153,7 +153,7 @@ SYM_FUNC_END(arm940_coherent_kern_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm940_coherent_user_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm940_flush_kern_dcache_area
 #endif
 SYM_FUNC_END(arm940_coherent_user_range)
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 27750ace2ced..f3d4e18c3fba 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -173,7 +173,7 @@ SYM_FUNC_END(arm946_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm946_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	arm946_coherent_user_range
 #endif
 SYM_FUNC_END(arm946_coherent_kern_range)
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index f67b2ffac854..7f08d06c9625 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -208,7 +208,7 @@ SYM_FUNC_END(feroceon_flush_user_cache_range)
  */
 	.align	5
 SYM_TYPED_FUNC_START(feroceon_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	feroceon_coherent_user_range
 #endif
 SYM_FUNC_END(feroceon_coherent_kern_range)
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 8e9f38da863a..4669c63e3121 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -163,7 +163,7 @@ SYM_FUNC_END(mohawk_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(mohawk_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	mohawk_coherent_user_range
 #endif
 SYM_FUNC_END(mohawk_coherent_kern_range)
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index 14927b380452..fd25634a2ed5 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -223,7 +223,7 @@ SYM_FUNC_END(xsc3_flush_user_cache_range)
  *	it also trashes the mini I-cache used by JTAG debuggers.
  */
 SYM_TYPED_FUNC_START(xsc3_coherent_kern_range)
-#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
+#ifdef CONFIG_CFI /* Fallthrough if !CFI */
 	b	xsc3_coherent_user_range
 #endif
 SYM_FUNC_END(xsc3_coherent_kern_range)
diff --git a/arch/arm/mm/tlb-v4.S b/arch/arm/mm/tlb-v4.S
index 09ff69008d94..079774a02be6 100644
--- a/arch/arm/mm/tlb-v4.S
+++ b/arch/arm/mm/tlb-v4.S
@@ -52,7 +52,7 @@ SYM_FUNC_END(v4_flush_user_tlb_range)
  *	- start - virtual address (may not be aligned)
  *	- end   - virtual address (may not be aligned)
  */
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 SYM_TYPED_FUNC_START(v4_flush_kern_tlb_range)
 	b	.v4_flush_kern_tlb_range
 SYM_FUNC_END(v4_flush_kern_tlb_range)
diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpoint.c
index a12efd0f43e8..cd4b34c96e35 100644
--- a/arch/arm/kernel/hw_breakpoint.c
+++ b/arch/arm/kernel/hw_breakpoint.c
@@ -904,7 +904,7 @@ static void breakpoint_handler(unsigned long unknown, struct pt_regs *regs)
 	watchpoint_single_step_handler(addr);
 }
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
 {
 	/*
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 110d9ff54174..ebf010443e22 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -212,7 +212,7 @@ static int call_el1_break_hook(struct pt_regs *regs, unsigned long esr)
 	if (esr_brk_comment(esr) == BUG_BRK_IMM)
 		return bug_brk_handler(regs, esr);
 
-	if (IS_ENABLED(CONFIG_CFI_CLANG) && esr_is_cfi_brk(esr))
+	if (IS_ENABLED(CONFIG_CFI) && esr_is_cfi_brk(esr))
 		return cfi_brk_handler(regs, esr);
 
 	if (esr_brk_comment(esr) == FAULT_BRK_IMM)
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index f528b6041f6a..5041817af267 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1015,7 +1015,7 @@ int bug_brk_handler(struct pt_regs *regs, unsigned long esr)
 	return DBG_HOOK_HANDLED;
 }
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 int cfi_brk_handler(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long target;
@@ -1039,7 +1039,7 @@ int cfi_brk_handler(struct pt_regs *regs, unsigned long esr)
 	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
 	return DBG_HOOK_HANDLED;
 }
-#endif /* CONFIG_CFI_CLANG */
+#endif /* CONFIG_CFI */
 
 int reserved_fault_brk_handler(struct pt_regs *regs, unsigned long esr)
 {
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index a598072f36d2..8bdb1eed090a 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -545,7 +545,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
 			kvm_err("nVHE hyp BUG at: %s:%u!\n", file, line);
 		else
 			print_nvhe_hyp_panic("BUG", panic_addr);
-	} else if (IS_ENABLED(CONFIG_CFI_CLANG) && esr_is_cfi_brk(esr)) {
+	} else if (IS_ENABLED(CONFIG_CFI) && esr_is_cfi_brk(esr)) {
 		kvm_nvhe_report_cfi_failure(panic_addr);
 	} else if (IS_ENABLED(CONFIG_UBSAN_KVM_EL2) &&
 		   ESR_ELx_EC(esr) == ESR_ELx_EC_BRK64 &&
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 52ffe115a8c4..28996e0a9b00 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -185,7 +185,7 @@ static inline void emit_bti(u32 insn, struct jit_ctx *ctx)
 
 static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
 {
-	if (IS_ENABLED(CONFIG_CFI_CLANG))
+	if (IS_ENABLED(CONFIG_CFI))
 		emit_u32_data(hash, ctx);
 }
 
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 10e01ff06312..24ba546a1c0e 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -18,7 +18,7 @@
 #define RV_MAX_REG_ARGS 8
 #define RV_FENTRY_NINSNS 2
 #define RV_FENTRY_NBYTES (RV_FENTRY_NINSNS * 4)
-#define RV_KCFI_NINSNS (IS_ENABLED(CONFIG_CFI_CLANG) ? 1 : 0)
+#define RV_KCFI_NINSNS (IS_ENABLED(CONFIG_CFI) ? 1 : 0)
 /* imm that allows emit_imm to emit max count insns */
 #define RV_MAX_COUNT_IMM 0x7FFF7FF7FF7FF7FF
 
@@ -469,7 +469,7 @@ static int emit_call(u64 addr, bool fixed_addr, struct rv_jit_context *ctx)
 
 static inline void emit_kcfi(u32 hash, struct rv_jit_context *ctx)
 {
-	if (IS_ENABLED(CONFIG_CFI_CLANG))
+	if (IS_ENABLED(CONFIG_CFI))
 		emit(hash, ctx);
 }
 
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5d80ae77c042..197751967ade 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1170,7 +1170,7 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
 
 #ifdef CONFIG_CFI_AUTO_DEFAULT
 # define __CFI_DEFAULT CFI_AUTO
-#elif defined(CONFIG_CFI_CLANG)
+#elif defined(CONFIG_CFI)
 # define __CFI_DEFAULT CFI_KCFI
 #else
 # define __CFI_DEFAULT CFI_OFF
@@ -1182,7 +1182,7 @@ enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
 bool cfi_bhi __ro_after_init = false;
 #endif
 
-#ifdef CONFIG_CFI_CLANG
+#ifdef CONFIG_CFI
 u32 cfi_get_func_hash(void *func)
 {
 	u32 hash;
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 6079d15dab8c..3863d7709386 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -339,7 +339,7 @@ static bool can_probe(unsigned long paddr)
 	if (is_exception_insn(&insn))
 		return false;
 
-	if (IS_ENABLED(CONFIG_CFI_CLANG)) {
+	if (IS_ENABLED(CONFIG_CFI)) {
 		/*
 		 * The compiler generates the following instruction sequence
 		 * for indirect call checks and cfi.c decodes this;
diff --git a/drivers/misc/lkdtm/cfi.c b/drivers/misc/lkdtm/cfi.c
index 6a33889d0902..c3971f7caa65 100644
--- a/drivers/misc/lkdtm/cfi.c
+++ b/drivers/misc/lkdtm/cfi.c
@@ -43,7 +43,7 @@ static void lkdtm_CFI_FORWARD_PROTO(void)
 	lkdtm_indirect_call((void *)lkdtm_increment_int);
 
 	pr_err("FAIL: survived mismatched prototype function call!\n");
-	pr_expected_config(CONFIG_CFI_CLANG);
+	pr_expected_config(CONFIG_CFI);
 }
 
 /*
diff --git a/kernel/module/tree_lookup.c b/kernel/module/tree_lookup.c
index d3204c5c74eb..f8e8c126705c 100644
--- a/kernel/module/tree_lookup.c
+++ b/kernel/module/tree_lookup.c
@@ -14,7 +14,7 @@
  * Use a latched RB-tree for __module_address(); this allows us to use
  * RCU lookups of the address from any context.
  *
- * This is conditional on PERF_EVENTS || TRACING || CFI_CLANG because those can
+ * This is conditional on PERF_EVENTS || TRACING || CFI because those can
  * really hit __module_address() hard by doing a lot of stack unwinding;
  * potentially from NMI context.
  */
diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
index 64caaf997fc0..94a3d023e15e 100644
--- a/kernel/configs/hardening.config
+++ b/kernel/configs/hardening.config
@@ -94,7 +94,7 @@ CONFIG_SECCOMP_FILTER=y
 CONFIG_SYN_COOKIES=y
 
 # Enable Kernel Control Flow Integrity (currently Clang only).
-CONFIG_CFI_CLANG=y
+CONFIG_CFI=y
 # CONFIG_CFI_PERMISSIVE is not set
 
 # Attack surface reduction: do not autoload TTY line disciplines.
-- 
2.34.1


