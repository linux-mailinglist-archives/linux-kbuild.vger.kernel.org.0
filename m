Return-Path: <linux-kbuild+bounces-4638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D79C3CF6
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82540282D09
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130A919CCFC;
	Mon, 11 Nov 2024 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Hn9MmnYb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED1B19AD93;
	Mon, 11 Nov 2024 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323942; cv=none; b=ISid5nWvCDe4Rn44bOG8NFybtid24kXHf5TeLEWnT4l21bu4SutoncLynxC4qq4358JyktgWxjIFc7e4r3QXrYNwgjz+c2IDOgAKin2HTQyx4JCb7ZRyYAC7McImw59HCGpS/J3BcejqhAnCByxv+Lok6HOXagLFqfR9wv1EK10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323942; c=relaxed/simple;
	bh=Gh1yFaFkFcr2xJc52xK1w4jF0RWt4DU76CiOwQOb1Hk=;
	h=Message-Id:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=pDhJFZeytaeRQK2RhDu1Pz+8FEmWcZsaIelfC8DJw9kI4Q6vaJnAF3Ufq4XxslALxYOQ6PYkLyDot/pGPl4NYqViojmvpBF8BpYBR22QCNPKYJMMicxPDkzqjFnBncQj3kpKSricTrnfO7LMFeusgGxySivYKqv2JTC9BgCxjWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Hn9MmnYb; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=jDtXY2bUyMjOXT8/HogIZaen7IxgRS/M1Ecyy8kWGnA=; b=Hn9MmnYbpAiHxDphxtIwcLQRm/
	cLd98Qbp2T3Bn6my0O12DOB6zmLe/byE9x1JkbbRbzHHpsvZp0br4ul/5Jt19LkJApdxS63fY4B84
	VU2spvwsAegRk+YN9e7kVcRdJKMARQK4x4a7uYIUar4RxvyWp/BzWUcPECrL3/tiBZKnNxcGCvMJR
	xef6pX4tupKogtXuLzzfsjnhVQofiBUQAcSrNZvz1trTMe4CgcfDqNkCB5KwQWIVSYAjpt6DHwYNU
	EgCF8ESbNVWEcxaD+uIm0LbaUT+ZQz8k06FpUhvc78UvQDNTsxJ7xqFvQi3pZ6DrRdy3DUuAgmxjA
	XBgnciiA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tASRU-0000000CiRD-3TLl;
	Mon, 11 Nov 2024 11:18:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 115163021D3; Mon, 11 Nov 2024 12:18:47 +0100 (CET)
Message-Id: <20241111111817.679388337@infradead.org>
User-Agent: quilt/0.65
Date: Mon, 11 Nov 2024 11:54:37 +0100
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
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [RFC][PATCH 7/8] module: Extend the MODULE_ namespace parsing
References: <20241111105430.575636482@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Instead of only accepting "MODULE_${name}", extend it with a comma
separated list of module names and add tail glob support.

That is, something like: "MODULE_foo-*,bar" is now possible.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/module/main.c  |   39 ++++++++++++++++++++++++++++++++++-----
 scripts/mod/modpost.c |   40 ++++++++++++++++++++++++++++++++++------
 2 files changed, 68 insertions(+), 11 deletions(-)

--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1061,6 +1061,38 @@ static char *get_modinfo(const struct lo
 	return get_next_modinfo(info, tag, NULL);
 }
 
+/*
+ * @namespace ~= "MODULE_foo-*,bar", match @modname to 'foo-*' or 'bar'
+ */
+static bool verify_module_namespace(const char *namespace, const char *modname)
+{
+	size_t len, modlen = strlen(modname);
+	const char *sep;
+	bool glob;
+
+	if (strncmp(namespace, "MODULE_", 7) != 0)
+		return false;
+
+	for (namespace += 7; *namespace; namespace = sep) {
+		sep = strchrnul(namespace, ',');
+		len = sep - namespace;
+
+		glob = false;
+		if (sep[-1] == '*') {
+			len--;
+			glob = true;
+		}
+
+		if (*sep)
+			sep++;
+
+		if (strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
+			return true;
+	}
+
+	return false;
+}
+
 static int verify_namespace_is_imported(const struct load_info *info,
 					const struct kernel_symbol *sym,
 					struct module *mod)
@@ -1070,11 +1102,8 @@ static int verify_namespace_is_imported(
 
 	namespace = kernel_symbol_namespace(sym);
 	if (namespace && namespace[0]) {
-		/*
-		 * Implicitly import MODULE_${mod->name} namespace.
-		 */
-		if (strncmp(namespace, "MODULE_", 7) == 0 &&
-		    strcmp(namespace+7, mod->name) == 0)
+
+		if (verify_module_namespace(namespace, mod->name))
 			return 0;
 
 		for_each_modinfo_entry(imported_namespace, info, "import_ns") {
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1565,7 +1565,6 @@ static const char *mod_basename(const ch
 
 static void read_symbols(const char *modname)
 {
-	char module_namespace[MODULE_NAME_LEN + 8];
 	const char *symname;
 	char *version;
 	char *license;
@@ -1601,10 +1600,6 @@ static void read_symbols(const char *mod
 		     namespace = get_next_modinfo(&info, "import_ns", namespace))
 			add_namespace(&mod->imported_namespaces, namespace);
 
-		snprintf(module_namespace, sizeof(module_namespace), "MODULE_%s",
-			 mod_basename(mod->name));
-		add_namespace(&mod->imported_namespaces, module_namespace);
-
 		if (extra_warn && !get_modinfo(&info, "description"))
 			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
 	}
@@ -1687,6 +1682,38 @@ void buf_write(struct buffer *buf, const
 	buf->pos += len;
 }
 
+/*
+ * @namespace ~= "MODULE_foo-*,bar", match @modname to 'foo-*' or 'bar'
+ */
+static bool module_namespace(const char *namespace, const char *modname)
+{
+	size_t len, modlen = strlen(modname);
+	const char *sep;
+	bool glob;
+
+	if (strncmp(namespace, "MODULE_", 7) != 0)
+		return false;
+
+	for (namespace += 7; *namespace; namespace = sep) {
+		sep = strchrnul(namespace, ',');
+		len = sep - namespace;
+
+		glob = false;
+		if (sep[-1] == '*') {
+			len--;
+			glob = true;
+		}
+
+		if (*sep)
+			sep++;
+
+		if (strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
+			return true;
+	}
+
+	return false;
+}
+
 static void check_exports(struct module *mod)
 {
 	struct symbol *s, *exp;
@@ -1714,7 +1741,8 @@ static void check_exports(struct module
 
 		basename = mod_basename(mod->name);
 
-		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
+		if (!module_namespace(exp->namespace, basename) &&
+		    !contains_namespace(&mod->imported_namespaces, exp->namespace)) {
 			modpost_log(!allow_missing_ns_imports,
 				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
 				    basename, exp->name, exp->namespace);



