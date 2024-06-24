Return-Path: <linux-kbuild+bounces-2240-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CD9145AD
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 11:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0B33285E34
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 09:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98931805E;
	Mon, 24 Jun 2024 09:02:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D422318
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Jun 2024 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219776; cv=none; b=LytRxq20k7mb25efzV8SaWxXGDiden0YPAGziX/Rd7VkQNUrPKRl/CgZoHUd7kEdSkOu1aEEo/lWh2V42qCmDoIFeDlEpCi1ZNdSQByeoGngeMumDCnN2y5Y7i79c8fUR48EDa02K2Sxe1cFFZ7hyXuT/ev8offPkzgQxTaX9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219776; c=relaxed/simple;
	bh=PUhSn2OMwDV1nFF06BqxmzkNtTScDTzkrG2jYG2LUGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CP4lqW2+jzJOi4P2L4mR+OPPWrcA9t78JbmPBOJ217V/JUWECPPOtaM96Gwy0T0cBZ9MS64v1+IyJimVzQuaiJ4LDjtyVcr9i60Zz9Whi8chGeBQ9vyQAIto+E8pcRze9ggliZn5DCxXMJlAkakzI133LKE8MbNiekq44QZlfks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (unknown [81.20.112.87])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id E824C5F8AF;
	Mon, 24 Jun 2024 10:56:47 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Subject:
 "make xconfig" fails with "No rule to make target
 =?UTF-8?B?4oCmL3Fjb25mLW1vYy5jYyDigKYi?=
Date: Mon, 24 Jun 2024 10:56:41 +0200
Message-ID: <5792762.DvuYhMxLoT@devpool47.emlix.com>
Organization: emlix GmbH
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6057734.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6057734.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Date: Mon, 24 Jun 2024 10:56:41 +0200
Message-ID: <5792762.DvuYhMxLoT@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

$ make O=3D~/repos/build/linux/ xconfig V=3D1

make -f linux/scripts/Makefile.build obj=3Dscripts/kconfig xconfig
# HOSTCXX scripts/kconfig/qconf.o
  g++ -Wp,-MMD,scripts/kconfig/.qconf.o.d -Wall -O2    -std=3Dc++11 -fPIC -=
I/usr/include/qt6/QtCore -I/usr/include/qt6 -DQT_CORE_LIB -I/usr/lib64/qt6/=
mkspecs/linux-g++ -I/usr/include/qt6/QtGui -DQT_GUI_LIB -I/usr/include/qt6/=
QtWidgets -DQT_WIDGETS_LIB -std=3Dc++17 -I ./scripts/kconfig -c -o scripts/=
kconfig/qconf.o linux/scripts/kconfig/qconf.cc
make[3]: *** No rule to make target 'linux/scripts/kconfig/qconf-moc.cc', n=
eeded by 'scripts/kconfig/qconf-moc.o'.  Stop.

The culprit seems to be 0e912c03208075b95ea726076bf1b45db8419bc2. If I reve=
rt=20
this like the following I'm able to do "make xconfig" again:

=2D-- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -198,22 +198,22 @@ $(addprefix $(obj)/, mconf.o $(lxdialog)): | $(obj)/m=
conf-cflags
=20
 # qconf: Used for the xconfig target based on Qt
 hostprogs      +=3D qconf
=2Dqconf-cxxobjs  :=3D qconf.o qconf-moc.o
+qconf-cxxobjs  :=3D qconf.o
 qconf-objs     :=3D images.o $(common-objs)
=20
 HOSTLDLIBS_qconf         =3D $(call read-file, $(obj)/qconf-libs)
 HOSTCXXFLAGS_qconf.o     =3D -std=3Dc++11 -fPIC $(call read-file, $(obj)/q=
conf-cflags)
=2DHOSTCXXFLAGS_qconf-moc.o =3D -std=3Dc++11 -fPIC $(call read-file, $(obj)=
/qconf-cflags)
 $(obj)/qconf: | $(obj)/qconf-libs
=2D$(obj)/qconf.o $(obj)/qconf-moc.o: | $(obj)/qconf-cflags
+$(obj)/qconf.o: | $(obj)/qconf-cflags
+$(obj)/qconf.o: $(obj)/qconf.moc
=20
 quiet_cmd_moc =3D MOC     $@
=2D      cmd_moc =3D $(call read-file, $(obj)/qconf-bin)/moc $< -o $@
+      cmd_moc =3D $(call read-file, $(obj)/qconf-bin)/moc -i $< -o $@
=20
=2D$(obj)/qconf-moc.cc: $(src)/qconf.h FORCE | $(obj)/qconf-bin
+$(obj)/%.moc: $(src)/%.h FORCE | $(obj)/qconf-bin
        $(call if_changed,moc)
=20
=2Dtargets +=3D qconf-moc.cc
+targets +=3D qconf.moc
=20
 # gconf: Used for the gconfig target based on GTK+
 hostprogs      +=3D gconf
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c6c42c0f4e5d..283b427f4321 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -25,6 +25,7 @@
 #include "lkc.h"
 #include "qconf.h"
=20
+#include "qconf.moc"
 #include "images.h"
=20

I don't think this is the proper solution, but at least it works. I hope yo=
u=20
find a better way to fix this.

Regards,

Eike
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
--nextPart6057734.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZnk0yQAKCRCr5FH7Xu2t
/D6pBADDD6DSoTfPwnS8bFBgM2CqcGBLM02aKwW6k3GKHJjS2d563crrJKsE/SlO
Cwxd5JSf/W1qS94aLXYMWjM0y7wFXZA+jcLspSH8kTDbOsZc40Qqs4dVJ5dqS8oy
jeSnDEERI2sqOHJBzZfAIUepI1HMn5xx3/IP4HKUFnt5pYo+mw==
=CZOI
-----END PGP SIGNATURE-----

--nextPart6057734.lOV4Wx5bFT--




