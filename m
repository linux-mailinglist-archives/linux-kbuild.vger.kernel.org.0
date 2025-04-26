Return-Path: <linux-kbuild+bounces-6756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD885A9DC33
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 18:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260A11BA5D3B
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 16:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3926A25D8E6;
	Sat, 26 Apr 2025 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiM7hZmX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76325DAE3;
	Sat, 26 Apr 2025 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684327; cv=none; b=aHln3pN8Djc4UmIkx1feR5MgF0F2+TvSIlAkWjRrZ2SdQhOm/NHtfX3gpZKnO3DLVQpMX9fc4/73jwNvu5VaswaSFPVDYktmdrkf4omH3R0vBc/w1SJpTp7N28CM3KM1uzO23egxjtH0yPIOSGMWhU8MiQQe10bcs5YwGeCRYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684327; c=relaxed/simple;
	bh=4aNIt7T9rY/t5gnCN54FCXhIDRmO0NH+43S+TFlPeiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWCaBVIc1krETYT+PVcTYRIYeJbDgAodXgJYst4ZJnDmC0TYv8m74r6hxPC3UpWVNNvCEGy/4CG6vDQ7IG+J8J+c4+caKj6SsfTSEXUNi7kz//SpGlWsxpei1R1pSpowkcbnIjvYWN9bZNathjyUNHhjjY+WVSf8Z03E3A4n0ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiM7hZmX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC297C4CEE2;
	Sat, 26 Apr 2025 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745684326;
	bh=4aNIt7T9rY/t5gnCN54FCXhIDRmO0NH+43S+TFlPeiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MiM7hZmXYhh1n5DKXOvof3p3iZe2VhZv1UFzlTmpT+JMBg+191KLs7PL/W+UwRuSE
	 TiYXXM1AH+ap2M3Xs/i8SfiAJSlDGAODEI3wqAwe6txduuOEhDZz0F5nL8K7LDpUzo
	 LRO24v9jSwMzryE10wdypmI3Uw8NE9K4IqAscYlupI1GwaPlExoWE47aKprvMrTk8t
	 s6nWbN0OPcMugggvUuQMW2Mut8kyAiZF/2+YpT89JpHbZ8d+kD91QCNYXz6VqUC+WY
	 JQBxXSyxzCCn2ljHE2KmshwrQ41SqzRXliOx6YIeYWy3nZaAhjJM9yENJ6C7lreVhM
	 TJTErARbOxiyQ==
From: Alexey Gladkov <legion@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v1 4/7] modpost: Make mod_device_table aliases more unique
Date: Sat, 26 Apr 2025 18:16:35 +0200
Message-ID: <ffea56aecdd48eb37b7420f91abfd2dfff75c3b7.1745591072.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid symbol conflicts if they appear in the same binary, a
more unique alias identifier can be generated.

Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 include/linux/module.h   | 14 ++++++++++++--
 scripts/mod/file2alias.c | 18 ++++++++++++++----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index e987fd62c734..7250b4a527ec 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -247,10 +247,20 @@ extern void cleanup_module(void);
 /* What your module does. */
 #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
 
+/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>__<name> */
+#define __mod_device_table(type, name)	\
+	__PASTE(__mod_device_table__,	\
+	__PASTE(__COUNTER__,		\
+	__PASTE(__,			\
+	__PASTE(__KBUILD_MODNAME,	\
+	__PASTE(__,			\
+	__PASTE(type,			\
+	__PASTE(__, name)))))))
+
 #ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
-#define MODULE_DEVICE_TABLE(type, name)					\
-extern typeof(name) __mod_device_table__##type##__##name		\
+#define MODULE_DEVICE_TABLE(type, name)			\
+extern typeof(name) __mod_device_table(type, name)	\
   __attribute__ ((unused, alias(__stringify(name))))
 #else  /* !MODULE */
 #define MODULE_DEVICE_TABLE(type, name)
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 00586119a25b..dff1799a4c79 100644
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
+	/* All our symbols are of form __mod_device_table__<counter>__kmod_<modname>__<type>__<name>. */
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


