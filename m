Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD96411E17A
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2019 11:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfLMKDz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Dec 2019 05:03:55 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:47782 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLMKDz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 05:03:55 -0500
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1ifhnO-0008KO-9z; Fri, 13 Dec 2019 11:03:38 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id CD3EB1C2934;
        Fri, 13 Dec 2019 11:03:37 +0100 (CET)
Date:   Fri, 13 Dec 2019 10:03:37 -0000
From:   "tip-bot2 for Shile Zhang" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: core/objtool] scripts/sortextable: Refactor the do_func() function
Cc:     Shile Zhang <shile.zhang@linux.alibaba.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20191204004633.88660-5-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-5-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Message-ID: <157623141772.30329.18262579573923249830.tip-bot2@tip-bot2>
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

Commit-ID:     57cafdf2a04e161b9654c4ae3888a7549594c499
Gitweb:        https://git.kernel.org/tip/57cafdf2a04e161b9654c4ae3888a7549594c499
Author:        Shile Zhang <shile.zhang@linux.alibaba.com>
AuthorDate:    Wed, 04 Dec 2019 08:46:30 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 13 Dec 2019 10:47:58 +01:00

scripts/sortextable: Refactor the do_func() function

Refine the loop, naming and code structure, make the code more readable
and extendable. No functional changes intended.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Link: https://lkml.kernel.org/r/20191204004633.88660-5-shile.zhang@linux.alibaba.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 scripts/sortextable.c |   4 +-
 scripts/sortextable.h | 115 +++++++++++++++++++++--------------------
 2 files changed, 61 insertions(+), 58 deletions(-)

diff --git a/scripts/sortextable.c b/scripts/sortextable.c
index e5384e8..efa2839 100644
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
index a2e3af7..6485513 100644
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
