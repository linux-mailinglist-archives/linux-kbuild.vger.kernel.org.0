Return-Path: <linux-kbuild+bounces-2554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB1932239
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 10:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCEFD2816ED
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 08:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D75C15820E;
	Tue, 16 Jul 2024 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjYhuLv6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707FB4206A;
	Tue, 16 Jul 2024 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119794; cv=none; b=Ej2Y6Jaw0BkDqiZJD2vT5cnrlUMb7JRlQvJiimtTtW4kbH9gqhMmej2vWI9v17e7FYQerv34+UFM6uHNERq6GdpOb01hkHqG1crAZOrD3xayWV2juvC/AZS42RYlDCjPUOaOkJHHJE/tSvK/NFYhVkfZltdjEtB7DJI+gIdgup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119794; c=relaxed/simple;
	bh=OqXaWY82Q9LtOBYQeUG54f9RKdyeAy3CnK6mN7mKXwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m37yj5Xa2L3uXAWmJyOrjh30orZHOV4YaK+YqYo3VYz7Z/TKpAzizHbUWg8ulOLXgaLOyZODGkPH5k6/S6AIVKBs30CA1aqUnc/q/9tPCe5+KKZ5sI3uhu+I/jz9PZL7RRUr3i/eZjjMe7YGJ0yQvbVezQa2qF5NoJGe5kVPDdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjYhuLv6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45185C116B1;
	Tue, 16 Jul 2024 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721119794;
	bh=OqXaWY82Q9LtOBYQeUG54f9RKdyeAy3CnK6mN7mKXwA=;
	h=From:To:Cc:Subject:Date:From;
	b=DjYhuLv6d7XIvHqIUxuAZ6Hamw97v5lHcdzgigqcZ205FJ4ynbBgbVlDZgFHHa7Gn
	 qwEMl2pc+WTC6vE6JFzKG90Cb3hJbScMEwaEoqHiy7x8p1PQR4G4uCKB6NYVqQxEYP
	 LhRZ+NcLwHaQ/XuHnWER8qfRhQigzEuR5dv6822PGvpnWb1Bheg/aVebvpafbyCxO6
	 RFhhixOe856URJ9xGFdw+Frtn64//wONyxJkeG+TUQHbaYHF20RW8XIVK5+ZS0y4yZ
	 LwysiANBQy0bL3KxKyEoEj3Eqrz+A6mMIMOS4DUfcyFl4fVA/d4gkP0/yaJoqy1qH6
	 jqUbJEnc0+jvQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jann Horn <jannh@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kallsyms: get rid of code for absolute kallsyms
Date: Tue, 16 Jul 2024 17:49:42 +0900
Message-ID: <20240716084944.132226-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jann Horn <jannh@google.com>

Commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
removed the last use of the absolute kallsyms.

Signed-off-by: Jann Horn <jannh@google.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/20240221202655.2423854-1-jannh@google.com/
[masahiroy@kernel.org: rebase the code and reword the commit description]
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Kconfig                        | 18 -------
 kernel/kallsyms.c                   |  5 +-
 kernel/kallsyms_internal.h          |  1 -
 kernel/vmcore_info.c                |  4 --
 scripts/kallsyms.c                  | 76 ++++++++++++-----------------
 scripts/link-vmlinux.sh             |  4 --
 tools/perf/tests/vmlinux-kallsyms.c |  1 -
 7 files changed, 32 insertions(+), 77 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index febdea2afc3b..8e21ce38dee6 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1789,24 +1789,6 @@ config KALLSYMS_ABSOLUTE_PERCPU
 	depends on KALLSYMS
 	default X86_64 && SMP
 
-config KALLSYMS_BASE_RELATIVE
-	bool
-	depends on KALLSYMS
-	default y
-	help
-	  Instead of emitting them as absolute values in the native word size,
-	  emit the symbol references in the kallsyms table as 32-bit entries,
-	  each containing a relative value in the range [base, base + U32_MAX]
-	  or, when KALLSYMS_ABSOLUTE_PERCPU is in effect, each containing either
-	  an absolute value in the range [0, S32_MAX] or a relative value in the
-	  range [base, base + S32_MAX], where base is the lowest relative symbol
-	  address encountered in the image.
-
-	  On 64-bit builds, this reduces the size of the address table by 50%,
-	  but more importantly, it results in entries whose values are build
-	  time constants, and no relocation pass is required at runtime to fix
-	  up the entries based on the runtime load address of the kernel.
-
 # end of the "standard kernel features (expert users)" menu
 
 config ARCH_HAS_MEMBARRIER_CALLBACKS
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 98b9622d372e..fb2c77368d18 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -148,9 +148,6 @@ static unsigned int get_symbol_offset(unsigned long pos)
 
 unsigned long kallsyms_sym_address(int idx)
 {
-	if (!IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE))
-		return kallsyms_addresses[idx];
-
 	/* values are unsigned offsets if --absolute-percpu is not in effect */
 	if (!IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU))
 		return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
@@ -325,7 +322,7 @@ static unsigned long get_symbol_pos(unsigned long addr,
 	unsigned long symbol_start = 0, symbol_end = 0;
 	unsigned long i, low, high, mid;
 
-	/* Do a binary search on the sorted kallsyms_addresses array. */
+	/* Do a binary search on the sorted kallsyms_offsets array. */
 	low = 0;
 	high = kallsyms_num_syms;
 
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 925f2ab22639..9633782f8250 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -4,7 +4,6 @@
 
 #include <linux/types.h>
 
-extern const unsigned long kallsyms_addresses[];
 extern const int kallsyms_offsets[];
 extern const u8 kallsyms_names[];
 
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 1d5eadd9dd61..8b4f8cc2e0ec 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -216,12 +216,8 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_SYMBOL(kallsyms_num_syms);
 	VMCOREINFO_SYMBOL(kallsyms_token_table);
 	VMCOREINFO_SYMBOL(kallsyms_token_index);
-#ifdef CONFIG_KALLSYMS_BASE_RELATIVE
 	VMCOREINFO_SYMBOL(kallsyms_offsets);
 	VMCOREINFO_SYMBOL(kallsyms_relative_base);
-#else
-	VMCOREINFO_SYMBOL(kallsyms_addresses);
-#endif /* CONFIG_KALLSYMS_BASE_RELATIVE */
 #endif /* CONFIG_KALLSYMS */
 
 	arch_crash_save_vmcoreinfo();
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index fa53b5eef553..55a423519f2e 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -6,7 +6,7 @@
  * of the GNU General Public License, incorporated herein by reference.
  *
  * Usage: kallsyms [--all-symbols] [--absolute-percpu]
- *                         [--base-relative] [--lto-clang] in.map > out.S
+ *                         [--lto-clang] in.map > out.S
  *
  *      Table compression uses all the unused char codes on the symbols and
  *  maps these to the most used substrings (tokens). For instance, it might
@@ -63,7 +63,6 @@ static struct sym_entry **table;
 static unsigned int table_size, table_cnt;
 static int all_symbols;
 static int absolute_percpu;
-static int base_relative;
 static int lto_clang;
 
 static int token_profit[0x10000];
@@ -76,7 +75,7 @@ static unsigned char best_table_len[256];
 static void usage(void)
 {
 	fprintf(stderr, "Usage: kallsyms [--all-symbols] [--absolute-percpu] "
-			"[--base-relative] [--lto-clang] in.map > out.S\n");
+			"[--lto-clang] in.map > out.S\n");
 	exit(1);
 }
 
@@ -491,54 +490,43 @@ static void write_src(void)
 		printf("\t.short\t%d\n", best_idx[i]);
 	printf("\n");
 
-	if (!base_relative)
-		output_label("kallsyms_addresses");
-	else
-		output_label("kallsyms_offsets");
+	output_label("kallsyms_offsets");
 
 	for (i = 0; i < table_cnt; i++) {
-		if (base_relative) {
-			/*
-			 * Use the offset relative to the lowest value
-			 * encountered of all relative symbols, and emit
-			 * non-relocatable fixed offsets that will be fixed
-			 * up at runtime.
-			 */
+		/*
+		 * Use the offset relative to the lowest value
+		 * encountered of all relative symbols, and emit
+		 * non-relocatable fixed offsets that will be fixed
+		 * up at runtime.
+		 */
 
-			long long offset;
-			int overflow;
+		long long offset;
+		int overflow;
 
-			if (!absolute_percpu) {
-				offset = table[i]->addr - relative_base;
-				overflow = (offset < 0 || offset > UINT_MAX);
-			} else if (symbol_absolute(table[i])) {
-				offset = table[i]->addr;
-				overflow = (offset < 0 || offset > INT_MAX);
-			} else {
-				offset = relative_base - table[i]->addr - 1;
-				overflow = (offset < INT_MIN || offset >= 0);
-			}
-			if (overflow) {
-				fprintf(stderr, "kallsyms failure: "
-					"%s symbol value %#llx out of range in relative mode\n",
-					symbol_absolute(table[i]) ? "absolute" : "relative",
-					table[i]->addr);
-				exit(EXIT_FAILURE);
-			}
-			printf("\t.long\t%#x	/* %s */\n", (int)offset, table[i]->sym);
-		} else if (!symbol_absolute(table[i])) {
-			output_address(table[i]->addr);
+		if (!absolute_percpu) {
+			offset = table[i]->addr - relative_base;
+			overflow = (offset < 0 || offset > UINT_MAX);
+		} else if (symbol_absolute(table[i])) {
+			offset = table[i]->addr;
+			overflow = (offset < 0 || offset > INT_MAX);
 		} else {
-			printf("\tPTR\t%#llx\n", table[i]->addr);
+			offset = relative_base - table[i]->addr - 1;
+			overflow = (offset < INT_MIN || offset >= 0);
 		}
+		if (overflow) {
+			fprintf(stderr, "kallsyms failure: "
+				"%s symbol value %#llx out of range in relative mode\n",
+				symbol_absolute(table[i]) ? "absolute" : "relative",
+				table[i]->addr);
+			exit(EXIT_FAILURE);
+		}
+		printf("\t.long\t%#x	/* %s */\n", (int)offset, table[i]->sym);
 	}
 	printf("\n");
 
-	if (base_relative) {
-		output_label("kallsyms_relative_base");
-		output_address(relative_base);
-		printf("\n");
-	}
+	output_label("kallsyms_relative_base");
+	output_address(relative_base);
+	printf("\n");
 
 	if (lto_clang)
 		for (i = 0; i < table_cnt; i++)
@@ -820,7 +808,6 @@ int main(int argc, char **argv)
 		static const struct option long_options[] = {
 			{"all-symbols",     no_argument, &all_symbols,     1},
 			{"absolute-percpu", no_argument, &absolute_percpu, 1},
-			{"base-relative",   no_argument, &base_relative,   1},
 			{"lto-clang",       no_argument, &lto_clang,       1},
 			{},
 		};
@@ -841,8 +828,7 @@ int main(int argc, char **argv)
 	if (absolute_percpu)
 		make_percpus_absolute();
 	sort_symbols();
-	if (base_relative)
-		record_relative_base();
+	record_relative_base();
 	optimize_token_table();
 	write_src();
 
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c64158a04f82..f7b2503cdba9 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -156,10 +156,6 @@ kallsyms()
 		kallsymopt="${kallsymopt} --absolute-percpu"
 	fi
 
-	if is_enabled CONFIG_KALLSYMS_BASE_RELATIVE; then
-		kallsymopt="${kallsymopt} --base-relative"
-	fi
-
 	if is_enabled CONFIG_LTO_CLANG; then
 		kallsymopt="${kallsymopt} --lto-clang"
 	fi
diff --git a/tools/perf/tests/vmlinux-kallsyms.c b/tools/perf/tests/vmlinux-kallsyms.c
index e30fd55f8e51..cd3b480d20bd 100644
--- a/tools/perf/tests/vmlinux-kallsyms.c
+++ b/tools/perf/tests/vmlinux-kallsyms.c
@@ -26,7 +26,6 @@ static bool is_ignored_symbol(const char *name, char type)
 		 * when --all-symbols is specified so exclude them to get a
 		 * stable symbol list.
 		 */
-		"kallsyms_addresses",
 		"kallsyms_offsets",
 		"kallsyms_relative_base",
 		"kallsyms_num_syms",
-- 
2.43.0


