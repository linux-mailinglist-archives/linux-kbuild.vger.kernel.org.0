Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76A2311E180
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2019 11:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfLMKEA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Dec 2019 05:04:00 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:47787 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbfLMKD7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 05:03:59 -0500
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1ifhnO-0008KN-2j; Fri, 13 Dec 2019 11:03:38 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 9A72D1C2933;
        Fri, 13 Dec 2019 11:03:37 +0100 (CET)
Date:   Fri, 13 Dec 2019 10:03:37 -0000
From:   "tip-bot2 for Shile Zhang" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: core/objtool] scripts/sorttable: Rename 'sortextable' to 'sorttable'
Cc:     Shile Zhang <shile.zhang@linux.alibaba.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20191204004633.88660-6-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-6-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Message-ID: <157623141751.30329.18263651979361687449.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The following commit has been merged into the core/objtool branch of tip:

Commit-ID:     1091670637be8bd34a39dd1ddcc0a10a7c88d4e2
Gitweb:        https://git.kernel.org/tip/1091670637be8bd34a39dd1ddcc0a10a7c88d4e2
Author:        Shile Zhang <shile.zhang@linux.alibaba.com>
AuthorDate:    Wed, 04 Dec 2019 08:46:31 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 13 Dec 2019 10:47:58 +01:00

scripts/sorttable: Rename 'sortextable' to 'sorttable'

Use a more generic name for additional table sorting usecases,
such as the upcoming ORC table sorting feature. This tool is
not tied to exception table sorting anymore.

No functional changes intended.

[ mingo: Rewrote the changelog. ]

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Link: https://lkml.kernel.org/r/20191204004633.88660-6-shile.zhang@linux.alibaba.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/arc/Kconfig        |   2 +-
 arch/arm/Kconfig        |   2 +-
 arch/arm64/Kconfig      |   2 +-
 arch/microblaze/Kconfig |   2 +-
 arch/mips/Kconfig       |   2 +-
 arch/parisc/Kconfig     |   2 +-
 arch/powerpc/Kconfig    |   2 +-
 arch/s390/Kconfig       |   2 +-
 arch/x86/Kconfig        |   2 +-
 arch/xtensa/Kconfig     |   2 +-
 init/Kconfig            |   2 +-
 scripts/.gitignore      |   2 +-
 scripts/Makefile        |   4 +-
 scripts/link-vmlinux.sh |  10 +-
 scripts/sortextable.c   | 373 +---------------------------------------
 scripts/sortextable.h   | 210 +----------------------
 scripts/sorttable.c     | 373 +++++++++++++++++++++++++++++++++++++++-
 scripts/sorttable.h     | 210 ++++++++++++++++++++++-
 18 files changed, 602 insertions(+), 602 deletions(-)
 delete mode 100644 scripts/sortextable.c
 delete mode 100644 scripts/sortextable.h
 create mode 100644 scripts/sorttable.c
 create mode 100644 scripts/sorttable.h

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 26108ea..5f44820 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -13,7 +13,7 @@ config ARC
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_DIRECT_REMAP
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ba75e36..cb3493b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -36,7 +36,7 @@ config ARM
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
-	select BUILDTIME_EXTABLE_SORT if MMU
+	select BUILDTIME_TABLE_SORT if MMU
 	select CLONE_BACKWARDS
 	select CPU_PM if SUSPEND || CPU_IDLE
 	select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b1b4476..6f360dd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -81,7 +81,7 @@ config ARM64
 	select ARM_GIC_V3
 	select ARM_GIC_V3_ITS if PCI
 	select ARM_PSCI_FW
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if (SUSPEND || CPU_IDLE)
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 5f46ebe..a105f11 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -11,7 +11,7 @@ config MICROBLAZE
 	select ARCH_HAS_UNCACHED_SEGMENT if !MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select TIMER_OF
 	select CLONE_BACKWARDS3
 	select COMMON_CLK
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index add3882..5531942 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -15,7 +15,7 @@ config MIPS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 	select CPU_PM if CPU_IDLE
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index b16237c..e1ef610 100644
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
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1ec34e1..18a21b4 100644
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
index d4051e8..884194f 100644
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
index 5e89499..e71158a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -96,7 +96,7 @@ config X86
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_WANT_HUGE_PMD_SHARE
 	select ARCH_WANTS_THP_SWAP		if X86_64
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLKEVT_I8253
 	select CLOCKSOURCE_VALIDATE_LAST_CYCLE
 	select CLOCKSOURCE_WATCHDOG
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 4a3fa29..fb9746d 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -11,7 +11,7 @@ config XTENSA
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select BUILDTIME_EXTABLE_SORT
+	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_REMAP if MMU
diff --git a/init/Kconfig b/init/Kconfig
index a34064a..ad9b6c5 100644
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
index 4aa1806..306054e 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -6,7 +6,7 @@ conmakehash
 kallsyms
 unifdef
 recordmcount
-sortextable
+sorttable
 asn1_compiler
 extract-cert
 sign-file
diff --git a/scripts/Makefile b/scripts/Makefile
index 00c4790..7491241 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -13,13 +13,13 @@ hostprogs-$(CONFIG_BUILD_BIN2C)  += bin2c
 hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
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
index 4363799..a81aa76 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -180,9 +180,9 @@ mksysmap()
 	${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2}
 }
 
-sortextable()
+sorttable()
 {
-	${objtree}/scripts/sortextable ${1}
+	${objtree}/scripts/sorttable ${1}
 }
 
 # Delete output files in case of error
@@ -304,9 +304,9 @@ fi
 
 vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
 
-if [ -n "${CONFIG_BUILDTIME_EXTABLE_SORT}" ]; then
-	info SORTEX vmlinux
-	sortextable vmlinux
+if [ -n "${CONFIG_BUILDTIME_TABLE_SORT}" ]; then
+	info SORTTAB vmlinux
+	sorttable vmlinux
 fi
 
 info SYSMAP System.map
diff --git a/scripts/sortextable.c b/scripts/sortextable.c
deleted file mode 100644
index efa2839..0000000
--- a/scripts/sortextable.c
+++ /dev/null
@@ -1,373 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * sortextable.c: Sort the kernel's exception table
- *
- * Copyright 2011 - 2012 Cavium, Inc.
- *
- * Based on code taken from recortmcount.c which is:
- *
- * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>.  All rights reserved.
- *
- * Restructured to fit Linux format, as well as other updates:
- *  Copyright 2010 Steven Rostedt <srostedt@redhat.com>, Red Hat Inc.
- */
-
-/*
- * Strategy: alter the vmlinux file in-place.
- */
-
-#include <sys/types.h>
-#include <sys/mman.h>
-#include <sys/stat.h>
-#include <getopt.h>
-#include <elf.h>
-#include <fcntl.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-
-#include <tools/be_byteshift.h>
-#include <tools/le_byteshift.h>
-
-#ifndef EM_ARCOMPACT
-#define EM_ARCOMPACT	93
-#endif
-
-#ifndef EM_XTENSA
-#define EM_XTENSA	94
-#endif
-
-#ifndef EM_AARCH64
-#define EM_AARCH64	183
-#endif
-
-#ifndef EM_MICROBLAZE
-#define EM_MICROBLAZE	189
-#endif
-
-#ifndef EM_ARCV2
-#define EM_ARCV2	195
-#endif
-
-static uint32_t (*r)(const uint32_t *);
-static uint16_t (*r2)(const uint16_t *);
-static uint64_t (*r8)(const uint64_t *);
-static void (*w)(uint32_t, uint32_t *);
-static void (*w2)(uint16_t, uint16_t *);
-static void (*w8)(uint64_t, uint64_t *);
-typedef void (*table_sort_t)(char *, int);
-
-/*
- * Get the whole file as a programming convenience in order to avoid
- * malloc+lseek+read+free of many pieces.  If successful, then mmap
- * avoids copying unused pieces; else just read the whole file.
- * Open for both read and write.
- */
-static void *mmap_file(char const *fname, size_t *size)
-{
-	int fd;
-	struct stat sb;
-	void *addr = NULL;
-
-	fd = open(fname, O_RDWR);
-	if (fd < 0) {
-		perror(fname);
-		return NULL;
-	}
-	if (fstat(fd, &sb) < 0) {
-		perror(fname);
-		goto out;
-	}
-	if (!S_ISREG(sb.st_mode)) {
-		fprintf(stderr, "not a regular file: %s\n", fname);
-		goto out;
-	}
-
-	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
-	if (addr == MAP_FAILED) {
-		fprintf(stderr, "Could not mmap file: %s\n", fname);
-		goto out;
-	}
-
-	*size = sb.st_size;
-
-out:
-	close(fd);
-	return addr;
-}
-
-static uint32_t rbe(const uint32_t *x)
-{
-	return get_unaligned_be32(x);
-}
-
-static uint16_t r2be(const uint16_t *x)
-{
-	return get_unaligned_be16(x);
-}
-
-static uint64_t r8be(const uint64_t *x)
-{
-	return get_unaligned_be64(x);
-}
-
-static uint32_t rle(const uint32_t *x)
-{
-	return get_unaligned_le32(x);
-}
-
-static uint16_t r2le(const uint16_t *x)
-{
-	return get_unaligned_le16(x);
-}
-
-static uint64_t r8le(const uint64_t *x)
-{
-	return get_unaligned_le64(x);
-}
-
-static void wbe(uint32_t val, uint32_t *x)
-{
-	put_unaligned_be32(val, x);
-}
-
-static void w2be(uint16_t val, uint16_t *x)
-{
-	put_unaligned_be16(val, x);
-}
-
-static void w8be(uint64_t val, uint64_t *x)
-{
-	put_unaligned_be64(val, x);
-}
-
-static void wle(uint32_t val, uint32_t *x)
-{
-	put_unaligned_le32(val, x);
-}
-
-static void w2le(uint16_t val, uint16_t *x)
-{
-	put_unaligned_le16(val, x);
-}
-
-static void w8le(uint64_t val, uint64_t *x)
-{
-	put_unaligned_le64(val, x);
-}
-
-/*
- * Move reserved section indices SHN_LORESERVE..SHN_HIRESERVE out of
- * the way to -256..-1, to avoid conflicting with real section
- * indices.
- */
-#define SPECIAL(i) ((i) - (SHN_HIRESERVE + 1))
-
-static inline int is_shndx_special(unsigned int i)
-{
-	return i != SHN_XINDEX && i >= SHN_LORESERVE && i <= SHN_HIRESERVE;
-}
-
-/* Accessor for sym->st_shndx, hides ugliness of "64k sections" */
-static inline unsigned int get_secindex(unsigned int shndx,
-					unsigned int sym_offs,
-					const Elf32_Word *symtab_shndx_start)
-{
-	if (is_shndx_special(shndx))
-		return SPECIAL(shndx);
-	if (shndx != SHN_XINDEX)
-		return shndx;
-	return r(&symtab_shndx_start[sym_offs]);
-}
-
-/* 32 bit and 64 bit are very similar */
-#include "sortextable.h"
-#define SORTEXTABLE_64
-#include "sortextable.h"
-
-static int compare_relative_table(const void *a, const void *b)
-{
-	int32_t av = (int32_t)r(a);
-	int32_t bv = (int32_t)r(b);
-
-	if (av < bv)
-		return -1;
-	if (av > bv)
-		return 1;
-	return 0;
-}
-
-static void sort_relative_table(char *extab_image, int image_size)
-{
-	int i = 0;
-
-	/*
-	 * Do the same thing the runtime sort does, first normalize to
-	 * being relative to the start of the section.
-	 */
-	while (i < image_size) {
-		uint32_t *loc = (uint32_t *)(extab_image + i);
-		w(r(loc) + i, loc);
-		i += 4;
-	}
-
-	qsort(extab_image, image_size / 8, 8, compare_relative_table);
-
-	/* Now denormalize. */
-	i = 0;
-	while (i < image_size) {
-		uint32_t *loc = (uint32_t *)(extab_image + i);
-		w(r(loc) - i, loc);
-		i += 4;
-	}
-}
-
-static void x86_sort_relative_table(char *extab_image, int image_size)
-{
-	int i = 0;
-
-	while (i < image_size) {
-		uint32_t *loc = (uint32_t *)(extab_image + i);
-
-		w(r(loc) + i, loc);
-		w(r(loc + 1) + i + 4, loc + 1);
-		w(r(loc + 2) + i + 8, loc + 2);
-
-		i += sizeof(uint32_t) * 3;
-	}
-
-	qsort(extab_image, image_size / 12, 12, compare_relative_table);
-
-	i = 0;
-	while (i < image_size) {
-		uint32_t *loc = (uint32_t *)(extab_image + i);
-
-		w(r(loc) - i, loc);
-		w(r(loc + 1) - (i + 4), loc + 1);
-		w(r(loc + 2) - (i + 8), loc + 2);
-
-		i += sizeof(uint32_t) * 3;
-	}
-}
-
-static int do_file(char const *const fname, void *addr)
-{
-	int rc = -1;
-	Elf32_Ehdr *ehdr = addr;
-	table_sort_t custom_sort = NULL;
-
-	switch (ehdr->e_ident[EI_DATA]) {
-	case ELFDATA2LSB:
-		r	= rle;
-		r2	= r2le;
-		r8	= r8le;
-		w	= wle;
-		w2	= w2le;
-		w8	= w8le;
-		break;
-	case ELFDATA2MSB:
-		r	= rbe;
-		r2	= r2be;
-		r8	= r8be;
-		w	= wbe;
-		w2	= w2be;
-		w8	= w8be;
-		break;
-	default:
-		fprintf(stderr, "unrecognized ELF data encoding %d: %s\n",
-			ehdr->e_ident[EI_DATA], fname);
-		return -1;
-	}
-
-	if (memcmp(ELFMAG, ehdr->e_ident, SELFMAG) != 0 ||
-	    (r2(&ehdr->e_type) != ET_EXEC && r2(&ehdr->e_type) != ET_DYN) ||
-	    ehdr->e_ident[EI_VERSION] != EV_CURRENT) {
-		fprintf(stderr, "unrecognized ET_EXEC/ET_DYN file %s\n", fname);
-		return -1;
-	}
-
-	switch (r2(&ehdr->e_machine)) {
-	case EM_386:
-	case EM_X86_64:
-		custom_sort = x86_sort_relative_table;
-		break;
-	case EM_S390:
-	case EM_AARCH64:
-	case EM_PARISC:
-	case EM_PPC:
-	case EM_PPC64:
-		custom_sort = sort_relative_table;
-		break;
-	case EM_ARCOMPACT:
-	case EM_ARCV2:
-	case EM_ARM:
-	case EM_MICROBLAZE:
-	case EM_MIPS:
-	case EM_XTENSA:
-		break;
-	default:
-		fprintf(stderr, "unrecognized e_machine %d %s\n",
-			r2(&ehdr->e_machine), fname);
-		return -1;
-	}
-
-	switch (ehdr->e_ident[EI_CLASS]) {
-	case ELFCLASS32:
-		if (r2(&ehdr->e_ehsize) != sizeof(Elf32_Ehdr) ||
-		    r2(&ehdr->e_shentsize) != sizeof(Elf32_Shdr)) {
-			fprintf(stderr,
-				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
-			break;
-		}
-		rc = do_sort_32(ehdr, fname, custom_sort);
-		break;
-	case ELFCLASS64:
-		{
-		Elf64_Ehdr *const ghdr = (Elf64_Ehdr *)ehdr;
-		if (r2(&ghdr->e_ehsize) != sizeof(Elf64_Ehdr) ||
-		    r2(&ghdr->e_shentsize) != sizeof(Elf64_Shdr)) {
-			fprintf(stderr,
-				"unrecognized ET_EXEC/ET_DYN file: %s\n",
-				fname);
-			break;
-		}
-		rc = do_sort_64(ghdr, fname, custom_sort);
-		}
-		break;
-	default:
-		fprintf(stderr, "unrecognized ELF class %d %s\n",
-			ehdr->e_ident[EI_CLASS], fname);
-		break;
-	}
-
-	return rc;
-}
-
-int main(int argc, char *argv[])
-{
-	int i, n_error = 0;  /* gcc-4.3.0 false positive complaint */
-	size_t size = 0;
-	void *addr = NULL;
-
-	if (argc < 2) {
-		fprintf(stderr, "usage: sortextable vmlinux...\n");
-		return 0;
-	}
-
-	/* Process each file in turn, allowing deep failure. */
-	for (i = 1; i < argc; i++) {
-		addr = mmap_file(argv[i], &size);
-		if (!addr) {
-			++n_error;
-			continue;
-		}
-
-		if (do_file(argv[i], addr))
-			++n_error;
-
-		munmap(addr, size);
-	}
-
-	return !!n_error;
-}
diff --git a/scripts/sortextable.h b/scripts/sortextable.h
deleted file mode 100644
index 6485513..0000000
--- a/scripts/sortextable.h
+++ /dev/null
@@ -1,210 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sortextable.h
- *
- * Copyright 2011 - 2012 Cavium, Inc.
- *
- * Some of this code was taken out of recordmcount.h written by:
- *
- * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>. All rights reserved.
- * Copyright 2010 Steven Rostedt <srostedt@redhat.com>, Red Hat Inc.
- */
-
-#undef extable_ent_size
-#undef compare_extable
-#undef do_sort
-#undef Elf_Addr
-#undef Elf_Ehdr
-#undef Elf_Shdr
-#undef Elf_Rel
-#undef Elf_Rela
-#undef Elf_Sym
-#undef ELF_R_SYM
-#undef Elf_r_sym
-#undef ELF_R_INFO
-#undef Elf_r_info
-#undef ELF_ST_BIND
-#undef ELF_ST_TYPE
-#undef fn_ELF_R_SYM
-#undef fn_ELF_R_INFO
-#undef uint_t
-#undef _r
-#undef _w
-
-#ifdef SORTEXTABLE_64
-# define extable_ent_size	16
-# define compare_extable	compare_extable_64
-# define do_sort		do_sort_64
-# define Elf_Addr		Elf64_Addr
-# define Elf_Ehdr		Elf64_Ehdr
-# define Elf_Shdr		Elf64_Shdr
-# define Elf_Rel		Elf64_Rel
-# define Elf_Rela		Elf64_Rela
-# define Elf_Sym		Elf64_Sym
-# define ELF_R_SYM		ELF64_R_SYM
-# define Elf_r_sym		Elf64_r_sym
-# define ELF_R_INFO		ELF64_R_INFO
-# define Elf_r_info		Elf64_r_info
-# define ELF_ST_BIND		ELF64_ST_BIND
-# define ELF_ST_TYPE		ELF64_ST_TYPE
-# define fn_ELF_R_SYM		fn_ELF64_R_SYM
-# define fn_ELF_R_INFO		fn_ELF64_R_INFO
-# define uint_t			uint64_t
-# define _r			r8
-# define _w			w8
-#else
-# define extable_ent_size	8
-# define compare_extable	compare_extable_32
-# define do_sort		do_sort_32
-# define Elf_Addr		Elf32_Addr
-# define Elf_Ehdr		Elf32_Ehdr
-# define Elf_Shdr		Elf32_Shdr
-# define Elf_Rel		Elf32_Rel
-# define Elf_Rela		Elf32_Rela
-# define Elf_Sym		Elf32_Sym
-# define ELF_R_SYM		ELF32_R_SYM
-# define Elf_r_sym		Elf32_r_sym
-# define ELF_R_INFO		ELF32_R_INFO
-# define Elf_r_info		Elf32_r_info
-# define ELF_ST_BIND		ELF32_ST_BIND
-# define ELF_ST_TYPE		ELF32_ST_TYPE
-# define fn_ELF_R_SYM		fn_ELF32_R_SYM
-# define fn_ELF_R_INFO		fn_ELF32_R_INFO
-# define uint_t			uint32_t
-# define _r			r
-# define _w			w
-#endif
-
-static int compare_extable(const void *a, const void *b)
-{
-	Elf_Addr av = _r(a);
-	Elf_Addr bv = _r(b);
-
-	if (av < bv)
-		return -1;
-	if (av > bv)
-		return 1;
-	return 0;
-}
-
-static int do_sort(Elf_Ehdr *ehdr,
-		   char const *const fname,
-		   table_sort_t custom_sort)
-{
-	Elf_Shdr *s, *shdr = (Elf_Shdr *)((char *)ehdr + _r(&ehdr->e_shoff));
-	Elf_Shdr *strtab_sec = NULL;
-	Elf_Shdr *symtab_sec = NULL;
-	Elf_Shdr *extab_sec = NULL;
-	Elf_Sym *sym;
-	const Elf_Sym *symtab;
-	Elf32_Word *symtab_shndx = NULL;
-	Elf_Sym *sort_needed_sym = NULL;
-	Elf_Shdr *sort_needed_sec;
-	Elf_Rel *relocs = NULL;
-	int relocs_size = 0;
-	uint32_t *sort_needed_loc;
-	const char *secstrings;
-	const char *strtab;
-	char *extab_image;
-	int extab_index = 0;
-	int i;
-	int idx;
-	unsigned int shnum;
-	unsigned int shstrndx;
-
-	shstrndx = r2(&ehdr->e_shstrndx);
-	if (shstrndx == SHN_XINDEX)
-		shstrndx = r(&shdr[0].sh_link);
-	secstrings = (const char *)ehdr + _r(&shdr[shstrndx].sh_offset);
-
-	shnum = r2(&ehdr->e_shnum);
-	if (shnum == SHN_UNDEF)
-		shnum = _r(&shdr[0].sh_size);
-
-	for (i = 0, s = shdr; s < shdr + shnum; i++, s++) {
-		idx = r(&s->sh_name);
-		if (!strcmp(secstrings + idx, "__ex_table")) {
-			extab_sec = s;
-			extab_index = i;
-		}
-		if (!strcmp(secstrings + idx, ".symtab"))
-			symtab_sec = s;
-		if (!strcmp(secstrings + idx, ".strtab"))
-			strtab_sec = s;
-
-		if ((r(&s->sh_type) == SHT_REL ||
-		     r(&s->sh_type) == SHT_RELA) &&
-		    r(&s->sh_info) == extab_index) {
-			relocs = (void *)ehdr + _r(&s->sh_offset);
-			relocs_size = _r(&s->sh_size);
-		}
-		if (r(&s->sh_type) == SHT_SYMTAB_SHNDX)
-			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
-						      _r(&s->sh_offset));
-	}
-
-	if (!extab_sec) {
-		fprintf(stderr,	"no __ex_table in file: %s\n", fname);
-		return -1;
-	}
-
-	if (!symtab_sec) {
-		fprintf(stderr,	"no .symtab in file: %s\n", fname);
-		return -1;
-	}
-
-	if (!strtab_sec) {
-		fprintf(stderr,	"no .strtab in file: %s\n", fname);
-		return -1;
-	}
-
-	extab_image = (void *)ehdr + _r(&extab_sec->sh_offset);
-	strtab = (const char *)ehdr + _r(&strtab_sec->sh_offset);
-	symtab = (const Elf_Sym *)((const char *)ehdr +
-						  _r(&symtab_sec->sh_offset));
-
-	if (custom_sort) {
-		custom_sort(extab_image, _r(&extab_sec->sh_size));
-	} else {
-		int num_entries = _r(&extab_sec->sh_size) / extable_ent_size;
-		qsort(extab_image, num_entries,
-		      extable_ent_size, compare_extable);
-	}
-
-	/* If there were relocations, we no longer need them. */
-	if (relocs)
-		memset(relocs, 0, relocs_size);
-
-	/* find the flag main_extable_sort_needed */
-	for (sym = (void *)ehdr + _r(&symtab_sec->sh_offset);
-	     sym < sym + _r(&symtab_sec->sh_size) / sizeof(Elf_Sym);
-	     sym++) {
-		if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
-			continue;
-		if (!strcmp(strtab + r(&sym->st_name),
-			    "main_extable_sort_needed")) {
-			sort_needed_sym = sym;
-			break;
-		}
-	}
-
-	if (!sort_needed_sym) {
-		fprintf(stderr,
-			"no main_extable_sort_needed symbol in file: %s\n",
-			fname);
-		return -1;
-	}
-
-	sort_needed_sec = &shdr[get_secindex(r2(&sym->st_shndx),
-					     sort_needed_sym - symtab,
-					     symtab_shndx)];
-	sort_needed_loc = (void *)ehdr +
-		_r(&sort_needed_sec->sh_offset) +
-		_r(&sort_needed_sym->st_value) -
-		_r(&sort_needed_sec->sh_addr);
-
-	/* extable has been sorted, clear the flag */
-	w(0, sort_needed_loc);
-
-	return 0;
-}
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
new file mode 100644
index 0000000..ff98b7d
--- /dev/null
+++ b/scripts/sorttable.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * sorttable.c: Sort the kernel's table
+ *
+ * Copyright 2011 - 2012 Cavium, Inc.
+ *
+ * Based on code taken from recortmcount.c which is:
+ *
+ * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>.  All rights reserved.
+ *
+ * Restructured to fit Linux format, as well as other updates:
+ *  Copyright 2010 Steven Rostedt <srostedt@redhat.com>, Red Hat Inc.
+ */
+
+/*
+ * Strategy: alter the vmlinux file in-place.
+ */
+
+#include <sys/types.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <getopt.h>
+#include <elf.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <tools/be_byteshift.h>
+#include <tools/le_byteshift.h>
+
+#ifndef EM_ARCOMPACT
+#define EM_ARCOMPACT	93
+#endif
+
+#ifndef EM_XTENSA
+#define EM_XTENSA	94
+#endif
+
+#ifndef EM_AARCH64
+#define EM_AARCH64	183
+#endif
+
+#ifndef EM_MICROBLAZE
+#define EM_MICROBLAZE	189
+#endif
+
+#ifndef EM_ARCV2
+#define EM_ARCV2	195
+#endif
+
+static uint32_t (*r)(const uint32_t *);
+static uint16_t (*r2)(const uint16_t *);
+static uint64_t (*r8)(const uint64_t *);
+static void (*w)(uint32_t, uint32_t *);
+static void (*w2)(uint16_t, uint16_t *);
+static void (*w8)(uint64_t, uint64_t *);
+typedef void (*table_sort_t)(char *, int);
+
+/*
+ * Get the whole file as a programming convenience in order to avoid
+ * malloc+lseek+read+free of many pieces.  If successful, then mmap
+ * avoids copying unused pieces; else just read the whole file.
+ * Open for both read and write.
+ */
+static void *mmap_file(char const *fname, size_t *size)
+{
+	int fd;
+	struct stat sb;
+	void *addr = NULL;
+
+	fd = open(fname, O_RDWR);
+	if (fd < 0) {
+		perror(fname);
+		return NULL;
+	}
+	if (fstat(fd, &sb) < 0) {
+		perror(fname);
+		goto out;
+	}
+	if (!S_ISREG(sb.st_mode)) {
+		fprintf(stderr, "not a regular file: %s\n", fname);
+		goto out;
+	}
+
+	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
+	if (addr == MAP_FAILED) {
+		fprintf(stderr, "Could not mmap file: %s\n", fname);
+		goto out;
+	}
+
+	*size = sb.st_size;
+
+out:
+	close(fd);
+	return addr;
+}
+
+static uint32_t rbe(const uint32_t *x)
+{
+	return get_unaligned_be32(x);
+}
+
+static uint16_t r2be(const uint16_t *x)
+{
+	return get_unaligned_be16(x);
+}
+
+static uint64_t r8be(const uint64_t *x)
+{
+	return get_unaligned_be64(x);
+}
+
+static uint32_t rle(const uint32_t *x)
+{
+	return get_unaligned_le32(x);
+}
+
+static uint16_t r2le(const uint16_t *x)
+{
+	return get_unaligned_le16(x);
+}
+
+static uint64_t r8le(const uint64_t *x)
+{
+	return get_unaligned_le64(x);
+}
+
+static void wbe(uint32_t val, uint32_t *x)
+{
+	put_unaligned_be32(val, x);
+}
+
+static void w2be(uint16_t val, uint16_t *x)
+{
+	put_unaligned_be16(val, x);
+}
+
+static void w8be(uint64_t val, uint64_t *x)
+{
+	put_unaligned_be64(val, x);
+}
+
+static void wle(uint32_t val, uint32_t *x)
+{
+	put_unaligned_le32(val, x);
+}
+
+static void w2le(uint16_t val, uint16_t *x)
+{
+	put_unaligned_le16(val, x);
+}
+
+static void w8le(uint64_t val, uint64_t *x)
+{
+	put_unaligned_le64(val, x);
+}
+
+/*
+ * Move reserved section indices SHN_LORESERVE..SHN_HIRESERVE out of
+ * the way to -256..-1, to avoid conflicting with real section
+ * indices.
+ */
+#define SPECIAL(i) ((i) - (SHN_HIRESERVE + 1))
+
+static inline int is_shndx_special(unsigned int i)
+{
+	return i != SHN_XINDEX && i >= SHN_LORESERVE && i <= SHN_HIRESERVE;
+}
+
+/* Accessor for sym->st_shndx, hides ugliness of "64k sections" */
+static inline unsigned int get_secindex(unsigned int shndx,
+					unsigned int sym_offs,
+					const Elf32_Word *symtab_shndx_start)
+{
+	if (is_shndx_special(shndx))
+		return SPECIAL(shndx);
+	if (shndx != SHN_XINDEX)
+		return shndx;
+	return r(&symtab_shndx_start[sym_offs]);
+}
+
+/* 32 bit and 64 bit are very similar */
+#include "sorttable.h"
+#define SORTTABLE_64
+#include "sorttable.h"
+
+static int compare_relative_table(const void *a, const void *b)
+{
+	int32_t av = (int32_t)r(a);
+	int32_t bv = (int32_t)r(b);
+
+	if (av < bv)
+		return -1;
+	if (av > bv)
+		return 1;
+	return 0;
+}
+
+static void sort_relative_table(char *extab_image, int image_size)
+{
+	int i = 0;
+
+	/*
+	 * Do the same thing the runtime sort does, first normalize to
+	 * being relative to the start of the section.
+	 */
+	while (i < image_size) {
+		uint32_t *loc = (uint32_t *)(extab_image + i);
+		w(r(loc) + i, loc);
+		i += 4;
+	}
+
+	qsort(extab_image, image_size / 8, 8, compare_relative_table);
+
+	/* Now denormalize. */
+	i = 0;
+	while (i < image_size) {
+		uint32_t *loc = (uint32_t *)(extab_image + i);
+		w(r(loc) - i, loc);
+		i += 4;
+	}
+}
+
+static void x86_sort_relative_table(char *extab_image, int image_size)
+{
+	int i = 0;
+
+	while (i < image_size) {
+		uint32_t *loc = (uint32_t *)(extab_image + i);
+
+		w(r(loc) + i, loc);
+		w(r(loc + 1) + i + 4, loc + 1);
+		w(r(loc + 2) + i + 8, loc + 2);
+
+		i += sizeof(uint32_t) * 3;
+	}
+
+	qsort(extab_image, image_size / 12, 12, compare_relative_table);
+
+	i = 0;
+	while (i < image_size) {
+		uint32_t *loc = (uint32_t *)(extab_image + i);
+
+		w(r(loc) - i, loc);
+		w(r(loc + 1) - (i + 4), loc + 1);
+		w(r(loc + 2) - (i + 8), loc + 2);
+
+		i += sizeof(uint32_t) * 3;
+	}
+}
+
+static int do_file(char const *const fname, void *addr)
+{
+	int rc = -1;
+	Elf32_Ehdr *ehdr = addr;
+	table_sort_t custom_sort = NULL;
+
+	switch (ehdr->e_ident[EI_DATA]) {
+	case ELFDATA2LSB:
+		r	= rle;
+		r2	= r2le;
+		r8	= r8le;
+		w	= wle;
+		w2	= w2le;
+		w8	= w8le;
+		break;
+	case ELFDATA2MSB:
+		r	= rbe;
+		r2	= r2be;
+		r8	= r8be;
+		w	= wbe;
+		w2	= w2be;
+		w8	= w8be;
+		break;
+	default:
+		fprintf(stderr, "unrecognized ELF data encoding %d: %s\n",
+			ehdr->e_ident[EI_DATA], fname);
+		return -1;
+	}
+
+	if (memcmp(ELFMAG, ehdr->e_ident, SELFMAG) != 0 ||
+	    (r2(&ehdr->e_type) != ET_EXEC && r2(&ehdr->e_type) != ET_DYN) ||
+	    ehdr->e_ident[EI_VERSION] != EV_CURRENT) {
+		fprintf(stderr, "unrecognized ET_EXEC/ET_DYN file %s\n", fname);
+		return -1;
+	}
+
+	switch (r2(&ehdr->e_machine)) {
+	case EM_386:
+	case EM_X86_64:
+		custom_sort = x86_sort_relative_table;
+		break;
+	case EM_S390:
+	case EM_AARCH64:
+	case EM_PARISC:
+	case EM_PPC:
+	case EM_PPC64:
+		custom_sort = sort_relative_table;
+		break;
+	case EM_ARCOMPACT:
+	case EM_ARCV2:
+	case EM_ARM:
+	case EM_MICROBLAZE:
+	case EM_MIPS:
+	case EM_XTENSA:
+		break;
+	default:
+		fprintf(stderr, "unrecognized e_machine %d %s\n",
+			r2(&ehdr->e_machine), fname);
+		return -1;
+	}
+
+	switch (ehdr->e_ident[EI_CLASS]) {
+	case ELFCLASS32:
+		if (r2(&ehdr->e_ehsize) != sizeof(Elf32_Ehdr) ||
+		    r2(&ehdr->e_shentsize) != sizeof(Elf32_Shdr)) {
+			fprintf(stderr,
+				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
+			break;
+		}
+		rc = do_sort_32(ehdr, fname, custom_sort);
+		break;
+	case ELFCLASS64:
+		{
+		Elf64_Ehdr *const ghdr = (Elf64_Ehdr *)ehdr;
+		if (r2(&ghdr->e_ehsize) != sizeof(Elf64_Ehdr) ||
+		    r2(&ghdr->e_shentsize) != sizeof(Elf64_Shdr)) {
+			fprintf(stderr,
+				"unrecognized ET_EXEC/ET_DYN file: %s\n",
+				fname);
+			break;
+		}
+		rc = do_sort_64(ghdr, fname, custom_sort);
+		}
+		break;
+	default:
+		fprintf(stderr, "unrecognized ELF class %d %s\n",
+			ehdr->e_ident[EI_CLASS], fname);
+		break;
+	}
+
+	return rc;
+}
+
+int main(int argc, char *argv[])
+{
+	int i, n_error = 0;  /* gcc-4.3.0 false positive complaint */
+	size_t size = 0;
+	void *addr = NULL;
+
+	if (argc < 2) {
+		fprintf(stderr, "usage: sorttable vmlinux...\n");
+		return 0;
+	}
+
+	/* Process each file in turn, allowing deep failure. */
+	for (i = 1; i < argc; i++) {
+		addr = mmap_file(argv[i], &size);
+		if (!addr) {
+			++n_error;
+			continue;
+		}
+
+		if (do_file(argv[i], addr))
+			++n_error;
+
+		munmap(addr, size);
+	}
+
+	return !!n_error;
+}
diff --git a/scripts/sorttable.h b/scripts/sorttable.h
new file mode 100644
index 0000000..82589ff
--- /dev/null
+++ b/scripts/sorttable.h
@@ -0,0 +1,210 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * sorttable.h
+ *
+ * Copyright 2011 - 2012 Cavium, Inc.
+ *
+ * Some of this code was taken out of recordmcount.h written by:
+ *
+ * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>. All rights reserved.
+ * Copyright 2010 Steven Rostedt <srostedt@redhat.com>, Red Hat Inc.
+ */
+
+#undef extable_ent_size
+#undef compare_extable
+#undef do_sort
+#undef Elf_Addr
+#undef Elf_Ehdr
+#undef Elf_Shdr
+#undef Elf_Rel
+#undef Elf_Rela
+#undef Elf_Sym
+#undef ELF_R_SYM
+#undef Elf_r_sym
+#undef ELF_R_INFO
+#undef Elf_r_info
+#undef ELF_ST_BIND
+#undef ELF_ST_TYPE
+#undef fn_ELF_R_SYM
+#undef fn_ELF_R_INFO
+#undef uint_t
+#undef _r
+#undef _w
+
+#ifdef SORTTABLE_64
+# define extable_ent_size	16
+# define compare_extable	compare_extable_64
+# define do_sort		do_sort_64
+# define Elf_Addr		Elf64_Addr
+# define Elf_Ehdr		Elf64_Ehdr
+# define Elf_Shdr		Elf64_Shdr
+# define Elf_Rel		Elf64_Rel
+# define Elf_Rela		Elf64_Rela
+# define Elf_Sym		Elf64_Sym
+# define ELF_R_SYM		ELF64_R_SYM
+# define Elf_r_sym		Elf64_r_sym
+# define ELF_R_INFO		ELF64_R_INFO
+# define Elf_r_info		Elf64_r_info
+# define ELF_ST_BIND		ELF64_ST_BIND
+# define ELF_ST_TYPE		ELF64_ST_TYPE
+# define fn_ELF_R_SYM		fn_ELF64_R_SYM
+# define fn_ELF_R_INFO		fn_ELF64_R_INFO
+# define uint_t			uint64_t
+# define _r			r8
+# define _w			w8
+#else
+# define extable_ent_size	8
+# define compare_extable	compare_extable_32
+# define do_sort		do_sort_32
+# define Elf_Addr		Elf32_Addr
+# define Elf_Ehdr		Elf32_Ehdr
+# define Elf_Shdr		Elf32_Shdr
+# define Elf_Rel		Elf32_Rel
+# define Elf_Rela		Elf32_Rela
+# define Elf_Sym		Elf32_Sym
+# define ELF_R_SYM		ELF32_R_SYM
+# define Elf_r_sym		Elf32_r_sym
+# define ELF_R_INFO		ELF32_R_INFO
+# define Elf_r_info		Elf32_r_info
+# define ELF_ST_BIND		ELF32_ST_BIND
+# define ELF_ST_TYPE		ELF32_ST_TYPE
+# define fn_ELF_R_SYM		fn_ELF32_R_SYM
+# define fn_ELF_R_INFO		fn_ELF32_R_INFO
+# define uint_t			uint32_t
+# define _r			r
+# define _w			w
+#endif
+
+static int compare_extable(const void *a, const void *b)
+{
+	Elf_Addr av = _r(a);
+	Elf_Addr bv = _r(b);
+
+	if (av < bv)
+		return -1;
+	if (av > bv)
+		return 1;
+	return 0;
+}
+
+static int do_sort(Elf_Ehdr *ehdr,
+		   char const *const fname,
+		   table_sort_t custom_sort)
+{
+	Elf_Shdr *s, *shdr = (Elf_Shdr *)((char *)ehdr + _r(&ehdr->e_shoff));
+	Elf_Shdr *strtab_sec = NULL;
+	Elf_Shdr *symtab_sec = NULL;
+	Elf_Shdr *extab_sec = NULL;
+	Elf_Sym *sym;
+	const Elf_Sym *symtab;
+	Elf32_Word *symtab_shndx = NULL;
+	Elf_Sym *sort_needed_sym = NULL;
+	Elf_Shdr *sort_needed_sec;
+	Elf_Rel *relocs = NULL;
+	int relocs_size = 0;
+	uint32_t *sort_needed_loc;
+	const char *secstrings;
+	const char *strtab;
+	char *extab_image;
+	int extab_index = 0;
+	int i;
+	int idx;
+	unsigned int shnum;
+	unsigned int shstrndx;
+
+	shstrndx = r2(&ehdr->e_shstrndx);
+	if (shstrndx == SHN_XINDEX)
+		shstrndx = r(&shdr[0].sh_link);
+	secstrings = (const char *)ehdr + _r(&shdr[shstrndx].sh_offset);
+
+	shnum = r2(&ehdr->e_shnum);
+	if (shnum == SHN_UNDEF)
+		shnum = _r(&shdr[0].sh_size);
+
+	for (i = 0, s = shdr; s < shdr + shnum; i++, s++) {
+		idx = r(&s->sh_name);
+		if (!strcmp(secstrings + idx, "__ex_table")) {
+			extab_sec = s;
+			extab_index = i;
+		}
+		if (!strcmp(secstrings + idx, ".symtab"))
+			symtab_sec = s;
+		if (!strcmp(secstrings + idx, ".strtab"))
+			strtab_sec = s;
+
+		if ((r(&s->sh_type) == SHT_REL ||
+		     r(&s->sh_type) == SHT_RELA) &&
+		    r(&s->sh_info) == extab_index) {
+			relocs = (void *)ehdr + _r(&s->sh_offset);
+			relocs_size = _r(&s->sh_size);
+		}
+		if (r(&s->sh_type) == SHT_SYMTAB_SHNDX)
+			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
+						      _r(&s->sh_offset));
+	}
+
+	if (!extab_sec) {
+		fprintf(stderr,	"no __ex_table in file: %s\n", fname);
+		return -1;
+	}
+
+	if (!symtab_sec) {
+		fprintf(stderr,	"no .symtab in file: %s\n", fname);
+		return -1;
+	}
+
+	if (!strtab_sec) {
+		fprintf(stderr,	"no .strtab in file: %s\n", fname);
+		return -1;
+	}
+
+	extab_image = (void *)ehdr + _r(&extab_sec->sh_offset);
+	strtab = (const char *)ehdr + _r(&strtab_sec->sh_offset);
+	symtab = (const Elf_Sym *)((const char *)ehdr +
+						  _r(&symtab_sec->sh_offset));
+
+	if (custom_sort) {
+		custom_sort(extab_image, _r(&extab_sec->sh_size));
+	} else {
+		int num_entries = _r(&extab_sec->sh_size) / extable_ent_size;
+		qsort(extab_image, num_entries,
+		      extable_ent_size, compare_extable);
+	}
+
+	/* If there were relocations, we no longer need them. */
+	if (relocs)
+		memset(relocs, 0, relocs_size);
+
+	/* find the flag main_extable_sort_needed */
+	for (sym = (void *)ehdr + _r(&symtab_sec->sh_offset);
+	     sym < sym + _r(&symtab_sec->sh_size) / sizeof(Elf_Sym);
+	     sym++) {
+		if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
+			continue;
+		if (!strcmp(strtab + r(&sym->st_name),
+			    "main_extable_sort_needed")) {
+			sort_needed_sym = sym;
+			break;
+		}
+	}
+
+	if (!sort_needed_sym) {
+		fprintf(stderr,
+			"no main_extable_sort_needed symbol in file: %s\n",
+			fname);
+		return -1;
+	}
+
+	sort_needed_sec = &shdr[get_secindex(r2(&sym->st_shndx),
+					     sort_needed_sym - symtab,
+					     symtab_shndx)];
+	sort_needed_loc = (void *)ehdr +
+		_r(&sort_needed_sec->sh_offset) +
+		_r(&sort_needed_sym->st_value) -
+		_r(&sort_needed_sec->sh_addr);
+
+	/* extable has been sorted, clear the flag */
+	w(0, sort_needed_loc);
+
+	return 0;
+}
