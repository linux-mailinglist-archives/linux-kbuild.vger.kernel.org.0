Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71FFBFD68E
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 07:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfKOGss (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 01:48:48 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:38893 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726994AbfKOGss (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 01:48:48 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0Ti7ujx6_1573800472;
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
Subject: [RFC PATCH v3 6/7] scripts/sorttable: Add ORC unwind tables sort concurrently
Date:   Fri, 15 Nov 2019 14:47:49 +0800
Message-Id: <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

ORC unwinder have two tables, .orc_unwind_ip and .orc_unwind, which
needs sorted for binary search. To sort it at build time can save more
CPU cycles help to speed up kernel booting.

Add the ORC tables sorting in a sperated thread helps to avoid more link
cost of kernel building.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 scripts/Makefile    |   5 ++
 scripts/sorttable.h | 214 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 213 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 658d201f7f8b..06e9f4f5ea93 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -26,6 +26,11 @@ HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
 HOSTLDLIBS_sign-file = -lcrypto
 HOSTLDLIBS_extract-cert = -lcrypto
 
+ifdef CONFIG_UNWINDER_ORC
+HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
+HOSTLDLIBS_sorttable = -lpthread
+endif
+
 always		:= $(hostprogs-y) $(hostprogs-m)
 
 # The following hostprogs-y programs are only build on demand
diff --git a/scripts/sorttable.h b/scripts/sorttable.h
index 82589ff90e25..a75f8b4a125f 100644
--- a/scripts/sorttable.h
+++ b/scripts/sorttable.h
@@ -4,6 +4,14 @@
  *
  * Copyright 2011 - 2012 Cavium, Inc.
  *
+ * Added ORC unwind tables sort support, and other updates:
+ * Copyright (C) 1999-2019 Alibaba Group Holding Limited. by:
+ * Shile Zhang <shile.zhang@linux.alibaba.com>
+ *
+ * Some of code was taken out of /lib/sort.c, and
+ * arch/x86/kernel/unwind_orc.c written by:
+ * Copyright (C) 2017 Josh Poimboeuf <jpoimboe@redhat.com>
+ *
  * Some of this code was taken out of recordmcount.h written by:
  *
  * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>. All rights reserved.
@@ -75,6 +83,162 @@
 # define _w			w
 #endif
 
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+/* ORC unwinder only support X86_64 */
+#include <errno.h>
+#include <pthread.h>
+#include <linux/types.h>
+
+#define ORC_REG_UNDEFINED	0
+#define ERRSTRING_MAXSZ		256
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
+struct orctable_info {
+	size_t	orc_size;
+	size_t	orc_ip_size;
+} orctable;
+
+char g_errstring[ERRSTRING_MAXSZ];
+int *g_orc_ip_table;
+struct orc_entry *g_orc_table;
+pthread_t orc_sort_thread;
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
+ *
+ * This code token out of /lib/sort.c.
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
+	orc_a = g_orc_table + (a - g_orc_ip_table);
+	orc_b = g_orc_table + (b - g_orc_ip_table);
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
+	orc_a = g_orc_table + (a - g_orc_ip_table);
+	return orc_a->sp_reg == ORC_REG_UNDEFINED && !orc_a->end ? -1 : 1;
+}
+
+static void *sort_orctable(void *arg)
+{
+	struct orctable_info *orcptr = (struct orctable_info *)arg;
+	unsigned int num_entries;
+
+	if (!g_orc_ip_table || !g_orc_table) {
+		snprintf(g_errstring, ERRSTRING_MAXSZ,
+			 "cannot find ORC unwind tables");
+		pthread_exit(g_errstring);
+	}
+
+	num_entries = orcptr->orc_ip_size / sizeof(int);
+
+	if (orcptr->orc_ip_size % sizeof(int) != 0 ||
+	    orcptr->orc_size % sizeof(struct orc_entry) != 0 ||
+	    num_entries != orcptr->orc_size / sizeof(struct orc_entry)) {
+		snprintf(g_errstring, ERRSTRING_MAXSZ,
+			"wrong ORC unwind table entries number");
+		pthread_exit(g_errstring);
+	}
+
+	sort(g_orc_ip_table, num_entries, sizeof(int),
+	     orc_sort_cmp, orc_sort_swap);
+
+	pthread_exit(NULL);
+}
+#endif
+
 static int compare_extable(const void *a, const void *b)
 {
 	Elf_Addr av = _r(a);
@@ -91,6 +255,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 		   char const *const fname,
 		   table_sort_t custom_sort)
 {
+	int rc = -1;
 	Elf_Shdr *s, *shdr = (Elf_Shdr *)((char *)ehdr + _r(&ehdr->e_shoff));
 	Elf_Shdr *strtab_sec = NULL;
 	Elf_Shdr *symtab_sec = NULL;
@@ -141,21 +306,44 @@ static int do_sort(Elf_Ehdr *ehdr,
 		if (r(&s->sh_type) == SHT_SYMTAB_SHNDX)
 			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
 						      _r(&s->sh_offset));
-	}
 
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+		/* locate the ORC unwind tables */
+		if (!strcmp(secstrings + idx, ".orc_unwind_ip")) {
+			orctable.orc_ip_size = s->sh_size;
+			g_orc_ip_table = (int *)((void *)ehdr +
+						   s->sh_offset);
+		}
+		if (!strcmp(secstrings + idx, ".orc_unwind")) {
+			orctable.orc_size = s->sh_size;
+			g_orc_table = (struct orc_entry *)((void *)ehdr +
+							     s->sh_offset);
+		}
+#endif
+	} /* for loop */
+
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+	/* create thread to sort ORC unwind tables concurrently */
+	if (pthread_create(&orc_sort_thread, NULL, sort_orctable, &orctable)) {
+		fprintf(stderr,
+			"pthread_create orc_sort_thread failed '%s': %s\n",
+			strerror(errno), fname);
+		goto out;
+	}
+#endif
 	if (!extab_sec) {
 		fprintf(stderr,	"no __ex_table in file: %s\n", fname);
-		return -1;
+		goto out;
 	}
 
 	if (!symtab_sec) {
 		fprintf(stderr,	"no .symtab in file: %s\n", fname);
-		return -1;
+		goto out;
 	}
 
 	if (!strtab_sec) {
 		fprintf(stderr,	"no .strtab in file: %s\n", fname);
-		return -1;
+		goto out;
 	}
 
 	extab_image = (void *)ehdr + _r(&extab_sec->sh_offset);
@@ -192,7 +380,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 		fprintf(stderr,
 			"no main_extable_sort_needed symbol in file: %s\n",
 			fname);
-		return -1;
+		goto out;
 	}
 
 	sort_needed_sec = &shdr[get_secindex(r2(&sym->st_shndx),
@@ -205,6 +393,20 @@ static int do_sort(Elf_Ehdr *ehdr,
 
 	/* extable has been sorted, clear the flag */
 	w(0, sort_needed_loc);
+	rc = 0;
 
-	return 0;
+out:
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+	{ /* to avoid gcc warning about declaration */
+	void *retval = NULL;
+
+	/* wait for ORC tables sort done */
+	pthread_join(orc_sort_thread, &retval);
+	if (retval) {
+		fprintf(stderr, "%s in file: %s\n", (char *)retval, fname);
+		rc = -1;
+	}
+	}
+#endif
+	return rc;
 }
-- 
2.24.0.rc2

