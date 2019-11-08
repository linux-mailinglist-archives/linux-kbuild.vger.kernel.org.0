Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B04F4109
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2019 08:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730319AbfKHHL0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Nov 2019 02:11:26 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:34603 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730231AbfKHHLY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 02:11:24 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01419;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0ThU5MwV_1573197070;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0ThU5MwV_1573197070)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Nov 2019 15:11:20 +0800
From:   shile.zhang@linux.alibaba.com
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v2 1/3] scripts: Add sortorctable to sort ORC unwind tables
Date:   Fri,  8 Nov 2019 15:11:06 +0800
Message-Id: <20191108071108.72132-2-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
References: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Shile Zhang <shile.zhang@linux.alibaba.com>

Sort orc_unwind and orc_unwind_ip tables at build time instead of runtime
in boot pharse can save more boot time.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 scripts/.gitignore     |   1 +
 scripts/Makefile       |   2 +
 scripts/sortorctable.c | 251 +++++++++++++++++++++++++++++++++++++++++
 scripts/sortorctable.h |  26 +++++
 4 files changed, 280 insertions(+)
 create mode 100644 scripts/sortorctable.c
 create mode 100644 scripts/sortorctable.h

diff --git a/scripts/.gitignore b/scripts/.gitignore
index 17f8cef88fa8..52976f32f974 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -12,3 +12,4 @@ asn1_compiler
 extract-cert
 sign-file
 insert-sys-cert
+sortorctable
diff --git a/scripts/Makefile b/scripts/Makefile
index 3e86b300f5a1..4473f8d7da0c 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -16,12 +16,14 @@ hostprogs-$(CONFIG_LOGO)         += pnmtologo
 hostprogs-$(CONFIG_VT)           += conmakehash
 hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
 hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
+hostprogs-$(CONFIG_UNWINDER_ORC) += sortorctable
 hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
 hostprogs-$(CONFIG_MODULE_SIG_FORMAT) += sign-file
 hostprogs-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += extract-cert
 hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) += insert-sys-cert
 
 HOSTCFLAGS_sortextable.o = -I$(srctree)/tools/include
+HOSTCFLAGS_sortorctable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
 HOSTLDLIBS_sign-file = -lcrypto
 HOSTLDLIBS_extract-cert = -lcrypto
diff --git a/scripts/sortorctable.c b/scripts/sortorctable.c
new file mode 100644
index 000000000000..193e06ac2632
--- /dev/null
+++ b/scripts/sortorctable.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * sortorctable: used to sort the ORC unwind tables
+ *
+ * Copyright (C) 2019 Alibaba Group Holding Limited. All rights reserved.
+ * Written by Shile Zhang <shile.zhang@linux.alibaba.com>
+ *
+ * Some code taken out of lib/sort.c and
+ * arch/x86/kernel/unwind_orc.c written by:
+ * Copyright (C) 2017 Josh Poimboeuf <jpoimboe@redhat.com>
+ *
+ * Strategy: alter the vmlinux file in-place
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <string.h>
+#include <errno.h>
+#include <sys/mman.h>
+#include <elf.h>
+
+#include "sortorctable.h"
+
+int *cur_orc_ip_table;
+struct orc_entry *cur_orc_table;
+
+/**
+ * sort - sort an array of elements
+ * @base: pointer to data to sort
+ * @num: number of elements
+ * @size: size of each element
+ * @cmp_func: pointer to comparison function
+ * @swap_func: pointer to swap function
+ *
+ * This function does a heapsort on the given array. You may provide a
+ * swap_func function optimized to your element type.
+ *
+ * Sorting time is O(n log n) both on average and worst-case. While
+ * qsort is about 20% faster on average, it suffers from exploitable
+ * O(n*n) worst-case behavior and extra memory requirements that make
+ * it less suitable for kernel use.
+ */
+static void sort(void *base, size_t num, size_t size,
+	  int (*cmp_func)(const void *, const void *),
+	  void (*swap_func)(void *, void *, int size))
+{
+	/* pre-scale counters for performance */
+	int i = (num/2 - 1) * size, n = num * size, c, r;
+
+	/* heapify */
+	for ( ; i >= 0; i -= size) {
+		for (r = i; r * 2 + size < n; r  = c) {
+			c = r * 2 + size;
+			if (c < n - size &&
+					cmp_func(base + c, base + c + size) < 0)
+				c += size;
+			if (cmp_func(base + r, base + c) >= 0)
+				break;
+			swap_func(base + r, base + c, size);
+		}
+	}
+
+	/* sort */
+	for (i = n - size; i > 0; i -= size) {
+		swap_func(base, base + i, size);
+		for (r = 0; r * 2 + size < i; r = c) {
+			c = r * 2 + size;
+			if (c < i - size &&
+					cmp_func(base + c, base + c + size) < 0)
+				c += size;
+			if (cmp_func(base + r, base + c) >= 0)
+				break;
+			swap_func(base + r, base + c, size);
+		}
+	}
+}
+
+static inline unsigned long orc_ip(const int *ip)
+{
+	return (unsigned long)ip + *ip;
+}
+
+static void orc_sort_swap(void *_a, void *_b, int size)
+{
+	struct orc_entry *orc_a, *orc_b;
+	struct orc_entry orc_tmp;
+	int *a = _a, *b = _b, tmp;
+	int delta = _b - _a;
+
+	/* Swap the .orc_unwind_ip entries: */
+	tmp = *a;
+	*a = *b + delta;
+	*b = tmp - delta;
+
+	/* Swap the corresponding .orc_unwind entries: */
+	orc_a = cur_orc_table + (a - cur_orc_ip_table);
+	orc_b = cur_orc_table + (b - cur_orc_ip_table);
+	orc_tmp = *orc_a;
+	*orc_a = *orc_b;
+	*orc_b = orc_tmp;
+}
+
+static int orc_sort_cmp(const void *_a, const void *_b)
+{
+	struct orc_entry *orc_a;
+	const int *a = _a, *b = _b;
+	unsigned long a_val = orc_ip(a);
+	unsigned long b_val = orc_ip(b);
+
+	if (a_val > b_val)
+		return 1;
+	if (a_val < b_val)
+		return -1;
+
+	/*
+	 * The "weak" section terminator entries need to always be on the left
+	 * to ensure the lookup code skips them in favor of real entries.
+	 * These terminator entries exist to handle any gaps created by
+	 * whitelisted .o files which didn't get objtool generation.
+	 */
+	orc_a = cur_orc_table + (a - cur_orc_ip_table);
+	return orc_a->sp_reg == ORC_REG_UNDEFINED && !orc_a->end ? -1 : 1;
+}
+
+/* ORC unwind only supports X86_64 */
+static int do_precheck(const char *fname, void *addr)
+{
+	Elf64_Ehdr * const ehdr = addr;
+
+	if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB) {
+		fprintf(stderr, "%s: unsupported ELF data encoding %d\n",
+			fname, ehdr->e_ident[EI_DATA]);
+		return 1;
+	}
+
+	if (memcmp(ELFMAG, ehdr->e_ident, SELFMAG) != 0
+	    || (ehdr->e_type != ET_EXEC && ehdr->e_type != ET_DYN)
+	    || ehdr->e_ident[EI_VERSION] != EV_CURRENT) {
+		fprintf(stderr,
+			"%s: unrecognized ET_EXEC/ET_DYN file\n", fname);
+		return 1;
+	}
+
+	if (ehdr->e_machine != EM_X86_64) {
+		fprintf(stderr, "%s: unsupported e_machine %d\n",
+			fname, ehdr->e_machine);
+		return 1;
+	}
+
+	if (ehdr->e_ident[EI_CLASS] != ELFCLASS64
+	    || ehdr->e_ehsize != sizeof(Elf64_Ehdr)
+	    || ehdr->e_shentsize != sizeof(Elf64_Shdr)) {
+		fprintf(stderr, "%s: unrecognized ELF class %d\n",
+			fname, ehdr->e_ident[EI_CLASS]);
+		return 1;
+	}
+
+	return 0;
+}
+
+static int do_sort(const char *fname, void *addr)
+{
+	unsigned int orc_size, orc_ip_size, num_entries;
+	const Elf64_Shdr *s, *_orc = NULL, *_orc_ip = NULL;
+	Elf64_Ehdr * const ehdr = (Elf64_Ehdr *)addr;
+	Elf64_Shdr * const shdr = (Elf64_Shdr *)((void *)ehdr + ehdr->e_shoff);
+	char *secstrings = (void *)ehdr + shdr[ehdr->e_shstrndx].sh_offset;
+
+	for (s = shdr; s < shdr + ehdr->e_shnum; s++) {
+		if (!strcmp(".orc_unwind_ip", secstrings + s->sh_name))
+			_orc_ip = s;
+		if (!strcmp(".orc_unwind", secstrings + s->sh_name))
+			_orc = s;
+	}
+
+	if (!_orc_ip || !_orc) {
+		fprintf(stderr,
+			"%s: cannot find ORC unwind tables\n", fname);
+		return 1;
+	}
+
+	orc_size	= _orc->sh_size;
+	orc_ip_size	= _orc_ip->sh_size;
+	num_entries	= orc_ip_size / sizeof(int);
+	cur_orc_table	= (struct orc_entry *)((void *)ehdr + _orc->sh_offset);
+	cur_orc_ip_table = (int *)((void *)ehdr + _orc_ip->sh_offset);
+
+	if (orc_ip_size % sizeof(int) != 0
+	    || orc_size % sizeof(struct orc_entry) != 0
+	    || num_entries != orc_size / sizeof(struct orc_entry)) {
+		fprintf(stderr,
+			"%s: wrong ORC unwind table entries number\n", fname);
+		return 1;
+	}
+
+	sort(cur_orc_ip_table, num_entries, sizeof(int), orc_sort_cmp,
+	     orc_sort_swap);
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int ret = 0;
+	int fd;
+	char *fname = NULL;
+	struct stat sb;
+	void *addr = NULL;
+
+	if (argc != 2) {
+		fprintf(stderr, "usage: sortorctable vmlinux\n");
+		return 0;
+	}
+
+	fname = argv[1];
+	fd = open(fname, O_RDWR);
+	if (fd < 0 || fstat(fd, &sb) < 0) {
+		perror(fname);
+		return errno;
+	}
+
+	if (!S_ISREG(sb.st_mode)) {
+		fprintf(stderr, "'%s': not a regular file\n", fname);
+		close(fd);
+		return 1;
+	}
+
+	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
+	if (addr == MAP_FAILED) {
+		fprintf(stderr, "'%s': mmap failed\n", fname);
+		close(fd);
+		return 1;
+	}
+
+	ret = do_precheck(fname, addr);
+	if (ret)
+		goto out;
+
+	ret = do_sort(fname, addr);
+
+out:
+	munmap(addr, sb.st_size);
+	close(fd);
+
+	return ret;
+}
diff --git a/scripts/sortorctable.h b/scripts/sortorctable.h
new file mode 100644
index 000000000000..af82391c70e6
--- /dev/null
+++ b/scripts/sortorctable.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Alibaba Group Holding Limited. All rights reserved.
+ * Written by Shile Zhang <shile.zhang@linux.alibaba.com>
+ *
+ * This code was taken out of arch/x86/include/asm/orc_types.h written by:
+ * Copyright (C) 2017 Josh Poimboeuf <jpoimboe@redhat.com>
+ */
+
+#ifndef _SORTORCTABLE_H_
+#define _SORTORCTABLE_H_
+
+#include <linux/types.h>
+
+#define ORC_REG_UNDEFINED	0
+
+struct orc_entry {
+	s16		sp_offset;
+	s16		bp_offset;
+	unsigned	sp_reg:4;
+	unsigned	bp_reg:4;
+	unsigned	type:2;
+	unsigned	end:1;
+} __attribute__((packed));
+
+#endif//_SORTORCTABLE_H_
-- 
2.24.0.rc2

