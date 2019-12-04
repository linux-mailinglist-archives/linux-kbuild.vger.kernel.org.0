Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 988F61120BE
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2019 01:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfLDArX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Dec 2019 19:47:23 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:47252 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726079AbfLDArX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 19:47:23 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01422;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0Tjr6d8u_1575420394;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0Tjr6d8u_1575420394)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 04 Dec 2019 08:46:43 +0800
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@amacapital.net>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v6 2/7] scripts/sortextable: kernel coding style formating
Date:   Wed,  4 Dec 2019 08:46:28 +0800
Message-Id: <20191204004633.88660-3-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fix the inconsistent function format and kernel code style,
referred to commit 3aec8638246f ("recordmcount: Kernel style
function signature formatting") and
commit 2e63152bc190 ("recordmcount: Kernel style formatting")

Make the code more readable and extendable, no functional changes.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 scripts/sortextable.c | 182 ++++++++++++++++++++++--------------------
 scripts/sortextable.h |  31 +++----
 2 files changed, 111 insertions(+), 102 deletions(-)

diff --git a/scripts/sortextable.c b/scripts/sortextable.c
index cd9762ba4467..e5384e86b58c 100644
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
@@ -88,64 +97,65 @@ static void *mmap_file(char const *fname, size_t *size)
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
index 5a62e94df678..b7e407e09f59 100644
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
-- 
2.24.0.rc2

