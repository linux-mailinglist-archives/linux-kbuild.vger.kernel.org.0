Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F5B35B030
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 21:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbhDJTqf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 15:46:35 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41637 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbhDJTqf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 15:46:35 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13AJjaXX021927;
        Sun, 11 Apr 2021 04:45:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13AJjaXX021927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618083938;
        bh=LtpjWPHC/wp9j7MS1xJIOMHOVhQKDmIoGOiTpHtp22s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0CF/Lv/xrmZb8NbwJop8zu71I3G1ngq0LbcH1m0S9bF+jhJz41kDlIQcvyfGG7GWU
         SZhAHoysgwhfF+RnccQEbLjsqvo1gZaFCqyhBye6NfEZpks6SvBT+lKiwPMe/5Brhz
         hUP1GZMsQZ8XRqQo6z4HjTC9imXVDxAuEo89yM7PlpvVMoLIKcG8wuuQKU6vDFvRIm
         W997hfhfO4SvhsPZNNBDKq7mV8nm3xuzlW/qK48zug6OxBDB/aoOI6SqA2oyb4dPme
         SDpXlSVgzDEifIr55aLlO3iBu6HsoZdv/kBAZbqbPr4gIeshWMzdoATRmnmJ49oi5O
         fExL+erG4eH4w==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] kconfig: nconf: get rid of (void) casts from wattrset() calls
Date:   Sun, 11 Apr 2021 04:45:32 +0900
Message-Id: <20210410194534.187588-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210410194534.187588-1-masahiroy@kernel.org>
References: <20210410194534.187588-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 10175ba65fde ("nconfig: Silence unused return values
from wattrset").

With recent GCC versions used, I no longer see "value computed is not
used" warnings even without the (void) casts.

The wattrset() used to be a macro like this:

  #define wattrset(win,at) \
          (NCURSES_OK_ADDR(win) \
            ? ((win)->_attrs = NCURSES_CAST(attr_t, at), \
               OK) \
            : ERR)

The GCC bugzilla [1] reported a false-positive -Wunused-value warning
in a similar test case. It was fixed by GCC 4.4.1.

Let's revert that commit, and see if somebody will claim the issue.

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=39889

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/nconf.c     | 14 +++++++-------
 scripts/kconfig/nconf.gui.c | 20 ++++++++++----------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 232eb3011efe..daeeb5f81445 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -370,18 +370,18 @@ static void print_function_line(void)
 	int lines = getmaxy(stdscr);
 
 	for (i = 0; i < function_keys_num; i++) {
-		(void) wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
+		wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
 		mvwprintw(main_window, lines-3, offset,
 				"%s",
 				function_keys[i].key_str);
-		(void) wattrset(main_window, attributes[FUNCTION_TEXT]);
+		wattrset(main_window, attributes[FUNCTION_TEXT]);
 		offset += strlen(function_keys[i].key_str);
 		mvwprintw(main_window, lines-3,
 				offset, "%s",
 				function_keys[i].func);
 		offset += strlen(function_keys[i].func) + skip;
 	}
-	(void) wattrset(main_window, attributes[NORMAL]);
+	wattrset(main_window, attributes[NORMAL]);
 }
 
 /* help */
@@ -956,16 +956,16 @@ static void show_menu(const char *prompt, const char *instructions,
 	current_instructions = instructions;
 
 	clear();
-	(void) wattrset(main_window, attributes[NORMAL]);
+	wattrset(main_window, attributes[NORMAL]);
 	print_in_middle(stdscr, 1, 0, getmaxx(stdscr),
 			menu_backtitle,
 			attributes[MAIN_HEADING]);
 
-	(void) wattrset(main_window, attributes[MAIN_MENU_BOX]);
+	wattrset(main_window, attributes[MAIN_MENU_BOX]);
 	box(main_window, 0, 0);
-	(void) wattrset(main_window, attributes[MAIN_MENU_HEADING]);
+	wattrset(main_window, attributes[MAIN_MENU_HEADING]);
 	mvwprintw(main_window, 0, 3, " %s ", prompt);
-	(void) wattrset(main_window, attributes[NORMAL]);
+	wattrset(main_window, attributes[NORMAL]);
 
 	set_menu_items(curses_menu, curses_menu_items);
 
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index a914f81092d7..180d3158d380 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -167,7 +167,7 @@ void print_in_middle(WINDOW *win,
 	length = strlen(string);
 	temp = (width - length) / 2;
 	x = startx + (int)temp;
-	(void) wattrset(win, color);
+	wattrset(win, color);
 	mvwprintw(win, y, x, "%s", string);
 	refresh();
 }
@@ -297,11 +297,11 @@ int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
 	set_menu_fore(menu, attributes[DIALOG_MENU_FORE]);
 	set_menu_back(menu, attributes[DIALOG_MENU_BACK]);
 
-	(void) wattrset(win, attributes[DIALOG_BOX]);
+	wattrset(win, attributes[DIALOG_BOX]);
 	box(win, 0, 0);
 
 	/* print message */
-	(void) wattrset(msg_win, attributes[DIALOG_TEXT]);
+	wattrset(msg_win, attributes[DIALOG_TEXT]);
 	fill_window(msg_win, msg);
 
 	set_menu_win(menu, win);
@@ -405,16 +405,16 @@ int dialog_inputbox(WINDOW *main_window,
 	form_win = derwin(win, 1, prompt_width, prompt_lines+3, 2);
 	keypad(form_win, TRUE);
 
-	(void) wattrset(form_win, attributes[INPUT_FIELD]);
+	wattrset(form_win, attributes[INPUT_FIELD]);
 
-	(void) wattrset(win, attributes[INPUT_BOX]);
+	wattrset(win, attributes[INPUT_BOX]);
 	box(win, 0, 0);
-	(void) wattrset(win, attributes[INPUT_HEADING]);
+	wattrset(win, attributes[INPUT_HEADING]);
 	if (title)
 		mvwprintw(win, 0, 3, "%s", title);
 
 	/* print message */
-	(void) wattrset(prompt_win, attributes[INPUT_TEXT]);
+	wattrset(prompt_win, attributes[INPUT_TEXT]);
 	fill_window(prompt_win, prompt);
 
 	mvwprintw(form_win, 0, 0, "%*s", prompt_width, " ");
@@ -576,7 +576,7 @@ void show_scroll_win(WINDOW *main_window,
 
 	/* create the pad */
 	pad = newpad(total_lines+10, total_cols+10);
-	(void) wattrset(pad, attributes[SCROLLWIN_TEXT]);
+	wattrset(pad, attributes[SCROLLWIN_TEXT]);
 	fill_window(pad, text);
 
 	win_lines = min(total_lines+4, lines-2);
@@ -591,9 +591,9 @@ void show_scroll_win(WINDOW *main_window,
 	win = newwin(win_lines, win_cols, y, x);
 	keypad(win, TRUE);
 	/* show the help in the help window, and show the help panel */
-	(void) wattrset(win, attributes[SCROLLWIN_BOX]);
+	wattrset(win, attributes[SCROLLWIN_BOX]);
 	box(win, 0, 0);
-	(void) wattrset(win, attributes[SCROLLWIN_HEADING]);
+	wattrset(win, attributes[SCROLLWIN_HEADING]);
 	mvwprintw(win, 0, 3, " %s ", title);
 	panel = new_panel(win);
 
-- 
2.27.0

