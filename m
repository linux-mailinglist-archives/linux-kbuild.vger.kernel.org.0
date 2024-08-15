Return-Path: <linux-kbuild+bounces-3020-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01119953942
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 19:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 171E21C22436
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BD46BB5B;
	Thu, 15 Aug 2024 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g25wtdYC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DDD1BE860
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743583; cv=none; b=sVK+xaXESEezZY5U0Inv70AgR+KOvrnAVpYNaGSyoaJfRXAyTZKre7k+VPOwdsBV+YSWg6eozWxkQVm5DVjpn3pcEHde2yQ99SbLy/0mCCUsav1CYM4tbm6VpWLJS3oT/d/7tVix3U045tQHOYGEEfzPMv08tZEmUHJ+98lM+og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743583; c=relaxed/simple;
	bh=MdCZyANU3cpN1KbL2Y+c7u2dfSk3DjTqLm/uKatG+wg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qh3N9MvrhCMa5ClAZlv7KObBnZ24Rz7Pm0ueHOsKikrKJtsyB4UUeTWDnM1ctjI9ts/8l+K8MqgppfsenovWXYg3LUEBVO5bELm/fK2uK3JN45uVDEqECNYWMHXbdflK1XUBmUOlad0mb4vZ4+g7MVFRtkKwbXzGD8DmttWVbc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g25wtdYC; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2d3c6b19444so988303a91.2
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743580; x=1724348380; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AM5wUjQsWxirPWho62bBzTbFDQPnvqvSrS68y5t7Rps=;
        b=g25wtdYCK/iMouWOVcx7e1hCQOD0bM7F76zWaDAbirFuagb9QWCFdfc/7FmqaFtIhY
         XLTW4nOp/MnqCms2ykWPUyS+nSydXpetPf7mwj8pHrVUEzlktqSgBZvlEsHY5wYRWWdt
         /gCvUzZ3Zlqe7RG/Z2oLkDfTU8C88QCd8mP4u+pgzxUVoSjigsZRMxi4+Lwygu4psTEm
         hgOuoohwdsPtmluIujVn1L16CFB1pbN3mX+GP+RygmC7Ci6GpJ2PUJiKp6vEWbOiahyy
         bH9Sk5AcTaxFQgitEZ5E+ee1nAwuKPuK0SyqCRvzh5VkFjYtk71cYIszsMtKByGQDq5m
         QU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743580; x=1724348380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AM5wUjQsWxirPWho62bBzTbFDQPnvqvSrS68y5t7Rps=;
        b=wr3+MnqlurK867tl0gxM3vBxaEsM75g4058jZsGbyWGQRaGkhVgJhAPYPx0xRlZpSi
         eNGXuI7la4r1uPmX7K/817DT6rHQpQ1uLyhbIZ85pcnhyovaMu6ncmaFUl+GGfk7acHO
         C9a8zYp8IpXXzzLZ4aXKQsb1+JX2ga4u9094Jep1kGWmHK6Ap1QY384Zngd4scNmnNyG
         WceQGU+ZI9axWgaNahuBRkBkWG389MYjij3Zj/YPDFChefB/MwjbXXFzYt/grR12dCuF
         ipw9yxge2yYsuwjVpCuMd7aVkCjQg7+UD9CGdzz2iokMh+XaF+lZ+vev4iV4cjEKAGY8
         TZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPZ4esDEX2Oi3kqnnm5xUjs1a1Sbah+Z+XEJlhGFnYwUww7DQf7DU+MlnS2Cwwi2r8lhQJS4K30IoSkoWxACU6jifOAio7TTyeZypI
X-Gm-Message-State: AOJu0YxBaW8zwXpBnFYUvNKJjDAFw0fYa4acDAon9f6xqugw/BMVvyp9
	97fj/yI0WtwR+BY5xiG/I8HsLfGA+l7G8PV/T/0zpRixLDlfYrMP2XusKZpbd/oRnXU4mHB/4an
	xeFqK+NkTLZMZOepstYxYHGmk3Q==
X-Google-Smtp-Source: AGHT+IEa9IerFI45JnVORaoGhFuJF7bDHYfiVGOl6IiBF/KgDfLV7Sw3ufSt/NO4uLL5N9tOaKwbVaiwWR+mCH6/ASI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90b:4f86:b0:2d3:c743:1e5d with
 SMTP id 98e67ed59e1d1-2d3e041c0b8mr731a91.7.1723743580335; Thu, 15 Aug 2024
 10:39:40 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:19 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=9841; i=samitolvanen@google.com;
 h=from:subject; bh=MdCZyANU3cpN1KbL2Y+c7u2dfSk3DjTqLm/uKatG+wg=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj059Pg7Q9O8Q4oa1rF1r5AuRgbl0eRJ6dE4O
 uywCFA1ZmSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OQAKCRBMtfaEi7xW
 7qQQDACID+wzctpfuYuBToMDEYH6MiGIl/f2n24YCbYmOVyDavrd7LRzjV//CF9n+3CGV9VuhXS
 kesyXvcYQKKXs11p6qVm5EuQPtfjdz8+vyLWdJMSkgj55gm+6AnFDRGjWxdu2HMuweUCayScGq/
 XZ1MxNLeqivVdMKu/eBFtwl+tfkm8eJdp4us7naIn6HFSUNnIWqxvVhldGu8nzXGxaEeoFvUhFr
 XITZTFrFFdwJu+tYSmWDFtpwdJ89ws42Sy3Y7Gd+E1k2Pui8jsPiebDDx29/DZS9WdzSgtiXMIv
 rKTTFkjTLuhjt1RD3LaeGn0Lv7uMeyjiYt3v9Fv90FoXrn7+U/OQrGdrRt+iTNmP63b+cQ1qzcF
 VGn3xmRmpwkwj4AGdHWouTtfVjWCwJeS4HvzAOwWPnPDLvbWRPj92G6gtjRkxMlPqPgmcEQinZ5 1dMxt7RsMAUVcT4N31VZiBGv/tTaHMHWfrKE34kZIq7+qDUec82xYk+NrHzHa5MTSksuI=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-36-samitolvanen@google.com>
Subject: [PATCH v2 15/19] gendwarfksyms: Add support for declaration-only data structures
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

If a source file refers to an opaque data structure, the DWARF
debugging information in the resulting object file will only contain a
structure declation, which means the contents of the structure are not
included when computing symbol versions. For example:

Source code:

  struct struct0;
  int func(struct struct0 *);

gendwarfksyms --debug:

  subprogram(
    formal_parameter pointer_type <unnamed> {
      structure_type struct0 {
        <declaration>
      }
    } byte_size(8),
  )
  -> base_type int byte_size(4) encoding(5);
  #SYMVER func 0x7e8284f9

The declaration can change into a full definition when an additional
include is added to the TU, which changes the version CRC, even though
the ABI has not changed. If this happens during an LTS update, a
distribution that wants to maintain a stable ABI needs a way to ensure
symbol versions remain unchanged.

With genksyms, the usual solution is to use #ifndef __GENKSYMS__ to
skip the newly added header file when computing symbol versions, but
that's not an option when we're processing a precompiled object file.

To support this use case, add a --stable command line flag that gates
kABI stability features that are not needed in mainline, but can be
useful for distributions, and add support for symbol annotations that
allow structures to always be treated as declarations when versions
are computed. If a __gendwarfksyms_declonly_<structname> symbol
exists in the object file's symbol table, the "structname" structure
is treated as a declaration only, and not expanded when computing
versions. The symbol can be defined using the following macro, for
example, which discards it from the final kernel binary:

  #define GENDWARFKSYMS_DECLONLY(structname) \
      static void *__gendwarfksyms_declonly_##structname __used \
        __section(".discard.gendwarfksyms")

Now, if we include struct0 definition in our source code, and add a
declaration-only annotation, we have:

  struct struct0 { int a; };
  GENDWARFKSYMS_DECLONLY(struct0);
  int func(struct struct0 *);

gendwarfksyms --debug reflects the added definition:

  subprogram(
    formal_parameter pointer_type <unnamed> {
      structure_type struct0 {
        member base_type int byte_size(4) encoding(5) data_member_location(0),
      } byte_size(4)
    } byte_size(8),
  )
  -> base_type int byte_size(4) encoding(5);
  #SYMVER func 0xc0de983d

But with --debug --stable, the definition is ignored and we again
have the original symbol version:

  subprogram(
    formal_parameter pointer_type <unnamed> {
      structure_type struct0 {
        <declaration>
      }
    } byte_size(8),
  )
  -> base_type int byte_size(4) encoding(5);
  #SYMVER func 0x7e8284f9

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c             | 25 +++++++++-
 scripts/gendwarfksyms/examples/declonly.c | 31 ++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.c     |  4 ++
 scripts/gendwarfksyms/gendwarfksyms.h     |  4 ++
 scripts/gendwarfksyms/symbols.c           | 61 +++++++++++++++++++++++
 5 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 scripts/gendwarfksyms/examples/declonly.c

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 677190ae18ef..bf28946c321e 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -74,7 +74,30 @@ static bool is_declaration(Dwarf_Die *die)
 {
 	bool value;
 
-	return get_flag_attr(die, DW_AT_declaration, &value) && value;
+	/*
+	 * If the object file has a __gendwarfksyms_declonly_<structname>
+	 * symbol, we treat structures named "structname" as declarations,
+	 * i.e. they won't be expanded when calculating symbol versions.
+	 * This helps distributions maintain a stable kABI e.g., if extra
+	 * includes change a declaration into a definition.
+	 *
+	 * A simple way to mark a structure declaration-only in the source
+	 * code is to define a discarded symbol:
+	 *
+	 * #define GENDWARFKSYMS_DECLONLY(structname) \
+	 *   static void *__gendwarfksyms_declonly_##structname __used \
+	 *     __section(".discard.gendwarfksyms")
+	 *
+	 *  For example:
+	 *
+	 *  struct struct0 { int a; }
+	 *  GENDWARFKSYMS_DECLONLY(struct0);
+	 *
+	 *  Here, struct0 would be always be considered a declaration even
+	 *  though the definition is visible.
+	 */
+	return (get_flag_attr(die, DW_AT_declaration, &value) && value) ||
+	       is_struct_declonly(get_name(die));
 }
 
 /*
diff --git a/scripts/gendwarfksyms/examples/declonly.c b/scripts/gendwarfksyms/examples/declonly.c
new file mode 100644
index 000000000000..b1b889e582da
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/declonly.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Google LLC
+ *
+ * Declaration-only data structure example. See dwarf.c:is_declaration
+ * for details.
+ *
+ * $ gcc -g -c examples/declonly.c
+ * $ echo exported | ./gendwarfksyms --dump-dies declonly.o
+ * variable structure_type struct0 {
+ *   member base_type int byte_size(4) encoding(5) data_member_location(0),
+ * } byte_size(4)
+ *
+ * With --stable, struct0 is treated as a declaration:
+ *
+ * $ echo exported | ./gendwarfksyms --stable --dump-dies declonly.o
+ * variable structure_type struct0 {
+ * }
+ */
+
+#define GENDWARFKSYMS_DECLONLY(structname) \
+	static void *__gendwarfksyms_declonly_##structname \
+		__attribute__((__used__)) \
+		__attribute__((__section__(".discard.gendwarfksyms")));
+
+struct struct0 {
+	int a;
+};
+
+struct struct0 exported;
+GENDWARFKSYMS_DECLONLY(struct0);
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 4a160d19d7df..10d1470383be 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -24,6 +24,8 @@ bool dump_die_map;
 bool dump_types;
 /* Print out expanded type strings used for version calculations */
 bool dump_versions;
+/* Support kABI stability features */
+bool stable;
 /* Produce a symtypes file */
 bool symtypes;
 static const char *symtypes_file;
@@ -38,6 +40,7 @@ static const struct {
 	{ "--dump-die-map", &dump_die_map, NULL },
 	{ "--dump-types", &dump_types, NULL },
 	{ "--dump-versions", &dump_versions, NULL },
+	{ "--stable", &stable, NULL },
 	{ "--symtypes", &symtypes, &symtypes_file },
 };
 
@@ -186,6 +189,7 @@ int main(int argc, const char **argv)
 
 		dwfl_end(dwfl);
 		close(fd);
+		symbol_free_declonly();
 	}
 
 	if (symfile)
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index f85e080a8634..05b5c01b1c2a 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -24,6 +24,7 @@ extern bool dump_dies;
 extern bool dump_die_map;
 extern bool dump_types;
 extern bool dump_versions;
+extern bool stable;
 extern bool symtypes;
 
 #define MAX_INPUT_FILES 128
@@ -134,6 +135,9 @@ extern int symbol_set_crc(struct symbol *sym, unsigned long crc);
 extern int symbol_for_each(symbol_callback_t func, void *arg);
 extern void symbol_print_versions(void);
 
+extern bool is_struct_declonly(const char *name);
+extern void symbol_free_declonly(void);
+
 /*
  * die.c
  */
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index c9889cfa89c4..03ba93ef9eac 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -5,12 +5,20 @@
 
 #include "gendwarfksyms.h"
 
+struct declonly {
+	const char *name;
+	struct hlist_node hash;
+};
+
 #define SYMBOL_HASH_BITS 15
+#define DECLONLY_HASH_BITS 10
 
 /* struct symbol_addr -> struct symbol */
 static DEFINE_HASHTABLE(symbol_addrs, SYMBOL_HASH_BITS);
 /* name -> struct symbol */
 static DEFINE_HASHTABLE(symbol_names, SYMBOL_HASH_BITS);
+/* name -> struct declonly */
+static DEFINE_HASHTABLE(declonly_structs, DECLONLY_HASH_BITS);
 
 static inline u32 symbol_addr_hash(const struct symbol_addr *addr)
 {
@@ -296,12 +304,36 @@ static int process_symbol(const char *name, GElf_Sym *sym, Elf32_Word xndx,
 			  void *arg)
 {
 	struct symbol_addr addr = { .section = xndx, .address = sym->st_value };
+	struct declonly *d;
 
 	/* Set addresses for exported symbols */
 	if (GELF_ST_BIND(sym->st_info) != STB_LOCAL &&
 	    addr.section != SHN_UNDEF)
 		checkp(for_each(name, true, set_symbol_addr, &addr));
 
+	if (!stable)
+		return 0;
+
+	/* Process declonly structs */
+	if (strncmp(name, SYMBOL_DECLONLY_PREFIX, SYMBOL_DECLONLY_PREFIX_LEN))
+		return 0;
+
+	d = malloc(sizeof(struct declonly));
+	if (!d) {
+		error("malloc failed");
+		return -1;
+	}
+
+	name += SYMBOL_DECLONLY_PREFIX_LEN;
+	d->name = strdup(name);
+	if (!d->name) {
+		error("strdup failed");
+		return -1;
+	}
+
+	hash_add(declonly_structs, &d->hash, name_hash(d->name));
+	debug("declaration-only: %s", d->name);
+
 	return 0;
 }
 
@@ -310,6 +342,35 @@ int symbol_read_symtab(int fd)
 	return elf_for_each_symbol(fd, process_symbol, NULL);
 }
 
+bool is_struct_declonly(const char *name)
+{
+	struct declonly *d;
+
+	if (!stable || !name)
+		return false;
+
+	hash_for_each_possible(declonly_structs, d, hash, name_hash(name)) {
+		if (!strcmp(name, d->name))
+			return true;
+	}
+
+	return false;
+}
+
+void symbol_free_declonly(void)
+{
+	struct hlist_node *tmp;
+	struct declonly *d;
+	int i;
+
+	hash_for_each_safe(declonly_structs, i, tmp, d, hash) {
+		free((void *)d->name);
+		free(d);
+	}
+
+	hash_init(declonly_structs);
+}
+
 void symbol_print_versions(void)
 {
 	struct hlist_node *tmp;
-- 
2.46.0.184.g6999bdac58-goog


