Return-Path: <linux-kbuild+bounces-3951-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D199561E
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 913811F24B26
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36261212644;
	Tue,  8 Oct 2024 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ff85OgM3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F10E21263D;
	Tue,  8 Oct 2024 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728410528; cv=none; b=GvttdLbGnw67X/eATGpRFdAj+LyYdb2wyX3nAEACIhoc+JrJq6rOYk4z40P8w+ZEQzjjsg7y4uJ7hJ4NIzV7CzKDDyCMoHvyIEPLQKL1l4h/JZpuyM2CcXkyxJ7axXHBrTvIoyE4NsagQwrpEH7NULX5oXaFRq0vZqewLa1o/CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728410528; c=relaxed/simple;
	bh=DlW1BYF5I+ekVrwZJv2kPo1lJwKxZjMXG9k5A5jaR5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwS+N1igOgrcgeWBiZJoXHUBp2eftLfPfqbXPqoAzZKSZd+TN/bdaqyq/zbh7horacCCuuTQtAWy72HWV297uIEwgWrRcAFLGe2+5QJ1p7+vtU52q2FmsRb7iIHvDujlBWdDI58/pkzuD5lq1o8LxzFHnh0n89tzd737RnXtavg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ff85OgM3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB69EC4CECF;
	Tue,  8 Oct 2024 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728410527;
	bh=DlW1BYF5I+ekVrwZJv2kPo1lJwKxZjMXG9k5A5jaR5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ff85OgM3CGOK+2JpR5LdhR7EI2OQ1jKGDhuSHN4jEjRK39YctO28n6p1xGv8kIQi6
	 1o3sxMBtWswlf3bROdu87L/lrprjH0TgatM/aHc2TtR6LdV3xUAVYImWUQWeMod0ZU
	 wTwgNRSmjBWxN1TtmFNIEC3eOoJGWnjN8WwFqIhFpoisvmek0USfBl4504JhUQPZ7f
	 Z25RaeFDDlQqgRjBvZ39X0W2sM32HifxTySJ1bQk7Zk7WCMzhuqN3UEV1VKAhANNWU
	 buJkhePPpcj6kY7n8nrVL6C8joZW03t4woyQMnWHoL/rOnyMNNUEBDvE/vEksjduWA
	 9J8D3gfqzmijQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kconfig: qconf: reorder code in ConfigMainWindow() constructor
Date: Wed,  9 Oct 2024 03:00:07 +0900
Message-ID: <20241008180202.2315986-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008180202.2315986-1-masahiroy@kernel.org>
References: <20241008180202.2315986-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rearrange the code to make the upcoming refactoring easier to understand.

No functional changes intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 202823aad393..2c80e3e1a91a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1340,29 +1340,28 @@ ConfigMainWindow::ConfigMainWindow(void)
 	ConfigItem::menubackIcon = QIcon(QPixmap(xpm_menuback));
 
 	QWidget *widget = new QWidget(this);
-	QVBoxLayout *layout = new QVBoxLayout(widget);
 	setCentralWidget(widget);
 
-	split1 = new QSplitter(Qt::Horizontal, widget);
-	split1->setChildrenCollapsible(false);
-
-	menuList = new ConfigList(widget, "menu");
+	QVBoxLayout *layout = new QVBoxLayout(widget);
 
 	split2 = new QSplitter(Qt::Vertical, widget);
+	layout->addWidget(split2);
 	split2->setChildrenCollapsible(false);
 
-	// create config tree
+	split1 = new QSplitter(Qt::Horizontal, widget);
+	split2->addWidget(split1);
+	split1->setChildrenCollapsible(false);
+
 	configList = new ConfigList(widget, "config");
+	split1->addWidget(configList);
+
+	menuList = new ConfigList(widget, "menu");
+	split1->addWidget(menuList);
 
 	helpText = new ConfigInfoView(widget, "help");
-
-	layout->addWidget(split2);
-	split2->addWidget(split1);
-	split1->addWidget(configList);
-	split1->addWidget(menuList);
 	split2->addWidget(helpText);
-
 	setTabOrder(configList, helpText);
+
 	configList->setFocus();
 
 	backAction = new QAction(QPixmap(xpm_back), "Back", this);
-- 
2.43.0


