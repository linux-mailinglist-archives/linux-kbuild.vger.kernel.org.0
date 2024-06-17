Return-Path: <linux-kbuild+bounces-2171-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B485190B8CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 20:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA77A1C23BBD
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 18:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D213219A28D;
	Mon, 17 Jun 2024 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3uizPohl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E9199E97
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647131; cv=none; b=oeFNdQRmNQF0+d67KfIThM3/vVOa2SXR/wOnm17UcW3K1iZSQIyWbjYT9JGNJnhHwvkT7JtYVVWJn4yc5WP3RmkO/FyzFTrMijEWd9GROPmeXYAJXNiabaf0JEShOuISlQV9EkopYaGEH43PWAQ1U6E4LTMPnwSQpC/QDrrdUUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647131; c=relaxed/simple;
	bh=XeWLpjfbip2cG1reCp5fuwFDg0zCF0I9155zvse/ZJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LugDzyPUEiJ0whxHN9HK4ZDWRQIyBXiGhB3BOWntUM86AN4m8inz0vb3hw4B7tIBtXi7UKSHjmCdwafONej+UFP75O6SWR/DT/lm3uyiAqlMD+sEPASF/iR5IAq3560dJcxDbo3JF3aVU3loSkZvaOpvn9PZJsYeAzV/ySmpPLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3uizPohl; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e023e936ac4so71653276.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647129; x=1719251929; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDtl7Q8+dGnVJgz6nefcFJrXDgszLOVdSnX1Gj5oN2E=;
        b=3uizPohlTjkm97ZKCTgoicwbxM9i1iCPVr6bvS97D6Ht17k5/qElTf+8k37moWd3OE
         nPxD/sTOpm4IZuJFN+MeQ4TTaZj7U51jg4lpn2Pjr9DjiAZHo+vXAuyvfdJgEhwQMCq1
         K+WmRjqcPfBGHQjnAJ6gP/DED4GalvLYQXjfT1eQwhFPGQXW/8RuPq5/xoRDislZ7hvG
         52epP5bJ+iSBHPUxXIZKPRMUFZqAApFd1vjfdUyRaiAg63uXjJAQpANyzVqXMZKVfLl9
         EWoGCRKJuynNWPtmS6KPzdAmodUlfjK3q0kA5COCUAbFHnunz4gtLwEf5zaH73wY0IQm
         AtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647129; x=1719251929;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDtl7Q8+dGnVJgz6nefcFJrXDgszLOVdSnX1Gj5oN2E=;
        b=FboBgOwCV4Tq58yOTpVshgAGQyT/cTnu/M60PPYzHSWCv0sbhEICJx4D3M+vo2hmAy
         fW+zIgcVq8kKlNNsdVfV1koYF3+2Y3HuwnQLsaDXrpjiWW5VAVRqyGZPr7JvOdYqK0uC
         LrkPiZHe8u5JDuQA6EGqibvbv1bM1hAR/x5qYevTiNvONNxQoU06qXEC2SAS0oiytFXx
         E1cCJ8tMnf9DXa7Nu0mxqhl3bsTafDqdiqj25h2XqKlhZ8+7oLunOXh7chn5Vyt3XptH
         x2JmRNUP8mrT0cNcP4KwOwNuX9U3o4KU7xE2ucSYgQTYA9C2uAEcgi/TyrwpygqKX7E2
         izlA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Si9zvtR/gTzurosMWmSr8RzNuHEXGL70qZkfWfWTFDVrUUtJlu2Am3sTdnD8yjM1DTxIZwl2fJu9RBUT3ThmKZsgKDjlUC+kBCgl
X-Gm-Message-State: AOJu0YwjhjC26K2EnkVA+/MnXGzWG0BI1djAt0OO5cVnXbDBEtOXpUQQ
	GRsXSAix5eShDBgdDhAWSCjfwR+8KeYr1QNIz7BzaKvPrPJgjXvV1W8dh2qdukPG2zD74p2J22m
	igRA/Wc8iowKMBv7qf2uOhE8qtA==
X-Google-Smtp-Source: AGHT+IEPsCaMFfOkZ8T4Tiv95vdcZi2tL3ndrzRupJFWeE1D/DO1qf/1J5PcAqULyuJkAvIHq9t4JZEnvngWo+4TUXg=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:100f:b0:dfd:d6ec:4e3b with
 SMTP id 3f1490d57ef6-dff15399367mr3619876276.7.1718647128807; Mon, 17 Jun
 2024 10:58:48 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:32 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=14655; i=samitolvanen@google.com;
 h=from:subject; bh=XeWLpjfbip2cG1reCp5fuwFDg0zCF0I9155zvse/ZJc=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk8BR59D/orRkAZgweMqljSH/+OkombAD0jp
 16TM3Cl+yaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5PAAKCRBMtfaEi7xW
 7jtDC/9KMOiJdtqQmd5yxeu9lQtRLDPRU8fXZcwwe+m9L7fQNt9m4tEmVkD3cHo/0qJynlRygzR
 FGxxenl3OadcMMwHEvQAwL7+xbzS1xmPGA8q3/GH++yL86nlY+UiqEgaoCJ1Zt16Una6K5aixt/
 Szt3xHwLJXzIGX5LXdZp1WpLCmjMqYaPcLyj0+RFSr35a/aaSNVLkrYe0CNuhXGWsEEnXJz+Z8H
 hQTPFOU4r/TgqI616+OjNX7HCZYDzVLTsciRVWN0BPq1ybvfdNgzs2t6j8fvbDqIeNmDu2f/Hct
 +FUEKr8RNFf4y38ml9Z/uCE8/EsW6ZDBJoaGrF+cdKvoJi+weBxDr55cvCTpXDzn1A2ry5sv6MP
 +KA22t/oizWEYDimLLtTU3Bb63Kxh8GcUzfDlhEi3XtEpeVXVTLo8lay3cKTqwGGucIlunlNaNc dS9rxJGLfpk0e9RqjLHahC4/ao+yAQXfT4D0YhK6iPicI/Bq1MnYK4l/Uoo/SPN8ogtTs=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-30-samitolvanen@google.com>
Subject: [PATCH 13/15] modpost: Add support for hashing long symbol names
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Rust frequently has symbol names longer than MODULE_NAME_LEN, because
the full namespace path is encoded into the mangled name. Instead of
modpost failing when running into a long name with CONFIG_MODVERSIONS,
store a hash of the name in struct modversion_info.

To avoid breaking userspace tools that parse the __versions array,
include a null-terminated hash function name at the beginning of the
name string, followed by a binary hash. In order to keep .mod.c files
more human-readable, add a comment with the full symbol name before the
array entry. Example output in rust_minimal.mod.c:

  static const struct modversion_info ____versions[]
  __used __section("__versions") = {
        /* _RNvNtNtCs1cdwasc6FUb_6kernel5print14format_strings4INFO */
        { 0x9ec5442f, "sha256\x00\x56\x96\xf4\x27\xdb\x4a\xbf[...]" },
        { 0x1d6595b1, "_RNvNtCs1cdwasc6FUb_6kernel5print11call_printk" },
        { 0x3c642974, "__rust_dealloc" },
        ...
  };

modprobe output for the resulting module:

  $ modprobe --dump-modversions rust_minimal.ko
  0x9ec5442f	sha256
  0x1d6595b1	_RNvNtCs1cdwasc6FUb_6kernel5print11call_printk
  0x3c642974	__rust_dealloc
  ...

While the output is less useful, the tool continues to work and can be
later updated to produce more helpful output for hashed symbols.

Note that this patch adds a generic SHA-256 implementation to modpost
adapted from the Crypto API, but other hash functions may be used in
future if needed.

Suggested-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/mod/Makefile  |   4 +-
 scripts/mod/modpost.c |  20 ++-
 scripts/mod/modpost.h |  20 +++
 scripts/mod/symhash.c | 327 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 364 insertions(+), 7 deletions(-)
 create mode 100644 scripts/mod/symhash.c

diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index c729bc936bae..ddd59ea9027e 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -4,7 +4,7 @@ CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
 hostprogs-always-y	+= modpost mk_elfconfig
 always-y		+= empty.o
 
-modpost-objs	:= modpost.o file2alias.o sumversion.o symsearch.o
+modpost-objs	:= modpost.o file2alias.o symhash.o sumversion.o symsearch.o
 
 devicetable-offsets-file := devicetable-offsets.h
 
@@ -15,7 +15,7 @@ targets += $(devicetable-offsets-file) devicetable-offsets.s
 
 # dependencies on generated files need to be listed explicitly
 
-$(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o $(obj)/symsearch.o: $(obj)/elfconfig.h
+$(obj)/modpost.o $(obj)/file2alias.o $(obj)/symhash.o $(obj)/sumversion.o $(obj)/symsearch.o: $(obj)/elfconfig.h
 $(obj)/file2alias.o: $(obj)/$(devicetable-offsets-file)
 
 quiet_cmd_elfconfig = MKELF   $@
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f48d72d22dc2..2631e3e75a5c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1900,7 +1900,10 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
  **/
 static void add_versions(struct buffer *b, struct module *mod)
 {
+	char hash[SYMHASH_STR_LEN];
 	struct symbol *s;
+	const char *name;
+	size_t len;
 
 	if (!modversions)
 		return;
@@ -1917,13 +1920,20 @@ static void add_versions(struct buffer *b, struct module *mod)
 				s->name, mod->name);
 			continue;
 		}
-		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+		len = strlen(s->name);
+		/*
+		 * For symbols with a long name, use the hash format, but include
+		 * the full symbol name as a comment to keep the generated files
+		 * human-readable.
+		 */
+		if (len >= MODULE_NAME_LEN) {
+			buf_printf(b, "\t/* %s */\n", s->name);
+			name = symhash_str(s->name, len, hash);
+		} else {
+			name = s->name;
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
-			   s->crc, s->name);
+			   s->crc, name);
 	}
 
 	buf_printf(b, "};\n");
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index ee43c7950636..cd2eb718936b 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -183,6 +183,26 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 			Elf_Sym *sym, const char *symname);
 void add_moddevtable(struct buffer *buf, struct module *mod);
 
+/* symhash.c */
+/*
+ * For symbol names longer than MODULE_NAME_LEN, encode a hash of the
+ * symbol name in version information as follows:
+ *
+ * <hash name>\0<binary hash of the symbol name>
+ *
+ * e.g. as a string in .mod.c files:
+ * "sha256\x00\xNN{32}"
+ *
+ * The string is null terminated after the hash name to avoid breaking
+ * userspace tools that parse the __versions table and don't understand
+ * the format.
+ */
+#define SYMHASH_STR_PREFIX	"sha256\\x00"
+#define SYMHASH_STR_PREFIX_LEN	(sizeof(SYMHASH_STR_PREFIX) - 1)
+#define SYMHASH_STR_LEN		(SYMHASH_STR_PREFIX_LEN + 4*32 + 1)
+
+char *symhash_str(const char *name, size_t len, char hash_str[SYMHASH_STR_LEN]);
+
 /* sumversion.c */
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
diff --git a/scripts/mod/symhash.c b/scripts/mod/symhash.c
new file mode 100644
index 000000000000..d0c9cf5f1f6c
--- /dev/null
+++ b/scripts/mod/symhash.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * symhash.c
+ *
+ * Symbol name hashing using a SHA-256 implementation adapted from the
+ * Cryptographic API.
+ */
+#include <byteswap.h>
+#include "modpost.h"
+
+#if HOST_ELFDATA == ELFDATA2MSB
+/* Big endian */
+#define be32_to_cpu(val) (val)
+#define cpu_to_be32(val) (val)
+#define cpu_to_be64(val) (val)
+#else
+/* Little endian */
+#define be32_to_cpu(val) bswap_32(val)
+#define cpu_to_be32(val) bswap_32(val)
+#define cpu_to_be64(val) bswap_64(val)
+#endif
+
+#define barrier_data(ptr) __asm__ __volatile__("": :"r"(ptr) :"memory")
+
+static inline void memzero_explicit(void *s, size_t count)
+{
+	memset(s, 0, count);
+	barrier_data(s);
+}
+
+static inline uint32_t ror32(uint32_t word, unsigned int shift)
+{
+	return (word >> (shift & 31)) | (word << ((-shift) & 31));
+}
+
+/*
+ * include/crypto/sha2.h - Common values for SHA-2 algorithms
+ */
+#define SHA256_DIGEST_SIZE      32
+#define SHA256_BLOCK_SIZE       64
+
+#define SHA256_H0	0x6a09e667UL
+#define SHA256_H1	0xbb67ae85UL
+#define SHA256_H2	0x3c6ef372UL
+#define SHA256_H3	0xa54ff53aUL
+#define SHA256_H4	0x510e527fUL
+#define SHA256_H5	0x9b05688cUL
+#define SHA256_H6	0x1f83d9abUL
+#define SHA256_H7	0x5be0cd19UL
+
+struct sha256_state {
+	uint32_t state[SHA256_DIGEST_SIZE / 4];
+	uint64_t count;
+	uint8_t buf[SHA256_BLOCK_SIZE];
+};
+
+static inline void sha256_init(struct sha256_state *sctx)
+{
+	sctx->state[0] = SHA256_H0;
+	sctx->state[1] = SHA256_H1;
+	sctx->state[2] = SHA256_H2;
+	sctx->state[3] = SHA256_H3;
+	sctx->state[4] = SHA256_H4;
+	sctx->state[5] = SHA256_H5;
+	sctx->state[6] = SHA256_H6;
+	sctx->state[7] = SHA256_H7;
+	sctx->count = 0;
+}
+
+/*
+ * include/crypto/sha256_base.h - core logic for SHA-256 implementations
+ *
+ * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
+ */
+typedef void (sha256_block_fn)(struct sha256_state *sst, uint8_t const *src,
+			       int blocks);
+
+static inline int lib_sha256_base_do_update(struct sha256_state *sctx,
+					    const uint8_t *data,
+					    unsigned int len,
+					    sha256_block_fn *block_fn)
+{
+	unsigned int partial = sctx->count % SHA256_BLOCK_SIZE;
+
+	sctx->count += len;
+
+	if ((partial + len) >= SHA256_BLOCK_SIZE) {
+		int blocks;
+
+		if (partial) {
+			int p = SHA256_BLOCK_SIZE - partial;
+
+			memcpy(sctx->buf + partial, data, p);
+			data += p;
+			len -= p;
+
+			block_fn(sctx, sctx->buf, 1);
+		}
+
+		blocks = len / SHA256_BLOCK_SIZE;
+		len %= SHA256_BLOCK_SIZE;
+
+		if (blocks) {
+			block_fn(sctx, data, blocks);
+			data += blocks * SHA256_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(sctx->buf + partial, data, len);
+
+	return 0;
+}
+
+static inline int lib_sha256_base_do_finalize(struct sha256_state *sctx,
+					      sha256_block_fn *block_fn)
+{
+	const int bit_offset = SHA256_BLOCK_SIZE - sizeof(uint64_t);
+	uint64_t *bits = (uint64_t *)(sctx->buf + bit_offset);
+	unsigned int partial = sctx->count % SHA256_BLOCK_SIZE;
+
+	sctx->buf[partial++] = 0x80;
+	if (partial > bit_offset) {
+		memset(sctx->buf + partial, 0x0, SHA256_BLOCK_SIZE - partial);
+		partial = 0;
+
+		block_fn(sctx, sctx->buf, 1);
+	}
+
+	memset(sctx->buf + partial, 0x0, bit_offset - partial);
+	*bits = cpu_to_be64(sctx->count << 3);
+	block_fn(sctx, sctx->buf, 1);
+
+	return 0;
+}
+
+static inline int lib_sha256_base_finish(struct sha256_state *sctx, uint8_t *out,
+					 unsigned int digest_size)
+{
+	uint32_t *digest = (uint32_t *)out;
+	int i;
+
+	for (i = 0; digest_size > 0; i++, digest_size -= sizeof(uint32_t))
+		*digest++ = cpu_to_be32(sctx->state[i]);
+
+	memzero_explicit(sctx, sizeof(*sctx));
+	return 0;
+}
+
+/*
+ * lib/crypto/sha256.c
+ *
+ * SHA-256, as specified in
+ * http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf
+ *
+ * SHA-256 code by Jean-Luc Cooke <jlcooke@certainkey.com>.
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ * Copyright (c) 2014 Red Hat Inc.
+ */
+static const uint32_t SHA256_K[] = {
+	0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
+	0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
+	0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
+	0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
+	0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
+	0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
+	0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
+	0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
+	0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
+	0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
+	0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
+	0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
+	0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
+	0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
+	0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
+	0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
+};
+
+static inline uint32_t Ch(uint32_t x, uint32_t y, uint32_t z)
+{
+	return z ^ (x & (y ^ z));
+}
+
+static inline uint32_t Maj(uint32_t x, uint32_t y, uint32_t z)
+{
+	return (x & y) | (z & (x | y));
+}
+
+#define e0(x)       (ror32(x, 2) ^ ror32(x, 13) ^ ror32(x, 22))
+#define e1(x)       (ror32(x, 6) ^ ror32(x, 11) ^ ror32(x, 25))
+#define s0(x)       (ror32(x, 7) ^ ror32(x, 18) ^ (x >> 3))
+#define s1(x)       (ror32(x, 17) ^ ror32(x, 19) ^ (x >> 10))
+
+static inline void LOAD_OP(int I, uint32_t *W, const uint8_t *input)
+{
+	W[I] = be32_to_cpu(*((__uint32_t *)input + I));
+}
+
+static inline void BLEND_OP(int I, uint32_t *W)
+{
+	W[I] = s1(W[I-2]) + W[I-7] + s0(W[I-15]) + W[I-16];
+}
+
+#define SHA256_ROUND(i, a, b, c, d, e, f, g, h) do {		\
+	uint32_t t1, t2;						\
+	t1 = h + e1(e) + Ch(e, f, g) + SHA256_K[i] + W[i];	\
+	t2 = e0(a) + Maj(a, b, c);				\
+	d += t1;						\
+	h = t1 + t2;						\
+} while (0)
+
+static void sha256_transform(uint32_t *state, const uint8_t *input, uint32_t *W)
+{
+	uint32_t a, b, c, d, e, f, g, h;
+	int i;
+
+	/* load the input */
+	for (i = 0; i < 16; i += 8) {
+		LOAD_OP(i + 0, W, input);
+		LOAD_OP(i + 1, W, input);
+		LOAD_OP(i + 2, W, input);
+		LOAD_OP(i + 3, W, input);
+		LOAD_OP(i + 4, W, input);
+		LOAD_OP(i + 5, W, input);
+		LOAD_OP(i + 6, W, input);
+		LOAD_OP(i + 7, W, input);
+	}
+
+	/* now blend */
+	for (i = 16; i < 64; i += 8) {
+		BLEND_OP(i + 0, W);
+		BLEND_OP(i + 1, W);
+		BLEND_OP(i + 2, W);
+		BLEND_OP(i + 3, W);
+		BLEND_OP(i + 4, W);
+		BLEND_OP(i + 5, W);
+		BLEND_OP(i + 6, W);
+		BLEND_OP(i + 7, W);
+	}
+
+	/* load the state into our registers */
+	a = state[0];  b = state[1];  c = state[2];  d = state[3];
+	e = state[4];  f = state[5];  g = state[6];  h = state[7];
+
+	/* now iterate */
+	for (i = 0; i < 64; i += 8) {
+		SHA256_ROUND(i + 0, a, b, c, d, e, f, g, h);
+		SHA256_ROUND(i + 1, h, a, b, c, d, e, f, g);
+		SHA256_ROUND(i + 2, g, h, a, b, c, d, e, f);
+		SHA256_ROUND(i + 3, f, g, h, a, b, c, d, e);
+		SHA256_ROUND(i + 4, e, f, g, h, a, b, c, d);
+		SHA256_ROUND(i + 5, d, e, f, g, h, a, b, c);
+		SHA256_ROUND(i + 6, c, d, e, f, g, h, a, b);
+		SHA256_ROUND(i + 7, b, c, d, e, f, g, h, a);
+	}
+
+	state[0] += a; state[1] += b; state[2] += c; state[3] += d;
+	state[4] += e; state[5] += f; state[6] += g; state[7] += h;
+}
+
+static void sha256_transform_blocks(struct sha256_state *sctx,
+				    const uint8_t *input, int blocks)
+{
+	uint32_t W[64];
+
+	do {
+		sha256_transform(sctx->state, input, W);
+		input += SHA256_BLOCK_SIZE;
+	} while (--blocks);
+
+	memzero_explicit(W, sizeof(W));
+}
+
+static void sha256_update(struct sha256_state *sctx, const uint8_t *data, unsigned int len)
+{
+	lib_sha256_base_do_update(sctx, data, len, sha256_transform_blocks);
+}
+
+static void __sha256_final(struct sha256_state *sctx, uint8_t *out, int digest_size)
+{
+	lib_sha256_base_do_finalize(sctx, sha256_transform_blocks);
+	lib_sha256_base_finish(sctx, out, digest_size);
+}
+
+static void sha256_final(struct sha256_state *sctx, uint8_t *out)
+{
+	__sha256_final(sctx, out, 32);
+}
+
+char *symhash_str(const char *name, size_t len, char hash_str[SYMHASH_STR_LEN])
+{
+	static const char hex[] = "0123456789abcdef";
+	uint8_t hash[SHA256_DIGEST_SIZE];
+	struct sha256_state sctx;
+	char *p = hash_str;
+
+	/*
+	 * If the symbol name has an initial dot, dedotify it before hashing to match
+	 * PPC64 behavior in arch/powerpc/kernel/module_64.c.
+	 */
+	if (name[0] == '.') {
+		name++;
+		len--;
+	}
+
+	sha256_init(&sctx);
+	sha256_update(&sctx, (const uint8_t *)name, len);
+	sha256_final(&sctx, hash);
+
+	/* Null-terminated prefix */
+	memcpy(p, SYMHASH_STR_PREFIX, SYMHASH_STR_PREFIX_LEN);
+	p += SYMHASH_STR_PREFIX_LEN;
+
+	/* Binary hash */
+	for (int i = 0; i < SHA256_DIGEST_SIZE; i++) {
+		*p++ = '\\';
+		*p++ = 'x';
+		*p++ = hex[(hash[i] & 0xf0) >> 4];
+		*p++ = hex[hash[i] & 0x0f];
+	}
+
+	hash_str[SYMHASH_STR_LEN - 1] = '\0';
+	return hash_str;
+}
-- 
2.45.2.627.g7a2c4fd464-goog


