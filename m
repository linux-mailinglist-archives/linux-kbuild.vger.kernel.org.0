Return-Path: <linux-kbuild+bounces-4746-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3821D9D3138
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 01:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2250283FA6
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C53F1DDA2E;
	Tue, 19 Nov 2024 23:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2OPJB0h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6A81DD88D;
	Tue, 19 Nov 2024 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060652; cv=none; b=pWoQ/UGZjWBoYQsb8O1jDUz6GOU1qVLtTNFjWnO2AT9jmjMLvHgE8uRFIdYJXnagNoR/zJ515CyNRWy0KFIAZmkNGd+wLPp/3c1FnFkaSpmomr+7dRh/rPM2mBTTL1P1k2zbbAMXe9pZRiWdP2+MYk3sCHM2luExBz4m2M+JUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060652; c=relaxed/simple;
	bh=MriHjoLoo098ADUIG/s1LI+wIu1wFdjFUIJJjWwoKt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMX/MV38HAO5AUGsBNXFYLwb5BSuQBg46Ph3VZ/0Tz/YN2jOIpI0AeeNC71UKBNsM5QZSSYPqieWnTnIwzxSm6tx1DpTfIIpZxcVKSFoKezusWFb1OC2GbGo2+LOvZ9h0TJPdlFX9VUkVSPuiB/5sO2MrF4vCBnIFwy2wk0CGqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2OPJB0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D5DC4CED7;
	Tue, 19 Nov 2024 23:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060652;
	bh=MriHjoLoo098ADUIG/s1LI+wIu1wFdjFUIJJjWwoKt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2OPJB0hRaT7ieUERNQeSXKNaBEhZWEDCujERRHiUYFPss/FnbRuu2n4yolQKHeDF
	 vG7hgMGX8secUOEjIy8C4U6Nbns0V7bDMRw8oOz5jRyfKulaERpF0iVri9biBW7D7Q
	 ZauSytBTHO1vZ18bOiX+F95qYMaC5qn9BTqV6J0WbMW/TGM1r2ZBKuhPoioa6Lcypw
	 OhN7ndG4EdwAAmuPL5Fo4I0MbImtCZhHYu+SHa15Da3j9SE78AogUalS4MugsqUJCa
	 w1fxpfmZJhChWXZmIRUpDpL1xCVxxopseMgqPP6xZDT/T7FM8GtowwrP/3OVS5T2i3
	 8TO2VvkX01xkA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org
Subject: [PATCH 14/15] modpost: rename alias symbol for MODULE_DEVICE_TABLE()
Date: Wed, 20 Nov 2024 08:56:52 +0900
Message-ID: <20241119235705.1576946-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119235705.1576946-1-masahiroy@kernel.org>
References: <20241119235705.1576946-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit renames the alias symbol, __mod_<type>__<name>_device_table
to __mod_device_table__<type>__<name>.

This change simplifies the code slightly, as there is no longer a need
to check both the prefix and suffix.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/linux/module.h   |  2 +-
 scripts/mod/file2alias.c | 17 +++++++----------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 88ecc5e9f523..3dd79a3d0cbf 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -247,7 +247,7 @@ extern void cleanup_module(void);
 #ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
 #define MODULE_DEVICE_TABLE(type, name)					\
-extern typeof(name) __mod_##type##__##name##_device_table		\
+extern typeof(name) __mod_device_table__##type##__##name		\
   __attribute__ ((unused, alias(__stringify(name))))
 #else  /* !MODULE */
 #define MODULE_DEVICE_TABLE(type, name)
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 2374737b9d22..b1291cc7bd80 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -121,7 +121,7 @@ typedef struct {
 #include "../../include/linux/mod_devicetable.h"
 
 struct devtable {
-	const char *device_id; /* name of table, __mod_<name>__*_device_table. */
+	const char *device_id;
 	unsigned long id_size;
 	void (*do_entry)(struct module *mod, void *symval);
 };
@@ -188,7 +188,7 @@ static void device_id_check(const char *modname, const char *device_id,
 	int i;
 
 	if (size % id_size || size < id_size) {
-		fatal("%s: sizeof(struct %s_device_id)=%lu is not a modulo of the size of section __mod_%s__<identifier>_device_table=%lu.\n"
+		fatal("%s: sizeof(struct %s_device_id)=%lu is not a modulo of the size of section __mod_device_table__%s__<identifier>=%lu.\n"
 		      "Fix definition of struct %s_device_id in mod_devicetable.h\n",
 		      modname, device_id, id_size, device_id, size, device_id);
 	}
@@ -1503,6 +1503,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	char *zeros = NULL;
 	const char *type, *name;
 	size_t typelen;
+	static const char *prefix = "__mod_device_table__";
 
 	/* We're looking for a section relative symbol */
 	if (!sym->st_shndx || get_secindex(info, sym) >= info->num_sections)
@@ -1512,15 +1513,11 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 		return;
 
-	/* All our symbols are of form __mod_<type>__<name>_device_table. */
-	if (!strstarts(symname, "__mod_"))
-		return;
-	type = symname + strlen("__mod_");
-	typelen = strlen(type);
-	if (typelen < strlen("_device_table"))
-		return;
-	if (strcmp(type + typelen - strlen("_device_table"), "_device_table"))
+	/* All our symbols are of form __mod_device_table__<type>__<name>. */
+	if (!strstarts(symname, prefix))
 		return;
+	type = symname + strlen(prefix);
+
 	name = strstr(type, "__");
 	if (!name)
 		return;
-- 
2.43.0


