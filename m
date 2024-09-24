Return-Path: <linux-kbuild+bounces-3716-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9DC984CC0
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 23:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B12CB1C231F6
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2010E1ACDE5;
	Tue, 24 Sep 2024 21:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zdBZkSMu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83138146580
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212853; cv=none; b=WQQV9iDsi4Cd1mC0tPwDcxA0nPbYv0j81UekEqF7PDGlBBt+Elk65ixRrgRJ1NxZTmwpjwCDaieagrPPBRIPaB8DlQq9Sr97MKyYWjyYBmTI8CA9R389PzA07495LAxwBxJo2yZ05PjPN89ghPeAkDw8OQGx8Ybv64bZlect6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212853; c=relaxed/simple;
	bh=uwfaf/NAzm+40ipxYEoBkkFYyfKzhKmnZzjM3YJU8lE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W1X1TRFGVtDWg+CJanpIYmFylMnLYEHuNYRWF5/tlYTRFTB6pOBO50yh4iMJlLpBDkQKKsCWBSPpztWWV43TjmOFgjLQv0ZvY6YKrGEJKMxlp/nUBDtbGMfBfAgh4G33+2jiSxsl+kFiGPtsFhJ1qyhKIDeItR+Y5y93KvLCEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zdBZkSMu; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-719918ba482so236905b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212851; x=1727817651; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tc4NXPfplG38lAGlz62WMnJTBJMM1sboCG51BTx1YyI=;
        b=zdBZkSMue8kSxI6KCj6HQ9/HLm3aJ5Fnz0+9g2vhAN2AF3aOWm5HXI1mqmq79o9lU6
         7ypO+UH+ZlSShzxbIugLsutl5w8C3tYnh85256cMY90/H0P+gLscXLHjjP/kMk+8mTxY
         am8lZfQJWXji2NZAn/JW2m7EP45rRpdtMLYl3GvUnDLVTGMnexMrOjOfVhuZW06V7x62
         eNwIjxlh10ZfH/O0Q2itiQFhRr5OPMGH2jG6JZMAENiw6KWZL8F7bBjYu7KfsV7fODQz
         MB9u45GDMJjVIWFWH1CAv7IQ46c4SM83gtjthQk+OzHRf3Ja2jXYqALPuDvakJYr4SDk
         Q71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212851; x=1727817651;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tc4NXPfplG38lAGlz62WMnJTBJMM1sboCG51BTx1YyI=;
        b=iOJUp4uCnwbgIaQ470B07qXLyzWUFETNQaeFxrct1qxPVTxeC7CiBGQrHgfmNutRMA
         htBkg2+jWaVGow0vCMTsKq+kwcdu9WwWwA0XqlVZ1duacQnkByC/oK2z61KFs+DDQp9V
         /GIAepOF+UnLRLWoJaVl9Bilwrrgwt8UjiCEbPL6ECL/oT8DPGKven7OS0Zg0DW0engt
         5t7iHJTY0f5V64UHzJmf7mVLa+N56GTAFgMdhlZAD+NAAIll5aVWlI35ca/g+0Jv7pWZ
         VCbNhMLQI0M7igXVrAogFnS5TAzDmquGm5wYKQFx2N08Yt/Ij1/GDEc+fIVp8fgMBOHO
         TCNA==
X-Forwarded-Encrypted: i=1; AJvYcCXPOmsPPxHiuR+SeesawEVUz+xVhkcMrzkPMrcv8g7miRX1Yi2rKgO8cMyaB0JM4l1jGLngF8oAt8pV77g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmfm8LLHcBojIwfgZg+VT9K1VDhtarUXs5ThwSL+ybe6hSv5cK
	7ejgDgQgVPqGT83CCDHM8lnUnZSf0qkrqzYeHHFE67arl87Wg5tsfI/lAQOBBW2JdHXWjF17IRe
	ICOU1Yg==
X-Google-Smtp-Source: AGHT+IFc0cLHI1DIHW3iv1HS1lpzlyZFE2dh7wfT0y53mgMrlUYIuhfjF8hSBv8kqOW6VtsTFCjA3rrjGyiA
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6a00:22c4:b0:718:13bc:2d85 with SMTP
 id d2e1a72fcca58-71afa29a5aamr19380b3a.3.1727212850468; Tue, 24 Sep 2024
 14:20:50 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:51 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-10-mmaurer@google.com>
Subject: [PATCH v4 09/16] module: Group section index calculations together
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

Group all the index detection together to make the parent function
easier to read.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 68 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 17 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 43140475aac0..e04a228c694a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2039,6 +2039,56 @@ static int elf_validity_cache_index_str(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index() - Resolve, validate, cache section indices
+ * @info:  Load info to read from and update.
+ *         &load_info->sechdrs and &load_info->secstrings must be populated.
+ * @flags: Load flags, relevant to suppress version loading, see
+ *         uapi/linux/module.h
+ *
+ * Populates &load_info->index, validating as it goes.
+ * See child functions for per-field validation:
+ *
+ * * elf_validity_cache_index_info()
+ * * elf_validity_cache_index_mod()
+ * * elf_validity_cache_index_sym()
+ * * elf_validity_cache_index_str()
+ *
+ * If versioning is not suppressed via flags, load the version index from
+ * a section called "__versions" with no validation.
+ *
+ * If CONFIG_SMP is enabled, load the percpu section by name with no
+ * validation.
+ *
+ * Return: 0 on success, negative error code if an index failed validation.
+ */
+static int elf_validity_cache_index(struct load_info *info, int flags)
+{
+	int err;
+
+	err = elf_validity_cache_index_info(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_mod(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_sym(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_str(info);
+	if (err < 0)
+		return err;
+
+	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
+		info->index.vers = 0; /* Pretend no __versions section! */
+	else
+		info->index.vers = find_sec(info, "__versions");
+
+	info->index.pcpu = find_pcpusec(info);
+
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -2069,16 +2119,7 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_secstrings(info);
 	if (err < 0)
 		return err;
-	err = elf_validity_cache_index_info(info);
-	if (err < 0)
-		return err;
-	err = elf_validity_cache_index_mod(info);
-	if (err < 0)
-		return err;
-	err = elf_validity_cache_index_sym(info);
-	if (err < 0)
-		return err;
-	err = elf_validity_cache_index_str(info);
+	err = elf_validity_cache_index(info, flags);
 	if (err < 0)
 		return err;
 
@@ -2095,13 +2136,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	if (!info->name)
 		info->name = info->mod->name;
 
-	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
-		info->index.vers = 0; /* Pretend no __versions section! */
-	else
-		info->index.vers = find_sec(info, "__versions");
-
-	info->index.pcpu = find_pcpusec(info);
-
 	return 0;
 }
 
-- 
2.46.1.824.gd892dcdcdd-goog


