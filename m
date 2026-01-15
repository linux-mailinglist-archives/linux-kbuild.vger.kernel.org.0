Return-Path: <linux-kbuild+bounces-10599-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3C4D2521E
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jan 2026 16:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80E0A309DE38
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jan 2026 14:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB2334DB4C;
	Thu, 15 Jan 2026 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HK73wbyc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AABB35C1BA
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Jan 2026 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489014; cv=none; b=CxdrCAAPU2RgS4IQXcVHxzBu+y1Sg8BlR47ojPCRYGuipDp8a1gc+RCHTaX4jsXFdZW0/pWoMMTvgZ91JMCjTnxO7mtuJaCqIQV3zfUwoJXaTbAJ2iTALURKu9vZBuUh1IoUPCdZ1kJBRU3pFfUPcgyr6+FVwkQqfDwzGMs4WkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489014; c=relaxed/simple;
	bh=1A4d1VSmOCShrpaLQeDQZwtWSNwbFeVyAhEckUApNGo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=itq4giMldbhNIjSmNuBxvwRP5dHSBcJsNpEUXNlYQynD5rweqUh9SIs+c3OtEB0Csye5T7MQNPW9EmYMJtGs6Wn4wATEDuPTIQhmGpisXNgAaA3/8SAWjch8zGta7MrLN+zmTCmbDIEhjEXBoS/2LUPokMEEl+L2c2sl8EMU2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HK73wbyc; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4801ad6e51cso5720405e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jan 2026 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768489008; x=1769093808; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SA6ElcVXY//w17kDQpxuQgqXT5ypm5HeC9y8TP4Q5C0=;
        b=HK73wbyc50x07j0a6J6drcFq1r/+H0Y7e/aaA8ICs05RFM96Dd9hd/8Hoex0nwrxl3
         UoYm4tqBQ41ttVuZu9bjhEpDYZnq/BjhaYveAxKCoG1pjjJVfuBta2gvYRk+BRgChwVS
         D+79jcNj2M5I/03XSrAlXOna97N7cJ3+0NuUoF1xXFYVdvAfl9CUWD91UAWtSpfSbPFp
         zxM+ajhNAOK4lTKUkLZDlmhP40gsoWBbthRYifTetmZdeAkxdOyLCslKU5gUbiwapSKE
         sackvCVQ57O/fGYUZ2z30Qqiaw8oCnPaGcJHpEfhMafjUaZywuYEnxvuEem3FpOxWel4
         mD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768489008; x=1769093808;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SA6ElcVXY//w17kDQpxuQgqXT5ypm5HeC9y8TP4Q5C0=;
        b=q/KrYntTiVjGGcCE1dw2OT7qyzUBlcTCEELeq7dWTqcAcN3kP88eTe9Xzv+F5Qgj+E
         mr8CJD2HIo22516f6TJ10h6dDmPoH90mxiC8+wCt6UXxxXZbk74hXc+yuHAfc+ntP+Yc
         ev7OuhH3Z/jnHxvOJfHufRWmBKi2L3fzIYEb9sevp6NoeYo2Qi0gAnOVbNuc9lBP+dlo
         gltTo80AQewviruAJCIop2I6883ez13WHCYtkyq+aR/9uRkf4OUBmIlBdmEHnsc5BJrh
         IrqhXGsd9pNJd8O43QBdSz2dkHHyaDwlOdVyVd9nI13pnG70Tcn+GzHniyjcQwOFC2nb
         vecg==
X-Forwarded-Encrypted: i=1; AJvYcCUFninvvOffFU5rxlYuXldh1IOVT15wpMBtLfxXGXcAzDgn3+/sEFNCj49XYY4Ep1bMnb1YgAa7CDtTa7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzytnci4ArbZloVI1rjLJvN/AQBNWS30gbT2ulGjhKPdr5roXEK
	WHQKjmzrl/NTLr11e0osDlHvbRGIBUnb9ssEfPagqOsCvR0km8b7qVTVYusE8hn4ieCtXQrhzQ=
	=
X-Received: from wmkn13.prod.google.com ([2002:a7b:c5cd:0:b0:475:d8de:fe5b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b8c:b0:46f:c55a:5a8d
 with SMTP id 5b1f17b1804b1-4801e2efd61mr366125e9.4.1768489008570; Thu, 15 Jan
 2026 06:56:48 -0800 (PST)
Date: Thu, 15 Jan 2026 15:56:45 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=8267; i=ardb@kernel.org;
 h=from:subject; bh=JQh/o3J7K5or68zacsDujOIa4cJei5v51gLnNLh9Imk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JITOTQZfRPy585vxah7brLccTDv15fzxT+bHutaagpqX/v
 iY/3mHbUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbik8/w3yei55CgHo+L0V3p
 H9YOH0UfL5Fb+F2iiMHdJcvrritLByPDiXWnmC999z239f4K7cMbz32Y1fZ+ptBqY7OsjBd77e+ 38AMA
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260115145644.1749948-2-ardb+git@google.com>
Subject: [PATCH] kallsyms: Get rid of kallsyms relative base
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When the kallsyms relative base was introduced, per-CPU variable
references on x86_64 SMP were implemented as offsets into the respective
per-CPU region, rather than offsets relative to the location of the
variable's template in the kernel image, which is how other
architectures implement it.

This required kallsyms to reason about the difference between the two,
and the sign of the value in the kallsyms_offsets[] array was used to
distinguish them. This meant that negative offsets were not permitted
for ordinary variables, and so it was crucial that the relative base was
chosen such that all offsets were positive numbers.

This is no longer needed: instead, the offsets can simply be encoded as
values in the range -/+ 2 GiB, which is precisely what PC32 relocations
provide on most architectures. So it is possible to simplify the logic,
and just use _text as the anchor directly, and let the linker calculate
the final value based on the location of the entry itself.

Some toy architectures do not support place-relative relocations at all,
but these are all 32-bit, and on those architectures, there is no need
for place-relative relocations in the first place, and the actual symbol
value can just be stored directly.

This makes all entries in the kallsyms_offsets[] array visible as
place-relative references in the ELF metadata, which will be important
when implementing ELF-based fg-kaslr.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-kbuild@vger.kernel.org 
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 kernel/kallsyms.c                   |  6 +-
 kernel/kallsyms_internal.h          |  1 -
 kernel/vmcore_info.c                |  1 -
 scripts/kallsyms.c                  | 64 ++++++--------------
 scripts/link-vmlinux.sh             |  4 ++
 tools/perf/tests/vmlinux-kallsyms.c |  1 -
 6 files changed, 25 insertions(+), 52 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 049e296f586c..6125724aadb1 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -151,8 +151,10 @@ static unsigned int get_symbol_offset(unsigned long pos)
 
 unsigned long kallsyms_sym_address(int idx)
 {
-	/* values are unsigned offsets */
-	return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
+	/* non-relocatable 32-bit kernels just embed the value directly */
+	if (!IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_RELOCATABLE))
+		return (u32)kallsyms_offsets[idx];
+	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
 }
 
 static unsigned int get_symbol_seq(int index)
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 9633782f8250..81a867dbe57d 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -8,7 +8,6 @@ extern const int kallsyms_offsets[];
 extern const u8 kallsyms_names[];
 
 extern const unsigned int kallsyms_num_syms;
-extern const unsigned long kallsyms_relative_base;
 
 extern const char kallsyms_token_table[];
 extern const u16 kallsyms_token_index[];
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index fe9bf8db1922..f114719f6cb5 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -238,7 +238,6 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_SYMBOL(kallsyms_token_table);
 	VMCOREINFO_SYMBOL(kallsyms_token_index);
 	VMCOREINFO_SYMBOL(kallsyms_offsets);
-	VMCOREINFO_SYMBOL(kallsyms_relative_base);
 #endif /* CONFIG_KALLSYMS */
 
 	arch_crash_save_vmcoreinfo();
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 4b0234e4b12f..047d1b1ff40f 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -46,7 +46,6 @@ struct addr_range {
 };
 
 static unsigned long long _text;
-static unsigned long long relative_base;
 static struct addr_range text_ranges[] = {
 	{ "_stext",     "_etext"     },
 	{ "_sinittext", "_einittext" },
@@ -57,6 +56,7 @@ static struct addr_range text_ranges[] = {
 static struct sym_entry **table;
 static unsigned int table_size, table_cnt;
 static int all_symbols;
+static int pc_relative;
 
 static int token_profit[0x10000];
 
@@ -280,7 +280,7 @@ static void read_map(const char *in)
 static void output_label(const char *label)
 {
 	printf(".globl %s\n", label);
-	printf("\tALGN\n");
+	printf("\t.balign 4\n");
 	printf("%s:\n", label);
 }
 
@@ -343,15 +343,6 @@ static void write_src(void)
 	unsigned int *markers, markers_cnt;
 	char buf[KSYM_NAME_LEN];
 
-	printf("#include <asm/bitsperlong.h>\n");
-	printf("#if BITS_PER_LONG == 64\n");
-	printf("#define PTR .quad\n");
-	printf("#define ALGN .balign 8\n");
-	printf("#else\n");
-	printf("#define PTR .long\n");
-	printf("#define ALGN .balign 4\n");
-	printf("#endif\n");
-
 	printf("\t.section .rodata, \"a\"\n");
 
 	output_label("kallsyms_num_syms");
@@ -434,34 +425,24 @@ static void write_src(void)
 	output_label("kallsyms_offsets");
 
 	for (i = 0; i < table_cnt; i++) {
-		/*
-		 * Use the offset relative to the lowest value
-		 * encountered of all relative symbols, and emit
-		 * non-relocatable fixed offsets that will be fixed
-		 * up at runtime.
-		 */
-
-		long long offset;
-
-		offset = table[i]->addr - relative_base;
-		if (offset < 0 || offset > UINT_MAX) {
-			fprintf(stderr, "kallsyms failure: "
-				"relative symbol value %#llx out of range\n",
-				table[i]->addr);
-			exit(EXIT_FAILURE);
+		if (pc_relative) {
+			long long offset = table[i]->addr - _text;
+
+			if (offset < INT_MIN || offset > INT_MAX) {
+				fprintf(stderr, "kallsyms failure: "
+					"relative symbol value %#llx out of range\n",
+					table[i]->addr);
+				exit(EXIT_FAILURE);
+			}
+			printf("\t.long\t_text - . + %#x\t/* %s */\n",
+			       (int)offset, table[i]->sym);
+		} else {
+			printf("\t.long\t%#x\t/* %s */\n",
+			       (unsigned int)table[i]->addr, table[i]->sym);
 		}
-		printf("\t.long\t%#x\t/* %s */\n", (int)offset, table[i]->sym);
 	}
 	printf("\n");
 
-	output_label("kallsyms_relative_base");
-	/* Provide proper symbols relocatability by their '_text' relativeness. */
-	if (_text <= relative_base)
-		printf("\tPTR\t_text + %#llx\n", relative_base - _text);
-	else
-		printf("\tPTR\t_text - %#llx\n", _text - relative_base);
-	printf("\n");
-
 	sort_symbols_by_name();
 	output_label("kallsyms_seqs_of_names");
 	for (i = 0; i < table_cnt; i++)
@@ -701,22 +682,12 @@ static void sort_symbols(void)
 	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
-/* find the minimum non-absolute symbol address */
-static void record_relative_base(void)
-{
-	/*
-	 * The table is sorted by address.
-	 * Take the first symbol value.
-	 */
-	if (table_cnt)
-		relative_base = table[0]->addr;
-}
-
 int main(int argc, char **argv)
 {
 	while (1) {
 		static const struct option long_options[] = {
 			{"all-symbols",     no_argument, &all_symbols,     1},
+			{"pc-relative",     no_argument, &pc_relative,     1},
 			{},
 		};
 
@@ -734,7 +705,6 @@ int main(int argc, char **argv)
 	read_map(argv[optind]);
 	shrink_table();
 	sort_symbols();
-	record_relative_base();
 	optimize_token_table();
 	write_src();
 
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 4ab44c73da4d..73531cb63efc 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -143,6 +143,10 @@ kallsyms()
 		kallsymopt="${kallsymopt} --all-symbols"
 	fi
 
+	if is_enabled CONFIG_64BIT || is_enabled CONFIG_RELOCATABLE; then
+		kallsymopt="${kallsymopt} --pc-relative"
+	fi
+
 	info KSYMS "${2}.S"
 	scripts/kallsyms ${kallsymopt} "${1}" > "${2}.S"
 
diff --git a/tools/perf/tests/vmlinux-kallsyms.c b/tools/perf/tests/vmlinux-kallsyms.c
index 74cdbd2ce9d0..524d46478364 100644
--- a/tools/perf/tests/vmlinux-kallsyms.c
+++ b/tools/perf/tests/vmlinux-kallsyms.c
@@ -27,7 +27,6 @@ static bool is_ignored_symbol(const char *name, char type)
 		 * stable symbol list.
 		 */
 		"kallsyms_offsets",
-		"kallsyms_relative_base",
 		"kallsyms_num_syms",
 		"kallsyms_names",
 		"kallsyms_markers",
-- 
2.52.0.457.g6b5491de43-goog


