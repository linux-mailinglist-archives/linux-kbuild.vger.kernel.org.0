Return-Path: <linux-kbuild+bounces-2957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 632AC94F55A
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 18:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8A55B255BE
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 16:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFA3188CB0;
	Mon, 12 Aug 2024 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpbGMEBF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343DB188CA5;
	Mon, 12 Aug 2024 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723481703; cv=none; b=NstfUL4JZY6c7EeDVcKf6lvVrm6mnQy1OfSN7WdfdWNu+5hMadYXE1gq17C7bZRrU1u8fXTy99qaEiupEFGEjNwKOoFgkyLZ+n17Q2GIE8oAHi5JvmTpH94wLXw8bDLva9GdenjoMiZYcTnFT2u6l24pr2WBjDxUQ4tCVH0eak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723481703; c=relaxed/simple;
	bh=BcApFvUj//KPJagmmhD/JklSjUpgx9UQ+W1crS2LIFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdvObXJESuvV0BKS/LRE9fRuMsA2yKqSsNimF3wJ3rJuAmpcoAKL5Ok8CiTo6YJfjsXkcx7361mUWfS5hib27lYJ1saFx/QYcsQwGzhg78h4nDc5023e71jKBu2Axzu1+BX5CbTJzN3ktmCjpKpEj2+OmlxgfFuPvV17Wg+62Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpbGMEBF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB89C32782;
	Mon, 12 Aug 2024 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723481702;
	bh=BcApFvUj//KPJagmmhD/JklSjUpgx9UQ+W1crS2LIFw=;
	h=From:To:Cc:Subject:Date:From;
	b=QpbGMEBFQKGNGYES9bD95v09aXcNFmgnfSdq6rqupidg0e0nM3x7MDVAf48sp3Qm7
	 y6aQzp6zMqJT7XPEaAT64lwwgcEy7VFI5X17uy0+eZUt5+eX8bLRCJ3/jN/C9S2201
	 ZTD/agNojgrH5CMOwiQ5l9/qVavoJgkbQQnFgKVi4ymySNC63ztV+ao3JLzJMYumhh
	 sk437sLGivMXH9Qln/3RpZLEl0TYqY6PizL2dHFlCCcL/9sbFz7cWkgCkG69t0e1cn
	 XrvgcDYfk+EgdGeczHMpIj7vZ0hQUBiKPHeBEmWPQnOz0RLdFUf1V92/FmRLPgRAs9
	 cvhvJqGN74RPg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] modpost: improve the section mismatch warning format
Date: Tue, 13 Aug 2024 01:54:51 +0900
Message-ID: <20240812165455.2156964-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit improves the section mismatch warning format when there is
no suitable symbol name to print.

The section mismatch warning prints the reference source in the form
of <symbol_name>+<offset> and the reference destination in the form
of <symbol_name>.

However, there are some corner cases where <symbol_name> becomes
"(unknown)", as reported in commit 23dfd914d2bf ("modpost: fix null
pointer dereference").

In such cases, it is better to print the symbol address.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d0f138803207..3e474291258c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -705,10 +705,7 @@ static char *get_modinfo(struct elf_info *info, const char *tag)
 
 static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
 {
-	if (sym)
-		return elf->strtab + sym->st_name;
-	else
-		return "(unknown)";
+	return sym ? elf->strtab + sym->st_name : "";
 }
 
 /*
@@ -1021,6 +1018,7 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 	Elf_Sym *from;
 	const char *tosym;
 	const char *fromsym;
+	char taddr_str[16];
 
 	from = find_fromsym(elf, faddr, fsecndx);
 	fromsym = sym_name(elf, from);
@@ -1034,10 +1032,17 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 
 	sec_mismatch_count++;
 
-	warn("%s: section mismatch in reference: %s+0x%x (section: %s) -> %s (section: %s)\n",
-	     modname, fromsym,
-	     (unsigned int)(faddr - (from ? from->st_value : 0)),
-	     fromsec, tosym, tosec);
+	if (!tosym[0])
+		snprintf(taddr_str, sizeof(taddr_str), "0x%x", (unsigned int)taddr);
+
+	/*
+	 * The format for the reference source:      <symbol_name>+<offset> or <address>
+	 * The format for the reference destination: <symbol_name>          or <address>
+	 */
+	warn("%s: section mismatch in reference: %s%s0x%x (section: %s) -> %s (section: %s)\n",
+	     modname, fromsym, fromsym[0] ? "+" : "",
+	     (unsigned int)(faddr - (fromsym[0] ? from->st_value : 0)),
+	     fromsec, tosym[0] ? tosym : taddr_str, tosec);
 
 	if (mismatch->mismatch == EXTABLE_TO_NON_TEXT) {
 		if (match(tosec, mismatch->bad_tosec))
-- 
2.43.0


