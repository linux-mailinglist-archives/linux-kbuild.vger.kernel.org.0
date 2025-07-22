Return-Path: <linux-kbuild+bounces-8101-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2198B0E04F
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 17:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FC067B22F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 15:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058D5264A86;
	Tue, 22 Jul 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5xGa3rw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B65263F5D;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197685; cv=none; b=b/jWUfw0GmO3Tf0HR3e+5fQkHrKEfWObNnEfYIphoD3wiByV1Tzhirgb616lft6rdEycfwyjR2OM4/rR0QfQ1OCVIS/Qi9QwMWyzS6LR9WJo9KNYOFpgMkDTuaPBS/9M+i3wT3OvkSgzvm+tpRlx2gWKnfoX9qfTiu0QdZUweqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197685; c=relaxed/simple;
	bh=4GTdnC8JJoqpNwB/W+g1szxDcReQDCIveoymk3DB28I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=RzSORi4UNcOHsA2GwZxhlSxIwxhjjSGNa8hJ6dE0MgmkpD6qqlIUi4p1wkUKYfxPyeYf8q1LO/0S/l/zPEraVVzzokBJxWrP2CiU81P1m9Rwgu4SYmdxCdvjQ/W8g2gbHREZl3ImGwCo2lmOt0TOLBzInYDk+iDhSRRQhFA9+v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5xGa3rw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71773C4AF0D;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753197685;
	bh=4GTdnC8JJoqpNwB/W+g1szxDcReQDCIveoymk3DB28I=;
	h=Date:From:To:Cc:Subject:References:From;
	b=H5xGa3rw2V8OfnlNBd6llex8zcHBsV7+jH4G7lrhTbBjvUm2Co0KTwdsdo2Vy0u5E
	 +5gleYJff1MnwXul8zr1RtOeN4s94810s7m35WoG+Ducbl4w9H5OBiZI4ZNTnCI+wJ
	 yaq7C4wdkpO7zatofuw0vuSi1uS/b3NRuG71d0PKjn2ryFkdEGMPgeCwUTzpHIuvFS
	 CC5Fm69fCUwnwjfBfDbBVb55NGIhh71oBcc6AZLIqlKSJ56IBhGGSumUaNd6i6RiPy
	 uqTjX0s6e9kn5CHiWSZzGWDIXL0/DnkqICG5YQMl+XzbpW6MAILk0UHGJ/2GePIELT
	 nNY6Y5FywlJXA==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1ueEoY-0000000AYzN-0c49;
	Tue, 22 Jul 2025 11:21:58 -0400
Message-ID: <20250722152158.003968940@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 22 Jul 2025 11:20:56 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v3 3/5] tracing: sorttable: Find unused tracepoints for arm64 that uses reloc
 for address
References: <20250722152053.343028095@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The addresses in the ARM64 ELF file is stored in the RELA sections similar
to the mcount location table. Add support to find the addresses from the
RELA section to use to get the actual addresses for checking the
tracepoints and the checking variables to show if all tracepoints are
used.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/sorttable.c | 186 ++++++++++++++++++++++++++++----------------
 1 file changed, 118 insertions(+), 68 deletions(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index ddcbec22ca96..edca5b06d8ce 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -578,6 +578,106 @@ static int compare_values_32(const void *a, const void *b)
 
 static int (*compare_values)(const void *a, const void *b);
 
+static char m_err[ERRSTR_MAXSZ];
+static long rela_type;
+static bool sort_reloc;
+static int reloc_shnum;
+
+/* Fill the array with the content of the relocs */
+static int fill_relocs(void *ptr, uint64_t size, Elf_Ehdr *ehdr, uint64_t start_loc)
+{
+	Elf_Shdr *shdr_start;
+	Elf_Rela *rel;
+	unsigned int shnum;
+	unsigned int count = 0;
+	int shentsize;
+	void *array_end = ptr + size;
+
+	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
+	shentsize = ehdr_shentsize(ehdr);
+
+	shnum = ehdr_shnum(ehdr);
+	if (shnum == SHN_UNDEF)
+		shnum = shdr_size(shdr_start);
+
+	for (int i = 0; i < shnum; i++) {
+		Elf_Shdr *shdr = get_index(shdr_start, shentsize, i);
+		void *end;
+
+		if (shdr_type(shdr) != SHT_RELA)
+			continue;
+
+		reloc_shnum = i;
+
+		rel = (void *)ehdr + shdr_offset(shdr);
+		end = (void *)rel + shdr_size(shdr);
+
+		for (; (void *)rel < end; rel = (void *)rel + shdr_entsize(shdr)) {
+			uint64_t offset = rela_offset(rel);
+
+			if (offset >= start_loc && offset < start_loc + size) {
+				if (ptr + long_size > array_end) {
+					snprintf(m_err, ERRSTR_MAXSZ,
+						 "Too many relocations");
+					return -1;
+				}
+
+				/* Make sure this has the correct type */
+				if (rela_info(rel) != rela_type) {
+					snprintf(m_err, ERRSTR_MAXSZ,
+						"rela has type %lx but expected %lx\n",
+						(long)rela_info(rel), rela_type);
+					return -1;
+				}
+
+				if (long_size == 4)
+					*(uint32_t *)ptr = rela_addend(rel);
+				else
+					*(uint64_t *)ptr = rela_addend(rel);
+				ptr += long_size;
+				count++;
+			}
+		}
+	}
+	return count;
+}
+
+static uint64_t get_addr_reloc(Elf_Ehdr *ehdr, uint64_t addr)
+{
+	Elf_Shdr *shdr_start;
+	Elf_Shdr *shdr;
+	Elf_Rela *rel;
+	unsigned int shnum;
+	int shentsize;
+	void *end;
+
+	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
+	shentsize = ehdr_shentsize(ehdr);
+
+	shnum = ehdr_shnum(ehdr);
+	if (shnum == SHN_UNDEF)
+		shnum = shdr_size(shdr_start);
+
+	shdr = get_index(shdr_start, shentsize, reloc_shnum);
+	if (shdr_type(shdr) != SHT_RELA)
+		return 0;
+
+	rel = (void *)ehdr + shdr_offset(shdr);
+	end = (void *)rel + shdr_size(shdr);
+
+	for (; (void *)rel < end; rel = (void *)rel + shdr_entsize(shdr)) {
+		uint64_t offset = rela_offset(rel);
+
+		if (offset == addr) {
+			if (long_size == 4)
+				return rela_addend(rel);
+			else
+				return rela_addend(rel);
+		}
+	}
+	return 0;
+}
+
 static int fill_addrs(void *ptr, uint64_t size, void *addrs)
 {
 	void *end = ptr + size;
@@ -696,11 +796,6 @@ static int parse_symbols(const char *fname)
 }
 
 static pthread_t mcount_sort_thread;
-static bool sort_reloc;
-
-static long rela_type;
-
-static char m_err[ERRSTR_MAXSZ];
 
 struct elf_mcount_loc {
 	Elf_Ehdr *ehdr;
@@ -708,63 +803,6 @@ struct elf_mcount_loc {
 	uint64_t stop_mcount_loc;
 };
 
-/* Fill the array with the content of the relocs */
-static int fill_relocs(void *ptr, uint64_t size, Elf_Ehdr *ehdr, uint64_t start_loc)
-{
-	Elf_Shdr *shdr_start;
-	Elf_Rela *rel;
-	unsigned int shnum;
-	unsigned int count = 0;
-	int shentsize;
-	void *array_end = ptr + size;
-
-	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
-	shentsize = ehdr_shentsize(ehdr);
-
-	shnum = ehdr_shnum(ehdr);
-	if (shnum == SHN_UNDEF)
-		shnum = shdr_size(shdr_start);
-
-	for (int i = 0; i < shnum; i++) {
-		Elf_Shdr *shdr = get_index(shdr_start, shentsize, i);
-		void *end;
-
-		if (shdr_type(shdr) != SHT_RELA)
-			continue;
-
-		rel = (void *)ehdr + shdr_offset(shdr);
-		end = (void *)rel + shdr_size(shdr);
-
-		for (; (void *)rel < end; rel = (void *)rel + shdr_entsize(shdr)) {
-			uint64_t offset = rela_offset(rel);
-
-			if (offset >= start_loc && offset < start_loc + size) {
-				if (ptr + long_size > array_end) {
-					snprintf(m_err, ERRSTR_MAXSZ,
-						 "Too many relocations");
-					return -1;
-				}
-
-				/* Make sure this has the correct type */
-				if (rela_info(rel) != rela_type) {
-					snprintf(m_err, ERRSTR_MAXSZ,
-						"rela has type %lx but expected %lx\n",
-						(long)rela_info(rel), rela_type);
-					return -1;
-				}
-
-				if (long_size == 4)
-					*(uint32_t *)ptr = rela_addend(rel);
-				else
-					*(uint64_t *)ptr = rela_addend(rel);
-				ptr += long_size;
-				count++;
-			}
-		}
-	}
-	return count;
-}
-
 /* Put the sorted vals back into the relocation elements */
 static void replace_relocs(void *ptr, uint64_t size, Elf_Ehdr *ehdr, uint64_t start_loc)
 {
@@ -957,7 +995,15 @@ static void make_trace_array(struct elf_tracepoint *etrace)
 		return;
 	}
 
-	count = fill_addrs(vals, size, start);
+	if (sort_reloc) {
+		count = fill_relocs(vals, size, ehdr, etrace->start_tracepoint_check);
+		/* gcc may use relocs to save the addresses, but clang does not. */
+		if (!count) {
+			count = fill_addrs(vals, size, start);
+			sort_reloc = 0;
+		}
+	} else
+		count = fill_addrs(vals, size, start);
 
 	compare_values = long_size == 4 ? compare_values_32 : compare_values_64;
 	qsort(vals, count, long_size, compare_values);
@@ -1017,10 +1063,14 @@ static int failed_event(struct elf_tracepoint *etrace, uint64_t addr)
 	if (name_ptr > file_map_end)
 		goto bad_addr;
 
-	if (long_size == 4)
-		addr = r(name_ptr);
-	else
-		addr = r8(name_ptr);
+	if (sort_reloc) {
+		addr = get_addr_reloc(ehdr, addr);
+	} else {
+		if (long_size == 4)
+			addr = r(name_ptr);
+		else
+			addr = r8(name_ptr);
+	}
 
 	sec_addr = shdr_addr(ro_data_sec);
 	sec_offset = shdr_offset(ro_data_sec);
@@ -1473,9 +1523,9 @@ static int do_file(char const *const fname, void *addr)
 
 	switch (r2(&ehdr->e32.e_machine)) {
 	case EM_AARCH64:
-#ifdef MCOUNT_SORT_ENABLED
 		sort_reloc = true;
 		rela_type = 0x403;
+#ifdef MCOUNT_SORT_ENABLED
 		/* arm64 uses patchable function entry placing before function */
 		before_func = 8;
 #endif
-- 
2.47.2



