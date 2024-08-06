Return-Path: <linux-kbuild+bounces-2849-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D498949A0D
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FDD61C2178C
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C844176FDB;
	Tue,  6 Aug 2024 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QbNpu8Hm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB644176ADF
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979288; cv=none; b=GbiYnZsiDiYxiDdxGC0zqb0HKDVLL1JWu9U8W809rHI8+0nHUlwFgC4Jl5ehgMf01/Xi4Yf9glBS7sRbuHSzNyOAkhxYxwR8wgZJ+XjTE11d6JbM35KDLyj+oW9iYGiTpWhHEyLHCFcuCFIQ/6R60QcBZflCd4OXf9SVm7c4K84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979288; c=relaxed/simple;
	bh=AvV1Bn9k49Kipk9uw0nnfUkau+9M6JCC4wTdPYZCn98=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oySgh2mvQHwf4zueIX1ZVcFSVpqxrLwtg9DqV+xXk1RU7veDzsKwtfF9W7L4buJMr7ogKykJ9Ym4gYchEZcddA3eF4UnVK1b/dzXwNY7FSlrxRvmFnKYg3HinVa3A+Ba0LmzZIkxRb66Xy80xcd/k4SNN+wZwK5i9GKcki03OjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QbNpu8Hm; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-66619cb2d3eso26087997b3.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979285; x=1723584085; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sli/LxDmVK7sExv83Tn50ATiFYlxgRbD5DaeK91AEbk=;
        b=QbNpu8HmSdcYKH9PnSH7AA+SkGXijWO30a0BLLVHIeb9/82OH58rIcwxi13MCzPFrS
         efItgLzRpWUF+5T/xgJmEOiqr6fryQ3uYZ0Jy9WjIQy3tpdvKSgrrx3iL+TXb8rxh7gW
         JIo8k//AsrIvwyCfPkVLaiysN/nRMkvOpxjsaeZWHFZ5SHGaW8mOqS/ol9ffVzjrztm1
         B5kqh+pM2BV5QIa8wqZvd91i+PpGEy1LY3i+etHB4t6yfRbIf0iKqPA708FLjNBTQxOa
         P32veySdpx7zErAOGDJOlKEP60sGTxOovBjhcWtTRxKo5Fzl76vmSELvwA8it6cjHN53
         kSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979285; x=1723584085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sli/LxDmVK7sExv83Tn50ATiFYlxgRbD5DaeK91AEbk=;
        b=MLuezs0i0uMBCC3SQJMqJaLdPLiJG6xmhRDwVdvhRB9/L8hICaVpPGfvCrSodXktpP
         erof5PERWG0sWQH+Cbm6EHF8BVHA5HwzNpwTX68Fek95oWL+IQzqkGrSQ7jbHfHocsYm
         srOarqRMYLtfMNs8dhstedvmWNa3FkgU4W1HG/hE5i3E4O8U+UUORsgCejfXOtXEh3Dv
         xSBI/nIbaxnj4NLKNuwA5yIr76nFDw9c+7Dz1q8/8I0+DwH+e4lc5HoH+Qa2l0uoclwz
         qbi1xUbeU8yculXCeVELYRap2AbPGpUNRiF0BHbAfkezQ7xyAkJs7em1ASBhq7njJmsy
         EAug==
X-Forwarded-Encrypted: i=1; AJvYcCVsX3565ZEjN7S2NODjy04C4w5A2o2LcrSbaiJaHzxLo4Ov5IBBJp17g+ReZxvdgRRGT3zc2CmTiepq7+OarYSlZfS9oNClG3MhYMm4
X-Gm-Message-State: AOJu0YxQhXXnV1pQi0q1lFnKZuM45HITGIISu2z62FxZ/ixGuUQmFKMI
	0LUprTxJfQHS1+u9afcVJXFPxjLcP/WJuAc9Jq3aieXoGB8f/IwHz3ZwuAWc0FZuoTCVuLPxWKj
	qU5g4CQ==
X-Google-Smtp-Source: AGHT+IH4u4TnfmwmFVPoyUjm9b+0lr0KubUujePWykRTF5KEnkidiOfqfkDcnadas9BbmmYCG++qvZnouRNY
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:b287:0:b0:68d:52a1:bed with SMTP id
 00721157ae682-68d52a10e65mr3687567b3.1.1722979284770; Tue, 06 Aug 2024
 14:21:24 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:33 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-8-mmaurer@google.com>
Subject: [PATCH v3 07/16] module: Factor out elf_validity_cache_index_sym
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

Centralize symbol table detection and property validation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 73 ++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 281cc1a7dee6..53597b785e2a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1980,6 +1980,39 @@ static int elf_validity_cache_index_mod(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_sym() - Validate and cache symtab index
+ * @info: Load info to cache symtab index in.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *
+ * Checks that there is exactly one symbol table, then caches its index in
+ * &load_info->index.sym.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_sym(struct load_info *info)
+{
+	unsigned int sym_idx;
+	unsigned int num_sym_secs = 0;
+	int i;
+
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		if (info->sechdrs[i].sh_type == SHT_SYMTAB) {
+			num_sym_secs++;
+			sym_idx = i;
+		}
+	}
+
+	if (num_sym_secs != 1) {
+		pr_warn("%s: module has no symbols (stripped?)\n",
+			info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	info->index.sym = sym_idx;
+
+	return 0;
+}
 
 /*
  * Check userspace passed ELF module against our expectations, and cache
@@ -2003,10 +2036,8 @@ static int elf_validity_cache_index_mod(struct load_info *info)
  */
 static int elf_validity_cache_copy(struct load_info *info, int flags)
 {
-	unsigned int i;
-	Elf_Shdr *shdr;
 	int err;
-	unsigned int num_sym_secs = 0, sym_idx;
+	int str_idx;
 
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
@@ -2018,34 +2049,21 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	if (err < 0)
 		return err;
 	err = elf_validity_cache_index_mod(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_sym(info);
 	if (err < 0)
 		return err;
 
-	for (i = 1; i < info->hdr->e_shnum; i++) {
-		shdr = &info->sechdrs[i];
-		if (shdr->sh_type == SHT_SYMTAB) {
-			if (shdr->sh_link == SHN_UNDEF
-			    || shdr->sh_link >= info->hdr->e_shnum) {
-				pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
-				       shdr->sh_link, shdr->sh_link,
-				       info->hdr->e_shnum);
-				goto no_exec;
-			}
-			num_sym_secs++;
-			sym_idx = i;
-		}
-	}
-
-	if (num_sym_secs != 1) {
-		pr_warn("%s: module has no symbols (stripped?)\n",
-			info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
+	str_idx = info->sechdrs[info->index.sym].sh_link;
+	if (str_idx == SHN_UNDEF || str_idx >= info->hdr->e_shnum) {
+		pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
+				str_idx, str_idx, info->hdr->e_shnum);
+		return -ENOEXEC;
 	}
 
-	/* Sets internal symbols and strings. */
-	info->index.sym = sym_idx;
-	shdr = &info->sechdrs[sym_idx];
-	info->index.str = shdr->sh_link;
+	/* Sets internal strings. */
+	info->index.str = str_idx;
 	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
 
 	/* This is temporary: point mod into copy of data. */
@@ -2066,9 +2084,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	info->index.pcpu = find_pcpusec(info);
 
 	return 0;
-
-no_exec:
-	return -ENOEXEC;
 }
 
 #define COPY_CHUNK_SIZE (16*PAGE_SIZE)
-- 
2.46.0.rc2.264.g509ed76dc8-goog


