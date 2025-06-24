Return-Path: <linux-kbuild+bounces-7647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04941AE6A4B
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16FD95A1698
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569052E173F;
	Tue, 24 Jun 2025 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5Rk8JoS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAC32E1739;
	Tue, 24 Jun 2025 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777677; cv=none; b=PWtC7T4L1wJeuKeu4dPG1+PYSDIV9O7S0q/zoiBBPNKKwMnmuNX1jnTqrlc6dAnuksPPBlYrAtQB9DeLgCM/7bF/R1avP8zq+IHuoQCp8heFgj2eLPmL+Jx7efY9DKjRmdF+dUGoobjdaiO2UAwrt1YgdzX8UllYEz/HkCkMtWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777677; c=relaxed/simple;
	bh=nXrZyNxUw9jh8Gl+y4uhwdkkCXCgB5TbFxXYBj8A8ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VERkGqt2I1V2ZUwfVv/mzFeFVej/LBqXxRd2zQ6wITuxTqSoCkm+iYIHtquBUoQ3fgABLQsqZ8J6tKNM/MSMMWIlJNFvSnfAPikrLyJT5I1q2qFPAALNBvJTV7c8hBVxfTyGMjht9CEY4MRzeC7lkmNqYmJTTMRqaMg1S7d2p/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5Rk8JoS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C76C4CEEE;
	Tue, 24 Jun 2025 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777676;
	bh=nXrZyNxUw9jh8Gl+y4uhwdkkCXCgB5TbFxXYBj8A8ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5Rk8JoSfCZL24QdO+W1Jmezb96W0sAw1jxvPybRul6Tq1X1VVDd1UoGhVQDcaJNH
	 hkq/zBQ8+XoOOI2BilfxIrzc80bDRsoWgYPDPMC06KbJFoftmkPtZdfZDExD/HQHQo
	 4Qf9QUH7X+lHoSF7LDbxjZl4ooc0ECcDvyc44hgYgWBo//gCoxH3O52V0IjoLxYNB4
	 c140BAOmYjgaiVIWvtSoMHpOnt/iuGDqd0za7iXZ29cuSOVFk2sbN/bEQDjq0/IKB1
	 AEt7LolTI5kbfDLg2s+1eD7VMbfnvJjxHJf7hAAvJ22FHuPGSY3CbsC04tGCiixTvX
	 ET7zs/9W+d37Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/66] kconfig: gconf: remove unneeded variable in on_split_clicked()
Date: Wed, 25 Jun 2025 00:05:08 +0900
Message-ID: <20250624150645.1107002-21-masahiroy@kernel.org>
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

The height of the window is not used here. Passing NULL to
gtk_window_get_default_size() is allowed. [1]

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gtk/gtkwindow.c#L3974

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 2ab000adcced..c78eded5c01b 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -673,10 +673,10 @@ void on_single_clicked(GtkButton * button, gpointer user_data)
 
 void on_split_clicked(GtkButton * button, gpointer user_data)
 {
-	gint w, h;
+	gint w;
 	view_mode = SPLIT_VIEW;
 	gtk_widget_show(tree1_w);
-	gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
+	gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, NULL);
 	gtk_paned_set_position(GTK_PANED(hpaned), w / 2);
 	gtk_tree_store_clear(tree2);
 	display_list();
-- 
2.43.0


