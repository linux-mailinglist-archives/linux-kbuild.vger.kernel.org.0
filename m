Return-Path: <linux-kbuild+bounces-7633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D988EAE6A47
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69C99188BB3F
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E092D8DBB;
	Tue, 24 Jun 2025 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2avx8YD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911472D8DB3;
	Tue, 24 Jun 2025 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777647; cv=none; b=VVum4+acZ0Nlrhx+UFgdUpfte5YNCCsqiuBsdngeSKkPLFgFDVk7zBnKArXWiiRLfd/bSacwJS+NPwhEXgSgjduqXqs1P55BT8fvBJAQMpQX11xhEitZ2KC1podDU0bVvlIzgbFSfxu7MW1lhTKj+8acDIHovPZPpRLE6qluOIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777647; c=relaxed/simple;
	bh=Df7CTgkd1sYa7DgXpsj70h5CzI6BGbH2lgQBkKTKQ9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRw5puirgTuA8FjVbhkuHtdwGxefP9cSrkbc+z6YFR/1ocf5kLbtjaU3wUfNNBcvy3Itwa1yO+5+UbllLyV2PtLw0//goPSyzcJ2GtXzlTy4NrUpYWYNzZP3HeTN5J61EjNRJBQ+iQbXtImih4PI7vg7m9yvBvkZj1ondpDO0YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2avx8YD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01A6C4CEEE;
	Tue, 24 Jun 2025 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777647;
	bh=Df7CTgkd1sYa7DgXpsj70h5CzI6BGbH2lgQBkKTKQ9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S2avx8YDxnqiCHqEDYeZSRzuyTfc/6EdYLAKGlF+BB5cNIpVpcjayHXRCQ1wVYF5i
	 M8/4YYThlKDMe7Br0+Eamhretf0BQDgVf+ND60EJbEb+8iZ67dvW/flsLaiu6lCEkv
	 wRbXqWyZOXjNEK6jH86lkbNZoYFWoZY+xqljIsAFgizoGwSeRS5/IT/oYyOVLZrf3X
	 KSEBpAvmCMCmNamcqniqox6ceTwKnp5kwiatZL+bjd9d9br6wBAqbOrRXqWf0Y1f9K
	 YVG6RD90Zhi9OM4jZTOSIHFkFNW1sD46NaDPatEKrRUrXS9fkFrLuHmgV7AVvOeBqX
	 n5tOIz5EBnJiw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/66] kconfig: gconf: make columns resizable
Date: Wed, 25 Jun 2025 00:04:54 +0900
Message-ID: <20250624150645.1107002-7-masahiroy@kernel.org>
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

The variable "resizeable" is a typo and always set to FALSE, resulting
in dead code in init_right_tree(). It is unclear column resizing should
be disabled. Enable it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index c0f46f189060..a3978d3420d1 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -30,7 +30,6 @@ static gint view_mode = FULL_VIEW;
 static gboolean show_name = TRUE;
 static gboolean show_range = TRUE;
 static gboolean show_value = TRUE;
-static gboolean resizeable = FALSE;
 static int opt_mode = OPT_NORMAL;
 
 GtkWidget *main_wnd = NULL;
@@ -312,11 +311,9 @@ static void init_right_tree(void)
 	column = gtk_tree_view_get_column(view, COL_VALUE);
 	gtk_tree_view_column_set_visible(column, show_value);
 
-	if (resizeable) {
-		for (i = 0; i < COL_VALUE; i++) {
-			column = gtk_tree_view_get_column(view, i);
-			gtk_tree_view_column_set_resizable(column, TRUE);
-		}
+	for (i = 0; i < COL_VALUE; i++) {
+		column = gtk_tree_view_get_column(view, i);
+		gtk_tree_view_column_set_resizable(column, TRUE);
 	}
 
 	sel = gtk_tree_view_get_selection(view);
-- 
2.43.0


