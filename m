Return-Path: <linux-kbuild+bounces-3046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4989F954C32
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 16:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEEBA1F24C16
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 14:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEF31BCA1F;
	Fri, 16 Aug 2024 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRIFLngT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B01BC9EE;
	Fri, 16 Aug 2024 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723817918; cv=none; b=Wa6Cdl7omOuszy1SmiDdNo+FERdqgzFwufbTG8FB6Vu6t8raKJ7STuragZ3ZQ/qwgqpknaOf58YwYrJCUA5VQ0XoXQi3A88/TCSlrIcwW4DFjufwQHx7IQpfnIt3WAfoepC56W1DIiMgnvJwxQZHTB/4xjc4383t0g9vhVes9u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723817918; c=relaxed/simple;
	bh=6s1X/yim/os0KvKwXZnT0EOIBvJiMInJinxLsb6mQqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IabnAONKQubD/ikp4a/Q3YhXmCnbboowCYkoBirqVgjQ4Fn7jS4u8V+m6vwKpOU4gkFRE7da4JgltsFisj/vyScvWlk4GG3bo+Ae8A3Y7sxlfu1kae64DL77C3Ibk5ud7G8fJ+8h6QbW765sJRpKluMo6hPTrMPgkbybjGGsPTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRIFLngT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3695d7def13so38669f8f.1;
        Fri, 16 Aug 2024 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723817914; x=1724422714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CqX20iq2/XIG4GWJ7DbDXzmJBihuil9zRpJSWXBasFk=;
        b=lRIFLngTpHTThTQbb50nJ2VKDR7FEAR7znOcB0HQzE62HrM5Hftt7pqmSTru+n7Sle
         3alYFtCZ/JwNlp8ndSaQpi7d9WWfOI9+3UGKA23hksDeQYkFFU0gUywuBiC9g8lrub+G
         LQGb4AedSOE+Y5p0vpv0tfvtgpL9JrOxEF5CkONR9IBwQ2nGQRFsaFwzpIFy2+Kd2Nhd
         6Rdf5uJ7AGNgxFF+cpD+jirwibEgugIih/6+I66nBZm7OTBGz/PItXD4SYmqQAQ7Icyr
         R7Z7FY1p5pvDsJjT4XRw/xKPOrAmFlgtPYJ++D2Pw4ipPt/TE8jDR+dRT8NpvcNTo8Iy
         lSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723817914; x=1724422714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqX20iq2/XIG4GWJ7DbDXzmJBihuil9zRpJSWXBasFk=;
        b=iwcg6iEPzz4lIvIZl9DTbTPr80+byjkr6gV2x3SGIfgHmBnyiGplOtHzz+vvlKi+WP
         V8IVyx3gFro3ieLtCp5E+4fFxzOJDgg6QOpMfbHjhc292OQYZ5mGJOxsHyVTAJ7le2us
         SFRAKJJXnPyv+CSEKqeJ9ZX2J5RUTL47PB36T5HGAYsa09nIMORY7JTQ86eJ/iEZ1wqi
         JhoMfOAD7T+dHXxbsHhJe1Kp6ssMqgXvzFHpsJHXZowj+ZqcyzVf8P0Q+8oS2TarkFpM
         QZjLs+YJlR6SMBGLgs8J+fuDAbrlPClmX9JNIxKRdDpSAfUCw9DVyx6yAectnKPmjrlT
         /gxA==
X-Forwarded-Encrypted: i=1; AJvYcCWUSG3JHlTlodET++7HVXHWfVeA09ptHuAHRavB5Zj07KSbMc3bZu94HfJ+XpAeYuclghNrqQp/TqohsGlAGwgKNc+AoUHAwQDXvknu5Ss+0brCQgGJD5VsSGSrDniBkglKWRM00IFfAa+U
X-Gm-Message-State: AOJu0Yw+mf7PqeUrm5PmW8obEwRxkLE6pm95a/rsGLqNv+17C/Rc+WTV
	C+UopWiM1HLTFWhl05hRuEALibsRut8BRN2+02Q96u9SohbgHb6X
X-Google-Smtp-Source: AGHT+IHYJZZdfnjVIn1Uima+H30cq210UxeMRPPoRs2aVjIC8AzWGAmRJieUMwjz94pHu1h57h3udA==
X-Received: by 2002:a05:6000:1fa3:b0:368:654:932b with SMTP id ffacd0b85a97d-37194328ab3mr1354005f8f.4.1723817914156;
        Fri, 16 Aug 2024 07:18:34 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([2a01:4b00:d20e:7300:78fd:3b8c:c4a9:4062])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm3723026f8f.52.2024.08.16.07.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 07:18:33 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: masahiroy@kernel.org
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	isak01@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] menuconfig: Allow sorting the entries alphabetically
Date: Fri, 16 Aug 2024 15:18:31 +0100
Message-Id: <20240816141831.104085-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the functionality which allows to sort the Kconfig entries
alphabetically if user decides to. It may help finding the desired entry
faster, so the user will spend less time looking through the list.

The sorting is done on the dialog_list elements in the 'dialog_menu'
function, so on the option "representation" layer. The sorting could be
enabled/disabled by pressing the '>' key. The labels are sorted in the
following way:

1. Put all entries into the array (from the linked list)
2. Sort them alphabetically using qsort and custom comparator
3. Restore the items linked list structure

I know that this modification includes the ugly heruistics for
extracting the actual label text from "    [ ] Some-option"-like
expressions (to be able to alphabetically compare the labels), and I
would be happy to discuss alternative solutions.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 scripts/kconfig/lxdialog/dialog.h  |  5 +-
 scripts/kconfig/lxdialog/menubox.c |  7 ++-
 scripts/kconfig/lxdialog/util.c    | 79 ++++++++++++++++++++++++++++++
 scripts/kconfig/mconf.c            |  9 +++-
 4 files changed, 97 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/lxdialog/dialog.h b/scripts/kconfig/lxdialog/dialog.h
index f6c2ebe6d1f9..a036ed8cb43c 100644
--- a/scripts/kconfig/lxdialog/dialog.h
+++ b/scripts/kconfig/lxdialog/dialog.h
@@ -58,6 +58,8 @@
 #define ACS_DARROW 'v'
 #endif
 
+#define KEY_ACTION_SORT 11
+
 /* error return codes */
 #define ERRDISPLAYTOOSMALL (KEY_MAX + 1)
 
@@ -127,6 +129,7 @@ void item_set_selected(int val);
 int item_activate_selected(void);
 void *item_data(void);
 char item_tag(void);
+void sort_items(void);
 
 /* item list manipulation for lxdialog use */
 #define MAXITEMSTR 200
@@ -196,7 +199,7 @@ int dialog_textbox(const char *title, const char *tbuf, int initial_height,
 		   int initial_width, int *_vscroll, int *_hscroll,
 		   int (*extra_key_cb)(int, size_t, size_t, void *), void *data);
 int dialog_menu(const char *title, const char *prompt,
-		const void *selected, int *s_scroll);
+		const void *selected, int *s_scroll, bool sort);
 int dialog_checklist(const char *title, const char *prompt, int height,
 		     int width, int list_height);
 int dialog_inputbox(const char *title, const char *prompt, int height,
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 6e6244df0c56..4cba15f967c5 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -161,7 +161,7 @@ static void do_scroll(WINDOW *win, int *scroll, int n)
  * Display a menu for choosing among a number of options
  */
 int dialog_menu(const char *title, const char *prompt,
-		const void *selected, int *s_scroll)
+		const void *selected, int *s_scroll, bool sort)
 {
 	int i, j, x, y, box_x, box_y;
 	int height, width, menu_height;
@@ -181,6 +181,9 @@ int dialog_menu(const char *title, const char *prompt,
 
 	max_choice = MIN(menu_height, item_count());
 
+	if (sort)
+		sort_items();
+
 	/* center dialog box on screen */
 	x = (getmaxx(stdscr) - width) / 2;
 	y = (getmaxy(stdscr) - height) / 2;
@@ -408,6 +411,8 @@ int dialog_menu(const char *title, const char *prompt,
 			delwin(menu);
 			delwin(dialog);
 			goto do_resize;
+		case '>':
+			return KEY_ACTION_SORT;
 		}
 	}
 	delwin(menu);
diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index 964139c87fcb..cc87ddd69c10 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -563,6 +563,85 @@ void item_reset(void)
 	item_cur = &item_nil;
 }
 
+/*
+ * Function skips a part of the label to get the actual label text
+ * (without the '[ ]'-like prefix).
+ */
+static char *skip_spec_characters(char *s)
+{
+	bool unbalanced = false;
+
+	while (*s) {
+		if (isalnum(*s) && !unbalanced) {
+			break;
+		} else if (*s == '[' || *s == '<' || *s == '(') {
+			/*
+			 * '[', '<' or '(' means that we need to look for
+			 * closure
+			 */
+			unbalanced = true;
+		} else if (*s == '-') {
+			/*
+			 * Labels could start with "-*-", so '-' here either
+			 * opens or closes the "checkbox"
+			 */
+			unbalanced = !unbalanced;
+		} else if (*s == '>' || *s == ']' || *s == ')') {
+			unbalanced = false;
+		}
+		s++;
+	}
+	return s;
+}
+
+static int compare_labels(const void *a, const void *b)
+{
+	struct dialog_list *el1 = *((struct dialog_list **)a);
+	struct dialog_list *el2 = *((struct dialog_list **)b);
+
+	return strcasecmp(skip_spec_characters(el1->node.str),
+			  skip_spec_characters(el2->node.str));
+}
+
+void sort_items(void)
+{
+	struct dialog_list **arr;
+	struct dialog_list *cur;
+	size_t n, i;
+
+	n = item_count();
+	if (n == 0)
+		return;
+
+	/* Copy all items from linked list into array */
+	cur = item_head;
+	arr = malloc(sizeof(*arr) * n);
+
+	if (!arr) {
+		/* Don't have enough memory, so don't do anything */
+		return;
+	}
+
+	for (i = 0; i < n; i++) {
+		arr[i] = cur;
+		cur = cur->next;
+	}
+
+	qsort(arr, n, sizeof(struct dialog_list *), compare_labels);
+
+	/* Restore the linked list structure from the sorted array */
+	for (i = 0; i < n; i++) {
+		if (i < n - 1)
+			arr[i]->next = arr[i + 1];
+		else
+			arr[i]->next = NULL;
+	}
+
+	item_head = arr[0];
+
+	free(arr);
+}
+
 void item_make(const char *fmt, ...)
 {
 	va_list ap;
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 3887eac75289..8a961a41cae4 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -749,6 +749,7 @@ static void conf_save(void)
 	}
 }
 
+static bool should_sort;
 static void conf(struct menu *menu, struct menu *active_menu)
 {
 	struct menu *submenu;
@@ -774,9 +775,15 @@ static void conf(struct menu *menu, struct menu *active_menu)
 		dialog_clear();
 		res = dialog_menu(prompt ? prompt : "Main Menu",
 				  menu_instructions,
-				  active_menu, &s_scroll);
+				  active_menu, &s_scroll, should_sort);
 		if (res == 1 || res == KEY_ESC || res == -ERRDISPLAYTOOSMALL)
 			break;
+
+		if (res == KEY_ACTION_SORT) {
+			should_sort = !should_sort;
+			continue;
+		}
+
 		if (item_count() != 0) {
 			if (!item_activate_selected())
 				continue;
-- 
2.34.1


