Return-Path: <linux-kbuild+bounces-7655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9961AE6A75
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 953C5189A295
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25742E6D03;
	Tue, 24 Jun 2025 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1aN+PPH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC02D2D3A8C;
	Tue, 24 Jun 2025 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777693; cv=none; b=rEU2e01Waw51hl+2QQZfkHaDWN557voenO5RbjI3mej9nJqdOGpBAH0hyUqIZwJWB4fwfc9IvFAGT6kxgfeA7YKXzeKiizNeHw9Yt5BwvPNm1BOWI9OlMNLm6A8zh/b8dRftamr4hsrCUR4ud57nT0IJhEhXQpFoNq6JLDyhlGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777693; c=relaxed/simple;
	bh=/xvw+d2DNr170zbN4wOZ/bwy5K0kVuVgb6lKgCGnKSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRWShLBSH7Ky/6IAeRiKivIvFtLqGASpBsMVOPyclWHjLgSX+bhoLymwUUkj+FNIOiQEBrjHn1U3L+Ns6B6AkmdOUOQj9myCthxDBS0YD3a7nJ15+Ic66b1NPZXUUj9/mGGxnNf36X87PbiMoVZbaof0pWPJeMaCBIXS5lVFHfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1aN+PPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403D0C4CEE3;
	Tue, 24 Jun 2025 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777693;
	bh=/xvw+d2DNr170zbN4wOZ/bwy5K0kVuVgb6lKgCGnKSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1aN+PPHeMciK+x4HGVeoVftWFXqsfpj0bzYsSBR8LDoEtvUkFr6Zk74U3bFLHISN
	 oeEL29yggnX6VrREF7YJMthwnl7fzYiuY7iGgsk1e55xaUKyeeSlemdutKDBxpH3YM
	 3I6ZYSFahFNR4Gg/mNeWbq5gS5ZhVhqCOTVVm7iE8R7tlwZywezVDlKs99smNphuBe
	 TUUr0KzK3j4jrgZCQn/iKwj74HnBMxVEHzwVFT1ePB5135MJY3F8Euotxy36aKA653
	 8eu7+8QZvMTX4jbmg7RMq+F4Rzb9KmlO9C0U6reqWs/HqYd6p3QpJNjdmudu4g5JOU
	 4MHeWS+utlW9A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 28/66] kconfig: gconf: move button1 initialization below
Date: Wed, 25 Jun 2025 00:05:16 +0900
Message-ID: <20250624150645.1107002-29-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collect the toolbar-related code in one place.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 530ad6aa42d0..bed4c86c2085 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1144,9 +1144,7 @@ static void init_main_window(const gchar *glade_file)
 	tree2_w = glade_xml_get_widget(xml, "treeview2");
 	text_w = glade_xml_get_widget(xml, "textview3");
 
-	back_btn = glade_xml_get_widget(xml, "button1");
-	gtk_widget_set_sensitive(back_btn, FALSE);
-
+	/* menubar */
 	widget = glade_xml_get_widget(xml, "show_name1");
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_name);
@@ -1159,6 +1157,10 @@ static void init_main_window(const gchar *glade_file)
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_value);
 
+	/* toolbar */
+	back_btn = glade_xml_get_widget(xml, "button1");
+	gtk_widget_set_sensitive(back_btn, FALSE);
+
 	save_btn = glade_xml_get_widget(xml, "button3");
 	save_menu_item = glade_xml_get_widget(xml, "save1");
 	conf_set_changed_callback(conf_changed);
-- 
2.43.0


