Return-Path: <linux-kbuild+bounces-3839-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D579098AA76
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 19:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 997BA286BFB
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 17:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7125194AD1;
	Mon, 30 Sep 2024 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrOKZsaj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD461194A61;
	Mon, 30 Sep 2024 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727715753; cv=none; b=UbyyLVL5pz0H5TzAiktpTZfHGq9rCrbiS1uLTAH3bre+027vOCvBBzzAGKRI1yFNxSxTjgvLqVelvEVELvvUUfP2tc5/lxlhPE8HC0IoKM9dB7H5HMn36zTfMWvwZm06ZYLnLZFs+EccdCQ7sfdDuDtWo/R+Ikpnx8w9CZAtz/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727715753; c=relaxed/simple;
	bh=ACAfKayrCBwfEBotRpavHeP3jFDFI582KrFNfEtbij8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pswrcyVn/lEU5dWemXr4fbZFya6omH0CHIYbC4f3y0rZuwrPSUIc3sFrnHtwF++LAaHa0xWajjgotukrocUgYyUrZnk7gqwrTFBMwhf9pO/xCT6mAMKnwWp3XXXcIJNxWmRU38mK/K0K1/9SmnpKSH6CpFOZq33wHGfcDxJxi1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrOKZsaj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A06C4CECE;
	Mon, 30 Sep 2024 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727715752;
	bh=ACAfKayrCBwfEBotRpavHeP3jFDFI582KrFNfEtbij8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrOKZsajpV7rm1cFbpSuW7gBorFV+EUgNXmhKG6883llZPfwA6UYHaGaXxJ0uN3Qt
	 4sXF6dVigO62tDI56irCsURzAFMs6vkhLjplKEeA+EpHwe/LH8vhp0FhzwmaUvBzI+
	 qg6sSUzQskXVTlXsUGHp9TfVlYLcPuviSBxRICoe4LLMqFca+MEazkZfDYDbOp3GtQ
	 P6AnuEn05PBll+JgqC4zfQkzBIF3JyoQ1ZxkGV6GSEui6QbJuQ3qUP5PsLR7eBCxWF
	 7EKMvOEic5o/9X3As8TpDpi1IafgvrYezTfxKhrrutu2c1O6WZo6VmtL9sIQPWPPvF
	 Sh4mLWmAZouQg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kconfig: qconf: move conf_read() before drawing tree pain
Date: Tue,  1 Oct 2024 02:02:23 +0900
Message-ID: <20240930170226.475324-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930170226.475324-1-masahiroy@kernel.org>
References: <20240930170226.475324-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The constructor of ConfigMainWindow() calls show*View(), which needs
to calculate symbol values. conf_read() must be called before that.

Fixes: 060e05c3b422 ("kconfig: qconf: remove initial call to conf_changed()")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 97fce13e551e..7dba8014ead4 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1505,6 +1505,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 	connect(helpText, &ConfigInfoView::menuSelected,
 		this, &ConfigMainWindow::setMenuLink);
 
+	conf_read(NULL);
+
 	QString listMode = configSettings->value("/listMode", "symbol").toString();
 	if (listMode == "single")
 		showSingleView();
@@ -1906,8 +1908,6 @@ int main(int ac, char** av)
 	configApp->connect(configApp, SIGNAL(lastWindowClosed()), SLOT(quit()));
 	configApp->connect(configApp, SIGNAL(aboutToQuit()), v, SLOT(saveSettings()));
 
-	conf_read(NULL);
-
 	v->show();
 	configApp->exec();
 
-- 
2.43.0


