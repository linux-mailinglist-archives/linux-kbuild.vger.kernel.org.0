Return-Path: <linux-kbuild+bounces-8853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2BB83775
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 10:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A0943A4F9D
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 08:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9C52FC00C;
	Thu, 18 Sep 2025 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWyibfNs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79D2FC009;
	Thu, 18 Sep 2025 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758182838; cv=none; b=h3yRL7O+fc1tl3YPBS8x+i1vWVQirt0FmmOrIPy0CUY/IY+pAivxWDKicY++EgAv2UwyoeYoydRplAI+QdsJVsiZ0rTE/pcc5AlwsJMzPEE3jz0s3VwCtydNzweJLtc0NYnI9QBpMlf/oVNRXJ8eC3UxxGusEtbRz+PvReCeeBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758182838; c=relaxed/simple;
	bh=kC7c43KrE4fGCEO5PzpbSWjdJjCEcmcV83f70KvxQs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMl95gmnIdtFiwIQnspaZRN2GfWBEHtkYrYWqfFpZ7tB5griR70/6mOyseN3OqHlN7KsCDP+Ny6ndmNLbPg5ksJ0fOzycEwBdSMoR8vA3ouQMj1PA2Hlk6QyCF+df4ZbpyolU80+GnGZishphqg3hsG1vfoHNc0RIJUhQw+AZYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWyibfNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C16EC4CEE7;
	Thu, 18 Sep 2025 08:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758182835;
	bh=kC7c43KrE4fGCEO5PzpbSWjdJjCEcmcV83f70KvxQs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DWyibfNsCDAe9YU6h/fHgAIKcWQ0txcGWWmj/0q1CEcYz7qPoAwwyMwh6nlimU87s
	 tMDWjQnkfBJJhb3xhUsQiE1JP1dcuRp9O1XA/h9yLFi9dpjkAn6kBhdBX7BA8KafMe
	 jNc7dCnkDAtTwlWdlycJmdAcN8FTcLr2f7GDDVZSKbLHjeSh9zE83rgJa9TCEaQtOp
	 DidZ9AUSEYxEz5R9K2S2Wq9DBWDDT5HIYgvKSsj+VUf4eSb9E8B3rXr5Y79W1/w/v3
	 YkFeyveemzY268oDRW6cbehVNg9LDGLWBL6E4UrEV5xVa9YB4japykZbXn9FjYmI0T
	 AFhSG6OQ/nnUw==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
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
Subject: [PATCH v8 6/8] modpost: Add modname to mod_device_table alias
Date: Thu, 18 Sep 2025 10:05:50 +0200
Message-ID: <1a0d0bd87a4981d465b9ed21e14f4e78eaa03ded.1758182101.git.legion@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758182101.git.legion@kernel.org>
References: <cover.1758182101.git.legion@kernel.org>
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 include/linux/module.h   | 14 +++++++++++++-
 rust/kernel/device_id.rs |  8 ++++----
 scripts/mod/file2alias.c | 15 ++++++++++++---
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 3319a5269d286..e31ee29fac6b7 100644
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
index 70d57814ff79b..62c42da12e9de 100644
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
index 00586119a25b7..1260bc2287fba 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1476,7 +1476,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 {
 	void *symval;
 	char *zeros = NULL;
-	const char *type, *name;
+	const char *type, *name, *modname;
 	size_t typelen;
 	static const char *prefix = "__mod_device_table__";
 
@@ -1488,10 +1488,19 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
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
+	type += strlen("__");
 
 	name = strstr(type, "__");
 	if (!name)
-- 
2.51.0


