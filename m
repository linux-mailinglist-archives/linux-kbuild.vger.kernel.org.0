Return-Path: <linux-kbuild+bounces-2856-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71097949A22
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 942F21C20902
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D5D17B42E;
	Tue,  6 Aug 2024 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qyTc4dyw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6042716F8EB
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979313; cv=none; b=LZkA3CzlNv58vja0QMiRZRWkw8tUX5mgxYlONTMQpkPuI3JJsO2/pjSiPMpH082XpHXlTnVfJtEISpfyydLftGBnQ7v0esboCTChJNaisFt3KbNZkbRVxyIuOdXkb8Q0PqUfBwgc1CQob/Buj4ZryKjCWiqBKJBcFCenRlsRID4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979313; c=relaxed/simple;
	bh=OswgxDWTa55L+1zZkUErnYlQZn1Fa4uk4LxSWyaehiQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D9dZJbSlHIiADFEVpP9I5zYmnCjSPinVwP+Roq4hBAZSpvJPzzqlL77E4Ss0OoYrzO2e3x06wfftU91p1xN661RZ+6yKWkyqJdSec+DeIzuYeXf0Wr//9H/Ae3pHPTm07Np8Iuhnn4YW719huISNJQVoY9ggs7zasuwppoaUTZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qyTc4dyw; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-690404fd34eso21427497b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 14:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979309; x=1723584109; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pjzv2o1pGFL72L2jPXF4pC1JexSHrGaXygPeqnIttk=;
        b=qyTc4dyw1/G7xKikmkIS/L328mKsbfk6ele84qvPBzxjgJELsQ65mzsLw6hOZoqr9/
         wAg8xNakBQYsLX63iLXzuzjh3o4a86aMNRhaSdkfiHq4g2k18ZPwdsBzAcl60MpdND/F
         RJMCMCRZRUiDhC6hD33rWRXQGdfTIvIXvLNpHrt72URivkYcUWZKAnPnCWJKhmgRCR9v
         df9Q9ShI3rGzb+wF1Vsth1u61w/EaEwR2N0vF+wGrFUi0JJNKeZT3xNghvS/00xPp/sw
         /nof0nuh/QqE15rd4icBrL7kCsEMetSok1ZI9lNHaxVoJcyYiu+HLbYk2sE0A1NZny35
         x7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979309; x=1723584109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pjzv2o1pGFL72L2jPXF4pC1JexSHrGaXygPeqnIttk=;
        b=aepkW1l9M92xK+t8XEOuA9NgZceZ0iwa+1wC4IUQbStX9w9liu+y0EvY3P9MWM9yHC
         bknY+oZTCRCEceXjS4/WGi+6ijGyU7jarLdZLiqDb0GMUEIMbKgFm5JcKjOIlIYgj5Fx
         hyV0DnNWsO1vIk7zQ3t0rsGcVd6VvZ6qi8wDZ2azOHuLDsx2HAR8LTJ/1VsJR5ksbs0r
         5kC7Ze+3YVu3jtvKs2BX3HEIkBtjIKhWKFPJL1UmuVyD5Y21DW0TK/659Oltc5hvyNWG
         8Zjp2mxyOrGcMz8tq/32Gn3vhhFl2gezvmbh5BpFt4Z/dPHWY4yjZ0V+uE0H/Ry0/Be2
         R1yw==
X-Forwarded-Encrypted: i=1; AJvYcCU4CCwBJAEEbkm6MVJrk7sbwWMbJBf0+omprJbvCiUrJGGW8p+vMxtpaEcM1UZXtKPl5XNDFNmY2hQJjvFjt3OAmkWHtuRy0TpT/PTn
X-Gm-Message-State: AOJu0YwEnaGZv+PzzaRY+WK/3F4t8kDfC415p5YyyopQ/a9SJhPtTjkW
	fQxFq+vr4EjywSojUXfwIkAPJVnsV3M3YqigDFdCHWperiedl59zmCJUIKDzOBtFN9VUXimmLoy
	t9d3zEQ==
X-Google-Smtp-Source: AGHT+IFAM+K/NZck3gM4CB8LcvI2kRlOKgjyZEZ+99ZAkay8tk5d82IgaCIjy1BoHlYHZxv0xB/3Pvt6hog7
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:298:b0:62d:1142:83a5 with SMTP id
 00721157ae682-68964b5a5f9mr2751267b3.8.1722979309476; Tue, 06 Aug 2024
 14:21:49 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:40 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-15-mmaurer@google.com>
Subject: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Matthew Maurer <mmaurer@google.com>, 
	Naveen N Rao <naveen@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Adds a new format for MODVERSIONS which stores each field in a separate
ELF section. This initially adds support for variable length names, but
could later be used to add additional fields to MODVERSIONS in a
backwards compatible way if needed. Any new fields will be ignored by
old user tooling, unlike the current format where user tooling cannot
tolerate adjustments to the format (for example making the name field
longer).

Since PPC munges its version records to strip leading dots, we reproduce
the munging for the new format. Other architectures do not appear to
have architecture-specific usage of this information.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 arch/powerpc/kernel/module_64.c | 24 ++++++++-
 kernel/module/internal.h        | 11 ++++
 kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++---
 kernel/module/version.c         | 43 +++++++++++++++
 4 files changed, 160 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7112adc597a8..15b74c9a1df1 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -355,6 +355,24 @@ static void dedotify_versions(struct modversion_info *vers,
 		}
 }
 
+static void dedotify_ext_version_names(char *str_seq, unsigned long size)
+{
+	unsigned long out = 0;
+	unsigned long in;
+	char last = '\0';
+
+	for (in = 0; in < size; in++) {
+		if (last == '\0')
+			/* Skip all leading dots */
+			if (str_seq[in] == '.')
+				continue;
+		last = str_seq[in];
+		str_seq[out++] = last;
+	}
+	/* Zero the trailing portion of the names table for robustness */
+	memset(&str_seq[out], 0, size - out);
+}
+
 /*
  * Undefined symbols which refer to .funcname, hack to funcname. Make .TOC.
  * seem to be defined (value set later).
@@ -424,10 +442,12 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 			me->arch.toc_section = i;
 			if (sechdrs[i].sh_addralign < 8)
 				sechdrs[i].sh_addralign = 8;
-		}
-		else if (strcmp(secstrings+sechdrs[i].sh_name,"__versions")==0)
+		} else if (strcmp(secstrings + sechdrs[i].sh_name, "__versions") == 0)
 			dedotify_versions((void *)hdr + sechdrs[i].sh_offset,
 					  sechdrs[i].sh_size);
+		else if (strcmp(secstrings + sechdrs[i].sh_name, "__version_ext_names") == 0)
+			dedotify_ext_version_names((void *)hdr + sechdrs[i].sh_offset,
+						   sechdrs[i].sh_size);
 
 		if (sechdrs[i].sh_type == SHT_SYMTAB)
 			dedotify((void *)hdr + sechdrs[i].sh_offset,
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index daef2be83902..59959c21b205 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -86,6 +86,8 @@ struct load_info {
 		unsigned int vers;
 		unsigned int info;
 		unsigned int pcpu;
+		unsigned int vers_ext_crc;
+		unsigned int vers_ext_name;
 	} index;
 };
 
@@ -389,6 +391,15 @@ void module_layout(struct module *mod, struct modversion_info *ver, struct kerne
 		   struct kernel_symbol *ks, struct tracepoint * const *tp);
 int check_modstruct_version(const struct load_info *info, struct module *mod);
 int same_magic(const char *amagic, const char *bmagic, bool has_crcs);
+struct modversion_info_ext {
+	size_t remaining;
+	const s32 *crc;
+	const char *name;
+};
+void modversion_ext_start(const struct load_info *info, struct modversion_info_ext *ver);
+void modversion_ext_advance(struct modversion_info_ext *ver);
+#define for_each_modversion_info_ext(ver, info) \
+	for (modversion_ext_start(info, &ver); ver.remaining > 0; modversion_ext_advance(&ver))
 #else /* !CONFIG_MODVERSIONS */
 static inline int check_version(const struct load_info *info,
 				const char *symname,
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 7001054c5c4f..ba63ea1b6ad5 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2039,6 +2039,82 @@ static int elf_validity_cache_index_str(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_versions() - Validate and cache version indices
+ * @info:  Load info to cache version indices in.
+ *         Must have &load_info->sechdrs and &load_info->secstrings populated.
+ * @flags: Load flags, relevant to suppress version loading, see
+ *         uapi/linux/module.h
+ *
+ * If we're ignoring modversions based on @flags, zero all version indices
+ * and return validity. Othewrise check:
+ *
+ * * If "__version_ext_crcs" is present, "__version_ext_names" is present
+ * * There is a name present for every crc
+ *
+ * Then populate:
+ *
+ * * &load_info->index.vers
+ * * &load_info->index.vers_ext_crc
+ * * &load_info->index.vers_ext_names
+ *
+ * if present.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_versions(struct load_info *info, int flags)
+{
+	unsigned int vers_ext_crc;
+	unsigned int vers_ext_name;
+	size_t crc_count;
+	size_t remaining_len;
+	size_t name_size;
+	char *name;
+
+	/* If modversions were suppressed, pretend we didn't find any */
+	if (flags & MODULE_INIT_IGNORE_MODVERSIONS) {
+		info->index.vers = 0;
+		info->index.vers_ext_crc = 0;
+		info->index.vers_ext_name = 0;
+		return 0;
+	}
+
+	vers_ext_crc = find_sec(info, "__version_ext_crcs");
+	vers_ext_name = find_sec(info, "__version_ext_names");
+
+	/* If we have one field, we must have the other */
+	if (!!vers_ext_crc != !!vers_ext_name) {
+		pr_err("extended version crc+name presence does not match");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * If we have extended version information, we should have the same
+	 * number of entries in every section.
+	 */
+	if (vers_ext_crc) {
+		crc_count = info->sechdrs[vers_ext_crc].sh_size / sizeof(s32);
+		name = (void *)info->hdr +
+			info->sechdrs[vers_ext_name].sh_offset;
+		remaining_len = info->sechdrs[vers_ext_name].sh_size;
+
+		while (crc_count--) {
+			name_size = strnlen(name, remaining_len) + 1;
+			if (name_size > remaining_len) {
+				pr_err("more extended version crcs than names");
+				return -ENOEXEC;
+			}
+			remaining_len -= name_size;
+			name += name_size;
+		}
+	}
+
+	info->index.vers = find_sec(info, "__versions");
+	info->index.vers_ext_crc = vers_ext_crc;
+	info->index.vers_ext_name = vers_ext_name;
+	return 0;
+}
+
 /**
  * elf_validity_cache_index() - Resolve, validate, cache section indices
  * @info:  Load info to read from and update.
@@ -2053,9 +2129,7 @@ static int elf_validity_cache_index_str(struct load_info *info)
  * * elf_validity_cache_index_mod()
  * * elf_validity_cache_index_sym()
  * * elf_validity_cache_index_str()
- *
- * If versioning is not suppressed via flags, load the version index from
- * a section called "__versions" with no validation.
+ * * elf_validity_cache_index_versions()
  *
  * If CONFIG_SMP is enabled, load the percpu section by name with no
  * validation.
@@ -2078,11 +2152,9 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
 	err = elf_validity_cache_index_str(info);
 	if (err < 0)
 		return err;
-
-	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
-		info->index.vers = 0; /* Pretend no __versions section! */
-	else
-		info->index.vers = find_sec(info, "__versions");
+	err = elf_validity_cache_index_versions(info, flags);
+	if (err < 0)
+		return err;
 
 	info->index.pcpu = find_pcpusec(info);
 
@@ -2293,6 +2365,10 @@ static int rewrite_section_headers(struct load_info *info, int flags)
 
 	/* Track but don't keep modinfo and version sections. */
 	info->sechdrs[info->index.vers].sh_flags &= ~(unsigned long)SHF_ALLOC;
+	info->sechdrs[info->index.vers_ext_crc].sh_flags &=
+		~(unsigned long)SHF_ALLOC;
+	info->sechdrs[info->index.vers_ext_name].sh_flags &=
+		~(unsigned long)SHF_ALLOC;
 	info->sechdrs[info->index.info].sh_flags &= ~(unsigned long)SHF_ALLOC;
 
 	return 0;
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e..02d8340bdb57 100644
--- a/kernel/module/version.c
+++ b/kernel/module/version.c
@@ -19,11 +19,28 @@ int check_version(const struct load_info *info,
 	unsigned int versindex = info->index.vers;
 	unsigned int i, num_versions;
 	struct modversion_info *versions;
+	struct modversion_info_ext version_ext;
 
 	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
 	if (!crc)
 		return 1;
 
+	/* If we have extended version info, rely on it */
+	if (info->index.vers_ext_crc) {
+		for_each_modversion_info_ext(version_ext, info) {
+			if (strcmp(version_ext.name, symname) != 0)
+				continue;
+			if (*version_ext.crc == *crc)
+				return 1;
+			pr_debug("Found checksum %X vs module %X\n",
+				 *crc, *version_ext.crc);
+			goto bad_version;
+		}
+		pr_warn_once("%s: no extended symbol version for %s\n",
+			     info->name, symname);
+		return 1;
+	}
+
 	/* No versions at all?  modprobe --force does this. */
 	if (versindex == 0)
 		return try_to_force_load(mod, symname) == 0;
@@ -87,6 +104,32 @@ int same_magic(const char *amagic, const char *bmagic,
 	return strcmp(amagic, bmagic) == 0;
 }
 
+void modversion_ext_start(const struct load_info *info,
+			  struct modversion_info_ext *start)
+{
+	unsigned int crc_idx = info->index.vers_ext_crc;
+	unsigned int name_idx = info->index.vers_ext_name;
+	Elf_Shdr *sechdrs = info->sechdrs;
+
+	/*
+	 * Both of these fields are needed for this to be useful
+	 * Any future fields should be initialized to NULL if absent.
+	 */
+	if ((crc_idx == 0) || (name_idx == 0))
+		start->remaining = 0;
+
+	start->crc = (const s32 *)sechdrs[crc_idx].sh_addr;
+	start->name = (const char *)sechdrs[name_idx].sh_addr;
+	start->remaining = sechdrs[crc_idx].sh_size / sizeof(*start->crc);
+}
+
+void modversion_ext_advance(struct modversion_info_ext *vers)
+{
+	vers->remaining--;
+	vers->crc++;
+	vers->name += strlen(vers->name) + 1;
+}
+
 /*
  * Generate the signature for all relevant module structures here.
  * If these change, we don't want to try to parse the module.
-- 
2.46.0.rc2.264.g509ed76dc8-goog


