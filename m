Return-Path: <linux-kbuild+bounces-5278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D29FFF02
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 20:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 398AD162DB5
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 19:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEF51B4257;
	Thu,  2 Jan 2025 18:59:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CD01B414E;
	Thu,  2 Jan 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735844387; cv=none; b=pV67zgfms10mu+X9oVydf9urUa5/xrd3tKA8AMW0c3GUTGqV5l2xMLg3APEClFP4m9VaB5jV4BxY2yEHxVlwu2Nq30x2JdkbwVkJJya2aoHrvnr6UCurVUmByI0HbhgdvWVnn9DAkNM5kKiIzf1vk9zCHtP9Fm4RMTcAKmQhjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735844387; c=relaxed/simple;
	bh=Xi5Kd6v+5PObKO7g322knu3becI+HlpZMSy5XBPm7ZY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=UPB08SWLd9BTFgCgOxt/S4nbdPCbJcqfjMN6shgscpZusXkt4fdxE6xzmk1lIM62Pfz5XxjOd9HRyhk3QE1k5fasTkq8WlpRv7sTvRbVHuTF/PZ8i/Z++B0PBqcgVgqa5OMQgkAVCcua0tsJkEoXfg/iRgVCJHCZyPP6Ci5PhSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063CDC4CEDE;
	Thu,  2 Jan 2025 18:59:47 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tTQRL-00000005MkN-3F6f;
	Thu, 02 Jan 2025 14:01:03 -0500
Message-ID: <20250102190103.621684286@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 02 Jan 2025 13:58:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 bpf <bpf@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Zheng Yejian <zhengyejian1@huawei.com>,
 Martin  Kelly <martin.kelly@crowdstrike.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH 03/14] scripts/sorttable: Remove unneeded Elf_Rel
References: <20250102185845.928488650@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The code had references to initialize the Elf_Rel relocation tables, but
it was never used. Remove it.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/sorttable.h | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/scripts/sorttable.h b/scripts/sorttable.h
index 2a9ec5046e9a..aa7a8499a516 100644
--- a/scripts/sorttable.h
+++ b/scripts/sorttable.h
@@ -26,7 +26,6 @@
 #undef Elf_Addr
 #undef Elf_Ehdr
 #undef Elf_Shdr
-#undef Elf_Rel
 #undef Elf_Sym
 #undef ELF_ST_TYPE
 #undef uint_t
@@ -42,7 +41,6 @@
 # define Elf_Addr		Elf64_Addr
 # define Elf_Ehdr		Elf64_Ehdr
 # define Elf_Shdr		Elf64_Shdr
-# define Elf_Rel		Elf64_Rel
 # define Elf_Sym		Elf64_Sym
 # define ELF_ST_TYPE		ELF64_ST_TYPE
 # define uint_t			uint64_t
@@ -57,7 +55,6 @@
 # define Elf_Addr		Elf32_Addr
 # define Elf_Ehdr		Elf32_Ehdr
 # define Elf_Shdr		Elf32_Shdr
-# define Elf_Rel		Elf32_Rel
 # define Elf_Sym		Elf32_Sym
 # define ELF_ST_TYPE		ELF32_ST_TYPE
 # define uint_t			uint32_t
@@ -245,14 +242,10 @@ static int do_sort(Elf_Ehdr *ehdr,
 	Elf32_Word *symtab_shndx = NULL;
 	Elf_Sym *sort_needed_sym = NULL;
 	Elf_Shdr *sort_needed_sec;
-	Elf_Rel *relocs = NULL;
-	int relocs_size = 0;
 	uint32_t *sort_needed_loc;
 	const char *secstrings;
 	const char *strtab;
 	char *extab_image;
-	int extab_index = 0;
-	int i;
 	int idx;
 	unsigned int shnum;
 	unsigned int shstrndx;
@@ -276,23 +269,15 @@ static int do_sort(Elf_Ehdr *ehdr,
 	if (shnum == SHN_UNDEF)
 		shnum = _r(&shdr[0].sh_size);
 
-	for (i = 0, s = shdr; s < shdr + shnum; i++, s++) {
+	for (s = shdr; s < shdr + shnum; s++) {
 		idx = r(&s->sh_name);
-		if (!strcmp(secstrings + idx, "__ex_table")) {
+		if (!strcmp(secstrings + idx, "__ex_table"))
 			extab_sec = s;
-			extab_index = i;
-		}
 		if (!strcmp(secstrings + idx, ".symtab"))
 			symtab_sec = s;
 		if (!strcmp(secstrings + idx, ".strtab"))
 			strtab_sec = s;
 
-		if ((r(&s->sh_type) == SHT_REL ||
-		     r(&s->sh_type) == SHT_RELA) &&
-		    r(&s->sh_info) == extab_index) {
-			relocs = (void *)ehdr + _r(&s->sh_offset);
-			relocs_size = _r(&s->sh_size);
-		}
 		if (r(&s->sh_type) == SHT_SYMTAB_SHNDX)
 			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
 						      _r(&s->sh_offset));
@@ -394,10 +379,6 @@ static int do_sort(Elf_Ehdr *ehdr,
 		      extable_ent_size, compare_extable);
 	}
 
-	/* If there were relocations, we no longer need them. */
-	if (relocs)
-		memset(relocs, 0, relocs_size);
-
 	/* find the flag main_extable_sort_needed */
 	for (sym = (void *)ehdr + _r(&symtab_sec->sh_offset);
 	     sym < sym + _r(&symtab_sec->sh_size) / sizeof(Elf_Sym);
-- 
2.45.2



