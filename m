Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC89F734486
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jun 2023 02:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjFRAQv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Jun 2023 20:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjFRAQu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Jun 2023 20:16:50 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8585B9
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Jun 2023 17:16:48 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-62fe6773c4fso15503966d6.2
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Jun 2023 17:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687047408; x=1689639408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUzGDT+LVaBUk2okWkyrGmqzBD3xZhBGEcAsQ4ivCPI=;
        b=U5JBcqDxglZJoSVKE7xT2Hzgt1rkY61zc4zomqw8fMG4ZZF8L7zVBBqWHhmqGjQ+gg
         WhqdM+S9IaviLhexmK1UEonblZx97o/1OKf8EqRaw3WTW4B2qAZpDai44hoZ13wwy/7U
         aS7UDmDSIA4n9ZkSh1/3cY7OuVtfiqB8lFYA6pv4U42TRN68pgcItJzXsZql7QN0h0IF
         G1Q/6A/yJsgIuDN4RR048SlcDFfUOBfWyxAoDlLPYeyo45MQHdYIQe5JdwJO5+RhqvAW
         MzI/sBdF3RZgKXC2Q1DkLc7ktC+IkuKANCJMv5nYfnvAqAX4inFLPuHGXy+6OtFbhhJW
         D9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687047408; x=1689639408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUzGDT+LVaBUk2okWkyrGmqzBD3xZhBGEcAsQ4ivCPI=;
        b=V1FNFCVC0QZIVsxr8hikNrtpCLR3nrsIOev2VijAGIITHS6Kk3f5gEf8HCBWofaxVE
         9sQgGAAerciel13e4oI0KVV720BL6ssfybWnOvzSCg+hceXfaYrFRNLgJF9wPs2JunP/
         8dCNF6pXlNIjq19HFr2/fRAxSP5xwMFRK82k+aYEM/YgK7Nk5OTLjNPoI7oyOxt/YUyi
         fn0jlcJbkbYhpddA1PCVKYfIFb2C4CpnWDoPiLbHyqJi8N1Sbrju0002FfyzVKL/1dQP
         bYCMwe7MYunMsBl6bn7zk3HSllXYOQPFV+BKm6hL8QJYX/CZGL/nIRlG6hOtGr+pFfkn
         RLRQ==
X-Gm-Message-State: AC+VfDynXrnA8rX8a/pSk8StuDRmOC9TDRNcl19DwMiEuFiq+VU/IvI1
        82pvzKJo8RPEZ0fbB5FmcE+oWGncVYs=
X-Google-Smtp-Source: ACHHUZ5jbt1ALRfPR7jSS12ocuYPZd4QFq6AFbKEe+SSCXvOyJ1KiQ8CZsC3vqOemvLDhLSfg9X+YQ==
X-Received: by 2002:a05:6214:c68:b0:626:32fc:99a6 with SMTP id t8-20020a0562140c6800b0062632fc99a6mr7828561qvj.17.1687047407679;
        Sat, 17 Jun 2023 17:16:47 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab ([2600:4040:57a3:100:79fe:ab11:8d69:ebdb])
        by smtp.gmail.com with ESMTPSA id k2-20020a0cf582000000b0062fe9cedf37sm4158996qvm.15.2023.06.17.17.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 17:16:47 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v1] scripts: kconfig: nconf: Add search jump feature
Date:   Sat, 17 Jun 2023 20:16:46 -0400
Message-Id: <20230618001646.1228521-1-Mr.Bossman075@gmail.com>
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
 scripts/kconfig/nconf.c     | 79 +++++++++++++++++++++++++++++++++++--
 scripts/kconfig/nconf.gui.c | 31 ++++++++++++---
 scripts/kconfig/nconf.h     |  5 +++
 3 files changed, 106 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 3ba8b1af390f..cbed2e15c579 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -234,6 +234,9 @@ search_help[] =
 "   is located.  A location followed by a [ = y] indicates that this is\n"
 "   a selectable menu item, and the current value is displayed inside\n"
 "   brackets.\n"
+"   Press the key in the (#) prefix to jump directly to that\n"
+"   location. You will be returned to the current search results\n"
+"   after exiting this new menu.\n"
 "o  The 'Selects:' line tells, what symbol will be automatically selected\n"
 "   if this symbol is selected (y or m).\n"
 "o  The 'Selected by' line tells what symbol has selected this symbol.\n"
@@ -685,6 +688,54 @@ static int do_exit(void)
 	return 0;
 }
 
+#define JUMP_NB			9
+
+struct update_text_data {
+	struct list_head *head;
+	struct menu **targets;
+	int *keys;
+};
+
+static size_t get_nth_line(char *buf, size_t n)
+{
+	size_t i = 0;
+
+	while (n > 0 && buf[i]) {
+		if (buf[i++] == '\n')
+			n--;
+	}
+	return i;
+}
+
+static void update_text(char *buf, size_t start, size_t end, void *_data)
+{
+	struct update_text_data *data = _data;
+	struct jump_key *pos;
+	int k = 0;
+
+	start = get_nth_line(buf, start);
+	end = get_nth_line(buf, end);
+
+	list_for_each_entry(pos, data->head, entries) {
+		if (pos->offset >= start && pos->offset < end) {
+			char header[4];
+
+			if (k < JUMP_NB) {
+				int key = '0' + (pos->index % JUMP_NB) + 1;
+
+				sprintf(header, "(%c)", key);
+				data->keys[k] = key;
+				data->targets[k] = pos->target;
+				k++;
+			} else {
+				sprintf(header, "   ");
+			}
+
+			memcpy(buf + pos->offset, header, sizeof(header) - 1);
+		}
+	}
+	data->keys[k] = 0;
+}
 
 static void search_conf(void)
 {
@@ -693,6 +744,7 @@ static void search_conf(void)
 	struct gstr title;
 	char *dialog_input;
 	int dres;
+	bool again = false;
 
 	title = str_new();
 	str_printf( &title, "Enter (sub)string or regexp to search for "
@@ -721,11 +773,30 @@ static void search_conf(void)
 		dialog_input += strlen(CONFIG_);
 
 	sym_arr = sym_re_search(dialog_input);
-	res = get_relations_str(sym_arr, NULL);
+
+	do {
+		LIST_HEAD(head);
+		struct menu *targets[10];
+		int keys[JUMP_NB + 1], i;
+		struct update_text_data data = {
+			.head = &head,
+			.targets = targets,
+			.keys = keys,
+		};
+
+		res = get_relations_str(sym_arr, &head);
+		dres = show_scroll_win_ext(main_window,
+				"Search Results", str_get(&res),
+				keys, &update_text, &data);
+		again = false;
+		for (i = 0; i < JUMP_NB && keys[i]; i++)
+			if (dres == keys[i]) {
+				conf(targets[i]->parent);
+				again = true;
+			}
+		str_free(&res);
+	} while (again);
 	free(sym_arr);
-	show_scroll_win(main_window,
-			"Search Results", str_get(&res));
-	str_free(&res);
 	str_free(&title);
 }
 
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 9aedf40f1dc0..44ab0e43c626 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -497,10 +497,19 @@ void refresh_all_windows(WINDOW *main_window)
 	refresh();
 }
 
-/* layman's scrollable window... */
+/* Discards const qualifier, but char *text
+ * won't be modifed unless update_text_fnupdate_text is not NULL.
+ */
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
 		const char *text)
+{
+	(void)show_scroll_win_ext(main_window, title, (char *)text, (int []) {0}, NULL, NULL);
+}
+
+/* layman's scrollable window... */
+int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
+			 int *keys, update_text_fn update_text, void *data)
 {
 	int res;
 	int total_lines = get_line_no(text);
@@ -514,6 +523,7 @@ void show_scroll_win(WINDOW *main_window,
 	WINDOW *win;
 	WINDOW *pad;
 	PANEL *panel;
+	bool done = false;
 
 	getmaxyx(stdscr, lines, columns);
 
@@ -549,8 +559,11 @@ void show_scroll_win(WINDOW *main_window,
 	panel = new_panel(win);
 
 	/* handle scrolling */
-	do {
-
+	while (!done) {
+		if (update_text) {
+			update_text(text, start_y, start_y + text_lines, data);
+			fill_window(pad, text);
+		}
 		copywin(pad, win, start_y, start_x, 2, 2, text_lines,
 				text_cols, 0);
 		print_in_middle(win,
@@ -593,8 +606,15 @@ void show_scroll_win(WINDOW *main_window,
 		case 'l':
 			start_x++;
 			break;
+		default:
+			for (i = 0; keys[i]; i++) {
+				if (res == keys[i]) {
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
@@ -606,9 +626,10 @@ void show_scroll_win(WINDOW *main_window,
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
index 6f925bc74eb3..747b30a4cd0f 100644
--- a/scripts/kconfig/nconf.h
+++ b/scripts/kconfig/nconf.h
@@ -67,6 +67,9 @@ typedef enum {
 
 void set_colors(void);
 
+typedef void (*update_text_fn)(char *buf, size_t start, size_t end, void
+			       *_data);
+
 /* this changes the windows attributes !!! */
 void print_in_middle(WINDOW *win, int y, int width, const char *str, int attrs);
 int get_line_length(const char *line);
@@ -78,6 +81,8 @@ int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
 		const char *init, char **resultp, int *result_len);
 void refresh_all_windows(WINDOW *main_window);
+int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
+			 int *keys, update_text_fn update_text, void *data);
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
 		const char *text);
-- 
2.40.0

