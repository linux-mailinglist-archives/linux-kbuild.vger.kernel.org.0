Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5997E29AC
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Nov 2023 17:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbjKFQ0Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Nov 2023 11:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbjKFQ0Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Nov 2023 11:26:24 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E07D67;
        Mon,  6 Nov 2023 08:26:17 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id B582F21FB1;
        Mon,  6 Nov 2023 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1699287975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N6VLE/j2vG/GIXhj+ozQR+9G27+69dDXC9dCuLrwz6w=;
        b=n2wkX6WTNlwho33ws8juRU4n3FsvIRIsQbGi3X/RVua0jNpKPjbyWovgtleBDqwrg0/Wa/
        UuVldikHR0MK0ZFDP7/8mlwNcN/J5RvuYL9jnIANdaJFLC7nuE1LrQLWkdPcQkzpvmRcej
        wvNuJVHYTkhY1mTzYnKrGDXBqyP9t7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1699287975;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N6VLE/j2vG/GIXhj+ozQR+9G27+69dDXC9dCuLrwz6w=;
        b=oYbEjqSj8aE5LhnYiHAagGyowlT8ujvkB4/wmFez9WEZ30/go3ouCL1jAsix/XltTzsv54
        TnhXeLO5T3OMtaDA==
Received: from localhost.cz (lhruska.udp.ovpn2.prg.suse.de [10.100.204.118])
        by relay2.suse.de (Postfix) with ESMTP id 4733B2CBA8;
        Mon,  6 Nov 2023 16:26:15 +0000 (UTC)
From:   Lukas Hruska <lhruska@suse.cz>
To:     Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>,
        Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Marcos Paulo de Souza <mpdesouza@suse.com>,
        Lukas Hruska <lhruska@suse.cz>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH v1 2/5] livepatch: Add klp-convert tool
Date:   Mon,  6 Nov 2023 17:25:10 +0100
Message-ID: <20231106162513.17556-3-lhruska@suse.cz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106162513.17556-1-lhruska@suse.cz>
References: <20231106162513.17556-1-lhruska@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Livepatches need to access external symbols which can't be handled
by the normal relocation mechanism. It is needed for two types
of symbols:

  + Symbols which can be local for the original livepatched function.
    The alternative implementation in the livepatch sees them
    as external symbols.

  + Symbols in modules which are exported via EXPORT_SYMBOL*(). They
    must be handled special way otherwise the livepatch module would
    depend on the livepatched one. Loading such livepatch would cause
    loading the other module as well.

The address of these symbols can be found via kallsyms. Or they can 
be relocated using livepatch specific relocation sections as specified
in Documentation/livepatch/module-elf-format.txt.

Currently, there is no trivial way to embed the required information as
requested in the final livepatch elf object. klp-convert solves this
problem by using annotations in the elf object to convert the relocation
accordingly to the specification, enabling it to be handled by the
livepatch loader.

Given the above, create scripts/livepatch to hold tools developed for
livepatches and add source files for klp-convert there.

Allow to annotate such external symbols in the livepatch by a macro
KLP_RELOC_SYMBOL(). It will create symbol with all needed
metadata. For example:

  extern char *saved_command_line \
                 KLP_RELOC_SYMBOL(vmlinux, vmlinux, saved_command_line, 0);

would create symbol

$>readelf -r -W <compiled livepatch module>:
Relocation section '.rela.text' at offset 0x32e60 contains 10 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
[...]
0000000000000068  0000003c00000002 R_X86_64_PC32          0000000000000000 .klp.sym.rela.vmlinux.vmlinux.saved_command_line,0 - 4
[...]


Also add scripts/livepatch/klp-convert. The tool transforms symbols
created by KLP_RELOC_SYMBOL() to object specific rela sections
and rela entries which would later be proceed when the livepatch
or the livepatched object is loaded.

For example, klp-convert would replace the above symbols with:

$> readelf -r -W <livepatch_module_proceed_by_klp_convert>
Relocation section '.klp.rela.vmlinux.text' at offset 0x5cb60 contains 1 entry:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000068  0000003c00000002 R_X86_64_PC32          0000000000000000 .klp.sym.vmlinux.saved_command_line,0 - 4

klp-convert relies on libelf and on a list implementation. Add files
scripts/livepatch/elf.c and scripts/livepatch/elf.h, which are a libelf
interfacing layer and scripts/livepatch/list.h, which is a list
implementation.

Update Makefiles to correctly support the compilation of the new tool,
update MAINTAINERS file and add a .gitignore file.

[jpoimboe@redhat.com: initial version]
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
[joe.lawrence@redhat.com: clean-up and fixes]
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
[lhruska@suse.cz: klp-convert code, minimal approach]
Signed-off-by: Lukas Hruska <lhruska@suse.cz>
---
 MAINTAINERS                     |   1 +
 include/linux/livepatch.h       |  19 +
 scripts/Makefile                |   1 +
 scripts/livepatch/.gitignore    |   1 +
 scripts/livepatch/Makefile      |   5 +
 scripts/livepatch/elf.c         | 817 ++++++++++++++++++++++++++++++++
 scripts/livepatch/elf.h         |  73 +++
 scripts/livepatch/klp-convert.c | 283 +++++++++++
 scripts/livepatch/klp-convert.h |  42 ++
 scripts/livepatch/list.h        | 391 +++++++++++++++
 10 files changed, 1633 insertions(+)
 create mode 100644 scripts/livepatch/.gitignore
 create mode 100644 scripts/livepatch/Makefile
 create mode 100644 scripts/livepatch/elf.c
 create mode 100644 scripts/livepatch/elf.h
 create mode 100644 scripts/livepatch/klp-convert.c
 create mode 100644 scripts/livepatch/klp-convert.h
 create mode 100644 scripts/livepatch/list.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 11a2d84c1277..ba7b284ede95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12135,6 +12135,7 @@ F:	kernel/livepatch/
 F:	kernel/module/livepatch.c
 F:	lib/livepatch/
 F:	samples/livepatch/
+F:	scripts/livepatch/
 F:	tools/testing/selftests/livepatch/
 
 LLC (802.2)
diff --git a/include/linux/livepatch.h b/include/linux/livepatch.h
index 9b9b38e89563..83bbcd1c43fd 100644
--- a/include/linux/livepatch.h
+++ b/include/linux/livepatch.h
@@ -235,6 +235,25 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
 			     unsigned int symindex, unsigned int secindex,
 			     const char *objname);
 
+/**
+ * KLP_RELOC_SYMBOL_POS - define relocation for external symbols
+ *
+ * @LP_OBJ_NAME: name of the livepatched object where the symbol is needed
+ * @SYM_OBJ_NAME: name of the object where the symbol exists
+ * @SYM_NAME: symbol name
+ * @SYM_POS: position of the symbol in SYM_OBJ when there are more
+ *       symbols of the same name.
+ *
+ * Use for annotating external symbols used in livepatches which are
+ * not exported in vmlinux or are in livepatched modules, see
+ * Documentation/livepatch/module-elf-format.rst
+ */
+#define KLP_RELOC_SYMBOL_POS(LP_OBJ_NAME, SYM_OBJ_NAME, SYM_NAME, SYM_POS)	\
+	asm("\".klp.sym.rela." #LP_OBJ_NAME "." #SYM_OBJ_NAME "." #SYM_NAME "," #SYM_POS "\"")
+
+#define KLP_RELOC_SYMBOL(LP_OBJ_NAME, SYM_OBJ_NAME, SYM_NAME)	\
+	KLP_RELOC_SYMBOL_POS(LP_OBJ_NAME, SYM_OBJ_NAME, SYM_NAME, 0)
+
 #else /* !CONFIG_LIVEPATCH */
 
 static inline int klp_module_coming(struct module *mod) { return 0; }
diff --git a/scripts/Makefile b/scripts/Makefile
index 32b6ba722728..8f2c2a0221fe 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -46,6 +46,7 @@ targets += module.lds
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
+subdir-$(CONFIG_LIVEPATCH)   += livepatch
 
 # Let clean descend into subdirs
 subdir-	+= basic dtc gdb kconfig mod
diff --git a/scripts/livepatch/.gitignore b/scripts/livepatch/.gitignore
new file mode 100644
index 000000000000..dc22fe4b6a5b
--- /dev/null
+++ b/scripts/livepatch/.gitignore
@@ -0,0 +1 @@
+klp-convert
diff --git a/scripts/livepatch/Makefile b/scripts/livepatch/Makefile
new file mode 100644
index 000000000000..71dce0f3e893
--- /dev/null
+++ b/scripts/livepatch/Makefile
@@ -0,0 +1,5 @@
+hostprogs-always-y		:= klp-convert
+
+klp-convert-objs		:= klp-convert.o elf.o
+
+HOSTLDLIBS_klp-convert		:= -lelf
diff --git a/scripts/livepatch/elf.c b/scripts/livepatch/elf.c
new file mode 100644
index 000000000000..c649268a4a55
--- /dev/null
+++ b/scripts/livepatch/elf.c
@@ -0,0 +1,817 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * elf.c - ELF access library
+ *
+ * Adapted from kpatch (https://github.com/dynup/kpatch):
+ * Copyright (C) 2013-2016 Josh Poimboeuf <jpoimboe@redhat.com>
+ * Copyright (C) 2014 Seth Jennings <sjenning@redhat.com>
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "elf.h"
+
+#define WARN(format, ...) \
+	fprintf(stderr, "%s: " format "\n", elf->name, ##__VA_ARGS__)
+
+/*
+ * Fallback for systems without this "read, mmaping if possible" cmd.
+ */
+#ifndef ELF_C_READ_MMAP
+#define ELF_C_READ_MMAP ELF_C_READ
+#endif
+
+bool is_rela_section(struct section *sec)
+{
+	return (sec->sh.sh_type == SHT_RELA);
+}
+
+struct section *find_section_by_name(struct elf *elf, const char *name)
+{
+	struct section *sec;
+
+	list_for_each_entry(sec, &elf->sections, list)
+		if (!strcmp(sec->name, name))
+			return sec;
+
+	return NULL;
+}
+
+static struct section *find_section_by_index(struct elf *elf,
+					     int idx)
+{
+	struct section *sec;
+
+	list_for_each_entry(sec, &elf->sections, list)
+		if (sec->idx == idx)
+			return sec;
+
+	return NULL;
+}
+
+static struct symbol *find_symbol_by_index(struct elf *elf, unsigned int idx)
+{
+	struct symbol *sym;
+
+	list_for_each_entry(sym, &elf->symbols, list)
+		if (sym->idx == idx)
+			return sym;
+
+	return NULL;
+}
+
+static int read_sections(struct elf *elf)
+{
+	Elf_Scn *s = NULL;
+	struct section *sec;
+	size_t shstrndx, sections_nr;
+	size_t i;
+
+	if (elf_getshdrnum(elf->elf, &sections_nr)) {
+		perror("elf_getshdrnum");
+		return -1;
+	}
+
+	if (elf_getshdrstrndx(elf->elf, &shstrndx)) {
+		perror("elf_getshdrstrndx");
+		return -1;
+	}
+
+	for (i = 0; i < sections_nr; i++) {
+		sec = calloc(1, sizeof(*sec));
+		if (!sec) {
+			perror("calloc");
+			return -1;
+		}
+
+		INIT_LIST_HEAD(&sec->relas);
+
+		list_add_tail(&sec->list, &elf->sections);
+
+		s = elf_getscn(elf->elf, i);
+		if (!s) {
+			perror("elf_getscn");
+			return -1;
+		}
+
+		sec->idx = elf_ndxscn(s);
+
+		if (!gelf_getshdr(s, &sec->sh)) {
+			perror("gelf_getshdr");
+			return -1;
+		}
+
+		sec->name = elf_strptr(elf->elf, shstrndx, sec->sh.sh_name);
+		if (!sec->name) {
+			perror("elf_strptr");
+			return -1;
+		}
+
+		sec->elf_data = elf_getdata(s, NULL);
+		if (!sec->elf_data) {
+			perror("elf_getdata");
+			return -1;
+		}
+
+		if (sec->elf_data->d_off != 0 ||
+		    sec->elf_data->d_size != sec->sh.sh_size) {
+			WARN("unexpected data attributes for %s", sec->name);
+			return -1;
+		}
+
+		sec->data = sec->elf_data->d_buf;
+		sec->size = sec->elf_data->d_size;
+	}
+
+	/* sanity check, one more call to elf_nextscn() should return NULL */
+	if (elf_nextscn(elf->elf, s)) {
+		WARN("section entry mismatch");
+		return -1;
+	}
+
+	return 0;
+}
+
+static int read_symbols(struct elf *elf)
+{
+	struct section *symtab;
+	struct symbol *sym;
+	int symbols_nr, i;
+
+	symtab = find_section_by_name(elf, ".symtab");
+	if (!symtab) {
+		WARN("missing symbol table");
+		return -1;
+	}
+
+	symbols_nr = symtab->sh.sh_size / symtab->sh.sh_entsize;
+
+	for (i = 0; i < symbols_nr; i++) {
+		sym = calloc(1, sizeof(*sym));
+		if (!sym) {
+			perror("calloc");
+			return -1;
+		}
+
+		sym->idx = i;
+
+		if (!gelf_getsym(symtab->elf_data, i, &sym->sym)) {
+			perror("gelf_getsym");
+			goto err;
+		}
+
+		sym->name = elf_strptr(elf->elf, symtab->sh.sh_link,
+				       sym->sym.st_name);
+		if (!sym->name) {
+			perror("elf_strptr");
+			goto err;
+		}
+
+		sym->type = GELF_ST_TYPE(sym->sym.st_info);
+		sym->bind = GELF_ST_BIND(sym->sym.st_info);
+
+		if (sym->sym.st_shndx > SHN_UNDEF &&
+		    sym->sym.st_shndx < SHN_LORESERVE) {
+			sym->sec = find_section_by_index(elf,
+							 sym->sym.st_shndx);
+			if (!sym->sec) {
+				WARN("couldn't find section for symbol %s",
+				     sym->name);
+				goto err;
+			}
+			if (sym->type == STT_SECTION) {
+				sym->name = sym->sec->name;
+				sym->sec->sym = sym;
+			}
+		}
+
+		sym->offset = sym->sym.st_value;
+		sym->size = sym->sym.st_size;
+
+		list_add_tail(&sym->list, &elf->symbols);
+	}
+
+	return 0;
+
+err:
+	free(sym);
+	return -1;
+}
+
+static int read_relas(struct elf *elf)
+{
+	struct section *sec;
+	struct rela *rela;
+	int relas_nr, i;
+	unsigned int symndx;
+
+	list_for_each_entry(sec, &elf->sections, list) {
+		if (sec->sh.sh_type != SHT_RELA)
+			continue;
+
+		sec->base = find_section_by_name(elf, sec->name + 5);
+		if (!sec->base) {
+			WARN("can't find base section for rela section %s",
+			     sec->name);
+			return -1;
+		}
+
+		sec->base->rela = sec;
+
+		relas_nr = sec->sh.sh_size / sec->sh.sh_entsize;
+		for (i = 0; i < relas_nr; i++) {
+			rela = calloc(1, sizeof(*rela));
+			if (!rela) {
+				perror("calloc");
+				return -1;
+			}
+
+			if (!gelf_getrela(sec->elf_data, i, &rela->rela)) {
+				perror("gelf_getrela");
+				return -1;
+			}
+
+			rela->type = GELF_R_TYPE(rela->rela.r_info);
+			rela->addend = rela->rela.r_addend;
+			rela->offset = rela->rela.r_offset;
+			symndx = GELF_R_SYM(rela->rela.r_info);
+			rela->sym = find_symbol_by_index(elf, symndx);
+			if (!rela->sym) {
+				WARN("can't find rela entry symbol %u for %s",
+				     symndx, sec->name);
+				return -1;
+			}
+
+			list_add_tail(&rela->list, &sec->relas);
+		}
+	}
+
+	return 0;
+}
+
+struct section *create_rela_section(struct elf *elf, const char *name,
+				    struct section *base)
+{
+	struct section *sec;
+
+	sec = calloc(1, sizeof(*sec));
+	if (!sec) {
+		WARN("calloc failed");
+		return NULL;
+	}
+	INIT_LIST_HEAD(&sec->relas);
+
+	sec->base = base;
+	sec->name = strdup(name);
+	if (!sec->name) {
+		WARN("strdup failed");
+		return NULL;
+	}
+	sec->sh.sh_name = ~0;
+	sec->sh.sh_type = SHT_RELA;
+
+	if (elf->elf_class == ELFCLASS32) {
+		sec->sh.sh_entsize = sizeof(Elf32_Rela);
+		sec->sh.sh_addralign = 4;
+	} else {
+		sec->sh.sh_entsize = sizeof(Elf64_Rela);
+		sec->sh.sh_addralign = 8;
+	}
+	sec->sh.sh_flags = SHF_ALLOC;
+
+	sec->elf_data = calloc(1, sizeof(*sec->elf_data));
+	if (!sec->elf_data) {
+		WARN("calloc failed");
+		return NULL;
+	}
+	sec->elf_data->d_type = ELF_T_RELA;
+
+	list_add_tail(&sec->list, &elf->sections);
+
+	return sec;
+}
+
+static int update_shstrtab(struct elf *elf)
+{
+	struct section *shstrtab, *sec;
+	size_t orig_size, new_size = 0, offset, len;
+	char *buf;
+
+	shstrtab = find_section_by_name(elf, ".shstrtab");
+	if (!shstrtab) {
+		WARN("can't find .shstrtab");
+		return -1;
+	}
+
+	orig_size = new_size = shstrtab->size;
+
+	list_for_each_entry(sec, &elf->sections, list) {
+		if (sec->sh.sh_name != ~0U)
+			continue;
+		new_size += strlen(sec->name) + 1;
+	}
+
+	if (new_size == orig_size)
+		return 0;
+
+	buf = malloc(new_size);
+	if (!buf) {
+		WARN("malloc failed");
+		return -1;
+	}
+	memcpy(buf, (void *)shstrtab->data, orig_size);
+
+	offset = orig_size;
+	list_for_each_entry(sec, &elf->sections, list) {
+		if (sec->sh.sh_name != ~0U)
+			continue;
+		sec->sh.sh_name = offset;
+		len = strlen(sec->name) + 1;
+		memcpy(buf + offset, sec->name, len);
+		offset += len;
+	}
+
+	shstrtab->elf_data->d_buf = shstrtab->data = buf;
+	shstrtab->elf_data->d_size = shstrtab->size = new_size;
+	shstrtab->sh.sh_size = new_size;
+
+	return 1;
+}
+
+static void free_shstrtab(struct elf *elf)
+{
+	struct section *shstrtab;
+
+	shstrtab = find_section_by_name(elf, ".shstrtab");
+	if (!shstrtab)
+		return;
+
+	free(shstrtab->elf_data->d_buf);
+}
+
+static int update_strtab(struct elf *elf)
+{
+	struct section *strtab;
+	struct symbol *sym;
+	size_t orig_size, new_size = 0, offset, len;
+	char *buf;
+
+	strtab = find_section_by_name(elf, ".strtab");
+	if (!strtab) {
+		WARN("can't find .strtab");
+		return -1;
+	}
+
+	orig_size = new_size = strtab->size;
+
+	list_for_each_entry(sym, &elf->symbols, list) {
+		if (sym->sym.st_name != ~0U)
+			continue;
+		new_size += strlen(sym->name) + 1;
+	}
+
+	if (new_size == orig_size)
+		return 0;
+
+	buf = malloc(new_size);
+	if (!buf) {
+		WARN("malloc failed");
+		return -1;
+	}
+	memcpy(buf, (void *)strtab->data, orig_size);
+
+	offset = orig_size;
+	list_for_each_entry(sym, &elf->symbols, list) {
+		if (sym->sym.st_name != ~0U)
+			continue;
+		sym->sym.st_name = offset;
+		len = strlen(sym->name) + 1;
+		memcpy(buf + offset, sym->name, len);
+		offset += len;
+	}
+
+	strtab->elf_data->d_buf = strtab->data = buf;
+	strtab->elf_data->d_size = strtab->size = new_size;
+	strtab->sh.sh_size = new_size;
+
+	return 1;
+}
+
+static void free_strtab(struct elf *elf)
+{
+	struct section *strtab;
+
+	strtab = find_section_by_name(elf, ".strtab");
+	if (!strtab)
+		return;
+
+	if (strtab->elf_data)
+		free(strtab->elf_data->d_buf);
+}
+
+static int update_symtab(struct elf *elf)
+{
+	struct section *symtab, *sec;
+	struct symbol *sym;
+	char *buf;
+	size_t size;
+	int offset = 0, nr_locals = 0, idx, nr_syms;
+
+	idx = 0;
+	list_for_each_entry(sec, &elf->sections, list)
+		sec->idx = idx++;
+
+	idx = 0;
+	list_for_each_entry(sym, &elf->symbols, list) {
+		sym->idx = idx++;
+		if (sym->sec)
+			sym->sym.st_shndx = sym->sec->idx;
+	}
+	nr_syms = idx;
+
+	symtab = find_section_by_name(elf, ".symtab");
+	if (!symtab) {
+		WARN("can't find symtab");
+		return -1;
+	}
+
+	symtab->sh.sh_link = find_section_by_name(elf, ".strtab")->idx;
+
+	/* create new symtab buffer */
+	if (elf->elf_class == ELFCLASS32)
+		size = nr_syms * sizeof(Elf32_Sym);
+	else
+		size = nr_syms * sizeof(Elf64_Sym);
+	buf = calloc(1, size);
+	if (!buf) {
+		WARN("calloc failed");
+		return -1;
+	}
+
+	offset = 0;
+	list_for_each_entry(sym, &elf->symbols, list) {
+
+		if (elf->elf_class == ELFCLASS32) {
+			/* Manually convert to 32-bit Elf32_Sym */
+			Elf32_Sym sym32;
+
+			sym32.st_name  = sym->sym.st_name;
+			sym32.st_info  = sym->sym.st_info;
+			sym32.st_other = sym->sym.st_other;
+			sym32.st_shndx = sym->sym.st_shndx;
+			sym32.st_value = sym->sym.st_value;
+			sym32.st_size  = sym->sym.st_size;
+			memcpy(buf + offset, &sym32, sizeof(Elf32_Sym));
+		} else {
+			/* Existing 64-bit GElf_Syms are fine */
+			memcpy(buf + offset, &sym->sym, sizeof(Elf64_Sym));
+		}
+
+		offset += symtab->sh.sh_entsize;
+
+		if (sym->bind == STB_LOCAL)
+			nr_locals++;
+	}
+
+	symtab->elf_data->d_buf = symtab->data = buf;
+	symtab->elf_data->d_size = symtab->size = size;
+	symtab->sh.sh_size = size;
+
+	/* update symtab section header */
+	symtab->sh.sh_info = nr_locals;
+
+	return 1;
+}
+
+static void free_symtab(struct elf *elf)
+{
+	struct section *symtab;
+
+	symtab = find_section_by_name(elf, ".symtab");
+	if (!symtab)
+		return;
+
+	free(symtab->elf_data->d_buf);
+}
+
+static int update_relas(struct elf *elf)
+{
+	struct section *sec, *symtab;
+	struct rela *rela;
+	int nr_relas, idx, size;
+	void *relas;
+
+	symtab = find_section_by_name(elf, ".symtab");
+
+	list_for_each_entry(sec, &elf->sections, list) {
+		if (!is_rela_section(sec))
+			continue;
+
+		sec->sh.sh_link = symtab->idx;
+		if (sec->base)
+			sec->sh.sh_info = sec->base->idx;
+
+		nr_relas = 0;
+		list_for_each_entry(rela, &sec->relas, list)
+			nr_relas++;
+
+		if (elf->elf_class == ELFCLASS32)
+			size = nr_relas * sizeof(Elf32_Rela);
+		else
+			size = nr_relas * sizeof(Elf64_Rela);
+
+		relas = malloc(size);
+		if (!relas) {
+			WARN("malloc failed");
+			return -1;
+		}
+
+		sec->elf_data->d_buf = sec->data = relas;
+		sec->elf_data->d_size = sec->size = size;
+		sec->sh.sh_size = size;
+
+		idx = 0;
+		list_for_each_entry(rela, &sec->relas, list) {
+			if (elf->elf_class == ELFCLASS32) {
+				Elf32_Rela *relas32 = relas;
+
+				relas32[idx].r_offset = rela->offset;
+				relas32[idx].r_addend = rela->addend;
+				relas32[idx].r_info = ELF32_R_INFO(rela->sym->idx,
+								   rela->type);
+			} else {
+				Elf64_Rela *relas64 = relas;
+
+				relas64[idx].r_offset = rela->offset;
+				relas64[idx].r_addend = rela->addend;
+				relas64[idx].r_info = ELF64_R_INFO(rela->sym->idx,
+								   rela->type);
+			}
+			idx++;
+		}
+	}
+
+	return 1;
+}
+
+static void update_groups(struct elf *elf)
+{
+	struct section *sec, *symtab;
+
+	symtab = find_section_by_name(elf, ".symtab");
+
+	list_for_each_entry(sec, &elf->sections, list) {
+		if (sec->sh.sh_type == SHT_GROUP)
+			sec->sh.sh_link = symtab->idx;
+	}
+}
+
+static void free_relas(struct elf *elf)
+{
+	struct section *sec, *symtab;
+
+	symtab = find_section_by_name(elf, ".symtab");
+	if (!symtab)
+		return;
+
+	list_for_each_entry(sec, &elf->sections, list) {
+		if (!is_rela_section(sec))
+			continue;
+
+		free(sec->elf_data->d_buf);
+	}
+}
+
+static int write_file(struct elf *elf, const char *file)
+{
+	int fd;
+	Elf *e;
+	GElf_Ehdr eh, ehout;
+	Elf_Scn *scn;
+	Elf_Data *data;
+	GElf_Shdr sh;
+	struct section *sec;
+
+	fd = creat(file, 0664);
+	if (fd == -1) {
+		WARN("couldn't create %s", file);
+		return -1;
+	}
+
+	e = elf_begin(fd, ELF_C_WRITE, NULL);
+	if (!e) {
+		WARN("elf_begin failed");
+		return -1;
+	}
+
+	if (!gelf_newehdr(e, gelf_getclass(elf->elf))) {
+		WARN("gelf_newehdr failed");
+		return -1;
+	}
+
+	if (!gelf_getehdr(e, &ehout)) {
+		WARN("gelf_getehdr failed");
+		return -1;
+	}
+
+	if (!gelf_getehdr(elf->elf, &eh)) {
+		WARN("gelf_getehdr failed");
+		return -1;
+	}
+
+	memset(&ehout, 0, sizeof(ehout));
+	ehout.e_ident[EI_DATA] = eh.e_ident[EI_DATA];
+	ehout.e_machine = eh.e_machine;
+	ehout.e_flags = eh.e_flags;
+	ehout.e_type = eh.e_type;
+	ehout.e_version = EV_CURRENT;
+	ehout.e_shstrndx = find_section_by_name(elf, ".shstrtab")->idx;
+
+	list_for_each_entry(sec, &elf->sections, list) {
+		if (!sec->idx)
+			continue;
+		scn = elf_newscn(e);
+		if (!scn) {
+			WARN("elf_newscn failed");
+			return -1;
+		}
+
+		data = elf_newdata(scn);
+		if (!data) {
+			WARN("elf_newdata failed");
+			return -1;
+		}
+
+		if (!elf_flagdata(data, ELF_C_SET, ELF_F_DIRTY)) {
+			WARN("elf_flagdata failed");
+			return -1;
+		}
+
+		data->d_type = sec->elf_data->d_type;
+		data->d_buf = sec->elf_data->d_buf;
+		data->d_size = sec->elf_data->d_size;
+
+		if (!gelf_getshdr(scn, &sh)) {
+			WARN("gelf_getshdr failed");
+			return -1;
+		}
+
+		sh = sec->sh;
+
+		if (!gelf_update_shdr(scn, &sh)) {
+			WARN("gelf_update_shdr failed");
+			return -1;
+		}
+	}
+
+	if (!gelf_update_ehdr(e, &ehout)) {
+		WARN("gelf_update_ehdr failed");
+		return -1;
+	}
+
+	if (elf_update(e, ELF_C_WRITE) < 0) {
+		fprintf(stderr, "%s\n", elf_errmsg(-1));
+		WARN("elf_update failed");
+		return -1;
+	}
+
+	elf_end(e);
+
+	return 0;
+}
+
+int elf_write_file(struct elf *elf, const char *file)
+{
+	int ret_shstrtab = 0;
+	int ret_strtab = 0;
+	int ret_symtab = 0;
+	int ret_relas = 0;
+	int ret;
+
+	ret_shstrtab = update_shstrtab(elf);
+	if (ret_shstrtab < 0) {
+		ret = ret_shstrtab;
+		goto out;
+	}
+
+	ret_strtab = update_strtab(elf);
+	if (ret_strtab < 0) {
+		ret = ret_strtab;
+		goto out;
+	}
+
+	ret_symtab = update_symtab(elf);
+	if (ret_symtab < 0) {
+		ret = ret_symtab;
+		goto out;
+	}
+
+	ret_relas = update_relas(elf);
+	if (ret_relas < 0) {
+		ret = ret_relas;
+		goto out;
+	}
+
+	update_groups(elf);
+
+	ret = write_file(elf, file);
+	if (ret)
+		return ret;
+
+out:
+	if (ret_relas > 0)
+		free_relas(elf);
+	if (ret_symtab > 0)
+		free_symtab(elf);
+	if (ret_strtab > 0)
+		free_strtab(elf);
+	if (ret_shstrtab > 0)
+		free_shstrtab(elf);
+
+	return ret;
+}
+
+struct elf *elf_open(const char *name)
+{
+	struct elf *elf;
+
+	elf_version(EV_CURRENT);
+
+	elf = calloc(1, sizeof(*elf));
+	if (!elf) {
+		perror("calloc");
+		return NULL;
+	}
+
+	INIT_LIST_HEAD(&elf->sections);
+	INIT_LIST_HEAD(&elf->symbols);
+
+	elf->fd = open(name, O_RDONLY);
+	if (elf->fd == -1) {
+		perror("open");
+		goto err;
+	}
+
+	elf->elf = elf_begin(elf->fd, ELF_C_READ_MMAP, NULL);
+	if (!elf->elf) {
+		perror("elf_begin");
+		goto err;
+	}
+
+	if (!gelf_getehdr(elf->elf, &elf->ehdr)) {
+		perror("gelf_getehdr");
+		goto err;
+	}
+
+	elf->elf_class = gelf_getclass(elf->elf);
+	if ((elf->elf_class != ELFCLASS32) && (elf->elf_class != ELFCLASS64)) {
+		WARN("invalid elf class");
+		goto err;
+	}
+
+	if (read_sections(elf))
+		goto err;
+
+	if (read_symbols(elf))
+		goto err;
+
+	if (read_relas(elf))
+		goto err;
+
+	return elf;
+
+err:
+	elf_close(elf);
+	return NULL;
+}
+
+void elf_close(struct elf *elf)
+{
+	struct section *sec, *tmpsec;
+	struct symbol *sym, *tmpsym;
+	struct rela *rela, *tmprela;
+
+	list_for_each_entry_safe(sym, tmpsym, &elf->symbols, list) {
+		list_del(&sym->list);
+		free(sym);
+	}
+	list_for_each_entry_safe(sec, tmpsec, &elf->sections, list) {
+		list_for_each_entry_safe(rela, tmprela, &sec->relas, list) {
+			list_del(&rela->list);
+			free(rela);
+		}
+		list_del(&sec->list);
+		free(sec);
+	}
+	if (elf->fd > 0)
+		close(elf->fd);
+	if (elf->elf)
+		elf_end(elf->elf);
+	free(elf);
+}
diff --git a/scripts/livepatch/elf.h b/scripts/livepatch/elf.h
new file mode 100644
index 000000000000..784cf42b01bf
--- /dev/null
+++ b/scripts/livepatch/elf.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2015-2016 Josh Poimboeuf <jpoimboe@redhat.com>
+ */
+
+#ifndef _KLP_POST_ELF_H
+#define _KLP_POST_ELF_H
+
+#include <stdio.h>
+#include <stdbool.h>
+#include <gelf.h>
+#include "list.h"
+
+#ifdef LIBELF_USE_DEPRECATED
+# define elf_getshdrnum    elf_getshnum
+# define elf_getshdrstrndx elf_getshstrndx
+#endif
+
+struct section {
+	struct list_head list;
+	GElf_Shdr sh;
+	struct section *base, *rela;
+	struct list_head relas;
+	struct symbol *sym;
+	Elf_Data *elf_data;
+	char *name;
+	int idx;
+	void *data;
+	unsigned int size;
+};
+
+struct symbol {
+	struct list_head list;
+	GElf_Sym sym;
+	struct section *sec;
+	char *name;
+	unsigned int idx;
+	unsigned char bind, type;
+	unsigned long offset;
+	unsigned int size;
+};
+
+struct rela {
+	struct list_head list;
+	GElf_Rela rela;
+	struct symbol *sym;
+	unsigned int type;
+	unsigned long offset;
+	int addend;
+};
+
+struct elf {
+	Elf *elf;
+	GElf_Ehdr ehdr;
+	int fd;
+	char *name;
+	int elf_class;
+	struct list_head sections;
+	struct list_head symbols;
+};
+
+
+struct elf *elf_open(const char *name);
+bool is_rela_section(struct section *sec);
+struct section *find_section_by_name(struct elf *elf, const char *name);
+struct section *create_rela_section(struct elf *elf, const char *name,
+				    struct section *base);
+
+void elf_close(struct elf *elf);
+int elf_write_file(struct elf *elf, const char *file);
+
+
+#endif /* _KLP_POST_ELF_H */
diff --git a/scripts/livepatch/klp-convert.c b/scripts/livepatch/klp-convert.c
new file mode 100644
index 000000000000..5eb30461deac
--- /dev/null
+++ b/scripts/livepatch/klp-convert.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2016 Josh Poimboeuf <jpoimboe@redhat.com>
+ * Copyright (C) 2017 Joao Moreira   <jmoreira@suse.de>
+ * Copyright (C) 2023 Lukas Hruska   <lhruska@suse.cz>
+ */
+
+#include <assert.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+#include "elf.h"
+#include "list.h"
+#include "klp-convert.h"
+
+#define KSYM_NAME_LEN 512
+
+#define safe_snprintf(var, size, format, args...)			\
+	({								\
+		int __ret;						\
+									\
+		__ret = snprintf(var, size, format, ##args);		\
+		__ret < 0 || (size_t)__ret >= size;			\
+	})
+
+/*
+ * Formats name of klp rela symbol based on another given section (@oldsec)
+ * and object (@obj_name) name, then returns it
+ */
+static char *alloc_klp_rela_name(struct section *oldsec,
+		char *target_objname, struct elf *klp_elf)
+{
+	char *klp_rela_name;
+	unsigned int length;
+	int err;
+
+    /*
+     * Format: .klp.rela.sec_objname.section_name
+     * Note: ".section_name" comes from oldsec->base->name
+     *    including the dot.
+     */
+	length = strlen(KLP_RELA_PREFIX) + strlen(target_objname)
+		 + strlen(oldsec->base->name) + 1;
+
+	klp_rela_name = calloc(1, length);
+	if (!klp_rela_name) {
+		WARN("Memory allocation failed (%s%s%s)\n", KLP_RELA_PREFIX,
+				target_objname, oldsec->base->name);
+		return NULL;
+	}
+
+	err = safe_snprintf(klp_rela_name, length, KLP_RELA_PREFIX "%s%s",
+			  target_objname, oldsec->base->name);
+	if (err) {
+		WARN("Length error (%s)", klp_rela_name);
+		free(klp_rela_name);
+		return NULL;
+	}
+
+	return klp_rela_name;
+}
+
+static int calc_digits(int num)
+{
+	int count = 0;
+
+	/* It takes a digit to represent zero */
+	if (!num)
+		return 1;
+
+	while (num != 0) {
+		num /= 10;
+		count++;
+	}
+
+	return count;
+}
+
+/* Converts rela symbol names */
+static bool convert_symbol(struct symbol *s)
+{
+	char lp_obj_name[MODULE_NAME_LEN];
+	char sym_obj_name[MODULE_NAME_LEN];
+	char sym_name[KSYM_NAME_LEN];
+	char *klp_sym_name;
+	unsigned long sym_pos;
+	int poslen;
+	unsigned int length;
+
+	static_assert(MODULE_NAME_LEN <= 56, "Update limit in the below sscanf()");
+
+	if (sscanf(s->name, KLP_SYM_RELA_PREFIX "%55[^.].%55[^.].%511[^,],%lu",
+			lp_obj_name, sym_obj_name, sym_name, &sym_pos) != 4) {
+		WARN("Invalid format of symbol (%s)\n", s->name);
+		return false;
+	}
+
+	poslen = calc_digits(sym_pos);
+
+	length = strlen(KLP_SYM_PREFIX) + strlen(sym_obj_name)
+		 + strlen(sym_name) + sizeof(poslen) + 3;
+
+	klp_sym_name = calloc(1, length);
+	if (!klp_sym_name) {
+		WARN("Memory allocation failed (%s%s.%s,%lu)\n", KLP_SYM_PREFIX,
+				sym_obj_name, sym_name, sym_pos);
+		return false;
+	}
+
+	if (safe_snprintf(klp_sym_name, length, KLP_SYM_PREFIX "%s.%s,%lu",
+			  sym_obj_name, sym_name, sym_pos)) {
+
+		WARN("Length error (%s%s.%s,%lu)", KLP_SYM_PREFIX,
+				sym_obj_name, sym_name, sym_pos);
+		free(klp_sym_name);
+		return false;
+	}
+
+	s->name = klp_sym_name;
+	s->sec = NULL;
+	s->sym.st_name = -1;
+	s->sym.st_shndx = SHN_LIVEPATCH;
+
+	return true;
+}
+
+/* Checks if a symbols was already converted */
+static bool is_converted_symbol(struct symbol *sym)
+{
+	return sym->sym.st_shndx == SHN_LIVEPATCH;
+}
+
+/*
+ * Finds or creates a klp rela section based on another given section (@oldsec)
+ * and rela's symbol name (@rela), then returns it
+ */
+static struct section *get_or_create_klp_rela_section(struct section *oldsec, struct rela *rela,
+		struct elf *klp_elf)
+{
+	char *klp_rela_name;
+	char lp_obj_name[MODULE_NAME_LEN];
+	struct section *sec;
+
+	if (sscanf(rela->sym->name, KLP_SYM_RELA_PREFIX "%55[^.]", lp_obj_name) != 1) {
+		WARN("Invalid relocation symbol name.\n");
+		return NULL;
+	}
+
+	klp_rela_name = alloc_klp_rela_name(oldsec, lp_obj_name, klp_elf);
+	if (!klp_rela_name) {
+		WARN("Can't create or access klp.rela section (%s%s)\n",
+				lp_obj_name, oldsec->base->name);
+		return NULL;
+	}
+
+	sec = find_section_by_name(klp_elf, klp_rela_name);
+	if (!sec)
+		sec = create_rela_section(klp_elf, klp_rela_name, oldsec->base);
+
+	if (sec)
+		sec->sh.sh_flags |= SHF_RELA_LIVEPATCH;
+
+	free(klp_rela_name);
+	return sec;
+}
+
+static void move_rela(struct rela *r, struct section *rela_sec)
+{
+	/* Move the rela into newly created klp rela section */
+	list_del(&r->list);
+	list_add_tail(&r->list, &rela_sec->relas);
+}
+
+static bool is_klp_sym_rela_symbol(struct symbol *sym)
+{
+	int len;
+
+	/* skip index 0 which serves as the undefined symbol index */
+	if (!sym->idx)
+		return false;
+
+	len = strlen(KLP_SYM_RELA_PREFIX);
+	/*
+	 * we want to resolve only symbols with format:
+	 * .klp.sym.rela.<target-obj-name>.<foo-providing-obj-name>.foo,0
+	 */
+	return strncmp(sym->name, KLP_SYM_RELA_PREFIX, len) == 0;
+}
+
+/* Checks if a section is a klp rela section */
+static bool is_klp_rela_section(struct section *sec)
+{
+	if (!is_rela_section(sec))
+		return false;
+
+	int len = strlen(KLP_RELA_PREFIX);
+
+	return strncmp(sec->name, KLP_RELA_PREFIX, len) == 0;
+}
+
+/*
+ * Frees the new names and rela sections as created by
+ * get_or_create_klp_rela_section(), and convert_symbol()
+ */
+static void free_converted_resources(struct elf *klp_elf)
+{
+	struct symbol *sym;
+	struct section *sec;
+
+	list_for_each_entry(sym, &klp_elf->symbols, list) {
+		if (is_converted_symbol(sym))
+			free(sym->name);
+	}
+
+	list_for_each_entry(sec, &klp_elf->sections, list) {
+		if (is_klp_rela_section(sec)) {
+			free(sec->elf_data);
+			free(sec->name);
+		}
+	}
+}
+
+int main(int argc, const char **argv)
+{
+	const char *klp_in_module, *klp_out_module;
+	struct rela *rela, *tmprela;
+	struct section *sec, *rela_sec;
+	struct elf *klp_elf;
+	struct symbol *sym;
+
+	if (argc != 3) {
+		WARN("Usage: %s <input.ko> <output.ko>", argv[0]);
+		return -1;
+	}
+
+	klp_in_module = argv[1];
+	klp_out_module = argv[2];
+
+	klp_elf = elf_open(klp_in_module);
+	if (!klp_elf) {
+		WARN("Unable to read elf file %s\n", klp_in_module);
+		return -1;
+	}
+
+	list_for_each_entry(sec, &klp_elf->sections, list) {
+		/* skip newly created sections */
+		if (is_klp_rela_section(sec))
+			continue;
+
+		list_for_each_entry_safe(rela, tmprela, &sec->relas, list) {
+			if (!is_klp_sym_rela_symbol(rela->sym))
+				continue;
+
+			rela_sec = get_or_create_klp_rela_section(sec, rela, klp_elf);
+			if (!rela_sec) {
+				WARN("Unable to convert relocation: %s",
+						rela->sym->name);
+				return -1;
+			}
+			/* rela needs to be moved to newly created section */
+			move_rela(rela, rela_sec);
+		}
+	}
+
+	/* Rename symbols */
+	list_for_each_entry(sym, &klp_elf->symbols, list) {
+		if (!is_klp_sym_rela_symbol(sym))
+			continue;
+		if (!convert_symbol(sym)) {
+			WARN("Unable to convert symbol name (%s)\n",
+					sym->name);
+			return -1;
+		}
+	}
+
+	if (elf_write_file(klp_elf, klp_out_module))
+		return -1;
+
+	free_converted_resources(klp_elf);
+	elf_close(klp_elf);
+
+	return 0;
+}
diff --git a/scripts/livepatch/klp-convert.h b/scripts/livepatch/klp-convert.h
new file mode 100644
index 000000000000..34842c50c711
--- /dev/null
+++ b/scripts/livepatch/klp-convert.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2016 Josh Poimboeuf <jpoimboe@redhat.com>
+ * Copyright (C) 2017 Joao Moreira   <jmoreira@suse.de>
+ *
+ */
+
+#define SHN_LIVEPATCH		0xff20
+#define SHF_RELA_LIVEPATCH	0x00100000
+#define MODULE_NAME_LEN		(64 - sizeof(GElf_Addr))
+#define WARN(format, ...) \
+	fprintf(stderr, "klp-convert: " format "\n", ##__VA_ARGS__)
+
+struct sympos {
+	char *symbol_name;
+	char *object_name;
+	char *loading_obj_name;
+	int pos;
+};
+
+/*
+ * klp-convert uses macros and structures defined in the linux sources
+ * package (see include/uapi/linux/livepatch.h). To prevent the
+ * dependency when building locally, they are defined below. Also notice
+ * that these should match the definitions from the targeted kernel.
+ */
+
+#define KLP_RELA_PREFIX			".klp.rela."
+#define KLP_SYM_RELA_PREFIX		".klp.sym.rela."
+#define KLP_SYM_PREFIX			".klp.sym."
+
+#ifndef __packed
+#define __packed        __attribute__((packed))
+#endif
+
+struct klp_module_reloc {
+	union {
+		void *sym;
+		uint64_t sym64;	/* Force 64-bit width */
+	};
+	uint32_t sympos;
+} __packed;
diff --git a/scripts/livepatch/list.h b/scripts/livepatch/list.h
new file mode 100644
index 000000000000..4d429120fabf
--- /dev/null
+++ b/scripts/livepatch/list.h
@@ -0,0 +1,391 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_LIST_H
+#define _LINUX_LIST_H
+
+/*
+ * Simple doubly linked list implementation.
+ *
+ * Some of the internal functions ("__xxx") are useful when
+ * manipulating whole lists rather than single entries, as
+ * sometimes we already know the next/prev entries and we can
+ * generate better code by using them directly rather than
+ * using the generic single-entry routines.
+ */
+
+#define WRITE_ONCE(a, b) (a = b)
+#define READ_ONCE(a) a
+
+#undef offsetof
+#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
+
+/**
+ * container_of - cast a member of a structure out to the containing structure
+ * @ptr:        the pointer to the member.
+ * @type:       the type of the container struct this is embedded in.
+ * @member:     the name of the member within the struct.
+ *
+ */
+#define container_of(ptr, type, member) ({			\
+	const typeof(((type *)0)->member) * __mptr = (ptr);	\
+	(type *)((char *)__mptr - offsetof(type, member)); })
+
+struct list_head {
+	struct list_head *next, *prev;
+};
+
+#define LIST_HEAD_INIT(name) { &(name), &(name) }
+
+#define LIST_HEAD(name) \
+	struct list_head name = LIST_HEAD_INIT(name)
+
+static inline void INIT_LIST_HEAD(struct list_head *list)
+{
+	WRITE_ONCE(list->next, list);
+	list->prev = list;
+}
+
+/*
+ * Insert a new entry between two known consecutive entries.
+ *
+ * This is only for internal list manipulation where we know
+ * the prev/next entries already!
+ */
+static inline void __list_add(struct list_head *new,
+			      struct list_head *prev,
+			      struct list_head *next)
+{
+	next->prev = new;
+	new->next = next;
+	new->prev = prev;
+	WRITE_ONCE(prev->next, new);
+}
+
+/**
+ * list_add - add a new entry
+ * @new: new entry to be added
+ * @head: list head to add it after
+ *
+ * Insert a new entry after the specified head.
+ * This is good for implementing stacks.
+ */
+static inline void list_add(struct list_head *new, struct list_head *head)
+{
+	__list_add(new, head, head->next);
+}
+
+
+/**
+ * list_add_tail - add a new entry
+ * @new: new entry to be added
+ * @head: list head to add it before
+ *
+ * Insert a new entry before the specified head.
+ * This is useful for implementing queues.
+ */
+static inline void list_add_tail(struct list_head *new, struct list_head *head)
+{
+	__list_add(new, head->prev, head);
+}
+
+/*
+ * Delete a list entry by making the prev/next entries
+ * point to each other.
+ *
+ * This is only for internal list manipulation where we know
+ * the prev/next entries already!
+ */
+static inline void __list_del(struct list_head *prev, struct list_head *next)
+{
+	next->prev = prev;
+	WRITE_ONCE(prev->next, next);
+}
+
+/**
+ * list_del - deletes entry from list.
+ * @entry: the element to delete from the list.
+ * Note: list_empty() on entry does not return true after this, the entry is
+ * in an undefined state.
+ */
+static inline void __list_del_entry(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+}
+
+static inline void list_del(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+}
+
+/**
+ * list_is_last - tests whether @list is the last entry in list @head
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_last(const struct list_head *list,
+				const struct list_head *head)
+{
+	return list->next == head;
+}
+
+/**
+ * list_empty - tests whether a list is empty
+ * @head: the list to test.
+ */
+static inline int list_empty(const struct list_head *head)
+{
+	return READ_ONCE(head->next) == head;
+}
+
+/**
+ * list_entry - get the struct for this entry
+ * @ptr:	the &struct list_head pointer.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_entry(ptr, type, member) \
+	container_of(ptr, type, member)
+
+/**
+ * list_first_entry - get the first element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Note, that list is expected to be not empty.
+ */
+#define list_first_entry(ptr, type, member) \
+	list_entry((ptr)->next, type, member)
+
+/**
+ * list_last_entry - get the last element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Note, that list is expected to be not empty.
+ */
+#define list_last_entry(ptr, type, member) \
+	list_entry((ptr)->prev, type, member)
+
+/**
+ * list_first_entry_or_null - get the first element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Note that if the list is empty, it returns NULL.
+ */
+#define list_first_entry_or_null(ptr, type, member) \
+	(!list_empty(ptr) ? list_first_entry(ptr, type, member) : NULL)
+
+/**
+ * list_next_entry - get the next element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_next_entry(pos, member) \
+	list_entry((pos)->member.next, typeof(*(pos)), member)
+
+/**
+ * list_prev_entry - get the prev element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_prev_entry(pos, member) \
+	list_entry((pos)->member.prev, typeof(*(pos)), member)
+
+/**
+ * list_for_each	-	iterate over a list
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @head:	the head for your list.
+ */
+#define list_for_each(pos, head) \
+	for (pos = (head)->next; pos != (head); pos = pos->next)
+
+/**
+ * list_for_each_prev	-	iterate over a list backwards
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @head:	the head for your list.
+ */
+#define list_for_each_prev(pos, head) \
+	for (pos = (head)->prev; pos != (head); pos = pos->prev)
+
+/**
+ * list_for_each_safe - iterate over a list safe against removal of list entry
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @n:		another &struct list_head to use as temporary storage
+ * @head:	the head for your list.
+ */
+#define list_for_each_safe(pos, n, head) \
+	for (pos = (head)->next, n = pos->next; pos != (head); \
+		pos = n, n = pos->next)
+
+/**
+ * list_for_each_prev_safe - iterate over a list backwards safe against removal
+   of list entry
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @n:		another &struct list_head to use as temporary storage
+ * @head:	the head for your list.
+ */
+#define list_for_each_prev_safe(pos, n, head) \
+	for (pos = (head)->prev, n = pos->prev; \
+	     pos != (head); \
+	     pos = n, n = pos->prev)
+
+/**
+ * list_for_each_entry	-	iterate over list of given type
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry(pos, head, member)				\
+	for (pos = list_first_entry(head, typeof(*pos), member);	\
+	     &pos->member != (head);					\
+	     pos = list_next_entry(pos, member))
+
+/**
+ * list_for_each_entry_reverse - iterate backwards over list of given type.
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_reverse(pos, head, member)			\
+	for (pos = list_last_entry(head, typeof(*pos), member);		\
+	     &pos->member != (head);					\
+	     pos = list_prev_entry(pos, member))
+
+/**
+ * list_prepare_entry - prepare a pos entry for use in
+   list_for_each_entry_continue()
+ * @pos:	the type * to use as a start point
+ * @head:	the head of the list
+ * @member:	the name of the list_head within the struct.
+ *
+ * Prepares a pos entry for use as a start point in
+   list_for_each_entry_continue().
+ */
+#define list_prepare_entry(pos, head, member) \
+	((pos) ? : list_entry(head, typeof(*pos), member))
+
+/**
+ * list_for_each_entry_continue - continue iteration over list of given type
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Continue to iterate over list of given type, continuing after
+ * the current position.
+ */
+#define list_for_each_entry_continue(pos, head, member)			\
+	for (pos = list_next_entry(pos, member);			\
+	     &pos->member != (head);					\
+	     pos = list_next_entry(pos, member))
+
+/**
+ * list_for_each_entry_continue_reverse - iterate backwards from the given point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Start to iterate over list of given type backwards, continuing after
+ * the current position.
+ */
+#define list_for_each_entry_continue_reverse(pos, head, member)		\
+	for (pos = list_prev_entry(pos, member);			\
+	     &pos->member != (head);					\
+	     pos = list_prev_entry(pos, member))
+
+/**
+ * list_for_each_entry_from - iterate over list of given type from the current
+   point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing from current position.
+ */
+#define list_for_each_entry_from(pos, head, member)			\
+	for (; &pos->member != (head);					\
+	     pos = list_next_entry(pos, member))
+
+/**
+ * list_for_each_entry_safe - iterate over list of given type safe against
+   removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_safe(pos, n, head, member)			\
+	for (pos = list_first_entry(head, typeof(*pos), member),	\
+		n = list_next_entry(pos, member);			\
+	     &pos->member != (head);					\
+	     pos = n, n = list_next_entry(n, member))
+
+/**
+ * list_for_each_entry_safe_continue - continue list iteration safe against
+ * removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing after current point,
+ * safe against removal of list entry.
+ */
+#define list_for_each_entry_safe_continue(pos, n, head, member)		\
+	for (pos = list_next_entry(pos, member),			\
+		n = list_next_entry(pos, member);			\
+	     &pos->member != (head);					\
+	     pos = n, n = list_next_entry(n, member))
+
+/**
+ * list_for_each_entry_safe_from - iterate over list from current point safe
+ * against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type from current point, safe against
+ * removal of list entry.
+ */
+#define list_for_each_entry_safe_from(pos, n, head, member)		\
+	for (n = list_next_entry(pos, member);				\
+	     &pos->member != (head);					\
+	     pos = n, n = list_next_entry(n, member))
+
+/**
+ * list_for_each_entry_safe_reverse - iterate backwards over list safe against
+ * removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, safe against removal
+ * of list entry.
+ */
+#define list_for_each_entry_safe_reverse(pos, n, head, member)		\
+	for (pos = list_last_entry(head, typeof(*pos), member),		\
+		n = list_prev_entry(pos, member);			\
+	     &pos->member != (head);					\
+	     pos = n, n = list_prev_entry(n, member))
+
+/**
+ * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
+ * @pos:	the loop cursor used in the list_for_each_entry_safe loop
+ * @n:		temporary storage used in list_for_each_entry_safe
+ * @member:	the name of the list_head within the struct.
+ *
+ * list_safe_reset_next is not safe to use in general if the list may be
+ * modified concurrently (eg. the lock is dropped in the loop body). An
+ * exception to this is if the cursor element (pos) is pinned in the list,
+ * and list_safe_reset_next is called after re-taking the lock and before
+ * completing the current iteration of the loop body.
+ */
+#define list_safe_reset_next(pos, n, member)				\
+	(n = list_next_entry(pos, member))
+
+#endif
-- 
2.42.0

