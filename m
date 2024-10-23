Return-Path: <linux-kbuild+bounces-4247-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95B9ABEC3
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 08:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E20F1285228
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 06:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECD913DB9F;
	Wed, 23 Oct 2024 06:31:52 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EAC13A3F3;
	Wed, 23 Oct 2024 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665112; cv=none; b=S87WenzR86HESvNZZ+zC9WOYjGoAuEbKTljiJbBvG0PH7V7dVtBYtmZaz7Uw0VroDAEFfvu6M236IOVSGXnBUlI3+2CnbzTs895E60uol0hmcrhcu8aWfxxhnpMBzV5XvKAtamBnZK/Ti9xei9GLKN3oxbdQTR86snks36ht55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665112; c=relaxed/simple;
	bh=us+grQV/jXWmtQNBUfunsLR1+H2Rv7P8p/uyZMzN51U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bUzZDAnF9bJ1pTsS9sDo51fsNeIJtKZhi5P10zq3f09tWgq2kSovF4mrlxUYcxpt7GySBM9AM4yDly6CcL0hMiM7SlzqbLU8nclU/kV+MnnCxoR1n9WFfWx+2KRQffkQ+ocsWQfkV4InrYVFs+2Cluiptn5/yZWItjrx7xdh/eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 2A52D5FAFA;
	Wed, 23 Oct 2024 08:31:47 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH 2/7] kconfig: qconf: use QString to store path to configuration file
Date: Wed, 23 Oct 2024 08:31:46 +0200
Message-ID: <13623531.uLZWGnKmhe@devpool47.emlix.com>
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

This is the native type used by the file dialogs and avoids any hassle with
filename encoding when converting this back and forth to a character array.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 24 ++++++------------------
 scripts/kconfig/qconf.h  |  2 +-
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 742ca6ed289b..54640f6b29e2 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1380,7 +1380,7 @@ ConfigMainWindow::ConfigMainWindow(void)
=20
 	conf_set_changed_callback(conf_changed);
=20
=2D	configname =3D xstrdup(conf_get_configname());
+	configname =3D conf_get_configname();
=20
 	QAction *saveAsAction =3D new QAction("Save &As...", this);
 	connect(saveAsAction, &QAction::triggered,
@@ -1519,28 +1519,22 @@ ConfigMainWindow::ConfigMainWindow(void)
 void ConfigMainWindow::loadConfig(void)
 {
 	QString str;
=2D	QByteArray ba;
=2D	const char *name;
=20
 	str =3D QFileDialog::getOpenFileName(this, "", configname);
 	if (str.isNull())
 		return;
=20
=2D	ba =3D str.toLocal8Bit();
=2D	name =3D ba.data();
=2D
=2D	if (conf_read(name))
+	if (conf_read(str.toLocal8Bit().constData()))
 		QMessageBox::information(this, "qconf", "Unable to load configuration!");
=20
=2D	free(configname);
=2D	configname =3D xstrdup(name);
+	configname =3D str;
=20
 	ConfigList::updateListAllForAll();
 }
=20
 bool ConfigMainWindow::saveConfig(void)
 {
=2D	if (conf_write(configname)) {
+	if (conf_write(configname.toLocal8Bit().constData())) {
 		QMessageBox::information(this, "qconf", "Unable to save configuration!");
 		return false;
 	}
@@ -1552,23 +1546,17 @@ bool ConfigMainWindow::saveConfig(void)
 void ConfigMainWindow::saveConfigAs(void)
 {
 	QString str;
=2D	QByteArray ba;
=2D	const char *name;
=20
 	str =3D QFileDialog::getSaveFileName(this, "", configname);
 	if (str.isNull())
 		return;
=20
=2D	ba =3D str.toLocal8Bit();
=2D	name =3D ba.data();
=2D
=2D	if (conf_write(name)) {
+	if (conf_write(str.toLocal8Bit().constData())) {
 		QMessageBox::information(this, "qconf", "Unable to save configuration!");
 	}
 	conf_write_autoconf(0);
=20
=2D	free(configname);
=2D	configname =3D xstrdup(name);
+	configname =3D str;
 }
=20
 void ConfigMainWindow::searchConfig(void)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 53373064d90a..aab25ece95c6 100644
=2D-- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -237,7 +237,7 @@ public slots:
 class ConfigMainWindow : public QMainWindow {
 	Q_OBJECT
=20
=2D	char *configname;
+	QString configname;
 	static QAction *saveAction;
 	static void conf_changed(bool);
 public:
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



