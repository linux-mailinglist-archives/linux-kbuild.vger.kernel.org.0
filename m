Return-Path: <linux-kbuild+bounces-3789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE99869AE
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FBBE2834E5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D4A1A4E61;
	Wed, 25 Sep 2024 23:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tXfD7CXj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA791A42B3
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307568; cv=none; b=XvQ8fdjk8/ZUDMk4vlumIXvZWHAspFsXwlhMQaLVmIBotOtebucuerIKkPXhQl5Ps06tKPTzz6n9ifKaDGn3NwJfahSSp79u/eCwl+9xkv/SzFIiYuTNAEGgsjbaFa5rw6RnADFTWChxUCyjMl4Wbg9BOVLhfaTQ3AwsJ4nacy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307568; c=relaxed/simple;
	bh=Mm95RZ0gEd/5ILA/sw+Yul4T3HW7v3bJsG9qmFVzqME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N8t2wZ5PHBqWB8OgdqtOAULSFc46R5YvOLA4GAA2g3Tja+DbptFewp4arzowMxpGiJG4N6+t1GAMYtHUfT48oIVJmTUoPqZJlON4wkw8OsE2QA5JdqQ/fJZZe3sGFYTKGpHfnFMQqWGthnE7DW4E5itfqggwy89Q4BWzUuYb25g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tXfD7CXj; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02b5792baaso693610276.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307566; x=1727912366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9YZzoCvxvyDdM8B+em9dMKSDuRRuGPZhSev+lAnN9E=;
        b=tXfD7CXjz4wZB2/ddpedVBun7FwWYkTwT5jkNs4IJgfnwfXiy4LSVv4RX+OAYrv035
         2TQoSEG8TmcTr8s9ZfHyXmLleupcr1QzoBnaf2A01lnHXRIRqv13B9fKWD+ikeogU+Yd
         32b68d+IYGSxvqZWpCqR5I7z1urq5x1rRfok5oqB7EW+uWRgzNSIAHLCU+kC08OWluoQ
         VbdgHFtNj2Bx9fJ+0ji+bXWgXIjfnNT6cCrLP1QrpntizC1VuVjlla95u74qLIm3bqk4
         lami4hLe5geRmL2CyPcg+1jcas+bA5m66ScVkkqaORCr69Akq0YPJlo30uy5SniGYJ3R
         BxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307566; x=1727912366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9YZzoCvxvyDdM8B+em9dMKSDuRRuGPZhSev+lAnN9E=;
        b=YQ0L4XV8E+KN4RvVqNJuJQGY/ewN+hLBQN2d8otr20xsTQoraerv3U76gIGm6holth
         5GA8jU5hKSle9Vwq1e0FoUhXrRmdkxLJY+x6tfuOidFlzDB9l72gpFzJwWtCb+p5JU6s
         0SglmI3sToAo4XwAjG2kOiLUUlWmYbFVVTooocngVy4cQURAipT8Rb2SWmoXJCqxQf/x
         CI9SLwXtzgKGjBYPibH+xy7SFIjzauZimDXEa8JO32pZwSLaHz2elrElcdZN4xdiGexq
         wibW3TDoSI3/Hs9JGXwYT6l5zACx9IoZEP75WGfVS2KXNvx/TPPtTKJamPSYUPJ2jpvg
         +KHw==
X-Forwarded-Encrypted: i=1; AJvYcCVGxlVXamcNCVT5/olSgPUpX0rdRGzx2C0CluVr+rBY7RZp+5UJgXVVh9N34Hjitud+eAWamEoDFulrNRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNWqQ6Ifp5tZqphYkLJBhK49mElUc/uHTGEL8KwI6THsQ2VDUV
	/uHy/HGXX/n0a/TWb2CIjbF75Qsl1/h9xEQ0D7LqcPdoUmwAMvuoD7pbIehyMr4xe34JgDpVvlJ
	35E+xLw==
X-Google-Smtp-Source: AGHT+IGHHE+4KWf9auYKryB2lu9/fM/qXObyfiN1uXRNz038JkA/1/xLeMhKPiONI2CFf2+1SxQefRfFrD41
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:7801:0:b0:e0e:89e6:aad4 with SMTP id
 3f1490d57ef6-e24d44ca00dmr51018276.0.1727307565822; Wed, 25 Sep 2024 16:39:25
 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:17 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-3-mmaurer@google.com>
Subject: [PATCH v5 02/16] module: Factor out elf_validity_ehdr
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


