Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F5D768948
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Jul 2023 01:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjG3XeU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Jul 2023 19:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjG3XeT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Jul 2023 19:34:19 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9433E7C
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Jul 2023 16:34:17 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-76c97a137c8so57949785a.1
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Jul 2023 16:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690760057; x=1691364857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jydV836dqxNgzLoYd1Hq3uPns+SWPwk1PIp0jNl7ZU=;
        b=WN8M4NhAJSyz4aaPlZy9tacMIColA0uYLlU8kOd55HvyRUgPn2EiYQFjaAUiH74J9T
         Q7g1s2yNo/UNgfnnpYFMQRcBiox62LuPQ7kWfQmJsmxmTWNZLePuwmdZl6EGuuQ5EtCb
         Gx52dhsHqT6Xds+qtF24wIAary/ACczAqkFp4FiJoIn4NkdPJMGk3AYpYE1DjzJ60f+A
         hyZ7RPHmThKXADkKkcgiq+aRskuRywXgtjSmgKYDPLAqBBET7TLy+WOb2XfStuLeiv+h
         G+CMVwJxsL1AobhjGA6swD8gksk9iNu0wNLoV+h7gV3DQpcGcfA8doyNs5U7xlRUskDf
         uj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690760057; x=1691364857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jydV836dqxNgzLoYd1Hq3uPns+SWPwk1PIp0jNl7ZU=;
        b=DAgd0KzdRZZZ/RL3h63VsCrR/fMIhD0WK0fpOfZHO62NBk4vWHDa4p6JTiug3Q1/lV
         ELs2auwWl4mvy0vt7Jbiff/OD6UlIZiSBii80NSWikShTDwL7U+PN8S2kUsngzIfIcof
         Lm2ozRblaJGEtqITq2XPu0hRczah1frPr/XMJQ+BUFiJ8T9OsekIlybxfviP9LkiVLJi
         0evFV9pfqFoQyHpYAMBUwmjAD4iCcGu6zJoCEbQGKdWBOIhkE+VyEgWrworDz0o26T2J
         k/qC/4joEo8FNFczixBR9X5XVN9AWlzLyC3WdWHUK0y0DSCVAleUVIaZRWD5aqtaR4ev
         2I9A==
X-Gm-Message-State: ABy/qLZOhkRmhbWEdYEPf3e0I7KHlWIojW78megwG1DjFivt1DxIQ7qI
        VydhEvx8Ml0MtqYRXqkGsW5BqLJhsuP6Zw==
X-Google-Smtp-Source: APBJJlHFcs7C6Ig728vMxx2oXkenv7CPt/SJH4dVp3kE4OuvqmknXgPLtWNhcYQFX1NVrD7mzL8KnA==
X-Received: by 2002:a0c:8e88:0:b0:63c:c72e:6762 with SMTP id x8-20020a0c8e88000000b0063cc72e6762mr9491254qvb.9.1690760056724;
        Sun, 30 Jul 2023 16:34:16 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab ([2600:4040:57a3:100:4ab7:2849:a79e:bc0e])
        by smtp.gmail.com with ESMTPSA id c17-20020a0cf2d1000000b0063d252a141dsm3221252qvm.116.2023.07.30.16.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 16:34:16 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3] scripts: kconfig: nconf: Add search jump feature
Date:   Sun, 30 Jul 2023 19:34:15 -0400
Message-Id: <20230730233415.4178504-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Menuconfig has a feature where you can "press the key in the (#) prefix
to jump directly to that location. You will be returned to the current
search results after exiting this new menu."

This commit adds this feature to nconfig, with almost identical code.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
v1->v2:
 Add selected_conf to go to menu and select a specific option.
 Use get_line insead of creating new function.
 Use Masahiro Yamada's new jump search implementation.
v2->v3:
 Change `start, end` to size_t and move scope to if
 Removed redundant assigment of `again` to false.
---
 scripts/kconfig/nconf.c     | 111 ++++++++++++++++++++++++++++++++----
 scripts/kconfig/nconf.gui.c |  27 +++++++--
 scripts/kconfig/nconf.h     |   4 ++
 3 files changed, 127 insertions(+), 15 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 3ba8b1af390f..172dc8fdd3ef 100644
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
@@ -693,6 +750,7 @@ static void search_conf(void)
 	struct gstr title;
 	char *dialog_input;
 	int dres;
+	bool again;
 
 	title = str_new();
 	str_printf( &title, "Enter (sub)string or regexp to search for "
@@ -721,11 +779,27 @@ static void search_conf(void)
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
 
@@ -1063,9 +1137,14 @@ static int do_match(int key, struct match_state *state, int *ans)
 
 static void conf(struct menu *menu)
 {
-	struct menu *submenu = NULL;
+	selected_conf(menu, NULL);
+}
+
+static void selected_conf(struct menu *menu, struct menu *active_menu)
+{
+	struct menu *submenu = NULL, *child;
 	struct symbol *sym;
-	int res;
+	int i, res;
 	int current_index = 0;
 	int last_top_row = 0;
 	struct match_state match_state = {
@@ -1074,6 +1153,18 @@ static void conf(struct menu *menu)
 		.pattern = "",
 	};
 
+	if (active_menu != NULL) {
+		for (i = 0, child = menu->list; child; child = child->next) {
+			if (!show_all_items && !menu_is_visible(child))
+				continue;
+			if (active_menu == child) {
+				current_index = i;
+				break;
+			}
+			i++;
+		}
+	}
+
 	while (!global_exit) {
 		reset_menu();
 		current_menu = menu;
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 9aedf40f1dc0..bf015895053c 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -497,10 +497,16 @@ void refresh_all_windows(WINDOW *main_window)
 	refresh();
 }
 
-/* layman's scrollable window... */
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
 		const char *text)
+{
+	(void)show_scroll_win_ext(main_window, title, (char *)text, NULL, NULL);
+}
+
+/* layman's scrollable window... */
+int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
+			extra_key_cb_fn extra_key_cb, void *data)
 {
 	int res;
 	int total_lines = get_line_no(text);
@@ -514,6 +520,7 @@ void show_scroll_win(WINDOW *main_window,
 	WINDOW *win;
 	WINDOW *pad;
 	PANEL *panel;
+	bool done = false;
 
 	getmaxyx(stdscr, lines, columns);
 
@@ -549,8 +556,7 @@ void show_scroll_win(WINDOW *main_window,
 	panel = new_panel(win);
 
 	/* handle scrolling */
-	do {
-
+	while (!done) {
 		copywin(pad, win, start_y, start_x, 2, 2, text_lines,
 				text_cols, 0);
 		print_in_middle(win,
@@ -593,8 +599,18 @@ void show_scroll_win(WINDOW *main_window,
 		case 'l':
 			start_x++;
 			break;
+		default:
+			if (extra_key_cb) {
+				size_t start = (size_t)(get_line(text, start_y) - text);
+				size_t end = (size_t)(get_line(text, start_y + text_lines) - text);
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
@@ -606,9 +622,10 @@ void show_scroll_win(WINDOW *main_window,
 			start_x = 0;
 		if (start_x >= total_cols-text_cols)
 			start_x = total_cols-text_cols;
-	} while (res);
+	}
 
 	del_panel(panel);
 	delwin(win);
 	refresh_all_windows(main_window);
+	return res;
 }
diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
index 6f925bc74eb3..912f668c5772 100644
--- a/scripts/kconfig/nconf.h
+++ b/scripts/kconfig/nconf.h
@@ -67,6 +67,8 @@ typedef enum {
 
 void set_colors(void);
 
+typedef int (*extra_key_cb_fn)(int, size_t, size_t, void *);
+
 /* this changes the windows attributes !!! */
 void print_in_middle(WINDOW *win, int y, int width, const char *str, int attrs);
 int get_line_length(const char *line);
@@ -78,6 +80,8 @@ int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
 		const char *init, char **resultp, int *result_len);
 void refresh_all_windows(WINDOW *main_window);
+int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
+			extra_key_cb_fn extra_key_cb, void *data);
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
 		const char *text);
-- 
2.40.0

