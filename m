Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A572BFCC05
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 18:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfKNRmi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 12:42:38 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:64767 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKNRmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:42:37 -0500
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id xAEHgSo6028428;
        Fri, 15 Nov 2019 02:42:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xAEHgSo6028428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573753351;
        bh=fUBxXICdayMSot+TU06/7Ds+CnTO5ybIlw5ICaeyTpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CjDBNJoQ1nFHK4r4CLKmPL1Jn0sCTmTUQp802gD4dmqGZ0GxE/pGDuq2sx3/33pY6
         K7t9nxIiS2w/keZd7gwq/hJbzESVtEBRwiQBSQCsjLx1jPARHdYyq+4B+93QyjK3BB
         Dwx3FkGg3jOx3vbJuvPHSwUuac9bTx0S/CVfSey1gIpIopP15PT9Ni1TK9Y356WvhA
         9aRFtC0Ja8r4QPid+ztjELX4X8/AtJozLZJQBzNA6XoODUaKjqXp9g1BWEWhmiukjp
         SPUI+8c92LCaDx6a8RpPHrh/Svk1BCk8SPXg/Bp7FTZUrk9X54GP/S6wRNUkevZGMk
         qreEmMHLVJHvw==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] modpost: respect the previous export when 'exported twice' is warned
Date:   Fri, 15 Nov 2019 02:42:26 +0900
Message-Id: <20191114174226.7201-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When 'exported twice' is warned, let sym_add_exported() return without
updating the symbol info. This respects the previous export, which is
ordered first in modules.order

This simplifies the code too.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 06086105011f..d9a92fbe1146 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -211,13 +211,11 @@ static struct symbol *new_symbol(const char *name, struct module *module,
 				 enum export export)
 {
 	unsigned int hash;
-	struct symbol *new;
 
 	hash = tdb_hash(name) % SYMBOL_HASH_SIZE;
-	new = symbolhash[hash] = alloc_symbol(name, 0, symbolhash[hash]);
-	new->module = module;
-	new->export = export;
-	return new;
+	symbolhash[hash] = alloc_symbol(name, 0, symbolhash[hash]);
+
+	return symbolhash[hash];
 }
 
 static struct symbol *find_symbol(const char *name)
@@ -392,17 +390,15 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 
 	if (!s) {
 		s = new_symbol(name, mod, export);
-	} else {
-		if (!external_module || is_vmlinux(s->module->name) ||
-		    s->module == mod) {
-			warn("%s: '%s' exported twice. Previous export was in %s%s\n",
-			     mod->name, name, s->module->name,
-			     is_vmlinux(s->module->name) ? "" : ".ko");
-		} else {
-			/* In case Module.symvers was out of date */
-			s->module = mod;
-		}
+	} else if (!external_module || is_vmlinux(s->module->name) ||
+		   s->module == mod) {
+		warn("%s: '%s' exported twice. Previous export was in %s%s\n",
+		     mod->name, name, s->module->name,
+		     is_vmlinux(s->module->name) ? "" : ".ko");
+		return s;
 	}
+
+	s->module = mod;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
 	s->export    = export;
-- 
2.17.1

