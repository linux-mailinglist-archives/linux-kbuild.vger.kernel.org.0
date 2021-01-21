Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23E92FE479
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 08:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbhAUH5R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 02:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbhAUH5J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 02:57:09 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F012C0613C1;
        Wed, 20 Jan 2021 23:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=4Y4WG8Uqq3Fr3ZbSyujH81/zLcmhLQeyMZrPmYpaSfs=; b=gfQGRs+ybgtt0b1trgvvE4ZWZt
        eupX0gZGZ2vKZsHa+LtMtoYO8fQzK2YixRspVP0wE5dwUXEqJfSFsfgvyqPcw1RxdM0+CHnyALETb
        2mInNOu30kDq3okijhQ+7cD0ubNKjWYCDWuz/Bt7WckeIHGgv08a6HIgbduBnFO/xNK0wKXSloNG1
        94KBoStfr1SdGj0srGN2vNsuX1+Xcl6dyqOlQzyTUsfN+Cx4QQc9Js69/hMKQKcKaEq/qAnjM+ywL
        vNoGxvQsYslHRxQ9OtAkfsWVziQaETCLjUjkU+YkbMhzAXszHL22pffwKbHGUawWigEEhYQo7ZsJk
        5P1blSNA==;
Received: from [2001:4bb8:188:1954:d5b3:2657:287:e45f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l2Uoc-00GmFc-8e; Thu, 21 Jan 2021 07:55:55 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 11/13] module: pass struct find_symbol_args to find_symbol
Date:   Thu, 21 Jan 2021 08:49:57 +0100
Message-Id: <20210121074959.313333-12-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121074959.313333-1-hch@lst.de>
References: <20210121074959.313333-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Simplify the calling convention by passing the find_symbol_args structure
to find_symbol instead of initializing it inside the function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/module.c | 113 ++++++++++++++++++++++--------------------------
 1 file changed, 52 insertions(+), 61 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 644dda52dae38c..7a88b71736ff5c 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -536,12 +536,7 @@ static bool find_exported_symbol_in_section(const struct symsearch *syms,
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
@@ -561,19 +556,14 @@ static const struct kernel_symbol *find_symbol(const char *name,
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
@@ -603,21 +593,12 @@ static const struct kernel_symbol *find_symbol(const char *name,
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
@@ -1107,12 +1088,15 @@ static inline void print_unload_info(struct seq_file *m, struct module *mod)
 
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
@@ -1381,19 +1365,22 @@ static int check_version(const struct load_info *info,
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
@@ -1487,10 +1474,11 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
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
@@ -1500,42 +1488,40 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
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
@@ -2296,16 +2282,19 @@ static void free_module(struct module *mod)
 
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
+	if (!find_symbol(&fsa) || !strong_try_module_get(fsa.owner)) {
+		preempt_enable();
+		return NULL;
+	}
 	preempt_enable();
-
-	return sym ? (void *)kernel_symbol_value(sym) : NULL;
+	return (void *)kernel_symbol_value(fsa.sym);
 }
 EXPORT_SYMBOL_GPL(__symbol_get);
 
@@ -2318,7 +2307,6 @@ EXPORT_SYMBOL_GPL(__symbol_get);
 static int verify_exported_symbols(struct module *mod)
 {
 	unsigned int i;
-	struct module *owner;
 	const struct kernel_symbol *s;
 	struct {
 		const struct kernel_symbol *sym;
@@ -2335,12 +2323,15 @@ static int verify_exported_symbols(struct module *mod)
 
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

