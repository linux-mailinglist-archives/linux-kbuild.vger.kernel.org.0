Return-Path: <linux-kbuild+bounces-4263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1F99AC25C
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 10:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F024B243B8
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 08:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE48215B122;
	Wed, 23 Oct 2024 08:56:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212CA165F0C;
	Wed, 23 Oct 2024 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673772; cv=none; b=FcaS9J5xQJl9g8bUb2eYMmtnFbLB0QSh7TX2Von1TTiZKxNf61KYVGji/4B+Uz+sKZ23rUaFhIEl81cw1s9Dj0p8iS5B1HTSd/MrpxTpHP3VWa+ezNOPiiXbtr6qOC7f5D9EJEwQTjA0P8XY1h41FAbMFkTUBARH5meWamXYyG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673772; c=relaxed/simple;
	bh=LtUuF4KAjrjmqUd8QvWj0hAG1Z8HkwAdOYmGjMckmC0=;
	h=From:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:To; b=hGCUBAgoXivhcn80rXcOjmPBGT411/4ElsIGRClZX1pHAkCAm9wMa98HTsFIQpM6mN/SoDWlQRROctoMXbh1vBoOBpqs5PRRGD6A0VoDNwIIebFST2PlpD2Nxqm6U/NMyxO+Cfdq/HATunzDHT9uAh+Z7eUz3D9qlL4IU1Wo8f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id E18F45F8A7;
	Wed, 23 Oct 2024 10:56:07 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] improve qconfig C++ code
Date: Wed, 23 Oct 2024 08:26:51 +0200
Message-ID: <4960180.31r3eYUQgx@devpool47.emlix.com>
Organization: emlix GmbH
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4604293.LvFx2qVVIh";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
Resent-Message-ID: <202410231056.07265.>
Resent-Date: Wed, 23 Oct 2024 10:56:07 +0200
Resent-From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Resent-To: Masahiro Yamada <masahiroy@kernel.org>
Resent-Cc: 	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart4604293.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] improve qconfig C++ code
Date: Wed, 23 Oct 2024 08:26:51 +0200
Message-ID: <4960180.31r3eYUQgx@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

While playing around with qconfig I made some cleanups that I seemed to for=
got=20
to send out. This uses more of the Qt API that is already present to make t=
he=20
code a bit nicer (YMMV). Especially it adds some keyboard shortcuts for the=
=20
default actions (Save, Save as and the like).

Rolf Eike Beer (7):
  kconfig: qconf: simplify character replacement
  kconfig: qconf: use default platform shortcuts
  kconfig: qconf: use nullptr in C++11 code
  kconfig: qconf: use QCommandLineParser
  kconfig: qconf: use preferred form of QString API
  kconfig: qconf: use QString to store path to configuration file
  kconfig: qconf: use QByteArray API instead of manually constructing a str=
ing

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
--nextPart4604293.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZxiXKwAKCRCr5FH7Xu2t
/N5cBACtC1Fc2SR1w0/aM4UeW7CwXWsoWaVa12qUSipP/vNA4bb8uDkgdQooJIu0
X6qm2oWfdakgkq4iqxWOezhKVG+9PRd4Wr86C8UO3psHC0x9wVRZB2HI/OT1LHmu
kp//+al3k0lr7kECHDD432nmJ7Ry9OkVhPYmba64EDjwcH37Xw==
=+d6X
-----END PGP SIGNATURE-----

--nextPart4604293.LvFx2qVVIh--




