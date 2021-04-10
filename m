Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E2335AB84
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 08:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhDJGxt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 02:53:49 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:49669 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhDJGxo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 02:53:44 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 13A6qqTG016685;
        Sat, 10 Apr 2021 15:52:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 13A6qqTG016685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618037572;
        bh=bqSH+kBjqUDjPdb9dMMH1DF3XIOuTFGd2X6YyIG1ajI=;
        h=From:To:Cc:Subject:Date:From;
        b=gPbmLqGNygnAEa9BHDdsPxX5bwUHP3fzovmh6jRpyjzOkMqvqC8Sax5TT7tUVmBRf
         b0b7zZMA1MKDhUBzPMHtITXqdfvpRTq/+sD5RcVJYhRMhQWYvBNM6fcUcv3/kkQLU0
         5t4+0wp/G9ZtQ6EFDCPhyqnphLYzV5iAyeMzmeM7YxQzzLzHflA/l2ye1nCKRKdnyT
         Vi5cuB5+l6oQ6iCMYKI6TvMm5VoVPr4hsowCaaO8dgrbzLZveNXjR4nOgMZxX3FgUz
         zososQtn18+zlg688HPbWdHXO+V9bAaQp/ktehW8T9ZRnPjRqrzmU6A2VDrjCYfvqI
         N0DltSEsh/UOw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: nconf: fix core dump when searching in empty menu
Date:   Sat, 10 Apr 2021 15:52:46 +0900
Message-Id: <20210410065246.139831-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The following code in get_mext_match():

  index = (index + items_num) % items_num;

... makes the program crash when items_num is zero (that is, the menu
is empty).

A menu can be empty when all the options in it are hidden by unmet
'depends on'.

For example,

  menu "This menu will be empty"

  config FOO
         bool "foo"
         depends on BROKEN

  endmenu

If you visit this menu and press a '/' key and then another key, nconf
crashes with:

  Floating point exception (core dumped)

When the number of items is zero, it does not make sense to search in
the menu. In this case, current_item() returns NULL, and item_index()
ERR, but the current get_mext_match() does not check any error.

Let's make it just return if items_num is zero, and also check the
return value from item_index() just in case.

Change items_num from 'int' to 'unsigned int' because it should never
become negative.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/nconf.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 42d63d7b0c52..7d2ab2944d81 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -282,7 +282,7 @@ static int mwin_max_cols;
 static MENU *curses_menu;
 static ITEM *curses_menu_items[MAX_MENU_ITEMS];
 static struct mitem k_menu_items[MAX_MENU_ITEMS];
-static int items_num;
+static unsigned int items_num;
 static int global_exit;
 /* the currently selected button */
 static const char *current_instructions = menu_instructions;
@@ -510,8 +510,14 @@ typedef enum {MATCH_TINKER_PATTERN_UP, MATCH_TINKER_PATTERN_DOWN,
 /* return the index of the matched item, or -1 if no such item exists */
 static int get_mext_match(const char *match_str, match_f flag)
 {
-	int match_start = item_index(current_item(curses_menu));
-	int index;
+	int match_start, index;
+
+	if (items_num == 0)
+		return -1;
+
+	match_start = item_index(current_item(curses_menu));
+	if (match_start == ERR)
+		return -1;
 
 	if (flag == FIND_NEXT_MATCH_DOWN)
 		++match_start;
-- 
2.27.0

