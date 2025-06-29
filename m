Return-Path: <linux-kbuild+bounces-7744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF79AECFAF
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9D251742F7
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB43723F41A;
	Sun, 29 Jun 2025 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKLeb3r9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DCA23F40D;
	Sun, 29 Jun 2025 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222771; cv=none; b=Z4zFnIDEdSeSBBg/OOhEjtVvuFKKzqSiaB7jfujE/Wo84uPzNJQ/rKwLqWRA2bTy1lY0IZlxzQ9XagKq2QNrIFHjB+E/m+TZnV5k2pMCV7+g9i7HpG44SZs2elFi5SJvAKaJYiiwQMMOACLkmj4agZep6gPvvA5zA9rgdIsL4aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222771; c=relaxed/simple;
	bh=X3jgJT8VNir8prle5lakX6QW3Re155CrCoep6yrae3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0yxhOn3E4XOfz8SoR2TFoIsp5Obxmlv0ZohYO3LwEMo6SBsL2Dp+biufxYYVuhATDLq8alUH6gJC5iNw0MzzQRkjTV1cGv7phl3hCqZgK5FsuuR0HisvfgPgWvtfotfbV8Oq+1QUJHQCtVR8qU21Pbg5fllRYATLKbcLV5XR4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKLeb3r9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC3DC4CEF0;
	Sun, 29 Jun 2025 18:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222771;
	bh=X3jgJT8VNir8prle5lakX6QW3Re155CrCoep6yrae3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mKLeb3r95XOHP9Mugoh6sagddoFYt41QDu3DLr7c7t0ThAuR2d8D12uKLsFXz/7cn
	 SeliyoEJ3kDLrAkz8vE+T1Y22qruCIVyH5n2W0vDDL4DQu9UA3Ct+UWaG3jTlctKqo
	 mukYq7YxdS/nk8KssDGwA5mIPAWDJ2BdrcRjvDR0AnlU1Oz6+TIzY+yFCuug2MndtF
	 CT1+qWfosPmDjsvaPnDyX0JThw99tyj3a/AB6WmdQikuNiBeKxAcT4XvushtXeVQEZ
	 wnLf0NeicF9Y1tYP9q7vds6BSR18vRfbRtywYy5RcYN+qPa58NLDU8VvL0j2TWcGWR
	 kaVXXDITtdSBg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] kconfig: gconf: show GTK version in About dialog
Date: Mon, 30 Jun 2025 03:43:35 +0900
Message-ID: <20250629184554.407497-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
References: <20250629184554.407497-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Likewise xconfig, it is useful to display the GTK version in the About
dialog.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/gconf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 2a4481b4b523..e43d83dcdfb8 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -523,7 +523,11 @@ static void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data)
 	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
-					GTK_BUTTONS_CLOSE, "%s", about_text);
+					GTK_BUTTONS_CLOSE, "%s\nGTK version: %d.%d.%d",
+					about_text,
+					gtk_get_major_version(),
+					gtk_get_minor_version(),
+					gtk_get_micro_version());
 	gtk_dialog_run(GTK_DIALOG(dialog));
 	gtk_widget_destroy(dialog);
 }
-- 
2.43.0


