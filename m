Return-Path: <linux-kbuild+bounces-7640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62357AE6A3C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EAC23BE5B3
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47092DFA39;
	Tue, 24 Jun 2025 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnkTGZYR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA362DFA34;
	Tue, 24 Jun 2025 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777662; cv=none; b=AmhAQN1WiSw/jJw3nePdoZQH3sr4AyQ1Kg2B287XJy1vpe9zxovB7Xp2fyihTww6fJ3exhTdpccG6CKIfASzi3ff1MRAPG8IkVAfCxwfZLryX1Qrp5yhqaJTRL7J7obtO+xD35n2XBTkB6F81/aZXUKxtL2vcsBZnsMDOq+4TLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777662; c=relaxed/simple;
	bh=6aZeWjP2ooNcf5Y5X6PkZZB668cTXDKBy45bbSWCQcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbWmVO2D0fBo85o0ZbiER5JB5hPzLRrJgxcXYTCdpXGZy/l4aRbjZLp4u1PZiQtAb/QeOuIjIf/gUx/YvpS5YoqPUgSaGd6zqMnj569z21mXQz1BQlC7Mm1uYBYnoFd+Mvqpe8eSEKKyAM3ch+Y2+688lmoevpp2t51IWRO39kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnkTGZYR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07685C4CEE3;
	Tue, 24 Jun 2025 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777662;
	bh=6aZeWjP2ooNcf5Y5X6PkZZB668cTXDKBy45bbSWCQcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nnkTGZYROw9zSekRUQ+vCs/iYvwYmqkvMtFRyaJp3ZZJMfcxEe9m01kIoZRCMzBYn
	 ZpoeeJVDC5J3bu4EvHD6TrA2LNqqKYCm77aJ6ncfO36Chxs5WJH1ThGyRJGQ1/XpM2
	 VP1/JFyAs8DWWMrgTHtKomdrSlKMHmwB1UPihVoWis1F2kG5I0nA1sl2QSvK8dHpsI
	 yinvxur3l6TOVtDYO8xS9a6xJhWJAtdZmeqoSZ0+mg3oSKwuHhmiUKyKp5RCBOsx/5
	 /UR1dKX33yMK4gPaYdcydq+O7OQfKwoaNlwEs1wBBlaoPVtDlD1PsJBvvfUDUazTJF
	 3iY9PZ8HuBMpQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/66] kconfig: gconf: remove gtk_tree_view_column_set_visible() calls
Date: Wed, 25 Jun 2025 00:05:01 +0900
Message-ID: <20250624150645.1107002-14-masahiroy@kernel.org>
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

The columns are visible by default.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 32e5e9054846..a027f0f10af9 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -297,17 +297,6 @@ static void init_right_tree(void)
 	g_signal_connect(G_OBJECT(renderer), "edited",
 			 G_CALLBACK(renderer_edited), NULL);
 
-	column = gtk_tree_view_get_column(view, COL_NAME);
-	gtk_tree_view_column_set_visible(column, show_name);
-	column = gtk_tree_view_get_column(view, COL_NO);
-	gtk_tree_view_column_set_visible(column, show_range);
-	column = gtk_tree_view_get_column(view, COL_MOD);
-	gtk_tree_view_column_set_visible(column, show_range);
-	column = gtk_tree_view_get_column(view, COL_YES);
-	gtk_tree_view_column_set_visible(column, show_range);
-	column = gtk_tree_view_get_column(view, COL_VALUE);
-	gtk_tree_view_column_set_visible(column, show_value);
-
 	for (i = 0; i < COL_VALUE; i++) {
 		column = gtk_tree_view_get_column(view, i);
 		gtk_tree_view_column_set_resizable(column, TRUE);
-- 
2.43.0


