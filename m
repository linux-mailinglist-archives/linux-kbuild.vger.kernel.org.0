Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F282A1D6705
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgEQJuA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:00 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38340 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LL018560;
        Sun, 17 May 2020 18:49:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LL018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708960;
        bh=+Ps6TRq8xODSNqD/psT6gHTGOvLLt38km45fSAJiiCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CrSJNg+MszysK2CgTvk+Y6Il0lLBME72WkYGlKcKkeQ9KqhoF2nQVRz8mZZcWS1Df
         wSVuXKHNe+P7AetP6k7QjR8+zqDOt+FPvLMNr4hcg0r+dT6RYYcLWfpQN8teFD35fO
         A1iFEOq1XoJAsJHiuk8KW5oW63b85AHeJBBfwI5xNOv7H9ZOmxs6LnXwHdYWOVCyE9
         wak8Mp58THpLhwJaKGfHXwawoYii/W/pYai+z1ryqVeDtxRX2kYL0PYTbdVb4qPxcX
         uYYm//sc1VBDcy2WHfASU23hecxlxoefzB6pUwE7A29F8IaZyCHctToO1+C5zF/z5m
         M8/X8AqqL3b4A==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 24/29] modpost: add mod->is_vmlinux struct member
Date:   Sun, 17 May 2020 18:48:54 +0900
Message-Id: <20200517094859.2376211-25-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

is_vmlinux() is called in several places to check whether the current
module is vmlinux or not.

It is faster and clearer to check mod->is_vmlinux flag.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 19 ++++++++++---------
 scripts/mod/modpost.h |  1 +
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4155669a92bd..0df0fc82412d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -176,6 +176,7 @@ static struct module *new_module(const char *modname)
 
 	/* add to list */
 	mod->name = p;
+	mod->is_vmlinux = is_vmlinux(modname);
 	mod->gpl_compatible = -1;
 	mod->next = modules;
 	modules = mod;
@@ -417,11 +418,11 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 
 	if (!s) {
 		s = new_symbol(name, mod, export);
-	} else if (!external_module || is_vmlinux(s->module->name) ||
+	} else if (!external_module || s->module->is_vmlinux ||
 		   s->module == mod) {
 		warn("%s: '%s' exported twice. Previous export was in %s%s\n",
 		     mod->name, name, s->module->name,
-		     is_vmlinux(s->module->name) ? "" : ".ko");
+		     s->module->is_vmlinux ? "" : ".ko");
 		return s;
 	}
 
@@ -678,7 +679,7 @@ static void handle_modversion(const struct module *mod,
 
 	if (sym->st_shndx == SHN_UNDEF) {
 		warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
-		     symname, mod->name, is_vmlinux(mod->name) ? "":".ko");
+		     symname, mod->name, mod->is_vmlinux ? "" : ".ko");
 		return;
 	}
 
@@ -2001,12 +2002,12 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (is_vmlinux(modname)) {
+	if (mod->is_vmlinux) {
 		have_vmlinux = 1;
 		mod->skip = 1;
 	}
 
-	if (!is_vmlinux(modname)) {
+	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
 		if (!license)
 			warn("missing MODULE_LICENSE() in %s\n", modname);
@@ -2065,7 +2066,7 @@ static void read_symbols(const char *modname)
 
 	check_sec_ref(mod, modname, &info);
 
-	if (!is_vmlinux(modname)) {
+	if (!mod->is_vmlinux) {
 		version = get_modinfo(&info, "version");
 		if (version || all_versions)
 			get_src_version(modname, mod->srcversion,
@@ -2335,7 +2336,7 @@ static void add_depends(struct buffer *b, struct module *mod)
 	/* Clear ->seen flag of modules that own symbols needed by this. */
 	for (s = mod->unres; s; s = s->next)
 		if (s->module)
-			s->module->seen = is_vmlinux(s->module->name);
+			s->module->seen = s->module->is_vmlinux;
 
 	buf_printf(b, "\n");
 	buf_printf(b, "MODULE_INFO(depends, \"");
@@ -2452,9 +2453,9 @@ static void read_dump(const char *fname)
 			goto fail;
 		mod = find_module(modname);
 		if (!mod) {
-			if (is_vmlinux(modname))
-				have_vmlinux = 1;
 			mod = new_module(modname);
+			if (mod->is_vmlinux)
+				have_vmlinux = 1;
 			mod->skip = 1;
 			mod->from_dump = 1;
 		}
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 554f02c69ac2..ec717ab20b98 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -120,6 +120,7 @@ struct module {
 	int gpl_compatible;
 	struct symbol *unres;
 	int from_dump;  /* 1 if module was loaded from *.symver */
+	int is_vmlinux;
 	int seen;
 	int skip;
 	int has_init;
-- 
2.25.1

