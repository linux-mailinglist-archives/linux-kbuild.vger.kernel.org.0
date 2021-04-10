Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE7A35B032
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 21:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbhDJTqf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 15:46:35 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41638 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234948AbhDJTqf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 15:46:35 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13AJjaXZ021927;
        Sun, 11 Apr 2021 04:45:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13AJjaXZ021927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618083939;
        bh=S49tLx+mrhmLhsMgFiGzS8eaydScYDuIULRiZl9oR54=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mFgJ11QQcNQuFGn+6RkehFIEIUlHYdUe+JrCmxA+RVaYzF5zwr8KHa8sseAIakJGM
         M/Hxyzr65naFyowsC5si+0RNvnw8LCEF9yC3M+twOiyV0iLL8bkJtpTxhyQ4GS9bBG
         BHL0XLN4x1Ed84+eQzz43sA0lQlc6GzAKknZk9j2kicuS0TqwUzmXVzgRIF9aov6V2
         odJltd4kD6jeK4lzHoKtB9lv4XqnxfWBccHfz3TZ7uXUTUoKDdNvUbpbbt1Uy4hs+6
         PKFxtq5k1Vy/Jj1qbaGwI4LiHZ0qByOx0F7UA/Ml4HzHH4Loy/34ywNFH8quIy/RZI
         kApP4TlyyZTiA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] kconfig: nconf: refactor attributes setup code
Date:   Sun, 11 Apr 2021 04:45:34 +0900
Message-Id: <20210410194534.187588-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210410194534.187588-1-masahiroy@kernel.org>
References: <20210410194534.187588-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current attributes setup code is strange; the array attribute[]
is set to values outside the range of the attribute_t enum.

At least,

  attributes_t attributes[ATTR_MAX+1] = {0};

... should be

  int attribute[ATTR_MAX+1] = {0};

Also, there is no need to hard-code the color-pair numbers in
attributes_t.

The current code is horribly screwed up. Rewrite it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/nconf.c     |  22 ++--
 scripts/kconfig/nconf.gui.c | 253 ++++++++++++++++--------------------
 scripts/kconfig/nconf.h     |  44 +++----
 3 files changed, 144 insertions(+), 175 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index b6fe7b18a103..c47051598e9a 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -370,18 +370,18 @@ static void print_function_line(void)
 	int lines = getmaxy(stdscr);
 
 	for (i = 0; i < function_keys_num; i++) {
-		wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
+		wattrset(main_window, attr_function_highlight);
 		mvwprintw(main_window, lines-3, offset,
 				"%s",
 				function_keys[i].key_str);
-		wattrset(main_window, attributes[FUNCTION_TEXT]);
+		wattrset(main_window, attr_function_text);
 		offset += strlen(function_keys[i].key_str);
 		mvwprintw(main_window, lines-3,
 				offset, "%s",
 				function_keys[i].func);
 		offset += strlen(function_keys[i].func) + skip;
 	}
-	wattrset(main_window, attributes[NORMAL]);
+	wattrset(main_window, attr_normal);
 }
 
 /* help */
@@ -956,16 +956,16 @@ static void show_menu(const char *prompt, const char *instructions,
 	current_instructions = instructions;
 
 	clear();
-	wattrset(main_window, attributes[NORMAL]);
+	wattrset(main_window, attr_normal);
 	print_in_middle(stdscr, 1, 0, getmaxx(stdscr),
 			menu_backtitle,
-			attributes[MAIN_HEADING]);
+			attr_main_heading);
 
-	wattrset(main_window, attributes[MAIN_MENU_BOX]);
+	wattrset(main_window, attr_main_menu_box);
 	box(main_window, 0, 0);
-	wattrset(main_window, attributes[MAIN_MENU_HEADING]);
+	wattrset(main_window, attr_main_menu_heading);
 	mvwprintw(main_window, 0, 3, " %s ", prompt);
-	wattrset(main_window, attributes[NORMAL]);
+	wattrset(main_window, attr_normal);
 
 	set_menu_items(curses_menu, curses_menu_items);
 
@@ -1521,9 +1521,9 @@ int main(int ac, char **av)
 	menu_opts_on(curses_menu, O_NONCYCLIC);
 	menu_opts_on(curses_menu, O_IGNORECASE);
 	set_menu_mark(curses_menu, " ");
-	set_menu_fore(curses_menu, attributes[MAIN_MENU_FORE]);
-	set_menu_back(curses_menu, attributes[MAIN_MENU_BACK]);
-	set_menu_grey(curses_menu, attributes[MAIN_MENU_GREY]);
+	set_menu_fore(curses_menu, attr_main_menu_fore);
+	set_menu_back(curses_menu, attr_main_menu_back);
+	set_menu_grey(curses_menu, attr_main_menu_grey);
 
 	set_config_filename(conf_get_configname());
 	setup_windows();
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 180d3158d380..e747590cee17 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -7,141 +7,114 @@
 #include "nconf.h"
 #include "lkc.h"
 
-/* a list of all the different widgets we use */
-attributes_t attributes[ATTR_MAX+1] = {0};
-
-/* available colors:
-   COLOR_BLACK   0
-   COLOR_RED     1
-   COLOR_GREEN   2
-   COLOR_YELLOW  3
-   COLOR_BLUE    4
-   COLOR_MAGENTA 5
-   COLOR_CYAN    6
-   COLOR_WHITE   7
-   */
-static void set_normal_colors(void)
-{
-	init_pair(NORMAL, -1, -1);
-	init_pair(MAIN_HEADING, COLOR_MAGENTA, -1);
-
-	/* FORE is for the selected item */
-	init_pair(MAIN_MENU_FORE, -1, -1);
-	/* BACK for all the rest */
-	init_pair(MAIN_MENU_BACK, -1, -1);
-	init_pair(MAIN_MENU_GREY, -1, -1);
-	init_pair(MAIN_MENU_HEADING, COLOR_GREEN, -1);
-	init_pair(MAIN_MENU_BOX, COLOR_YELLOW, -1);
-
-	init_pair(SCROLLWIN_TEXT, -1, -1);
-	init_pair(SCROLLWIN_HEADING, COLOR_GREEN, -1);
-	init_pair(SCROLLWIN_BOX, COLOR_YELLOW, -1);
-
-	init_pair(DIALOG_TEXT, -1, -1);
-	init_pair(DIALOG_BOX, COLOR_YELLOW, -1);
-	init_pair(DIALOG_MENU_BACK, COLOR_YELLOW, -1);
-	init_pair(DIALOG_MENU_FORE, COLOR_RED, -1);
-
-	init_pair(INPUT_BOX, COLOR_YELLOW, -1);
-	init_pair(INPUT_HEADING, COLOR_GREEN, -1);
-	init_pair(INPUT_TEXT, -1, -1);
-	init_pair(INPUT_FIELD, -1, -1);
-
-	init_pair(FUNCTION_HIGHLIGHT, -1, -1);
-	init_pair(FUNCTION_TEXT, COLOR_YELLOW, -1);
-}
-
-/* available attributes:
-   A_NORMAL        Normal display (no highlight)
-   A_STANDOUT      Best highlighting mode of the terminal.
-   A_UNDERLINE     Underlining
-   A_REVERSE       Reverse video
-   A_BLINK         Blinking
-   A_DIM           Half bright
-   A_BOLD          Extra bright or bold
-   A_PROTECT       Protected mode
-   A_INVIS         Invisible or blank mode
-   A_ALTCHARSET    Alternate character set
-   A_CHARTEXT      Bit-mask to extract a character
-   COLOR_PAIR(n)   Color-pair number n
-   */
-static void normal_color_theme(void)
-{
-	/* automatically add color... */
-#define mkattr(name, attr) do { \
-attributes[name] = attr | COLOR_PAIR(name); } while (0)
-	mkattr(NORMAL, A_NORMAL);
-	mkattr(MAIN_HEADING, A_BOLD | A_UNDERLINE);
-
-	mkattr(MAIN_MENU_FORE, A_REVERSE);
-	mkattr(MAIN_MENU_BACK, A_NORMAL);
-	mkattr(MAIN_MENU_GREY, A_NORMAL);
-	mkattr(MAIN_MENU_HEADING, A_BOLD);
-	mkattr(MAIN_MENU_BOX, A_NORMAL);
-
-	mkattr(SCROLLWIN_TEXT, A_NORMAL);
-	mkattr(SCROLLWIN_HEADING, A_BOLD);
-	mkattr(SCROLLWIN_BOX, A_BOLD);
-
-	mkattr(DIALOG_TEXT, A_BOLD);
-	mkattr(DIALOG_BOX, A_BOLD);
-	mkattr(DIALOG_MENU_FORE, A_STANDOUT);
-	mkattr(DIALOG_MENU_BACK, A_NORMAL);
-
-	mkattr(INPUT_BOX, A_NORMAL);
-	mkattr(INPUT_HEADING, A_BOLD);
-	mkattr(INPUT_TEXT, A_NORMAL);
-	mkattr(INPUT_FIELD, A_UNDERLINE);
-
-	mkattr(FUNCTION_HIGHLIGHT, A_BOLD);
-	mkattr(FUNCTION_TEXT, A_REVERSE);
-}
-
-static void no_colors_theme(void)
-{
-	/* automatically add highlight, no color */
-#define mkattrn(name, attr) { attributes[name] = attr; }
-
-	mkattrn(NORMAL, A_NORMAL);
-	mkattrn(MAIN_HEADING, A_BOLD | A_UNDERLINE);
-
-	mkattrn(MAIN_MENU_FORE, A_STANDOUT);
-	mkattrn(MAIN_MENU_BACK, A_NORMAL);
-	mkattrn(MAIN_MENU_GREY, A_NORMAL);
-	mkattrn(MAIN_MENU_HEADING, A_BOLD);
-	mkattrn(MAIN_MENU_BOX, A_NORMAL);
-
-	mkattrn(SCROLLWIN_TEXT, A_NORMAL);
-	mkattrn(SCROLLWIN_HEADING, A_BOLD);
-	mkattrn(SCROLLWIN_BOX, A_BOLD);
-
-	mkattrn(DIALOG_TEXT, A_NORMAL);
-	mkattrn(DIALOG_BOX, A_BOLD);
-	mkattrn(DIALOG_MENU_FORE, A_STANDOUT);
-	mkattrn(DIALOG_MENU_BACK, A_NORMAL);
-
-	mkattrn(INPUT_BOX, A_BOLD);
-	mkattrn(INPUT_HEADING, A_BOLD);
-	mkattrn(INPUT_TEXT, A_NORMAL);
-	mkattrn(INPUT_FIELD, A_UNDERLINE);
-
-	mkattrn(FUNCTION_HIGHLIGHT, A_BOLD);
-	mkattrn(FUNCTION_TEXT, A_REVERSE);
-}
+int attr_normal;
+int attr_main_heading;
+int attr_main_menu_box;
+int attr_main_menu_fore;
+int attr_main_menu_back;
+int attr_main_menu_grey;
+int attr_main_menu_heading;
+int attr_scrollwin_text;
+int attr_scrollwin_heading;
+int attr_scrollwin_box;
+int attr_dialog_text;
+int attr_dialog_menu_fore;
+int attr_dialog_menu_back;
+int attr_dialog_box;
+int attr_input_box;
+int attr_input_heading;
+int attr_input_text;
+int attr_input_field;
+int attr_function_text;
+int attr_function_highlight;
+
+#define COLOR_ATTR(_at, _fg, _bg, _hl) \
+	{ .attr = &(_at), .has_color = true, .color_fg = _fg, .color_bg = _bg, .highlight = _hl }
+#define NO_COLOR_ATTR(_at, _hl) \
+	{ .attr = &(_at), .has_color = false, .highlight = _hl }
+#define COLOR_DEFAULT		-1
+
+struct nconf_attr_param {
+	int *attr;
+	bool has_color;
+	int color_fg;
+	int color_bg;
+	int highlight;
+};
+
+static const struct nconf_attr_param color_theme_params[] = {
+	COLOR_ATTR(attr_normal,			COLOR_DEFAULT,	COLOR_DEFAULT,	A_NORMAL),
+	COLOR_ATTR(attr_main_heading,		COLOR_MAGENTA,	COLOR_DEFAULT,	A_BOLD | A_UNDERLINE),
+	COLOR_ATTR(attr_main_menu_box,		COLOR_YELLOW,	COLOR_DEFAULT,	A_NORMAL),
+	COLOR_ATTR(attr_main_menu_fore,		COLOR_DEFAULT,	COLOR_DEFAULT,	A_REVERSE),
+	COLOR_ATTR(attr_main_menu_back,		COLOR_DEFAULT,	COLOR_DEFAULT,	A_NORMAL),
+	COLOR_ATTR(attr_main_menu_grey,		COLOR_DEFAULT,	COLOR_DEFAULT,	A_NORMAL),
+	COLOR_ATTR(attr_main_menu_heading,	COLOR_GREEN,	COLOR_DEFAULT,	A_BOLD),
+	COLOR_ATTR(attr_scrollwin_text,		COLOR_DEFAULT,	COLOR_DEFAULT,	A_NORMAL),
+	COLOR_ATTR(attr_scrollwin_heading,	COLOR_GREEN,	COLOR_DEFAULT,	A_BOLD),
+	COLOR_ATTR(attr_scrollwin_box,		COLOR_YELLOW,	COLOR_DEFAULT,	A_BOLD),
+	COLOR_ATTR(attr_dialog_text,		COLOR_DEFAULT,	COLOR_DEFAULT,	A_BOLD),
+	COLOR_ATTR(attr_dialog_menu_fore,	COLOR_RED,	COLOR_DEFAULT,	A_STANDOUT),
+	COLOR_ATTR(attr_dialog_menu_back,	COLOR_YELLOW,	COLOR_DEFAULT,	A_NORMAL),
+	COLOR_ATTR(attr_dialog_box,		COLOR_YELLOW,	COLOR_DEFAULT,	A_BOLD),
+	COLOR_ATTR(attr_input_box,		COLOR_YELLOW,	COLOR_DEFAULT,	A_NORMAL),
+	COLOR_ATTR(attr_input_heading,		COLOR_GREEN,	COLOR_DEFAULT,	A_BOLD),
+	COLOR_ATTR(attr_input_text,		COLOR_DEFAULT,	COLOR_DEFAULT,	A_NORMAL),
+	COLOR_ATTR(attr_input_field,		COLOR_DEFAULT,	COLOR_DEFAULT,	A_UNDERLINE),
+	COLOR_ATTR(attr_function_text,		COLOR_YELLOW,	COLOR_DEFAULT,	A_REVERSE),
+	COLOR_ATTR(attr_function_highlight,	COLOR_DEFAULT,	COLOR_DEFAULT,	A_BOLD),
+	{ /* sentinel */ }
+};
+
+static const struct nconf_attr_param no_color_theme_params[] = {
+	NO_COLOR_ATTR(attr_normal,		A_NORMAL),
+	NO_COLOR_ATTR(attr_main_heading,	A_BOLD | A_UNDERLINE),
+	NO_COLOR_ATTR(attr_main_menu_box,	A_NORMAL),
+	NO_COLOR_ATTR(attr_main_menu_fore,	A_STANDOUT),
+	NO_COLOR_ATTR(attr_main_menu_back,	A_NORMAL),
+	NO_COLOR_ATTR(attr_main_menu_grey,	A_NORMAL),
+	NO_COLOR_ATTR(attr_main_menu_heading,	A_BOLD),
+	NO_COLOR_ATTR(attr_scrollwin_text,	A_NORMAL),
+	NO_COLOR_ATTR(attr_scrollwin_heading,	A_BOLD),
+	NO_COLOR_ATTR(attr_scrollwin_box,	A_BOLD),
+	NO_COLOR_ATTR(attr_dialog_text,		A_NORMAL),
+	NO_COLOR_ATTR(attr_dialog_menu_fore,	A_STANDOUT),
+	NO_COLOR_ATTR(attr_dialog_menu_back,	A_NORMAL),
+	NO_COLOR_ATTR(attr_dialog_box,		A_BOLD),
+	NO_COLOR_ATTR(attr_input_box,		A_BOLD),
+	NO_COLOR_ATTR(attr_input_heading,	A_BOLD),
+	NO_COLOR_ATTR(attr_input_text,		A_NORMAL),
+	NO_COLOR_ATTR(attr_input_field,		A_UNDERLINE),
+	NO_COLOR_ATTR(attr_function_text,	A_REVERSE),
+	NO_COLOR_ATTR(attr_function_highlight,	A_BOLD),
+	{ /* sentinel */ }
+};
 
 void set_colors(void)
 {
-	start_color();
-	use_default_colors();
-	set_normal_colors();
+	const struct nconf_attr_param *p;
+	int pair = 0;
+
 	if (has_colors()) {
-		normal_color_theme();
+		start_color();
+		use_default_colors();
+		p = color_theme_params;
 	} else {
-		/* give defaults */
-		no_colors_theme();
+		p = no_color_theme_params;
 	}
-}
 
+	for (; p->attr; p++) {
+		int attr = p->highlight;
+
+		if (p->has_color) {
+			pair++;
+			init_pair(pair, p->color_fg, p->color_bg);
+			attr |= COLOR_PAIR(pair);
+		}
+
+		*p->attr = attr;
+	}
+}
 
 /* this changes the windows attributes !!! */
 void print_in_middle(WINDOW *win,
@@ -294,14 +267,14 @@ int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
 	msg_win = derwin(win, win_rows-2, msg_width, 1,
 			1+(total_width+2-msg_width)/2);
 
-	set_menu_fore(menu, attributes[DIALOG_MENU_FORE]);
-	set_menu_back(menu, attributes[DIALOG_MENU_BACK]);
+	set_menu_fore(menu, attr_dialog_menu_fore);
+	set_menu_back(menu, attr_dialog_menu_back);
 
-	wattrset(win, attributes[DIALOG_BOX]);
+	wattrset(win, attr_dialog_box);
 	box(win, 0, 0);
 
 	/* print message */
-	wattrset(msg_win, attributes[DIALOG_TEXT]);
+	wattrset(msg_win, attr_dialog_text);
 	fill_window(msg_win, msg);
 
 	set_menu_win(menu, win);
@@ -405,16 +378,16 @@ int dialog_inputbox(WINDOW *main_window,
 	form_win = derwin(win, 1, prompt_width, prompt_lines+3, 2);
 	keypad(form_win, TRUE);
 
-	wattrset(form_win, attributes[INPUT_FIELD]);
+	wattrset(form_win, attr_input_field);
 
-	wattrset(win, attributes[INPUT_BOX]);
+	wattrset(win, attr_input_box);
 	box(win, 0, 0);
-	wattrset(win, attributes[INPUT_HEADING]);
+	wattrset(win, attr_input_heading);
 	if (title)
 		mvwprintw(win, 0, 3, "%s", title);
 
 	/* print message */
-	wattrset(prompt_win, attributes[INPUT_TEXT]);
+	wattrset(prompt_win, attr_input_text);
 	fill_window(prompt_win, prompt);
 
 	mvwprintw(form_win, 0, 0, "%*s", prompt_width, " ");
@@ -576,7 +549,7 @@ void show_scroll_win(WINDOW *main_window,
 
 	/* create the pad */
 	pad = newpad(total_lines+10, total_cols+10);
-	wattrset(pad, attributes[SCROLLWIN_TEXT]);
+	wattrset(pad, attr_scrollwin_text);
 	fill_window(pad, text);
 
 	win_lines = min(total_lines+4, lines-2);
@@ -591,9 +564,9 @@ void show_scroll_win(WINDOW *main_window,
 	win = newwin(win_lines, win_cols, y, x);
 	keypad(win, TRUE);
 	/* show the help in the help window, and show the help panel */
-	wattrset(win, attributes[SCROLLWIN_BOX]);
+	wattrset(win, attr_scrollwin_box);
 	box(win, 0, 0);
-	wattrset(win, attributes[SCROLLWIN_HEADING]);
+	wattrset(win, attr_scrollwin_heading);
 	mvwprintw(win, 0, 3, " %s ", title);
 	panel = new_panel(win);
 
@@ -607,7 +580,7 @@ void show_scroll_win(WINDOW *main_window,
 				0,
 				text_cols,
 				"<OK>",
-				attributes[DIALOG_MENU_FORE]);
+				attr_dialog_menu_fore);
 		wrefresh(win);
 
 		res = wgetch(win);
diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
index fa5245eb93a7..90a1ae331878 100644
--- a/scripts/kconfig/nconf.h
+++ b/scripts/kconfig/nconf.h
@@ -32,30 +32,26 @@
 		typeof(b) _b = b;\
 		_a < _b ? _a : _b; })
 
-typedef enum {
-	NORMAL = 1,
-	MAIN_HEADING,
-	MAIN_MENU_BOX,
-	MAIN_MENU_FORE,
-	MAIN_MENU_BACK,
-	MAIN_MENU_GREY,
-	MAIN_MENU_HEADING,
-	SCROLLWIN_TEXT,
-	SCROLLWIN_HEADING,
-	SCROLLWIN_BOX,
-	DIALOG_TEXT,
-	DIALOG_MENU_FORE,
-	DIALOG_MENU_BACK,
-	DIALOG_BOX,
-	INPUT_BOX,
-	INPUT_HEADING,
-	INPUT_TEXT,
-	INPUT_FIELD,
-	FUNCTION_TEXT,
-	FUNCTION_HIGHLIGHT,
-	ATTR_MAX
-} attributes_t;
-extern attributes_t attributes[];
+extern int attr_normal;
+extern int attr_main_heading;
+extern int attr_main_menu_box;
+extern int attr_main_menu_fore;
+extern int attr_main_menu_back;
+extern int attr_main_menu_grey;
+extern int attr_main_menu_heading;
+extern int attr_scrollwin_text;
+extern int attr_scrollwin_heading;
+extern int attr_scrollwin_box;
+extern int attr_dialog_text;
+extern int attr_dialog_menu_fore;
+extern int attr_dialog_menu_back;
+extern int attr_dialog_box;
+extern int attr_input_box;
+extern int attr_input_heading;
+extern int attr_input_text;
+extern int attr_input_field;
+extern int attr_function_text;
+extern int attr_function_highlight;
 
 typedef enum {
 	F_HELP = 1,
-- 
2.27.0

