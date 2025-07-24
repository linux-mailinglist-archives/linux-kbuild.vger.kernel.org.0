Return-Path: <linux-kbuild+bounces-8132-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C85DFB10C13
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 15:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324AE4E3CE7
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 13:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438D92E338D;
	Thu, 24 Jul 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gnizktmw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C0F2DE6E9;
	Thu, 24 Jul 2025 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365030; cv=none; b=p8X5Awc1rKFyrrhdrBFSEQ2y49A/XSk2scpf9gmoMmA9wQEeW48r21QpBTJHTKxq9n8pji5J5Xsp+SZ2qdJYcq6J3lP6U7m9rucBDNq5bn6zsSA9cqFWWstGZwpSdDbmi/XKzXSTF83dYhXPOtaUTQ39wCV4UxUQtltiybwVjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365030; c=relaxed/simple;
	bh=npsVQNBWgGe4XdIyvmKpwtFZqHqxXaHKuv2jSNXcaSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msWM0th6Cwi4lAXdN4r02wE2yHj5hrON9BI5MDMqOsQqWXqZc/tnXwF5cmFAxLqsVMzOe+xnCiaBgG5Ngdr2hEi3XYQj1V7Qfj23WoHAtU9V9QJt9kOmNdZPx4vjFDIsWgBmK9xmZ8B8bG4X+OLOKsGty79DdUQ1pEuubG4VczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gnizktmw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BC4C4CEED;
	Thu, 24 Jul 2025 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365029;
	bh=npsVQNBWgGe4XdIyvmKpwtFZqHqxXaHKuv2jSNXcaSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GnizktmwOml8yvmpBowo/Q3Hp8LqpK3VJMSGGrIIu00XvvJnd9WBfmW94mlchARsC
	 iiXklhQkPEDo8xoJAWsYxAlKEATSHJ1Gr/1K+fIRQE19/djAAvlqkR1Zx7Hd6t8n4l
	 8uLamn7fq85U2Bk46qyXuG8tviOJyWHecJl1df7F45ZTd899rPGDZkVOk4jN9e9e9d
	 NxxXIXLlKXdevEQkgVWBhjw5BKPt5JBWWyGlciKY3QixxmCbt2ogXpsLn8sNQPEbsf
	 XrNtFJv7GpSXHHO2InCTAzEfqj5JFo822iWxYxhNekvifsL0H1a4jl44dOtrjcjljW
	 fh5/YGNNH1wiw==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v5 07/10] modpost: Add modname to mod_device_table alias
Date: Thu, 24 Jul 2025 15:49:44 +0200
Message-ID: <e78d20afcc059cec3cd977ee74a0ec4df06de05b.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point, if a symbol is compiled as part of the kernel,
information about which module the symbol belongs to is lost.

To save this it is possible to add the module name to the alias name.
It's not very pretty, but it's possible for now.

Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 include/linux/module.h   | 14 +++++++++++++-
 rust/kernel/device_id.rs |  8 ++++----
 scripts/mod/file2alias.c | 18 ++++++++++++++----
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 4689852d7b18..32e98200b2f4 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -243,10 +243,22 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
 /* What your module does. */
 #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
 
+/*
+ * Format: __mod_device_table__kmod_<modname>__<type>__<name>
+ * Parts of the string `__kmod_` and `__` are used as delimiters when parsing
+ * a symbol in file2alias.c
+ */
+#define __mod_device_table(type, name)	\
+	__PASTE(__mod_device_table__,	\
+	__PASTE(__KBUILD_MODNAME,	\
+	__PASTE(__,			\
+	__PASTE(type,			\
+	__PASTE(__, name)))))
+
 #ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
 #define MODULE_DEVICE_TABLE(type, name)					\
-static typeof(name) __mod_device_table__##type##__##name		\
+static typeof(name) __mod_device_table(type, name)			\
   __attribute__ ((used, alias(__stringify(name))))
 #else  /* !MODULE */
 #define MODULE_DEVICE_TABLE(type, name)
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index 0a4eb56d98f2..365d8f544844 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -154,10 +154,10 @@ macro_rules! module_device_table {
     ($table_type: literal, $module_table_name:ident, $table_name:ident) => {
         #[rustfmt::skip]
         #[export_name =
-            concat!("__mod_device_table__", $table_type,
-                    "__", module_path!(),
-                    "_", line!(),
-                    "_", stringify!($table_name))
+            concat!("__mod_device_table__", line!(),
+                    "__kmod_", module_path!(),
+                    "__", $table_type,
+                    "__", stringify!($table_name))
         ]
         static $module_table_name: [::core::mem::MaybeUninit<u8>; $table_name.raw_ids().size()] =
             unsafe { ::core::mem::transmute_copy($table_name.raw_ids()) };
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 00586119a25b..13021266a18f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1476,8 +1476,8 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 {
 	void *symval;
 	char *zeros = NULL;
-	const char *type, *name;
-	size_t typelen;
+	const char *type, *name, *modname;
+	size_t typelen, modnamelen;
 	static const char *prefix = "__mod_device_table__";
 
 	/* We're looking for a section relative symbol */
@@ -1488,10 +1488,20 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 		return;
 
-	/* All our symbols are of form __mod_device_table__<type>__<name>. */
+	/* All our symbols are of form __mod_device_table__kmod_<modname>__<type>__<name>. */
 	if (!strstarts(symname, prefix))
 		return;
-	type = symname + strlen(prefix);
+
+	modname = strstr(symname, "__kmod_");
+	if (!modname)
+		return;
+	modname += strlen("__kmod_");
+
+	type = strstr(modname, "__");
+	if (!type)
+		return;
+	modnamelen = type - modname;
+	type += strlen("__");
 
 	name = strstr(type, "__");
 	if (!name)
-- 
2.50.1


