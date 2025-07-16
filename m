Return-Path: <linux-kbuild+bounces-8022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E0B08101
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jul 2025 01:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B4CE565736
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jul 2025 23:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADB02F362C;
	Wed, 16 Jul 2025 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNwZc6JC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BADE2F2C73;
	Wed, 16 Jul 2025 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708353; cv=none; b=TNzMzBMjSfB5WPYTjaANgDplnLq9JLJUWxzIyivEl+B1VV9SMNd1ADTw+CR7Ie/sVwIOfUtokbdOhtdpgEqZVQE99kIPpWf9GPn+2FyxaU+g/CHSqOTBUExIdAcmHlLtaCo9s4ud6hNBecoQm6suFymXovcj4t6bQKFNY+I9kiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708353; c=relaxed/simple;
	bh=tI5mvT66Rm/lpoF3NhwuTmLXhid+pDYJjtfSR7IyuG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLvr737dkmVnHEDGDtTaU7SRED0fwZvWsBK07D+hjuuk0eJDg9vJk7VUngJWKsUmXEajfc956LWxS3WYFTTm8GCsRqvL8pY/M1Erzc6vI03gMowFShojyitJjbSrT4oS8g3+LsEgbB0iImjrbg56FM98A73IjN2rVbeCRuhHNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNwZc6JC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793E8C4CEEB;
	Wed, 16 Jul 2025 23:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752708353;
	bh=tI5mvT66Rm/lpoF3NhwuTmLXhid+pDYJjtfSR7IyuG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XNwZc6JCuzw2WNstXgyx/8YBuEGUz56WHQqyba30DKYh+CnWwgVFRNLuHvdvol7TF
	 9yIhhQ2GZK+R2MN9adnpXHHkgX5SYaV0KXvGZfVey57eOn+wCeqjT7OgrenoyOY2jl
	 XtdWPWzhQi32NQ+6DtkqGZ00OxaysYVajo+0yxEw7C3I89JaFLacrnnhebJgD6buNb
	 aaaKTdcU6mcTKB+8FO0mUQQ+Wss7sccaoh8QPKZdYqxuxrIfiY8A2jC+i3WIdiJrix
	 47TzeD4iUkp8KAkFyQm+/3bjRAcCYmChbt1I8y2NflJYFgfFWjgOByT1LmsHgDyG3m
	 /WwEKNvzWQ4Ig==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] kconfig: gconf: refactor text_insert_help()
Date: Thu, 17 Jul 2025 08:24:13 +0900
Message-ID: <20250716232542.873747-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716232542.873747-1-masahiroy@kernel.org>
References: <20250716232542.873747-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

text_insert_help() and text_insert_msg() share similar code.
Refactor text_insert_help() to eliminate the code duplication.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 651140af7d13..8b164ccfa008 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -64,32 +64,6 @@ static void conf_changed(bool dirty)
 
 /* Utility Functions */
 
-
-static void text_insert_help(struct menu *menu)
-{
-	GtkTextBuffer *buffer;
-	GtkTextIter start, end;
-	const char *prompt = menu_get_prompt(menu);
-	struct gstr help = str_new();
-
-	menu_get_ext_help(menu, &help);
-
-	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
-	gtk_text_buffer_get_bounds(buffer, &start, &end);
-	gtk_text_buffer_delete(buffer, &start, &end);
-	gtk_text_view_set_left_margin(GTK_TEXT_VIEW(text_w), 15);
-
-	gtk_text_buffer_get_end_iter(buffer, &end);
-	gtk_text_buffer_insert_with_tags(buffer, &end, prompt, -1, tag1,
-					 NULL);
-	gtk_text_buffer_insert_at_cursor(buffer, "\n\n", 2);
-	gtk_text_buffer_get_end_iter(buffer, &end);
-	gtk_text_buffer_insert_with_tags(buffer, &end, str_get(&help), -1, tag2,
-					 NULL);
-	str_free(&help);
-}
-
-
 static void text_insert_msg(const char *title, const char *msg)
 {
 	GtkTextBuffer *buffer;
@@ -109,6 +83,15 @@ static void text_insert_msg(const char *title, const char *msg)
 					 NULL);
 }
 
+static void text_insert_help(struct menu *menu)
+{
+	struct gstr help = str_new();
+
+	menu_get_ext_help(menu, &help);
+	text_insert_msg(menu_get_prompt(menu), str_get(&help));
+	str_free(&help);
+}
+
 static void _select_menu(GtkTreeView *view, GtkTreeModel *model,
 			 GtkTreeIter *parent, struct menu *match)
 {
-- 
2.43.0


