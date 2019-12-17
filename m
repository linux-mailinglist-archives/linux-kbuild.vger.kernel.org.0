Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A531222FF
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbfLQEO5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:14:57 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49418 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbfLQEOw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:52 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBH4EPAH024524;
        Tue, 17 Dec 2019 13:14:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBH4EPAH024524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556071;
        bh=a17nZoX2gmVNQ4RyqbzSYYjo3e0s9uhnamYb1ruGEGA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1LiE6IMaPP9ehZN+dvlxyyzzzJmXkTuhpeWon0y25ZSwbnNsqbneQRAE0XVEzQ8s7
         RmoUTBQou3XprADyX27eyReBJaF9Yoma+Sv8y429iOz/XsuNdaEZ+wsVp3kApgcCgO
         m/YPQSX/BB1ILaoaua57eca0GlZHtO8OuH6at2GMNrkKRmLAOIJ71c+4XgnjqLFQWI
         HI+JahCUfcHFwd2QDclWkpQdc+gOSJLNHzCoL//NGZXcLWrCIVfR0J4g1ogBRjaI75
         2IHa403kHzvsgoQ7cpJA9jLZYgJjmY1WTeUhDXyGRfcIq0WOtwUEGtuw5wrXe8kzLi
         am8EiHbpkDV5g==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] kconfig: remove sym from struct property
Date:   Tue, 17 Dec 2019 13:14:22 +0900
Message-Id: <20191217041424.29285-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

struct property can reference to the symbol that it is associated with
by prop->menu->sym.

Fix up the one usage of prop->sym, and remove sym from struct property.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.h   | 1 -
 scripts/kconfig/parser.y | 2 +-
 scripts/kconfig/symbol.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 017843c9a4f4..6e102a3b8bd5 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -191,7 +191,6 @@ enum prop_type {
 
 struct property {
 	struct property *next;     /* next property - null if last */
-	struct symbol *sym;        /* the symbol for which the property is associated */
 	enum prop_type type;       /* type of property */
 	const char *text;          /* the prompt value - P_PROMPT, P_MENU, P_COMMENT */
 	struct expr_value visible;
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 40e46996e6a5..d5c41a5c370c 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -671,7 +671,7 @@ static void print_symbol(FILE *out, struct menu *menu)
 			break;
 		case P_SYMBOL:
 			fputs( "  symbol ", out);
-			fprintf(out, "%s\n", prop->sym->name);
+			fprintf(out, "%s\n", prop->menu->sym->name);
 			break;
 		default:
 			fprintf(out, "  unknown prop %d!\n", prop->type);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index f56eec5ea4c7..dbc5365d8bbc 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1281,7 +1281,6 @@ struct property *prop_alloc(enum prop_type type, struct symbol *sym)
 	prop = xmalloc(sizeof(*prop));
 	memset(prop, 0, sizeof(*prop));
 	prop->type = type;
-	prop->sym = sym;
 	prop->file = current_file;
 	prop->lineno = zconf_lineno();
 
-- 
2.17.1

