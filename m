Return-Path: <linux-kbuild+bounces-4745-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6978D9D3135
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 01:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09D91B24694
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228FE1DD0EF;
	Tue, 19 Nov 2024 23:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/G2KUfR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE21DA0FC;
	Tue, 19 Nov 2024 23:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060651; cv=none; b=W6Rtt+uk0YWw53J8V9KZIamMBVn1np/wQmtU1ed0mlYLzcReKwnRMXaC2SYTxW4hDIpJRue+GUKW8BgBWmLYI8zuWC85dPV04u55DWlB57GViyVZ4MPJEtDlyyfGsrDu0BxB03aCCuomrzjEjjdaJ+oY0K68G0Rj+whjI6lG1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060651; c=relaxed/simple;
	bh=Q/46/hhC7u7JLC10NfRY7oBuqMkgZYJuHnZm0SPQvcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4DIjHImayMvov+BgDh2HIaBKuq0atRRjoMc41PqWuuAB5a2wC5yEEU2rdao4X6l6smFGxcSEpSxFuR/cavFf95dnSSPkKfDKFO9eTTJ3J1kLw61EfX+3jNZ8y+l8NimrMrL6XKooZM9kwzGxJkcTQe4HHxTihdcwmArIlqUBOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/G2KUfR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF59C4CED8;
	Tue, 19 Nov 2024 23:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060650;
	bh=Q/46/hhC7u7JLC10NfRY7oBuqMkgZYJuHnZm0SPQvcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o/G2KUfRytzM5+HHrIPXIUA/BaJB7y9C7Sg6NVa8VpSpKgaAqtVXlXehP8csHT2F7
	 dMRSDr1KuVRsI7aD+ZLV9bWRa5tRcdSZ3LcZV42lf5Kgovf98VGVp0Xrb9lYn7Ekbo
	 sH8zto6mZ8ksf5e2wR51G6RpUFethIBNVcuOlNO1HSzgPYMqNfR/6gybsoCaKBu0ly
	 LPF8PztTwJeVtKXdnHNqjy+m2dl33jSI55iznapIQhE7dMX0IEfrXV1pM+nSt3xAaN
	 PLaLOEUDtL2bhDHz/1n2zLVK+3Ks0+1jbXZxS/rsX1nYvzij+jqeA9BNRwZM8UmXKQ
	 IuKodHFxtMOVg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] modpost: rename variables in handle_moddevtable()
Date: Wed, 20 Nov 2024 08:56:51 +0900
Message-ID: <20241119235705.1576946-13-masahiroy@kernel.org>
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

This commit renames the variables in handle_moddevtable() as follows:

    name       -> type
    namelen    -> typelen
    identifier -> name

These changes align with the names in include/linux/module.h:

  extern typeof(name) __mod_##type##__##name##_device_table

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 01a4b0eaca6d..2374737b9d22 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1501,8 +1501,8 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 {
 	void *symval;
 	char *zeros = NULL;
-	const char *name, *identifier;
-	unsigned int namelen;
+	const char *type, *name;
+	size_t typelen;
 
 	/* We're looking for a section relative symbol */
 	if (!sym->st_shndx || get_secindex(info, sym) >= info->num_sections)
@@ -1512,19 +1512,19 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 		return;
 
-	/* All our symbols are of form __mod_<name>__<identifier>_device_table. */
+	/* All our symbols are of form __mod_<type>__<name>_device_table. */
 	if (!strstarts(symname, "__mod_"))
 		return;
-	name = symname + strlen("__mod_");
-	namelen = strlen(name);
-	if (namelen < strlen("_device_table"))
+	type = symname + strlen("__mod_");
+	typelen = strlen(type);
+	if (typelen < strlen("_device_table"))
 		return;
-	if (strcmp(name + namelen - strlen("_device_table"), "_device_table"))
+	if (strcmp(type + typelen - strlen("_device_table"), "_device_table"))
 		return;
-	identifier = strstr(name, "__");
-	if (!identifier)
+	name = strstr(type, "__");
+	if (!name)
 		return;
-	namelen = identifier - name;
+	typelen = name - type;
 
 	/* Handle all-NULL symbols allocated into .bss */
 	if (info->sechdrs[get_secindex(info, sym)].sh_type & SHT_NOBITS) {
@@ -1537,7 +1537,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	for (int i = 0; i < ARRAY_SIZE(devtable); i++) {
 		const struct devtable *p = &devtable[i];
 
-		if (sym_is(name, namelen, p->device_id)) {
+		if (sym_is(type, typelen, p->device_id)) {
 			do_table(symval, sym->st_size, p->id_size,
 				 p->device_id, p->do_entry, mod);
 			break;
-- 
2.43.0


