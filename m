Return-Path: <linux-kbuild+bounces-3794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F49869C2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 582A91C2357C
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF66B1ABED0;
	Wed, 25 Sep 2024 23:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wb4Kc+vl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000B51ABED1
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307580; cv=none; b=rTeEpjDASBVFn5Pv5XuyWeGKWeUfwrGOXdObZ5MYoM3gWDL4ib7eoRLMBMXxc5QMp0ImwYFn+OY9YH5hjq+Mu0HjD/f5YDWH8fC3Z06rRtqXTJWxK0JMDjpXImf4xI8aFXgRwqQE9ueDipGg9XiyHSp8km1YG8UdXsac283p/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307580; c=relaxed/simple;
	bh=hPcayIG4Zzk7TfnQCe5VB/OkeMCLVNaFCb22SLuD7xA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IJYsfaC/5Y0PjAkMr9biPSe9cVnpztC4mofziEcGz13TeM8g1HlTFS9CiBqmCwY7UJrl6cMTEeZxX0jKpqth5DTz34fk7qZGdSDFMnvwJfrZ51YguQVRBNruBpMnGEry4jK1mtfPZaR0YkZB8c9qU+yS9YtJfH8lz8eUSwkAL/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wb4Kc+vl; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e22e472c475so722075276.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307578; x=1727912378; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0kXAOzmEEQHXzTmLkL/vEUOj2egGiISa865No2odHA=;
        b=wb4Kc+vlm9vspCrEGu31uSdmGCFV4N+qq3ZdgtPNuVg7PQ3AnM/tZOhfz3qmMsSGKR
         EJ3oKVJaibX0jMt6Z+MELN82Fl4xPXd8nCqPcMLDXQydk4pva9Aw2Atp1OS9iLAiVwbk
         /FpGLP8QjK2w8po1aocYEVWGjEc/Z9QISVlarljpEcPa5uNqf7A71TvKtxFc0MTg7clF
         5kscch70KYzMTVSw25al7YR2T4jsybqoH2sWWp5pBzSEGjSAHdpvqKthwvZ5YcGadoWF
         s4eLU3/RbMVaF8/7D3L74rtn815TeO0ECl5FTnNu9mxm2o2dt5uKd1HOZkheUoD/Ccmi
         0uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307578; x=1727912378;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0kXAOzmEEQHXzTmLkL/vEUOj2egGiISa865No2odHA=;
        b=B+/wMkToKDhVoLHwglR8aTO5pYJ6ufNFKwoIxkOcng1Sykc95YEeClI0pSwVCvF1Gh
         l8EcMRbvv8JgCgIqqVZ9J0ITey2vI4w2/pvFzs8U7lECUhgoRglzxP8Rm5FmDJqjm1qu
         AwLFDD9/E3VDp0Ymgq4jxJg3ve9syIgaNCgABWeuJQNJ2+JlkARZk0sSXZXYzP8Etoti
         YZOKoDYoAR2GJL+mqwtQXhV9M8PofYdgYbwIexZhoar/CDqP60SdSjtfKYy+QqeZEmYA
         NXB/g+3cBfahcfDy66BqI2TvX/Le2pIw+p5mktHDMRodYbHv+46Co93q6x6GgqzBPjlm
         y9NA==
X-Forwarded-Encrypted: i=1; AJvYcCWCNajnLn2bUY5USne+jFBGNFeujWXsuQIE80PF2M4c/EB2HWh8ucMsvdPoVJpnoN0Eh8O35gRyEvuiBVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9hmMqoUadnxqLPijLzkyl5njGgu+l71Nb2PJ3+uu53+aYtXoi
	ku3Q2YEcDvHeY0EOdCxTPaUsh510+XRPobk2asFXjiBDXltsb6WU1OrKv+CaSqgsSeJFAtxaYox
	WASfEkQ==
X-Google-Smtp-Source: AGHT+IFZUoBFWfBOtauI+q+UpHX4EaqZHRhVqScDHU9VRfOA/W5QmMinhHWYwHFcLrUwulCaskY1L43rYGa0
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a5b:841:0:b0:e20:25f5:a889 with SMTP id
 3f1490d57ef6-e24d80d4612mr3980276.5.1727307577820; Wed, 25 Sep 2024 16:39:37
 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:22 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-8-mmaurer@google.com>
Subject: [PATCH v5 07/16] module: Factor out elf_validity_cache_index_sym
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

Centralize symbol table detection and property validation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 73 ++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index ec638187ffcf..6be58b0a6468 100644
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
2.46.1.824.gd892dcdcdd-goog


