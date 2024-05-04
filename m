Return-Path: <linux-kbuild+bounces-1758-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4EB8BBDA9
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C32A1F219FD
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0735C1E880;
	Sat,  4 May 2024 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbM8Sy3A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7D1DDF6;
	Sat,  4 May 2024 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847648; cv=none; b=FnEsCspkVlvE72edKfjMCZbQE4tYBZ3K+BVYWgcqh4jioHr4MFZvF4SUwq3V8Ms3rKMVBxG9xltxWjRkZipDU7f0zCb7KoGsf/gI1XoMPBEANZajqPMAbclqA01zJgPrzN97Je5fZjxU5j7IlpPlU6yvsKR+VYfnE5CV2hFD/pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847648; c=relaxed/simple;
	bh=6HftrSu8b1ezVHLQUken8pjwxsgWWqlDrOx3oimesB8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bKDDfIEKWbkbd51LKCXb5vko66vy+xjAcmjP0qUaeTV3qYEFLNjDdGahyyQkYrkbL7ww/ZxR7mXJDwNGCcXMRz4mzGaeU/nMlI6EpdbaR3ydkzn9upgokcfND8CLjm1ZGhMnV6Jqdhuf0RYDp7yrHCLez//sqNM5eCzKE2cWL8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbM8Sy3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867F5C4AF14;
	Sat,  4 May 2024 18:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847648;
	bh=6HftrSu8b1ezVHLQUken8pjwxsgWWqlDrOx3oimesB8=;
	h=From:To:Cc:Subject:Date:From;
	b=jbM8Sy3AC1Tk8X7gAqQjhvY7QHGeD68MEbLd5IErSc8ps7z+CCJc5u62tNBYIuKQP
	 zT0brJLuDRMEHsaH2kn5d/t/UMwUQCFt4wuDvxfXwDSF+hJi4yvqvYyCsO0THuT4Vk
	 4PSAjsvnsds1WwfvHIALpAhwcQ55AP2dGWLaBAGmLjT+UtgX1x9MiGMvGlfFpIsuiX
	 E1zbrqwxQ55Li3+kxTOs2qgw27ZJU5+lAU7XwGKqt4dsI2s+XlWDBiK9jG6it/anlV
	 Yb0swhaegfUmKHaxIxWbiQSh0PpRBhAvRrOX6By88nlFD3lRksbp8LHGIUdw2hPMGF
	 xyZQSVKcTjPcA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 01/10] kconfig: gconf: redraw pane correctly after loading a config file
Date: Sun,  5 May 2024 03:33:24 +0900
Message-Id: <20240504183333.2031860-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every time a config file is loaded (either by clicking the "Load" button
or selecting "File" -> "Load" from the menu), a new tree structure is
appended to the widget.

The current tree needs to be cleared by calling gtk_tree_store_clear().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 67a27c497c40..12b55f2e369b 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -487,7 +487,7 @@ load_filename(GtkFileSelection * file_selector, gpointer user_data)
 	if (conf_read(fn))
 		text_insert_msg("Error", "Unable to load configuration !");
 	else
-		display_tree(&rootmenu);
+		display_tree_part();
 }
 
 void on_load1_activate(GtkMenuItem * menuitem, gpointer user_data)
@@ -1399,6 +1399,8 @@ static void display_tree_part(void)
 		display_tree(current);
 	else if (view_mode == SPLIT_VIEW)
 		display_tree(browsed);
+	else if (view_mode == FULL_VIEW)
+		display_tree(&rootmenu);
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
 }
 
-- 
2.40.1


