Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3691D6703
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgEQJuA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:00 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38325 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LM018560;
        Sun, 17 May 2020 18:49:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LM018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708960;
        bh=niCXP4hsFSz1dax+0Qo5Bdaqc9rQ7pMZAEAIZP/zoac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XrOTALJJXXNAjCUMmY6IBx0vQuAxdLdI9bwJZJyULr18mu/6sC66RGrBwPkkuFco+
         98pbAwLMYO9rUPH5YrMMJysRBaYcjgNx93VMoVricRl2uyBDw8skzwT8xenWqtwhlV
         bmtbLTyn5xR1/A8HrmxwuJ8bUofUaQIUguz9nb7uQ0HMSSY4BIc+djANcVm1VrvXCB
         warEaUUaOO+eOi4Kftnvk5K2EYEsWfwyWxy67GtyuRtgUbBsRaGzBZ2iqGRzX2e/Ai
         UZE9jFMqpX918sZcCzWeSO/jEDiKWQllpN/+AHR00pcT21GBO/yv+5rQKK/TtTsti3
         OuH2xrREJr6NQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 25/29] modpost: remove mod->skip struct member
Date:   Sun, 17 May 2020 18:48:55 +0900
Message-Id: <20200517094859.2376211-26-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The meaning of 'skip' is obscure since it does not explain
"what to skip".

mod->skip is set when it is vmlinux or the module info came from
a dump file.

So, mod->skip is equivalent to (mod->is_vmlinux || mod->from_dump).

For the check in write_namespace_deps_files(), mod->is_vmlinux is
unneeded because the -d option is not passed in the first pass of
modpost.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 9 +++------
 scripts/mod/modpost.h | 1 -
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0df0fc82412d..003b6fb2303c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2002,10 +2002,8 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (mod->is_vmlinux) {
+	if (mod->is_vmlinux)
 		have_vmlinux = 1;
-		mod->skip = 1;
-	}
 
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
@@ -2456,7 +2454,6 @@ static void read_dump(const char *fname)
 			mod = new_module(modname);
 			if (mod->is_vmlinux)
 				have_vmlinux = 1;
-			mod->skip = 1;
 			mod->from_dump = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
@@ -2517,7 +2514,7 @@ static void write_namespace_deps_files(const char *fname)
 
 	for (mod = modules; mod; mod = mod->next) {
 
-		if (mod->skip || !mod->missing_namespaces)
+		if (mod->from_dump || !mod->missing_namespaces)
 			continue;
 
 		buf_printf(&ns_deps_buf, "%s.ko:", mod->name);
@@ -2622,7 +2619,7 @@ int main(int argc, char **argv)
 	for (mod = modules; mod; mod = mod->next) {
 		char fname[PATH_MAX];
 
-		if (mod->skip)
+		if (mod->is_vmlinux || mod->from_dump)
 			continue;
 
 		buf.pos = 0;
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index ec717ab20b98..264c0c51defa 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -122,7 +122,6 @@ struct module {
 	int from_dump;  /* 1 if module was loaded from *.symver */
 	int is_vmlinux;
 	int seen;
-	int skip;
 	int has_init;
 	int has_cleanup;
 	struct buffer dev_table_buf;
-- 
2.25.1

