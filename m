Return-Path: <linux-kbuild+bounces-5187-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 277219F7556
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 08:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E33091885206
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 07:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B10216E1B;
	Thu, 19 Dec 2024 07:23:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086301FBEB3;
	Thu, 19 Dec 2024 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593015; cv=none; b=oJwzJqG8JF9efq3SZZ/QGYQjym/fRvkM3waPhrBk6Ej6HD5BPHEHexnvoQA5Ehx8BpTdttr/ndRd8LavMUxQhscW66tRzYOABmeL6/Q2Wh8jaAwDjX1n4PTsN9RyozzNDGLRbDyMKszH6eEOp4HmRgZOSUAyFsG8o5E6/w17xeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593015; c=relaxed/simple;
	bh=Okk8sxzKQlf7/XbtE8NF8dwpXdcmq0j5uX4X58f9c4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IXzFLKQ/zA74tS4a98Uz+Wn9hbERDjPOsyFKOQJdvVtsbr6xfjQyV1O/f59rtC9c0zgsXlgl91Bf3l5HyG87u9hy6SMllM7Ox5knns2rnvNnRzGmG+RouYhB7GJQ9GjoYgBkTdF4twu9OHHkMrhQSycnDUDiBRbjrAcuqIp4xY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id A90CE5FA41;
	Thu, 19 Dec 2024 08:23:11 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] kconfig: qconf: use QCommandLineParser
Date: Thu, 19 Dec 2024 08:21:23 +0100
Message-ID: <4945092.GXAFRqVoOG@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <5843611.DvuYhMxLoT@devpool47.emlix.com>
References: <5843611.DvuYhMxLoT@devpool47.emlix.com>
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
index eaa465b0ccf9..4d500cc9ba9d 100644
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
@@ -1785,41 +1786,30 @@ void fixup_rootmenu(struct menu *menu)
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
+	cmdline.addPositionalArgument("Kconfig", "Top-level Kconfig file", "Kconf=
ig");
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
2.47.1


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



