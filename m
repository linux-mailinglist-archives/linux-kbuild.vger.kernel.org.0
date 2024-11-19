Return-Path: <linux-kbuild+bounces-4741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FF9D312D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1A40283FB9
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E91C1D8A0A;
	Tue, 19 Nov 2024 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1qc2Nvf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762811D86E6;
	Tue, 19 Nov 2024 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060644; cv=none; b=csa1Rr071u2b+WW+22F4AS+TJWya9fsij/bDFbf4L45isomJQcejjbiU96kboaSYEL2lAlqrr5ZHvYfPFyjkB7+m//WNioScP26BU8qlyPugwdpK6agepXKikPfQRVaIaorwh5unvGO8PcwFKo+SwEjKUg3zEnyjYE57ivRE8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060644; c=relaxed/simple;
	bh=r1uT11gpanl28m8/i49Kdo3xqNeBazUwVyTsSlb04Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtG4zp85UXb2MF5uXzHMFDJfCg5DT3mmi5O0hWCui0C6FPHA2LXjZapCq0DVxAF06qg79W8MeLauQbZknAxTymXT8YAxJEsX8ealoNfIT3242G+4uSszhHINRrgkcdIbydapBOyVQ3aUL40Qxt84D/0WPkr0LpIRFblUC/aCKi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1qc2Nvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AE3C4CED2;
	Tue, 19 Nov 2024 23:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060644;
	bh=r1uT11gpanl28m8/i49Kdo3xqNeBazUwVyTsSlb04Q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l1qc2Nvfb2edO1LyeG2KIgvPNwoSox/orcyOZKKtcT24pP2gkKDVw8UKYyCgY3+DL
	 VqTw6/Hh/Aug3UXYNlXHdTCnyP5ZUprA+V1ZJjcCysm766faaUdG4SOQKKL/Hos7KY
	 3/n69RX0EGAfV8h148/QYV1lBcfJJ05iWHveshrcWWsIg9TG8VMUr+QCAsvd+ZRorG
	 p53xTs1Eobe8w8i032HPOqwHjMXbj+Ywd1ShqdS3Vu/0qNXomVWMFhtj++s+z6Irq/
	 q2dWpqGROrrfzTLVT9ApKprcYuP8z+Hr1d4V4peVIL2ciK2a6qa2s7X3xqkD/iHmCi
	 R9a/kduBUK67g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/15] modpost: convert do_pnp_device_entry() to a generic handler
Date: Wed, 20 Nov 2024 08:56:47 +0900
Message-ID: <20241119235705.1576946-9-masahiroy@kernel.org>
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

do_pnp_device_entry() no longer needs to iterate over the
pnp_device_id array.

Convert it to a generic ->do_entry() handler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index eabf702ef1a2..2bb9796a30be 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -625,27 +625,16 @@ static void do_acpi_entry(struct module *mod, void *symval)
 }
 
 /* looks like: "pnp:dD" */
-static void do_pnp_device_entry(void *symval, unsigned long size,
-				struct module *mod)
+static void do_pnp_device_entry(struct module *mod, void *symval)
 {
-	const unsigned long id_size = SIZE_pnp_device_id;
-	const unsigned int count = (size / id_size)-1;
-	unsigned int i;
+	DEF_FIELD_ADDR(symval, pnp_device_id, id);
+	char acpi_id[sizeof(*id)];
 
-	device_id_check(mod->name, "pnp", size, id_size, symval);
-
-	for (i = 0; i < count; i++) {
-		DEF_FIELD_ADDR(symval + i*id_size, pnp_device_id, id);
-		char acpi_id[sizeof(*id)];
-		int j;
-
-		module_alias_printf(mod, false, "pnp:d%s*", *id);
-
-		/* fix broken pnp bus lowercasing */
-		for (j = 0; j < sizeof(acpi_id); j++)
-			acpi_id[j] = toupper((*id)[j]);
-		module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
-	}
+	/* fix broken pnp bus lowercasing */
+	for (unsigned int i = 0; i < sizeof(acpi_id); i++)
+		acpi_id[i] = toupper((*id)[i]);
+	module_alias_printf(mod, false, "pnp:d%s*", *id);
+	module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
 }
 
 /* looks like: "pnp:dD" for every device of the card */
@@ -1529,6 +1518,7 @@ static const struct devtable devtable[] = {
 	{"cdx", SIZE_cdx_device_id, do_cdx_entry},
 	{"vchiq", SIZE_vchiq_device_id, do_vchiq_entry},
 	{"coreboot", SIZE_coreboot_device_id, do_coreboot_entry},
+	{"pnp", SIZE_pnp_device_id, do_pnp_device_entry},
 	{"pnp_card", SIZE_pnp_card_device_id, do_pnp_card_entry},
 };
 
@@ -1578,8 +1568,6 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 		do_usb_table(symval, sym->st_size, mod);
 	else if (sym_is(name, namelen, "of"))
 		do_of_table(symval, sym->st_size, mod);
-	else if (sym_is(name, namelen, "pnp"))
-		do_pnp_device_entry(symval, sym->st_size, mod);
 	else {
 		int i;
 
-- 
2.43.0


