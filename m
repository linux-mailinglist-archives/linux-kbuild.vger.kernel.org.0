Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D191E0010
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387862AbgEXPoQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:16 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19692 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcV7017561;
        Mon, 25 May 2020 00:42:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcV7017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334970;
        bh=a1paNg9EzXG5LuEQAqonzJt3KMlw7xN4dNLffhBr2rk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SisG4EQ8MdG/896o7ZeflCHJJnmbL0kyHe21kb/kWIYT5/raDSw6Z6z6C8MT8kr1B
         DAN6nwA5lYuTtORJ0VOUqDFYD7nvvB4lBNsJLO8kK7o+0gir2RRSWVtgtbJ3mFpZQY
         zNS180CzDbFZFtHECi+t1zCNmPk36J7hnk0iyIX70vcJuXFu13hFK3h3SOS3apjeYM
         PkugWhBXGoSqj5bQ0vD9OXK7iej196Eaz4Weiv/c232Ys36NtVkw2ccXCm0FeSC2tA
         A6z67togJUN0S544iygxXxdPLPbpmq5jXWHQxDWiV0ufOtEtbgmq78we+J494D2mFT
         B6By0iMWqaLjw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/29] modpost: remove mod->is_dot_o struct member
Date:   Mon, 25 May 2020 00:42:28 +0900
Message-Id: <20200524154235.380482-23-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Previously, there were two cases where mod->is_dot_o is unset:

[1] the executable 'vmlinux' in the second pass of modpost
[2] modules loaded by read_dump()

I think [1] was intended usage to distinguish 'vmlinux.o' and 'vmlinux'.
Now that modpost does not parse the executable 'vmlinux', this case
does not happen.

[2] is obscure, maybe a bug. Module.symver stores module paths without
extension. So, none of modules loaded by read_dump() has the .o suffix,
and new_module() unsets ->is_dot_o. Anyway, it is not a big deal because
handle_symbol() is not called for the case.

To sum up, all the parsed ELF files are .o files.

mod->is_dot_o is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 14 ++------------
 scripts/mod/modpost.h |  1 -
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 7a108bec933b..94404374262a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -181,10 +181,8 @@ static struct module *new_module(const char *modname)
 	p = NOFAIL(strdup(modname));
 
 	/* strip trailing .o */
-	if (strends(p, ".o")) {
+	if (strends(p, ".o"))
 		p[strlen(p) - 2] = '\0';
-		mod->is_dot_o = 1;
-	}
 
 	/* add to list */
 	mod->name = p;
@@ -712,8 +710,7 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 	enum export export;
 	const char *name;
 
-	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
-	    strstarts(symname, "__ksymtab"))
+	if (strstarts(symname, "__ksymtab"))
 		export = export_from_secname(info, get_secindex(info, sym));
 	else
 		export = export_from_sec(info, get_secindex(info, sym));
@@ -2671,13 +2668,6 @@ int main(int argc, char **argv)
 		struct symbol *s;
 
 		for (s = symbolhash[n]; s; s = s->next) {
-			/*
-			 * Do not check "vmlinux". This avoids the same warnings
-			 * shown twice, and false-positives for ARCH=um.
-			 */
-			if (is_vmlinux(s->module->name) && !s->module->is_dot_o)
-				continue;
-
 			if (s->is_static)
 				warn("\"%s\" [%s] is a static %s\n",
 				     s->name, s->module->name,
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index aaf3c4ad5d60..554f02c69ac2 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -126,7 +126,6 @@ struct module {
 	int has_cleanup;
 	struct buffer dev_table_buf;
 	char	     srcversion[25];
-	int is_dot_o;
 	// Missing namespace dependencies
 	struct namespace_list *missing_namespaces;
 	// Actual imported namespaces
-- 
2.25.1

