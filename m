Return-Path: <linux-kbuild+bounces-7605-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746EAE2958
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 15:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D11E7A720A
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 13:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBFA221544;
	Sat, 21 Jun 2025 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nrrb5O7N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98C221540;
	Sat, 21 Jun 2025 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750514274; cv=none; b=Yz9oQLJb5qXEzulRLC7cXZlBZHWu/VvjolkNNj089tbm7sDnekHTc9oBFmOxtPE1oiNcjFudcyyhKUe2McCEGqiy+ZEWt7N0i4e/pUioS0DGOBWZgCEwquTPyMYun6s7Pz2xWFOGy45+CXcUuNCKERv/c1SB4RuRQAcSQ9LfbSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750514274; c=relaxed/simple;
	bh=AuegPmeYvpA3eTfQDAnxQdGpla+4yg+qXxtOidi62CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IeNKVAEPok2yhJnID4AfTe5IMgqMl53SETdEURnMGeXLAH0+lmoDdZFXrwy1qAcG8gH/wQY/B7qftMXT+bD+1RjsjQaT3vurtt+Cqhe+dl5dkBxZr3l4Mmrsuw2oPFdau6reSn0PMrI4JpC6wLUkudHqtpGq2/cgPl7+HlP+9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nrrb5O7N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F926C4CEEF;
	Sat, 21 Jun 2025 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750514274;
	bh=AuegPmeYvpA3eTfQDAnxQdGpla+4yg+qXxtOidi62CQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nrrb5O7N9VjsXmw5z9X2sNO0f4k++mtYq9sJYt10ibLmkHyJeufaYAOvOnAwi2OIc
	 YoNHp/tNz+PJqH0uSMt3xdrSByt6wSAAoGvKAZtvea8yUUrq9fiOxA0uIdLxhZARcP
	 kMMGsP4dYI8TEjTQbehQ2kMARDnmdOhtQgczXV+u0RJM4yOTKQfHZ/I3ABn10rnaPV
	 uXE7dG6f+Bmeva01H5cfNG6+CvXF/AubXVDmnDHvJuP4RHtTPB1vdAnXKQBL2/wK8U
	 Y0i5pz0fSNIQIZ16cDqD9WmJR/iHIyxYtqymEf+EmJPvvzupKIzqFG99xJTJCBGYt6
	 mCkeck4udQivw==
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
	linux-scsi@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Subject: [PATCH v4 6/7] modpost: Add modname to mod_device_table alias
Date: Sat, 21 Jun 2025 15:57:18 +0200
Message-ID: <6e2f70b07a710e761eb68d089d96cee7b27bb2d5.1750511018.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750511018.git.legion@kernel.org>
References: <cover.1750511018.git.legion@kernel.org>
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
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 include/linux/module.h   | 14 +++++++++++---
 rust/kernel/device_id.rs |  8 ++++----
 scripts/mod/file2alias.c | 18 ++++++++++++++----
 3 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 24fe6b865e9c..e0f826fab2ac 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -243,11 +243,19 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
 /* What your module does. */
 #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
 
+/* Format: __mod_device_table__kmod_<modname>__<type>__<name> */
+#define __mod_device_table(type, name)	\
+	__PASTE(__mod_device_table__,	\
+	__PASTE(__KBUILD_MODNAME,	\
+	__PASTE(__,			\
+	__PASTE(type,			\
+	__PASTE(__, name)))))
+
 #ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
-#define MODULE_DEVICE_TABLE(type, name)					\
-extern typeof(name) __mod_device_table__##type##__##name		\
-  __attribute__ ((unused, alias(__stringify(name))))
+#define MODULE_DEVICE_TABLE(type, name)			\
+static typeof(name) __mod_device_table(type, name)	\
+  __attribute__ ((used, alias(__stringify(name))))
 #else  /* !MODULE */
 #define MODULE_DEVICE_TABLE(type, name)
 #endif
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
2.49.0


