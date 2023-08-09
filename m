Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212B9774FEF
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Aug 2023 02:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjHIAmY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Aug 2023 20:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjHIAmY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Aug 2023 20:42:24 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D021995
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 17:42:23 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-63f7f16553fso19935676d6.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Aug 2023 17:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691541742; x=1692146542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r64CGrQGDsN4d4R4HC6B7Gh+uQexkUjo7lJaP3ITkss=;
        b=PbilY6J+HsYbWGqN4HphV/lX5U67EsloGH+FCDBDfAA6oUdF5O5dYfLfA1oxHKL1pO
         4mlOTWtdb1OHbYsYt+Qiwebc7DjZEfhmCUDK7/JUhqEsA5Q6IvkEvBWdzb+G2XNl5Hwh
         t156VxR/I0Owlqsf6sGSqbcoJ0etg2at/YjevF3B5EMwEHN/wH+PfFPvj07fwQOjD32w
         PNLHuWRqbKiQUlTlFPgri+32zXr2NouaKIUVncnmmIGWzc5d31MOSzXCcqchW/Ttl812
         6mexoztSVzso689tGhf14uQ2Ylwixk2bUM10RqzEuz8GS2uAF5MWEGDnlmEkg8r6EGDd
         tRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691541742; x=1692146542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r64CGrQGDsN4d4R4HC6B7Gh+uQexkUjo7lJaP3ITkss=;
        b=GiFSzHUj7cVHLAYGfBSrsVJE+QJUD8mh9jEqXk0i7PRJFU8bqt/dDQGZceYidkNep5
         OeQO8Dd8W3Ae1LEpxweG7Mz/7iA3k62Jn4Hl+G87YCW8Eg62HzIybFHYlCcPMB3qN4Up
         5b2IIs7GwdIoI42vwX1pSmyUCXgwS+S1HNKTFkcplinTSJnm5cmrAQ0KG7rliG4WARku
         vdUE6q2G3VONOKy/5F7NQUHxzQInoHWiWclu0Oc9fJBSOWxmN5DYA1mPxGardAnXd2Oa
         Ya+S0QJODvAO0Wr++p7euF/O3CL7I/HTpKjOXZcEQd5UBV2A9rGqReArQaL78V6mcdje
         wXJA==
X-Gm-Message-State: AOJu0YwoAPcEmaqsmFfi9Cc4ml3vAOr9qHkEAgLkUk4bMElW0qQiuG2z
        bfHTwetwHm3iMBqUksg90ikC6zfydOKH7A==
X-Google-Smtp-Source: AGHT+IE9DK0H+AQrXH6VSs/+oRHOJvGIocS0/ELBHV+kVYXmFWUNJtsvMAoIiA9oTYiBx3O6IuFb+A==
X-Received: by 2002:a0c:f28a:0:b0:636:eff5:f335 with SMTP id k10-20020a0cf28a000000b00636eff5f335mr931150qvl.12.1691541742028;
        Tue, 08 Aug 2023 17:42:22 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab ([2600:4040:57a3:100:de4f:42:8e69:eb60])
        by smtp.gmail.com with ESMTPSA id b12-20020a0cf04c000000b00631f02c2279sm4030285qvl.90.2023.08.08.17.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 17:42:21 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v4] kconfig: nconf: Add search jump feature
Date:   Tue,  8 Aug 2023 20:42:20 -0400
Message-Id: <20230809004220.1884118-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Jesse Taube <mr.bossman075@gmail.com>

Menuconfig has a feature where you can "press the key in the (#) prefix
to jump directly to that location. You will be returned to the current
search results after exiting this new menu."

This commit adds this feature to nconfig, with almost identical code.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
v1->v2:
 Add selected_conf to go to menu and select a specific option.
 Use get_line instead of creating new function.
 Use Masahiro Yamada's new jump search implementation.
v2->v3:
 Change `start, end` to size_t and move scope to if
 Removed redundant assignment of `again` to false.
v3->v4:
 Remove unnecessary size_t cast
 Use ncurses to find line index in selected_conf
---
 scripts/kconfig/nconf.c     | 113 ++++++++++++++++++++++++++++++++----
 scripts/kconfig/nconf.gui.c |  37 ++++++++++--
 scripts/kconfig/nconf.h     |   5 ++
 3 files changed, 140 insertions(+), 15 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 3ba8b1af390f..143a2c351d57 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -220,7 +220,7 @@ search_help[] =
 "Location:\n"
 "  -> Bus options (PCI, PCMCIA, EISA, ISA)\n"
 "    -> PCI support (PCI [ = y])\n"
-"      -> PCI access mode (<choice> [ = y])\n"
+"(1)   -> PCI access mode (<choice> [ = y])\n"
 "Selects: LIBCRC32\n"
 "Selected by: BAR\n"
 "-----------------------------------------------------------------\n"
@@ -231,9 +231,13 @@ search_help[] =
 "o  The 'Depends on:' line lists symbols that need to be defined for\n"
 "   this symbol to be visible and selectable in the menu.\n"
 "o  The 'Location:' lines tell, where in the menu structure this symbol\n"
-"   is located.  A location followed by a [ = y] indicates that this is\n"
-"   a selectable menu item, and the current value is displayed inside\n"
-"   brackets.\n"
+"   is located.\n"
+"     A location followed by a [ = y] indicates that this is\n"
+"     a selectable menu item, and the current value is displayed inside\n"
+"     brackets.\n"
+"     Press the key in the (#) prefix to jump directly to that\n"
+"     location. You will be returned to the current search results\n"
+"     after exiting this new menu.\n"
 "o  The 'Selects:' line tells, what symbol will be automatically selected\n"
 "   if this symbol is selected (y or m).\n"
 "o  The 'Selected by' line tells what symbol has selected this symbol.\n"
@@ -275,7 +279,9 @@ static const char *current_instructions = menu_instructions;
 
 static char *dialog_input_result;
 static int dialog_input_result_len;
+static int jump_key_char;
 
+static void selected_conf(struct menu *menu, struct menu *active_menu);
 static void conf(struct menu *menu);
 static void conf_choice(struct menu *menu);
 static void conf_string(struct menu *menu);
@@ -685,6 +691,57 @@ static int do_exit(void)
 	return 0;
 }
 
+struct search_data {
+	struct list_head *head;
+	struct menu *target;
+};
+
+static int next_jump_key(int key)
+{
+	if (key < '1' || key > '9')
+		return '1';
+
+	key++;
+
+	if (key > '9')
+		key = '1';
+
+	return key;
+}
+
+static int handle_search_keys(int key, size_t start, size_t end, void *_data)
+{
+	struct search_data *data = _data;
+	struct jump_key *pos;
+	int index = 0;
+
+	if (key < '1' || key > '9')
+		return 0;
+
+	list_for_each_entry(pos, data->head, entries) {
+		index = next_jump_key(index);
+
+		if (pos->offset < start)
+			continue;
+
+		if (pos->offset >= end)
+			break;
+
+		if (key == index) {
+			data->target = pos->target;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+int get_jump_key_char(void)
+{
+	jump_key_char = next_jump_key(jump_key_char);
+
+	return jump_key_char;
+}
 
 static void search_conf(void)
 {
@@ -692,7 +749,8 @@ static void search_conf(void)
 	struct gstr res;
 	struct gstr title;
 	char *dialog_input;
-	int dres;
+	int dres, vscroll = 0, hscroll = 0;
+	bool again;
 
 	title = str_new();
 	str_printf( &title, "Enter (sub)string or regexp to search for "
@@ -721,11 +779,28 @@ static void search_conf(void)
 		dialog_input += strlen(CONFIG_);
 
 	sym_arr = sym_re_search(dialog_input);
-	res = get_relations_str(sym_arr, NULL);
+
+	do {
+		LIST_HEAD(head);
+		struct search_data data = {
+			.head = &head,
+			.target = NULL,
+		};
+		jump_key_char = 0;
+		res = get_relations_str(sym_arr, &head);
+		dres = show_scroll_win_ext(main_window,
+				"Search Results", str_get(&res),
+				&vscroll, &hscroll,
+				handle_search_keys, &data);
+		again = false;
+		if (dres >= '1' && dres <= '9') {
+			assert(data.target != NULL);
+			selected_conf(data.target->parent, data.target);
+			again = true;
+		}
+		str_free(&res);
+	} while (again);
 	free(sym_arr);
-	show_scroll_win(main_window,
-			"Search Results", str_get(&res));
-	str_free(&res);
 	str_free(&title);
 }
 
@@ -1062,10 +1137,15 @@ static int do_match(int key, struct match_state *state, int *ans)
 }
 
 static void conf(struct menu *menu)
+{
+	selected_conf(menu, NULL);
+}
+
+static void selected_conf(struct menu *menu, struct menu *active_menu)
 {
 	struct menu *submenu = NULL;
 	struct symbol *sym;
-	int res;
+	int i, res;
 	int current_index = 0;
 	int last_top_row = 0;
 	struct match_state match_state = {
@@ -1081,6 +1161,19 @@ static void conf(struct menu *menu)
 		if (!child_count)
 			break;
 
+		if (active_menu != NULL) {
+			for (i = 0; i < items_num; i++) {
+				struct mitem *mcur;
+
+				mcur = (struct mitem *) item_userptr(curses_menu_items[i]);
+				if ((struct menu *) mcur->usrptr == active_menu) {
+					current_index = i;
+					break;
+				}
+			}
+			active_menu = NULL;
+		}
+
 		show_menu(menu_get_prompt(menu), menu_instructions,
 			  current_index, &last_top_row);
 		keypad((menu_win(curses_menu)), TRUE);
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 9aedf40f1dc0..25a7263ef3c8 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -497,10 +497,17 @@ void refresh_all_windows(WINDOW *main_window)
 	refresh();
 }
 
-/* layman's scrollable window... */
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
 		const char *text)
+{
+	(void)show_scroll_win_ext(main_window, title, (char *)text, NULL, NULL, NULL, NULL);
+}
+
+/* layman's scrollable window... */
+int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
+			int *vscroll, int *hscroll,
+			extra_key_cb_fn extra_key_cb, void *data)
 {
 	int res;
 	int total_lines = get_line_no(text);
@@ -514,6 +521,12 @@ void show_scroll_win(WINDOW *main_window,
 	WINDOW *win;
 	WINDOW *pad;
 	PANEL *panel;
+	bool done = false;
+
+	if (hscroll)
+		start_x = *hscroll;
+	if (vscroll)
+		start_y = *vscroll;
 
 	getmaxyx(stdscr, lines, columns);
 
@@ -549,8 +562,7 @@ void show_scroll_win(WINDOW *main_window,
 	panel = new_panel(win);
 
 	/* handle scrolling */
-	do {
-
+	while (!done) {
 		copywin(pad, win, start_y, start_x, 2, 2, text_lines,
 				text_cols, 0);
 		print_in_middle(win,
@@ -593,8 +605,18 @@ void show_scroll_win(WINDOW *main_window,
 		case 'l':
 			start_x++;
 			break;
+		default:
+			if (extra_key_cb) {
+				size_t start = (get_line(text, start_y) - text);
+				size_t end = (get_line(text, start_y + text_lines) - text);
+
+				if (extra_key_cb(res, start, end, data)) {
+					done = true;
+					break;
+				}
+			}
 		}
-		if (res == 10 || res == 27 || res == 'q' ||
+		if (res == 0 || res == 10 || res == 27 || res == 'q' ||
 			res == KEY_F(F_HELP) || res == KEY_F(F_BACK) ||
 			res == KEY_F(F_EXIT))
 			break;
@@ -606,9 +628,14 @@ void show_scroll_win(WINDOW *main_window,
 			start_x = 0;
 		if (start_x >= total_cols-text_cols)
 			start_x = total_cols-text_cols;
-	} while (res);
+	}
 
+	if (hscroll)
+		*hscroll = start_x;
+	if (vscroll)
+		*vscroll = start_y;
 	del_panel(panel);
 	delwin(win);
 	refresh_all_windows(main_window);
+	return res;
 }
diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
index 6f925bc74eb3..ab836d582664 100644
--- a/scripts/kconfig/nconf.h
+++ b/scripts/kconfig/nconf.h
@@ -67,6 +67,8 @@ typedef enum {
 
 void set_colors(void);
 
+typedef int (*extra_key_cb_fn)(int, size_t, size_t, void *);
+
 /* this changes the windows attributes !!! */
 void print_in_middle(WINDOW *win, int y, int width, const char *str, int attrs);
 int get_line_length(const char *line);
@@ -78,6 +80,9 @@ int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
 		const char *init, char **resultp, int *result_len);
 void refresh_all_windows(WINDOW *main_window);
+int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
+			int *vscroll, int *hscroll,
+			extra_key_cb_fn extra_key_cb, void *data);
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
 		const char *text);
-- 
2.40.0

