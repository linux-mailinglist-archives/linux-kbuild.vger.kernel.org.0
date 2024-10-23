Return-Path: <linux-kbuild+bounces-4249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A12329ABED8
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 08:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEC741C214C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 06:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D67714A09C;
	Wed, 23 Oct 2024 06:33:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AEA149011;
	Wed, 23 Oct 2024 06:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665211; cv=none; b=MTGarDQ5+lk3bOE5UIjsIoJc5cOvbgyfILoLiGI9KCxEewgl6oNGZwZDaSE89Wp25or+jKxQd3qS6h7+bvQ+Y/Ud8tNkg0IdMumQfBFIZeMkwPIskZsYgDMcbXsGttKEser9tRxV9EvzR33pIRt8d4GMlGLZUlzRgICx8aSzax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665211; c=relaxed/simple;
	bh=tL9WB59hfAXSN94hpAXwy9dgVG30yl1q1MSVzRi6vjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sZ+LAIAxkPO2Ti/kwS35VS1lohCnU0eD2U+OyN8RmjdXNp/2xihfQi/oYh/HtSlc4rwKuAsG0+Vcx48OOFLBmigmjUw/6l+n0VHt5kVXe1gEBCEecWPgdY9MXvg5kmx0t390rRxprxZwQCrVE24U+nvyMqNP0hSMRbCQSdqJY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id EE8375F976;
	Wed, 23 Oct 2024 08:33:26 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] kconfig: qconf: use QCommandLineParser
Date: Wed, 23 Oct 2024 08:33:26 +0200
Message-ID: <8441512.T7Z3S40VBb@devpool47.emlix.com>
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

This has a much nicer output without manual processing. It also adds window
management options from Qt for free.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 44 ++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 6a653ebe9df3..313a51941825 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -8,6 +8,7 @@
 #include <QActionGroup>
 #include <QApplication>
 #include <QCloseEvent>
+#include <QCommandLineParser>
 #include <QDebug>
 #include <QFileDialog>
 #include <QLabel>
@@ -1844,41 +1845,30 @@ void fixup_rootmenu(struct menu *menu)
 	}
 }
=20
=2Dstatic const char *progname;
=2D
=2Dstatic void usage(void)
=2D{
=2D	printf("%s [-s] <config>\n", progname);
=2D	exit(0);
=2D}
=2D
 int main(int ac, char** av)
 {
 	ConfigMainWindow* v;
=2D	const char *name;
+	configApp =3D new QApplication(ac, av);
+	QCommandLineParser cmdline;
+	QCommandLineOption silent("s", "silent");
=20
=2D	progname =3D av[0];
=2D	if (ac > 1 && av[1][0] =3D=3D '-') {
=2D		switch (av[1][1]) {
=2D		case 's':
=2D			conf_set_message_callback(NULL);
=2D			break;
=2D		case 'h':
=2D		case '?':
=2D			usage();
=2D		}
=2D		name =3D av[2];
=2D	} else
=2D		name =3D av[1];
=2D	if (!name)
=2D		usage();
+	cmdline.addOption(silent);
+	cmdline.addHelpOption();
+	cmdline.addPositionalArgument("file", "config file to open", "Kconfig");
+
+	cmdline.process(*configApp);
+
+	if (cmdline.isSet(silent))
+		conf_set_message_callback(NULL);
=20
=2D	conf_parse(name);
+	QStringList args =3D cmdline.positionalArguments();
+	if (args.isEmpty())
+		cmdline.showHelp(1);
+
+	conf_parse(args.first().toLocal8Bit().constData());
 	fixup_rootmenu(&rootmenu);
 	//zconfdump(stdout);
=20
=2D	configApp =3D new QApplication(ac, av);
=2D
 	configSettings =3D new ConfigSettings();
 	configSettings->beginGroup("/kconfig/qconf");
 	v =3D new ConfigMainWindow();
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



