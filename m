Return-Path: <linux-kbuild+bounces-2844-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 158729499FA
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63097B24161
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A985170A0D;
	Tue,  6 Aug 2024 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="POhTE3M+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D884B16D9A3
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979277; cv=none; b=d2uRF3PdgmjEdYUYzm8pBZuXtXQNx19KRszMr0aEl28/MI9uySWsyy7YWMPl+v1XUrj+1nB8Ts//BMcIEuo3JncJoBuQZgUwgAunHWSdZiGBXU60sOBF7I0702TNpoGCWVjaNnCHVb84YdJtZNJ/EMMrX//D5XajnvifVNTeTUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979277; c=relaxed/simple;
	bh=7o/q0V/8nz20ZimeKJ7F4Niz14kg6QxkIphDjXT52fk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WBK0quFkOl83vp/+RKIYYKH0rNnDpYD/UcCZPtxa8a68MVlMu8mIi51elfwn+2zbPvoRPjOacYhhSPoHVxiKshq9j8Y0apy9QNjhjupiZy/Ip1t5nDWroMTqqJzY9bb1+7r/0cBRrbC34R+KcTteFGKDq/7vR48Tio8Wy/7BvyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=POhTE3M+; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0872023b7dso2010643276.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979275; x=1723584075; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo9KIzckPaWjR62wzQWzW1E6r1YIZ+FzcJKNKEd2cbc=;
        b=POhTE3M+Fo1UBDSyBnmjhMiJrFHU62yByxS/wam1BH2Cqd3OPSd1HL860KLDmHVqWm
         RcaNmin9FDyc2FTBuj4MfWw1L+cv5iZgtcNbIkcHigL3OQDsQ67pxpc3oNT8atcUc+Sa
         Ge9zAFiP4CDlpamsbCjJ93OvN729DmUfB1AkkFVO5/LeUvXEY6TdZSZ45kY7E5o+Y1oG
         X4QDpWFdiRWX4+q8tCxCJML+tNN84m7EtkScwhbgjLD7igr1yE1bh7p/BmMc6h1xgge8
         GVB0I8hmhTZycYYZt3kbEZuCsygEunRAeq4jKL8AO7zgBlyNcszYRP8W1DqGgzFoHK/4
         RXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979275; x=1723584075;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo9KIzckPaWjR62wzQWzW1E6r1YIZ+FzcJKNKEd2cbc=;
        b=goVT18Bcev6ddnYn25sNvdai3sfD8vo3cPW+ZyRoxVU+n9GNfeq9fVSy86qcwGneLn
         lVWhznQav1vnW5o2MxcPp6MJjZ3KVBQaJE+Xx3apUvgv7kTMWSzGlIprFdygcqGtxprj
         6WlD/4+IsTy13g+DqxZub55+grHrZ5PDMbGcNU+gCIphOjdlG52af+HYbspS+ypaBH5z
         2CLxoDdYMG4V2CTW9bfpJIlfORFx8OuZ8vJYdAty6SGuQ/xfAzwdtwEgCz2Xe3x7nedZ
         FcZWT/XR9u5kLA/0HZk7az3wSYew32y+29skzanew2tlZjfdE8b7e5DkrEBosAPfHaur
         2DjA==
X-Forwarded-Encrypted: i=1; AJvYcCVGJDDhlERFr82EXBkyWZX8w8wIQGLc7WxTwH78boR3brq1RmsnT7UD3tvVMV43PP+9WN8LHxsGGKMWvEd18q2kDKYnIWr+UOHtPF0g
X-Gm-Message-State: AOJu0YzG0HONM0VHE1iCdmaWvFn8SneoM1k4zKB5q7ZC7M3NB7Cyi8Lo
	y5it+rhHj2W1qvT0LqDSunMYQktv7q7xYh8URssDM/MyqySGcN1MfgTH826zbXVuqBkUcBQRINz
	31wlMiw==
X-Google-Smtp-Source: AGHT+IH7JJ+cAD9RGztSP5vgRVCBQElvxeH9dvZHKNMgEx11Gqo+XyM2E9Dbljxi3vzskmoey/eoE16MBt22
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:100c:b0:e0b:4dd5:3995 with SMTP
 id 3f1490d57ef6-e0bde4abb59mr28777276.7.1722979274758; Tue, 06 Aug 2024
 14:21:14 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:28 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-3-mmaurer@google.com>
Subject: [PATCH v3 02/16] module: Factor out elf_validity_ehdr
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

Factor out verification of the ELF header and document what is checked.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 70 +++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 141a964b6b13..1218cc7e1196 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1664,6 +1664,50 @@ static int validate_section_offset(const struct load_info *info, Elf_Shdr *shdr)
 	return 0;
 }
 
+/**
+ * elf_validity_ehdr() - Checks an ELF header for module validity
+ * @info: Load info containing the ELF header to check
+ *
+ * Checks whether an ELF header could belong to a valid module. Checks:
+ *
+ * * ELF header is within the data the user provided
+ * * ELF magic is present
+ * * It is relocatable (not final linked, not core file, etc.)
+ * * The header's machine type matches what the architecture expects.
+ * * Optional arch-specific hook for other properties
+ *   - module_elf_check_arch() is currently only used by PPC to check
+ *   ELF ABI version, but may be used by others in the future.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_ehdr(const struct load_info *info)
+{
+	if (info->len < sizeof(*(info->hdr))) {
+		pr_err("Invalid ELF header len %lu\n", info->len);
+		return -ENOEXEC;
+	}
+	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0) {
+		pr_err("Invalid ELF header magic: != %s\n", ELFMAG);
+		return -ENOEXEC;
+	}
+	if (info->hdr->e_type != ET_REL) {
+		pr_err("Invalid ELF header type: %u != %u\n",
+		       info->hdr->e_type, ET_REL);
+		return -ENOEXEC;
+	}
+	if (!elf_check_arch(info->hdr)) {
+		pr_err("Invalid architecture in ELF header: %u\n",
+		       info->hdr->e_machine);
+		return -ENOEXEC;
+	}
+	if (!module_elf_check_arch(info->hdr)) {
+		pr_err("Invalid module architecture in ELF header: %u\n",
+		       info->hdr->e_machine);
+		return -ENOEXEC;
+	}
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1693,30 +1737,10 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	unsigned int num_info_secs = 0, info_idx;
 	unsigned int num_sym_secs = 0, sym_idx;
 
-	if (info->len < sizeof(*(info->hdr))) {
-		pr_err("Invalid ELF header len %lu\n", info->len);
-		goto no_exec;
-	}
+	err = elf_validity_ehdr(info);
+	if (err < 0)
+		return err;
 
-	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0) {
-		pr_err("Invalid ELF header magic: != %s\n", ELFMAG);
-		goto no_exec;
-	}
-	if (info->hdr->e_type != ET_REL) {
-		pr_err("Invalid ELF header type: %u != %u\n",
-		       info->hdr->e_type, ET_REL);
-		goto no_exec;
-	}
-	if (!elf_check_arch(info->hdr)) {
-		pr_err("Invalid architecture in ELF header: %u\n",
-		       info->hdr->e_machine);
-		goto no_exec;
-	}
-	if (!module_elf_check_arch(info->hdr)) {
-		pr_err("Invalid module architecture in ELF header: %u\n",
-		       info->hdr->e_machine);
-		goto no_exec;
-	}
 	if (info->hdr->e_shentsize != sizeof(Elf_Shdr)) {
 		pr_err("Invalid ELF section header size\n");
 		goto no_exec;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


