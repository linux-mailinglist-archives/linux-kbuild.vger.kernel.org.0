Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A83FD691
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 07:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbfKOGsu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 01:48:50 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:33124 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727096AbfKOGst (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 01:48:49 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04407;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0Ti7ujx6_1573800472;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0Ti7ujx6_1573800472)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 15 Nov 2019 14:48:07 +0800
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v3 5/7] scripts/sorttable: rename sortextable to sorttable
Date:   Fri, 15 Nov 2019 14:47:48 +0800
Message-Id: <20191115064750.47888-6-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Using commonly name for further more kernel table sort at build time
extend, no functional changes.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/arc/Kconfig                       |  2 +-
 arch/arm/Kconfig                       |  2 +-
 arch/arm64/Kconfig                     |  2 +-
 arch/microblaze/Kconfig                |  2 +-
 arch/mips/Kconfig                      |  2 +-
 arch/parisc/Kconfig                    |  2 +-
 arch/parisc/kernel/vmlinux.lds.S       |  2 +-
 arch/powerpc/Kconfig                   |  2 +-
 arch/s390/Kconfig                      |  2 +-
 arch/x86/Kconfig                       |  2 +-
 arch/xtensa/Kconfig                    |  2 +-
 init/Kconfig                           |  2 +-
 scripts/.gitignore                     |  2 +-
 scripts/Makefile                       |  4 ++--
 scripts/link-vmlinux.sh                | 10 +++++-----
 scripts/{sortextable.c => sorttable.c} | 10 +++++-----
 scripts/{sortextable.h => sorttable.h} |  4 ++--
 17 files changed, 27 insertions(+), 27 deletions(-)
 rename scripts/{sortextable.c => sorttable.c} (97%)
 rename scripts/{sortextable.h => sorttable.h} (99%)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 8383155c8c82..80f1b4034ebd 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -14,7 +14,7 @@ config ARC
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_DIRECT_REMAP
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8a50efb559f3..6a392d3b240f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -37,7 +37,7 @@ config ARM
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
-	select BUILDTIME_EXTABLE_SORT if MMU
+	select BUILDTIME_TABLE_SORT if MMU
 	select CLONE_BACKWARDS
 	select CPU_PM if SUSPEND || CPU_IDLE
 	select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3f047afb982c..a8ca76b327df 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -82,7 +82,7 @@ config ARM64
 	select ARM_GIC_V3
 	select ARM_GIC_V3_ITS if PCI
 	select ARM_PSCI_FW
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if (SUSPEND || CPU_IDLE)
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index c9c4be822456..959f0ae5cf90 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -12,7 +12,7 @@ config MICROBLAZE
 	select ARCH_HAS_UNCACHED_SEGMENT if !MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select TIMER_OF
 	select CLONE_BACKWARDS3
 	select COMMON_CLK
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a0bd9bdb5f83..bec582846dbd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -14,7 +14,7 @@ config MIPS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 	select CPU_PM if CPU_IDLE
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index b16237c95ea3..e1ef610a5a2b 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -18,7 +18,7 @@ config PARISC
 	select RTC_DRV_GENERIC
 	select INIT_ALL_POSSIBLE
 	select BUG
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
 	select HAVE_KERNEL_BZIP2
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 99cd24f2ea01..2a9799f7b46e 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -129,7 +129,7 @@ SECTIONS
 
 	RO_DATA_SECTION(8)
 
-	/* RO because of BUILDTIME_EXTABLE_SORT */
+	/* RO because of BUILDTIME_TABLE_SORT */
 	EXCEPTION_TABLE(8)
 	NOTES
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3e56c9c2f16e..b3f404b825a6 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -149,7 +149,7 @@ config PPC
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 43a81d0ad507..97a3a63c69fe 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -110,7 +110,7 @@ config S390
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS2
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select GENERIC_CLOCKEVENTS
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 8ef85139553f..958bfbc2e5db 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -97,7 +97,7 @@ config X86
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_WANT_HUGE_PMD_SHARE
 	select ARCH_WANTS_THP_SWAP		if X86_64
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLKEVT_I8253
 	select CLOCKSOURCE_VALIDATE_LAST_CYCLE
 	select CLOCKSOURCE_WATCHDOG
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index a8e7beb6b7b5..011c53481840 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -9,7 +9,7 @@ config XTENSA
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_REMAP if MMU
diff --git a/init/Kconfig b/init/Kconfig
index b4daad2bac23..40e2edf8b00b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -58,7 +58,7 @@ config CONSTRUCTORS
 config IRQ_WORK
 	bool
 
-config BUILDTIME_EXTABLE_SORT
+config BUILDTIME_TABLE_SORT
 	bool
 
 config THREAD_INFO_IN_TASK
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 17f8cef88fa8..c03b7cd97111 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -7,7 +7,7 @@ kallsyms
 pnmtologo
 unifdef
 recordmcount
-sortextable
+sorttable
 asn1_compiler
 extract-cert
 sign-file
diff --git a/scripts/Makefile b/scripts/Makefile
index 3e86b300f5a1..658d201f7f8b 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -15,13 +15,13 @@ hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
 hostprogs-$(CONFIG_LOGO)         += pnmtologo
 hostprogs-$(CONFIG_VT)           += conmakehash
 hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
-hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
+hostprogs-$(CONFIG_BUILDTIME_TABLE_SORT) += sorttable
 hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
 hostprogs-$(CONFIG_MODULE_SIG_FORMAT) += sign-file
 hostprogs-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += extract-cert
 hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) += insert-sys-cert
 
-HOSTCFLAGS_sortextable.o = -I$(srctree)/tools/include
+HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
 HOSTLDLIBS_sign-file = -lcrypto
 HOSTLDLIBS_extract-cert = -lcrypto
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 06495379fcd8..01978d1e4c13 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -178,9 +178,9 @@ mksysmap()
 	${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2}
 }
 
-sortextable()
+sorttable()
 {
-	${objtree}/scripts/sortextable ${1}
+	${objtree}/scripts/sorttable ${1}
 }
 
 # Delete output files in case of error
@@ -298,9 +298,9 @@ fi
 
 vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
 
-if [ -n "${CONFIG_BUILDTIME_EXTABLE_SORT}" ]; then
-	info SORTEX vmlinux
-	sortextable vmlinux
+if [ -n "${CONFIG_BUILDTIME_TABLE_SORT}" ]; then
+	info SORTTAB vmlinux
+	sorttable vmlinux
 fi
 
 info SYSMAP System.map
diff --git a/scripts/sortextable.c b/scripts/sorttable.c
similarity index 97%
rename from scripts/sortextable.c
rename to scripts/sorttable.c
index efa2839865cd..ff98b7db20c6 100644
--- a/scripts/sortextable.c
+++ b/scripts/sorttable.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * sortextable.c: Sort the kernel's exception table
+ * sorttable.c: Sort the kernel's table
  *
  * Copyright 2011 - 2012 Cavium, Inc.
  *
@@ -182,9 +182,9 @@ static inline unsigned int get_secindex(unsigned int shndx,
 }
 
 /* 32 bit and 64 bit are very similar */
-#include "sortextable.h"
-#define SORTEXTABLE_64
-#include "sortextable.h"
+#include "sorttable.h"
+#define SORTTABLE_64
+#include "sorttable.h"
 
 static int compare_relative_table(const void *a, const void *b)
 {
@@ -351,7 +351,7 @@ int main(int argc, char *argv[])
 	void *addr = NULL;
 
 	if (argc < 2) {
-		fprintf(stderr, "usage: sortextable vmlinux...\n");
+		fprintf(stderr, "usage: sorttable vmlinux...\n");
 		return 0;
 	}
 
diff --git a/scripts/sortextable.h b/scripts/sorttable.h
similarity index 99%
rename from scripts/sortextable.h
rename to scripts/sorttable.h
index 6485513f7cae..82589ff90e25 100644
--- a/scripts/sortextable.h
+++ b/scripts/sorttable.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * sortextable.h
+ * sorttable.h
  *
  * Copyright 2011 - 2012 Cavium, Inc.
  *
@@ -31,7 +31,7 @@
 #undef _r
 #undef _w
 
-#ifdef SORTEXTABLE_64
+#ifdef SORTTABLE_64
 # define extable_ent_size	16
 # define compare_extable	compare_extable_64
 # define do_sort		do_sort_64
-- 
2.24.0.rc2

