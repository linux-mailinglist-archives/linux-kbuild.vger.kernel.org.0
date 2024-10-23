Return-Path: <linux-kbuild+bounces-4251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88599ABEE6
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 08:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D27AB22173
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 06:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD12A14A092;
	Wed, 23 Oct 2024 06:36:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DFC1482FE;
	Wed, 23 Oct 2024 06:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665375; cv=none; b=gsTORWcL3xjRsEUMNRgi7Cb6DwKr3okpImypN5P/Vwt1INHT6sVRqIzXx7JQxE6zIpnmmWuQt5Y1MCt1EF64QerjXFuDqbPcBPRBi7mZmOAT2eT79N8gLdYPLUr1kf7RLahfxehZQiNCcXzyYwyX1i+p72DsA9EscHLsM5qUr6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665375; c=relaxed/simple;
	bh=Hrtbj5gzhkwWoK1Nu8Kf80sdOybfLxs8lrIUMePveHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rSHgiDq0RcYxA0+WMrj7R00B/HIfUhNQKykWtAdr8kQcIpRUggiqx5Qtq3uzoV6kD6nsSsNVb0grvC53SDA8ccUeYltIOk+U7fuW6d2kHW2Cce/uZeuRTzfoL/USAkc79LxZbouoLbqdRat7+oj/SgSZgT+WWSx7z3hpOeeorCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 24EE65F976;
	Wed, 23 Oct 2024 08:36:11 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] kconfig: qconf: use default platform shortcuts
Date: Wed, 23 Oct 2024 08:36:10 +0200
Message-ID: <22467307.EfDdHjke4D@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <4960180.31r3eYUQgx@devpool47.emlix.com>
References: <4960180.31r3eYUQgx@devpool47.emlix.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

This renames "Load" to "Open" and switches Ctrl-L to Ctrl-O for the default
platforms. This may break the workflow for those used to it, but will make =
it
actually work for everyone else like me who would just expect the default
behavior. Add some more standard shortcuts where available. If they replace
the existing shortcuts they would have the same value in my case.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 563ef8543d7c..4b2f707c9203 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1361,21 +1361,22 @@ ConfigMainWindow::ConfigMainWindow(void)
 	configList->setFocus();
=20
 	backAction =3D new QAction(QPixmap(xpm_back), "Back", this);
+	backAction->setShortcut(QKeySequence::Back);
 	connect(backAction, &QAction::triggered,
 		this, &ConfigMainWindow::goBack);
=20
 	QAction *quitAction =3D new QAction("&Quit", this);
=2D	quitAction->setShortcut(Qt::CTRL | Qt::Key_Q);
+	quitAction->setShortcut(QKeySequence::Quit);
 	connect(quitAction, &QAction::triggered,
 		this, &ConfigMainWindow::close);
=20
=2D	QAction *loadAction =3D new QAction(QPixmap(xpm_load), "&Load", this);
=2D	loadAction->setShortcut(Qt::CTRL | Qt::Key_L);
+	QAction *loadAction =3D new QAction(QPixmap(xpm_load), "&Open", this);
+	loadAction->setShortcut(QKeySequence::Open);
 	connect(loadAction, &QAction::triggered,
 		this, &ConfigMainWindow::loadConfig);
=20
 	saveAction =3D new QAction(QPixmap(xpm_save), "&Save", this);
=2D	saveAction->setShortcut(Qt::CTRL | Qt::Key_S);
+	saveAction->setShortcut(QKeySequence::Save);
 	connect(saveAction, &QAction::triggered,
 		this, &ConfigMainWindow::saveConfig);
=20
@@ -1384,10 +1385,11 @@ ConfigMainWindow::ConfigMainWindow(void)
 	configname =3D conf_get_configname();
=20
 	QAction *saveAsAction =3D new QAction("Save &As...", this);
+	saveAsAction->setShortcut(QKeySequence::SaveAs);
 	connect(saveAsAction, &QAction::triggered,
 		this, &ConfigMainWindow::saveConfigAs);
 	QAction *searchAction =3D new QAction("&Find", this);
=2D	searchAction->setShortcut(Qt::CTRL | Qt::Key_F);
+	searchAction->setShortcut(QKeySequence::Find);
 	connect(searchAction, &QAction::triggered,
 		this, &ConfigMainWindow::searchConfig);
 	singleViewAction =3D new QAction(QPixmap(xpm_single_view), "Single View",=
 this);
=2D-=20
2.47.0

=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner



