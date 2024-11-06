Return-Path: <linux-kbuild+bounces-4531-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDEC9BF5FB
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 20:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F9C1F223EE
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 19:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AF5202F8D;
	Wed,  6 Nov 2024 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="siaAa8ha"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B0646;
	Wed,  6 Nov 2024 19:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919772; cv=none; b=lhCujtljSi3/hO7patSH1s1T2M06eJNLy/pnmgse+ZB1LR1CcuargRa/qQZY1fwZ02cjm2VjodowztFE/4vUZavDaFg9kp3Qo9Jw6+FACsOKP6DNmkH9NRjDkYvk+PVgSOy9NVsMwWjxOew+pmvLeTlBcY7ki1GF1ZUKJ7rWanA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919772; c=relaxed/simple;
	bh=IhNmAHl50eN2Qntv98/NdsYVBigGbufrZ49dx0S8UfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAd12gBVxPVC93HTf1sRZu0iydFA/4d79NMyJ712GlncN+Sct6v6r2/umjntUMWXkbDamJ34ofEEItCkD7DKnGrB1cS0fcuFfphe2hO1+g4CJj/whOfIHyPcLUYU4G9SOvY2TK4GTGnagwy8nsqceB8sMprJk3cYBA1jdKqpK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=siaAa8ha; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=9QSSI/uYI0CEB6fzsQ7FkjhfiqW1QbCWsDx3P3extjI=; b=siaAa8hau4q9E3xQgArws/8Mvu
	76jfTHf5Rnw/55kK7T0Glkqd/6oDCE0sXsjXs5gGKaie6jRpzKEbswwzQ2inuelKaWyj+/3Qv30bp
	ghYt7KNNEGMp0hU78rCU2svK2HpBzVqBVoeGA/TNcUAjCUXV+Ao4aEIN4DxRyR75Qg2MbAvrOFpv/
	Jjf291PKmJRAJ9CLS7a+iJfdAr11ffaydh0NLcrrzqnK/5exYlpSO/UKkNLR7Y5ipIroomOOG7wK4
	r3VzTWJAuhPqO0++tCkfQSBnI13SexeHudUr7wGjv2ZJUa4OyhPw9bK5OeGGA4wafInTfuaiuvWky
	5EbGtnJQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lIf-000000059H0-0ND9;
	Wed, 06 Nov 2024 19:02:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C4A5E300478; Wed,  6 Nov 2024 20:02:40 +0100 (CET)
Date: Wed, 6 Nov 2024 20:02:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org, hpa@zytor.com, mcgrof@kernel.org, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: [RFC] module: Strict per-modname namespaces
Message-ID: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've been wanting $topic for a while, and having just stumbled into the
whole namespace thing by accident, I figured I'd give it a go, most if
the hard parts seem to have already been done.

It reserves and disallows imports on any "MODULE_${name}" namespace,
while it implicitly adds the same namespace to every module.

This allows exports targeted at specific modules and no others -- one
random example included. I've hated the various kvm exports we've had
for a while, and strictly limiting them to the kvm module helps
alleviate some abuse potential.

---
 arch/x86/kernel/fpu/core.c |  2 +-
 kernel/module/main.c       | 28 ++++++++++++++++++++++++++--
 scripts/mod/modpost.c      | 29 ++++++++++++++++++++---------
 3 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 1209c7aebb21..23b188a53d9d 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -366,7 +366,7 @@ int fpu_swap_kvm_fpstate(struct fpu_guest *guest_fpu, bool enter_guest)
 	fpregs_unlock();
 	return 0;
 }
-EXPORT_SYMBOL_GPL(fpu_swap_kvm_fpstate);
+EXPORT_SYMBOL_NS_GPL(fpu_swap_kvm_fpstate, MODULE_kvm);
 
 void fpu_copy_guest_fpstate_to_uabi(struct fpu_guest *gfpu, void *buf,
 				    unsigned int size, u64 xfeatures, u32 pkru)
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12..b30af879c2cb 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1070,6 +1070,13 @@ static int verify_namespace_is_imported(const struct load_info *info,
 
 	namespace = kernel_symbol_namespace(sym);
 	if (namespace && namespace[0]) {
+		/*
+		 * Implicitly import MODULE_${mod->name} namespace.
+		 */
+		if (strncmp(namespace, "MODULE_", 7) == 0 &&
+		    strcmp(namespace+7, mod->name) == 0)
+			return 0;
+
 		for_each_modinfo_entry(imported_namespace, info, "import_ns") {
 			if (strcmp(namespace, imported_namespace) == 0)
 				return 0;
@@ -1613,15 +1620,30 @@ static void module_license_taint_check(struct module *mod, const char *license)
 	}
 }
 
-static void setup_modinfo(struct module *mod, struct load_info *info)
+static int setup_modinfo(struct module *mod, struct load_info *info)
 {
 	struct module_attribute *attr;
+	char *imported_namespace;
 	int i;
 
 	for (i = 0; (attr = modinfo_attrs[i]); i++) {
 		if (attr->setup)
 			attr->setup(mod, get_modinfo(info, attr->attr.name));
 	}
+
+	for_each_modinfo_entry(imported_namespace, info, "import_ns") {
+		/*
+		 * 'MODULE_' prefixed namespaces are implicit, disallow
+		 * explicit imports.
+		 */
+		if (strstarts(imported_namespace, "MODULE_")) {
+			pr_err("%s: module tries to import module namespace: %s\n",
+			       mod->name, imported_namespace);
+			return -EPERM;
+		}
+	}
+
+	return 0;
 }
 
 static void free_modinfo(struct module *mod)
@@ -2935,7 +2957,9 @@ static int load_module(struct load_info *info, const char __user *uargs,
 		goto free_unload;
 
 	/* Set up MODINFO_ATTR fields */
-	setup_modinfo(mod, info);
+	err = setup_modinfo(mod, info);
+	if (err)
+		goto free_modinfo;
 
 	/* Fix up syms, so that st_value is a pointer to location. */
 	err = simplify_symbols(mod, info);
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..d1de3044ee03 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1553,8 +1553,19 @@ static void mod_set_crcs(struct module *mod)
 	free(buf);
 }
 
+static const char *mod_basename(const char *modname)
+{
+	const char *basename = strrchr(modname, '/');
+	if (basename)
+		basename++;
+	else
+		basename = modname;
+	return basename;
+}
+
 static void read_symbols(const char *modname)
 {
+	char module_namespace[MODULE_NAME_LEN + 8];
 	const char *symname;
 	char *version;
 	char *license;
@@ -1586,12 +1597,16 @@ static void read_symbols(const char *modname)
 			license = get_next_modinfo(&info, "license", license);
 		}
 
-		namespace = get_modinfo(&info, "import_ns");
-		while (namespace) {
+		for (namespace = get_modinfo(&info, "import_ns"); namespace;
+		     namespace = get_next_modinfo(&info, "import_ns", namespace)) {
+			if (strstarts(namespace, "MODULE_"))
+				error("importing implicit module namespace: %s\n", namespace);
+
 			add_namespace(&mod->imported_namespaces, namespace);
-			namespace = get_next_modinfo(&info, "import_ns",
-						     namespace);
 		}
+		snprintf(module_namespace, sizeof(module_namespace), "MODULE_%s",
+			 mod_basename(mod->name));
+		add_namespace(&mod->imported_namespaces, module_namespace);
 
 		if (extra_warn && !get_modinfo(&info, "description"))
 			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
@@ -1700,11 +1715,7 @@ static void check_exports(struct module *mod)
 		s->crc_valid = exp->crc_valid;
 		s->crc = exp->crc;
 
-		basename = strrchr(mod->name, '/');
-		if (basename)
-			basename++;
-		else
-			basename = mod->name;
+		basename = mod_basename(mod->name);
 
 		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
 			modpost_log(!allow_missing_ns_imports,

