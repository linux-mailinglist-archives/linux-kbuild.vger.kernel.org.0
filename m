Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FD61E9DC0
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgFAF61 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:27 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40030 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgFAF6W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:22 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaM9023694;
        Mon, 1 Jun 2020 14:57:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaM9023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991069;
        bh=B5XoUr3+P9jJDKs/v6Pdcf+6nsJRfynUwhGv5nMnhqM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Smh5tCU70zQa5NW2HdMyzuqrN5GUd2vdAOfGo2Qv/jYsW/H2eUURbwXrOSzZO2RkL
         /hLJGHjrzxIPp1oCCY82isT1luQz/4XG6WRUokDmpFzEan3FNmzfyGRLdhD/u+1Gke
         qBdk+Co9qz06WV0yJ9OvCC0qMWf4xP/W5wgVLXBFC5GHVGsrrAGRZPP5WoBt1EBOsI
         Amr7aSg7jHeKfNbyh9l4POuSwt93xjDHDZSggwxm3PWUdKhMQIgh/1d0pUHSe4o5cz
         9/vMOS2jn9e0iHXIlApXHaCjh60X27cTLd7nKp8dXBlBXqwHg8WqE8lxNkceI2Z1VF
         kb0Wtf+jUA/2A==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 30/37] modpost: remove mod->is_dot_o struct member
Date:   Mon,  1 Jun 2020 14:57:24 +0900
Message-Id: <20200601055731.3006266-30-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
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

 scripts/mod/modpost.c | 14 ++------------
 scripts/mod/modpost.h |  1 -
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b667f531a645..bc00bbac50bb 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -182,10 +182,8 @@ static struct module *new_module(const char *modname)
 	p = NOFAIL(strdup(modname));
 
 	/* strip trailing .o */
-	if (strends(p, ".o")) {
+	if (strends(p, ".o"))
 		p[strlen(p) - 2] = '\0';
-		mod->is_dot_o = 1;
-	}
 
 	/* add to list */
 	mod->name = p;
@@ -716,8 +714,7 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 	enum export export;
 	const char *name;
 
-	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
-	    strstarts(symname, "__ksymtab"))
+	if (strstarts(symname, "__ksymtab"))
 		export = export_from_secname(info, get_secindex(info, sym));
 	else
 		export = export_from_sec(info, get_secindex(info, sym));
@@ -2676,13 +2673,6 @@ int main(int argc, char **argv)
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

