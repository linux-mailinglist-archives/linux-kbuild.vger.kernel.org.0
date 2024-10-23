Return-Path: <linux-kbuild+bounces-4253-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80E9ABF06
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 08:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE7411F247F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 06:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B8514A62A;
	Wed, 23 Oct 2024 06:39:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADA314A4DE;
	Wed, 23 Oct 2024 06:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665560; cv=none; b=k+j01SbA4K8Z627xsY2nCEdkWmtPDp4THPxxEh5wnl2DyvBTFSpbLxqwwBBTtr9WWe8KlvBejZUlCBVN/szEm/1BSUfEVvAdsFdFrEGMEnZ5SBgHk9kPYo0JbpoRTPHghSmlza/h2+X7vhUzwZXONKdgeTtsEEe/cn89MbEGL9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665560; c=relaxed/simple;
	bh=XYMrAKGPn3G7hN4PF2Z2mZGMRGRjPfTIzYJUmtHmcjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3Ie80G6QE5/WDk1nAJ7oAwR3vKnnf+FYcJBn8EzBSpagA2mK/63Mk8tjbWuAjf437WCXmx2OErhcqCIx0D0sIXy3dcAUV4Ivrl/Sb0LhEDq6QNPzMC2vggKpbzpg+LUFRfSmRNL2zDCnpean7YTj+e/QFyNFCMFN1IUHHEsAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 0C2EE5F8A7;
	Wed, 23 Oct 2024 08:39:16 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] kconfig: qconf: simplify character replacement
Date: Wed, 23 Oct 2024 08:39:15 +0200
Message-ID: <3592638.iIbC2pHGDl@devpool47.emlix.com>
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

Replace the hand crafted lookup table with a QHash. This has the nice benef=
it
that the added offsets can not get out of sync with the length of the
replacement strings.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 4b2f707c9203..f07a463c5760 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1123,28 +1123,19 @@ QString ConfigInfoView::print_filter(const QString =
&str)
 {
 	QRegularExpression re("[<>&\"\\n]");
 	QString res =3D str;
+
+	QHash<QChar, QString> patterns;
+	patterns['<'] =3D "&lt;";
+	patterns['>'] =3D "&gt;";
+	patterns['&'] =3D "&amp;";
+	patterns['"'] =3D "&quot;";
+	patterns['\n'] =3D "<br>";
+
 	for (int i =3D 0; (i =3D res.indexOf(re, i)) >=3D 0;) {
=2D		switch (res[i].toLatin1()) {
=2D		case '<':
=2D			res.replace(i, 1, "&lt;");
=2D			i +=3D 4;
=2D			break;
=2D		case '>':
=2D			res.replace(i, 1, "&gt;");
=2D			i +=3D 4;
=2D			break;
=2D		case '&':
=2D			res.replace(i, 1, "&amp;");
=2D			i +=3D 5;
=2D			break;
=2D		case '"':
=2D			res.replace(i, 1, "&quot;");
=2D			i +=3D 6;
=2D			break;
=2D		case '\n':
=2D			res.replace(i, 1, "<br>");
=2D			i +=3D 4;
=2D			break;
+		const QString n =3D patterns.value(res[i], QString());
+		if (!n.isEmpty()) {
+			res.replace(i, 1, n);
+			i +=3D n.length();
 		}
 	}
 	return res;
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



