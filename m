Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C44AC995D
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 09:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbfJCH7W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 03:59:22 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:59228 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbfJCH7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:17 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x937wTkU007720;
        Thu, 3 Oct 2019 16:58:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x937wTkU007720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570089511;
        bh=2WkGrobjA1U1dn5ejZfaJgOsN0toyJldJb1G+H1ogM0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l10tqUHYyIrYc2z8CdUvQAEG+svgnd1dFQ0zv1xeEnjonanZ1TvjAwwVrxl/n3Sw8
         5+fGNijQgu7Pu2eIW6tq52e7E+qs1dAZRxWNaYZD6AsYhwL0PB0d/tpXQ3BchFJhMI
         Snrpr7INlZSTiiBZQZi8JjM0620QSqpsYUi7d7SslcERl5MALc7JwOJ0JDDhZZsx0O
         2Uz4uk6GB5SgOAjtEPXxehTKa4uBxMHf52qM2i04OfxMpBjpdzKD8CsG0YeDsum48X
         UpKnEWtSmAY+nxiZyeLBaGGAgqcVEYs31SRi9CfhBIRY1NzRtq959EQty+n7HP/ZOv
         10uEwBTDMyFpQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shaun Ruffell <sruffell@sruffell.net>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] modpost: fix broken sym->namespace for external module builds
Date:   Thu,  3 Oct 2019 16:58:22 +0900
Message-Id: <20191003075826.7478-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003075826.7478-1-yamada.masahiro@socionext.com>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, external module builds produce tons of false-positives:

  WARNING: module <mod> uses symbol <sym> from namespace <ns>, but does not import it.

Here, the <ns> part shows a random string.

When you build external modules, the symbol info of vmlinux and
in-kernel modules are read from $(objtree)/Module.symvers, but
read_dump() is buggy in multiple ways:

[1] When the modpost is run for vmlinux and in-kernel modules,
sym_extract_namespace() allocates memory for the namespace. On the
other hand, read_dump() does not, then sym->namespace will point to
somewhere in the line buffer of get_next_line(). The data in the
buffer will be replaced soon, and sym->namespace will end up with
pointing to unrelated data. As a result, check_exports() will show
random strings in the warning messages.

[2] When there is no namespace, sym_extract_namespace() returns NULL.
On the other hand, read_dump() sets namespace to an empty string "".
(but, it will be later replaced with unrelated data due to bug [1].)
The check_exports() shows a warning unless exp->namespace is NULL,
so every symbol read from read_dump() emits the warning, which is
mostly false positive.

To address [1], sym_add_exported() calls strdup() for s->namespace.
The namespace from sym_extract_namespace() must be freed to avoid
memory leak.

For [2], I changed the if-conditional in check_exports().

This commit also fixes sym_add_exported() to set s->namespace correctly
when the symbol is preloaded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
---

Changes in v2:
  - Change the approach to deal with ->preloaded

 scripts/mod/modpost.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 2c644086c412..936d3ad23c83 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -166,7 +166,7 @@ struct symbol {
 	struct module *module;
 	unsigned int crc;
 	int crc_valid;
-	const char *namespace;
+	char *namespace;
 	unsigned int weak:1;
 	unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
 	unsigned int kernel:1;     /* 1 if symbol is from kernel
@@ -348,7 +348,7 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 		return export_unknown;
 }
 
-static const char *sym_extract_namespace(const char **symname)
+static char *sym_extract_namespace(const char **symname)
 {
 	char *namespace = NULL;
 	char *ns_separator;
@@ -373,7 +373,6 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
 
 	if (!s) {
 		s = new_symbol(name, mod, export);
-		s->namespace = namespace;
 	} else {
 		if (!s->preloaded) {
 			warn("%s: '%s' exported twice. Previous export was in %s%s\n",
@@ -384,6 +383,8 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
 			s->module = mod;
 		}
 	}
+	free(s->namespace);
+	s->namespace = namespace ? strdup(namespace) : NULL;
 	s->preloaded = 0;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
@@ -670,7 +671,8 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 	unsigned int crc;
 	enum export export;
 	bool is_crc = false;
-	const char *name, *namespace;
+	const char *name;
+	char *namespace;
 
 	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
 	    strstarts(symname, "__ksymtab"))
@@ -745,6 +747,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 			name = symname + strlen("__ksymtab_");
 			namespace = sym_extract_namespace(&name);
 			sym_add_exported(name, namespace, mod, export);
+			free(namespace);
 		}
 		if (strcmp(symname, "init_module") == 0)
 			mod->has_init = 1;
@@ -2193,7 +2196,7 @@ static int check_exports(struct module *mod)
 		else
 			basename = mod->name;
 
-		if (exp->namespace) {
+		if (exp->namespace && exp->namespace[0]) {
 			add_namespace(&mod->required_namespaces,
 				      exp->namespace);
 
-- 
2.17.1

