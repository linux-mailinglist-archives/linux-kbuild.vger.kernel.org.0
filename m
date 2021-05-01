Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D38C3707AE
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 May 2021 17:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhEAPTz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 May 2021 11:19:55 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:26439 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhEAPTy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 May 2021 11:19:54 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 141FFirA014188;
        Sun, 2 May 2021 00:15:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 141FFirA014188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619882145;
        bh=u9G2y9j8kDI7ZQJXHPzFbSaa9rJKSH6IgG7TTQj7jqQ=;
        h=From:To:Cc:Subject:Date:From;
        b=E/Y5NiHGYWBCdK49NO0y6Qu2vvGHmQlyFFVptGIbXAAaoIGy8pjC6imlkiakgytni
         JZP2Z5pzajhdbQ/0C2H8goOoY8HdgxdHI8DfHIm4hSK/ZRB/SUnIBq+3rXrZFHJ+uJ
         HpDbDONoTW3tLDb+7U7GLOtj5WThv70KojHnCZVi/QhIhVbQlVrEB99glwjEO1fm0s
         zleWaVpLEnonAvu1y8hGYYJhm20aLE9Bq17KoF92T1gBaUxlMNJT5uGIPCSIIz0gN9
         5YKXQD0zN3lojtQzZOpjBYpy0dfkkVKLEJSUz2DixNVjUEJaCN3+/W1t1wZPC4dCsF
         L7ZzM5deu0ZTA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Raise the minimum GCC version to 5.2
Date:   Sun,  2 May 2021 00:15:38 +0900
Message-Id: <20210501151538.145449-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current minimum GCC version is 4.9 except ARCH=arm64 requiring
GCC 5.1.

When we discussed last time, we agreed to raise the minimum GCC version
to 5.1 globally. [1]

I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.

This commit updates the minimum versions in scripts/min-tool-version.sh
and Documentation/process/changes.rst with trivial code cleanups.

More cleanups will be possible as follow-up patches, but this one must
be agreed and applied to the mainline first.

[1]: https://lore.kernel.org/lkml/CAHk-=wjHTpG+gMx9vqrZgo8Uw0NqA2kNjS87o63Zv3=WG2K3zA@mail.gmail.com/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

I'd like Linus to pick up this patch
if there is no objection.


 Documentation/process/changes.rst | 2 +-
 arch/arm64/Kconfig                | 2 +-
 arch/powerpc/Kconfig              | 2 +-
 arch/riscv/Kconfig                | 2 +-
 include/linux/compiler-gcc.h      | 6 +-----
 lib/Kconfig.debug                 | 2 +-
 scripts/min-tool-version.sh       | 8 +-------
 7 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index dac17711dc11..cf104a8d1850 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -29,7 +29,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-GNU C                  4.9              gcc --version
+GNU C                  5.2              gcc --version
 Clang/LLVM (optional)  10.0.1           clang --version
 GNU make               3.81             make --version
 binutils               2.23             ld -v
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7f2a80091337..fae9514dabab 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -78,7 +78,7 @@ config ARM64
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && (GCC_VERSION >= 50000 || CC_IS_CLANG)
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1e6230bea09d..10dc47eac122 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -212,7 +212,7 @@ config PPC
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
-	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
+	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
 	select HAVE_IDE
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4515a10c5d22..748a5b37a0e5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -226,7 +226,7 @@ config ARCH_RV32I
 config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
-	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && CC_IS_GCC
 	select HAVE_DYNAMIC_FTRACE if MMU
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD
diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 5d97ef738a57..3608189dfc29 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -98,10 +98,8 @@
 
 #if GCC_VERSION >= 70000
 #define KASAN_ABI_VERSION 5
-#elif GCC_VERSION >= 50000
+#else
 #define KASAN_ABI_VERSION 4
-#elif GCC_VERSION >= 40902
-#define KASAN_ABI_VERSION 3
 #endif
 
 #if __has_attribute(__no_sanitize_address__)
@@ -122,9 +120,7 @@
 #define __no_sanitize_undefined
 #endif
 
-#if GCC_VERSION >= 50100
 #define COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW 1
-#endif
 
 /*
  * Turn individual warnings and errors on and off locally, depending
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 678c13967580..0d0ed298905d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -284,7 +284,7 @@ config DEBUG_INFO_DWARF4
 
 config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
-	depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
+	depends on CC_IS_GCC || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
 	depends on !DEBUG_INFO_BTF
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index d22cf91212b0..d5d0d26b8e7d 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -17,13 +17,7 @@ binutils)
 	echo 2.23.0
 	;;
 gcc)
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
-	# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
-	if [ "$SRCARCH" = arm64 ]; then
-		echo 5.1.0
-	else
-		echo 4.9.0
-	fi
+	echo 5.2.0
 	;;
 icc)
 	# temporary
-- 
2.27.0

