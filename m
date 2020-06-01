Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AFF1E9DB7
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgFAF6Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:25 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40004 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaM1023694;
        Mon, 1 Jun 2020 14:57:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaM1023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991066;
        bh=NDURC0gwy0my51O5joUWpLmpjipdF2W8sA79dvxXloM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qX5lZGtA39IRKlZM77A0TF4ELVvLJp5aooUmFSbuTyXr9eDeYHOS8I8m/HzgAo2r/
         CIjMl6daPE0J722Edg9zXqAbelQJ3DZ4aSNbyZa3kNVJ1rRa2UuIQVKwnLs7Ou9zES
         gNV6Mq0OsK1bm3vdVo3EM2/BvWmjx0TxYWpFls+/GVLmbBFhrNa8+zGgzjIqmEYDOZ
         zjVx4l/TVR34fU/y1PTzEi4Jx1EVbWYCStoRfK0Ss4s/iWdfAUT/zWxiLLnS1LyZRt
         vwby+XXDwmvhgL9NqubzqoEwuD2CvA7dToXOM9e2gyaykXdtLvUfRJg1tKyp7FS5HP
         IE6PY1F/+hAog==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 22/37] modpost: do not call get_modinfo() for vmlinux(.o)
Date:   Mon,  1 Jun 2020 14:57:16 +0900
Message-Id: <20200601055731.3006266-22-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The three calls of get_modinfo() ("license", "import_ns", "version")
always return NULL for vmlinux(.o) because the built-in module info is
prefixed with __MODULE_INFO_PREFIX.

It is harmless to call get_modinfo(), but there is no point to search
for what apparently does not exist.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 45 +++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index fbb3d3391e52..a5da633af700 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2006,25 +2006,26 @@ static void read_symbols(const char *modname)
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
@@ -2065,10 +2066,12 @@ static void read_symbols(const char *modname)
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

