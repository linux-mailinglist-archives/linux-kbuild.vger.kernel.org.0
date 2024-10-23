Return-Path: <linux-kbuild+bounces-4252-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A99ABEFD
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 08:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868D21F24B39
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 06:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7154814AD3A;
	Wed, 23 Oct 2024 06:38:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AF013BC11;
	Wed, 23 Oct 2024 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665525; cv=none; b=I3MV+JZcMLObcL4mwgavcx0IQFOKFs8kgHCTyso8Ec/DJvnBMMwA/F+uezUKD1N6mNMrEyvGQmoWqOuTOObVpaxgfVvdCMV9MK5Oo0b/rZMD7lGX/1dLpkbc6GNzyBpq5+ADQDCpybCnC2+9o3r50CKLBT06VmZOb1QIuEdoZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665525; c=relaxed/simple;
	bh=FkbXTX6/laHtcxuSP/YuZ0C5lTynxiJsq6LDdjhZNnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c0vlWydoFa+MWuMqPRsPfMtp4KIASEYXYjmKnZtIviz/GiVISRssPG8zVURk2cJjr8+WPk4KiN6JDzmQXVE1ksLvU20MlQORASVXDFYonAPYfXv4f+AIdwfeP5QbHz25UTcOPhViJ5VfRkQGzdYV0IThBNiBL+N7NhSTZwg0poU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 2BDA25F8A7;
	Wed, 23 Oct 2024 08:29:32 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH 1/7] kconfig: qconf: use QByteArray API instead of manually
 constructing a string
Date: Wed, 23 Oct 2024 08:29:31 +0200
Message-ID: <4931941.GXAFRqVoOG@devpool47.emlix.com>
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

Using a naked char[] here isn't necessary as QByteArray has a nice API for =
all
of this. Calling constData() will also always return a 0-terminated string =
so no
further handling is required. And then the whole manual memory handling can=
 go
away as QByteArray will care for this when it goes out of scope.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index e260cab1c2af..742ca6ed289b 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1165,25 +1165,17 @@ void ConfigInfoView::expr_print_help(void *data, st=
ruct symbol *sym, const char
 void ConfigInfoView::clicked(const QUrl &url)
 {
 	QByteArray str =3D url.toEncoded();
=2D	const std::size_t count =3D str.size();
=2D	char *data =3D new char[count + 2];  // '$' + '\0'
 	struct symbol **result;
 	struct menu *m =3D NULL;
=20
=2D	if (count < 1) {
=2D		delete[] data;
+	if (str.isEmpty())
 		return;
=2D	}
=2D
=2D	memcpy(data, str.constData(), count);
=2D	data[count] =3D '\0';
=20
 	/* Seek for exact match */
=2D	data[0] =3D '^';
=2D	strcat(data, "$");
=2D	result =3D sym_re_search(data);
+	str[0] =3D '^';
+	str.append('$');
+	result =3D sym_re_search(str.constData());
 	if (!result) {
=2D		delete[] data;
 		return;
 	}
=20
@@ -1206,7 +1198,6 @@ void ConfigInfoView::clicked(const QUrl &url)
 	}
=20
 	free(result);
=2D	delete[] data;
 }
=20
 void ConfigInfoView::contextMenuEvent(QContextMenuEvent *event)
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



