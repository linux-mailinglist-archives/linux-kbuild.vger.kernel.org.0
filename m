Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFCFE771358
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Aug 2023 05:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjHFDRC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Aug 2023 23:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHFDRB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Aug 2023 23:17:01 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF6E1FE1
        for <linux-kbuild@vger.kernel.org>; Sat,  5 Aug 2023 20:17:00 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-76ad8892d49so306423885a.1
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Aug 2023 20:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691291819; x=1691896619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBdlmY+mC6rev9Riug08va+NbgbHoVlZKCz5N33Aqv8=;
        b=IVO7TLuBl9wQ1/SKTOw4HQfsavx+ZkdOTFG5C3IPv1APexIz+cH7CBVoc4npSZK++a
         iXwGcRwkrx3XQMHCHpQT5/IqnT6AM+yE4xWN5YZKDB2kPMcVSsqb4zhiMwzuvArzglH+
         7oethBAWMF3rGu4IgZEe2adfL3sbXUuW3dyM5nTWEsLrADeI49Yv1Pr/XaK3iisZTF2y
         0nhnRHWCDyEZgK69Y+0PwOI4qh4fKqHI3oS1UzejWraZw8KmtvgF+RG3CxnVSQdCUhkB
         WMJDPMcLcWd5Ee3KEJDvqHkOfo3kLNm97bVPbHGfzmVvSHaQ9v5OE5IL5O9RcNlDdRTQ
         rNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691291819; x=1691896619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBdlmY+mC6rev9Riug08va+NbgbHoVlZKCz5N33Aqv8=;
        b=kIrl9r6Jshx2/jseTAjM6TnYEwo64v76UlZIK4SrhML8CQmYIPAddhGdqn2X4frWKf
         qYJrdhyMU+1J+hW5Ii2ckCrkzSsdqOPqPjz1tpBml4yhXSc3cbqMevc6y1OImZ0ihc6y
         o27y2KeVI0+woixx4go0FSaz+7wEGAS1xsgU2RjDP1fE6HqCpCgn7gOeGSrR9GLRIK4Y
         0p9W0WeuW97vLaLGXX9JZldHAQBdVCjPyqn2AA2eNowW40cl9vhxnwqjCJrsiHiyQvho
         Hh4hGsOymFpy6sTX9xdtbsebcxPuWcGvGNIklHXMb2cdHPIYnTSIyMqBK66OjZPxk5Tw
         TpXA==
X-Gm-Message-State: AOJu0Yya2Nuu1aJUErfeJErSwpJjGoz89EDUT0tR08EtByZ5TXpV5jzW
        KlAXeFeY29yeg11BQa/feDfqjv4DknWU0w==
X-Google-Smtp-Source: AGHT+IHc/3oHN7U/LbkzTBcGl33i4slLzEVqz7ifaSVl0M2KN1G+tkQmHGlaVteIzcw52xJTgLs/5Q==
X-Received: by 2002:a05:620a:1aa5:b0:76c:b2d5:5bbe with SMTP id bl37-20020a05620a1aa500b0076cb2d55bbemr7389410qkb.14.1691291819600;
        Sat, 05 Aug 2023 20:16:59 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab ([2600:4040:57a3:100:4d2:1712:5755:2865])
        by smtp.gmail.com with ESMTPSA id j5-20020a05620a000500b0076cbcf8ad3bsm1696491qki.55.2023.08.05.20.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 20:16:59 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v1] kconfig: nconf: Keep position after jump search
Date:   Sat,  5 Aug 2023 23:16:58 -0400
Message-Id: <20230806031658.1656667-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In this Menuconfig, pressing the key in the (#) prefix will jump
directly to that location. You will be returned to the current search
results after exiting this new menu.

In nconfig, exiting always returns to the top of the search output, not
to where the (#) was displayed on the search output screen.

This patch fixes that by saving the current position in the search.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/r/20230805034445.2508362-1-Mr.Bossman075@gmail.com/
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 scripts/kconfig/nconf.c     |  3 ++-
 scripts/kconfig/nconf.gui.c | 12 +++++++++++-
 scripts/kconfig/nconf.h     |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 172dc8fdd3ef..536332286c2f 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -749,7 +749,7 @@ static void search_conf(void)
 	struct gstr res;
 	struct gstr title;
 	char *dialog_input;
-	int dres;
+	int dres, vscroll = 0, hscroll = 0;
 	bool again;
 
 	title = str_new();
@@ -790,6 +790,7 @@ static void search_conf(void)
 		res = get_relations_str(sym_arr, &head);
 		dres = show_scroll_win_ext(main_window,
 				"Search Results", str_get(&res),
+				&vscroll, &hscroll,
 				handle_search_keys, &data);
 		again = false;
 		if (dres >= '1' && dres <= '9') {
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index bf015895053c..a3f7c921d6c2 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -501,11 +501,12 @@ void show_scroll_win(WINDOW *main_window,
 		const char *title,
 		const char *text)
 {
-	(void)show_scroll_win_ext(main_window, title, (char *)text, NULL, NULL);
+	(void)show_scroll_win_ext(main_window, title, NULL, NULL, (char *)text, NULL, NULL);
 }
 
 /* layman's scrollable window... */
 int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
+			int *vscroll, int *hscroll,
 			extra_key_cb_fn extra_key_cb, void *data)
 {
 	int res;
@@ -522,6 +523,11 @@ int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
 	PANEL *panel;
 	bool done = false;
 
+	if (hscroll)
+		start_x = *hscroll;
+	if (vscroll)
+		start_y = *vscroll;
+
 	getmaxyx(stdscr, lines, columns);
 
 	/* find the widest line of msg: */
@@ -624,6 +630,10 @@ int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
 			start_x = total_cols-text_cols;
 	}
 
+	if (hscroll)
+		*hscroll = start_x;
+	if (vscroll)
+		*vscroll = start_y;
 	del_panel(panel);
 	delwin(win);
 	refresh_all_windows(main_window);
diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
index 912f668c5772..ab836d582664 100644
--- a/scripts/kconfig/nconf.h
+++ b/scripts/kconfig/nconf.h
@@ -81,6 +81,7 @@ int dialog_inputbox(WINDOW *main_window,
 		const char *init, char **resultp, int *result_len);
 void refresh_all_windows(WINDOW *main_window);
 int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
+			int *vscroll, int *hscroll,
 			extra_key_cb_fn extra_key_cb, void *data);
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
-- 
2.40.0

