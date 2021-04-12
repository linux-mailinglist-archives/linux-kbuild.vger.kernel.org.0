Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEDB35B7EA
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Apr 2021 03:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236272AbhDLBNO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 21:13:14 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:54771 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236086AbhDLBNO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 21:13:14 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 13C1CVIA003364;
        Mon, 12 Apr 2021 10:12:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 13C1CVIA003364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618189953;
        bh=vk9UETXPqAUver51GatKKJoPPeDquM+kPZJ3g9fTBss=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G35B4iEGhhnndX1X25JFG2BU+r/ca/oPTypv4kYMzE7IM9nur9pmvgg45dN/iCyFZ
         nhNXOsJHpmwTF1tbecjyRUFJ2LchlRq/R2KWJFvgWOG/zZxBf2kbMbAfpoUZwgv9lF
         2CuxWSaU50rwM8whEXEV3+tgkxAX9bnVtluubYmBnCMNJAAalN3QYD7RQqe1nGXRe1
         uHzFFY8LcJmraxH/yRRDRj+q1un+6oUnuCdSRgpoktoDwdtHTtQnijypgir9K/SIfE
         XpAw8T/5Nt75AYTv7RorQXA2Z0QmPFu+F/6xb6pjSm2GuScOE+jJIctGKETCTMntPI
         +uJsB6t6YfAzA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kconfig: nconf: refactor in print_in_middle()
Date:   Mon, 12 Apr 2021 10:12:27 +0900
Message-Id: <20210412011227.249534-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210412011227.249534-1-masahiroy@kernel.org>
References: <20210412011227.249534-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This helper is the same as the sample code in the NCURSES HOWTO [1],
but it is over-engineering to be used for nconf.

I do not see any good reason to use the 'float' type just for the
division by 2.

All the call-sites pass a non-NULL pointer to the first argument,
so 'if (win == NULL) win = stdscr;' is dead code.

'if (startx != 0) x = startx;' is dead code because 'x' will be
overridden some lines below, by 'x = startx + (int)temp;'.

All the call-sites pass a non-zero value to the second argument,
so 'if (starty != 0)' is always true.

getyx(win, y, x) is also dead-code because both 'y' and 'x' are
overridden.

All the call-sites pass 0 to the third parameter, so 'startx' can
be removed.

All the call-sites pass a non-zero value to the fourth parameter,
so 'if (width == 0) width = 80;' is dead code.

Change the type of the last parameter from 'chtype' to 'int' to be
aligned with the prototype, 'int wattrset(WINDOW *win, int attrs);'

I also slightly cleaned up the indentation style.

[1]: https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/color.html

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/nconf.c     |  2 +-
 scripts/kconfig/nconf.gui.c | 31 ++++---------------------------
 scripts/kconfig/nconf.h     |  7 +------
 3 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 5209a18eeacb..b11b75f83f7e 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -953,7 +953,7 @@ static void show_menu(const char *prompt, const char *instructions,
 	current_instructions = instructions;
 
 	clear();
-	print_in_middle(stdscr, 1, 0, getmaxx(stdscr),
+	print_in_middle(stdscr, 1, getmaxx(stdscr),
 			menu_backtitle,
 			attr_main_heading);
 
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index e747590cee17..9aedf40f1dc0 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -117,32 +117,10 @@ void set_colors(void)
 }
 
 /* this changes the windows attributes !!! */
-void print_in_middle(WINDOW *win,
-		int starty,
-		int startx,
-		int width,
-		const char *string,
-		chtype color)
-{      int length, x, y;
-	float temp;
-
-
-	if (win == NULL)
-		win = stdscr;
-	getyx(win, y, x);
-	if (startx != 0)
-		x = startx;
-	if (starty != 0)
-		y = starty;
-	if (width == 0)
-		width = 80;
-
-	length = strlen(string);
-	temp = (width - length) / 2;
-	x = startx + (int)temp;
-	wattrset(win, color);
-	mvwprintw(win, y, x, "%s", string);
-	refresh();
+void print_in_middle(WINDOW *win, int y, int width, const char *str, int attrs)
+{
+	wattrset(win, attrs);
+	mvwprintw(win, y, (width - strlen(str)) / 2, "%s", str);
 }
 
 int get_line_no(const char *text)
@@ -577,7 +555,6 @@ void show_scroll_win(WINDOW *main_window,
 				text_cols, 0);
 		print_in_middle(win,
 				text_lines+2,
-				0,
 				text_cols,
 				"<OK>",
 				attr_dialog_menu_fore);
diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
index 90a1ae331878..6f925bc74eb3 100644
--- a/scripts/kconfig/nconf.h
+++ b/scripts/kconfig/nconf.h
@@ -68,12 +68,7 @@ typedef enum {
 void set_colors(void);
 
 /* this changes the windows attributes !!! */
-void print_in_middle(WINDOW *win,
-		int starty,
-		int startx,
-		int width,
-		const char *string,
-		chtype color);
+void print_in_middle(WINDOW *win, int y, int width, const char *str, int attrs);
 int get_line_length(const char *line);
 int get_line_no(const char *text);
 const char *get_line(const char *text, int line_no);
-- 
2.27.0

