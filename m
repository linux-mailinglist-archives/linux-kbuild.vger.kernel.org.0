Return-Path: <linux-kbuild+bounces-5188-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 485F79F7554
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 08:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1C616CDBF
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 07:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEE9217660;
	Thu, 19 Dec 2024 07:23:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522237082A;
	Thu, 19 Dec 2024 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593025; cv=none; b=hAqV/7+HmHR9NiYDxmCkVjmYEwGVLSoi9DcwpLQT3xyWY2kqXRjY+bj3Z5zsv2i8f1ozeEwqes6pz47UzsbH6SAVjgTdscBUvnuPINPxSzkMX7k3dYj5E6iCh0RIYf581RUF1y/1LsiRy+yWGApeKXOWmX04yI7WsNv4JVCjJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593025; c=relaxed/simple;
	bh=G3rAuJ5nO3DLKuPe95xyB20np+pDhcA+dW7JejjHHi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hRYKkUFvwJCCDKDOhHLcwEEEMZLDhVYIMcpHQI83cDJfVo54lroLv1ixULYPA49P8ETcvA8qDVr3Y2nVPGyT3SNT/YHykPtvgX7GAnjo8iJQp90LDvcCZcNqDCe7IIb25JvvYtlLmd5f+Ll4oSTbCS+TdIg73RG3IGFImTKspuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id E576A5FB29;
	Thu, 19 Dec 2024 08:23:11 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] kconfig: qconf: use preferred form of QString API
Date: Thu, 19 Dec 2024 08:20:34 +0100
Message-ID: <4616510.LvFx2qVVIh@devpool47.emlix.com>
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

A QString constructed from a character literal of length 0, i.e. "", is not
"null" for historical reasons. This does not matter here so use the preferr=
ed
method isEmpty() instead.

Also directly construct empty QString objects instead of passing in an empty
character literal that has to be parsed into an empty object first.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 6c92ef1e16ef..eaa465b0ccf9 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1464,8 +1464,8 @@ void ConfigMainWindow::loadConfig(void)
 {
 	QString str;
=20
=2D	str =3D QFileDialog::getOpenFileName(this, "", configname);
=2D	if (str.isNull())
+	str =3D QFileDialog::getOpenFileName(this, QString(), configname);
+	if (str.isEmpty())
 		return;
=20
 	if (conf_read(str.toLocal8Bit().constData()))
@@ -1491,8 +1491,8 @@ void ConfigMainWindow::saveConfigAs(void)
 {
 	QString str;
=20
=2D	str =3D QFileDialog::getSaveFileName(this, "", configname);
=2D	if (str.isNull())
+	str =3D QFileDialog::getSaveFileName(this, QString(), configname);
+	if (str.isEmpty())
 		return;
=20
 	if (conf_write(str.toLocal8Bit().constData())) {
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



