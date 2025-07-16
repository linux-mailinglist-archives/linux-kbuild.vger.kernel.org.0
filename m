Return-Path: <linux-kbuild+bounces-8020-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDCBB080FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jul 2025 01:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB6147AFA89
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jul 2025 23:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CEB2F2346;
	Wed, 16 Jul 2025 23:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmR7DXoc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410782F0032;
	Wed, 16 Jul 2025 23:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708351; cv=none; b=lMMTfg74dDjkLRawnHjhnlBQyn9kMEa4j/ntD+Lc6UvNWTLXtsUS3X1bM/vBt82gdxbQXXkFWLUWKP/rsILY7T4JyEs7tWyKaa0kfzk/EM/+bSGpQSLvi5coOGZdrSZdakTv7Vx2XjzJ75OwrdIA8rWXyWbjBkk399TO2IWD234=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708351; c=relaxed/simple;
	bh=JjRUucMTKccJjykzPaVJ2fRdMkCeasEZKi4WwB0xIYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fh8Rv/woNb+M8BS0qNYN7vEfQVAtM4hdiBI0nCFIqm67Io+13nLZ7toM/tzxiu0ndgsCWj7AttMeBkchLrBItIVLkeT1ijx35bP+OAjn0cqce+FWWOnVmstEChvfFU8YCHkSZ86/MIqTc1OpbRHDKobsUrEZspHnndMYqjmza68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmR7DXoc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC08C4CEEB;
	Wed, 16 Jul 2025 23:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752708350;
	bh=JjRUucMTKccJjykzPaVJ2fRdMkCeasEZKi4WwB0xIYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FmR7DXocPVmGf7E41bGnm5R7okiAeqXQ3Y6uC0CRU5iEKEh0Vg62ido6aWfsriS8j
	 ZFM8HvFPeRMZOHTHS3LRUq/JiRtFFS9Xp3agqWuu53rsHskXDDgAVuvUnTOeQEAf8V
	 fAMxYjAkhADK99QJSYgpOJ3Vt50BxevjX3alNjRrZ8woaeDthn2UQ+Fu0kHzWdZNz9
	 vXjyzQeF1pH4CPc9nXolrMEh5oC7DKGjkdCG/ZUnCTZbogs6G4wgSYDvC+HY8lPFVz
	 LoD7gRXDDGpvJD/ifl1SNGTGxkkClvlHEyjHPYWC7rB53R9mWxJl5bpSGHNJdExl2J
	 NV/XKsuMgBH6Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] kconfig: gconf: use hyphens in signals
Date: Thu, 17 Jul 2025 08:24:11 +0900
Message-ID: <20250716232542.873747-4-masahiroy@kernel.org>
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

Using hyphens in signal names is the official convention, even though
underscores also work.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index d9ea71664412..e4f89270d19f 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -997,25 +997,25 @@ static void init_main_window(const gchar *glade_file)
 			 G_CALLBACK(on_window1_destroy), NULL);
 	g_signal_connect(main_wnd, "configure-event",
 			 G_CALLBACK(on_window1_configure), NULL);
-	g_signal_connect(main_wnd, "delete_event",
+	g_signal_connect(main_wnd, "delete-event",
 			 G_CALLBACK(on_window1_delete_event), NULL);
 
 	hpaned = GTK_WIDGET(gtk_builder_get_object(builder, "hpaned1"));
 	vpaned = GTK_WIDGET(gtk_builder_get_object(builder, "vpaned1"));
 	tree1_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview1"));
-	g_signal_connect(tree1_w, "cursor_changed",
+	g_signal_connect(tree1_w, "cursor-changed",
 			 G_CALLBACK(on_treeview2_cursor_changed), NULL);
-	g_signal_connect(tree1_w, "button_press_event",
+	g_signal_connect(tree1_w, "button-press-event",
 			 G_CALLBACK(on_treeview1_button_press_event), NULL);
-	g_signal_connect(tree1_w, "key_press_event",
+	g_signal_connect(tree1_w, "key-press-event",
 			 G_CALLBACK(on_treeview2_key_press_event), NULL);
 
 	tree2_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview2"));
-	g_signal_connect(tree2_w, "cursor_changed",
+	g_signal_connect(tree2_w, "cursor-changed",
 			 G_CALLBACK(on_treeview2_cursor_changed), NULL);
-	g_signal_connect(tree2_w, "button_press_event",
+	g_signal_connect(tree2_w, "button-press-event",
 			 G_CALLBACK(on_treeview2_button_press_event), NULL);
-	g_signal_connect(tree2_w, "key_press_event",
+	g_signal_connect(tree2_w, "key-press-event",
 			 G_CALLBACK(on_treeview2_key_press_event), NULL);
 
 	text_w = GTK_WIDGET(gtk_builder_get_object(builder, "textview3"));
-- 
2.43.0


