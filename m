Return-Path: <linux-kbuild+bounces-7747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0F6AECFBB
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99B793A5E61
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE4A2367AF;
	Sun, 29 Jun 2025 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8JprqHt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4797178F2E;
	Sun, 29 Jun 2025 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751223047; cv=none; b=MW4HnwtuUqwPLcjumapVHx39P/Kcs30JX9u42JQnfTqH2pNsQlPcTZh8jWngUlK63bEjcpJ/Rt0MwMeia3ozUPP75VhMEGn269oaUhKL10/V+3Tgo2VucAGIJbcUwWOANo79eLIGNL/dakCDCJV+ztuAEhb1SNk/xkuGKqwfDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751223047; c=relaxed/simple;
	bh=bubDHRWawKjR6c9Q8IIm6ZhV6Ref0DL5Up3nnlCjc9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQKt0VqpbBvrtjQ44slysTPKTRayRkm9q+qFcXe6jC2qEWwxXl5P+cN6wK+nNZE9oGS/2CW0aM1gCc2Vi6ZVSpM4v3DLS07a8JiR6bzUwPsrn3TZq7/Zz/m/u7Z1OjrjMgy4QKyPFqfu1IY/vgLgd4c52ZMYlif9k50/OUy/iGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8JprqHt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CBAC4CEEB;
	Sun, 29 Jun 2025 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751223045;
	bh=bubDHRWawKjR6c9Q8IIm6ZhV6Ref0DL5Up3nnlCjc9c=;
	h=From:To:Cc:Subject:Date:From;
	b=n8JprqHtBR5qs03Zld2PdnA6FaCslvl8Mc+fVc5CYAlwQ9+auRvgFVo+DEbbaacTe
	 ln3hjgVGJOt6ujtY7VNr1fHf6MZlfuPhW0J8mm41l40dPN5CTtwmGHGcAZ/K7ScwZs
	 CiEHEpJUpHWGBIGcWlZq/6YByFSnc3FLDzl7shIxdtLyjGZvHeXLYzU+T2YQYpECIT
	 9elBhFEIM4WSue96SZrJ2n7wNVgtcgl1YSYLZreTsKjg4dChvGCRcBVT+nm/KyId3V
	 oBcwn4T5idBKs6qqM/cNziB3t2+rgUDXbOuUgzrISD1BPQn3Qryv2yZidwQvoTlI2r
	 9swhR0EWemJ/g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: confine {begin,end}Group to constructor and destructor
Date: Mon, 30 Jun 2025 03:50:35 +0900
Message-ID: <20250629185041.412407-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call beginGroup() in the the constructor and endGroup() in the
destructor. This looks cleaner.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 8 ++++++--
 scripts/kconfig/qconf.h  | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index a7c98bbbd8ac..f8992db1870a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -37,6 +37,12 @@ QAction *ConfigMainWindow::saveAction;
 ConfigSettings::ConfigSettings()
 	: QSettings("kernel.org", "qconf")
 {
+	beginGroup("/kconfig/qconf");
+}
+
+ConfigSettings::~ConfigSettings()
+{
+	endGroup();
 }
 
 /**
@@ -1829,7 +1835,6 @@ int main(int ac, char** av)
 	configApp = new QApplication(ac, av);
 
 	configSettings = new ConfigSettings();
-	configSettings->beginGroup("/kconfig/qconf");
 	v = new ConfigMainWindow();
 
 	//zconfdump(stdout);
@@ -1837,7 +1842,6 @@ int main(int ac, char** av)
 	v->show();
 	configApp->exec();
 
-	configSettings->endGroup();
 	delete configSettings;
 	delete v;
 	delete configApp;
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 62ab3286d04f..ab4e51f12914 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -24,6 +24,7 @@ class ConfigMainWindow;
 class ConfigSettings : public QSettings {
 public:
 	ConfigSettings();
+	~ConfigSettings(void);
 	QList<int> readSizes(const QString& key, bool *ok);
 	bool writeSizes(const QString& key, const QList<int>& value);
 };
-- 
2.43.0


