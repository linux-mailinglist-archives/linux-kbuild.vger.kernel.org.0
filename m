Return-Path: <linux-kbuild+bounces-3717-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02329984CC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 23:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15781F24670
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50451AE85A;
	Tue, 24 Sep 2024 21:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YTb6CuKW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10501AD9F4
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 21:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212855; cv=none; b=n49eu4rJEdgqxO8IyVpHUkVZZG6AAD6Y+EasYpET9xIOBIk8xDsA5lKbXe0jVZ71GtKuQNc7e+LeU/dzUlFSJ9U1vc2MT/uZR06X/ma3xfnnbPDqagM4lfcM8Bo/2RtRzALZaaX3dFKBY9KYUJisjSVaDD3cQ6A06fZCQm42ZeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212855; c=relaxed/simple;
	bh=RFwYTaeqemLtmezDNnI4k0C/4IQdB480nO3xNfeeufc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h2Lx7RYtX6RT/A1h9+GuIV5i7uPxQ8/FhHCBdNP6DzNk90663hLj7ttc0SB37sMTrtilSlePsDDMPamO8yayIJmXptJNptOmY5eXGyLj5ASH21020Bq9UIKJilCRUOXPUZVlnpJ7h3tguurBzRuYImBaM2ky8RGr91Ohfa7CULQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YTb6CuKW; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7cbe272efa6so5617871a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212853; x=1727817653; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=extRuG4D1AdoHKvsMv2fLx/d2D/gEpHsXYLRVzC3Sa0=;
        b=YTb6CuKWLfVSW6kYzTb/oJq5vhfBFvXiQgvZKTAtmUBcHjaP71872uRp5nrTcl2loN
         G9KSbeXhAPSf1+omyUm/XiKdKTk/EZnX5wDrh8g95QtBLPEOi7CzZ9eZ/BKdfVNy8wqQ
         X58bmBme48AMBeMwhhO5cZYb5M2Vmghk6uqLIzQwlGsNt5zCWq57coMBLYaq+vQ7Cjw1
         pCyrGrehzONRs+2THALe8aMmxhx84Uhz6vfIaYwYBuopm1j9IEPtJLnh1ZRui5Rgi3TG
         lfKjEy2vdIBU0aUynAeR0tnNv+xN5z6QDUWFGbYfuSJMFCbbZyIfgNqtJ4CwqtWfP0RZ
         WoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212853; x=1727817653;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=extRuG4D1AdoHKvsMv2fLx/d2D/gEpHsXYLRVzC3Sa0=;
        b=NCh9zN/8qQ6MgxlY2W9eOGYK3iu4qWngKGhR8v9wZmoGUgBWaZkrAAZkXFg4jyqRAE
         5Jje+3sBwb5ezKKsOzj0RYiRpWl6+i6Aym2n1LfA5CVyAhEjmLXDGaUnxWgPdt7WAT7Z
         3x4afIffy7GjBqv+KXYlfudm1TY4cAvAyx/fM4BXP7f4n+q0gdvB+t8Cd/FLvaxFf+qW
         gOgAsaRqqwi6mMeiMWb5FLRN+x/ywUS6NDK9teKJBItliVXRumTh82Kl/b6FfHisqgxw
         1gy6RCo3DtJZoSYoc+MM/iBNhgZIT8lPAMS2SlJaIopWHuBNyVteDCD1NLPzSAcb2IeQ
         aSZw==
X-Forwarded-Encrypted: i=1; AJvYcCWqeC9KEFVZ24yLR6hfw4tzQIBUdgugX2wuGnrVcmJo+tEGO3JeAw1L5AXgVJHpT/7eYeBoAzXK+pIFB30=@vger.kernel.org
X-Gm-Message-State: AOJu0YznQdumVmziLAH+wxmaLaRW/cSFyGcQ58Bg3bvcwQ/YnEMsZk8a
	stmlJg2POZvE24jewCpjS1gVBAlzju0IikwxFIk+ULqrTQkamPOWRVcoNvN8p412gXcpuuNC144
	1BboClA==
X-Google-Smtp-Source: AGHT+IE3L8DCbOXBbulDlaKBgDSXwFgtzL3CsvCHzYn0GW9XmpM352NgTobVLRsi4oRtR0Auru991pms+fQd
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a63:2403:0:b0:7cd:8b26:15df with SMTP id
 41be03b00d2f7-7e6c196835dmr1649a12.7.1727212852738; Tue, 24 Sep 2024 14:20:52
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:52 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-11-mmaurer@google.com>
Subject: [PATCH v4 10/16] module: Factor out elf_validity_cache_strtab
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

This patch only moves the existing strtab population to a function.
Validation comes in a following patch, this is split out to make the new
validation checks more clearly separated.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index e04a228c694a..c082d5d41a8d 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2089,6 +2089,23 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_strtab() - Cache symbol string table
+ * @info: Load info to read from and update.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *        Must have &load_info->index populated.
+ *
+ * Return: 0 on success, negative error code if a check failed.
+ */
+static int elf_validity_cache_strtab(struct load_info *info)
+{
+	Elf_Shdr *str_shdr = &info->sechdrs[info->index.str];
+	char *strtab = (char *)info->hdr + str_shdr->sh_offset;
+
+	info->strtab = strtab;
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -2122,9 +2139,9 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_index(info, flags);
 	if (err < 0)
 		return err;
-
-	/* Sets internal strings. */
-	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
+	err = elf_validity_cache_strtab(info);
+	if (err < 0)
+		return err;
 
 	/* This is temporary: point mod into copy of data. */
 	info->mod = (void *)info->hdr + info->sechdrs[info->index.mod].sh_offset;
-- 
2.46.1.824.gd892dcdcdd-goog


