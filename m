Return-Path: <linux-kbuild+bounces-8659-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E6B3B963
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 12:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FF441BA3D37
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 10:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD07B3148A0;
	Fri, 29 Aug 2025 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FVQZPi02"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA0311944
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464877; cv=none; b=fE5VSEr6++jbc56u9+8qN5sWFJZf68ACjQ8xYeurg46fZKvaTQZ5L5NXrvVFeYn6LvhVmGOSH97D8aI/owu2EYMYM+PCuuqS59hUPdJdIbS8u83e+x5KAACRlHAINIl1m5zL9m0aB41uX19sJhVTPkdO2QbLonH2nXchPo3Rl84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464877; c=relaxed/simple;
	bh=XdwddMlnNDe/bejk9AlmOKSmzkod84XNORyHGHdp5tQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UZCsRz8IpjDIMGZ9ky0Xqjtltk+94yVVBO1oag7OVJfWeFW5GCOYHLdqDM3uCTmhY0w440ssoPPv0tkIp50LziuuukQuhvo4fd1LdsAkYgI5qLQ82eZ1VJVUKdJyvXFA61oo1SMriVfD5CKJqzTeV7W9+hti/IPiwaIh1DRFHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FVQZPi02; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1b0c5366so12288625e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 03:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756464874; x=1757069674; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZkdXrnu4rlNqr6nvqy7s2PHRCwIZIrYjOI0uDxkuo0=;
        b=FVQZPi02OrLY+h9w6d9mz/U2t/rLyG+ylXdwMosWOMbdcZ+D8FuWI9/iOm+E+BfE7s
         iddbFq8vl0Dd6aWZp6PWGhlltRGX8NCZFYRF0SQmvwYYCdljU851Lq82h8UwsIasU7H9
         Xcyk3OJ1YlFJz++Gvev1cW9vzt52jsBv479Uki5WORzgUn0l2m6t3KkQAY3FcTrE9+qz
         w6JALXp8GB+LYZtcY+PwDp8c0jdVr70w5Saz33Jwde5yc34NZKNnFS6H5JEc9g3acN8c
         rNPGftRRi+fdCNF7w8KW6Mb2tC5qSxOZNIP3mLMcyHcUwWxbMlL9pw4pISElY5Wkddt3
         aa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756464874; x=1757069674;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZkdXrnu4rlNqr6nvqy7s2PHRCwIZIrYjOI0uDxkuo0=;
        b=R3PZ/bmALW9Jpq2sVtREsYVWUJjtuH2Edu4Ynu9urM8KiMUlELZ0NF2rSz6S7be1ui
         lG95JI/JzcxveBwmfHO43i9ckj536N6oHs5hT8VQKi0VLHLkL2SBIQ84PNpEugyFmJGw
         COeHFi7wMSxwdp5TwjQAg83uNmcbN2TsaWsYpTZxi2xvxmkMY7XCE7lzrq7yLpEKF8Dy
         iE7nHAnd4N0ew5hGNUrkkmhx7LUEyLss2hrFFbdd6rFcU7J06Md2h4nWVIgZXp9m95AX
         iFgFfK5QfgW0AU6ptW1i+kQLvD/jPFJJhYwkLX14EwLEGEFgAmls9+sqrAuY2yui+y8/
         TKPg==
X-Forwarded-Encrypted: i=1; AJvYcCVw45Dv92QaRq9Bgd+DYwc5XKKGZx2Q4dp/bC0pGetfcaKQ1Fm9AmPvfMXJ5jVTwbLiRuXUF1DjBrHolYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwypBmAnsT1KFpNQCM4HhZYQn4S5uDkVBi6SHyUw9bTvCY2/HV4
	X6BkRn+fDVs1JKPwzdgdmIMvJv3+ZXxpMkUPIC0b7ESvwS21w5OHUNNSJHq7wHZLaMko9Qa2PNp
	soTGGERJnLcRy/a2fHw==
X-Google-Smtp-Source: AGHT+IETLQhhj0TWH9cTHkmUejWaasllcxIG4MgQGiEsNA2+oYnEukedB/VKaaNhilCldwAcOXfj5vhFRG0qg14=
X-Received: from wmbee21.prod.google.com ([2002:a05:600c:6415:b0:459:dd4e:4446])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19d4:b0:45b:6365:794e with SMTP id 5b1f17b1804b1-45b70ee5db1mr92752335e9.24.1756464873773;
 Fri, 29 Aug 2025 03:54:33 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:54:12 +0000
In-Reply-To: <20250829105418.3053274-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250829105418.3053274-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829105418.3053274-5-sidnayyar@google.com>
Subject: [PATCH 04/10] module loader: use kflagstab instead of *_gpl sections
From: Siddharth Nayyar <sidnayyar@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, Petr Pavlu <petr.pavlu@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"

Read __kflagstab section for vmlinux and modules to determine whether
kernel symbols are GPL only.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 include/linux/module.h   |  1 +
 kernel/module/internal.h |  1 +
 kernel/module/main.c     | 47 ++++++++++++++++++++--------------------
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 3319a5269d28..9ba6ce433ac3 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -415,6 +415,7 @@ struct module {
 	/* Exported symbols */
 	const struct kernel_symbol *syms;
 	const u32 *crcs;
+	const u8 *flagstab;
 	unsigned int num_syms;
 
 #ifdef CONFIG_ARCH_USES_CFI_TRAPS
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 618202578b42..69b84510e097 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -57,6 +57,7 @@ extern const struct kernel_symbol __start___ksymtab_gpl[];
 extern const struct kernel_symbol __stop___ksymtab_gpl[];
 extern const u32 __start___kcrctab[];
 extern const u32 __start___kcrctab_gpl[];
+extern const u8 __start___kflagstab[];
 
 #define KMOD_PATH_LEN 256
 extern char modprobe_path[];
diff --git a/kernel/module/main.c b/kernel/module/main.c
index c66b26184936..400d59a7f44b 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -11,6 +11,7 @@
 #include <linux/extable.h>
 #include <linux/moduleloader.h>
 #include <linux/module_signature.h>
+#include <linux/module_symbol.h>
 #include <linux/trace_events.h>
 #include <linux/init.h>
 #include <linux/kallsyms.h>
@@ -87,7 +88,7 @@ struct mod_tree_root mod_tree __cacheline_aligned = {
 struct symsearch {
 	const struct kernel_symbol *start, *stop;
 	const u32 *crcs;
-	enum mod_license license;
+	const u8 *flagstab;
 };
 
 /*
@@ -364,19 +365,21 @@ static bool find_exported_symbol_in_section(const struct symsearch *syms,
 					    struct find_symbol_arg *fsa)
 {
 	struct kernel_symbol *sym;
-
-	if (!fsa->gplok && syms->license == GPL_ONLY)
-		return false;
+	u8 sym_flags;
 
 	sym = bsearch(fsa->name, syms->start, syms->stop - syms->start,
 			sizeof(struct kernel_symbol), cmp_name);
 	if (!sym)
 		return false;
 
+	sym_flags = *(syms->flagstab + (sym - syms->start));
+	if (!fsa->gplok && (sym_flags & KSYM_FLAG_GPL_ONLY))
+		return false;
+
 	fsa->owner = owner;
 	fsa->crc = symversion(syms->crcs, sym - syms->start);
 	fsa->sym = sym;
-	fsa->license = syms->license;
+	fsa->license = (sym_flags & KSYM_FLAG_GPL_ONLY) ? GPL_ONLY : NOT_GPL_ONLY;
 
 	return true;
 }
@@ -387,36 +390,31 @@ static bool find_exported_symbol_in_section(const struct symsearch *syms,
  */
 bool find_symbol(struct find_symbol_arg *fsa)
 {
-	static const struct symsearch arr[] = {
-		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
-		  NOT_GPL_ONLY },
-		{ __start___ksymtab_gpl, __stop___ksymtab_gpl,
-		  __start___kcrctab_gpl,
-		  GPL_ONLY },
+	const struct symsearch syms = {
+		.start		= __start___ksymtab,
+		.stop		= __stop___ksymtab,
+		.crcs		= __start___kcrctab,
+		.flagstab	= __start___kflagstab,
 	};
 	struct module *mod;
-	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(arr); i++)
-		if (find_exported_symbol_in_section(&arr[i], NULL, fsa))
-			return true;
+	if (find_exported_symbol_in_section(&syms, NULL, fsa))
+		return true;
 
 	list_for_each_entry_rcu(mod, &modules, list,
 				lockdep_is_held(&module_mutex)) {
-		struct symsearch arr[] = {
-			{ mod->syms, mod->syms + mod->num_syms, mod->crcs,
-			  NOT_GPL_ONLY },
-			{ mod->gpl_syms, mod->gpl_syms + mod->num_gpl_syms,
-			  mod->gpl_crcs,
-			  GPL_ONLY },
+		const struct symsearch syms = {
+			.start		= mod->syms,
+			.stop		= mod->syms + mod->num_syms,
+			.crcs		= mod->crcs,
+			.flagstab	= mod->flagstab,
 		};
 
 		if (mod->state == MODULE_STATE_UNFORMED)
 			continue;
 
-		for (i = 0; i < ARRAY_SIZE(arr); i++)
-			if (find_exported_symbol_in_section(&arr[i], mod, fsa))
-				return true;
+		if (find_exported_symbol_in_section(&syms, mod, fsa))
+			return true;
 	}
 
 	pr_debug("Failed to find symbol %s\n", fsa->name);
@@ -2607,6 +2605,7 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 				     sizeof(*mod->gpl_syms),
 				     &mod->num_gpl_syms);
 	mod->gpl_crcs = section_addr(info, "__kcrctab_gpl");
+	mod->flagstab = section_addr(info, "__kflagstab");
 
 #ifdef CONFIG_CONSTRUCTORS
 	mod->ctors = section_objs(info, ".ctors",
-- 
2.51.0.338.gd7d06c2dae-goog


