Return-Path: <linux-kbuild+bounces-3710-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D2984CAF
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 23:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D141C22D3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3390113BAE3;
	Tue, 24 Sep 2024 21:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="03r5Q9Gp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736A14831E
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 21:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212840; cv=none; b=gelcvjSlHrJoLdU+aLs65ARhAKi0L1j4VlOmUaD/kyBS6FBcwbBD0Qr2pQSujRA8clrifuKVuQR5HltjYJCFJKlH3DrroKr5OsBOZiLqHc3uP/Zbt5VvTQmJ2wTep574XWz3BJBALf4VsMlRwhH8nvIq+T2XkBWGuzWJVqJiJVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212840; c=relaxed/simple;
	bh=WRBs20XgxXhpGUNzmAuEPSHiJfsMkZEkGfwB5C4b2is=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DwWxM0aoN/fTlPd+O9C9koAkMTZXDa/DegIdgbrNhNoNcHeusvhO0CzqiL3P4DHhE1U2nyYGRx9EB1wpwJRlI3A+Z6C46RzHlTIaY86Tm/VvM0RQMRdq1OY8UCT1susFPVpGhHNwRIEKlkQEiuRKMQaf6O+wxZbX9+VQZM2/3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=03r5Q9Gp; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02a4de4f4eso10338910276.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 14:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212837; x=1727817637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=srrYfI2SZpfKgIsSq8ppkf2FykJu/mFy8hG5tlqb9h4=;
        b=03r5Q9Gpsun/qPpw4mSB/a5luURJ5Z7sKak8s7Rx/K63c2sDttQsBFfsAJFPlpjBZu
         Bq3C4YqZeabp2pZZeoU+h7sTK5i7p/EvOvhetT9Lbn56HJJs49lYE2uTc9ILHRLgPmI8
         PQYuWox0KhrIjSw5k1cLem9vaURkKvzL+A+/c9VYur2XjzKSpfWFF4mI/HjAJHV9wT2X
         YC0SVJ/ZItxCTQuJCIP6QOyEAxJl8l9G20nYC7oP2DF6nJvJCjIgBvMXJP+Kc1ZjPXoQ
         U6rp6sPe5U5KhQ2eTm4d90eBvmFZDydeA6Sj//SmszJgVNE6+dQU60IwmlIqALFMjzc/
         0oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212837; x=1727817637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srrYfI2SZpfKgIsSq8ppkf2FykJu/mFy8hG5tlqb9h4=;
        b=XGbIktjpD2s1gyNNd697d+3jQyuWcUlj1Swiaq8DXfs1iuAcr2bbTMgNtS+zctKX5v
         Uy8NI32TOnW315zdvmQZGpWhWl3WPJbVGFHsTwAGeIQck0+tRaT1yg6MsPUTNttgMdAK
         UzskK4I7GJl6OLk7BNuZf2dlj9z71jtWhGz580VHIh3kPhpyAkY5CGWPtnHU77r5Nvj3
         U3YDKJR0zcuLaAzDob6kyq5AxKr9S6oucNu/wm00iwcQ1N/RwQ0vF+2COUUsgibf0AJB
         kboV7FTB1Rabh/55fTD6fhRFpjYu3PcyZBR4xQMz9xcCSQhPFX6Vhzu70cBAqr/lQttR
         rfPA==
X-Forwarded-Encrypted: i=1; AJvYcCVV6xgRhwh5L9RUCU1IJspqy3vIyVJSnARJtEncIo9eclbrnjE+sMYRNrrfJOfkcjrr/iNgiMF0UbgkmBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyj7m3H6W7eka4B1Mays6FiRKID2YzcHDcpx2xjR4KeBD9q4if
	1ghb6g28DT3no6OGxVi+JfuMKH4h0WUdqt17l1ktbNp2n2fX0u3G2oqnie1k+oYklRcAjJLrbGU
	1cnu0eQ==
X-Google-Smtp-Source: AGHT+IGyr1kWMhsApP0IPIASutvzaMie1MZFGSgiqlyy1X5Rev23GRZTBa8QXuGS+5e5tLuSwBle/nwVaay5
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:d608:0:b0:e11:6a73:b0d with SMTP id
 3f1490d57ef6-e24d9dc640bmr315276.6.1727212837099; Tue, 24 Sep 2024 14:20:37
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:45 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-4-mmaurer@google.com>
Subject: [PATCH v4 03/16] module: Factor out elf_validity_cache_sechdrs
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-modules@vger.kernel.org
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


