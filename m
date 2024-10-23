Return-Path: <linux-kbuild+bounces-4248-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE49ABECE
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 08:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE051285250
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 06:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1797A149011;
	Wed, 23 Oct 2024 06:32:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A30D27E;
	Wed, 23 Oct 2024 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665166; cv=none; b=u2JWaptfj/TCMhD7zZhLBQL1kkY9NMjyXJWsoxTBMruMWQ47kpoJXBdan/PrXi19NnZCx9BaMigACrSArpdd9my+OozHyuvcWguArpeFQ3FsXFT4XmzUFC+Hvf3fHjkFVdh4XEN9K7TTkV2LTvn2nat0FZkWHi0A3Ov/072T+Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665166; c=relaxed/simple;
	bh=KxVhKLvtOGfGOFZI1MpAkIzF3UjApMVOZOZ5t2N++rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SXi9rVt/5i77MQSuyOXuq7HlDJmNAVhQHt3ORDSxV46u55EhQEcFQkeR/yL1A1CsGXWAqHgp4ujJBGcbGQ+RZralPErc9RCUHVNiNWf61zBJGI52WWj+Tg6FKiEIgwBTXvLatgwiG9xNtoEWfL0iuN++9Ol4lW+UpYfjoBMJ0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 1796D5F976;
	Wed, 23 Oct 2024 08:32:42 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] kconfig: qconf: use preferred form of QString API
Date: Wed, 23 Oct 2024 08:32:41 +0200
Message-ID: <3317655.aeNJFYEL58@devpool47.emlix.com>
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

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 54640f6b29e2..6a653ebe9df3 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1520,8 +1520,8 @@ void ConfigMainWindow::loadConfig(void)
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
@@ -1547,8 +1547,8 @@ void ConfigMainWindow::saveConfigAs(void)
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



