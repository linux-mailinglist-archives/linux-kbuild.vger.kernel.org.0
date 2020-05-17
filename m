Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C6A1D6708
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgEQJuD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:03 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39048 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgEQJuC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:50:02 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LO018560;
        Sun, 17 May 2020 18:49:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LO018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708962;
        bh=pWTMVkeEgPCgFu1Z1gi1k7k4Qcp0RYRNIC0asNdVtuE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z7XUEQfDK5rJ6eW5C6Qu58nZnpYxQHKn3TqONzv4ogNLmyFzH9psbaS3SFn91EgCE
         v2LziWdjC8DbA0NtD9E01f6SYsjdHAhuLthpvsbkWfRYBc/sDk9RNdLTNBOjVxyeZt
         GhyOwSNffUM7VN6xuiQ8EzjcNtYy4TMNdM6Hwi8uHsZe1Jjwp9c+Nxs4lirOcI+Llj
         gVFCq1C/zOt3SIaCZS+k1KZ1jVhzdxisJEIOgDw9jgx8TOuSNjpiObZuOvx+iSaiFB
         V+irvnJFSLaNcA0x8nZR+hD7ghicdiIn9Eo076y/g6b/lGOAWFzHB+cYEAZThJPq40
         srhlwE6smCRZA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 27/29] modpost: strip .o from modname before calling new_module()
Date:   Sun, 17 May 2020 18:48:57 +0900
Message-Id: <20200517094859.2376211-28-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

new_module() conditionally strips the .o because the modname has .o
suffix when it is called from read_symbols(), but no .o when it is
called from read_dump().

It is clearer to strip .o in read_symbols().

I also used flexible-array for mod->name.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 20 +++++++++++---------
 scripts/mod/modpost.h |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 79622939a6c7..6669b3ace968 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -164,18 +164,12 @@ static struct module *find_module(const char *modname)
 static struct module *new_module(const char *modname)
 {
 	struct module *mod;
-	char *p;
 
-	mod = NOFAIL(malloc(sizeof(*mod)));
+	mod = NOFAIL(malloc(sizeof(*mod) + strlen(modname) + 1));
 	memset(mod, 0, sizeof(*mod));
-	p = NOFAIL(strdup(modname));
-
-	/* strip trailing .o */
-	if (strends(p, ".o"))
-		p[strlen(p) - 2] = '\0';
 
 	/* add to list */
-	mod->name = p;
+	strcpy(mod->name, modname);
 	mod->is_vmlinux = is_vmlinux(modname);
 	mod->gpl_compatible = -1;
 	mod->next = modules;
@@ -2003,7 +1997,15 @@ static void read_symbols(const char *modname)
 	if (!parse_elf(&info, modname))
 		return;
 
-	mod = new_module(modname);
+	{
+		char *tmp;
+
+		/* strip trailing .o */
+		tmp = NOFAIL(strdup(modname));
+		tmp[strlen(tmp) - 2] = '\0';
+		mod = new_module(tmp);
+		free(tmp);
+	}
 
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 264c0c51defa..1df87d204c9a 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -116,7 +116,6 @@ struct namespace_list {
 
 struct module {
 	struct module *next;
-	const char *name;
 	int gpl_compatible;
 	struct symbol *unres;
 	int from_dump;  /* 1 if module was loaded from *.symver */
@@ -130,6 +129,7 @@ struct module {
 	struct namespace_list *missing_namespaces;
 	// Actual imported namespaces
 	struct namespace_list *imported_namespaces;
+	char name[];
 };
 
 struct elf_info {
-- 
2.25.1

