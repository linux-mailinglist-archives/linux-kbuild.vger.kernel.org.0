Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB01777135C
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Aug 2023 05:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjHFDUe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Aug 2023 23:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHFDUd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Aug 2023 23:20:33 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB9A1FE1
        for <linux-kbuild@vger.kernel.org>; Sat,  5 Aug 2023 20:20:28 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-76571dae5feso270448285a.1
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Aug 2023 20:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691292027; x=1691896827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X9O2OZItrfOAVoQO2D+wLHnWcW9nN78WFWRXGqjAKZs=;
        b=gRyiXpGRuctUXKHPE7cygxYn8jrxpyWFz/SIuSFiVlwWlXAS7IL8W+CZCG3LfGY/XB
         MF/uKfgLf3wJPqJr7HbJrqdda0poST33+B3Qa5mgqoVP7W7rXC/bXjEabqf9kzkuWH/G
         VYTXprTXfp3VD1Sft8b4gXarX9kH24uCJCUVkTqpQnpzvNkXaSoN4iQbYMRPLP1/t/+S
         PhpZ9qOM2qScjLBIkRUZLFxKOHF5XzvDHRc2zpw8johRHL/k76MNbVauuaBi3K1BLnT4
         XQDVnhvXxLABpqOsGIlAU4HUh5mMD7hFGv6kfODduJu7JNXrE2l1nTSEIIgIFXo5fdZC
         1mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691292027; x=1691896827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9O2OZItrfOAVoQO2D+wLHnWcW9nN78WFWRXGqjAKZs=;
        b=d9XIbdmqckd+vejKg2UWF/pRpgdh/dKc7+QV3MZ4ipOhmQp9S/Dw+RELmVEwMkPBYm
         KvRHD9NyCSuiGa903iQqVpeeLUq2Ql8E7LWQ8CfnUSc9KK6mk5kwAdT2z8qApwFCZGsO
         Jt4DL3MJmJj58OBU47OaWS4EeUtSVxjwUz+RXX2TuZW/671W1tGdqx36NZbPvuffqEBI
         nvT2fBJf/6iYQsMrbLwdb+vflUpE+qQItB1xWdj0+13vrwd7EztyNadQxIZ+V+2yuP6v
         BzysyHPuQKtQCxW18X8eUyGQnw7fi9H5IK3is9r7f/dtUAj/Xi+t0sopvldnSb8pzrEx
         V+bQ==
X-Gm-Message-State: AOJu0Ywy8hP+663UwPEEviL5I75wE7iM6owf3lvGll3Bsp91mcjdR+9W
        kfwyzQBa4Pw7NZ9N9DPkZ12xB5gYrulchg==
X-Google-Smtp-Source: AGHT+IGxKO1tUIKCNZ0X9QIFYbfci6rcB3u7DdHNlsFoNw8uULYR/QXRiXVJWLu6AAaKgpIsQE8gig==
X-Received: by 2002:a05:620a:4456:b0:76c:b476:f712 with SMTP id w22-20020a05620a445600b0076cb476f712mr8610051qkp.51.1691292027076;
        Sat, 05 Aug 2023 20:20:27 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab ([2600:4040:57a3:100:4d2:1712:5755:2865])
        by smtp.gmail.com with ESMTPSA id k8-20020a0cf588000000b00631eaf8b9e5sm1876787qvm.138.2023.08.05.20.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 20:20:26 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v1] kconfig: nconf: Keep position after jump search
Date:   Sat,  5 Aug 2023 23:20:26 -0400
Message-Id: <20230806032026.1718752-1-Mr.Bossman075@gmail.com>
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
index bf015895053c..5c54d6fec460 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -501,11 +501,12 @@ void show_scroll_win(WINDOW *main_window,
 		const char *title,
 		const char *text)
 {
-	(void)show_scroll_win_ext(main_window, title, (char *)text, NULL, NULL);
+	(void)show_scroll_win_ext(main_window, title, (char *)text, NULL, NULL, NULL, NULL);
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

