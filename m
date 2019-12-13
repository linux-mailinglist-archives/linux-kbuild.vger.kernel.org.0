Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E6A11E179
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2019 11:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfLMKDy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Dec 2019 05:03:54 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:47783 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfLMKDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 05:03:54 -0500
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1ifhnO-0008KZ-Pt; Fri, 13 Dec 2019 11:03:38 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 71D331C2933;
        Fri, 13 Dec 2019 11:03:38 +0100 (CET)
Date:   Fri, 13 Dec 2019 10:03:38 -0000
From:   "tip-bot2 for Shile Zhang" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: core/objtool] scripts/sortextable: Rewrite error/success handling
Cc:     Shile Zhang <shile.zhang@linux.alibaba.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20191204004633.88660-2-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-2-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Message-ID: <157623141835.30329.11223391500620407057.tip-bot2@tip-bot2>
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

Commit-ID:     3c47b787b6516d2c3cbaa193fe13a83adbaaad1f
Gitweb:        https://git.kernel.org/tip/3c47b787b6516d2c3cbaa193fe13a83adbaaad1f
Author:        Shile Zhang <shile.zhang@linux.alibaba.com>
AuthorDate:    Wed, 04 Dec 2019 08:46:27 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 13 Dec 2019 10:47:31 +01:00

scripts/sortextable: Rewrite error/success handling

The scripts/sortextable.c code has originally copied some code from
scripts/recordmount.c, which used the same setjmp/longjmp method to
manage control flow.

Meanwhile recordmcount has improved its error handling via:

   3f1df12019f3 ("recordmcount: Rewrite error/success handling").

So rewrite this part of sortextable as well to get rid of the setjmp/longjmp
kludges, with additional refactoring, to make it more readable and
easier to extend.

No functional changes intended.

[ mingo: Rewrote the changelog. ]

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Link: https://lkml.kernel.org/r/20191204004633.88660-2-shile.zhang@linux.alibaba.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 scripts/sortextable.c | 119 ++++++++++++++---------------------------
 scripts/sortextable.h |  11 ++--
 2 files changed, 48 insertions(+), 82 deletions(-)

diff --git a/scripts/sortextable.c b/scripts/sortextable.c
index 5576865..cd9762b 100644
--- a/scripts/sortextable.c
+++ b/scripts/sortextable.c
@@ -22,7 +22,6 @@
 #include <getopt.h>
 #include <elf.h>
 #include <fcntl.h>
-#include <setjmp.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -51,61 +50,41 @@
 #define EM_ARCV2	195
 #endif
 
-static int fd_map;	/* File descriptor for file being modified. */
-static int mmap_failed; /* Boolean flag. */
-static void *ehdr_curr; /* current ElfXX_Ehdr *  for resource cleanup */
-static struct stat sb;	/* Remember .st_size, etc. */
-static jmp_buf jmpenv;	/* setjmp/longjmp per-file error escape */
-
-/* setjmp() return values */
-enum {
-	SJ_SETJMP = 0,  /* hardwired first return */
-	SJ_FAIL,
-	SJ_SUCCEED
-};
-
-/* Per-file resource cleanup when multiple files. */
-static void
-cleanup(void)
-{
-	if (!mmap_failed)
-		munmap(ehdr_curr, sb.st_size);
-	close(fd_map);
-}
-
-static void __attribute__((noreturn))
-fail_file(void)
-{
-	cleanup();
-	longjmp(jmpenv, SJ_FAIL);
-}
-
 /*
  * Get the whole file as a programming convenience in order to avoid
  * malloc+lseek+read+free of many pieces.  If successful, then mmap
  * avoids copying unused pieces; else just read the whole file.
  * Open for both read and write.
  */
-static void *mmap_file(char const *fname)
+static void *mmap_file(char const *fname, size_t *size)
 {
-	void *addr;
+	int fd;
+	struct stat sb;
+	void *addr = NULL;
 
-	fd_map = open(fname, O_RDWR);
-	if (fd_map < 0 || fstat(fd_map, &sb) < 0) {
+	fd = open(fname, O_RDWR);
+	if (fd < 0) {
 		perror(fname);
-		fail_file();
+		return NULL;
+	}
+	if (fstat(fd, &sb) < 0) {
+		perror(fname);
+		goto out;
 	}
 	if (!S_ISREG(sb.st_mode)) {
 		fprintf(stderr, "not a regular file: %s\n", fname);
-		fail_file();
+		goto out;
 	}
-	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED,
-		    fd_map, 0);
+	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
 	if (addr == MAP_FAILED) {
-		mmap_failed = 1;
 		fprintf(stderr, "Could not mmap file: %s\n", fname);
-		fail_file();
+		goto out;
 	}
+
+	*size = sb.st_size;
+
+out:
+	close(fd);
 	return addr;
 }
 
@@ -264,19 +243,18 @@ static void sort_relative_table(char *extab_image, int image_size)
 	}
 }
 
-static void
-do_file(char const *const fname)
+static int
+do_file(char const *const fname, void *addr)
 {
-	table_sort_t custom_sort;
-	Elf32_Ehdr *ehdr = mmap_file(fname);
+	table_sort_t custom_sort = NULL;
+	Elf32_Ehdr *ehdr = addr;
+	int rc = -1;
 
-	ehdr_curr = ehdr;
 	switch (ehdr->e_ident[EI_DATA]) {
 	default:
 		fprintf(stderr, "unrecognized ELF data encoding %d: %s\n",
 			ehdr->e_ident[EI_DATA], fname);
-		fail_file();
-		break;
+		return -1;
 	case ELFDATA2LSB:
 		r = rle;
 		r2 = r2le;
@@ -298,7 +276,7 @@ do_file(char const *const fname)
 	||  (r2(&ehdr->e_type) != ET_EXEC && r2(&ehdr->e_type) != ET_DYN)
 	||  ehdr->e_ident[EI_VERSION] != EV_CURRENT) {
 		fprintf(stderr, "unrecognized ET_EXEC/ET_DYN file %s\n", fname);
-		fail_file();
+		return -1;
 	}
 
 	custom_sort = NULL;
@@ -306,7 +284,6 @@ do_file(char const *const fname)
 	default:
 		fprintf(stderr, "unrecognized e_machine %d %s\n",
 			r2(&ehdr->e_machine), fname);
-		fail_file();
 		break;
 	case EM_386:
 	case EM_X86_64:
@@ -333,16 +310,15 @@ do_file(char const *const fname)
 	default:
 		fprintf(stderr, "unrecognized ELF class %d %s\n",
 			ehdr->e_ident[EI_CLASS], fname);
-		fail_file();
 		break;
 	case ELFCLASS32:
 		if (r2(&ehdr->e_ehsize) != sizeof(Elf32_Ehdr)
 		||  r2(&ehdr->e_shentsize) != sizeof(Elf32_Shdr)) {
 			fprintf(stderr,
 				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
-			fail_file();
+			break;
 		}
-		do32(ehdr, fname, custom_sort);
+		rc = do32(ehdr, fname, custom_sort);
 		break;
 	case ELFCLASS64: {
 		Elf64_Ehdr *const ghdr = (Elf64_Ehdr *)ehdr;
@@ -350,21 +326,22 @@ do_file(char const *const fname)
 		||  r2(&ghdr->e_shentsize) != sizeof(Elf64_Shdr)) {
 			fprintf(stderr,
 				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
-			fail_file();
+			break;
 		}
-		do64(ghdr, fname, custom_sort);
+		rc = do64(ghdr, fname, custom_sort);
 		break;
 	}
 	}  /* end switch */
 
-	cleanup();
+	return rc;
 }
 
 int
 main(int argc, char *argv[])
 {
-	int n_error = 0;  /* gcc-4.3.0 false positive complaint */
-	int i;
+	int i, n_error = 0;  /* gcc-4.3.0 false positive complaint */
+	size_t size = 0;
+	void *addr = NULL;
 
 	if (argc < 2) {
 		fprintf(stderr, "usage: sortextable vmlinux...\n");
@@ -373,28 +350,16 @@ main(int argc, char *argv[])
 
 	/* Process each file in turn, allowing deep failure. */
 	for (i = 1; i < argc; i++) {
-		char *file = argv[i];
-		int const sjval = setjmp(jmpenv);
+		addr = mmap_file(argv[i], &size);
+		if (!addr) {
+			++n_error;
+			continue;
+		}
 
-		switch (sjval) {
-		default:
-			fprintf(stderr, "internal error: %s\n", file);
-			exit(1);
-			break;
-		case SJ_SETJMP:    /* normal sequence */
-			/* Avoid problems if early cleanup() */
-			fd_map = -1;
-			ehdr_curr = NULL;
-			mmap_failed = 1;
-			do_file(file);
-			break;
-		case SJ_FAIL:    /* error in do_file or below */
+		if (do_file(argv[i], addr))
 			++n_error;
-			break;
-		case SJ_SUCCEED:    /* premature success */
-			/* do nothing */
-			break;
-		}  /* end switch */
+
+		munmap(addr, size);
 	}
 	return !!n_error;
 }
diff --git a/scripts/sortextable.h b/scripts/sortextable.h
index d4b3f6c..5a62e94 100644
--- a/scripts/sortextable.h
+++ b/scripts/sortextable.h
@@ -87,7 +87,7 @@ static int compare_extable(const void *a, const void *b)
 	return 0;
 }
 
-static void
+static int
 do_func(Elf_Ehdr *ehdr, char const *const fname, table_sort_t custom_sort)
 {
 	Elf_Shdr *shdr;
@@ -146,17 +146,17 @@ do_func(Elf_Ehdr *ehdr, char const *const fname, table_sort_t custom_sort)
 	}
 	if (strtab_sec == NULL) {
 		fprintf(stderr,	"no .strtab in  file: %s\n", fname);
-		fail_file();
+		return -1;
 	}
 	if (symtab_sec == NULL) {
 		fprintf(stderr,	"no .symtab in  file: %s\n", fname);
-		fail_file();
+		return -1;
 	}
 	symtab = (const Elf_Sym *)((const char *)ehdr +
 				   _r(&symtab_sec->sh_offset));
 	if (extab_sec == NULL) {
 		fprintf(stderr,	"no __ex_table in  file: %s\n", fname);
-		fail_file();
+		return -1;
 	}
 	strtab = (const char *)ehdr + _r(&strtab_sec->sh_offset);
 
@@ -190,7 +190,7 @@ do_func(Elf_Ehdr *ehdr, char const *const fname, table_sort_t custom_sort)
 		fprintf(stderr,
 			"no main_extable_sort_needed symbol in  file: %s\n",
 			fname);
-		fail_file();
+		return -1;
 	}
 	sort_needed_sec = &shdr[get_secindex(r2(&sym->st_shndx),
 					     sort_needed_sym - symtab,
@@ -206,4 +206,5 @@ do_func(Elf_Ehdr *ehdr, char const *const fname, table_sort_t custom_sort)
 #endif
 	/* We sorted it, clear the flag. */
 	w(0, sort_done_location);
+	return 0;
 }
