Return-Path: <linux-kbuild+bounces-3798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E99869D2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DD921C2031D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337631AD5E8;
	Wed, 25 Sep 2024 23:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTdjCMgM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1C41AD40A
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307589; cv=none; b=KzfFkp65/R63CMOLdGO2SDEB711KXEDGaEFqwSEZQWDI2VGx8R4s2Ww7HWsVQTNgOOx+6U/MXn716DSajHV7BeNu/Ci+dpYV/0yWUxhjJ2LJMds+6Hp2ODedr0s64SJVyZMhlRwQx4ticZnOC99men80wmkNW9h5Hz+yetNhk8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307589; c=relaxed/simple;
	bh=9QDYzeFqtIgpifJubbDxlmlH7eEjUZaH/2YQ84rdY0c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GH9haDa2EUeQTrZ2S+BCe291bOvwrIk5w4Qhz4EQhceUi8ibG2E5+nWWvWAkAuj5nzFOekAWt84jxr17gft3XiB3aKY/tKFVxyGyiFSDGvv07CTKDP27p2xeofQaBv17wFtqk3CCWS12KWeU88FA98/sYYc9m6nCiJLHfjusM/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OTdjCMgM; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-69a0536b23aso12167227b3.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307586; x=1727912386; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6yXvv/vrTLDrEzmPTfvxgBAIug2sA8OdrjoRUJniL2M=;
        b=OTdjCMgM8YjxDuEHL8ypwKq7l22iOrFWtkQjFufh9dEToAFONT32xfWhlYlYyjYPzh
         I5yjUlBc5jn4Th5d13BoVfmIoA1V0zqYnXOcpw8JE6CfyloFRCLBJEcsnywsNqhoSqSd
         l+MXDGR7HPpopbirbgIsdc7HUZpIOWUK+4UXwxNw+ky3BUrtyITuuUucrkU5oFqjY2pe
         /VvWCgQmo4PptPK5LWwbjMRdZaRDriPq55Ltk721/L1aM9+bL7owhnDXnKTx3/3OnOEn
         eEXBxTZphjfst/D4skhIKnZka6ofbVS2t+NF37pF6X+HDhksD+a8UgUiSGnPZZ9dtavR
         fvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307586; x=1727912386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yXvv/vrTLDrEzmPTfvxgBAIug2sA8OdrjoRUJniL2M=;
        b=dMRqg+nJbohTDGkKN1G95MU5jUOJjUExEgZMJUOtipSR+3d4u/AI8DOFCeO3Ebe1wq
         FmLc3jwYsZLdlOU+UrucDviZ9Kz92S1hPI9AFBVmrRMkha0CCf7wiYxyCJyjoLc5Eojh
         8vmPBPaosO2pzzajd//jAw2gn4BRUauf+8t65OzU661ir7pyc+SWgudvIbxAnnb1SNRg
         Lb8GIIwxgyNuOrvM/PET6/xhhQpJuq2hodxmZ1mntbslCadVvng/57FwKJWmj+g7jylJ
         XSZTRfv6B81VpJWNAlT0AxNNjDOmq0oFi6UTaN5E/Iau5a1A0P09ZhJqibXw/Gis9X+O
         5iDw==
X-Forwarded-Encrypted: i=1; AJvYcCVNYxkaGwAOKl6cVMDwcd/5FrI4sq0zLc9vlLYuPid3WOYSEkt1LxlALtGB+oB3UJIWAyzI52H0e/52M5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbxQI6jS9u5MKMiHiVFWb8q3PLlwMJvNOSkxSs/4xnnK+SEQLo
	vbleVFlfbgfYaTBIX2dE8HGSUUeUDFDgCbLZioy4nNsqWdacDTYNyfptWWW94Fj3E2vDDIns0pC
	MGOkWsw==
X-Google-Smtp-Source: AGHT+IFOctLtu2fDpWSwtgdrlWQhzeyg6ur9X7N6yKJb4yvjNshlLawCmOC09mIbp13RxLe82I6Qn8MDC9MI
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:6583:b0:6dd:bc47:1ce1 with SMTP
 id 00721157ae682-6e21d0b47e5mr368107b3.0.1727307586448; Wed, 25 Sep 2024
 16:39:46 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:26 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-12-mmaurer@google.com>
Subject: [PATCH v5 11/16] module: Additional validation in elf_validity_cache_strtab
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

Validate properties of the strtab that are depended on elsewhere, but
were previously unchecked:
* String table nonempty (offset 0 is valid)
* String table has a leading NUL (offset 0 corresponds to "")
* String table is NUL terminated (strfoo functions won't run out of the
  table while reading).
* All symbols names are inbounds of the string table.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index c082d5d41a8d..b40b632f00a6 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2090,17 +2090,53 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
 }
 
 /**
- * elf_validity_cache_strtab() - Cache symbol string table
+ * elf_validity_cache_strtab() - Validate and cache symbol string table
  * @info: Load info to read from and update.
  *        Must have &load_info->sechdrs and &load_info->secstrings populated.
  *        Must have &load_info->index populated.
  *
+ * Checks:
+ *
+ * * The string table is not empty.
+ * * The string table starts and ends with NUL (required by ELF spec).
+ * * Every &Elf_Sym->st_name offset in the symbol table is inbounds of the
+ *   string table.
+ *
+ * And caches the pointer as &load_info->strtab in @info.
+ *
  * Return: 0 on success, negative error code if a check failed.
  */
 static int elf_validity_cache_strtab(struct load_info *info)
 {
 	Elf_Shdr *str_shdr = &info->sechdrs[info->index.str];
+	Elf_Shdr *sym_shdr = &info->sechdrs[info->index.sym];
 	char *strtab = (char *)info->hdr + str_shdr->sh_offset;
+	Elf_Sym *syms = (void *)info->hdr + sym_shdr->sh_offset;
+	int i;
+
+	if (str_shdr->sh_size == 0) {
+		pr_err("empty symbol string table\n");
+		return -ENOEXEC;
+	}
+	if (strtab[0] != '\0') {
+		pr_err("symbol string table missing leading NUL\n");
+		return -ENOEXEC;
+	}
+	if (strtab[str_shdr->sh_size - 1] != '\0') {
+		pr_err("symbol string table isn't NUL terminated\n");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * Now that we know strtab is correctly structured, check symbol
+	 * starts are inbounds before they're used later.
+	 */
+	for (i = 0; i < sym_shdr->sh_size / sizeof(*syms); i++) {
+		if (syms[i].st_name >= str_shdr->sh_size) {
+			pr_err("symbol name out of bounds in string table");
+			return -ENOEXEC;
+		}
+	}
 
 	info->strtab = strtab;
 	return 0;
-- 
2.46.1.824.gd892dcdcdd-goog


