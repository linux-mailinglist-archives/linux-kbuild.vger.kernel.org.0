Return-Path: <linux-kbuild+bounces-4930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E123B9E069F
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1FBA284D83
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC66120A5FC;
	Mon,  2 Dec 2024 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TeVV6PeR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71B1FECDE;
	Mon,  2 Dec 2024 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152299; cv=none; b=ZTPHsh29Gd2CmBpkXQe42ETFzionB8zG7ImwGDa2SEweWn9yjfTouEOsjKMkxNJfaAnEqF/IFzvSMGMUj/Acu0aPZHqsdGJ9jik02srnwBlGEpMaKp/ovgcEf7HkrT6d6eU2Rl6Ug1LnvhyhV4Hm+GM6F09D4VxFV+WsYHn4Ch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152299; c=relaxed/simple;
	bh=XHnTJHOPYtZIDpwCX8Qj4Gyauad1xJ05yQqNtHbIPkY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=HFJGjNFVaK+2ggPdh3ILHNG9Oa3KHGX6RL7LEB4kjsMIpLibhdCvLdTOkLS9am9r4yHvlmtmi641W9lyjWUpxL9hLL8ZCOLwtwncFLAlTNuCN/2JOClBXEVx82+z52frGdygzdLqHT5ZuI08QJwsq77UObeDEV0lp3ZarbS+6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TeVV6PeR; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=aGjvucfOz39yLyUBScLYaZkWFoL5jwssjx5+IvdVnTE=; b=TeVV6PeRrbodIeRA0Peu2iSy1W
	35Kog7wgqiIar7hDxW/FcHmMlEeOx/TMzcoCNTwv4Jc1/RpD5JyNAx/QIftdgHIHBJvuh6Gl1ltjp
	TRL5nPu8FulMe/y6i2ZLQjRHyrKl8SNLegDXZmDABrmRURXepAdFk2bRknGvTzJfzifVaTt/WnyWz
	JpKPzUXZ0Ek1dzHkr/elr/roLRZahPI8KEWCyN9lz8LPzsCGHYmSvIbUN8guKFaL2q167p5rA7GNp
	Nfh4a7OGTXA4VRZpg3wiXt5mCvcZ/NhHgi6KNOC+NryG5mhL6i4xXYj8yIxxSdj96CyX7BIH7q+1l
	QTfoSYxQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tI859-00000008CPm-17Pt;
	Mon, 02 Dec 2024 15:11:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C9DFE300731; Mon,  2 Dec 2024 16:11:27 +0100 (CET)
Message-ID: <20241202150810.382545529@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Dec 2024 15:59:50 +0100
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
Subject: [PATCH -v2 4/7] module: Add module specific symbol namespace support
References: <20241202145946.108093528@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Designate the "MODULE_${modname}" symbol namespace to mean: 'only
export to the named module'.

Notably, explicit imports of anything in the "MODULE_" space is
forbidden. Modules implicitly get the "MODULE_${modname}" namespace
added.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/module/main.c  |   28 ++++++++++++++++++++++++++--
 scripts/mod/modpost.c |    5 +++++
 2 files changed, 31 insertions(+), 2 deletions(-)

--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1070,6 +1070,13 @@ static int verify_namespace_is_imported(
 
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
@@ -1613,15 +1620,30 @@ static void module_license_taint_check(s
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
@@ -2935,7 +2957,9 @@ static int load_module(struct load_info
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
@@ -1565,6 +1565,7 @@ static const char *mod_basename(const ch
 
 static void read_symbols(const char *modname)
 {
+	char module_namespace[MODULE_NAME_LEN + 8];
 	const char *symname;
 	char *version;
 	char *license;
@@ -1600,6 +1601,10 @@ static void read_symbols(const char *mod
 		     namespace = get_next_modinfo(&info, "import_ns", namespace))
 			add_namespace(&mod->imported_namespaces, namespace);
 
+		snprintf(module_namespace, sizeof(module_namespace), "MODULE_%s",
+			 mod_basename(mod->name));
+		add_namespace(&mod->imported_namespaces, module_namespace);
+
 		if (extra_warn && !get_modinfo(&info, "description"))
 			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
 	}



