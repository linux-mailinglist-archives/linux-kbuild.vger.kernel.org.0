Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5ED630D5CF
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 10:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbhBCJFi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 04:05:38 -0500
Received: from verein.lst.de ([213.95.11.211]:50142 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233085AbhBCJFF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 04:05:05 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 91ED46736F; Wed,  3 Feb 2021 10:04:18 +0100 (CET)
Date:   Wed, 3 Feb 2021 10:04:18 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Miroslav Benes <mbenes@suse.cz>
Cc:     Christoph Hellwig <hch@lst.de>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 10/13] module: pass struct find_symbol_args to
 find_symbol
Message-ID: <20210203090418.GA7833@lst.de>
References: <20210202121334.1361503-1-hch@lst.de> <20210202121334.1361503-11-hch@lst.de> <alpine.LSU.2.21.2102021504550.570@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2102021504550.570@pobox.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

FYI, this is the updated version:

---
From 664ca3378deac7530fe8fc15fe73d583d3333df2 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Wed, 20 Jan 2021 14:58:27 +0100
Subject: module: pass struct find_symbol_args to find_symbol

Simplify the calling convention by passing the find_symbol_args structure
to find_symbol instead of initializing it inside the function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/module.c | 113 ++++++++++++++++++++++--------------------------
 1 file changed, 52 insertions(+), 61 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index ab219a16f35068..e63b16b85da68b 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -531,12 +531,7 @@ static bool find_exported_symbol_in_section(const struct symsearch *syms,
  * Find an exported symbol and return it, along with, (optional) crc and
  * (optional) module which owns it.  Needs preempt disabled or module_mutex.
  */
-static const struct kernel_symbol *find_symbol(const char *name,
-					struct module **owner,
-					const s32 **crc,
-					enum mod_license *license,
-					bool gplok,
-					bool warn)
+static bool find_symbol(struct find_symbol_arg *fsa)
 {
 	static const struct symsearch arr[] = {
 		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
@@ -556,19 +551,14 @@ static const struct kernel_symbol *find_symbol(const char *name,
 		  GPL_ONLY, true },
 #endif
 	};
-	struct find_symbol_arg fsa = {
-		.name = name,
-		.gplok = gplok,
-		.warn = warn,
-	};
 	struct module *mod;
 	unsigned int i;
 
 	module_assert_mutex_or_preempt();
 
 	for (i = 0; i < ARRAY_SIZE(arr); i++)
-		if (find_exported_symbol_in_section(&arr[i], NULL, &fsa))
-			goto found;
+		if (find_exported_symbol_in_section(&arr[i], NULL, fsa))
+			return true;
 
 	list_for_each_entry_rcu(mod, &modules, list,
 				lockdep_is_held(&module_mutex)) {
@@ -598,21 +588,12 @@ static const struct kernel_symbol *find_symbol(const char *name,
 			continue;
 
 		for (i = 0; i < ARRAY_SIZE(arr); i++)
-			if (find_exported_symbol_in_section(&arr[i], mod, &fsa))
-				goto found;
+			if (find_exported_symbol_in_section(&arr[i], mod, fsa))
+				return true;
 	}
 
-	pr_debug("Failed to find symbol %s\n", name);
-	return NULL;
-
-found:
-	if (owner)
-		*owner = fsa.owner;
-	if (crc)
-		*crc = fsa.crc;
-	if (license)
-		*license = fsa.license;
-	return fsa.sym;
+	pr_debug("Failed to find symbol %s\n", fsa->name);
+	return false;
 }
 
 /*
@@ -1074,12 +1055,15 @@ static inline void print_unload_info(struct seq_file *m, struct module *mod)
 
 void __symbol_put(const char *symbol)
 {
-	struct module *owner;
+	struct find_symbol_arg fsa = {
+		.name	= symbol,
+		.gplok	= true,
+	};
 
 	preempt_disable();
-	if (!find_symbol(symbol, &owner, NULL, NULL, true, false))
+	if (!find_symbol(&fsa))
 		BUG();
-	module_put(owner);
+	module_put(fsa.owner);
 	preempt_enable();
 }
 EXPORT_SYMBOL(__symbol_put);
@@ -1348,19 +1332,22 @@ static int check_version(const struct load_info *info,
 static inline int check_modstruct_version(const struct load_info *info,
 					  struct module *mod)
 {
-	const s32 *crc;
+	struct find_symbol_arg fsa = {
+		.name	= "module_layout",
+		.gplok	= true,
+	};
 
 	/*
 	 * Since this should be found in kernel (which can't be removed), no
 	 * locking is necessary -- use preempt_disable() to placate lockdep.
 	 */
 	preempt_disable();
-	if (!find_symbol("module_layout", NULL, &crc, NULL, true, false)) {
+	if (!find_symbol(&fsa)) {
 		preempt_enable();
 		BUG();
 	}
 	preempt_enable();
-	return check_version(info, "module_layout", mod, crc);
+	return check_version(info, "module_layout", mod, fsa.crc);
 }
 
 /* First part is kernel version, which we ignore if module has crcs. */
@@ -1454,10 +1441,11 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
 						  const char *name,
 						  char ownername[])
 {
-	struct module *owner;
-	const struct kernel_symbol *sym;
-	const s32 *crc;
-	enum mod_license license;
+	struct find_symbol_arg fsa = {
+		.name	= name,
+		.gplok	= !(mod->taints & (1 << TAINT_PROPRIETARY_MODULE)),
+		.warn	= true,
+	};
 	int err;
 
 	/*
@@ -1467,42 +1455,40 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
 	 */
 	sched_annotate_sleep();
 	mutex_lock(&module_mutex);
-	sym = find_symbol(name, &owner, &crc, &license,
-			  !(mod->taints & (1 << TAINT_PROPRIETARY_MODULE)), true);
-	if (!sym)
+	if (!find_symbol(&fsa))
 		goto unlock;
 
-	if (license == GPL_ONLY)
+	if (fsa.license == GPL_ONLY)
 		mod->using_gplonly_symbols = true;
 
-	if (!inherit_taint(mod, owner)) {
-		sym = NULL;
+	if (!inherit_taint(mod, fsa.owner)) {
+		fsa.sym = NULL;
 		goto getname;
 	}
 
-	if (!check_version(info, name, mod, crc)) {
-		sym = ERR_PTR(-EINVAL);
+	if (!check_version(info, name, mod, fsa.crc)) {
+		fsa.sym = ERR_PTR(-EINVAL);
 		goto getname;
 	}
 
-	err = verify_namespace_is_imported(info, sym, mod);
+	err = verify_namespace_is_imported(info, fsa.sym, mod);
 	if (err) {
-		sym = ERR_PTR(err);
+		fsa.sym = ERR_PTR(err);
 		goto getname;
 	}
 
-	err = ref_module(mod, owner);
+	err = ref_module(mod, fsa.owner);
 	if (err) {
-		sym = ERR_PTR(err);
+		fsa.sym = ERR_PTR(err);
 		goto getname;
 	}
 
 getname:
 	/* We must make copy under the lock if we failed to get ref. */
-	strncpy(ownername, module_name(owner), MODULE_NAME_LEN);
+	strncpy(ownername, module_name(fsa.owner), MODULE_NAME_LEN);
 unlock:
 	mutex_unlock(&module_mutex);
-	return sym;
+	return fsa.sym;
 }
 
 static const struct kernel_symbol *
@@ -2263,16 +2249,19 @@ static void free_module(struct module *mod)
 
 void *__symbol_get(const char *symbol)
 {
-	struct module *owner;
-	const struct kernel_symbol *sym;
+	struct find_symbol_arg fsa = {
+		.name	= symbol,
+		.gplok	= true,
+		.warn	= true,
+	};
 
 	preempt_disable();
-	sym = find_symbol(symbol, &owner, NULL, NULL, true, true);
-	if (sym && strong_try_module_get(owner))
-		sym = NULL;
+	if (!find_symbol(&fsa) || strong_try_module_get(fsa.owner)) {
+		preempt_enable();
+		return NULL;
+	}
 	preempt_enable();
-
-	return sym ? (void *)kernel_symbol_value(sym) : NULL;
+	return (void *)kernel_symbol_value(fsa.sym);
 }
 EXPORT_SYMBOL_GPL(__symbol_get);
 
@@ -2285,7 +2274,6 @@ EXPORT_SYMBOL_GPL(__symbol_get);
 static int verify_exported_symbols(struct module *mod)
 {
 	unsigned int i;
-	struct module *owner;
 	const struct kernel_symbol *s;
 	struct {
 		const struct kernel_symbol *sym;
@@ -2302,12 +2290,15 @@ static int verify_exported_symbols(struct module *mod)
 
 	for (i = 0; i < ARRAY_SIZE(arr); i++) {
 		for (s = arr[i].sym; s < arr[i].sym + arr[i].num; s++) {
-			if (find_symbol(kernel_symbol_name(s), &owner, NULL,
-					NULL, true, false)) {
+			struct find_symbol_arg fsa = {
+				.name	= kernel_symbol_name(s),
+				.gplok	= true,
+			};
+			if (find_symbol(&fsa)) {
 				pr_err("%s: exports duplicate symbol %s"
 				       " (owned by %s)\n",
 				       mod->name, kernel_symbol_name(s),
-				       module_name(owner));
+				       module_name(fsa.owner));
 				return -ENOEXEC;
 			}
 		}
-- 
2.29.2

