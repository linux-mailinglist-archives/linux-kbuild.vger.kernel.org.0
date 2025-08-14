Return-Path: <linux-kbuild+bounces-8464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF59B26657
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 15:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 494D87B908A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 13:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAD7302745;
	Thu, 14 Aug 2025 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCqBt/GD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAEE301028;
	Thu, 14 Aug 2025 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176895; cv=none; b=m16JimS1jDiMWdQC0kVP/HZ/r1i6x7ukimvcxlPQedNGUXhfLS9PjjufPSWP3nvYI0EFaSi+/cGljKlCqCupd3uNCTgBu6giPMtL64brjdl5txvaT/LoAyexRM3JGaNIkmvAFa6/lxuXFMesYt0iwaZBL924VTTU0bmbe0wyC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176895; c=relaxed/simple;
	bh=duM6/HCl5EVHZOaH04hOyQBnVjVr+4mdpy8dfoCQA6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GesKuy+mETnxY8kJPqGhP89xc+OCh/DtoO1okX4eIiKRvsJW2BEkG/ExkyUk/0Lh54UNZh2ucS6+vqIOFfLQsVilh2xGB64TuFhnYVoLiPx3LdR6no6lPgtpubXF2/BElT7QiW+4P9BHI3HQtqC8YM7ODWjd3PgJUp7cPb+8j3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCqBt/GD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE9FC4CEF7;
	Thu, 14 Aug 2025 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755176895;
	bh=duM6/HCl5EVHZOaH04hOyQBnVjVr+4mdpy8dfoCQA6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sCqBt/GDwT3kUhOlOxnqzzMfX6WrKYKSceKGaueRQQKa9tPSfXUGDSIuiKwgZpR8B
	 W9BkI/IxW9crgKmoMrvyme+lGH1e6pHtiu2azguBUOgI+h2gcikfsLxYmgFkBJPs38
	 3AwGWayqlgmTqOZbcwIu0UyY2GBGaWM41Zfupvjo5CahLBHU0MwrWSE20wE3k4vZzL
	 fnW3/k42OAZfs+tqORzVERFVVrsHMG39bxigpzSpGsIpy6J12T3SybaUNIP7RIfBLv
	 IpEmTT9otaH8cbZ26zMPL7FahWeNVrz6AYof2VtyBgXO557BPJEhx/Pp2Gey6Dhm6C
	 vTcqbsJTtiFhg==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v6 6/9] modpost: Add modname to mod_device_table alias
Date: Thu, 14 Aug 2025 15:07:14 +0200
Message-ID: <15724fb8669dae64e3c8d31ab620f977984b2177.1755170493.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755170493.git.legion@kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
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
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 include/linux/module.h   | 14 +++++++++++++-
 rust/kernel/device_id.rs |  8 ++++----
 scripts/mod/file2alias.c | 18 ++++++++++++++----
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 3319a5269d28..e31ee29fac6b 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -244,10 +244,22 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
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
index 70d57814ff79..62c42da12e9d 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -195,10 +195,10 @@ macro_rules! module_device_table {
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


