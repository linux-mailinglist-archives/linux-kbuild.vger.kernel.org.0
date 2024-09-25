Return-Path: <linux-kbuild+bounces-3791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 348F59869B7
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 581FD1C224D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649FB1A7256;
	Wed, 25 Sep 2024 23:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q08QR+YD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555661A4F1E
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307573; cv=none; b=dhsraigfwzs8Mx9GyhS1/UUII3bYpZ6sIaq/DS2hVG3EHbGnzIqIUFRihqGP6a1Et+uS45nCot/H9shVZ1hvTMfIq/kWfZ5HmSQfTi4qo3x65A3Rd+GjaKGs6GynhwPtfDrH00oWZ4diKoO64iL7Xmi7N59Pjqlf+OJaiYBahEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307573; c=relaxed/simple;
	bh=iCsuIDpsaG//12LUTpbXOFHaJGeJHbd09pACcn3fot0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WIvNKUqxMhwW9biRCX+Urkq+0W7khV0/vLeQh6nI7yTjrJV2UPSNNZalGZveH3eySMuU+WiZO9AI7iZkPpdeCVC4sSgR5Q+xOF9h+tJ71qOPBXajaeq9Y4kD7MhyCXUlacP/TPf1q1Bd2vtDO3LePHYMtD115ayBUKCrCQyfXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q08QR+YD; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e25cf4e97aaso27800276.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307570; x=1727912370; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vadaxnt9VyshEs2zQXz9EyB1j9KQoYY2nW6Hpjx9NE8=;
        b=Q08QR+YDROnyZaJUjcY7Me21ezXVpRsUsIEjPwYd/iZNoJr9Xa297mjQyeJkuRvCaI
         D5iaL7X4NfI1gPcD5IZyOU0VwXpIP5V4ED5MVPiBjihp0vi+IEr+0XQbltQugWA4f2WP
         0G/F3f/hItbI/9FLnfrKhC7XkMYIlqp/mCtqgTYiTLjow38lBnuu4xc3raCRBZFE2A1w
         riZ+uiqUMV4OOmZwMNSAPd3JLngZGn9rJkBTdAlhIXJdp1PRwTa8Gp781SYdxjqzLDNj
         XDYCuJE+HS0snFX8GBaFcW/kTyADGLdUpGamjfmGo9LEdmfiPQj+pDEgAZYuqBzQ1Q+2
         F5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307570; x=1727912370;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vadaxnt9VyshEs2zQXz9EyB1j9KQoYY2nW6Hpjx9NE8=;
        b=iLu7Pf2DlFQrxzOTmnbMuPaoicuYlq+Ti4bcVnGZmwXOoaUeS04MMYiGUVvdNB/s8B
         mIgUFy6KsMaY5SQeMQrA3c+w/5DihKoqvWSm3uqsa3QwKM/8KeKLnBDn5WfHum8aCD5N
         oXGH07XjPrOja0tjWLURMMmtkFM4v3bclx5N9rKeXaYPMKbqUM11LGuf8mlvecGWdBKB
         4LzYO0UCUjxDB9bhk6/7BGS3trEpS70Cp4X3P+fnUMfd4k/AgQOtSpQKCr6tewS47+WQ
         tzxzGpbRK7f9gO7VYCfA5LoEDkwdqEBV0NArhxIGiWL+3J3RsqQb9oOP0JiDAVbXEfwQ
         +Zqg==
X-Forwarded-Encrypted: i=1; AJvYcCX6JL69e6lsDKAQq06NWb1mSdTj+a/GJL44dj7LMjYH/9xwuE3KeSqOz5lMZjQyLamGqZipZAPNc9poipw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOxzGcc61qzEMVPvYHGW68qf9l02bQQPEDVrHq92nHb/mDlVx
	kd3tojeySEgxBPDE7LttdkT4MDPP5c7HZDwD9ZXm04EA68ExawLaOl94b7KCPtjkLVWePzLqtzx
	98Ks8Cw==
X-Google-Smtp-Source: AGHT+IGXyiXZNUpD5Qq2WYk35Pvjl1ubLDKQ8ZQZ0AU6QSWocII7bL/lrn6rf8k0qZwiwNOpxGN89htUr/Ws
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:118f:b0:e24:9584:52d3 with SMTP
 id 3f1490d57ef6-e24d71625d8mr82056276.2.1727307570290; Wed, 25 Sep 2024
 16:39:30 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:19 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-5-mmaurer@google.com>
Subject: [PATCH v5 04/16] module: Factor out elf_validity_cache_secstrings
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

Factor out the validation of section names.

There are two behavioral changes:

1. Previously, we did not validate non-SHF_ALLOC sections.
   This may have once been safe, as find_sec skips non-SHF_ALLOC
   sections, but find_any_sec, which will be used to load BTF if that is
   enabled, ignores the SHF_ALLOC flag. Since there's no need to support
   invalid section names, validate all of them, not just SHF_ALLOC
   sections.
2. Section names were validated *after* accessing them for the purposes
   of detecting ".modinfo" and ".gnu.linkonce.this_module". They are now
   checked prior to the access, which could avoid bad accesses with
   malformed modules.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 106 ++++++++++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 37 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 1f3a07ee59c6..6a9159afca02 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1789,6 +1789,71 @@ static int elf_validity_cache_sechdrs(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_secstrings() - Caches section names if valid
+ * @info: Load info to cache section names from. Must have valid sechdrs.
+ *
+ * Specifically checks:
+ *
+ * * Section name table index is inbounds of section headers
+ * * Section name table is not empty
+ * * Section name table is NUL terminated
+ * * All section name offsets are inbounds of the section
+ *
+ * Then updates @info with a &load_info->secstrings pointer if valid.
+ *
+ * Return: %0 if valid, negative error code if validation failed.
+ */
+static int elf_validity_cache_secstrings(struct load_info *info)
+{
+	Elf_Shdr *strhdr, *shdr;
+	char *secstrings;
+	int i;
+
+	/*
+	 * Verify if the section name table index is valid.
+	 */
+	if (info->hdr->e_shstrndx == SHN_UNDEF
+	    || info->hdr->e_shstrndx >= info->hdr->e_shnum) {
+		pr_err("Invalid ELF section name index: %d || e_shstrndx (%d) >= e_shnum (%d)\n",
+		       info->hdr->e_shstrndx, info->hdr->e_shstrndx,
+		       info->hdr->e_shnum);
+		return -ENOEXEC;
+	}
+
+	strhdr = &info->sechdrs[info->hdr->e_shstrndx];
+
+	/*
+	 * The section name table must be NUL-terminated, as required
+	 * by the spec. This makes strcmp and pr_* calls that access
+	 * strings in the section safe.
+	 */
+	secstrings = (void *)info->hdr + strhdr->sh_offset;
+	if (strhdr->sh_size == 0) {
+		pr_err("empty section name table\n");
+		return -ENOEXEC;
+	}
+	if (secstrings[strhdr->sh_size - 1] != '\0') {
+		pr_err("ELF Spec violation: section name table isn't null terminated\n");
+		return -ENOEXEC;
+	}
+
+	for (i = 0; i < info->hdr->e_shnum; i++) {
+		shdr = &info->sechdrs[i];
+		/* SHT_NULL means sh_name has an undefined value */
+		if (shdr->sh_type == SHT_NULL)
+			continue;
+		if (shdr->sh_name >= strhdr->sh_size) {
+			pr_err("Invalid ELF section name in module (section %u type %u)\n",
+			       i, shdr->sh_type);
+			return -ENOEXEC;
+		}
+	}
+
+	info->secstrings = secstrings;
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1812,7 +1877,7 @@ static int elf_validity_cache_sechdrs(struct load_info *info)
 static int elf_validity_cache_copy(struct load_info *info, int flags)
 {
 	unsigned int i;
-	Elf_Shdr *shdr, *strhdr;
+	Elf_Shdr *shdr;
 	int err;
 	unsigned int num_mod_secs = 0, mod_idx;
 	unsigned int num_info_secs = 0, info_idx;
@@ -1821,34 +1886,9 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
 		return err;
-
-	/*
-	 * Verify if the section name table index is valid.
-	 */
-	if (info->hdr->e_shstrndx == SHN_UNDEF
-	    || info->hdr->e_shstrndx >= info->hdr->e_shnum) {
-		pr_err("Invalid ELF section name index: %d || e_shstrndx (%d) >= e_shnum (%d)\n",
-		       info->hdr->e_shstrndx, info->hdr->e_shstrndx,
-		       info->hdr->e_shnum);
-		goto no_exec;
-	}
-
-	strhdr = &info->sechdrs[info->hdr->e_shstrndx];
-
-	/*
-	 * The section name table must be NUL-terminated, as required
-	 * by the spec. This makes strcmp and pr_* calls that access
-	 * strings in the section safe.
-	 */
-	info->secstrings = (void *)info->hdr + strhdr->sh_offset;
-	if (strhdr->sh_size == 0) {
-		pr_err("empty section name table\n");
-		goto no_exec;
-	}
-	if (info->secstrings[strhdr->sh_size - 1] != '\0') {
-		pr_err("ELF Spec violation: section name table isn't null terminated\n");
-		goto no_exec;
-	}
+	err = elf_validity_cache_secstrings(info);
+	if (err < 0)
+		return err;
 
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &info->sechdrs[i];
@@ -1877,14 +1917,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 				num_info_secs++;
 				info_idx = i;
 			}
-
-			if (shdr->sh_flags & SHF_ALLOC) {
-				if (shdr->sh_name >= strhdr->sh_size) {
-					pr_err("Invalid ELF section name in module (section %u type %u)\n",
-					       i, shdr->sh_type);
-					return -ENOEXEC;
-				}
-			}
 			break;
 		}
 	}
-- 
2.46.1.824.gd892dcdcdd-goog


