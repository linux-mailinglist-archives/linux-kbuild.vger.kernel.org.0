Return-Path: <linux-kbuild+bounces-12209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGlwLv2ZwWlNUAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12209-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 20:52:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF7E2FCA41
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 20:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B5FB315BF55
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 19:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503A339446F;
	Mon, 23 Mar 2026 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f4tkw1r7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B435AC05;
	Mon, 23 Mar 2026 19:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293959; cv=none; b=XNpQ8xrXGsD4E+SW56ExdJlw5mPH8+bX9b8LqoiO+/tQO2uAABTQGHmxv8OYZjGylRUjP0PfXeiQE3KPg8aV4IX6VDaqg3JpLj4e0X+ujWw+QcYHBDpbxwRB7LNC81rdhaJedrdrtWqmbpqTsHDiVxmDS4LP1aUo/VzZn45KqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293959; c=relaxed/simple;
	bh=pRVwcjWbGZOMkMxCgyb3wrPsEMkf/bME02y11ek+PBY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kkEK+jDLmwM9bJ1I5fRaSWdjo7NFvwLROpn2V784Z6uA2sv6aasjni9nohECvAu2qDY+nlK+pF+uFGihvZfNY9Lqu6qawrG2nlheSccekVIpG702mpJFAPbq2EXDHDeAd4ogJVaYdpqHyeFMFf8SzS98562RMGhE/Pco3a+5Q7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f4tkw1r7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F156EC4CEF7;
	Mon, 23 Mar 2026 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774293958;
	bh=pRVwcjWbGZOMkMxCgyb3wrPsEMkf/bME02y11ek+PBY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f4tkw1r7yCmiIt3fIzSU21Bfp5TOVStZzHX6uyHlxTKAvxTTD2+o9fSiS7kBmu9gG
	 airEsJ4osNi/vKFGX/JVHen33a1O9MJgHfmS8piqFGL8JXf8bywLfK1W16lFbnip6h
	 mtpENkWsVlgrn9HCAqyv5vQKDdeCjtPLsOEGsjcw=
Date: Mon, 23 Mar 2026 12:25:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Greg
 KH <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>, Vlastimil
 Babka <vbabka@kernel.org>, Helge Deller <deller@gmx.de>, Randy Dunlap
 <rdunlap@infradead.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 0/4] kallsyms: embed source file:line info in kernel
 stack traces
Message-Id: <20260323122557.3e0ef47671a0eea7c3d89253@linux-foundation.org>
In-Reply-To: <20260322131543.971079-1-sashal@kernel.org>
References: <20260322131543.971079-1-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12209-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,nod.at,suse.com,linux-m68k.org,HansenPartnership.com,lwn.net,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DF7E2FCA41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Mar 2026 09:15:39 -0400 Sasha Levin <sashal@kernel.org> wrote:

> This series adds CONFIG_KALLSYMS_LINEINFO, which embeds source file:line
> information directly in the kernel image so that stack traces annotate
> every frame with the originating source location - no external tools, no
> debug symbols at runtime, and safe to use in NMI/panic context.

Thanks, I've updated mm.git's mm-nonmm-unstable branch to this version.

> Changes since v3
> =================
> 
> - Remove redundant gen_lineinfo entry in scripts/Makefile for
>   CONFIG_KALLSYMS_LINEINFO_MODULES (depends on CONFIG_KALLSYMS_LINEINFO
>   which already builds it). (Reported by Petr Pavlu)
> 
> - Use R_* constants from <elf.h> instead of hardcoded relocation type
>   values in r_type_abs32(). (Reported by Petr Pavlu)
> 
> - Simplify duplicated-path detection in make_relative(): replace loop
>   over every '/' with a direct midpoint check, since true path
>   duplication always splits at len/2. (Suggested by Petr Pavlu)
> 
> - Fix comment in process_dwarf(): sections in ET_REL objects have
>   sh_addr == 0 and therefore overlapping address ranges; this is
>   expected behavior, not a "may" situation. (Reported by Petr Pavlu)
> 
> - Use U32_MAX instead of UINT_MAX for the module raw_offset bounds
>   check, matching the u32 type of the addrs array.
>   (Reported by Petr Pavlu)
> 
> - Document the assumption that .text is at the start of the MOD_TEXT
>   segment in module_lookup_lineinfo(). A proper fix using ELF
>   relocations is planned for a future series.
>   (Reported by Petr Pavlu)
> 
> - Wrap -fno-inline-functions-called-once in $(call cc-option,...) for
>   clang compatibility. Clang does not support this GCC-specific flag;
>   the noinline attribute is sufficient.

Here's how v3 altered mm.git:


 kernel/module/kallsyms.c |    8 +++++--
 lib/tests/Makefile       |    2 -
 scripts/Makefile         |    1 
 scripts/gen_lineinfo.c   |   40 +++++++++++++++++--------------------
 4 files changed, 26 insertions(+), 25 deletions(-)

--- a/kernel/module/kallsyms.c~b
+++ a/kernel/module/kallsyms.c
@@ -547,13 +547,17 @@ bool module_lookup_lineinfo(struct modul
 	if (hdr->files_size < hdr->num_files * sizeof(u32))
 		return false;
 
-	/* Compute offset from module .text base */
+	/*
+	 * Compute offset from module .text base.
+	 * NOTE: This assumes .text is at the start of the MOD_TEXT segment.
+	 * A proper fix would use ELF relocations to reference .text directly.
+	 */
 	text_base = (unsigned long)mod->mem[MOD_TEXT].base;
 	if (addr < text_base)
 		return false;
 
 	raw_offset = addr - text_base;
-	if (raw_offset > UINT_MAX)
+	if (raw_offset > U32_MAX)
 		return false;
 
 	tbl.blk_addrs	= base + hdr->blocks_offset;
--- a/lib/tests/Makefile~b
+++ a/lib/tests/Makefile
@@ -36,7 +36,7 @@ obj-$(CONFIG_LIVEUPDATE_TEST) += liveupd
 CFLAGS_longest_symbol_kunit.o += $(call cc-disable-warning, missing-prototypes)
 obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
 
-CFLAGS_lineinfo_kunit.o += -fno-inline-functions-called-once
+CFLAGS_lineinfo_kunit.o += $(call cc-option,-fno-inline-functions-called-once)
 obj-$(CONFIG_LINEINFO_KUNIT_TEST) += lineinfo_kunit.o
 
 obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
--- a/scripts/gen_lineinfo.c~b
+++ a/scripts/gen_lineinfo.c
@@ -206,14 +206,11 @@ static const char *make_relative(const c
 	 */
 	{
 		size_t len = strlen(path);
+		size_t mid = len / 2;
 
-		for (p = path; (p = strchr(p, '/')) != NULL; p++) {
-			size_t prefix = p - path;
-			size_t rest = len - prefix - 1;
-
-			if (rest == prefix && !memcmp(path, p + 1, prefix))
-				return p + 1;
-		}
+		if (len > 1 && path[mid] == '/' &&
+		    !memcmp(path, path + mid + 1, mid))
+			return path + mid + 1;
 	}
 
 	/*
@@ -340,17 +337,17 @@ static void find_text_section_range(Elf
 static unsigned int r_type_abs32(unsigned int e_machine)
 {
 	switch (e_machine) {
-	case EM_X86_64:		return 10;	/* R_X86_64_32 */
-	case EM_386:		return 1;	/* R_386_32 */
-	case EM_AARCH64:	return 258;	/* R_AARCH64_ABS32 */
-	case EM_ARM:		return 2;	/* R_ARM_ABS32 */
-	case EM_RISCV:		return 1;	/* R_RISCV_32 */
-	case EM_S390:		return 4;	/* R_390_32 */
-	case EM_MIPS:		return 2;	/* R_MIPS_32 */
-	case EM_PPC64:		return 1;	/* R_PPC64_ADDR32 */
-	case EM_PPC:		return 1;	/* R_PPC_ADDR32 */
-	case EM_LOONGARCH:	return 1;	/* R_LARCH_32 */
-	case EM_PARISC:		return 1;	/* R_PARISC_DIR32 */
+	case EM_X86_64:		return R_X86_64_32;
+	case EM_386:		return R_386_32;
+	case EM_AARCH64:	return R_AARCH64_ABS32;
+	case EM_ARM:		return R_ARM_ABS32;
+	case EM_RISCV:		return R_RISCV_32;
+	case EM_S390:		return R_390_32;
+	case EM_MIPS:		return R_MIPS_32;
+	case EM_PPC64:		return R_PPC64_ADDR32;
+	case EM_PPC:		return R_PPC_ADDR32;
+	case EM_LOONGARCH:	return R_LARCH_32;
+	case EM_PARISC:		return R_PARISC_DIR32;
 	default:		return 0;
 	}
 }
@@ -492,9 +489,10 @@ static void process_dwarf(Dwarf *dwarf,
 
 			/*
 			 * In module mode, keep only .text addresses.
-			 * In ET_REL .ko files, .init.text/.exit.text may
-			 * overlap with .text address ranges, so we must
-			 * explicitly check against the .text bounds.
+			 * In ET_REL .ko files, .text, .init.text and
+			 * .exit.text all have sh_addr == 0 and therefore
+			 * overlapping address ranges.  Explicitly check
+			 * against the .text bounds.
 			 */
 			if (module_mode && text_section_end > text_section_start &&
 			    (addr < text_section_start || addr >= text_section_end))
--- a/scripts/Makefile~b
+++ a/scripts/Makefile
@@ -5,7 +5,6 @@
 
 hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
 hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO)		+= gen_lineinfo
-hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO_MODULES)	+= gen_lineinfo
 hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
 hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
_


