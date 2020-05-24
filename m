Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFEE1E0003
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387483AbgEXPnp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:43:45 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19713 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728584AbgEXPnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:24 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcVC017561;
        Mon, 25 May 2020 00:42:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcVC017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334973;
        bh=yUj5Ws3WkKKXaLwrUzHeEtDsUInB1hdig+Me2Av4724=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SJxBhAWRgWMoFClDMRc8JhI1KK92/HdamHroNt6xQFiWCX2nfUTh44PDhqikgAJwg
         K0/WY8rjbmY/s3zQ1k2ECFQ3I/RlYI0XsEcyR29EMnaNKnep+g+Y2z2qx46f0wEPaD
         pawZmoyecQnDZQsELE91hYEJGS7LwJMGV49l9CvvMYTtaxigjeL+IZsFC47M7DA/us
         xmQu5599B+olsaTCAw06nlVMbXidFgF37Uhif9883dqTW2klJkn/8L9/M2mFmgRYdw
         xO/U35xLRWnXOx/w+DnI53NJR7FNm3JWK52SJr42wkpWcNbkD13GDOYJK9DqCHkjuT
         T4DMb+bZOJaUA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/29] modpost: strip .o from modname before calling new_module()
Date:   Mon, 25 May 2020 00:42:33 +0900
Message-Id: <20200524154235.380482-28-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
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

Changes in v2: None

 scripts/mod/modpost.c | 20 +++++++++++---------
 scripts/mod/modpost.h |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 662dc1ca10f8..2c783adbfc34 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -174,18 +174,12 @@ static struct module *find_module(const char *modname)
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
@@ -2013,7 +2007,15 @@ static void read_symbols(const char *modname)
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

