Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5DE10C797
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2019 12:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfK1LCU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Nov 2019 06:02:20 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:44835 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726699AbfK1LCU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Nov 2019 06:02:20 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0TjIllLR_1574938929;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0TjIllLR_1574938929)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 28 Nov 2019 19:02:17 +0800
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
Subject: [RFC PATCH v5 4/7] scripts/sortextable: refactor do_func() function
Date:   Thu, 28 Nov 2019 19:02:03 +0800
Message-Id: <20191128110206.2107-5-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191128110206.2107-1-shile.zhang@linux.alibaba.com>
References: <20191128110206.2107-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Refine the loop, naming and code structure, make the code more readable
and extendable, no functional changes.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 scripts/sortextable.c |   4 +-
 scripts/sortextable.h | 115 ++++++++++++++++++++++--------------------
 2 files changed, 61 insertions(+), 58 deletions(-)

diff --git a/scripts/sortextable.c b/scripts/sortextable.c
index e5384e86b58c..efa2839865cd 100644
--- a/scripts/sortextable.c
+++ b/scripts/sortextable.c
@@ -320,7 +320,7 @@ static int do_file(char const *const fname, void *addr)
 				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
 			break;
 		}
-		rc = do32(ehdr, fname, custom_sort);
+		rc = do_sort_32(ehdr, fname, custom_sort);
 		break;
 	case ELFCLASS64:
 		{
@@ -332,7 +332,7 @@ static int do_file(char const *const fname, void *addr)
 				fname);
 			break;
 		}
-		rc = do64(ghdr, fname, custom_sort);
+		rc = do_sort_64(ghdr, fname, custom_sort);
 		}
 		break;
 	default:
diff --git a/scripts/sortextable.h b/scripts/sortextable.h
index a2e3af7bf211..6485513f7cae 100644
--- a/scripts/sortextable.h
+++ b/scripts/sortextable.h
@@ -12,7 +12,7 @@
 
 #undef extable_ent_size
 #undef compare_extable
-#undef do_func
+#undef do_sort
 #undef Elf_Addr
 #undef Elf_Ehdr
 #undef Elf_Shdr
@@ -34,7 +34,7 @@
 #ifdef SORTEXTABLE_64
 # define extable_ent_size	16
 # define compare_extable	compare_extable_64
-# define do_func		do64
+# define do_sort		do_sort_64
 # define Elf_Addr		Elf64_Addr
 # define Elf_Ehdr		Elf64_Ehdr
 # define Elf_Shdr		Elf64_Shdr
@@ -55,7 +55,7 @@
 #else
 # define extable_ent_size	8
 # define compare_extable	compare_extable_32
-# define do_func		do32
+# define do_sort		do_sort_32
 # define Elf_Addr		Elf32_Addr
 # define Elf_Ehdr		Elf32_Ehdr
 # define Elf_Shdr		Elf32_Shdr
@@ -87,81 +87,81 @@ static int compare_extable(const void *a, const void *b)
 	return 0;
 }
 
-static int do_func(Elf_Ehdr *ehdr,
+static int do_sort(Elf_Ehdr *ehdr,
 		   char const *const fname,
 		   table_sort_t custom_sort)
 {
-	Elf_Shdr *shdr;
-	Elf_Shdr *shstrtab_sec;
+	Elf_Shdr *s, *shdr = (Elf_Shdr *)((char *)ehdr + _r(&ehdr->e_shoff));
 	Elf_Shdr *strtab_sec = NULL;
 	Elf_Shdr *symtab_sec = NULL;
 	Elf_Shdr *extab_sec = NULL;
 	Elf_Sym *sym;
 	const Elf_Sym *symtab;
-	Elf32_Word *symtab_shndx_start = NULL;
-	Elf_Sym *sort_needed_sym;
+	Elf32_Word *symtab_shndx = NULL;
+	Elf_Sym *sort_needed_sym = NULL;
 	Elf_Shdr *sort_needed_sec;
 	Elf_Rel *relocs = NULL;
 	int relocs_size = 0;
-	uint32_t *sort_done_location;
-	const char *secstrtab;
+	uint32_t *sort_needed_loc;
+	const char *secstrings;
 	const char *strtab;
 	char *extab_image;
 	int extab_index = 0;
 	int i;
 	int idx;
-	unsigned int num_sections;
-	unsigned int secindex_strings;
+	unsigned int shnum;
+	unsigned int shstrndx;
 
-	shdr = (Elf_Shdr *)((char *)ehdr + _r(&ehdr->e_shoff));
+	shstrndx = r2(&ehdr->e_shstrndx);
+	if (shstrndx == SHN_XINDEX)
+		shstrndx = r(&shdr[0].sh_link);
+	secstrings = (const char *)ehdr + _r(&shdr[shstrndx].sh_offset);
 
-	num_sections = r2(&ehdr->e_shnum);
-	if (num_sections == SHN_UNDEF)
-		num_sections = _r(&shdr[0].sh_size);
+	shnum = r2(&ehdr->e_shnum);
+	if (shnum == SHN_UNDEF)
+		shnum = _r(&shdr[0].sh_size);
 
-	secindex_strings = r2(&ehdr->e_shstrndx);
-	if (secindex_strings == SHN_XINDEX)
-		secindex_strings = r(&shdr[0].sh_link);
-
-	shstrtab_sec = shdr + secindex_strings;
-	secstrtab = (const char *)ehdr + _r(&shstrtab_sec->sh_offset);
-	for (i = 0; i < num_sections; i++) {
-		idx = r(&shdr[i].sh_name);
-		if (!strcmp(secstrtab + idx, "__ex_table")) {
-			extab_sec = shdr + i;
+	for (i = 0, s = shdr; s < shdr + shnum; i++, s++) {
+		idx = r(&s->sh_name);
+		if (!strcmp(secstrings + idx, "__ex_table")) {
+			extab_sec = s;
 			extab_index = i;
 		}
-		if ((r(&shdr[i].sh_type) == SHT_REL ||
-		     r(&shdr[i].sh_type) == SHT_RELA) &&
-		    r(&shdr[i].sh_info) == extab_index) {
-			relocs = (void *)ehdr + _r(&shdr[i].sh_offset);
-			relocs_size = _r(&shdr[i].sh_size);
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
 		}
-		if (!strcmp(secstrtab + idx, ".symtab"))
-			symtab_sec = shdr + i;
-		if (!strcmp(secstrtab + idx, ".strtab"))
-			strtab_sec = shdr + i;
-		if (r(&shdr[i].sh_type) == SHT_SYMTAB_SHNDX)
-			symtab_shndx_start = (Elf32_Word *)(
-				(const char *)ehdr + _r(&shdr[i].sh_offset));
+		if (r(&s->sh_type) == SHT_SYMTAB_SHNDX)
+			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
+						      _r(&s->sh_offset));
 	}
-	if (!strtab_sec) {
-		fprintf(stderr,	"no .strtab in file: %s\n", fname);
+
+	if (!extab_sec) {
+		fprintf(stderr,	"no __ex_table in file: %s\n", fname);
 		return -1;
 	}
+
 	if (!symtab_sec) {
 		fprintf(stderr,	"no .symtab in file: %s\n", fname);
 		return -1;
 	}
-	symtab = (const Elf_Sym *)((const char *)ehdr +
-				   _r(&symtab_sec->sh_offset));
-	if (!extab_sec) {
-		fprintf(stderr,	"no __ex_table in file: %s\n", fname);
+
+	if (!strtab_sec) {
+		fprintf(stderr,	"no .strtab in file: %s\n", fname);
 		return -1;
 	}
-	strtab = (const char *)ehdr + _r(&strtab_sec->sh_offset);
 
 	extab_image = (void *)ehdr + _r(&extab_sec->sh_offset);
+	strtab = (const char *)ehdr + _r(&strtab_sec->sh_offset);
+	symtab = (const Elf_Sym *)((const char *)ehdr +
+						  _r(&symtab_sec->sh_offset));
 
 	if (custom_sort) {
 		custom_sort(extab_image, _r(&extab_sec->sh_size));
@@ -170,38 +170,41 @@ static int do_func(Elf_Ehdr *ehdr,
 		qsort(extab_image, num_entries,
 		      extable_ent_size, compare_extable);
 	}
+
 	/* If there were relocations, we no longer need them. */
 	if (relocs)
 		memset(relocs, 0, relocs_size);
 
-	/* find main_extable_sort_needed */
-	sort_needed_sym = NULL;
-	for (i = 0; i < _r(&symtab_sec->sh_size) / sizeof(Elf_Sym); i++) {
-		sym = (void *)ehdr + _r(&symtab_sec->sh_offset);
-		sym += i;
+	/* find the flag main_extable_sort_needed */
+	for (sym = (void *)ehdr + _r(&symtab_sec->sh_offset);
+	     sym < sym + _r(&symtab_sec->sh_size) / sizeof(Elf_Sym);
+	     sym++) {
 		if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 			continue;
-		idx = r(&sym->st_name);
-		if (!strcmp(strtab + idx, "main_extable_sort_needed")) {
+		if (!strcmp(strtab + r(&sym->st_name),
+			    "main_extable_sort_needed")) {
 			sort_needed_sym = sym;
 			break;
 		}
 	}
+
 	if (!sort_needed_sym) {
 		fprintf(stderr,
 			"no main_extable_sort_needed symbol in file: %s\n",
 			fname);
 		return -1;
 	}
+
 	sort_needed_sec = &shdr[get_secindex(r2(&sym->st_shndx),
 					     sort_needed_sym - symtab,
-					     symtab_shndx_start)];
-	sort_done_location = (void *)ehdr +
+					     symtab_shndx)];
+	sort_needed_loc = (void *)ehdr +
 		_r(&sort_needed_sec->sh_offset) +
 		_r(&sort_needed_sym->st_value) -
 		_r(&sort_needed_sec->sh_addr);
 
-	/* We sorted it, clear the flag. */
-	w(0, sort_done_location);
+	/* extable has been sorted, clear the flag */
+	w(0, sort_needed_loc);
+
 	return 0;
 }
-- 
2.24.0.rc2

