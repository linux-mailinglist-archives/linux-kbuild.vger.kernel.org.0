Return-Path: <linux-kbuild+bounces-4742-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB26C9D312F
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 557D2B23D9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5091D959B;
	Tue, 19 Nov 2024 23:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJuZ1y2a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C2B1D935F;
	Tue, 19 Nov 2024 23:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060646; cv=none; b=THYCqNJXe+4wvOuKPKTtbwdStmwyDHMDpMK92znRQPd6mbrxawKUnBNXXDe5InPaeKzMOiq4ULCvzpqV02QI3qukGoCRQoICbz/WP2yY1W5vdQaT5pUw7jeV2oBcJzzgSFXUAg79/wpA/Rxh3XKki5AKcWTJEpHdk/9E7PexsiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060646; c=relaxed/simple;
	bh=pUO6nADFejLQ7uC20xB1RSlbzVNd4rf2udPH77iNP48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzNyA5BFQFMwCv1z68w56OyWA2E2WgjYl/B6Zvki4n+HRosQgpbwDbpLBxXkKOimq7icId8zkLQFIefsZEtzGVZ1AvN0nIj0NxGGtZA1AHYQiTZDfJ8NOU+62wucAnRZN+wC5f0ohen+taDh9FwjYCv+8KL+TQVgMTeDkx6jY9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJuZ1y2a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C528C4CED8;
	Tue, 19 Nov 2024 23:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060645;
	bh=pUO6nADFejLQ7uC20xB1RSlbzVNd4rf2udPH77iNP48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJuZ1y2aLLzHvbPfp1FjDU7UdAhVVZnT6Fwj2j6/UPRYPD8MFyF7WZqMJRmh/SH0J
	 gFJkE+nKVMfCeIkyPo8mfNTDf0SEc93EYy/obnxFEbEoQ4iwpqywkwcKSaJa8DeU1r
	 TkpAqdXGbcOUniRlq52LmxfGjf7AXlEspSPe9VQuuzG+2qnI7LXlaqWCE8ovd6HumL
	 yfrlz7gUWQIzA1yxfJWptJJPsOooER+ELuY4ku4uhrUcpktSRGsOF1rbem5dlwtEq8
	 JBrkso7OhaK8z02icT+ckAvPmYMrc/cD/zOETkuPg5xTZFbho25Lv2+r41ITa1levP
	 lZBobXf1UcMsw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/15] modpost: convert do_of_table() to a generic handler
Date: Wed, 20 Nov 2024 08:56:48 +0900
Message-ID: <20241119235705.1576946-10-masahiroy@kernel.org>
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

do_of_table() no longer needs to iterate over the of_device_id array.

Convert it to a generic ->do_entry() handler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 2bb9796a30be..42a76ad25d40 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -396,7 +396,7 @@ static void do_usb_table(void *symval, unsigned long size,
 		do_usb_entry_multi(symval + i, mod);
 }
 
-static void do_of_entry_multi(void *symval, struct module *mod)
+static void do_of_entry(struct module *mod, void *symval)
 {
 	char alias[500];
 	int len;
@@ -422,21 +422,6 @@ static void do_of_entry_multi(void *symval, struct module *mod)
 	module_alias_printf(mod, false, "%sC*", alias);
 }
 
-static void do_of_table(void *symval, unsigned long size,
-			struct module *mod)
-{
-	unsigned int i;
-	const unsigned long id_size = SIZE_of_device_id;
-
-	device_id_check(mod->name, "of", size, id_size, symval);
-
-	/* Leave last one: it's the terminator. */
-	size -= id_size;
-
-	for (i = 0; i < size; i += id_size)
-		do_of_entry_multi(symval + i, mod);
-}
-
 /* Looks like: hid:bNvNpN */
 static void do_hid_entry(struct module *mod, void *symval)
 {
@@ -1518,6 +1503,7 @@ static const struct devtable devtable[] = {
 	{"cdx", SIZE_cdx_device_id, do_cdx_entry},
 	{"vchiq", SIZE_vchiq_device_id, do_vchiq_entry},
 	{"coreboot", SIZE_coreboot_device_id, do_coreboot_entry},
+	{"of", SIZE_of_device_id, do_of_entry},
 	{"pnp", SIZE_pnp_device_id, do_pnp_device_entry},
 	{"pnp_card", SIZE_pnp_card_device_id, do_pnp_card_entry},
 };
@@ -1566,8 +1552,6 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	/* First handle the "special" cases */
 	if (sym_is(name, namelen, "usb"))
 		do_usb_table(symval, sym->st_size, mod);
-	else if (sym_is(name, namelen, "of"))
-		do_of_table(symval, sym->st_size, mod);
 	else {
 		int i;
 
-- 
2.43.0


