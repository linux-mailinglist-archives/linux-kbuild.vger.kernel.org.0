Return-Path: <linux-kbuild+bounces-7641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D814AE6A3D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91AF3BA932
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A632DFA4F;
	Tue, 24 Jun 2025 15:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHcsCrr8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA672DFA4C;
	Tue, 24 Jun 2025 15:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777664; cv=none; b=bRbMTIOvEUWbhcYJu8BEKKxk0ZUWWA5wqYR3PKaFR9lBMzqsdbaruATEAP5HBUVi0QTBrXHaK+CSDhT+MA0oiaDZB4/QbBPa0a40iMOWXYNQcsYGJaynnidcI5ewgOlpS54DkyB2nKhCG9T3TDrTnHp6AdBKaOrPaP+I0BGUSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777664; c=relaxed/simple;
	bh=xSqsSj+re36b61uvUAgbmU3+DgEFWWE9SuCGgwtwW8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZAFJA23zAlS6qS5Uj3Mgi5FuKznOm2MN7g3ub7QzjBEHC/61lNcvpNsOWkjIE6M/jTtNEuSdN9Ensi0cnwewpeXnWUoJV4R2hoL6BBF+CcTL8GNyLXHdV22lP5G/QcVlMg69GRrDbRZpIn9xsUntL4ArvhD5gcUXjRvgVXSY/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHcsCrr8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FC2C4CEEE;
	Tue, 24 Jun 2025 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777664;
	bh=xSqsSj+re36b61uvUAgbmU3+DgEFWWE9SuCGgwtwW8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PHcsCrr8uRn+WWzcCar9rFKcnLnlBfKFqs1m+6QzBNHU7qsGKfXy91hVD6Jay62EP
	 H5JD4VpqjjrWu74mGMpgx2nxQQq3KMVLnuP5AWQCnXXO6qsK2Egb1P922WPYdkFA+p
	 mF/m/sIgOGerdp5A4KsGiDmr9rNXdthzDIu45Z+1yKdHrNx8c3Nw5qFbzx1rs3Bm6e
	 fivX8QU52bsdGhpRrmdzEw7I1LcKdBWSyDtuvwUy0OnFpYs2kEHcExlN1gSIVFJWns
	 v4RHpJjMPijdKMs9vNTm8N1ihrT44N/mRhyWMEN0h2uAHBDQ9KhxAX1GEkFwrsx3Qs
	 s3cHNrmbZVAaA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/66] kconfig: gconf: remove gtk_widget_realize() calls
Date: Wed, 25 Jun 2025 00:05:02 +0900
Message-ID: <20250624150645.1107002-15-masahiroy@kernel.org>
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

This function is primarily used in widget implementations, and isn't
very useful otherwise.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index a027f0f10af9..3f9b9957f089 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -215,7 +215,6 @@ static void init_left_tree(void)
 
 	sel = gtk_tree_view_get_selection(view);
 	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
-	gtk_widget_realize(tree1_w);
 }
 
 static void renderer_edited(GtkCellRendererText * cell,
@@ -967,7 +966,6 @@ on_treeview1_button_press_event(GtkWidget * widget,
 		display_tree_part();
 	}
 
-	gtk_widget_realize(tree2_w);
 	gtk_tree_view_set_cursor(view, path, NULL, FALSE);
 	gtk_widget_grab_focus(tree2_w);
 
-- 
2.43.0


