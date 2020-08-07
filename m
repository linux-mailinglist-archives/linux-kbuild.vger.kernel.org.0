Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D43623E69E
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 06:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgHGETB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 00:19:01 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:35203 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725379AbgHGETB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 00:19:01 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0U4zjh8C_1596773937;
Received: from localhost(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U4zjh8C_1596773937)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 07 Aug 2020 12:18:57 +0800
From:   Huaixin Chang <changhuaixin@linux.alibaba.com>
To:     changhuaixin@linux.alibaba.com
Cc:     bp@alien8.de, hpa@zytor.com, jpoimboe@redhat.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: [PATCH 2/3] scripts/sorttable: Build ORC fast lookup table via sorttable tool
Date:   Fri,  7 Aug 2020 12:18:01 +0800
Message-Id: <20200807041802.18639-3-changhuaixin@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
In-Reply-To: <20200807041802.18639-1-changhuaixin@linux.alibaba.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
 <20200807041802.18639-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since ORC tables are already sorted by sorttable tool, let us move
building of fast lookup table into sorttable tool too. This saves us
6380us from boot time under Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz
with 64 cores.

Signed-off-by: Huaixin Chang <changhuaixin@linux.alibaba.com>
Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/x86/include/asm/orc_lookup.h      | 16 ------
 arch/x86/include/asm/orc_types.h       | 16 ++++++
 arch/x86/kernel/vmlinux.lds.S          |  2 +-
 scripts/sorttable.h                    | 96 +++++++++++++++++++++++++++++++---
 tools/arch/x86/include/asm/orc_types.h | 16 ++++++
 5 files changed, 122 insertions(+), 24 deletions(-)

diff --git a/arch/x86/include/asm/orc_lookup.h b/arch/x86/include/asm/orc_lookup.h
index 241631282e43..c75eb1f82bdb 100644
--- a/arch/x86/include/asm/orc_lookup.h
+++ b/arch/x86/include/asm/orc_lookup.h
@@ -5,22 +5,6 @@
 #ifndef _ORC_LOOKUP_H
 #define _ORC_LOOKUP_H
 
-/*
- * This is a lookup table for speeding up access to the .orc_unwind table.
- * Given an input address offset, the corresponding lookup table entry
- * specifies a subset of the .orc_unwind table to search.
- *
- * Each block represents the end of the previous range and the start of the
- * next range.  An extra block is added to give the last range an end.
- *
- * The block size should be a power of 2 to avoid a costly 'div' instruction.
- *
- * A block size of 256 was chosen because it roughly doubles unwinder
- * performance while only adding ~5% to the ORC data footprint.
- */
-#define LOOKUP_BLOCK_ORDER	8
-#define LOOKUP_BLOCK_SIZE	(1 << LOOKUP_BLOCK_ORDER)
-
 #ifndef LINKER_SCRIPT
 
 extern unsigned int orc_lookup[];
diff --git a/arch/x86/include/asm/orc_types.h b/arch/x86/include/asm/orc_types.h
index d25534940bde..b93c6a7b4da4 100644
--- a/arch/x86/include/asm/orc_types.h
+++ b/arch/x86/include/asm/orc_types.h
@@ -9,6 +9,22 @@
 #include <linux/types.h>
 #include <linux/compiler.h>
 
+/*
+ * This is a lookup table for speeding up access to the .orc_unwind table.
+ * Given an input address offset, the corresponding lookup table entry
+ * specifies a subset of the .orc_unwind table to search.
+ *
+ * Each block represents the end of the previous range and the start of the
+ * next range.  An extra block is added to give the last range an end.
+ *
+ * The block size should be a power of 2 to avoid a costly 'div' instruction.
+ *
+ * A block size of 256 was chosen because it roughly doubles unwinder
+ * performance while only adding ~5% to the ORC data footprint.
+ */
+#define LOOKUP_BLOCK_ORDER	8
+#define LOOKUP_BLOCK_SIZE	(1 << LOOKUP_BLOCK_ORDER)
+
 /*
  * The ORC_REG_* registers are base registers which are used to find other
  * registers on the stack.
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 9a03e5b23135..75760e7f6319 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -29,7 +29,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/thread_info.h>
 #include <asm/page_types.h>
-#include <asm/orc_lookup.h>
+#include <asm/orc_types.h>
 #include <asm/cache.h>
 #include <asm/boot.h>
 
diff --git a/scripts/sorttable.h b/scripts/sorttable.h
index a2baa2fefb13..de9822f8ae8f 100644
--- a/scripts/sorttable.h
+++ b/scripts/sorttable.h
@@ -93,12 +93,50 @@
 char g_err[ERRSTR_MAXSZ];
 int *g_orc_ip_table;
 struct orc_entry *g_orc_table;
+static unsigned long orc_ip_table_offset;
 
 pthread_t orc_sort_thread;
 
+struct orc_sort_param {
+	size_t		lookup_table_size;
+	unsigned int	*orc_lookup_table;
+	unsigned long	start_ip;
+	size_t		text_size;
+	unsigned int	orc_num_entries;
+};
+
 static inline unsigned long orc_ip(const int *ip)
 {
-	return (unsigned long)ip + *ip;
+	return (unsigned long)ip + *ip + orc_ip_table_offset;
+}
+
+static struct orc_entry *__orc_find(int *ip_table, struct orc_entry *u_table,
+				    unsigned int num_entries, unsigned long ip)
+{
+	int *first = ip_table;
+	int *last = ip_table + num_entries - 1;
+	int *mid = first, *found = first;
+
+	if (!num_entries)
+		return NULL;
+
+	/*
+	 * Do a binary range search to find the rightmost duplicate of a given
+	 * starting address.  Some entries are section terminators which are
+	 * "weak" entries for ensuring there are no gaps.  They should be
+	 * ignored when they conflict with a real entry.
+	 */
+	while (first <= last) {
+		mid = first + ((last - first) / 2);
+
+		if (orc_ip(mid) <= ip) {
+			found = mid;
+			first = mid + 1;
+		} else
+			last = mid - 1;
+	}
+
+	return u_table + (found - ip_table);
 }
 
 static int orc_sort_cmp(const void *_a, const void *_b)
@@ -130,18 +168,24 @@ static void *sort_orctable(void *arg)
 	int *idxs = NULL;
 	int *tmp_orc_ip_table = NULL;
 	struct orc_entry *tmp_orc_table = NULL;
-	unsigned int *orc_ip_size = (unsigned int *)arg;
-	unsigned int num_entries = *orc_ip_size / sizeof(int);
+	struct orc_sort_param *param = (struct orc_sort_param *)arg;
+	unsigned int num_entries = param->orc_num_entries;
+	unsigned int orc_ip_size = num_entries * sizeof(int);
 	unsigned int orc_size = num_entries * sizeof(struct orc_entry);
+	unsigned int lookup_num_blocks = param->lookup_table_size / sizeof(int);
+	unsigned int *orc_lookup = param->orc_lookup_table;
+	unsigned long lookup_start_ip = param->start_ip;
+	unsigned long lookup_stop_ip = param->start_ip + param->text_size;
+	struct orc_entry *orc;
 
-	idxs = (int *)malloc(*orc_ip_size);
+	idxs = (int *)malloc(orc_ip_size);
 	if (!idxs) {
 		snprintf(g_err, ERRSTR_MAXSZ, "malloc idxs: %s",
 			 strerror(errno));
 		pthread_exit(g_err);
 	}
 
-	tmp_orc_ip_table = (int *)malloc(*orc_ip_size);
+	tmp_orc_ip_table = (int *)malloc(orc_ip_size);
 	if (!tmp_orc_ip_table) {
 		snprintf(g_err, ERRSTR_MAXSZ, "malloc tmp_orc_ip_table: %s",
 			 strerror(errno));
@@ -173,6 +217,28 @@ static void *sort_orctable(void *arg)
 		g_orc_table[i] = tmp_orc_table[idxs[i]];
 	}
 
+	for (i = 0; i < lookup_num_blocks-1; i++) {
+		orc = __orc_find(g_orc_ip_table, g_orc_table,
+				 num_entries,
+				 lookup_start_ip + (LOOKUP_BLOCK_SIZE * i));
+		if (!orc) {
+			snprintf(g_err, ERRSTR_MAXSZ,
+					"Corrupt .orc_unwind table\n");
+			pthread_exit(g_err);
+		}
+
+		orc_lookup[i] = orc - g_orc_table;
+	}
+
+	/* Initialize the ending block: */
+	orc = __orc_find(g_orc_ip_table, g_orc_table, num_entries,
+			 lookup_stop_ip);
+	if (!orc) {
+		snprintf(g_err, ERRSTR_MAXSZ, "Corrupt .orc_unwind table\n");
+		pthread_exit(g_err);
+	}
+	orc_lookup[lookup_num_blocks-1] = orc - g_orc_table;
+
 	free(idxs);
 	free(tmp_orc_ip_table);
 	free(tmp_orc_table);
@@ -221,6 +287,8 @@ static int do_sort(Elf_Ehdr *ehdr,
 	unsigned int orc_ip_size = 0;
 	unsigned int orc_size = 0;
 	unsigned int orc_num_entries = 0;
+	unsigned long orc_ip_addr = 0;
+	struct orc_sort_param param;
 #endif
 
 	shstrndx = r2(&ehdr->e_shstrndx);
@@ -259,17 +327,27 @@ static int do_sort(Elf_Ehdr *ehdr,
 			orc_ip_size = s->sh_size;
 			g_orc_ip_table = (int *)((void *)ehdr +
 						   s->sh_offset);
+			orc_ip_addr = s->sh_addr;
 		}
 		if (!strcmp(secstrings + idx, ".orc_unwind")) {
 			orc_size = s->sh_size;
 			g_orc_table = (struct orc_entry *)((void *)ehdr +
 							     s->sh_offset);
 		}
+		if (!strcmp(secstrings + idx, ".orc_lookup")) {
+			param.lookup_table_size = s->sh_size;
+			param.orc_lookup_table = (unsigned int *)
+				((void *)ehdr + s->sh_offset);
+		}
+		if (!strcmp(secstrings + idx, ".text")) {
+			param.text_size = s->sh_size;
+			param.start_ip = s->sh_addr;
+		}
 #endif
 	} /* for loop */
 
 #if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
-	if (!g_orc_ip_table || !g_orc_table) {
+	if (!g_orc_ip_table || !g_orc_table || !param.orc_lookup_table) {
 		fprintf(stderr,
 			"incomplete ORC unwind tables in file: %s\n", fname);
 		goto out;
@@ -285,9 +363,13 @@ static int do_sort(Elf_Ehdr *ehdr,
 		goto out;
 	}
 
+	/* Make orc_ip return virtual address at execution. */
+	orc_ip_table_offset = orc_ip_addr - (unsigned long)g_orc_ip_table;
+
 	/* create thread to sort ORC unwind tables concurrently */
+	param.orc_num_entries = orc_num_entries;
 	if (pthread_create(&orc_sort_thread, NULL,
-			   sort_orctable, &orc_ip_size)) {
+			   sort_orctable, &param)) {
 		fprintf(stderr,
 			"pthread_create orc_sort_thread failed '%s': %s\n",
 			strerror(errno), fname);
diff --git a/tools/arch/x86/include/asm/orc_types.h b/tools/arch/x86/include/asm/orc_types.h
index d25534940bde..b93c6a7b4da4 100644
--- a/tools/arch/x86/include/asm/orc_types.h
+++ b/tools/arch/x86/include/asm/orc_types.h
@@ -9,6 +9,22 @@
 #include <linux/types.h>
 #include <linux/compiler.h>
 
+/*
+ * This is a lookup table for speeding up access to the .orc_unwind table.
+ * Given an input address offset, the corresponding lookup table entry
+ * specifies a subset of the .orc_unwind table to search.
+ *
+ * Each block represents the end of the previous range and the start of the
+ * next range.  An extra block is added to give the last range an end.
+ *
+ * The block size should be a power of 2 to avoid a costly 'div' instruction.
+ *
+ * A block size of 256 was chosen because it roughly doubles unwinder
+ * performance while only adding ~5% to the ORC data footprint.
+ */
+#define LOOKUP_BLOCK_ORDER	8
+#define LOOKUP_BLOCK_SIZE	(1 << LOOKUP_BLOCK_ORDER)
+
 /*
  * The ORC_REG_* registers are base registers which are used to find other
  * registers on the stack.
-- 
2.14.4.44.g2045bb6

