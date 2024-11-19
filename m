Return-Path: <linux-kbuild+bounces-4743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 091649D3131
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B7A1F232CA
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51591DA116;
	Tue, 19 Nov 2024 23:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAY0MSqJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9681DA0FC;
	Tue, 19 Nov 2024 23:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060647; cv=none; b=K3fzNex9BhedHuvJLY+tgSUOi90NuF7wic2JNT9/Q/Tuz+qVulmgEqGB3npK8DXYUz7RysCbZHnh+jB3gR06r5XuF/X3ie+KNQBP+cp35TNafYKPXssxQZbaAKo3GR0AMPRAf7fiMRPW/gp5ImhzBNNYrxrwRyMD8VloLdH6ahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060647; c=relaxed/simple;
	bh=vopBxyzn7ThFZEGIUPB0bKYCFzVKl3VSCgwq4H4l3DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hELbFUVNLq7FeTxwy6RWajoY361oQCqP1pZKFWfmKE8wbFQPpfIYKsJnzYvn3CbR4y8Ekj0wAFxcb5ZxewH0gP9aIaNsBLtegc6RrmIPrn8kGJMcYrKyudvqYW/OwJgM1OgaU/91rFYZ1isxXzPl5L9oQCc6yNu0/8FQ5Rgk9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAY0MSqJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E13FC4CEDB;
	Tue, 19 Nov 2024 23:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060647;
	bh=vopBxyzn7ThFZEGIUPB0bKYCFzVKl3VSCgwq4H4l3DI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lAY0MSqJB8JP+o2pd7jRLtPz9xR9ENNmJH/ueHrIEFYIZQJkjHspFg+vItgaDTFBg
	 iMTQqP4pIMDwX4PZOvTlpW+moH5x+0+sxwJNt3F6m9HX477v7Szl1TWM75xr8anco8
	 jbaeUyRTWqqSkpBTqfEgQp95aHYWttLay9+7cw6qbYfNixzqAItguozcEurN5OqC8N
	 AILZw4mJJv8PiBEr9SbekOT9GmrNVu6XE6fgFYcQ0GypGPIPw54O1wL6b2oPJ2mhZL
	 ls8cuwbiumezAkuZTk6N0SejIW/GureiGGL/HtNWTiqNrfO8BJoPhcJEPWpDPa6oab
	 YXtLriHloRG2A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/15] modpost: convert do_usb_table() to a generic handler
Date: Wed, 20 Nov 2024 08:56:49 +0900
Message-ID: <20241119235705.1576946-11-masahiroy@kernel.org>
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

do_usb_table() no longer needs to iterate over the usb_device_id array.

Convert it to a generic ->do_entry() handler.

This is the last special case. Clean up handle_moddevtable().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 42a76ad25d40..b2d5e6451959 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -120,7 +120,6 @@ typedef struct {
  * we handle those differences explicitly below */
 #include "../../include/linux/mod_devicetable.h"
 
-/* This array collects all instances that use the generic do_table */
 struct devtable {
 	const char *device_id; /* name of table, __mod_<name>__*_device_table. */
 	unsigned long id_size;
@@ -316,7 +315,7 @@ static unsigned int incbcd(unsigned int *bcd,
 	return init;
 }
 
-static void do_usb_entry_multi(void *symval, struct module *mod)
+static void do_usb_entry_multi(struct module *mod, void *symval)
 {
 	unsigned int devlo, devhi;
 	unsigned char chi, clo, max;
@@ -381,21 +380,6 @@ static void do_usb_entry_multi(void *symval, struct module *mod)
 	}
 }
 
-static void do_usb_table(void *symval, unsigned long size,
-			 struct module *mod)
-{
-	unsigned int i;
-	const unsigned long id_size = SIZE_usb_device_id;
-
-	device_id_check(mod->name, "usb", size, id_size, symval);
-
-	/* Leave last one: it's the terminator. */
-	size -= id_size;
-
-	for (i = 0; i < size; i += id_size)
-		do_usb_entry_multi(symval + i, mod);
-}
-
 static void do_of_entry(struct module *mod, void *symval)
 {
 	char alias[500];
@@ -1504,6 +1488,7 @@ static const struct devtable devtable[] = {
 	{"vchiq", SIZE_vchiq_device_id, do_vchiq_entry},
 	{"coreboot", SIZE_coreboot_device_id, do_coreboot_entry},
 	{"of", SIZE_of_device_id, do_of_entry},
+	{"usb", SIZE_usb_device_id, do_usb_entry_multi},
 	{"pnp", SIZE_pnp_device_id, do_pnp_device_entry},
 	{"pnp_card", SIZE_pnp_card_device_id, do_pnp_card_entry},
 };
@@ -1549,21 +1534,15 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 		symval = sym_get_data(info, sym);
 	}
 
-	/* First handle the "special" cases */
-	if (sym_is(name, namelen, "usb"))
-		do_usb_table(symval, sym->st_size, mod);
-	else {
-		int i;
+	for (int i = 0; i < ARRAY_SIZE(devtable); i++) {
+		const struct devtable *p = &devtable[i];
 
-		for (i = 0; i < ARRAY_SIZE(devtable); i++) {
-			const struct devtable *p = &devtable[i];
-
-			if (sym_is(name, namelen, p->device_id)) {
-				do_table(symval, sym->st_size, p->id_size,
-					 p->device_id, p->do_entry, mod);
-				break;
-			}
+		if (sym_is(name, namelen, p->device_id)) {
+			do_table(symval, sym->st_size, p->id_size,
+				 p->device_id, p->do_entry, mod);
+			break;
 		}
 	}
+
 	free(zeros);
 }
-- 
2.43.0


