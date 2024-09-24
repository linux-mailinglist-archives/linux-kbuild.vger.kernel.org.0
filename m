Return-Path: <linux-kbuild+bounces-3709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D2984CAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 23:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68B5C1C22BF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10F9146D6F;
	Tue, 24 Sep 2024 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NPu4CFHT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A911448DF
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 21:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212837; cv=none; b=LLhHGQRmTORoZR+Df5SfASNMja22Rh+QDJKrS81d9keIDYZBRAjBtGFlwMBBbddnlX7U+4piP7hSjGv5VX66NLT7EbhLrJBRd6DqIRp9rVmLYhpf5PXgk86rRBoO++/Kl8efNoEbb+rswkC8j+Q4grfBKVPE4DQh9OUQRWbE110=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212837; c=relaxed/simple;
	bh=Mm95RZ0gEd/5ILA/sw+Yul4T3HW7v3bJsG9qmFVzqME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m+eUCgtZZc6sRkvqf3/60sH/bhdFUNJHu+cWM4rty53IgfOZxh3GJoBmM2jbyrOzzuUadxucNJ73tGX8R3M1wiMS2K7pl5M6GeEqNnOtzJ1lbCx+MnMwSd9NlOx8JQ86Rc66+bcnMsw3xQj6dOm0PIZiLcFUN+cRwSzLGReIiO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NPu4CFHT; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d4bd76f5a8so94496107b3.0
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212835; x=1727817635; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9YZzoCvxvyDdM8B+em9dMKSDuRRuGPZhSev+lAnN9E=;
        b=NPu4CFHTxop9ZyPGDZqCJamTPOaRMNH+oocPBDyhLJ0RFEVJ+36Q8JTu8BuIUm9X+f
         zB1QnkhTwIKc0SHVw6UiKDwNbzL8aG0TFzWQv/I06fi3R/nuQtf/EmJT7T3StlxuLFcB
         VtVM8qa+BYDBZxaEpe8Z+iJksnpGpsQhWC6k4Dfmq3b0WWgJ1YybWrbUYSjOpLQc8juA
         Nl68HH4FmigNR5m8JEzqfvSFKlT9kz+HONs6RMacdt3mJPbSSmH49JdDM7PPRpJJjSY8
         ewdfLmkIuzeDRMlh5tewFPdygPS/DHlWZ0l7bs3mzGb8UFZKdJfxC5E63aRT8XUnCYVt
         UTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212835; x=1727817635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9YZzoCvxvyDdM8B+em9dMKSDuRRuGPZhSev+lAnN9E=;
        b=WvQvNAHJ1Tb0Zf6zaEBz/Tuupm29j1Trd9vYuYL5fXKKL0m/75CtZnh2TOBVEUl+Ga
         BFVC44GTFx/03lWpdmKTdWf0BAi3vFTnSSrOhhZdTP2FV2YGiUky8CYhlV/Ql027uc29
         8jFCyQjdftzqbVZVDL6P/7URPmCTLZAllIeoIVAdW6uLfnuYKXFj9VGBWtNZOZlgGomx
         SGZwe/l1nYeaYO5g0O2OvATmBhwI8WJ9SPDsKfPevM/jjlvUa8vgfAzfc3y8tND1j3rY
         r/EOTb1VTSNMMOQ4BZ8EhznSPe0gSvVkmnpOt0q7xaoK3kUp0tU2Ygcxs80XRHZDqbK4
         VlUg==
X-Forwarded-Encrypted: i=1; AJvYcCXwyNk0LAxlIWn+zTXahgEO+4ac4azQxZIopGNP5q77HWlnjiEtC9oOvpkKnVAnK0cwPi5FuWHcg8jECac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMjhHu3dE7yY0lQ6S60T/5Oyd5tocOuiq7XoGEW+/E4D3Fmewv
	rws4EXA968y6058ExMjWbKoN9KI3Qbrqiyrzo1lqBMWDJmf9hiH43l5SvX/b+thKQ4PmjZdQgtv
	pQx6gOg==
X-Google-Smtp-Source: AGHT+IH8GJCD2yEItqoVxha2hna+M6u5pXhuHD6Vku3ryEFGXz3pSAiDfCy7EoF1TJPoKA1RIGRpct8983ar
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:5092:b0:6dd:bcce:7cd4 with SMTP
 id 00721157ae682-6e21d81e792mr11447b3.2.1727212834850; Tue, 24 Sep 2024
 14:20:34 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:44 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-3-mmaurer@google.com>
Subject: [PATCH v4 02/16] module: Factor out elf_validity_ehdr
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

Factor out verification of the ELF header and document what is checked.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 70 +++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 1a2dd52147ba..59c977acfb44 100644
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
2.46.1.824.gd892dcdcdd-goog


