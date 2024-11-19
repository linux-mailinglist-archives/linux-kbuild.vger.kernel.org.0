Return-Path: <linux-kbuild+bounces-4740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9169D312B
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AC12B24091
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5531D88A4;
	Tue, 19 Nov 2024 23:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJw15zin"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B731D86F1;
	Tue, 19 Nov 2024 23:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060643; cv=none; b=ODpsgDZKFD9exRI/+c7jhmVyL9sb/IyZkNO/WohOAkuaM6gI86nVrEqg54uMUBGETgtuv3zHFYycOsLL6dPei/0Ut04ewZqr8m5LSP9zqH4vvk7CkYdgIH8vfgrvrqMnWDqKOHKzTQ0MsD2D5c3ByS71edUkwdyM4VBrNS+wYKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060643; c=relaxed/simple;
	bh=BFE567jk5hMY3vkdPzT5s22tSCEq1tHVoTGBGYqH5OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hf3ONyvwOvK39XwabZs006Thgxkqb+9SkZ/sZlhLkoe8QBUxc8lhvoQfB/9VC5mI4AOCX8a9Nm/rDawdeixurHoBWrz4wkTrMfoa4ng3MGPlrpNYZEZbEohZAYblwah59gz7KkqGW5Q/eHkjGuo1ueBjGdwJz9Vj83r5giRN1Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJw15zin; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F7AC4CED1;
	Tue, 19 Nov 2024 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060642;
	bh=BFE567jk5hMY3vkdPzT5s22tSCEq1tHVoTGBGYqH5OM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eJw15zinQK0vo2NjXlThmKlWzwSD5jIhx0KrpMHcuX1pLwU3S5q7AxZGAH1MOqNNn
	 6luaIcD9e0w+L1gbDgjQgI2wnbiide/zjnpBU6C1b9iYDBDyaqOmUve9vgnOQM8OLq
	 cKbzahJI9g576Aaya3MBL+jWlBZ7yK9y6pslRAjCmHBwIGp7K+r+fJzfMPk062UM8M
	 5SWntZtAUozNOPK3NT2RY+2+ofxvPCEcRms0ylWNt37JMNa1iIsuHj+xDZc0pg5odO
	 V+yAXlU6ezunzschN0tusgYgE9w3ujYEn845Y21W7SU2suMi0G+fUFyayF1lDmod8t
	 9nr/2WCWXcqkQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/15] modpost: convert do_pnp_card_entries() to a generic handler
Date: Wed, 20 Nov 2024 08:56:46 +0900
Message-ID: <20241119235705.1576946-8-masahiroy@kernel.org>
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

do_pnp_card_entries() no longer needs to iterate over the
pnp_card_device_id array.

Convert it to a generic ->do_entry() handler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 39 ++++++++++++++-------------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 10da84599c1a..eabf702ef1a2 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -649,34 +649,24 @@ static void do_pnp_device_entry(void *symval, unsigned long size,
 }
 
 /* looks like: "pnp:dD" for every device of the card */
-static void do_pnp_card_entries(void *symval, unsigned long size,
-				struct module *mod)
+static void do_pnp_card_entry(struct module *mod, void *symval)
 {
-	const unsigned long id_size = SIZE_pnp_card_device_id;
-	const unsigned int count = (size / id_size)-1;
-	unsigned int i;
+	DEF_FIELD_ADDR(symval, pnp_card_device_id, devs);
 
-	device_id_check(mod->name, "pnp", size, id_size, symval);
+	for (unsigned int i = 0; i < PNP_MAX_DEVICES; i++) {
+		const char *id = (char *)(*devs)[i].id;
+		char acpi_id[PNP_ID_LEN];
 
-	for (i = 0; i < count; i++) {
-		unsigned int j;
-		DEF_FIELD_ADDR(symval + i * id_size, pnp_card_device_id, devs);
+		if (!id[0])
+			break;
 
-		for (j = 0; j < PNP_MAX_DEVICES; j++) {
-			const char *id = (char *)(*devs)[j].id;
-			char acpi_id[PNP_ID_LEN];
+		/* fix broken pnp bus lowercasing */
+		for (unsigned int j = 0; j < sizeof(acpi_id); j++)
+			acpi_id[j] = toupper(id[j]);
 
-			if (!id[0])
-				break;
-
-			/* add an individual alias for every device entry */
-			module_alias_printf(mod, false, "pnp:d%s*", id);
-
-			/* fix broken pnp bus lowercasing */
-			for (int k = 0; k < sizeof(acpi_id); k++)
-				acpi_id[k] = toupper(id[k]);
-			module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
-		}
+		/* add an individual alias for every device entry */
+		module_alias_printf(mod, false, "pnp:d%s*", id);
+		module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
 	}
 }
 
@@ -1539,6 +1529,7 @@ static const struct devtable devtable[] = {
 	{"cdx", SIZE_cdx_device_id, do_cdx_entry},
 	{"vchiq", SIZE_vchiq_device_id, do_vchiq_entry},
 	{"coreboot", SIZE_coreboot_device_id, do_coreboot_entry},
+	{"pnp_card", SIZE_pnp_card_device_id, do_pnp_card_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
@@ -1589,8 +1580,6 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 		do_of_table(symval, sym->st_size, mod);
 	else if (sym_is(name, namelen, "pnp"))
 		do_pnp_device_entry(symval, sym->st_size, mod);
-	else if (sym_is(name, namelen, "pnp_card"))
-		do_pnp_card_entries(symval, sym->st_size, mod);
 	else {
 		int i;
 
-- 
2.43.0


