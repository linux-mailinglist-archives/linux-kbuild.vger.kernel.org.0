Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB2E1D670D
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgEQJuP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:15 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39055 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgEQJuC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:50:02 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LP018560;
        Sun, 17 May 2020 18:49:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LP018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708962;
        bh=d4uuccwg4a1AZnetOeClGOO3V+MmtQaBZS3DQjl2oq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Obe1PHqjQe7nvWTOAB1LGaVXbXr0CJU6ACHRLxqQkK04vMZGFJRX+xLUnyIWbUDmL
         F3iB9euXSfYo38EGqT7WohE6IjJ3d2hKDD1wRf300aiC8M4eeseGBslyVN45rqu/yl
         1ig4hoL3IbpV83qB5WYNXTQ1BOyjuZN6n7ioJUWMOUNm7aye0H9V3oph4Yg+Rz7QAZ
         FIyhkZXTyhI1cc378FwiBOm+8B0QPedGOQISp3MNDtRUlkmFAdqoOb6DhZqtZVP0lQ
         XDEuSU/vaPzuWuC0rdr/HazQTcMLiGB7NC0NuvRBBmzyWNnf3x8NRYHNttl3DoOEag
         ZplneFZ9UBY4g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 28/29] modpost: remove is_vmlinux() helper
Date:   Sun, 17 May 2020 18:48:58 +0900
Message-Id: <20200517094859.2376211-29-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that is_vmlinux() is called only in new_module(), we can inline
the function call.

modname is the basename with '.o' is stripped. No need to compare it
with 'vmlinux.o'.

vmlinux is always located at the current working directory. No need
to strip the directory path.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 6669b3ace968..bcab010f09ce 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -90,20 +90,6 @@ static inline bool strends(const char *str, const char *postfix)
 	return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
 }
 
-static int is_vmlinux(const char *modname)
-{
-	const char *myname;
-
-	myname = strrchr(modname, '/');
-	if (myname)
-		myname++;
-	else
-		myname = modname;
-
-	return (strcmp(myname, "vmlinux") == 0) ||
-	       (strcmp(myname, "vmlinux.o") == 0);
-}
-
 void *do_nofail(void *ptr, const char *expr)
 {
 	if (!ptr)
@@ -170,7 +156,7 @@ static struct module *new_module(const char *modname)
 
 	/* add to list */
 	strcpy(mod->name, modname);
-	mod->is_vmlinux = is_vmlinux(modname);
+	mod->is_vmlinux = (strcmp(modname, "vmlinux") == 0);
 	mod->gpl_compatible = -1;
 	mod->next = modules;
 	modules = mod;
-- 
2.25.1

