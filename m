Return-Path: <linux-kbuild+bounces-8155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BEB116B5
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 04:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 460A93B296B
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 02:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B20239E77;
	Fri, 25 Jul 2025 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sh/mM7Be"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC8523770A;
	Fri, 25 Jul 2025 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753411929; cv=none; b=RzfwLdTmSoZ3K57mxK2e+mKQvYhKBkIzoRn+qbHKZGKUMFC5Lx+7HuawecBNb+hWr5+XimJaKUpiwyRSBuzqCzHITAJzpD1S+vn4NpImyGxj8LKUswRf2Yj+GTbMPlTADxDja8oD8YT5FgbKmRTOQAbFQZX9bVcYOI/GY8qI63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753411929; c=relaxed/simple;
	bh=3WUXG1jqBDyZ6nDRECZwj8MFu2jzPIQ+KMVczdvUP5Q=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=FfnOAa20sVobbzqr/QYGuvPW9xRi4Qk6p1xqIo4HeCHGNiLse3vMjjyCoNqQqGBmJfKUH4NVO/iNWpt0EBnlLaO6w5SEgVir8BZjxiL8CxYvjxYGg9Z62zaKkOkgzpkLyqMpEzkuz6+t1bO5C+Cg1i/ZwWRVUzDwikX+s/fyMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sh/mM7Be; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9C0C4CEF5;
	Fri, 25 Jul 2025 02:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753411929;
	bh=3WUXG1jqBDyZ6nDRECZwj8MFu2jzPIQ+KMVczdvUP5Q=;
	h=Date:From:To:Cc:Subject:References:From;
	b=sh/mM7Be30CeWCqUID1TYttLYTS5srMEFxuteAAKrJH6dhMiu1R0WEUpnqueWD+xL
	 T1JbqkezJXODnyDRN7wfsNuzV5nyEhOk+nqhMjH/9h2V860Ps7CA46Edi5n3ywnbZJ
	 hRL9p+5bZOx4ubWz6voa52OoU7Y6QWhC4t/fuF+c/4n7LIuilLf5TTkLrYieYMlp3o
	 dsSEiFQ7OTadiC3IuKzWGT8nnGK+toUAcZ0PaEjlgJojVoLs7DYrUu7RJGoHYLoLgq
	 ip0zXp30t6tVsA+AUYPFkVerHPfR4HCDtJom4jeoGOIdYDrVSc3VlDvLKwfdkAG3QY
	 riXm3+jMhHMhw==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uf8Xd-000000010oR-1Lm9;
	Thu, 24 Jul 2025 22:52:13 -0400
Message-ID: <20250725025213.172396468@kernel.org>
User-Agent: quilt/0.68
Date: Thu, 24 Jul 2025 22:51:50 -0400
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
Subject: [PATCH v5 1/3] sorttable: Move ELF parsing into scripts/elf-parse.[ch]
References: <20250725025149.726267838@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

In order to share the elf parsing that is in sorttable.c so that other
programs could use the same code, move it into elf-parse.c and
elf-parse.h.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/Makefile    |   3 +
 scripts/elf-parse.c | 198 ++++++++++++++++++
 scripts/elf-parse.h | 306 ++++++++++++++++++++++++++++
 scripts/sorttable.c | 477 ++++----------------------------------------
 4 files changed, 541 insertions(+), 443 deletions(-)
 create mode 100644 scripts/elf-parse.c
 create mode 100644 scripts/elf-parse.h

diff --git a/scripts/Makefile b/scripts/Makefile
index 46f860529df5..f19624b3ed92 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -12,6 +12,8 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
 
+sorttable-objs := sorttable.o elf-parse.o
+
 ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 always-$(CONFIG_RUST)					+= target.json
 filechk_rust_target = $< < include/config/auto.conf
@@ -25,6 +27,7 @@ generate_rust_target-rust := y
 rustdoc_test_builder-rust := y
 rustdoc_test_gen-rust := y
 
+HOSTCFLAGS_elf-parse.o = -I$(srctree)/tools/include
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTLDLIBS_sorttable = -lpthread
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
new file mode 100644
index 000000000000..85163e4b46f0
--- /dev/null
+++ b/scripts/elf-parse.c
@@ -0,0 +1,198 @@
+#include <sys/types.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <string.h>
+#include <unistd.h>
+#include <errno.h>
+
+#include "elf-parse.h"
+
+struct elf_funcs elf_parser;
+
+/*
+ * Get the whole file as a programming convenience in order to avoid
+ * malloc+lseek+read+free of many pieces.  If successful, then mmap
+ * avoids copying unused pieces; else just read the whole file.
+ * Open for both read and write.
+ */
+static void *map_file(char const *fname, size_t *size)
+{
+	int fd;
+	struct stat sb;
+	void *addr = NULL;
+
+	fd = open(fname, O_RDWR);
+	if (fd < 0) {
+		perror(fname);
+		return NULL;
+	}
+	if (fstat(fd, &sb) < 0) {
+		perror(fname);
+		goto out;
+	}
+	if (!S_ISREG(sb.st_mode)) {
+		fprintf(stderr, "not a regular file: %s\n", fname);
+		goto out;
+	}
+
+	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
+	if (addr == MAP_FAILED) {
+		fprintf(stderr, "Could not mmap file: %s\n", fname);
+		goto out;
+	}
+
+	*size = sb.st_size;
+
+out:
+	close(fd);
+	return addr;
+}
+
+static int elf_parse(const char *fname, void *addr, uint32_t types)
+{
+	Elf_Ehdr *ehdr = addr;
+	uint16_t type;
+
+	switch (ehdr->e32.e_ident[EI_DATA]) {
+	case ELFDATA2LSB:
+		elf_parser.r	= rle;
+		elf_parser.r2	= r2le;
+		elf_parser.r8	= r8le;
+		elf_parser.w	= wle;
+		elf_parser.w8	= w8le;
+		break;
+	case ELFDATA2MSB:
+		elf_parser.r	= rbe;
+		elf_parser.r2	= r2be;
+		elf_parser.r8	= r8be;
+		elf_parser.w	= wbe;
+		elf_parser.w8	= w8be;
+		break;
+	default:
+		fprintf(stderr, "unrecognized ELF data encoding %d: %s\n",
+			ehdr->e32.e_ident[EI_DATA], fname);
+		return -1;
+	}
+
+	if (memcmp(ELFMAG, ehdr->e32.e_ident, SELFMAG) != 0 ||
+	    ehdr->e32.e_ident[EI_VERSION] != EV_CURRENT) {
+		fprintf(stderr, "unrecognized ELF file %s\n", fname);
+		return -1;
+	}
+
+	type = elf_parser.r2(&ehdr->e32.e_type);
+	if (!((1 << type) & types)) {
+		fprintf(stderr, "Invalid ELF type file %s\n", fname);
+		return -1;
+	}
+
+	switch (ehdr->e32.e_ident[EI_CLASS]) {
+	case ELFCLASS32: {
+		elf_parser.ehdr_shoff		= ehdr32_shoff;
+		elf_parser.ehdr_shentsize	= ehdr32_shentsize;
+		elf_parser.ehdr_shstrndx	= ehdr32_shstrndx;
+		elf_parser.ehdr_shnum		= ehdr32_shnum;
+		elf_parser.shdr_addr		= shdr32_addr;
+		elf_parser.shdr_offset		= shdr32_offset;
+		elf_parser.shdr_link		= shdr32_link;
+		elf_parser.shdr_size		= shdr32_size;
+		elf_parser.shdr_name		= shdr32_name;
+		elf_parser.shdr_type		= shdr32_type;
+		elf_parser.shdr_entsize		= shdr32_entsize;
+		elf_parser.sym_type		= sym32_type;
+		elf_parser.sym_name		= sym32_name;
+		elf_parser.sym_value		= sym32_value;
+		elf_parser.sym_shndx		= sym32_shndx;
+		elf_parser.rela_offset		= rela32_offset;
+		elf_parser.rela_info		= rela32_info;
+		elf_parser.rela_addend		= rela32_addend;
+		elf_parser.rela_write_addend	= rela32_write_addend;
+
+		if (elf_parser.r2(&ehdr->e32.e_ehsize) != sizeof(Elf32_Ehdr) ||
+		    elf_parser.r2(&ehdr->e32.e_shentsize) != sizeof(Elf32_Shdr)) {
+			fprintf(stderr,
+				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
+			return -1;
+		}
+
+		}
+		break;
+	case ELFCLASS64: {
+		elf_parser.ehdr_shoff		= ehdr64_shoff;
+		elf_parser.ehdr_shentsize		= ehdr64_shentsize;
+		elf_parser.ehdr_shstrndx		= ehdr64_shstrndx;
+		elf_parser.ehdr_shnum		= ehdr64_shnum;
+		elf_parser.shdr_addr		= shdr64_addr;
+		elf_parser.shdr_offset		= shdr64_offset;
+		elf_parser.shdr_link		= shdr64_link;
+		elf_parser.shdr_size		= shdr64_size;
+		elf_parser.shdr_name		= shdr64_name;
+		elf_parser.shdr_type		= shdr64_type;
+		elf_parser.shdr_entsize		= shdr64_entsize;
+		elf_parser.sym_type		= sym64_type;
+		elf_parser.sym_name		= sym64_name;
+		elf_parser.sym_value		= sym64_value;
+		elf_parser.sym_shndx		= sym64_shndx;
+		elf_parser.rela_offset		= rela64_offset;
+		elf_parser.rela_info		= rela64_info;
+		elf_parser.rela_addend		= rela64_addend;
+		elf_parser.rela_write_addend	= rela64_write_addend;
+
+		if (elf_parser.r2(&ehdr->e64.e_ehsize) != sizeof(Elf64_Ehdr) ||
+		    elf_parser.r2(&ehdr->e64.e_shentsize) != sizeof(Elf64_Shdr)) {
+			fprintf(stderr,
+				"unrecognized ET_EXEC/ET_DYN file: %s\n",
+				fname);
+			return -1;
+		}
+
+		}
+		break;
+	default:
+		fprintf(stderr, "unrecognized ELF class %d %s\n",
+			ehdr->e32.e_ident[EI_CLASS], fname);
+		return -1;
+	}
+	return 0;
+}
+
+int elf_map_machine(void *addr)
+{
+	Elf_Ehdr *ehdr = addr;
+
+	return elf_parser.r2(&ehdr->e32.e_machine);
+}
+
+int elf_map_long_size(void *addr)
+{
+	Elf_Ehdr *ehdr = addr;
+
+	return elf_parser.r2(&ehdr->e32.e_machine) == ELFCLASS32 ? 4 : 8;
+}
+
+void *elf_map(char const *fname, size_t *size, uint32_t types)
+{
+	void *addr;
+	int ret;
+
+	addr = map_file(fname, size);
+	if (!addr)
+		return NULL;
+
+	ret = elf_parse(fname, addr, types);
+	if (ret < 0) {
+		elf_unmap(addr, *size);
+		return NULL;
+	}
+
+	return addr;
+}
+
+void elf_unmap(void *addr, size_t size)
+{
+	munmap(addr, size);
+}
diff --git a/scripts/elf-parse.h b/scripts/elf-parse.h
new file mode 100644
index 000000000000..f2d0e71b867d
--- /dev/null
+++ b/scripts/elf-parse.h
@@ -0,0 +1,306 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _SCRIPTS_ELF_PARSE_H
+#define _SCRIPTS_ELF_PARSE_H
+
+#include <elf.h>
+
+#include <tools/be_byteshift.h>
+#include <tools/le_byteshift.h>
+
+typedef union {
+	Elf32_Ehdr	e32;
+	Elf64_Ehdr	e64;
+} Elf_Ehdr;
+
+typedef union {
+	Elf32_Shdr	e32;
+	Elf64_Shdr	e64;
+} Elf_Shdr;
+
+typedef union {
+	Elf32_Sym	e32;
+	Elf64_Sym	e64;
+} Elf_Sym;
+
+typedef union {
+	Elf32_Rela	e32;
+	Elf64_Rela	e64;
+} Elf_Rela;
+
+struct elf_funcs {
+	int (*compare_extable)(const void *a, const void *b);
+	uint64_t (*ehdr_shoff)(Elf_Ehdr *ehdr);
+	uint16_t (*ehdr_shstrndx)(Elf_Ehdr *ehdr);
+	uint16_t (*ehdr_shentsize)(Elf_Ehdr *ehdr);
+	uint16_t (*ehdr_shnum)(Elf_Ehdr *ehdr);
+	uint64_t (*shdr_addr)(Elf_Shdr *shdr);
+	uint64_t (*shdr_offset)(Elf_Shdr *shdr);
+	uint64_t (*shdr_size)(Elf_Shdr *shdr);
+	uint64_t (*shdr_entsize)(Elf_Shdr *shdr);
+	uint32_t (*shdr_link)(Elf_Shdr *shdr);
+	uint32_t (*shdr_name)(Elf_Shdr *shdr);
+	uint32_t (*shdr_type)(Elf_Shdr *shdr);
+	uint8_t (*sym_type)(Elf_Sym *sym);
+	uint32_t (*sym_name)(Elf_Sym *sym);
+	uint64_t (*sym_value)(Elf_Sym *sym);
+	uint16_t (*sym_shndx)(Elf_Sym *sym);
+	uint64_t (*rela_offset)(Elf_Rela *rela);
+	uint64_t (*rela_info)(Elf_Rela *rela);
+	uint64_t (*rela_addend)(Elf_Rela *rela);
+	void (*rela_write_addend)(Elf_Rela *rela, uint64_t val);
+	uint32_t (*r)(const uint32_t *);
+	uint16_t (*r2)(const uint16_t *);
+	uint64_t (*r8)(const uint64_t *);
+	void (*w)(uint32_t, uint32_t *);
+	void (*w8)(uint64_t, uint64_t *);
+};
+
+extern struct elf_funcs elf_parser;
+
+static inline uint64_t ehdr64_shoff(Elf_Ehdr *ehdr)
+{
+	return elf_parser.r8(&ehdr->e64.e_shoff);
+}
+
+static inline uint64_t ehdr32_shoff(Elf_Ehdr *ehdr)
+{
+	return elf_parser.r(&ehdr->e32.e_shoff);
+}
+
+static inline uint64_t ehdr_shoff(Elf_Ehdr *ehdr)
+{
+	return elf_parser.ehdr_shoff(ehdr);
+}
+
+#define EHDR_HALF(fn_name)				\
+static inline uint16_t ehdr64_##fn_name(Elf_Ehdr *ehdr)	\
+{							\
+	return elf_parser.r2(&ehdr->e64.e_##fn_name);	\
+}							\
+							\
+static inline uint16_t ehdr32_##fn_name(Elf_Ehdr *ehdr)	\
+{							\
+	return elf_parser.r2(&ehdr->e32.e_##fn_name);	\
+}							\
+							\
+static inline uint16_t ehdr_##fn_name(Elf_Ehdr *ehdr)	\
+{							\
+	return elf_parser.ehdr_##fn_name(ehdr);		\
+}
+
+EHDR_HALF(shentsize)
+EHDR_HALF(shstrndx)
+EHDR_HALF(shnum)
+
+#define SHDR_WORD(fn_name)				\
+static inline uint32_t shdr64_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.r(&shdr->e64.sh_##fn_name);	\
+}							\
+							\
+static inline uint32_t shdr32_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.r(&shdr->e32.sh_##fn_name);	\
+}							\
+							\
+static inline uint32_t shdr_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.shdr_##fn_name(shdr);	\
+}
+
+#define SHDR_ADDR(fn_name)				\
+static inline uint64_t shdr64_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.r8(&shdr->e64.sh_##fn_name);	\
+}							\
+							\
+static inline uint64_t shdr32_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.r(&shdr->e32.sh_##fn_name);	\
+}							\
+							\
+static inline uint64_t shdr_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.shdr_##fn_name(shdr);		\
+}
+
+#define SHDR_WORD(fn_name)				\
+static inline uint32_t shdr64_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.r(&shdr->e64.sh_##fn_name);	\
+}							\
+							\
+static inline uint32_t shdr32_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.r(&shdr->e32.sh_##fn_name);	\
+}							\
+static inline uint32_t shdr_##fn_name(Elf_Shdr *shdr)	\
+{							\
+	return elf_parser.shdr_##fn_name(shdr);		\
+}
+
+SHDR_ADDR(addr)
+SHDR_ADDR(offset)
+SHDR_ADDR(size)
+SHDR_ADDR(entsize)
+
+SHDR_WORD(link)
+SHDR_WORD(name)
+SHDR_WORD(type)
+
+#define SYM_ADDR(fn_name)				\
+static inline uint64_t sym64_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.r8(&sym->e64.st_##fn_name);	\
+}							\
+							\
+static inline uint64_t sym32_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.r(&sym->e32.st_##fn_name);	\
+}							\
+							\
+static inline uint64_t sym_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.sym_##fn_name(sym);		\
+}
+
+#define SYM_WORD(fn_name)				\
+static inline uint32_t sym64_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.r(&sym->e64.st_##fn_name);	\
+}							\
+							\
+static inline uint32_t sym32_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.r(&sym->e32.st_##fn_name);	\
+}							\
+							\
+static inline uint32_t sym_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.sym_##fn_name(sym);		\
+}
+
+#define SYM_HALF(fn_name)				\
+static inline uint16_t sym64_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.r2(&sym->e64.st_##fn_name);	\
+}							\
+							\
+static inline uint16_t sym32_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.r2(&sym->e32.st_##fn_name);	\
+}							\
+							\
+static inline uint16_t sym_##fn_name(Elf_Sym *sym)	\
+{							\
+	return elf_parser.sym_##fn_name(sym);		\
+}
+
+static inline uint8_t sym64_type(Elf_Sym *sym)
+{
+	return ELF64_ST_TYPE(sym->e64.st_info);
+}
+
+static inline uint8_t sym32_type(Elf_Sym *sym)
+{
+	return ELF32_ST_TYPE(sym->e32.st_info);
+}
+
+static inline uint8_t sym_type(Elf_Sym *sym)
+{
+	return elf_parser.sym_type(sym);
+}
+
+SYM_ADDR(value)
+SYM_WORD(name)
+SYM_HALF(shndx)
+
+#define __maybe_unused			__attribute__((__unused__))
+
+#define RELA_ADDR(fn_name)						\
+static inline uint64_t rela64_##fn_name(Elf_Rela *rela)			\
+{									\
+	return elf_parser.r8((uint64_t *)&rela->e64.r_##fn_name);	\
+}									\
+									\
+static inline uint64_t rela32_##fn_name(Elf_Rela *rela)			\
+{									\
+	return elf_parser.r((uint32_t *)&rela->e32.r_##fn_name);	\
+}									\
+									\
+static inline uint64_t __maybe_unused rela_##fn_name(Elf_Rela *rela)	\
+{									\
+	return elf_parser.rela_##fn_name(rela);				\
+}
+
+RELA_ADDR(offset)
+RELA_ADDR(info)
+RELA_ADDR(addend)
+
+static inline void rela64_write_addend(Elf_Rela *rela, uint64_t val)
+{
+	elf_parser.w8(val, (uint64_t *)&rela->e64.r_addend);
+}
+
+static inline void rela32_write_addend(Elf_Rela *rela, uint64_t val)
+{
+	elf_parser.w(val, (uint32_t *)&rela->e32.r_addend);
+}
+
+static inline uint32_t rbe(const uint32_t *x)
+{
+	return get_unaligned_be32(x);
+}
+
+static inline uint16_t r2be(const uint16_t *x)
+{
+	return get_unaligned_be16(x);
+}
+
+static inline uint64_t r8be(const uint64_t *x)
+{
+	return get_unaligned_be64(x);
+}
+
+static inline uint32_t rle(const uint32_t *x)
+{
+	return get_unaligned_le32(x);
+}
+
+static inline uint16_t r2le(const uint16_t *x)
+{
+	return get_unaligned_le16(x);
+}
+
+static inline uint64_t r8le(const uint64_t *x)
+{
+	return get_unaligned_le64(x);
+}
+
+static inline void wbe(uint32_t val, uint32_t *x)
+{
+	put_unaligned_be32(val, x);
+}
+
+static inline void wle(uint32_t val, uint32_t *x)
+{
+	put_unaligned_le32(val, x);
+}
+
+static inline void w8be(uint64_t val, uint64_t *x)
+{
+	put_unaligned_be64(val, x);
+}
+
+static inline void w8le(uint64_t val, uint64_t *x)
+{
+	put_unaligned_le64(val, x);
+}
+
+void *elf_map(char const *fname, size_t *size, uint32_t types);
+void elf_unmap(void *addr, size_t size);
+int elf_map_machine(void *addr);
+int elf_map_long_size(void *addr);
+
+#endif /* _SCRIPTS_ELF_PARSE_H */
+
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index deed676bfe38..e8ed11c680c6 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -21,10 +21,8 @@
  */
 
 #include <sys/types.h>
-#include <sys/mman.h>
 #include <sys/stat.h>
 #include <getopt.h>
-#include <elf.h>
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -34,8 +32,7 @@
 #include <errno.h>
 #include <pthread.h>
 
-#include <tools/be_byteshift.h>
-#include <tools/le_byteshift.h>
+#include "elf-parse.h"
 
 #ifndef EM_ARCOMPACT
 #define EM_ARCOMPACT	93
@@ -65,335 +62,8 @@
 #define EM_LOONGARCH	258
 #endif
 
-typedef union {
-	Elf32_Ehdr	e32;
-	Elf64_Ehdr	e64;
-} Elf_Ehdr;
-
-typedef union {
-	Elf32_Shdr	e32;
-	Elf64_Shdr	e64;
-} Elf_Shdr;
-
-typedef union {
-	Elf32_Sym	e32;
-	Elf64_Sym	e64;
-} Elf_Sym;
-
-typedef union {
-	Elf32_Rela	e32;
-	Elf64_Rela	e64;
-} Elf_Rela;
-
-static uint32_t (*r)(const uint32_t *);
-static uint16_t (*r2)(const uint16_t *);
-static uint64_t (*r8)(const uint64_t *);
-static void (*w)(uint32_t, uint32_t *);
-static void (*w8)(uint64_t, uint64_t *);
 typedef void (*table_sort_t)(char *, int);
 
-static struct elf_funcs {
-	int (*compare_extable)(const void *a, const void *b);
-	uint64_t (*ehdr_shoff)(Elf_Ehdr *ehdr);
-	uint16_t (*ehdr_shstrndx)(Elf_Ehdr *ehdr);
-	uint16_t (*ehdr_shentsize)(Elf_Ehdr *ehdr);
-	uint16_t (*ehdr_shnum)(Elf_Ehdr *ehdr);
-	uint64_t (*shdr_addr)(Elf_Shdr *shdr);
-	uint64_t (*shdr_offset)(Elf_Shdr *shdr);
-	uint64_t (*shdr_size)(Elf_Shdr *shdr);
-	uint64_t (*shdr_entsize)(Elf_Shdr *shdr);
-	uint32_t (*shdr_link)(Elf_Shdr *shdr);
-	uint32_t (*shdr_name)(Elf_Shdr *shdr);
-	uint32_t (*shdr_type)(Elf_Shdr *shdr);
-	uint8_t (*sym_type)(Elf_Sym *sym);
-	uint32_t (*sym_name)(Elf_Sym *sym);
-	uint64_t (*sym_value)(Elf_Sym *sym);
-	uint16_t (*sym_shndx)(Elf_Sym *sym);
-	uint64_t (*rela_offset)(Elf_Rela *rela);
-	uint64_t (*rela_info)(Elf_Rela *rela);
-	uint64_t (*rela_addend)(Elf_Rela *rela);
-	void (*rela_write_addend)(Elf_Rela *rela, uint64_t val);
-} e;
-
-static uint64_t ehdr64_shoff(Elf_Ehdr *ehdr)
-{
-	return r8(&ehdr->e64.e_shoff);
-}
-
-static uint64_t ehdr32_shoff(Elf_Ehdr *ehdr)
-{
-	return r(&ehdr->e32.e_shoff);
-}
-
-static uint64_t ehdr_shoff(Elf_Ehdr *ehdr)
-{
-	return e.ehdr_shoff(ehdr);
-}
-
-#define EHDR_HALF(fn_name)				\
-static uint16_t ehdr64_##fn_name(Elf_Ehdr *ehdr)	\
-{							\
-	return r2(&ehdr->e64.e_##fn_name);		\
-}							\
-							\
-static uint16_t ehdr32_##fn_name(Elf_Ehdr *ehdr)	\
-{							\
-	return r2(&ehdr->e32.e_##fn_name);		\
-}							\
-							\
-static uint16_t ehdr_##fn_name(Elf_Ehdr *ehdr)		\
-{							\
-	return e.ehdr_##fn_name(ehdr);			\
-}
-
-EHDR_HALF(shentsize)
-EHDR_HALF(shstrndx)
-EHDR_HALF(shnum)
-
-#define SHDR_WORD(fn_name)				\
-static uint32_t shdr64_##fn_name(Elf_Shdr *shdr)	\
-{							\
-	return r(&shdr->e64.sh_##fn_name);		\
-}							\
-							\
-static uint32_t shdr32_##fn_name(Elf_Shdr *shdr)	\
-{							\
-	return r(&shdr->e32.sh_##fn_name);		\
-}							\
-							\
-static uint32_t shdr_##fn_name(Elf_Shdr *shdr)		\
-{							\
-	return e.shdr_##fn_name(shdr);			\
-}
-
-#define SHDR_ADDR(fn_name)				\
-static uint64_t shdr64_##fn_name(Elf_Shdr *shdr)	\
-{							\
-	return r8(&shdr->e64.sh_##fn_name);		\
-}							\
-							\
-static uint64_t shdr32_##fn_name(Elf_Shdr *shdr)	\
-{							\
-	return r(&shdr->e32.sh_##fn_name);		\
-}							\
-							\
-static uint64_t shdr_##fn_name(Elf_Shdr *shdr)		\
-{							\
-	return e.shdr_##fn_name(shdr);			\
-}
-
-#define SHDR_WORD(fn_name)				\
-static uint32_t shdr64_##fn_name(Elf_Shdr *shdr)	\
-{							\
-	return r(&shdr->e64.sh_##fn_name);		\
-}							\
-							\
-static uint32_t shdr32_##fn_name(Elf_Shdr *shdr)	\
-{							\
-	return r(&shdr->e32.sh_##fn_name);		\
-}							\
-static uint32_t shdr_##fn_name(Elf_Shdr *shdr)		\
-{							\
-	return e.shdr_##fn_name(shdr);			\
-}
-
-SHDR_ADDR(addr)
-SHDR_ADDR(offset)
-SHDR_ADDR(size)
-SHDR_ADDR(entsize)
-
-SHDR_WORD(link)
-SHDR_WORD(name)
-SHDR_WORD(type)
-
-#define SYM_ADDR(fn_name)			\
-static uint64_t sym64_##fn_name(Elf_Sym *sym)	\
-{						\
-	return r8(&sym->e64.st_##fn_name);	\
-}						\
-						\
-static uint64_t sym32_##fn_name(Elf_Sym *sym)	\
-{						\
-	return r(&sym->e32.st_##fn_name);	\
-}						\
-						\
-static uint64_t sym_##fn_name(Elf_Sym *sym)	\
-{						\
-	return e.sym_##fn_name(sym);		\
-}
-
-#define SYM_WORD(fn_name)			\
-static uint32_t sym64_##fn_name(Elf_Sym *sym)	\
-{						\
-	return r(&sym->e64.st_##fn_name);	\
-}						\
-						\
-static uint32_t sym32_##fn_name(Elf_Sym *sym)	\
-{						\
-	return r(&sym->e32.st_##fn_name);	\
-}						\
-						\
-static uint32_t sym_##fn_name(Elf_Sym *sym)	\
-{						\
-	return e.sym_##fn_name(sym);		\
-}
-
-#define SYM_HALF(fn_name)			\
-static uint16_t sym64_##fn_name(Elf_Sym *sym)	\
-{						\
-	return r2(&sym->e64.st_##fn_name);	\
-}						\
-						\
-static uint16_t sym32_##fn_name(Elf_Sym *sym)	\
-{						\
-	return r2(&sym->e32.st_##fn_name);	\
-}						\
-						\
-static uint16_t sym_##fn_name(Elf_Sym *sym)	\
-{						\
-	return e.sym_##fn_name(sym);		\
-}
-
-static uint8_t sym64_type(Elf_Sym *sym)
-{
-	return ELF64_ST_TYPE(sym->e64.st_info);
-}
-
-static uint8_t sym32_type(Elf_Sym *sym)
-{
-	return ELF32_ST_TYPE(sym->e32.st_info);
-}
-
-static uint8_t sym_type(Elf_Sym *sym)
-{
-	return e.sym_type(sym);
-}
-
-SYM_ADDR(value)
-SYM_WORD(name)
-SYM_HALF(shndx)
-
-#define __maybe_unused			__attribute__((__unused__))
-
-#define RELA_ADDR(fn_name)					\
-static uint64_t rela64_##fn_name(Elf_Rela *rela)		\
-{								\
-	return r8((uint64_t *)&rela->e64.r_##fn_name);		\
-}								\
-								\
-static uint64_t rela32_##fn_name(Elf_Rela *rela)		\
-{								\
-	return r((uint32_t *)&rela->e32.r_##fn_name);		\
-}								\
-								\
-static uint64_t __maybe_unused rela_##fn_name(Elf_Rela *rela)	\
-{								\
-	return e.rela_##fn_name(rela);				\
-}
-
-RELA_ADDR(offset)
-RELA_ADDR(info)
-RELA_ADDR(addend)
-
-static void rela64_write_addend(Elf_Rela *rela, uint64_t val)
-{
-	w8(val, (uint64_t *)&rela->e64.r_addend);
-}
-
-static void rela32_write_addend(Elf_Rela *rela, uint64_t val)
-{
-	w(val, (uint32_t *)&rela->e32.r_addend);
-}
-
-/*
- * Get the whole file as a programming convenience in order to avoid
- * malloc+lseek+read+free of many pieces.  If successful, then mmap
- * avoids copying unused pieces; else just read the whole file.
- * Open for both read and write.
- */
-static void *mmap_file(char const *fname, size_t *size)
-{
-	int fd;
-	struct stat sb;
-	void *addr = NULL;
-
-	fd = open(fname, O_RDWR);
-	if (fd < 0) {
-		perror(fname);
-		return NULL;
-	}
-	if (fstat(fd, &sb) < 0) {
-		perror(fname);
-		goto out;
-	}
-	if (!S_ISREG(sb.st_mode)) {
-		fprintf(stderr, "not a regular file: %s\n", fname);
-		goto out;
-	}
-
-	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
-	if (addr == MAP_FAILED) {
-		fprintf(stderr, "Could not mmap file: %s\n", fname);
-		goto out;
-	}
-
-	*size = sb.st_size;
-
-out:
-	close(fd);
-	return addr;
-}
-
-static uint32_t rbe(const uint32_t *x)
-{
-	return get_unaligned_be32(x);
-}
-
-static uint16_t r2be(const uint16_t *x)
-{
-	return get_unaligned_be16(x);
-}
-
-static uint64_t r8be(const uint64_t *x)
-{
-	return get_unaligned_be64(x);
-}
-
-static uint32_t rle(const uint32_t *x)
-{
-	return get_unaligned_le32(x);
-}
-
-static uint16_t r2le(const uint16_t *x)
-{
-	return get_unaligned_le16(x);
-}
-
-static uint64_t r8le(const uint64_t *x)
-{
-	return get_unaligned_le64(x);
-}
-
-static void wbe(uint32_t val, uint32_t *x)
-{
-	put_unaligned_be32(val, x);
-}
-
-static void wle(uint32_t val, uint32_t *x)
-{
-	put_unaligned_le32(val, x);
-}
-
-static void w8be(uint64_t val, uint64_t *x)
-{
-	put_unaligned_be64(val, x);
-}
-
-static void w8le(uint64_t val, uint64_t *x)
-{
-	put_unaligned_le64(val, x);
-}
-
 /*
  * Move reserved section indices SHN_LORESERVE..SHN_HIRESERVE out of
  * the way to -256..-1, to avoid conflicting with real section
@@ -415,13 +85,13 @@ static inline unsigned int get_secindex(unsigned int shndx,
 		return SPECIAL(shndx);
 	if (shndx != SHN_XINDEX)
 		return shndx;
-	return r(&symtab_shndx_start[sym_offs]);
+	return elf_parser.r(&symtab_shndx_start[sym_offs]);
 }
 
 static int compare_extable_32(const void *a, const void *b)
 {
-	Elf32_Addr av = r(a);
-	Elf32_Addr bv = r(b);
+	Elf32_Addr av = elf_parser.r(a);
+	Elf32_Addr bv = elf_parser.r(b);
 
 	if (av < bv)
 		return -1;
@@ -430,18 +100,15 @@ static int compare_extable_32(const void *a, const void *b)
 
 static int compare_extable_64(const void *a, const void *b)
 {
-	Elf64_Addr av = r8(a);
-	Elf64_Addr bv = r8(b);
+	Elf64_Addr av = elf_parser.r8(a);
+	Elf64_Addr bv = elf_parser.r8(b);
 
 	if (av < bv)
 		return -1;
 	return av > bv;
 }
 
-static int compare_extable(const void *a, const void *b)
-{
-	return e.compare_extable(a, b);
-}
+static int (*compare_extable)(const void *a, const void *b);
 
 static inline void *get_index(void *start, int entsize, int index)
 {
@@ -577,7 +244,7 @@ static int (*compare_values)(const void *a, const void *b);
 /* Only used for sorting mcount table */
 static void rela_write_addend(Elf_Rela *rela, uint64_t val)
 {
-	e.rela_write_addend(rela, val);
+	elf_parser.rela_write_addend(rela, val);
 }
 
 struct func_info {
@@ -792,9 +459,9 @@ static int fill_addrs(void *ptr, uint64_t size, void *addrs)
 
 	for (; ptr < end; ptr += long_size, addrs += long_size, count++) {
 		if (long_size == 4)
-			*(uint32_t *)ptr = r(addrs);
+			*(uint32_t *)ptr = elf_parser.r(addrs);
 		else
-			*(uint64_t *)ptr = r8(addrs);
+			*(uint64_t *)ptr = elf_parser.r8(addrs);
 	}
 	return count;
 }
@@ -805,9 +472,9 @@ static void replace_addrs(void *ptr, uint64_t size, void *addrs)
 
 	for (; ptr < end; ptr += long_size, addrs += long_size) {
 		if (long_size == 4)
-			w(*(uint32_t *)ptr, addrs);
+			elf_parser.w(*(uint32_t *)ptr, addrs);
 		else
-			w8(*(uint64_t *)ptr, addrs);
+			elf_parser.w8(*(uint64_t *)ptr, addrs);
 	}
 }
 
@@ -1111,7 +778,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 		sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec);
 
 	/* extable has been sorted, clear the flag */
-	w(0, sort_needed_loc);
+	elf_parser.w(0, sort_needed_loc);
 	rc = 0;
 
 out:
@@ -1155,8 +822,8 @@ static int do_sort(Elf_Ehdr *ehdr,
 
 static int compare_relative_table(const void *a, const void *b)
 {
-	int32_t av = (int32_t)r(a);
-	int32_t bv = (int32_t)r(b);
+	int32_t av = (int32_t)elf_parser.r(a);
+	int32_t bv = (int32_t)elf_parser.r(b);
 
 	if (av < bv)
 		return -1;
@@ -1175,7 +842,7 @@ static void sort_relative_table(char *extab_image, int image_size)
 	 */
 	while (i < image_size) {
 		uint32_t *loc = (uint32_t *)(extab_image + i);
-		w(r(loc) + i, loc);
+		elf_parser.w(elf_parser.r(loc) + i, loc);
 		i += 4;
 	}
 
@@ -1185,7 +852,7 @@ static void sort_relative_table(char *extab_image, int image_size)
 	i = 0;
 	while (i < image_size) {
 		uint32_t *loc = (uint32_t *)(extab_image + i);
-		w(r(loc) - i, loc);
+		elf_parser.w(elf_parser.r(loc) - i, loc);
 		i += 4;
 	}
 }
@@ -1197,8 +864,8 @@ static void sort_relative_table_with_data(char *extab_image, int image_size)
 	while (i < image_size) {
 		uint32_t *loc = (uint32_t *)(extab_image + i);
 
-		w(r(loc) + i, loc);
-		w(r(loc + 1) + i + 4, loc + 1);
+		elf_parser.w(elf_parser.r(loc) + i, loc);
+		elf_parser.w(elf_parser.r(loc + 1) + i + 4, loc + 1);
 		/* Don't touch the fixup type or data */
 
 		i += sizeof(uint32_t) * 3;
@@ -1210,8 +877,8 @@ static void sort_relative_table_with_data(char *extab_image, int image_size)
 	while (i < image_size) {
 		uint32_t *loc = (uint32_t *)(extab_image + i);
 
-		w(r(loc) - i, loc);
-		w(r(loc + 1) - (i + 4), loc + 1);
+		elf_parser.w(elf_parser.r(loc) - i, loc);
+		elf_parser.w(elf_parser.r(loc + 1) - (i + 4), loc + 1);
 		/* Don't touch the fixup type or data */
 
 		i += sizeof(uint32_t) * 3;
@@ -1223,35 +890,7 @@ static int do_file(char const *const fname, void *addr)
 	Elf_Ehdr *ehdr = addr;
 	table_sort_t custom_sort = NULL;
 
-	switch (ehdr->e32.e_ident[EI_DATA]) {
-	case ELFDATA2LSB:
-		r	= rle;
-		r2	= r2le;
-		r8	= r8le;
-		w	= wle;
-		w8	= w8le;
-		break;
-	case ELFDATA2MSB:
-		r	= rbe;
-		r2	= r2be;
-		r8	= r8be;
-		w	= wbe;
-		w8	= w8be;
-		break;
-	default:
-		fprintf(stderr, "unrecognized ELF data encoding %d: %s\n",
-			ehdr->e32.e_ident[EI_DATA], fname);
-		return -1;
-	}
-
-	if (memcmp(ELFMAG, ehdr->e32.e_ident, SELFMAG) != 0 ||
-	    (r2(&ehdr->e32.e_type) != ET_EXEC && r2(&ehdr->e32.e_type) != ET_DYN) ||
-	    ehdr->e32.e_ident[EI_VERSION] != EV_CURRENT) {
-		fprintf(stderr, "unrecognized ET_EXEC/ET_DYN file %s\n", fname);
-		return -1;
-	}
-
-	switch (r2(&ehdr->e32.e_machine)) {
+	switch (elf_map_machine(ehdr)) {
 	case EM_AARCH64:
 #ifdef MCOUNT_SORT_ENABLED
 		sort_reloc = true;
@@ -1281,85 +920,37 @@ static int do_file(char const *const fname, void *addr)
 		break;
 	default:
 		fprintf(stderr, "unrecognized e_machine %d %s\n",
-			r2(&ehdr->e32.e_machine), fname);
+			elf_parser.r2(&ehdr->e32.e_machine), fname);
 		return -1;
 	}
 
-	switch (ehdr->e32.e_ident[EI_CLASS]) {
-	case ELFCLASS32: {
-		struct elf_funcs efuncs = {
-			.compare_extable	= compare_extable_32,
-			.ehdr_shoff		= ehdr32_shoff,
-			.ehdr_shentsize		= ehdr32_shentsize,
-			.ehdr_shstrndx		= ehdr32_shstrndx,
-			.ehdr_shnum		= ehdr32_shnum,
-			.shdr_addr		= shdr32_addr,
-			.shdr_offset		= shdr32_offset,
-			.shdr_link		= shdr32_link,
-			.shdr_size		= shdr32_size,
-			.shdr_name		= shdr32_name,
-			.shdr_type		= shdr32_type,
-			.shdr_entsize		= shdr32_entsize,
-			.sym_type		= sym32_type,
-			.sym_name		= sym32_name,
-			.sym_value		= sym32_value,
-			.sym_shndx		= sym32_shndx,
-			.rela_offset		= rela32_offset,
-			.rela_info		= rela32_info,
-			.rela_addend		= rela32_addend,
-			.rela_write_addend	= rela32_write_addend,
-		};
-
-		e = efuncs;
+	switch (elf_map_long_size(addr)) {
+	case 4:
+		compare_extable	= compare_extable_32,
 		long_size		= 4;
 		extable_ent_size	= 8;
 
-		if (r2(&ehdr->e32.e_ehsize) != sizeof(Elf32_Ehdr) ||
-		    r2(&ehdr->e32.e_shentsize) != sizeof(Elf32_Shdr)) {
+		if (elf_parser.r2(&ehdr->e32.e_ehsize) != sizeof(Elf32_Ehdr) ||
+		    elf_parser.r2(&ehdr->e32.e_shentsize) != sizeof(Elf32_Shdr)) {
 			fprintf(stderr,
 				"unrecognized ET_EXEC/ET_DYN file: %s\n", fname);
 			return -1;
 		}
 
-		}
 		break;
-	case ELFCLASS64: {
-		struct elf_funcs efuncs = {
-			.compare_extable	= compare_extable_64,
-			.ehdr_shoff		= ehdr64_shoff,
-			.ehdr_shentsize		= ehdr64_shentsize,
-			.ehdr_shstrndx		= ehdr64_shstrndx,
-			.ehdr_shnum		= ehdr64_shnum,
-			.shdr_addr		= shdr64_addr,
-			.shdr_offset		= shdr64_offset,
-			.shdr_link		= shdr64_link,
-			.shdr_size		= shdr64_size,
-			.shdr_name		= shdr64_name,
-			.shdr_type		= shdr64_type,
-			.shdr_entsize		= shdr64_entsize,
-			.sym_type		= sym64_type,
-			.sym_name		= sym64_name,
-			.sym_value		= sym64_value,
-			.sym_shndx		= sym64_shndx,
-			.rela_offset		= rela64_offset,
-			.rela_info		= rela64_info,
-			.rela_addend		= rela64_addend,
-			.rela_write_addend	= rela64_write_addend,
-		};
-
-		e = efuncs;
+	case 8:
+		compare_extable	= compare_extable_64,
 		long_size		= 8;
 		extable_ent_size	= 16;
 
-		if (r2(&ehdr->e64.e_ehsize) != sizeof(Elf64_Ehdr) ||
-		    r2(&ehdr->e64.e_shentsize) != sizeof(Elf64_Shdr)) {
+		if (elf_parser.r2(&ehdr->e64.e_ehsize) != sizeof(Elf64_Ehdr) ||
+		    elf_parser.r2(&ehdr->e64.e_shentsize) != sizeof(Elf64_Shdr)) {
 			fprintf(stderr,
 				"unrecognized ET_EXEC/ET_DYN file: %s\n",
 				fname);
 			return -1;
 		}
 
-		}
 		break;
 	default:
 		fprintf(stderr, "unrecognized ELF class %d %s\n",
@@ -1398,7 +989,7 @@ int main(int argc, char *argv[])
 
 	/* Process each file in turn, allowing deep failure. */
 	for (i = optind; i < argc; i++) {
-		addr = mmap_file(argv[i], &size);
+		addr = elf_map(argv[i], &size, (1 << ET_EXEC) | (1 << ET_DYN));
 		if (!addr) {
 			++n_error;
 			continue;
@@ -1407,7 +998,7 @@ int main(int argc, char *argv[])
 		if (do_file(argv[i], addr))
 			++n_error;
 
-		munmap(addr, size);
+		elf_unmap(addr, size);
 	}
 
 	return !!n_error;
-- 
2.47.2



