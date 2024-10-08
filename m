Return-Path: <linux-kbuild+bounces-3950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF68999561C
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A68D6281C58
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44621E0DD1;
	Tue,  8 Oct 2024 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLxOv4Uy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB36D1E0086;
	Tue,  8 Oct 2024 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728410526; cv=none; b=N4IT2kemkCxTEC832zX6dlHwatvSlyUGBTKxech8hTs2En0B15XuB6yiLCmgpEyRzxjLUiVd+TkfUGE3iJWVwumdr6Um1Sg2C9JBOZ4Kd+zNiauQUWpFPcgPm4tqjlrP+smWf0M5Uwte3RFmBTgehhTLPjUAbQ4dtGFOEL/FzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728410526; c=relaxed/simple;
	bh=bZm3h8/hH1BGka1NtA4C1l5QJdxDis3k8TsO7flifJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCVkK8PK7z/yBRG4YMSFDfo0A9b7gQlek6pXN/Gvel54qRJknJG9r7kcm4zTpeUUIdHY2K/os0aF4aeegHNdh0R+/Q9ahrM8Zb4rDMdQ/tBiUzirpJ8qU98Z0Nu2k9vNS8N8sB1/5WhyF12yGtpQLwlaiQZOau48/x47Fi6YWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLxOv4Uy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756AAC4CEC7;
	Tue,  8 Oct 2024 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728410526;
	bh=bZm3h8/hH1BGka1NtA4C1l5QJdxDis3k8TsO7flifJo=;
	h=From:To:Cc:Subject:Date:From;
	b=FLxOv4UywXu8Mo22aWFfhhEWKBJO0xQV6JipiDYpRgDZfNTH+QGZTzFokxH+ehGmx
	 h8BIJw9+km8sWQuofV2msH/dG9EzPeFcL/XYN3XefayGSa3lV3Yojxu2mbKiObf9L0
	 dFOkAA2J5b1UtPZXcrbN1r3jQbPBOOl7THLXffhTPoQw+WbVGQFmOlMnrLyXjl7/xt
	 BkZIeKPHQfA98X7QoYPEHVTSckBzjU232L4+osmxqnteo+CSQ7Z9u/yhAa2Sm2vRxv
	 yGx29ZeUFtcsfaTpHFFR5qJmvwIs0P7VUxRqJVq/JzWBx7b/grNqQPzK0WozDCyhCP
	 YTX31FTy6EZUg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kconfig: qconf: set QSplitter orientation in the constructor
Date: Wed,  9 Oct 2024 03:00:06 +0900
Message-ID: <20241008180202.2315986-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The orientation of the QSplitter can be specified directly in its
constructor.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index e260cab1c2af..202823aad393 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1240,8 +1240,7 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 	layout2->addWidget(searchButton);
 	layout1->addLayout(layout2);
 
-	split = new QSplitter(this);
-	split->setOrientation(Qt::Vertical);
+	split = new QSplitter(Qt::Vertical, this);
 	list = new ConfigList(split, "search");
 	list->mode = listMode;
 	info = new ConfigInfoView(split, "search");
@@ -1344,15 +1343,13 @@ ConfigMainWindow::ConfigMainWindow(void)
 	QVBoxLayout *layout = new QVBoxLayout(widget);
 	setCentralWidget(widget);
 
-	split1 = new QSplitter(widget);
-	split1->setOrientation(Qt::Horizontal);
+	split1 = new QSplitter(Qt::Horizontal, widget);
 	split1->setChildrenCollapsible(false);
 
 	menuList = new ConfigList(widget, "menu");
 
-	split2 = new QSplitter(widget);
+	split2 = new QSplitter(Qt::Vertical, widget);
 	split2->setChildrenCollapsible(false);
-	split2->setOrientation(Qt::Vertical);
 
 	// create config tree
 	configList = new ConfigList(widget, "config");
-- 
2.43.0


