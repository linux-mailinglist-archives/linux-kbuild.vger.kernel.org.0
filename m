Return-Path: <linux-kbuild+bounces-3790-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E479869B3
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 904221F22001
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87211A4E96;
	Wed, 25 Sep 2024 23:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sOdzlmeY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181AE1A4E7B
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307570; cv=none; b=oQAXRlAKVQMYsLSFXc577lnfx70edwNzn0IjiDBMpHq3KOgwhrZ6e7GWo08nlfIDxL+WtaI69Z+Lx6fW0pKFZuB90QV4Uu9gYGga6DsSJdJv3KIh6v5idAQtjJ3VDxHWpc0woi8iFbIqRzeztu16k2kd6gG4Pm/HFpjgyGUUN50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307570; c=relaxed/simple;
	bh=WRBs20XgxXhpGUNzmAuEPSHiJfsMkZEkGfwB5C4b2is=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FWrg7TLmdxMDoYZX5TVjeF5NxJ/mCUOqDJfbbP9ixwy4t3/S2Ttv8BkyJpaiCdf9l4aeSE5gj2OjqcadXrGOOyx7I3x5twcJdYNELVry+taq11M+2wQ+Pso0F/l53YbPxi17UjIKIgOl1b2TebdWM51oafraShfmWbFxIK3cDQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sOdzlmeY; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e20993a03dso7454157b3.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307568; x=1727912368; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=srrYfI2SZpfKgIsSq8ppkf2FykJu/mFy8hG5tlqb9h4=;
        b=sOdzlmeY6RY7bpo53PEnQ0YN0/YFAnlXxFf2ZyhVr/9gJ/T37wmWSna16Pm4dszRsH
         kCAibe8ECqUZozUmaxsJJ7+d2Dm5yeCNVIMbcVZ+mVHroq8zknRXG3i+PN0xMk0cBaAl
         KtHEwtBf/e0CK81PJDy1xFIO7XAHMNhTiQ2W/9CFH6eGGuFnl7J0a8aKwnum5Tbv3opT
         H9UqkbO+NemXGkTfLdo2ya2prR7OXRr+P0NBt/iqNlFXgahpRb5JTkG+yUnuAWhTJFTw
         LSeXIBkWlkFlvXCLqZPkHXV+roqA0hPB8PmXdgVn9JfShCTD4kB4LdafGD5WjtOjCYBu
         ZXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307568; x=1727912368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srrYfI2SZpfKgIsSq8ppkf2FykJu/mFy8hG5tlqb9h4=;
        b=cR/7c2vkCRkZ+pDrPIP0VS55J1I1e00rgvC1os5asQHEwVAwff7DH8GSx1OnZNYeC0
         ssM79qXWZg5Y8S/MBWfFgfo/2t0eSiFjBAbxsG5yONGv/i/1SM9BS+5d64frJ+w2eh7T
         ZyLcP0mgc0AC6tE1oIkG09jCXv+lgCL2sBcMomzVIOizD8iJJihKUFF1uRvsE5zSNkpa
         Rr7HS1ygDgL5b8A1WJUcT7wNtvMilTJqiFp88yoI/VWjL8hLO+Tt/a7h2xfgQ42QQgOS
         LQ8iFWOw1jwPztWrmn+8vdTmHsbOtDZEiuLmIDUPvs1++8AAmi3DwE+h1I15xAni/pV3
         lbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj9vEX77wO5k/AEFXhYh7hmFOb5TTK/nUzyD6KHnJn+8s95tZf+yevjmbs43zMdtdrf/C49+KDeH3hwuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5l9mgU+lGzYaxrohsFjJPL39iL729YDBZu48PJ7XvGx+I3K6/
	I5c3FxGDscS7KTxAEgkaJlDJF2pAuVk9gQG2/HQh3SJyB/I3k3R2RU954Gq0c51EfvgqXOTNkMc
	ZeAklAw==
X-Google-Smtp-Source: AGHT+IFULUhyTdpe6K1NKJ4iYoAXDGeSnRiSbmRLHEzsKyUqZwAanm3jLnuYHrgujVpMDbLQEh9f4w7q22Vi
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:c9c:b0:6b0:d571:3540 with SMTP id
 00721157ae682-6e21da796e6mr397427b3.6.1727307567956; Wed, 25 Sep 2024
 16:39:27 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:18 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-4-mmaurer@google.com>
Subject: [PATCH v5 03/16] module: Factor out elf_validity_cache_sechdrs
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Factor out and document the validation of section headers.

Because we now validate all section offsets and lengths before accessing
them, we can remove the ad-hoc checks.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 125 ++++++++++++++++++++++++++++---------------
 1 file changed, 82 insertions(+), 43 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 59c977acfb44..1f3a07ee59c6 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1708,6 +1708,87 @@ static int elf_validity_ehdr(const struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_sechdrs() - Cache section headers if valid
+ * @info: Load info to compute section headers from
+ *
+ * Checks:
+ *
+ * * ELF header is valid (see elf_validity_ehdr())
+ * * Section headers are the size we expect
+ * * Section array fits in the user provided data
+ * * Section index 0 is NULL
+ * * Section contents are inbounds
+ *
+ * Then updates @info with a &load_info->sechdrs pointer if valid.
+ *
+ * Return: %0 if valid, negative error code if validation failed.
+ */
+static int elf_validity_cache_sechdrs(struct load_info *info)
+{
+	Elf_Shdr *sechdrs;
+	Elf_Shdr *shdr;
+	int i;
+	int err;
+
+	err = elf_validity_ehdr(info);
+	if (err < 0)
+		return err;
+
+	if (info->hdr->e_shentsize != sizeof(Elf_Shdr)) {
+		pr_err("Invalid ELF section header size\n");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * e_shnum is 16 bits, and sizeof(Elf_Shdr) is
+	 * known and small. So e_shnum * sizeof(Elf_Shdr)
+	 * will not overflow unsigned long on any platform.
+	 */
+	if (info->hdr->e_shoff >= info->len
+	    || (info->hdr->e_shnum * sizeof(Elf_Shdr) >
+		info->len - info->hdr->e_shoff)) {
+		pr_err("Invalid ELF section header overflow\n");
+		return -ENOEXEC;
+	}
+
+	sechdrs = (void *)info->hdr + info->hdr->e_shoff;
+
+	/*
+	 * The code assumes that section 0 has a length of zero and
+	 * an addr of zero, so check for it.
+	 */
+	if (sechdrs[0].sh_type != SHT_NULL
+	    || sechdrs[0].sh_size != 0
+	    || sechdrs[0].sh_addr != 0) {
+		pr_err("ELF Spec violation: section 0 type(%d)!=SH_NULL or non-zero len or addr\n",
+		       sechdrs[0].sh_type);
+		return -ENOEXEC;
+	}
+
+	/* Validate contents are inbounds */
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		shdr = &sechdrs[i];
+		switch (shdr->sh_type) {
+		case SHT_NULL:
+		case SHT_NOBITS:
+			/* No contents, offset/size don't mean anything */
+			continue;
+		default:
+			err = validate_section_offset(info, shdr);
+			if (err < 0) {
+				pr_err("Invalid ELF section in module (section %u type %u)\n",
+				       i, shdr->sh_type);
+				return err;
+			}
+		}
+	}
+
+	info->sechdrs = sechdrs;
+
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1737,29 +1818,10 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	unsigned int num_info_secs = 0, info_idx;
 	unsigned int num_sym_secs = 0, sym_idx;
 
-	err = elf_validity_ehdr(info);
+	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
 		return err;
 
-	if (info->hdr->e_shentsize != sizeof(Elf_Shdr)) {
-		pr_err("Invalid ELF section header size\n");
-		goto no_exec;
-	}
-
-	/*
-	 * e_shnum is 16 bits, and sizeof(Elf_Shdr) is
-	 * known and small. So e_shnum * sizeof(Elf_Shdr)
-	 * will not overflow unsigned long on any platform.
-	 */
-	if (info->hdr->e_shoff >= info->len
-	    || (info->hdr->e_shnum * sizeof(Elf_Shdr) >
-		info->len - info->hdr->e_shoff)) {
-		pr_err("Invalid ELF section header overflow\n");
-		goto no_exec;
-	}
-
-	info->sechdrs = (void *)info->hdr + info->hdr->e_shoff;
-
 	/*
 	 * Verify if the section name table index is valid.
 	 */
@@ -1772,11 +1834,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	}
 
 	strhdr = &info->sechdrs[info->hdr->e_shstrndx];
-	err = validate_section_offset(info, strhdr);
-	if (err < 0) {
-		pr_err("Invalid ELF section hdr(type %u)\n", strhdr->sh_type);
-		return err;
-	}
 
 	/*
 	 * The section name table must be NUL-terminated, as required
@@ -1793,18 +1850,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 		goto no_exec;
 	}
 
-	/*
-	 * The code assumes that section 0 has a length of zero and
-	 * an addr of zero, so check for it.
-	 */
-	if (info->sechdrs[0].sh_type != SHT_NULL
-	    || info->sechdrs[0].sh_size != 0
-	    || info->sechdrs[0].sh_addr != 0) {
-		pr_err("ELF Spec violation: section 0 type(%d)!=SH_NULL or non-zero len or addr\n",
-		       info->sechdrs[0].sh_type);
-		goto no_exec;
-	}
-
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &info->sechdrs[i];
 		switch (shdr->sh_type) {
@@ -1823,12 +1868,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 			sym_idx = i;
 			fallthrough;
 		default:
-			err = validate_section_offset(info, shdr);
-			if (err < 0) {
-				pr_err("Invalid ELF section in module (section %u type %u)\n",
-					i, shdr->sh_type);
-				return err;
-			}
 			if (strcmp(info->secstrings + shdr->sh_name,
 				   ".gnu.linkonce.this_module") == 0) {
 				num_mod_secs++;
-- 
2.46.1.824.gd892dcdcdd-goog


