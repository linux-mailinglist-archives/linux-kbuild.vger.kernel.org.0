Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A16C1D671C
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbgEQJuo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:44 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38317 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4Kx018560;
        Sun, 17 May 2020 18:49:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4Kx018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708946;
        bh=XgxxbTZCB+kMszGei0tHNQqHRoGHaow3OTqbzc12Rcs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KTCUDpUrXnxHd4p0HCZUZFvsP5EybE7hP1+t1botpzwdDiJcVHNKMN8JuxhDO/sdR
         AW22JZ5CVIrPuIJs5AV0bQpS51ovAmqhtOJnTLvZ1l/1HxYkCZM/LHq2NQVhdMLJfS
         yRu9nc87J90nKe4totW238w/cAwBxX7shgkeW0MakTmDh86Cpk2749ViN8SImMOgMS
         yhDZZjzd+nlLh8CVlU9qB8ZCqZHeb4A1lTCYNIwSbumOEaJYtrplN8zNolOArSvnlP
         O2VmJhYfPtM5GPhrvMV22WbSdNFZDWx8UWpZoA5FEDcMCgrPr0hjZt4nX181TlZCw9
         Pv/IAIL637y3A==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/29] modpost: do not call get_modinfo() for vmlinux
Date:   Sun, 17 May 2020 18:48:32 +0900
Message-Id: <20200517094859.2376211-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
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

