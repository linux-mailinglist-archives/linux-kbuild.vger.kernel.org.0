Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F04C711E187
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2019 11:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfLMKEM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Dec 2019 05:04:12 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:47786 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfLMKD4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 05:03:56 -0500
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1ifhnO-0008KW-Jk; Fri, 13 Dec 2019 11:03:38 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 404BA1C2929;
        Fri, 13 Dec 2019 11:03:38 +0100 (CET)
Date:   Fri, 13 Dec 2019 10:03:38 -0000
From:   "tip-bot2 for Shile Zhang" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: core/objtool] scripts/sortextable: Clean up the code to meet
 the kernel coding style better
Cc:     Shile Zhang <shile.zhang@linux.alibaba.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20191204004633.88660-3-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-3-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Message-ID: <157623141815.30329.14988613605630406503.tip-bot2@tip-bot2>
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

Commit-ID:     6402e1416255a7bb94834925ba0255c750f54a2d
Gitweb:        https://git.kernel.org/tip/6402e1416255a7bb94834925ba0255c750f54a2d
Author:        Shile Zhang <shile.zhang@linux.alibaba.com>
AuthorDate:    Wed, 04 Dec 2019 08:46:28 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 13 Dec 2019 10:47:58 +01:00

scripts/sortextable: Clean up the code to meet the kernel coding style better

Fix various style errors and inconsistencies, no functional changes
intended.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Link: https://lkml.kernel.org/r/20191204004633.88660-3-shile.zhang@linux.alibaba.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 scripts/sortextable.c | 182 +++++++++++++++++++++--------------------
 scripts/sortextable.h |  31 +++----
 2 files changed, 111 insertions(+), 102 deletions(-)

diff --git a/scripts/sortextable.c b/scripts/sortextable.c
index cd9762b..e5384e8 100644
--- a/scripts/sortextable.c
+++ b/scripts/sortextable.c
@@ -50,6 +50,14 @@
 #define EM_ARCV2	195
 #endif
 
+static uint32_t (*r)(const uint32_t *);
+static uint16_t (*r2)(const uint16_t *);
+static uint64_t (*r8)(const uint64_t *);
+static void (*w)(uint32_t, uint32_t *);
+static void (*w2)(uint16_t, uint16_t *);
+static void (*w8)(uint64_t, uint64_t *);
+typedef void (*table_sort_t)(char *, int);
+
 /*
  * Get the whole file as a programming convenience in order to avoid
  * malloc+lseek+read+free of many pieces.  If successful, then mmap
@@ -75,6 +83,7 @@ static void *mmap_file(char const *fname, size_t *size)
 		fprintf(stderr, "not a regular file: %s\n", fname);
 		goto out;
 	}
+
 	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
 	if (addr == MAP_FAILED) {
 		fprintf(stderr, "Could not mmap file: %s\n", fname);
@@ -88,64 +97,65 @@ out:
 	return addr;
 }
 
-static uint64_t r8be(const uint64_t *x)
-{
-	return get_unaligned_be64(x);
-}
 static uint32_t rbe(const uint32_t *x)
 {
 	return get_unaligned_be32(x);
 }
+
 static uint16_t r2be(const uint16_t *x)
 {
 	return get_unaligned_be16(x);
 }
-static uint64_t r8le(const uint64_t *x)
+
+static uint64_t r8be(const uint64_t *x)
 {
-	return get_unaligned_le64(x);
+	return get_unaligned_be64(x);
 }
+
 static uint32_t rle(const uint32_t *x)
 {
 	return get_unaligned_le32(x);
 }
+
 static uint16_t r2le(const uint16_t *x)
 {
 	return get_unaligned_le16(x);
 }
 
-static void w8be(uint64_t val, uint64_t *x)
+static uint64_t r8le(const uint64_t *x)
 {
-	put_unaligned_be64(val, x);
+	return get_unaligned_le64(x);
 }
+
 static void wbe(uint32_t val, uint32_t *x)
 {
 	put_unaligned_be32(val, x);
 }
+
 static void w2be(uint16_t val, uint16_t *x)
 {
 	put_unaligned_be16(val, x);
 }
-static void w8le(uint64_t val, uint64_t *x)
+
+static void w8be(uint64_t val, uint64_t *x)
 {
-	put_unaligned_le64(val, x);
+	put_unaligned_be64(val, x);
 }
+
 static void wle(uint32_t val, uint32_t *x)
 {
 	put_unaligned_le32(val, x);
 }
+
 static void w2le(uint16_t val, uint16_t *x)
 {
 	put_unaligned_le16(val, x);
 }
 
-static uint64_t (*r8)(const uint64_t *);
-static uint32_t (*r)(const uint32_t *);
-static uint16_t (*r2)(const uint16_t *);
-static void (*w8)(uint64_t, uint64_t *);
-static void (*w)(uint32_t, uint32_t *);
-static void (*w2)(uint16_t, uint16_t *);
-
-typedef void (*table_sort_t)(char *, int);
+static void w8le(uint64_t val, uint64_t *x)
+{
+	put_unaligned_le64(val, x);
+}
 
 /*
  * Move reserved section indices SHN_LORESERVE..SHN_HIRESERVE out of
@@ -188,108 +198,100 @@ static int compare_relative_table(const void *a, const void *b)
 	return 0;
 }
 
-static void x86_sort_relative_table(char *extab_image, int image_size)
+static void sort_relative_table(char *extab_image, int image_size)
 {
-	int i;
+	int i = 0;
 
-	i = 0;
+	/*
+	 * Do the same thing the runtime sort does, first normalize to
+	 * being relative to the start of the section.
+	 */
 	while (i < image_size) {
 		uint32_t *loc = (uint32_t *)(extab_image + i);
-
 		w(r(loc) + i, loc);
-		w(r(loc + 1) + i + 4, loc + 1);
-		w(r(loc + 2) + i + 8, loc + 2);
-
-		i += sizeof(uint32_t) * 3;
+		i += 4;
 	}
 
-	qsort(extab_image, image_size / 12, 12, compare_relative_table);
+	qsort(extab_image, image_size / 8, 8, compare_relative_table);
 
+	/* Now denormalize. */
 	i = 0;
 	while (i < image_size) {
 		uint32_t *loc = (uint32_t *)(extab_image + i);
-
 		w(r(loc) - i, loc);
-		w(r(loc + 1) - (i + 4), loc + 1);
-		w(r(loc + 2) - (i + 8), loc + 2);
-
-		i += sizeof(uint32_t) * 3;
+		i += 4;
 	}
 }
 
-static void sort_relative_table(char *extab_image, int image_size)
+static void x86_sort_relative_table(char *extab_image, int image_size)
 {
-	int i;
+	int i = 0;
 
-	/*
-	 * Do the same thing the runtime sort does, first normalize to
-	 * being relative to the start of the section.
-	 */
-	i = 0;
 	while (i < image_size) {
 		uint32_t *loc = (uint32_t *)(extab_image + i);
+
 		w(r(loc) + i, loc);
-		i += 4;
+		w(r(loc + 1) + i + 4, loc + 1);
+		w(r(loc + 2) + i + 8, loc + 2);
+
+		i += sizeof(uint32_t) * 3;
 	}
 
-	qsort(extab_image, image_size / 8, 8, compare_relative_table);
+	qsort(extab_image, image_size / 12, 12, compare_relative_table);
 
-	/* Now denormalize. */
 	i = 0;
 	while (i < image_size) {
 		uint32_t *loc = (uint32_t *)(extab_image + i);
+
 		w(r(loc) - i, loc);
-		i += 4;
+		w(r(loc + 1) - (i + 4), loc + 1);
+		w(r(loc + 2) - (i + 8), loc + 2);
+
+		i += sizeof(uint32_t) * 3;
 	}
 }
 
-static int
-do_file(char const *const fname, void *addr)
+static int do_file(char const *const fname, void *addr)
 {
-	table_sort_t custom_sort = NULL;
-	Elf32_Ehdr *ehdr = addr;
 	int rc = -1;
+	Elf32_Ehdr *ehdr = addr;
+	table_sort_t custom_sort = NULL;
 
 	switch (ehdr->e_ident[EI_DATA]) {
-	default:
-		fprintf(stderr, "unrecognized ELF data encoding %d: %s\n",
-			ehdr->e_ident[EI_DATA], fname);
-		return -1;
 	case ELFDATA2LSB:
-		r = rle;
-		r2 = r2le;
-		r8 = r8le;
-		w = wle;
-		w2 = w2le;
-		w8 = w8le;
+		r	= rle;
+		r2	= r2le;
+		r8	= r8le;
+		w	= wle;
+		w2	= w2le;
+		w8	= w8le;
 		break;
 	case ELFDATA2MSB:
-		r = rbe;
-		r2 = r2be;
-		r8 = r8be;
-		w = wbe;
-		w2 = w2be;
-		w8 = w8be;
+		r	= rbe;
+		r2	= r2be;
+		r8	= r8be;
+		w	= wbe;
+		w2	= w2be;
+		w8	= w8be;
 		break;
-	}  /* end switch */
-	if (memcmp(ELFMAG, ehdr->e_ident, SELFMAG) != 0
-	||  (r2(&ehdr->e_type) != ET_EXEC && r2(&ehdr->e_type) != ET_DYN)
-	||  ehdr->e_ident[EI_VERSION] != EV_CURRENT) {
+	default:
+		fprintf(stderr, "unrecognized ELF data encoding %d: %s\n",
+			ehdr->e_ident[EI_DATA], fname);
+		return -1;
+	}
+
+	if (memcmp(ELFMAG, ehdr->e_ident, SELFMAG) != 0 ||
+	    (r2(&ehdr->e_type) != ET_EXEC && r2(&ehdr->e_type) != ET_DYN) ||
+	    ehdr->e_ident[EI_VERSION] != EV_CURRENT) {
 		fprintf(stderr, "unrecognized ET_EXEC/ET_DYN file %s\n", fname);
 		return -1;
 	}
 
-	custom_sort = NULL;
 	switch (r2(&ehdr->e_machine)) {
-	default:
-		fprintf(stderr, "unrecognized e_machine %d %s\n",
-			r2(&ehdr->e_machine), fname);
-		break;
 	case EM_386:
 	case EM_X86_64:
 		custom_sort = x86_sort_relative_table;
 		break;
-
 	case EM_S390:
 	case EM_AARCH64:
 	case EM_PARISC:
@@ -304,40 +306,45 @@ do_file(char const *const fname, void *addr)
 	case EM_MIPS:
 	case EM_XTENSA:
 		break;
-	}  /* end switch */
+	default:
+		fprintf(stderr, "unrecognized e_machine %d %s\n",
+			r2(&ehdr->e_machine), fname);
+		return -1;
+	}
 
 	switch (ehdr->e_ident[EI_CLASS]) {
-	default:
-		fprintf(stderr, "unrecognized ELF class %d %s\n",
-			ehdr->e_ident[EI_CLASS], fname);
-		break;
 	case ELFCLASS32:
-		if (r2(&ehdr->e_ehsize) != sizeof(Elf32_Ehdr)
-		||  r2(&ehdr->e_shentsize) != sizeof(Elf32_Shdr)) {
+		if (r2(&ehdr->e_ehsize) != sizeof(Elf32_Ehdr) ||
+		    r2(&ehdr->e_shentsize) != sizeof(Elf32_Shdr)) {
 			fprintf(stderr,
 				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
 			break;
 		}
 		rc = do32(ehdr, fname, custom_sort);
 		break;
-	case ELFCLASS64: {
+	case ELFCLASS64:
+		{
 		Elf64_Ehdr *const ghdr = (Elf64_Ehdr *)ehdr;
-		if (r2(&ghdr->e_ehsize) != sizeof(Elf64_Ehdr)
-		||  r2(&ghdr->e_shentsize) != sizeof(Elf64_Shdr)) {
+		if (r2(&ghdr->e_ehsize) != sizeof(Elf64_Ehdr) ||
+		    r2(&ghdr->e_shentsize) != sizeof(Elf64_Shdr)) {
 			fprintf(stderr,
-				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
+				"unrecognized ET_EXEC/ET_DYN file: %s\n",
+				fname);
 			break;
 		}
 		rc = do64(ghdr, fname, custom_sort);
+		}
+		break;
+	default:
+		fprintf(stderr, "unrecognized ELF class %d %s\n",
+			ehdr->e_ident[EI_CLASS], fname);
 		break;
 	}
-	}  /* end switch */
 
 	return rc;
 }
 
-int
-main(int argc, char *argv[])
+int main(int argc, char *argv[])
 {
 	int i, n_error = 0;  /* gcc-4.3.0 false positive complaint */
 	size_t size = 0;
@@ -361,5 +368,6 @@ main(int argc, char *argv[])
 
 		munmap(addr, size);
 	}
+
 	return !!n_error;
 }
diff --git a/scripts/sortextable.h b/scripts/sortextable.h
index 5a62e94..b7e407e 100644
--- a/scripts/sortextable.h
+++ b/scripts/sortextable.h
@@ -6,7 +6,7 @@
  *
  * Some of this code was taken out of recordmcount.h written by:
  *
- * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>.  All rights reserved.
+ * Copyright 2009 John F. Reiser <jreiser@BitWagon.com>. All rights reserved.
  * Copyright 2010 Steven Rostedt <srostedt@redhat.com>, Red Hat Inc.
  */
 
@@ -87,8 +87,9 @@ static int compare_extable(const void *a, const void *b)
 	return 0;
 }
 
-static int
-do_func(Elf_Ehdr *ehdr, char const *const fname, table_sort_t custom_sort)
+static int do_func(Elf_Ehdr *ehdr,
+		   char const *const fname,
+		   table_sort_t custom_sort)
 {
 	Elf_Shdr *shdr;
 	Elf_Shdr *shstrtab_sec;
@@ -126,7 +127,7 @@ do_func(Elf_Ehdr *ehdr, char const *const fname, table_sort_t custom_sort)
 	secstrtab = (const char *)ehdr + _r(&shstrtab_sec->sh_offset);
 	for (i = 0; i < num_sections; i++) {
 		idx = r(&shdr[i].sh_name);
-		if (strcmp(secstrtab + idx, "__ex_table") == 0) {
+		if (!strcmp(secstrtab + idx, "__ex_table")) {
 			extab_sec = shdr + i;
 			extab_index = i;
 		}
@@ -136,26 +137,26 @@ do_func(Elf_Ehdr *ehdr, char const *const fname, table_sort_t custom_sort)
 			relocs = (void *)ehdr + _r(&shdr[i].sh_offset);
 			relocs_size = _r(&shdr[i].sh_size);
 		}
-		if (strcmp(secstrtab + idx, ".symtab") == 0)
+		if (!strcmp(secstrtab + idx, ".symtab"))
 			symtab_sec = shdr + i;
-		if (strcmp(secstrtab + idx, ".strtab") == 0)
+		if (!strcmp(secstrtab + idx, ".strtab"))
 			strtab_sec = shdr + i;
 		if (r(&shdr[i].sh_type) == SHT_SYMTAB_SHNDX)
 			symtab_shndx_start = (Elf32_Word *)(
 				(const char *)ehdr + _r(&shdr[i].sh_offset));
 	}
-	if (strtab_sec == NULL) {
-		fprintf(stderr,	"no .strtab in  file: %s\n", fname);
+	if (!strtab_sec) {
+		fprintf(stderr,	"no .strtab in file: %s\n", fname);
 		return -1;
 	}
-	if (symtab_sec == NULL) {
-		fprintf(stderr,	"no .symtab in  file: %s\n", fname);
+	if (!symtab_sec) {
+		fprintf(stderr,	"no .symtab in file: %s\n", fname);
 		return -1;
 	}
 	symtab = (const Elf_Sym *)((const char *)ehdr +
 				   _r(&symtab_sec->sh_offset));
-	if (extab_sec == NULL) {
-		fprintf(stderr,	"no __ex_table in  file: %s\n", fname);
+	if (!extab_sec) {
+		fprintf(stderr,	"no __ex_table in file: %s\n", fname);
 		return -1;
 	}
 	strtab = (const char *)ehdr + _r(&strtab_sec->sh_offset);
@@ -181,14 +182,14 @@ do_func(Elf_Ehdr *ehdr, char const *const fname, table_sort_t custom_sort)
 		if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 			continue;
 		idx = r(&sym->st_name);
-		if (strcmp(strtab + idx, "main_extable_sort_needed") == 0) {
+		if (!strcmp(strtab + idx, "main_extable_sort_needed")) {
 			sort_needed_sym = sym;
 			break;
 		}
 	}
-	if (sort_needed_sym == NULL) {
+	if (!sort_needed_sym) {
 		fprintf(stderr,
-			"no main_extable_sort_needed symbol in  file: %s\n",
+			"no main_extable_sort_needed symbol in file: %s\n",
 			fname);
 		return -1;
 	}
