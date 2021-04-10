Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15FE35B031
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 21:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbhDJTqg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 15:46:36 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41642 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbhDJTqf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 15:46:35 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13AJjaXY021927;
        Sun, 11 Apr 2021 04:45:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13AJjaXY021927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618083938;
        bh=Qt7LyLpNoISWl7ZC6n0LZqu5kpLDaY4Kj/tKRSYcXyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qiJUecsQzNe7V4RXZ+GE9XinwffhDPn4yzF6o30UBJjtTMh+vwcMrSCwgQL9sGo1p
         B2rgdyid68eWw9n9V+OonClKaeobiRU+TUIkfKbYfhQXyDwUQ2yrXKPeCFBETsJz6L
         9CtdWEL57JpeTRn02pwVaQldi4g1aRpsepbdZFNxGLh+I3YtiSbpsuUjmuaWiXKNbw
         2lfpWuOKWQnEedqDomufDcpmIz+VSCVR9s4xAi06vvzuerTlfUZBU3eLU4Fs2u5GEG
         Q3hU98gPSar20Mlj7W2yNIqecWEWcyKn3L6XAJX2s2j+pH5Bi+tAGnPvb0MGgVS933
         m5igqX2cwdu+w==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] kconfig: nconf: remove unneeded default for menu prompt
Date:   Sun, 11 Apr 2021 04:45:33 +0900
Message-Id: <20210410194534.187588-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210410194534.187588-1-masahiroy@kernel.org>
References: <20210410194534.187588-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The rootmenu always has a prompt even if the 'mainmenu' statement is
missing in the top Kconfig file.

conf_parse() calls menu_add_prompt(P_MENU, "Main menu", NULL) in this
case.

So, every 'menu' has a prompt.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/nconf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index daeeb5f81445..b6fe7b18a103 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1068,7 +1068,6 @@ static int do_match(int key, struct match_state *state, int *ans)
 static void conf(struct menu *menu)
 {
 	struct menu *submenu = NULL;
-	const char *prompt = menu_get_prompt(menu);
 	struct symbol *sym;
 	int res;
 	int current_index = 0;
@@ -1086,9 +1085,8 @@ static void conf(struct menu *menu)
 		if (!child_count)
 			break;
 
-		show_menu(prompt ? prompt : "Main Menu",
-				menu_instructions,
-				current_index, &last_top_row);
+		show_menu(menu_get_prompt(menu), menu_instructions,
+			  current_index, &last_top_row);
 		keypad((menu_win(curses_menu)), TRUE);
 		while (!global_exit) {
 			if (match_state.in_search) {
-- 
2.27.0

