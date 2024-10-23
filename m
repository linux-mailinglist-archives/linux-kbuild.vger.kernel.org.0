Return-Path: <linux-kbuild+bounces-4250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 934AC9ABEDC
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 08:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 367B9B21CFC
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 06:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28691149011;
	Wed, 23 Oct 2024 06:35:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8C1482FE;
	Wed, 23 Oct 2024 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665304; cv=none; b=hJK0xhGo2B7Rfm7Jytb2nW67vwffiOQxIGrH9ZeehVl4uh2AZlgoVye2fJ2rnwksFgeHxapZ7HJyiB8YLbcx5o0VEif9KJZvZ1KtlFhZDtOADSfdvoENnZLsoWL9infx9+XrnAK6qcei+N1UXZ09YlB9ppwsxoFe/lHqCUcXXFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665304; c=relaxed/simple;
	bh=bPodnt7kOTWdoEdsKJvlV/U3rTazFyVpHEg6UqOCL9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MMo2WM/sl7+hot5AEJ3T4JsduYnSDauUFbu9gijziTW2ROVqVD54p3r+mE0kMsIklV+SQlmI35f6+F8QpQf7fZpzdbQnZaQEziChEJH4PMwaP98JgAW5G2gdrqmyN7bVDNHgJuagNZJLKE0odruwroPoAFgK53C4iZv+QNG5X9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 907945F976;
	Wed, 23 Oct 2024 08:34:59 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] kconfig: qconf: use nullptr in C++11 code
Date: Wed, 23 Oct 2024 08:34:59 +0200
Message-ID: <2286001.iZASKD2KPV@devpool47.emlix.com>
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

This is type safe as it can't be accidentially assigned to something not a
pointer.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 313a51941825..563ef8543d7c 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -874,7 +874,7 @@ skip:
=20
 void ConfigList::focusInEvent(QFocusEvent *e)
 {
=2D	struct menu *menu =3D NULL;
+	struct menu *menu =3D nullptr;
=20
 	Parent::focusInEvent(e);
=20
@@ -933,7 +933,7 @@ void ConfigList::setAllOpen(bool open)
 }
=20
 ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
=2D	: Parent(parent), sym(0), _menu(0)
+	: Parent(parent), sym(nullptr), _menu(nullptr)
 {
 	setObjectName(name);
 	setOpenLinks(false);
@@ -985,7 +985,7 @@ void ConfigInfoView::setInfo(struct menu *m)
 	if (_menu =3D=3D m)
 		return;
 	_menu =3D m;
=2D	sym =3D NULL;
+	sym =3D nullptr;
 	if (!_menu)
 		clear();
 	else
@@ -1167,7 +1167,7 @@ void ConfigInfoView::clicked(const QUrl &url)
 {
 	QByteArray str =3D url.toEncoded();
 	struct symbol **result;
=2D	struct menu *m =3D NULL;
+	struct menu *m =3D nullptr;
=20
 	if (str.isEmpty())
 		return;
@@ -1208,7 +1208,7 @@ void ConfigInfoView::contextMenuEvent(QContextMenuEve=
nt *event)
 }
=20
 ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
=2D	: Parent(parent), result(NULL)
+	: Parent(parent), result(nullptr)
 {
 	setObjectName("search");
 	setWindowTitle("Search Config");
@@ -1281,7 +1281,7 @@ void ConfigSearchWindow::search(void)
 {
 	struct symbol **p;
 	struct property *prop;
=2D	ConfigItem *lastItem =3D NULL;
+	ConfigItem *lastItem =3D nullptr;
=20
 	free(result);
 	list->clear();
@@ -1580,7 +1580,7 @@ void ConfigMainWindow::changeMenu(struct menu *menu)
 void ConfigMainWindow::setMenuLink(struct menu *menu)
 {
 	struct menu *parent;
=2D	ConfigList* list =3D NULL;
+	ConfigList* list =3D nullptr;
 	ConfigItem* item;
=20
 	if (configList->menuSkip(menu))
@@ -1859,7 +1859,7 @@ int main(int ac, char** av)
 	cmdline.process(*configApp);
=20
 	if (cmdline.isSet(silent))
=2D		conf_set_message_callback(NULL);
+		conf_set_message_callback(nullptr);
=20
 	QStringList args =3D cmdline.positionalArguments();
 	if (args.isEmpty())
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



