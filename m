Return-Path: <linux-kbuild+bounces-12295-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHJaNQGkxWnBAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12295-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:24:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4769133BD2D
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71B5A30648A0
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4333A7F46;
	Thu, 26 Mar 2026 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i3cv8mzm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491FE3A7F50
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560101; cv=none; b=bZfPNOVtPTqjzXo46qN16EfV5Y8Qqq5fjHB9yDtFiXhqFsvRyNjqqqujpD3LmYcIfEoHiFRliemXldPaF8s0OnP15zIR2nH/sjMoxQr4KMpe2fcGQQACSdf8GlB26aZok7yTBTHEKW7Lxd3YGggC9FcsmgMZOcR+ogUZRm+sV8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560101; c=relaxed/simple;
	bh=siB77Fn1mr2A8ag+YsCmtEedmZaaEXq5RbfZxU90iRg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QnJpe03up6qX88Ar3yv7gffL1k3EKjtE+DNiikiibL/LP2Bl39B5eZ0tAtusKGaKuTi5K34Z6IluirZVN1JmYWDKPclQVRZgJDZ/3GZBs+mx4FHI9zDv5/UF6tr+PBuyQNL/MrP/+15uFdfGtWIFQWDiBO5TELpqeRuX8hUZ/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i3cv8mzm; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-486fc42c83aso11601785e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560097; x=1775164897; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=66LkDoxiIORn8ltcTUmDR4YaWJ5RIn42FKIzW6ohdiA=;
        b=i3cv8mzmpzMqlGu0BdoigL+8b1gTnQyLpMhM5OTPvsvQ1DhI0Rj83iEaZ44bGHrxAg
         JVcBXh70XdgvmXGQGA3KEBn+Xq9w5jUp1aE8s4ziRusboBvbA7NLoPrtyq3c3IfeEAvd
         ci8rguZBmGW2G+2T38ag2w3enE5p83xLZG0upeEff7zRjaJQ4APfeFbbnFEqu894zyte
         gmKeZGF6D3XFSIYB82oFYRHtL+fpgOFbq9LAjyrH+F8n5kzzVdkoWaHFLT9JSbg0Ah63
         K3dnQ6eqBH1z2M2QNKAjjupZLXnNYN5pFWw/B4W9PB/eaUvucelXSlsgZOhMRZ5fpcVP
         4PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560097; x=1775164897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66LkDoxiIORn8ltcTUmDR4YaWJ5RIn42FKIzW6ohdiA=;
        b=cpTXH3osoji//GkDB2kWKY8enFU1+7Rw8zAEVuF+JfvZIcdhiVynVTOIVADCgt+nrz
         GLEdyfuHa1uUcHp4vSPpbm+DTotbmIESrqPmYy5CZa0iZxwxt7Rw5D6EK9uaczUpSlJ5
         MTjdG31/pO9wntrJoTjoc7irizhxNAZLcpqyVsXJr1bjEyjqootY0n7Td+QCvs7fCYdR
         TnqUICafIqNkY13KGRXuEo8ZXDfCYuNaYMUWYzEIto8mXyEHseOcP4UhoG9Ld1V2EZn0
         oXiRZwSg0itQX7eCtsBk0Eb/5uOznrMfPFDH34HzKOR1bT3MBKqqYECSePWAbFZzOAZv
         j/kg==
X-Forwarded-Encrypted: i=1; AJvYcCVbR7pJa4F/KJwrHSo1ojOzQdm7UyTwIOrXgZL/uzDScGJo6a0TS3rU2U6Mp+srhAc6fmNquybOJDpGkg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZFzNzvu7B1aIxTNUmD7ypvQSNL93aoZagz8gllkNKfSMXtml
	Binv9MEurhZUuXkE8GNOiEz/V/4trHsen0KtRVi5VHpjjjsFcKXddu7uKPLcCuXDpnkRBjK7CfL
	xeBKEXNDp7QZalV1DZw==
X-Received: from wruo7.prod.google.com ([2002:a5d:6707:0:b0:43b:88ab:dd35])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a06:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48727d59ce3mr4100605e9.4.1774560097408;
 Thu, 26 Mar 2026 14:21:37 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:21:32 +0000
In-Reply-To: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-4-455cd723dddf@google.com>
Subject: [PATCH v5 4/7] module: use kflagstab instead of *_gpl sections
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, gprocida@google.com
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12295-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 4769133BD2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Read kflagstab section for vmlinux and modules to determine whether
kernel symbols are GPL only.

This patch eliminates the need for fragmenting the ksymtab for infering
the value of GPL-only symbol flag, henceforth stop using the *_gpl
versions of the ksymtab and kcrctab in modpost.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/export-internal.h | 21 ++++++++--------
 include/linux/module.h          |  1 +
 kernel/module/internal.h        |  1 +
 kernel/module/main.c            | 55 ++++++++++++++++++++++-------------------
 scripts/mod/modpost.c           |  8 +++---
 5 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
index 4123c7592404..726054614752 100644
--- a/include/linux/export-internal.h
+++ b/include/linux/export-internal.h
@@ -37,14 +37,14 @@
  * section flag requires it. Use '%progbits' instead of '@progbits' since the
  * former apparently works on all arches according to the binutils source.
  */
-#define __KSYMTAB(name, sym, sec, ns)						\
+#define __KSYMTAB(name, sym, ns)						\
 	asm("	.section \"__ksymtab_strings\",\"aMS\",%progbits,1"	"\n"	\
 	    "__kstrtab_" #name ":"					"\n"	\
 	    "	.asciz \"" #name "\""					"\n"	\
 	    "__kstrtabns_" #name ":"					"\n"	\
 	    "	.asciz \"" ns "\""					"\n"	\
 	    "	.previous"						"\n"	\
-	    "	.section \"___ksymtab" sec "+" #name "\", \"a\""	"\n"	\
+	    "	.section \"___ksymtab+" #name "\", \"a\""		"\n"	\
 		__KSYM_ALIGN						"\n"	\
 	    "__ksymtab_" #name ":"					"\n"	\
 		__KSYM_REF(sym)						"\n"	\
@@ -59,15 +59,16 @@
 #define KSYM_FUNC(name)		name
 #endif
 
-#define KSYMTAB_FUNC(name, sec, ns)	__KSYMTAB(name, KSYM_FUNC(name), sec, ns)
-#define KSYMTAB_DATA(name, sec, ns)	__KSYMTAB(name, name, sec, ns)
+#define KSYMTAB_FUNC(name, ns)	__KSYMTAB(name, KSYM_FUNC(name), ns)
+#define KSYMTAB_DATA(name, ns)	__KSYMTAB(name, name, ns)
 
-#define SYMBOL_CRC(sym, crc, sec)   \
-	asm(".section \"___kcrctab" sec "+" #sym "\",\"a\""	"\n" \
-	    ".balign 4"						"\n" \
-	    "__crc_" #sym ":"					"\n" \
-	    ".long " #crc					"\n" \
-	    ".previous"						"\n")
+#define SYMBOL_CRC(sym, crc)					\
+	asm("	.section \"___kcrctab+" #sym "\",\"a\""	"\n"	\
+	    "	.balign 4"				"\n"	\
+	    "__crc_" #sym ":"				"\n"	\
+	    "	.long " #crc				"\n"	\
+	    "	.previous"				"\n"	\
+	)
 
 #define SYMBOL_FLAGS(sym, flags)					\
 	asm("	.section \"___kflagstab+" #sym "\",\"a\""	"\n"	\
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
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 1d721fe67caf..9d96acce60a8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1876,9 +1876,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 		if (trim_unused_exports && !sym->used)
 			continue;
 
-		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\", \"%s\");\n",
+		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\");\n",
 			   sym->is_func ? "FUNC" : "DATA", sym->name,
-			   sym->is_gpl_only ? "_gpl" : "", sym->namespace);
+			   sym->namespace);
 
 		buf_printf(buf, "SYMBOL_FLAGS(%s, 0x%02x);\n",
 			   sym->name, get_symbol_flags(sym));
@@ -1899,8 +1899,8 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 			     sym->name, mod->name, mod->is_vmlinux ? "" : ".ko",
 			     sym->name);
 
-		buf_printf(buf, "SYMBOL_CRC(%s, 0x%08x, \"%s\");\n",
-			   sym->name, sym->crc, sym->is_gpl_only ? "_gpl" : "");
+		buf_printf(buf, "SYMBOL_CRC(%s, 0x%08x);\n",
+			   sym->name, sym->crc);
 	}
 }
 

-- 
2.53.0.1018.g2bb0e51243-goog


