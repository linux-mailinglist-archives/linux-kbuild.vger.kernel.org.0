Return-Path: <linux-kbuild+bounces-11590-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE0OMQG2qWlEDAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11590-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:57:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942B215B4F
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6154F3172B0A
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 16:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D983DFC7E;
	Thu,  5 Mar 2026 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQrUUkam"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C13E0C47
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729676; cv=none; b=rUrD6PYX404oH39znjywGDm004vd91q4YYeNJE2tFyGZTNVTOfJq1LsC85C8XZekvEFECmQcuqkCep9ZM4POWDXmAK3hrYVa7PHLK/X57RC/BBN/+WTHJ4PwtYbKmaShBqHtBJJm74gSnVBc5y3MqYa1AS5i9roMhpSj3W+J3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729676; c=relaxed/simple;
	bh=TpZmRegtqEbXTTVHSkwGbHY5Ll9KMK2Mxg+dapA2VWM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NwD7SoEOEV4nJW7tfrHK7QrtYb8PXxt1+ZN0//LMHUNnaYhK63dP5uGlxff8LIsIHd9E6mtsSam32FesciBDcjpKaDP9gq9pEKTl5/WsxVv5lhVZKGUJFDGXLvq4w4uPmiy6TIdv7LMUnqrHrQ42f9HXic7PFhPQayfodp0Bofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQrUUkam; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439aa1d898cso4906053f8f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729673; x=1773334473; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kH4l5sUjOP0TtrWWkDh0aa89yXT1o3HsEp7IF0XRzwQ=;
        b=bQrUUkamxN1QkJYCeRefJ2D3tyeyokD5aDFT/QmtFslOeekId7+b0YOX+53+m9ccJL
         p9/21KJQZGb+TYYaoWsAuBn5U3N3ihZy7t2QpGgKoDaA3Ajmkfiekwz/GNVuwzAhjciA
         9B5EPQ9phmRMBr31t1xbPtPr0Whu9DsXtxDLcUlpSzTJFffZYgCLopHOF3Lkb1Set+Kq
         0Mf2wyara4QitFhem9FfEeLPV/ovR6yJoO7CDzeK8ey/8fcWW1LVjSiqA12VRvdELWsz
         Mpgc/QStXWlC5ixDfczhbY9IFxG8JMrEFmzqjg5e38YvkvEfvthSYunoik+1a9BMBNyN
         Azjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729673; x=1773334473;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kH4l5sUjOP0TtrWWkDh0aa89yXT1o3HsEp7IF0XRzwQ=;
        b=Dq6yQ5+WrGWoE2pTyVEK3D2NEe/4ld4g7ZiX7OSDz3NZXJkoTQ8w/oSTkWn2DZk+OD
         aJWEjOOV0fhKfkw7u66ZPRoYmcqmeyLDCEZHOxl859uZCbQJObtYgt88ZTMjEJsSbceR
         N8i0lq9T6t+PBQviiijybHYtHj1nl8QZU7eJYTEvkGkIRE8c+jOFsBt/hm6aKZgP7eGs
         w1gGkCCDnW+BfzE6KD3o1tO0e9UYFoKa44LK/bdgvxI6082dabbJzGY+gCHkhyyhJGpO
         frjGnK3DWpv6YLCYp9q3eTnQR3N9jP1OTzAQeIz4GviWv78n2feJHh0Os5xLk+iBfBoF
         ILEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJXzSDtzSN2uVw5K2xaOs0KOMesiswIVWE4n/0da34w83WEbtGxu7d/9LDinDEZ4qgXvNpXqBoHH1HhEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv3fgpmNMCkj669iruTcUZplmiBFKHsR0l+5aUyfzjKoxEPXvX
	YrMfNCabd8aeT6WoZ9CVl7MbDIpYsoEAAEZKFDwfm9I2tPzx3/HupATyw0IlYCpD6GdCpbilnmy
	M9ZHon1ppB6TFsVMK8Q==
X-Received: from wrbgx17.prod.google.com ([2002:a05:6000:4711:b0:439:b92c:c91c])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c10:b0:439:bce5:6518 with SMTP id ffacd0b85a97d-439c7fa448bmr11832934f8f.22.1772729672747;
 Thu, 05 Mar 2026 08:54:32 -0800 (PST)
Date: Thu, 05 Mar 2026 16:54:24 +0000
In-Reply-To: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-4-4fe6eea27e30@google.com>
Subject: [PATCH v4 4/8] module loader: use kflagstab instead of *_gpl sections
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 6942B215B4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11590-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Read kflagstab section for vmlinux and modules to determine whether
kernel symbols are GPL only.

This patch eliminates the need for fragmenting the ksymtab for infering
the value of GPL-only symbol flag. The fragmentation of ksymtab is
removed in subsequent patches.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 include/linux/module.h   |  1 +
 kernel/module/internal.h |  1 +
 kernel/module/main.c     | 55 +++++++++++++++++++++++++-----------------------
 3 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 14f391b186c6..aee3accba73c 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -418,6 +418,7 @@ struct module {
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
index c3ce106c70af..d237fa4e0737 100644
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
@@ -2614,6 +2612,7 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 				     sizeof(*mod->gpl_syms),
 				     &mod->num_gpl_syms);
 	mod->gpl_crcs = section_addr(info, "__kcrctab_gpl");
+	mod->flagstab = section_addr(info, "__kflagstab");
 
 #ifdef CONFIG_CONSTRUCTORS
 	mod->ctors = section_objs(info, ".ctors",
@@ -2817,8 +2816,12 @@ static int move_module(struct module *mod, struct load_info *info)
 	return ret;
 }
 
-static int check_export_symbol_versions(struct module *mod)
+static int check_export_symbol_sections(struct module *mod)
 {
+	if (mod->num_syms && !mod->flagstab) {
+		pr_err("%s: no flags for exported symbols\n", mod->name);
+		return -ENOEXEC;
+	}
 #ifdef CONFIG_MODVERSIONS
 	if ((mod->num_syms && !mod->crcs) ||
 	    (mod->num_gpl_syms && !mod->gpl_crcs)) {
@@ -3434,7 +3437,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	if (err)
 		goto free_unload;
 
-	err = check_export_symbol_versions(mod);
+	err = check_export_symbol_sections(mod);
 	if (err)
 		goto free_unload;
 

-- 
2.53.0.473.g4a7958ca14-goog


