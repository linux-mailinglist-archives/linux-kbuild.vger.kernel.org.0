Return-Path: <linux-kbuild+bounces-2848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F152949A09
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F68BB24DCC
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EF4176FAE;
	Tue,  6 Aug 2024 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wI2Hp3BO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6617625F
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979286; cv=none; b=Hi/t9STxbOTaGRz4zHt4V0Buuj/rJcXWfdTWZer6fwXeuu5HKNbk7S0+M1KhGeyb/mFxzXNi4htzI7lYaHSaP1oYdvKP5uSEWPZ7tp9kj0eZjiex1b71k/hkMcV1AEFtLci4M/mVfw1Uezjn9FgayNtJxZhXRBHh90onkiJs3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979286; c=relaxed/simple;
	bh=DpODGGDdw4VGENbXmwIPTQlzlI8dT45WdYd+kuaOmaY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mlu57xbGBVJK8fjWrA82FDAk7sqG5fCk+YSGEZbJR8c4mJ6bo/O5bB3UFhC7ze9dLUA2pAn//OYQsJgpPjlQ59namP+tgBDYNxiSQUItkz4iiju7zRSlb1iRqTqRhXRZm98pt9YK1UGMvbmYAtQGItYrJTWdKHCW1MbEnbczlzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wI2Hp3BO; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-672bea19dd3so24935527b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979283; x=1723584083; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGjn9Z6t3I+4/9jyC+rVgONUQ3rpezka6Bxop+Eg6Nw=;
        b=wI2Hp3BOY1qmZ3v9idf6u0HoMSIkLAJ/72fakcvQIdx+UIzPFWZps+WweCjhOfzofe
         krFUwTcs+eblsw+PM0DLXY+BtAs7Zdf7Hf/YQTvHYGTeFDvCedzqzd8nGwQlQPZ3Tf99
         AJpn7PXvYlld/lYwB1nMpAhG4NXjt2NcLmJfGg1HQjB8Xcmt6rHfvSfLvowYco4YKZ5f
         j9Ww+TdXZUYIvmy2/lZ0ntLsgXXmzmOYrPciLIL/JkAxQUfZmirLHJHqelgIu8oqQydm
         IgjOeZqKVl2NZn6NY0jxfkz6EnxogLLNFuWvjABd/qBdK2k+4eRXi8o7Z6OdKUXa2RlH
         H+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979283; x=1723584083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGjn9Z6t3I+4/9jyC+rVgONUQ3rpezka6Bxop+Eg6Nw=;
        b=jv/t06fg4K3g3vFReckrrrgz3j5GFlctpxLcXsqoaSwLU4OBOTvEfeVBEUABCGHaU0
         RV/9n1TZZ0zksfhzzQFCjwU4XtV1ck/HzhqtIQOCXs9nm0H65diAJSBeE3/zFqX8+pbc
         db7sfl7bs/+JODN95eT1x6MmHjbUCP3ymsEO9qUtJ04ltXKhsNmJBaCZHPRhNfvKwoOw
         tLiEYB5pGB5J7nIRy3uqHfYLTi5AymMMTw4ewFZ5V/NXpv5K0a7ZLJ1Lf90eAIok+vj8
         Z2hGJyUDM46rJMuoP5BQfDD7tkxgcgwEYYYTJ0AhHwiFe/EdPs1Z6INf4O12o5LbDCqR
         e/yw==
X-Forwarded-Encrypted: i=1; AJvYcCWCW+lB8NuDsJyqsWcwAiuhrEvOrfTsJeTx69GQke1+YyZuf7c692RrrXXfYSbxrRihiwYxVEoSYzQmK/bV7s2yB2kF7SuZTyy3Bflq
X-Gm-Message-State: AOJu0YyJwIHcAsNWitrEdn1UxywRc3W9NLuT5LzfYT7YoGA2uEWcc4Zj
	b4LbslrfFNcsx7s3D8Cdgv2yPf6eUcwJmF8G8GVLNN4tHwF84D8sb3Tfp9n//pkWEtsWRcG4rdx
	tpvMq1w==
X-Google-Smtp-Source: AGHT+IFyCeNRyjHnqa3Pr4SiExKUtgZZoTIIoyrrFooy61j333PWvIbMWNrYvZteOAesuBL7Ip+0AcLQbPt0
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2513:b0:e05:6532:166 with SMTP id
 3f1490d57ef6-e0bde213c22mr58855276.1.1722979282834; Tue, 06 Aug 2024 14:21:22
 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:32 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-7-mmaurer@google.com>
Subject: [PATCH v3 06/16] module: Factor out elf_validity_cache_index_mod
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Centralize .gnu.linkonce.this_module detection and property validation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 129 ++++++++++++++++++++++---------------------
 1 file changed, 67 insertions(+), 62 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 61325a767645..281cc1a7dee6 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1919,6 +1919,68 @@ static int elf_validity_cache_index_info(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_mod() - Validates and caches this_module section
+ * @info: Load info to cache this_module on.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated
+ *
+ * The ".gnu.linkonce.this_module" ELF section is special. It is what modpost
+ * uses to refer to __this_module and let's use rely on THIS_MODULE to point
+ * to &__this_module properly. The kernel's modpost declares it on each
+ * modules's *.mod.c file. If the struct module of the kernel changes a full
+ * kernel rebuild is required.
+ *
+ * We have a few expectations for this special section, this function
+ * validates all this for us:
+ *
+ * * The section has contents
+ * * The section is unique
+ * * We expect the kernel to always have to allocate it: SHF_ALLOC
+ * * The section size must match the kernel's run time's struct module
+ *   size
+ *
+ * If all checks pass, the index will be cached in &load_info->index.mod
+ *
+ * Return: %0 on validation success, %-ENOEXEC on failure
+ */
+static int elf_validity_cache_index_mod(struct load_info *info)
+{
+	Elf_Shdr *shdr;
+	int mod_idx;
+
+	mod_idx = find_any_unique_sec(info, ".gnu.linkonce.this_module");
+	if (mod_idx <= 0) {
+		pr_err("module %s: Exactly one .gnu.linkonce.this_module section must exist.\n",
+		       info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	shdr = &info->sechdrs[mod_idx];
+
+	if (shdr->sh_type == SHT_NOBITS) {
+		pr_err("module %s: .gnu.linkonce.this_module section must have a size set\n",
+		       info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	if (!(shdr->sh_flags & SHF_ALLOC)) {
+		pr_err("module %s: .gnu.linkonce.this_module must occupy memory during process execution\n",
+		       info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	if (shdr->sh_size != sizeof(struct module)) {
+		pr_err("module %s: .gnu.linkonce.this_module section size must match the kernel's built struct module size at run time\n",
+		       info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	info->index.mod = mod_idx;
+
+	return 0;
+}
+
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1944,7 +2006,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	unsigned int i;
 	Elf_Shdr *shdr;
 	int err;
-	unsigned int num_mod_secs = 0, mod_idx;
 	unsigned int num_sym_secs = 0, sym_idx;
 
 	err = elf_validity_cache_sechdrs(info);
@@ -1954,16 +2015,15 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	if (err < 0)
 		return err;
 	err = elf_validity_cache_index_info(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_mod(info);
 	if (err < 0)
 		return err;
 
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &info->sechdrs[i];
-		switch (shdr->sh_type) {
-		case SHT_NULL:
-		case SHT_NOBITS:
-			continue;
-		case SHT_SYMTAB:
+		if (shdr->sh_type == SHT_SYMTAB) {
 			if (shdr->sh_link == SHN_UNDEF
 			    || shdr->sh_link >= info->hdr->e_shnum) {
 				pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
@@ -1973,14 +2033,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 			}
 			num_sym_secs++;
 			sym_idx = i;
-			fallthrough;
-		default:
-			if (strcmp(info->secstrings + shdr->sh_name,
-				   ".gnu.linkonce.this_module") == 0) {
-				num_mod_secs++;
-				mod_idx = i;
-			}
-			break;
 		}
 	}
 
@@ -1996,55 +2048,8 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	info->index.str = shdr->sh_link;
 	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
 
-	/*
-	 * The ".gnu.linkonce.this_module" ELF section is special. It is
-	 * what modpost uses to refer to __this_module and let's use rely
-	 * on THIS_MODULE to point to &__this_module properly. The kernel's
-	 * modpost declares it on each modules's *.mod.c file. If the struct
-	 * module of the kernel changes a full kernel rebuild is required.
-	 *
-	 * We have a few expectaions for this special section, the following
-	 * code validates all this for us:
-	 *
-	 *   o Only one section must exist
-	 *   o We expect the kernel to always have to allocate it: SHF_ALLOC
-	 *   o The section size must match the kernel's run time's struct module
-	 *     size
-	 */
-	if (num_mod_secs != 1) {
-		pr_err("module %s: Only one .gnu.linkonce.this_module section must exist.\n",
-		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
-
-	shdr = &info->sechdrs[mod_idx];
-
-	/*
-	 * This is already implied on the switch above, however let's be
-	 * pedantic about it.
-	 */
-	if (shdr->sh_type == SHT_NOBITS) {
-		pr_err("module %s: .gnu.linkonce.this_module section must have a size set\n",
-		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
-
-	if (!(shdr->sh_flags & SHF_ALLOC)) {
-		pr_err("module %s: .gnu.linkonce.this_module must occupy memory during process execution\n",
-		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
-
-	if (shdr->sh_size != sizeof(struct module)) {
-		pr_err("module %s: .gnu.linkonce.this_module section size must match the kernel's built struct module size at run time\n",
-		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
-
-	info->index.mod = mod_idx;
-
 	/* This is temporary: point mod into copy of data. */
-	info->mod = (void *)info->hdr + shdr->sh_offset;
+	info->mod = (void *)info->hdr + info->sechdrs[info->index.mod].sh_offset;
 
 	/*
 	 * If we didn't load the .modinfo 'name' field earlier, fall back to
-- 
2.46.0.rc2.264.g509ed76dc8-goog


