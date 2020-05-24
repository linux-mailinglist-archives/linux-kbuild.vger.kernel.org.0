Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9DA1E000E
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387776AbgEXPoC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:02 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19708 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728491AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUl017561;
        Mon, 25 May 2020 00:42:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUl017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334960;
        bh=AmWnXsDA0m9RaYw4vjP1saZJezsMT0YyLRKQlJgcCkA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ls2+BHAirpssH38YftP+jC5ueS0xKVdPyTxzI9LHqQBUS+zSwgl0uBB59w5SrjK5R
         OaJ2Cg+0GZaqO26U5tYeHhBACR27+T6cxmYhj53Us/F3hXx7f8F3/ofotuAFfpewOg
         cbBfwy1LM1XCFGL49npE47j4tzbTo0j3mDoD8ebQ7A5zgnNl3Ic4VvqiYakCrAW8RW
         JEkDnsfIX4maz2GWiH8xEu9izChdWkqMm83MwHMOy3bhKzGj/qkOtJmz3DCO3ZShBR
         nzJfC9TwW8CFDvIMvhGLtimfkruH0y09wH5zSK9Y2EfbSZoy4180KGx0OYWW0CqBWl
         fNOVS0fC46TvQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/29] modpost: do not call get_modinfo() for vmlinux
Date:   Mon, 25 May 2020 00:42:08 +0900
Message-Id: <20200524154235.380482-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The three calls of get_modinfo() ("license", "import_ns", "version")
always return NULL for vmlinux because the built-in module info is
prefixed with __MODULE_INFO_PREFIX.

It is harmless to call get_modinfo(), but there is no point to search
for what apparently does not exist.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 45 +++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 77e5425759e2..af098d7efc22 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2014,25 +2014,26 @@ static void read_symbols(const char *modname)
 		mod->skip = 1;
 	}
 
-	license = get_modinfo(&info, "license");
-	if (!license && !is_vmlinux(modname))
-		warn("missing MODULE_LICENSE() in %s\n"
-		     "see include/linux/module.h for "
-		     "more information\n", modname);
-	while (license) {
-		if (license_is_gpl_compatible(license))
-			mod->gpl_compatible = 1;
-		else {
-			mod->gpl_compatible = 0;
-			break;
+	if (!is_vmlinux(modname)) {
+		license = get_modinfo(&info, "license");
+		if (!license)
+			warn("missing MODULE_LICENSE() in %s\n", modname);
+		while (license) {
+			if (license_is_gpl_compatible(license))
+				mod->gpl_compatible = 1;
+			else {
+				mod->gpl_compatible = 0;
+				break;
+			}
+			license = get_next_modinfo(&info, "license", license);
 		}
-		license = get_next_modinfo(&info, "license", license);
-	}
 
-	namespace = get_modinfo(&info, "import_ns");
-	while (namespace) {
-		add_namespace(&mod->imported_namespaces, namespace);
-		namespace = get_next_modinfo(&info, "import_ns", namespace);
+		namespace = get_modinfo(&info, "import_ns");
+		while (namespace) {
+			add_namespace(&mod->imported_namespaces, namespace);
+			namespace = get_next_modinfo(&info, "import_ns",
+						     namespace);
+		}
 	}
 
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
@@ -2073,10 +2074,12 @@ static void read_symbols(const char *modname)
 	if (!is_vmlinux(modname) || vmlinux_section_warnings)
 		check_sec_ref(mod, modname, &info);
 
-	version = get_modinfo(&info, "version");
-	if (version || (all_versions && !is_vmlinux(modname)))
-		get_src_version(modname, mod->srcversion,
-				sizeof(mod->srcversion)-1);
+	if (!is_vmlinux(modname)) {
+		version = get_modinfo(&info, "version");
+		if (version || all_versions)
+			get_src_version(modname, mod->srcversion,
+					sizeof(mod->srcversion) - 1);
+	}
 
 	parse_elf_finish(&info);
 
-- 
2.25.1

