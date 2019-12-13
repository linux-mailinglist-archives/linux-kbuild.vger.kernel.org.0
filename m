Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9714511E17E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2019 11:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfLMKEA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Dec 2019 05:04:00 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:47791 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLMKEA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 05:04:00 -0500
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1ifhnN-0008KK-PJ; Fri, 13 Dec 2019 11:03:37 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 682BE1C2929;
        Fri, 13 Dec 2019 11:03:37 +0100 (CET)
Date:   Fri, 13 Dec 2019 10:03:37 -0000
From:   "tip-bot2 for Shile Zhang" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: core/objtool] scripts/sorttable: Implement build-time ORC
 unwind table sorting
Cc:     Andy Lutomirski <luto@amacapital.net>,
        Peter Zijlstra <peterz@infradead.org>,
        kbuild test robot <lkp@intel.com>,
        Shile Zhang <shile.zhang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20191204004633.88660-7-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-7-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Message-ID: <157623141731.30329.6609844909829756463.tip-bot2@tip-bot2>
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

Commit-ID:     57fa1899428538e314a7e0d52a5b617af082389a
Gitweb:        https://git.kernel.org/tip/57fa1899428538e314a7e0d52a5b617af082389a
Author:        Shile Zhang <shile.zhang@linux.alibaba.com>
AuthorDate:    Wed, 04 Dec 2019 08:46:32 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 13 Dec 2019 10:47:58 +01:00

scripts/sorttable: Implement build-time ORC unwind table sorting

The ORC unwinder has two tables: .orc_unwind_ip and .orc_unwind, which
need to be sorted for binary search. Previously this sorting was done
during bootup.

Sort them at build time to speed up booting.

Add the ORC tables sorting in a parallel build process to speed up the build.

[ mingo: Rewrote the changelog and fixed some comments. ]

Suggested-by: Andy Lutomirski <luto@amacapital.net>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Link: https://lkml.kernel.org/r/20191204004633.88660-7-shile.zhang@linux.alibaba.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 scripts/Makefile    |   9 ++-
 scripts/sorttable.c |   6 +-
 scripts/sorttable.h | 180 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 189 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 7491241..b0e9626 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -24,6 +24,15 @@ HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
 HOSTLDLIBS_sign-file = -lcrypto
 HOSTLDLIBS_extract-cert = -lcrypto
 
+ifdef CONFIG_UNWINDER_ORC
+ifeq ($(ARCH),x86_64)
+ARCH := x86
+endif
+HOSTCFLAGS_sorttable.o += -I$(srctree)/tools/arch/x86/include
+HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
+HOSTLDLIBS_sorttable = -lpthread
+endif
+
 always		:= $(hostprogs-y) $(hostprogs-m)
 
 # The following hostprogs-y programs are only build on demand
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index ff98b7d..ec6b5e8 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -2,6 +2,10 @@
 /*
  * sorttable.c: Sort the kernel's table
  *
+ * Added ORC unwind tables sort support and other updates:
+ * Copyright (C) 1999-2019 Alibaba Group Holding Limited. by:
+ * Shile Zhang <shile.zhang@linux.alibaba.com>
+ *
  * Copyright 2011 - 2012 Cavium, Inc.
  *
  * Based on code taken from recortmcount.c which is:
@@ -9,7 +13,7 @@
  * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>.  All rights reserved.
  *
  * Restructured to fit Linux format, as well as other updates:
- *  Copyright 2010 Steven Rostedt <srostedt@redhat.com>, Red Hat Inc.
+ * Copyright 2010 Steven Rostedt <srostedt@redhat.com>, Red Hat Inc.
  */
 
 /*
diff --git a/scripts/sorttable.h b/scripts/sorttable.h
index 82589ff..a2baa2f 100644
--- a/scripts/sorttable.h
+++ b/scripts/sorttable.h
@@ -2,8 +2,15 @@
 /*
  * sorttable.h
  *
+ * Added ORC unwind tables sort support and other updates:
+ * Copyright (C) 1999-2019 Alibaba Group Holding Limited. by:
+ * Shile Zhang <shile.zhang@linux.alibaba.com>
+ *
  * Copyright 2011 - 2012 Cavium, Inc.
  *
+ * Some of code was taken out of arch/x86/kernel/unwind_orc.c, written by:
+ * Copyright (C) 2017 Josh Poimboeuf <jpoimboe@redhat.com>
+ *
  * Some of this code was taken out of recordmcount.h written by:
  *
  * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>. All rights reserved.
@@ -75,6 +82,104 @@
 # define _w			w
 #endif
 
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+/* ORC unwinder only support X86_64 */
+#include <errno.h>
+#include <pthread.h>
+#include <asm/orc_types.h>
+
+#define ERRSTR_MAXSZ	256
+
+char g_err[ERRSTR_MAXSZ];
+int *g_orc_ip_table;
+struct orc_entry *g_orc_table;
+
+pthread_t orc_sort_thread;
+
+static inline unsigned long orc_ip(const int *ip)
+{
+	return (unsigned long)ip + *ip;
+}
+
+static int orc_sort_cmp(const void *_a, const void *_b)
+{
+	struct orc_entry *orc_a;
+	const int *a = g_orc_ip_table + *(int *)_a;
+	const int *b = g_orc_ip_table + *(int *)_b;
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
+	int i;
+	int *idxs = NULL;
+	int *tmp_orc_ip_table = NULL;
+	struct orc_entry *tmp_orc_table = NULL;
+	unsigned int *orc_ip_size = (unsigned int *)arg;
+	unsigned int num_entries = *orc_ip_size / sizeof(int);
+	unsigned int orc_size = num_entries * sizeof(struct orc_entry);
+
+	idxs = (int *)malloc(*orc_ip_size);
+	if (!idxs) {
+		snprintf(g_err, ERRSTR_MAXSZ, "malloc idxs: %s",
+			 strerror(errno));
+		pthread_exit(g_err);
+	}
+
+	tmp_orc_ip_table = (int *)malloc(*orc_ip_size);
+	if (!tmp_orc_ip_table) {
+		snprintf(g_err, ERRSTR_MAXSZ, "malloc tmp_orc_ip_table: %s",
+			 strerror(errno));
+		pthread_exit(g_err);
+	}
+
+	tmp_orc_table = (struct orc_entry *)malloc(orc_size);
+	if (!tmp_orc_table) {
+		snprintf(g_err, ERRSTR_MAXSZ, "malloc tmp_orc_table: %s",
+			 strerror(errno));
+		pthread_exit(g_err);
+	}
+
+	/* initialize indices array, convert ip_table to absolute address */
+	for (i = 0; i < num_entries; i++) {
+		idxs[i] = i;
+		tmp_orc_ip_table[i] = g_orc_ip_table[i] + i * sizeof(int);
+	}
+	memcpy(tmp_orc_table, g_orc_table, orc_size);
+
+	qsort(idxs, num_entries, sizeof(int), orc_sort_cmp);
+
+	for (i = 0; i < num_entries; i++) {
+		if (idxs[i] == i)
+			continue;
+
+		/* convert back to relative address */
+		g_orc_ip_table[i] = tmp_orc_ip_table[idxs[i]] - i * sizeof(int);
+		g_orc_table[i] = tmp_orc_table[idxs[i]];
+	}
+
+	free(idxs);
+	free(tmp_orc_ip_table);
+	free(tmp_orc_table);
+	pthread_exit(NULL);
+}
+#endif
+
 static int compare_extable(const void *a, const void *b)
 {
 	Elf_Addr av = _r(a);
@@ -91,6 +196,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 		   char const *const fname,
 		   table_sort_t custom_sort)
 {
+	int rc = -1;
 	Elf_Shdr *s, *shdr = (Elf_Shdr *)((char *)ehdr + _r(&ehdr->e_shoff));
 	Elf_Shdr *strtab_sec = NULL;
 	Elf_Shdr *symtab_sec = NULL;
@@ -111,6 +217,11 @@ static int do_sort(Elf_Ehdr *ehdr,
 	int idx;
 	unsigned int shnum;
 	unsigned int shstrndx;
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+	unsigned int orc_ip_size = 0;
+	unsigned int orc_size = 0;
+	unsigned int orc_num_entries = 0;
+#endif
 
 	shstrndx = r2(&ehdr->e_shstrndx);
 	if (shstrndx == SHN_XINDEX)
@@ -141,21 +252,61 @@ static int do_sort(Elf_Ehdr *ehdr,
 		if (r(&s->sh_type) == SHT_SYMTAB_SHNDX)
 			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
 						      _r(&s->sh_offset));
+
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+		/* locate the ORC unwind tables */
+		if (!strcmp(secstrings + idx, ".orc_unwind_ip")) {
+			orc_ip_size = s->sh_size;
+			g_orc_ip_table = (int *)((void *)ehdr +
+						   s->sh_offset);
+		}
+		if (!strcmp(secstrings + idx, ".orc_unwind")) {
+			orc_size = s->sh_size;
+			g_orc_table = (struct orc_entry *)((void *)ehdr +
+							     s->sh_offset);
+		}
+#endif
+	} /* for loop */
+
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+	if (!g_orc_ip_table || !g_orc_table) {
+		fprintf(stderr,
+			"incomplete ORC unwind tables in file: %s\n", fname);
+		goto out;
+	}
+
+	orc_num_entries = orc_ip_size / sizeof(int);
+	if (orc_ip_size % sizeof(int) != 0 ||
+	    orc_size % sizeof(struct orc_entry) != 0 ||
+	    orc_num_entries != orc_size / sizeof(struct orc_entry)) {
+		fprintf(stderr,
+			"inconsistent ORC unwind table entries in file: %s\n",
+			fname);
+		goto out;
 	}
 
+	/* create thread to sort ORC unwind tables concurrently */
+	if (pthread_create(&orc_sort_thread, NULL,
+			   sort_orctable, &orc_ip_size)) {
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
@@ -192,7 +343,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 		fprintf(stderr,
 			"no main_extable_sort_needed symbol in file: %s\n",
 			fname);
-		return -1;
+		goto out;
 	}
 
 	sort_needed_sec = &shdr[get_secindex(r2(&sym->st_shndx),
@@ -205,6 +356,25 @@ static int do_sort(Elf_Ehdr *ehdr,
 
 	/* extable has been sorted, clear the flag */
 	w(0, sort_needed_loc);
+	rc = 0;
 
-	return 0;
+out:
+#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
+	if (orc_sort_thread) {
+		void *retval = NULL;
+		/* wait for ORC tables sort done */
+		rc = pthread_join(orc_sort_thread, &retval);
+		if (rc)
+			fprintf(stderr,
+				"pthread_join failed '%s': %s\n",
+				strerror(errno), fname);
+		else if (retval) {
+			rc = -1;
+			fprintf(stderr,
+				"failed to sort ORC tables '%s': %s\n",
+				(char *)retval, fname);
+		}
+	}
+#endif
+	return rc;
 }
