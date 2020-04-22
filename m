Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2D61B50D8
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 01:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgDVXYV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Apr 2020 19:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgDVXYV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Apr 2020 19:24:21 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215FBC03C1AB
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2020 16:24:21 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id w70so3092755pgw.6
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2020 16:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=yXaZrhkzCMDSlnAE2Eo+e5XePe8fZRAAusM7Ii4LLx0=;
        b=mcFMm2c+HOA/tmYsZGPVJw/YFpEdZaJuteHAS6N8c358gTvFI9k6B34XRqEEh2w+1x
         Tf021DC1bWoYAsXiZhekk0QcrbbzskTnVdD9NvFjtTMbilxAi4s5spi5HykvngZSNEA4
         e8jV4+5gSV6IC0i2NYH5swIp4wl8Is1SlSr4d2fNA5+v87ZFI4I8GmRYxvgLYKBStMUD
         LSsykFJ0lYIX3avdQC1v14C/s+ufu92zdBk2c7zP59TpNtiud7LlOyknd6PBYBD/NZi2
         cA7OuTA1wEU6WBkKx6aqzX+c6InEHMoo/CWsB6mhzVBtcxmpMahXZwJERI9NyDflfBQ0
         bBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=yXaZrhkzCMDSlnAE2Eo+e5XePe8fZRAAusM7Ii4LLx0=;
        b=AHjETX6Yf6XnL1i4Ye9B+gNWrxopZPoH7t4Ew47UspYFIpE20BbRuRErdcvgcqgYUo
         +ItVBeR1tqpD9auASvlkbn7SrsSmnvClUIQs58UWYveyN3Fc/s7oAdDdraX1of8PuLxp
         KqEgxgfapuu8UoyJmkotN9BgMmiEoztTKO5WjNSjBgeSEj/nWYpkcnsco1pOyDYw+UFK
         +BvuIzFSZ/0BDKkzHU1vzwNdqV6quQKIfG7ZcqThCzXqvSZ9LML+r6DxE4eMSZIq13dj
         QcQNXvELmRFAbgjG+21HmNVx1Z9Yi/z8mU86IOfpt3RVUWXN1nKzL3SCCW57Xnb+a3EK
         VXig==
X-Gm-Message-State: AGi0PubyT0N6iefsAxk7MgZ3moy1hovqTMCvQC4WTTkF7jNLGUale3Qk
        KQqtUdWYb+LZ72YqeauLng9dE4Opo3Li6BRFAEw=
X-Google-Smtp-Source: APiQypKacBtm5HW906UQAJdkYK1Yatq8uPhpMrz25hG6KwpllCZokinVm+gsvpFKzPCaRYxZW1FgZKWZ96AtfGwimb0=
X-Received: by 2002:a17:90a:24e6:: with SMTP id i93mr1230539pje.13.1587597860493;
 Wed, 22 Apr 2020 16:24:20 -0700 (PDT)
Date:   Wed, 22 Apr 2020 16:24:17 -0700
Message-Id: <20200422232417.72162-1-samitolvanen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
Subject: [PATCH] recordmcount: support >64k sections
From:   Sami Tolvanen <samitolvanen@google.com>
To:     "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Matt Helsley <mhelsley@vmware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When compiling a kernel with Clang and LTO, we need to run
recordmcount on vmlinux.o with a large number of sections, which
currently fails as the program doesn't understand extended
section indexes. This change adds support for processing binaries
with >64k sections.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/recordmcount.h | 75 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 6 deletions(-)

diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index 74eab03e31d4..b48163864cca 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -29,6 +29,9 @@
 #undef has_rel_mcount
 #undef tot_relsize
 #undef get_mcountsym
+#undef get_shnum
+#undef get_shstrndx
+#undef get_symindex
 #undef get_sym_str_and_relp
 #undef do_func
 #undef Elf_Addr
@@ -58,6 +61,9 @@
 # define __has_rel_mcount	__has64_rel_mcount
 # define has_rel_mcount		has64_rel_mcount
 # define tot_relsize		tot64_relsize
+# define get_shnum		get_shnum64
+# define get_shstrndx		get_shstrndx64
+# define get_symindex		get_symindex64
 # define get_sym_str_and_relp	get_sym_str_and_relp_64
 # define do_func		do64
 # define get_mcountsym		get_mcountsym_64
@@ -91,6 +97,9 @@
 # define __has_rel_mcount	__has32_rel_mcount
 # define has_rel_mcount		has32_rel_mcount
 # define tot_relsize		tot32_relsize
+# define get_shnum		get_shnum32
+# define get_shstrndx		get_shstrndx32
+# define get_symindex		get_symindex32
 # define get_sym_str_and_relp	get_sym_str_and_relp_32
 # define do_func		do32
 # define get_mcountsym		get_mcountsym_32
@@ -173,6 +182,38 @@ static int MIPS_is_fake_mcount(Elf_Rel const *rp)
 	return is_fake;
 }
 
+static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
+				 Elf32_Word const *symtab_shndx)
+{
+	unsigned long offset;
+	int index;
+
+	if (sym->st_shndx != SHN_XINDEX)
+		return w2(sym->st_shndx);
+
+	offset = (unsigned long)sym - (unsigned long)symtab;
+	index = offset / sizeof(*sym);
+
+	return w(symtab_shndx[index]);
+}
+
+static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
+{
+	if (shdr0 && !ehdr->e_shnum)
+		return w(shdr0->sh_size);
+
+	return w2(ehdr->e_shnum);
+}
+
+static int get_shstrndx(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
+{
+	if (ehdr->e_shstrndx != SHN_XINDEX)
+		return w2(ehdr->e_shstrndx);
+
+	return w(shdr0->sh_link);
+}
+
+
 /* Append the new shstrtab, Elf_Shdr[], __mcount_loc and its relocations. */
 static int append_func(Elf_Ehdr *const ehdr,
 			Elf_Shdr *const shstr,
@@ -188,10 +229,12 @@ static int append_func(Elf_Ehdr *const ehdr,
 	char const *mc_name = (sizeof(Elf_Rela) == rel_entsize)
 		? ".rela__mcount_loc"
 		:  ".rel__mcount_loc";
-	unsigned const old_shnum = w2(ehdr->e_shnum);
 	uint_t const old_shoff = _w(ehdr->e_shoff);
 	uint_t const old_shstr_sh_size   = _w(shstr->sh_size);
 	uint_t const old_shstr_sh_offset = _w(shstr->sh_offset);
+	Elf_Shdr *const shdr0 = (Elf_Shdr *)(old_shoff + (void *)ehdr);
+	unsigned const old_shnum = get_shnum(ehdr, shdr0);
+	unsigned const new_shnum = 2 + old_shnum; /* {.rel,}__mcount_loc */
 	uint_t t = 1 + strlen(mc_name) + _w(shstr->sh_size);
 	uint_t new_e_shoff;
 
@@ -201,6 +244,12 @@ static int append_func(Elf_Ehdr *const ehdr,
 	t += (_align & -t);  /* word-byte align */
 	new_e_shoff = t;
 
+	if (!ehdr->e_shnum || new_shnum >= SHN_LORESERVE) {
+		ehdr->e_shnum = 0;
+		shdr0->sh_size = w(new_shnum);
+	} else
+		ehdr->e_shnum = w2(2 + w2(ehdr->e_shnum));
+
 	/* body for new shstrtab */
 	if (ulseek(sb.st_size, SEEK_SET) < 0)
 		return -1;
@@ -255,7 +304,6 @@ static int append_func(Elf_Ehdr *const ehdr,
 		return -1;
 
 	ehdr->e_shoff = _w(new_e_shoff);
-	ehdr->e_shnum = w2(2 + w2(ehdr->e_shnum));  /* {.rel,}__mcount_loc */
 	if (ulseek(0, SEEK_SET) < 0)
 		return -1;
 	if (uwrite(ehdr, sizeof(*ehdr)) < 0)
@@ -434,6 +482,8 @@ static int find_secsym_ndx(unsigned const txtndx,
 				uint_t *const recvalp,
 				unsigned int *sym_index,
 				Elf_Shdr const *const symhdr,
+				Elf32_Word const *symtab,
+				Elf32_Word const *symtab_shndx,
 				Elf_Ehdr const *const ehdr)
 {
 	Elf_Sym const *const sym0 = (Elf_Sym const *)(_w(symhdr->sh_offset)
@@ -445,7 +495,7 @@ static int find_secsym_ndx(unsigned const txtndx,
 	for (symp = sym0, t = nsym; t; --t, ++symp) {
 		unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
 
-		if (txtndx == w2(symp->st_shndx)
+		if (txtndx == get_symindex(symp, symtab, symtab_shndx)
 			/* avoid STB_WEAK */
 		    && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
 			/* function symbols on ARM have quirks, avoid them */
@@ -516,21 +566,23 @@ static unsigned tot_relsize(Elf_Shdr const *const shdr0,
 	return totrelsz;
 }
 
-
 /* Overall supervision for Elf32 ET_REL file. */
 static int do_func(Elf_Ehdr *const ehdr, char const *const fname,
 		   unsigned const reltype)
 {
 	Elf_Shdr *const shdr0 = (Elf_Shdr *)(_w(ehdr->e_shoff)
 		+ (void *)ehdr);
-	unsigned const nhdr = w2(ehdr->e_shnum);
-	Elf_Shdr *const shstr = &shdr0[w2(ehdr->e_shstrndx)];
+	unsigned const nhdr = get_shnum(ehdr, shdr0);
+	Elf_Shdr *const shstr = &shdr0[get_shstrndx(ehdr, shdr0)];
 	char const *const shstrtab = (char const *)(_w(shstr->sh_offset)
 		+ (void *)ehdr);
 
 	Elf_Shdr const *relhdr;
 	unsigned k;
 
+	Elf32_Word *symtab = NULL;
+	Elf32_Word *symtab_shndx = NULL;
+
 	/* Upper bound on space: assume all relevant relocs are for mcount. */
 	unsigned       totrelsz;
 
@@ -561,6 +613,16 @@ static int do_func(Elf_Ehdr *const ehdr, char const *const fname,
 		return -1;
 	}
 
+	for (relhdr = shdr0, k = nhdr; k; --k, ++relhdr) {
+		if (relhdr->sh_type == SHT_SYMTAB)
+			symtab = (void *)ehdr + relhdr->sh_offset;
+		else if (relhdr->sh_type == SHT_SYMTAB_SHNDX)
+			symtab_shndx = (void *)ehdr + relhdr->sh_offset;
+
+		if (symtab && symtab_shndx)
+			break;
+	}
+
 	for (relhdr = shdr0, k = nhdr; k; --k, ++relhdr) {
 		char const *const txtname = has_rel_mcount(relhdr, shdr0,
 			shstrtab, fname);
@@ -577,6 +639,7 @@ static int do_func(Elf_Ehdr *const ehdr, char const *const fname,
 			result = find_secsym_ndx(w(relhdr->sh_info), txtname,
 						&recval, &recsym,
 						&shdr0[symsec_sh_link],
+						symtab, symtab_shndx,
 						ehdr);
 			if (result)
 				goto out;

base-commit: c578ddb39e565139897124e74e5a43e56538cb33
-- 
2.26.1.301.g55bc3eb7cb9-goog

