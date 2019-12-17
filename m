Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9034A122302
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbfLQEPE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:15:04 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49412 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbfLQEOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:51 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBH4EPAG024524;
        Tue, 17 Dec 2019 13:14:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBH4EPAG024524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556069;
        bh=I67uXDjGaUh0GQqIQ3B+sRnn8ctM5KQ8N6d9zWDGUEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ng8QnyW7WTYrO6sR793fOPukcs1rsjmxFxBXAJO+khfo6lZ1BNyBPo7nTCPR2eL+x
         bxrCL/Y1gWpcnXWKyJ39btUSgB8mEc28tL8lvHFCiKlk/fyEp1VnH65jtLS8ueHVZH
         MCPxRp16B7cVHdxNZOVorQ18cUOaj4cnIYwwgNOb4d4hR4i2l3S0U7KOCh6P2l51j4
         chD2pWt/nS1L3IcJTWMdLxsKhmJjnS79J8vszZPMAq9g6137d3OswZxJ400LHqkeld
         9PSuqO8fBtRerqHTAfoyZQKz1A7/LBk+1aMUpo2RLbKdysbgFuzEaNC5YRkbMnWQzw
         jdkXzXIUng/Bg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] kconfig: remove 'prompt' argument from menu_add_prop()
Date:   Tue, 17 Dec 2019 13:14:21 +0900
Message-Id: <20191217041424.29285-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This function does not use the 'prompt' argument.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 45daece8d983..5a43784ded2c 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -124,7 +124,8 @@ void menu_set_type(int type)
 		sym_type_name(sym->type), sym_type_name(type));
 }
 
-static struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
+static struct property *menu_add_prop(enum prop_type type, struct expr *expr,
+				      struct expr *dep)
 {
 	struct property *prop = prop_alloc(type, current_entry->sym);
 
@@ -138,7 +139,7 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 struct property *menu_add_prompt(enum prop_type type, char *prompt,
 				 struct expr *dep)
 {
-	struct property *prop = menu_add_prop(type, prompt, NULL, dep);
+	struct property *prop = menu_add_prop(type, NULL, dep);
 
 	if (isspace(*prompt)) {
 		prop_warn(prop, "leading whitespace ignored");
@@ -185,12 +186,12 @@ void menu_add_visibility(struct expr *expr)
 
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep)
 {
-	menu_add_prop(type, NULL, expr, dep);
+	menu_add_prop(type, expr, dep);
 }
 
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
 {
-	menu_add_prop(type, NULL, expr_alloc_symbol(sym), dep);
+	menu_add_prop(type, expr_alloc_symbol(sym), dep);
 }
 
 void menu_add_option_modules(void)
-- 
2.17.1

