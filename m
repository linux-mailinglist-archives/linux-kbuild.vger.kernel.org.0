Return-Path: <linux-kbuild+bounces-3712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A9984CB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 23:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E3311C232E8
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0191AC896;
	Tue, 24 Sep 2024 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cK4FBduY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E313D509
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 21:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212844; cv=none; b=K8lkj6JchYtzUp2XESeqUrGNXaymBAqpwBi+VFkH9+AlIwJd8t9gUDKBqIfsnY/nd8yBN582GMfA+r9jRL3ZBCfKfvcKtX3vd06RxOfNWLms9CArgvbo2nm91Q3jjP2sjVHcXPTvDH1vkehdvEd0mPX8cpvDEs9yIkXbqbo2Iek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212844; c=relaxed/simple;
	bh=oOvwo7YW3AUcfbqrf+A9OVLdTk2yYzaOPGripVgZWf8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FxitM/V2oIl1XDKNZNamnbnkEIYqHmTv7JQAAnuzcaY/y8vx9MxpbOQqz049dqenhPgUipM1x+B+apOIT17C5+2muTrDAMKPCO+eNVcYNHwZhoziOIxSJjipPCANKCOL3fYn5Pt3XyoTmlX8uPsQMaoLvF9dyUwwdZyv4cOHLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cK4FBduY; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6de0b23f4c5so4708587b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212841; x=1727817641; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKJyYEevVucNlB3/71Ku7Qx+VTTwNT+eh7LmoeHsrUQ=;
        b=cK4FBduY2q/JNMQcZ0tjAjWnPou6Ctck43NZhfUZWJTbx9wqsUmIsIdbRLdkmRoRiD
         agqdIQ71gt8tVxIiNQzSoPH8FfcuBuUm1cUDzixybN9o3+o+vr2hKvc/Hzu5CYI7CdRB
         uvmoPmD49i+3WKtdFIx8MbOUTtBDLm22QF01olb3izY156A4bvQD5LWJN7sNZQrKdgAz
         h6yAdXAHcGutO/W7TkqpeikI1umcLoZMIjOIauKn8KH2hpreL22wPK+AK/gm1xM2L8Cg
         xZGDMgRi2x9xMIsxB/vcfzBivUASkOGZdc2ARYOEjyq9epZbD7eaH8mqc+7/sdW1xLrg
         BB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212841; x=1727817641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKJyYEevVucNlB3/71Ku7Qx+VTTwNT+eh7LmoeHsrUQ=;
        b=ZrZvOazGK3FAgksRRwcpg6oAErOLTWYaCZXrq5EJMqDjPY/iXspPoYNOZI/DuWIMnF
         uU1CvoHx9Fefrvwa+i8PSDz6D6qgx74l+i8RjS557y6lYGtZCBZjvomcqLKACObI4lPU
         MYarKTEMJKcgWlbYKsjv5je2BDKKZYkkbnclq/fzCa8WLGJFFhoho9JeptBoOStiJs3k
         eNbCNYa9gC+aLtBkmzZZEUKQmChxlwnCT/Y7KuwA2dvaWkWn0mj1wvIyOb4+MeTRxgYM
         lVfFP4g7O/YiKHehBoUKMJrZEAMNJ61nvmiSxGWV4rW25iyO9dDIRjLKSw4XHQWmRNaT
         CWRg==
X-Forwarded-Encrypted: i=1; AJvYcCWogvsGmqjd0czb6E30L45PcjbA9THdZ2rz/HHQvWkkoW85pnnoS2ePooow53VEwC9iYzVQAzT1+JYOw5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7rzoRWFLJesRti7tUjoNRPYrQj6BAz8O/n5f2uFgWs/i/uLX5
	Xv0YhcnfGqZm2/4VWotn/dcsoXRHdj0m84nFXTv3W1+DJ6l5QO2PWnxk/JF+G32rTyKGVZBUMcg
	0f2db0g==
X-Google-Smtp-Source: AGHT+IEIHoUgWRTaVQTY+4+TEtbudWqV2N5uaDTmBs0ILMQjLIcShuzuxUnbFETJLtyrN6FtMPs3h3vqln4e
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:3808:b0:6db:d365:19c0 with SMTP
 id 00721157ae682-6e2089f11c2mr1334437b3.5.1727212841567; Tue, 24 Sep 2024
 14:20:41 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:47 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-6-mmaurer@google.com>
Subject: [PATCH v4 05/16] module: Factor out elf_validity_cache_index_info
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

Centralize .modinfo detection and property validation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 82 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 14 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 6a9159afca02..511d645ac577 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -195,6 +195,38 @@ static unsigned int find_sec(const struct load_info *info, const char *name)
 	return 0;
 }
 
+/**
+ * find_any_unique_sec() - Find a unique section index by name
+ * @info: Load info for the module to scan
+ * @name: Name of the section we're looking for
+ *
+ * Locates a unique section by name. Ignores SHF_ALLOC.
+ *
+ * Return: Section index if found uniquely, zero if absent, negative count
+ *         of total instances if multiple were found.
+ */
+static int find_any_unique_sec(const struct load_info *info, const char *name)
+{
+	unsigned int idx;
+	unsigned int count = 0;
+	int i;
+
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		if (strcmp(info->secstrings + info->sechdrs[i].sh_name,
+			   name) == 0) {
+			count++;
+			idx = i;
+		}
+	}
+	if (count == 1) {
+		return idx;
+	} else if (count == 0) {
+		return 0;
+	} else {
+		return -count;
+	}
+}
+
 /* Find a module section, or NULL. */
 static void *section_addr(const struct load_info *info, const char *name)
 {
@@ -1854,6 +1886,39 @@ static int elf_validity_cache_secstrings(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_info() - Validate and cache modinfo section
+ * @info: Load info to populate the modinfo index on.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated
+ *
+ * Checks that if there is a .modinfo section, it is unique.
+ * Then, it caches its index in &load_info->index.info.
+ * Finally, it tries to populate the name to improve error messages.
+ *
+ * Return: %0 if valid, %-ENOEXEC if multiple modinfo sections were found.
+ */
+static int elf_validity_cache_index_info(struct load_info *info)
+{
+	int info_idx;
+
+	info_idx = find_any_unique_sec(info, ".modinfo");
+
+	if (info_idx == 0)
+		/* Early return, no .modinfo */
+		return 0;
+
+	if (info_idx < 0) {
+		pr_err("Only one .modinfo section must exist.\n");
+		return -ENOEXEC;
+	}
+
+	info->index.info = info_idx;
+	/* Try to find a name early so we can log errors with a module name */
+	info->name = get_modinfo(info, "name");
+
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1880,13 +1945,15 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	Elf_Shdr *shdr;
 	int err;
 	unsigned int num_mod_secs = 0, mod_idx;
-	unsigned int num_info_secs = 0, info_idx;
 	unsigned int num_sym_secs = 0, sym_idx;
 
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
 		return err;
 	err = elf_validity_cache_secstrings(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_info(info);
 	if (err < 0)
 		return err;
 
@@ -1912,24 +1979,11 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 				   ".gnu.linkonce.this_module") == 0) {
 				num_mod_secs++;
 				mod_idx = i;
-			} else if (strcmp(info->secstrings + shdr->sh_name,
-				   ".modinfo") == 0) {
-				num_info_secs++;
-				info_idx = i;
 			}
 			break;
 		}
 	}
 
-	if (num_info_secs > 1) {
-		pr_err("Only one .modinfo section must exist.\n");
-		goto no_exec;
-	} else if (num_info_secs == 1) {
-		/* Try to find a name early so we can log errors with a module name */
-		info->index.info = info_idx;
-		info->name = get_modinfo(info, "name");
-	}
-
 	if (num_sym_secs != 1) {
 		pr_warn("%s: module has no symbols (stripped?)\n",
 			info->name ?: "(missing .modinfo section or name field)");
-- 
2.46.1.824.gd892dcdcdd-goog


