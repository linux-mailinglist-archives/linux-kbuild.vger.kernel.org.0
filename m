Return-Path: <linux-kbuild+bounces-6879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F1AA74EE
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 16:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7905D3A2E23
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1102566FA;
	Fri,  2 May 2025 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nbODw3Ow"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698182561D4;
	Fri,  2 May 2025 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195965; cv=none; b=IyNc3k15o3ALpPj6RSpdx+jNqIDT7bsp/r88GGKnmPfxV9nSRrKqMIznPSSt4AcEIoaTFNcANHvop0EcE7EYcaUr0WuCsHl+YC7qM1wim7WZB3csc9LGlydOOqpb1m54GwukryC0id6g6ZVMg4UYrIxypRsBb/m4UBwQFtGR41Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195965; c=relaxed/simple;
	bh=Ev5in1o5uPO+eUSus0eAQkz9t8/6/6cCR+cECSU4aPc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=MBFe6Cp1rVgS0yeHGh1Vbr06DXSuqtDMsUHMYaAzws4ejXOfHptQZM+jBurX0g5c5PBS0GjFj5v6SeExjB/CGMxhwjftAhojXrijtzAWBQf1L93B91FkhJ5GJFMcJ9iQIFv9plU97DGHUIP5LApGQQSTWlSZm4jnvRbMm+6rLr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nbODw3Ow; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=orH9pxNknjY+XgTLI4Ne4ZRWvYOjc6KHHMNe5II3pf4=; b=nbODw3Owl/GGA/xJnl/eCynY6n
	5tIcrA2tYzQtT68Cq/PYDddPQvx+nVKFpmerX7zfXvDq6lOZDOqfWM33HF+kjC1Bhn9XYsZjOFNkq
	iFpmiFPlWmn0J0ro1tTPEAyCBmoZmpLZ+uavk0vUofn46snq55aalIK9JM4wH8vuPN15/kbAhBjtt
	YTLCy2M08Q7g+Wkp3AzhhLfokUTsz9DSyK4OYJju5Uy9W/9tA+eBSssmyAaBonOmPqDNHZH4er85z
	Xl/hv+0NGpnrqdd3XGGujE9KO4ucBWxGAJK/Axq3au7aSf/RIsbxzuz6xAV4A5S6C6Du3Vkg/Q3O4
	oM7Eaeyg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArKC-00000002iJi-3DtM;
	Fri, 02 May 2025 14:25:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E81DD300780; Fri,  2 May 2025 16:24:59 +0200 (CEST)
Message-ID: <20250502141844.046738270@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 02 May 2025 16:12:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org,
 hpa@zytor.com,
 petr.pavlu@suse.com,
 samitolvanen@google.com,
 da.gomez@samsung.com,
 masahiroy@kernel.org,
 nathan@kernel.org,
 nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 hch@infradead.org,
 gregkh@linuxfoundation.org,
 roypat@amazon.co.uk,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 2/5] module: Add module specific symbol namespace support
References: <20250502141204.500293812@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Designate the "module:${modname}" symbol namespace to mean: 'only
export to the named module'.

Notably, explicit imports of anything in the "module:" space is
forbidden.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/module/main.c  |   33 +++++++++++++++++++++++++++++++--
 scripts/mod/modpost.c |   11 ++++++++++-
 2 files changed, 41 insertions(+), 3 deletions(-)

--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1083,6 +1083,14 @@ static char *get_modinfo(const struct lo
 	return get_next_modinfo(info, tag, NULL);
 }
 
+static bool verify_module_namespace(const char *namespace, const char *modname)
+{
+	const char *prefix = "module:";
+
+	return strstarts(namespace, prefix) &&
+	       !strsmp(namespace + strlen(prefix), modname);
+}
+
 static int verify_namespace_is_imported(const struct load_info *info,
 					const struct kernel_symbol *sym,
 					struct module *mod)
@@ -1092,6 +1100,10 @@ static int verify_namespace_is_imported(
 
 	namespace = kernel_symbol_namespace(sym);
 	if (namespace && namespace[0]) {
+
+		if (verify_module_namespace(namespace, mod->name))
+			return 0;
+
 		for_each_modinfo_entry(imported_namespace, info, "import_ns") {
 			if (strcmp(namespace, imported_namespace) == 0)
 				return 0;
@@ -1659,15 +1671,30 @@ static void module_license_taint_check(s
 	}
 }
 
-static void setup_modinfo(struct module *mod, struct load_info *info)
+static int setup_modinfo(struct module *mod, struct load_info *info)
 {
 	const struct module_attribute *attr;
+	char *imported_namespace;
 	int i;
 
 	for (i = 0; (attr = modinfo_attrs[i]); i++) {
 		if (attr->setup)
 			attr->setup(mod, get_modinfo(info, attr->attr.name));
 	}
+
+	for_each_modinfo_entry(imported_namespace, info, "import_ns") {
+		/*
+		 * 'module:' prefixed namespaces are implicit, disallow
+		 * explicit imports.
+		 */
+		if (strstarts(imported_namespace, "module:")) {
+			pr_err("%s: module tries to import module namespace: %s\n",
+			       mod->name, imported_namespace);
+			return -EPERM;
+		}
+	}
+
+	return 0;
 }
 
 static void free_modinfo(struct module *mod)
@@ -3335,7 +3362,9 @@ static int load_module(struct load_info
 		goto free_unload;
 
 	/* Set up MODINFO_ATTR fields */
-	setup_modinfo(mod, info);
+	err = setup_modinfo(mod, info);
+	if (err)
+		goto free_modinfo;
 
 	/* Fix up syms, so that st_value is a pointer to location. */
 	err = simplify_symbols(mod, info);
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1682,6 +1682,14 @@ void buf_write(struct buffer *buf, const
 	buf->pos += len;
 }
 
+static bool verify_module_namespace(const char *namespace, const char *modname)
+{
+	const char *prefix = "module:";
+
+	return strstarts(namespace, prefix) &&
+	       !strcmp(namespace + strlen(prefix), modname);
+}
+
 static void check_exports(struct module *mod)
 {
 	struct symbol *s, *exp;
@@ -1709,7 +1717,8 @@ static void check_exports(struct module
 
 		basename = get_basename(mod->name);
 
-		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
+		if (!verify_module_namespace(exp->namespace, basename) &&
+		    !contains_namespace(&mod->imported_namespaces, exp->namespace)) {
 			modpost_log(!allow_missing_ns_imports,
 				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
 				    basename, exp->name, exp->namespace);



