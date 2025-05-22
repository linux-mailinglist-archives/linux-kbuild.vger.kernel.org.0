Return-Path: <linux-kbuild+bounces-7216-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A117AC0577
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 09:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9B0F4A50D5
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 07:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB02B222568;
	Thu, 22 May 2025 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPT9C6Ik"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC9B2222CF;
	Thu, 22 May 2025 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898273; cv=none; b=nq/190gah/EV8LvbGHppiZh2vKqgH/CwWJvjEfmwNWlTRT312CaT0hoxE2+KtqKJTj/mkP64f28KWIW4RnxkBRJqqUjy9TO7W0EqWQU/YuP3MA88b76lZ7H0a06pI2TgPFi0OhemDwkLYHUXsvk18+RTXdRt82B4PbI8h7KON38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898273; c=relaxed/simple;
	bh=26EpyCDloIBYltDiXCgBXnDBVgrupi3mUFBFh1hZWZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+6Ej6/uuifwXWUuODYWP5FwgDVSeVAqRycyB2yYCFbQp9YDgEHOeaLkeD9/570JmReLIskcxQNZNjvtMOiglwmEUkvgRbebEv0e9bJZUcsF2eX9Y6vZsTUT6Zsb3/DLjbgBxBMZhI9681Sb3xKaoQTX1gMP0pJUat+wjeSLpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPT9C6Ik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC8CC4CEED;
	Thu, 22 May 2025 07:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747898273;
	bh=26EpyCDloIBYltDiXCgBXnDBVgrupi3mUFBFh1hZWZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPT9C6Ik+P0sDhmwZN0D8GD7RvwXWb0mqtj9yBCCahtP0BYEh7D7ZoSaFNoMEhyBL
	 r9lDy6wTMY5V32WtiRbNTVd+NyCmegAtJwBw0BmF4svcCGwq/B7CqI1vsrxa6YvcmT
	 JHBddxCgwmrP2VTLlHUKyTzn6nvt0+oedh3d9D9ok2kKUnZ//oPYqAbaGRIGip8t7f
	 sSG8wqtDrS8saa0/MrfPEkfGjxv2tK3gWntKXgu8mHY7DJjn3OtEFTjxImuzl6GBzg
	 QAa8woK9mwoAj1Nwb1mOUjl4gMYvbb4MGMraO66CxG9/z/71qNrp4yizyrtkLWPBZs
	 Tx85aCsQbR8rw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-modules@vger.kernel.org
Subject: [PATCH 2/3] modpost: allow "make nsdeps" to skip module-specific symbol namespace
Date: Thu, 22 May 2025 16:17:21 +0900
Message-ID: <20250522071744.2362563-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522071744.2362563-1-masahiroy@kernel.org>
References: <20250522071744.2362563-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When MODULE_IMPORT_NS() is missing, "make nsdeps" runs the Coccinelle
script to automatically add MODULE_IMPORT_NS() to each module.

This should not occur for users of EXPORT_SYMBOL_GPL_FOR_MODULES(), which
is intended to export a symbol to a specific module only. In such cases,
explicitly adding MODULE_IMPORT_NS("module:...") is disallowed.

This commit handles the latter case separately in order not to trigger
the Coccinelle, and displays the error message:

  ERROR: modpost: module "foo" uses symbol "bar", which is exported only for module "baz"

Apply the same logic for kernel space as well.

Fixes: 092a4f5985f2 ("module: Add module specific symbol namespace support")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/module/main.c  | 37 ++++++++++++++++++++-----------------
 scripts/mod/modpost.c | 35 ++++++++++++++++++-----------------
 2 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 81035f6552ec..642f790c47e7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -65,6 +65,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/module.h>
 
+#define MODULE_NS_PREFIX "module:"
+
 /*
  * Mutex protects:
  * 1) List of modules (also safely readable within RCU read section),
@@ -1108,28 +1110,21 @@ static char *get_modinfo(const struct load_info *info, const char *tag)
 }
 
 /**
- * verify_module_namespace() - does @modname have access to this symbol's @namespace
- * @namespace: export symbol namespace
+ * module_match() - check if @modname matches @patterns
  * @modname: module name
+ * @patterns: comma separated patterns
  *
- * If @namespace is prefixed with "module:" to indicate it is a module namespace
- * then test if @modname matches any of the comma separated patterns.
- *
- * The patterns only support tail-glob.
+ * The @patterns only supports tail-glob.
  */
-static bool verify_module_namespace(const char *namespace, const char *modname)
+static bool module_match(const char *modname, const char *patterns)
 {
 	size_t len, modlen = strlen(modname);
-	const char *prefix = "module:";
 	const char *sep;
 	bool glob;
 
-	if (!strstarts(namespace, prefix))
-		return false;
-
-	for (namespace += strlen(prefix); *namespace; namespace = sep) {
-		sep = strchrnul(namespace, ',');
-		len = sep - namespace;
+	for (; *patterns; patterns = sep) {
+		sep = strchrnul(patterns, ',');
+		len = sep - patterns;
 
 		glob = false;
 		if (sep[-1] == '*') {
@@ -1140,7 +1135,7 @@ static bool verify_module_namespace(const char *namespace, const char *modname)
 		if (*sep)
 			sep++;
 
-		if (mod_strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
+		if (mod_strncmp(patterns, modname, len) == 0 && (glob || len == modlen))
 			return true;
 	}
 
@@ -1157,8 +1152,16 @@ static int verify_namespace_is_imported(const struct load_info *info,
 	namespace = kernel_symbol_namespace(sym);
 	if (namespace && namespace[0]) {
 
-		if (verify_module_namespace(namespace, mod->name))
+		if (strstarts(namespace, MODULE_NS_PREFIX)) {
+			namespace += strlen(MODULE_NS_PREFIX);
+
+			if (!module_match(mod->name, namespace)) {
+				pr_err("module \"%s\" uses symbol \"%s\", which is exported only for module \"%s\"\n",
+				       mod->name, kernel_symbol_name(sym), namespace);
+				return -EINVAL;
+			}
 			return 0;
+		}
 
 		for_each_modinfo_entry(imported_namespace, info, "import_ns") {
 			if (strcmp(namespace, imported_namespace) == 0)
@@ -1743,7 +1746,7 @@ static int setup_modinfo(struct module *mod, struct load_info *info)
 		 * 'module:' prefixed namespaces are implicit, disallow
 		 * explicit imports.
 		 */
-		if (strstarts(imported_namespace, "module:")) {
+		if (strstarts(imported_namespace, MODULE_NS_PREFIX)) {
 			pr_err("%s: module tries to import module namespace: %s\n",
 			       mod->name, imported_namespace);
 			return -EPERM;
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5ca7c268294e..3948a4bc41b3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1690,28 +1690,21 @@ void buf_write(struct buffer *buf, const char *s, int len)
 }
 
 /**
- * verify_module_namespace() - does @modname have access to this symbol's @namespace
- * @namespace: export symbol namespace
+ * module_match() - check if @modname matches @patterns
  * @modname: module name
+ * @patterns: comma-separated list of module names
  *
- * If @namespace is prefixed with "module:" to indicate it is a module namespace
- * then test if @modname matches any of the comma separated patterns.
- *
- * The patterns only support tail-glob.
+ * The @patterns only supports tail-glob.
  */
-static bool verify_module_namespace(const char *namespace, const char *modname)
+static bool module_match(const char *modname, const char *patterns)
 {
 	size_t len, modlen = strlen(modname);
-	const char *prefix = "module:";
 	const char *sep;
 	bool glob;
 
-	if (!strstarts(namespace, prefix))
-		return false;
-
-	for (namespace += strlen(prefix); *namespace; namespace = sep) {
-		sep = strchrnul(namespace, ',');
-		len = sep - namespace;
+	for (; *patterns; patterns = sep) {
+		sep = strchrnul(patterns, ',');
+		len = sep - patterns;
 
 		glob = false;
 		if (sep[-1] == '*') {
@@ -1722,7 +1715,7 @@ static bool verify_module_namespace(const char *namespace, const char *modname)
 		if (*sep)
 			sep++;
 
-		if (strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
+		if (strncmp(patterns, modname, len) == 0 && (glob || len == modlen))
 			return true;
 	}
 
@@ -1756,8 +1749,16 @@ static void check_exports(struct module *mod)
 
 		basename = get_basename(mod->name);
 
-		if (!verify_module_namespace(exp->namespace, basename) &&
-		    !contains_namespace(&mod->imported_namespaces, exp->namespace)) {
+		if (strstarts(exp->namespace, MODULE_NS_PREFIX)) {
+			const char *ns_patterns = exp->namespace +
+						strlen(MODULE_NS_PREFIX);
+
+			if (!module_match(basename, ns_patterns))
+			    error("module \"%s\" uses symbol \"%s\", which is exported only for module \"%s\"\n",
+				  basename, exp->name, ns_patterns);
+
+		} else if (!contains_namespace(&mod->imported_namespaces,
+					     exp->namespace)) {
 			modpost_log(!allow_missing_ns_imports,
 				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
 				    basename, exp->name, exp->namespace);
-- 
2.43.0


