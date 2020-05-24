Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B071E0021
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388039AbgEXPoo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:44 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19690 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcVB017561;
        Mon, 25 May 2020 00:42:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcVB017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334973;
        bh=kwoq5xpA8F/sctaUPYuQ/4h7HRDZ9Kghbw9a951gG9g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zT9GVGUXktFw8aUZWUPGTCkt72SUbCF3HVywE58oWjS/NLoWyaa7YLadQSG1wQvCs
         statZrFohPyKwmz4MAfHPzf2t0tJ2oX80M25uRqm/JOubgGWYDcHwF5fQRav0yare0
         2JmG/RlYKW/eUkImzxiMVSfhuo3aa8GHgizYbGL8WKeVJ81RtyjKkRGO2jX+OPQ8Z4
         Lk8UyrYhIgEkNJA9ARtswZ59/mUQBn8qfm025qWLDsFiJmHT0xI7WleFyReIsPSl5Y
         2WUrApN710tU/hAuU7b7wJfzH4J990Euedb/N5VC4BbNVZGlMm7aPyhQC468q2KVi6
         QS3B/nT25P9XQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 26/29] modpost: set have_vmlinux in new_module()
Date:   Mon, 25 May 2020 00:42:32 +0900
Message-Id: <20200524154235.380482-27-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Set have_vmlinux flag in a single place.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index fdf843323d98..662dc1ca10f8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -191,6 +191,9 @@ static struct module *new_module(const char *modname)
 	mod->next = modules;
 	modules = mod;
 
+	if (mod->is_vmlinux)
+		have_vmlinux = 1;
+
 	return mod;
 }
 
@@ -2012,9 +2015,6 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (mod->is_vmlinux)
-		have_vmlinux = 1;
-
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
 		if (!license)
@@ -2462,8 +2462,6 @@ static void read_dump(const char *fname)
 		mod = find_module(modname);
 		if (!mod) {
 			mod = new_module(modname);
-			if (mod->is_vmlinux)
-				have_vmlinux = 1;
 			mod->from_dump = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
-- 
2.25.1

