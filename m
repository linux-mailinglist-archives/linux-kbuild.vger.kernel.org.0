Return-Path: <linux-kbuild+bounces-7063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5125AB1ACE
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 18:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CD9716B912
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 16:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231CA23817A;
	Fri,  9 May 2025 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrhYqGKR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7F5F9C1;
	Fri,  9 May 2025 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809023; cv=none; b=SnkkFRw99RuL8PdONRrST4oMt/33l5iwoOTKktpAFmwnRGS+V0o0xfX/ZhJhjUWZxyH7VEy3zIVfFeKSFxN1gfMfcc8K5jEn7qSxe/geE3DarBaW4MTG6PNFXJSYQmugLVa993lsmDpgB0SeXyIPwTvXgWa7eRv0eCFz4rN8h1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809023; c=relaxed/simple;
	bh=RYLKPhewo+pQLbsEeVEVyqMLKlwFhIzqJZBOv9JiJWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOsaRn05ggmUti/GOsPhchgYlyXyWkRb/s8gD7aVVnal/kJHp2jYpJp07ySKGEZWf5JDqxGnJijM/xqpteZCliq5LzvQeyMtUd+Fu9O2RtpyvQD1hxmcaflGhBismQk78SN764j6oDQAF/tuNZX3mTxnVMihPkC1GqCOly4iKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrhYqGKR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07164C4CEED;
	Fri,  9 May 2025 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746809021;
	bh=RYLKPhewo+pQLbsEeVEVyqMLKlwFhIzqJZBOv9JiJWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GrhYqGKRdIJw1LR5DmYsay1iOFGTuIp1ZLPFO8h8n0yEtgGZ8ZjmUMt1ptCW7MTsq
	 lPz6ZRaAvENFjG7G6guSuw8GWE8OFKYGUb5j3wzz/lvgNkxrgUqGlg2Ww3gadB9Hqm
	 VZmF8NeO9rE0EM6TGBuXZBdmEKN5bm2yduR/CD9QA9BBcJwSujzVkhbnZvLqqGFXKC
	 CcOFu6Y8eClJzPf14HvyRxQf4uA04n9ReOwc55LFo6E8BPhiayM0Lr7Nfc6I0W1u5B
	 DdKA84or5CioLaJtRE7LOtpl0Cqis9EvO9QwP1pWO3/1lfcFiUgE71CnoBKlvrSWP9
	 VhoS10hSLPaJA==
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v2 3/6] modpost: Make mod_device_table aliases more unique
Date: Fri,  9 May 2025 18:42:34 +0200
Message-ID: <20250509164237.2886508-4-legion@kernel.org>
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
index de0da7c7cf03..01fceca47a5b 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
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


