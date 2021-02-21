Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3117332095E
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 10:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhBUJ1b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 04:27:31 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:20001 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhBUJ13 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 04:27:29 -0500
Received: from grover.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 11L9QV7T030995;
        Sun, 21 Feb 2021 18:26:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 11L9QV7T030995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613899592;
        bh=b5KnGSZuEM3ZdO/lVmc+ZDEiz8vwxufFyAyyKS7/gFY=;
        h=From:To:Cc:Subject:Date:From;
        b=OWYp43q0B+ETpvwsDn6g3/FwUapJlocvJ5c9fIMghwzNNcwnAljTVg2IGVgjtws3L
         a4TmEAevpav+/mJ2Chq39Wvw4nqmZtTOWMeQUzGZ149gpWXbzPZ/vuXpBZk0dmqhnE
         fTD6qG0xeym0px5yJqq4SbZUvLvgvdwHxkt0H36sDaw2PvpEwQbBNxThovVoUvKqwx
         eGvFjrIV9XLyPUg9CATH5rR6T/Vo+xqgQ64wC5ILv7WltOTUa+bBhLyvavi235DqIk
         ZdExIZK8ap3ZCWcrZlsY9bHSXjyFw6pdH7h/W22OIb+n4S2BUuESb89v+Gb8UfJJyP
         CsWUNOqwIlxnw==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kconfig: clean up nested if-conditionals in check_conf()
Date:   Sun, 21 Feb 2021 18:26:22 +0900
Message-Id: <20210221092623.133572-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Unify the outer two if-conditionals into one. This decreases the
indent level by one.

Also, change the if-else blocks:

    if (input_mode == listnewconfig) {
            ...
    } else if (input_mode == helpnewconfig) {
            ...
    } else {
            ...
    }

into the switch statement.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 55 ++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 18a233d27a8d..369615d6c97e 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -419,34 +419,37 @@ static void check_conf(struct menu *menu)
 		return;
 
 	sym = menu->sym;
-	if (sym && !sym_has_value(sym)) {
-		if (sym_is_changeable(sym) ||
-		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
-			if (input_mode == listnewconfig) {
-				if (sym->name) {
-					const char *str;
-
-					if (sym->type == S_STRING) {
-						str = sym_get_string_value(sym);
-						str = sym_escape_string_value(str);
-						printf("%s%s=%s\n", CONFIG_, sym->name, str);
-						free((void *)str);
-					} else {
-						str = sym_get_string_value(sym);
-						printf("%s%s=%s\n", CONFIG_, sym->name, str);
-					}
-				}
-			} else if (input_mode == helpnewconfig) {
-				printf("-----\n");
-				print_help(menu);
-				printf("-----\n");
+	if (sym && !sym_has_value(sym) &&
+	    (sym_is_changeable(sym) ||
+	     (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes))) {
 
-			} else {
-				if (!conf_cnt++)
-					printf("*\n* Restart config...\n*\n");
-				rootEntry = menu_get_parent_menu(menu);
-				conf(rootEntry);
+		switch (input_mode) {
+		case listnewconfig:
+			if (sym->name) {
+				const char *str;
+
+				if (sym->type == S_STRING) {
+					str = sym_get_string_value(sym);
+					str = sym_escape_string_value(str);
+					printf("%s%s=%s\n", CONFIG_, sym->name, str);
+					free((void *)str);
+				} else {
+					str = sym_get_string_value(sym);
+					printf("%s%s=%s\n", CONFIG_, sym->name, str);
+				}
 			}
+			break;
+		case helpnewconfig:
+			printf("-----\n");
+			print_help(menu);
+			printf("-----\n");
+			break;
+		default:
+			if (!conf_cnt++)
+				printf("*\n* Restart config...\n*\n");
+			rootEntry = menu_get_parent_menu(menu);
+			conf(rootEntry);
+			break;
 		}
 	}
 
-- 
2.27.0

