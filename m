Return-Path: <linux-kbuild+bounces-1969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A28D717A
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 20:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29C5E2821ED
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 18:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA64154C02;
	Sat,  1 Jun 2024 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQhX8piV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F63154BF3;
	Sat,  1 Jun 2024 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717266051; cv=none; b=FqWRCMEnAsk/TKB3kLnxyvfxT6Ho1G2xX6vsrMrgWwAcuBFiN3tvcwizHg14MkgzQbGo9Gcyebaj3KJP6QvVpsTVdi8pXSIcC5drmTG8s/5fXriK2GQ9KXmsvibg6rHje+Y4fvIAYRQV/NobNUmL5dPcFF7lZYQSitMMVJxsP4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717266051; c=relaxed/simple;
	bh=Nk5C1FaiT9kwsn9EFyyDDVmPydOKPpYhad1CZ+NAQRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZHU45hW+jOADv9QLcP1TzXnBFTS6+mD5OLXJv7foC5NoaEwLun4q2G9AO+kxkVaOdzeBPNP3h/QzQqGhjxZsG8pf3kgu8n2rdhbaarbD171wb8wiw9ByMvazCI/pn0hJSe3GtOOEv+8hqYnOqjk8Ji0lDQ4G71uihTd++8g1Mpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQhX8piV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005B4C4AF07;
	Sat,  1 Jun 2024 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717266050;
	bh=Nk5C1FaiT9kwsn9EFyyDDVmPydOKPpYhad1CZ+NAQRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQhX8piV+/s9c328uZsUOfQTXSaTcjbJCYh6gR6HDs1qhl3eWy1n7sEJapgeehFp0
	 UyCuquLAS9MOFj5Mja0XEQU/vu3ko2C+FE4UmDDZqdq5RS4VJ0XSgW5TmGtFufq7Pm
	 qcuW0IqTG7BZiaEsv304ktnrKyCZxVDCLD7gtjiJcvXbmMV55rc2ts3lGGU4q4A3Yq
	 LRI0KkbKiAgq4CXFPLJqsYTeuS/TXZQM2s6TBUESFosydKTAuyPIIh6MZULRB9DP+s
	 51eDzI8No/soav7j4OqdEzgr/GKizaDsz0ctlChmBJTabOsXwnFFw0JD0XGL7gjSGb
	 zfPm3fcXQUg1A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/6] kconfig: qconf: remove initial call to conf_changed()
Date: Sun,  2 Jun 2024 03:20:39 +0900
Message-Id: <20240601182043.876249-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601182043.876249-1-masahiroy@kernel.org>
References: <20240601182043.876249-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If any CONFIG option is changed while loading the .config file,
conf_read() calls conf_set_changed(true) and then the conf_changed()
callback.

With conf_read() moved after window initialization, the explicit
conf_changed() call can be removed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c6c42c0f4e5d..e62e862ea283 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1397,8 +1397,6 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	conf_set_changed_callback(conf_changed);
 
-	// Set saveAction's initial state
-	conf_changed();
 	configname = xstrdup(conf_get_configname());
 
 	QAction *saveAsAction = new QAction("Save &As...", this);
@@ -1904,7 +1902,6 @@ int main(int ac, char** av)
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
-	conf_read(NULL);
 	//zconfdump(stdout);
 
 	configApp = new QApplication(ac, av);
@@ -1916,6 +1913,9 @@ int main(int ac, char** av)
 	//zconfdump(stdout);
 	configApp->connect(configApp, SIGNAL(lastWindowClosed()), SLOT(quit()));
 	configApp->connect(configApp, SIGNAL(aboutToQuit()), v, SLOT(saveSettings()));
+
+	conf_read(NULL);
+
 	v->show();
 	configApp->exec();
 
-- 
2.40.1


