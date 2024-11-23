Return-Path: <linux-kbuild+bounces-4812-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D049D673F
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 03:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 394BC2827FF
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 02:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237D317084F;
	Sat, 23 Nov 2024 02:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ig8rq8cF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9481B6F099
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329744; cv=none; b=aTY/KsDoyZLgySF/w8nWmItC58/8weR+X44rn5fhQkzAUvpI17afm8ZQhjjT9GQ8RCy/2OlHoLa7VJyO3cQFXIKy49QmJDspdUH473dLA0KwqUXbqxbi/4OOnLN9onWZ/dZG8QsJXctFhvvs9f7kOAOZXWB27lNFIXnSOVpHSUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329744; c=relaxed/simple;
	bh=5ngwflngr6VwCJwhGVHtOhkC5EcEksG3ObajLDICFeY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XwnVUk7U1jKHQKWjU+7nU8uK5LjShgNp0Yi4yjT3XI6QxtHYIKpVJqmBpn9D9V/PpKLb3LwhbRh+q2BhBSYa76PgyOmHN2MwzDt1IXWS79QEkGVW9J/Mw7YxljohUzs1FY4VkcRA5z4oCEkzLotCvrVCSzfTkFazpCjlxOx3Qs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ig8rq8cF; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e3859de1c11so4979157276.1
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2024 18:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732329739; x=1732934539; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3Yg/eUXVo0xoK0aOhjxOTpuvvgxkC5HtYT7/oJpLwk=;
        b=ig8rq8cF+kIvXAJVnucpPBv1WGw89Y43lMxpaNy+YiHdUw1Ho20MlbSomTaQ12T1/Y
         RgQDr22SF++4y0MLN2+QGWkfDTd58TCv1Qj/3MDFvimEdh5gPXA8NA1JkO6S5jxo+i7d
         ctbZNe+AY7Q0sTvT8AzuoRFHsaEx3ois/IOOq/3ai3gCEU2UpTjbVT2vbOt3Q89W6HMM
         3oH318nAEL3sATI5woxNr+HurjrkI783Omc91WmO+beF7eXYmamUMAZC1HY/vQIBFhst
         HFXLQqHsy/ewcR3ZG4rYbwDoHnxPun9Ga452dVJ4uYZQ9AQZpfD6zlCIR8kmOtj5f9ag
         JbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329739; x=1732934539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3Yg/eUXVo0xoK0aOhjxOTpuvvgxkC5HtYT7/oJpLwk=;
        b=tUS1EZTnL4z04tmpNfaA7UAkZCeRHb77FfO7JjkDmUr9Ov9UWk01wM/rn+wlmVzKwN
         8fyOO+UwhbZ8pu3aMAGFZLkKhKb2AlXweTenVZMeKdfbS82sYU4KLEKhsav3aKYrVN+4
         yS7LiCBZAaky8hLxxo7ZkitgTbvg7wa43xcpGuGDgwTaV4c6zSxLil2rZPZpO8tu5iQk
         0BcaF+333l2vjM7xbo5Wdr/OYX0XGFDmnUaKDSPpaH6MxikIrN57mDo0exAyZr65R0/z
         +4Oeml+sYA7zFrvNqVFDuYhjLuMZwuFW2KVuE5gVNtXS1EfsKzRP6yhpamKMG0DFbOSu
         WVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvs5kQASUhP7WJ55ZMegR9EsQfMLyVa3yQ65EWfPBdIgMqHyYRgapYc/2Dpv5Z/PrEQZ/XTBPTd8X55Eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzeKGRhF66lm1SquzTtv6tAfDJL4sDoIWozCf6b3fXNi9K4AE5
	jx2qHVjzw031UwH7opUibc+U3WSL4HyqEwNfyTB2WZhqQ83mtRbyvs3ox3e8UowqTS73Fd5VX7c
	PF9icOQ==
X-Google-Smtp-Source: AGHT+IEkVuc3Ebc3Q22/XMeJkn1YabjXuV9YDXXzVWYJ5m+RKAXnTB6vhuB03oocUY7EAbqeuaEPkaeEO5gz
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:aa54:0:b0:e30:d561:dad4 with SMTP id
 3f1490d57ef6-e38f8ae48f9mr2941276.2.1732329739639; Fri, 22 Nov 2024 18:42:19
 -0800 (PST)
Date: Sat, 23 Nov 2024 02:42:15 +0000
In-Reply-To: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v10-1-0fa754ffdee3@google.com>
Subject: [PATCH v10 1/5] modules: Support extended MODVERSIONS info
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

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

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 arch/powerpc/kernel/module_64.c | 24 ++++++++++-
 kernel/module/internal.h        | 11 +++++
 kernel/module/main.c            | 92 +++++++++++++++++++++++++++++++++++++----
 kernel/module/version.c         | 45 ++++++++++++++++++++
 4 files changed, 162 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 45dac7b46aa3cdcb2058a2320b88c0d67e5586b3..34a5aec4908fba3b91a02e914264cb525918942a 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -369,6 +369,24 @@ static void dedotify_versions(struct modversion_info *vers,
 		}
 }
 
+/* Same as normal versions, remove a leading dot if present. */
+static void dedotify_ext_version_names(char *str_seq, unsigned long size)
+{
+	unsigned long out = 0;
+	unsigned long in;
+	char last = '\0';
+
+	for (in = 0; in < size; in++) {
+		/* Skip one leading dot */
+		if (last == '\0' && str_seq[in] == '.')
+			in++;
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
@@ -438,10 +456,12 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
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
index daef2be8390222c22220e2f168baa8d35ad531b9..59959c21b205bf91c0073260885743098c4022cf 100644
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
index 5399c182b3cbed2dbeea0291f717f30358d8e7fc..5b5ce391d68529ecd778a93f1214e74136e53501 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2073,6 +2073,82 @@ static int elf_validity_cache_index_str(struct load_info *info)
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
@@ -2087,9 +2163,7 @@ static int elf_validity_cache_index_str(struct load_info *info)
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
@@ -2112,11 +2186,9 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
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
 
@@ -2327,6 +2399,10 @@ static int rewrite_section_headers(struct load_info *info, int flags)
 
 	/* Track but don't keep modinfo and version sections. */
 	info->sechdrs[info->index.vers].sh_flags &= ~(unsigned long)SHF_ALLOC;
+	info->sechdrs[info->index.vers_ext_crc].sh_flags &=
+		~(unsigned long)SHF_ALLOC;
+	info->sechdrs[info->index.vers_ext_name].sh_flags &=
+		~(unsigned long)SHF_ALLOC;
 	info->sechdrs[info->index.info].sh_flags &= ~(unsigned long)SHF_ALLOC;
 
 	return 0;
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e9d537a9e95ff97728a51fad0e797..c246d40879706d4f413fa7ea9bbe2264ea1b2aa8 100644
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
@@ -87,6 +104,34 @@ int same_magic(const char *amagic, const char *bmagic,
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
+	if (crc_idx == 0 || name_idx == 0) {
+		start->remaining = 0;
+		return;
+	}
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
2.47.0.371.ga323438b13-goog


