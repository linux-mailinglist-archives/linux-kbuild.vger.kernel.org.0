Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F5329F03F
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 16:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbgJ2PjZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 11:39:25 -0400
Received: from mout.gmx.net ([212.227.17.20]:34851 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728406AbgJ2PjY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 11:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603985958;
        bh=IqRRbFAtuzx0pHC/Xb8X8hKIIllWrocj/1hYqFfiHyw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TJQ0F+QUiznsd4vYyBdt18HGLJ7+zCY9j4QxaxFNlGbXXaw/DXuPAntZ94PYlc6K3
         dUfXl9bV9v6+ZF/F7Wcoo8bnwcOZ/XUVflRG3+gQKY22a+Nzrh0ZLzIcanEHwDTfL+
         zdKP9TNJBIzRcFt94vh/UNZsZ7Gfa/faieMHGMOY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.223.32.86]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MHoRK-1kd5xj3lIs-00ErzB; Thu, 29 Oct 2020 16:39:17 +0100
Received: by localhost.localdomain (Postfix, from userid 1000)
        id DD9D0800D9; Thu, 29 Oct 2020 16:39:16 +0100 (CET)
From:   Sven Joachim <svenjoac@gmx.de>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>
Subject: [PATCH] builddeb: Consolidate consecutive chmod calls into one
Date:   Thu, 29 Oct 2020 16:39:10 +0100
Message-Id: <20201029153910.7502-1-svenjoac@gmx.de>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <CAK7LNARFVy_2y883jig2_QrwTyGe=Xmu91z8LWuZuCeruWXa6A@mail.gmail.com>
References: <CAK7LNARFVy_2y883jig2_QrwTyGe=Xmu91z8LWuZuCeruWXa6A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UViFwwQbDt/WxE81UR0PAiGjGM6GCNiipg4SYKykS+mC7Fd94Fe
 b1h3rdbwWEX/b3PmjdnutqhPEZv2oAsUMcdBVWeTrQXwWO0v4X/ZqF6s/B9u2BKcpMirDZu
 0XjV2bNI1vg4X+Foz82ycoSlXmcAg2oxKSvx6iRr4Mg6oYzXik35Lmvjj5FxMUcnCbMteGL
 aCfVAfpYl4EoimiUJoE7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oEoDpcT7UPY=:fxzAbu2ZosdbA7e52qkQwX
 QsDkacDmhfmlKraUSUrwU5wGfD4ErqFRhczVdmJME5YYLtPCAZe/Wo2JG98XbyHrddyitloZl
 YlNJqu4qnkz3uZ/Jst3qUZ+igdQ/gxIvvTqzRTMqtOlXDVnTFwEk/jHx6XEpuxNZgFJgfe6Og
 P6NbVTAhWU2mYgkS8hPlMpYpYX5US7AtqY5uPzfkdOswG/D03F0VRNzHwqHkZVRKIK3LPilY9
 WYjkgF6ivX3I1XDAH424WckXW0fm3xrrgtW6ld7jOQpc2bOtw8JOYTafslKubukOfmC3/QNcp
 +S+W6ZHL2cy5ElF8R4Pj4ZWnr1IWI5Kha7iM6gJTJ6PgJftmtE+dlTT0zGvu9ykHFIVA2q8kG
 elzTScHP1NNS2Jzj3TMlImfn4bIz8Rj9QMOJV914EVSal2DEBWmB0Ck0iEMl414E9RaaOb5q6
 sXJ2P7E05oAfRXRjUb58EZd9FIrBq3jfO2qEWWM9zw9V0Z9j363DzrhRw9K7oN5ZtY6bShky5
 1BnZpK/1LAAVLRjk0S3UjTJV/NxBoPoNtJg6JFzuRV/Ghsf27liCDXIn85eJd+jW0pjvYVv6C
 dzdq/Uazu9sLJb5HXxmvTqCnxN37IH7kjT1RA88cvmcAsuS72r646nulj1S+JOledcQGbTZ/Z
 pULWhiwpKA+Iy4T0HHcaZGnXrK29c7LV+Wo+Vglp7u46pbvgVurqNV0ZyxRWU3fF+K2RU6PA+
 916CxrSC0FIrJZiXFZ8D2kaJ0xPw/W8yjUtq//j5C+r5ZccmezMGxLOFM+JXWJ9GKO0Ge2V/h
 gPxIClw/P5skaFIfPVn5lUT0q4QfiwX6Tn5rC4rgLDHqZ2MtxGr1gpyutB0AzTAsM2VdoPBoV
 Cw6fMtu63lA/VH1pgwbw==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

No need to call chmod three times when it can do everything at once.

Signed-off-by: Sven Joachim <svenjoac@gmx.de>
=2D--
 scripts/package/builddeb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 91a502bb97e8..6a100c449579 100755
=2D-- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -42,11 +42,9 @@ create_package() {
 	else
 		chown -R root:root "$pdir"
 	fi
-	chmod -R go-w "$pdir"
-	# in case we are in a restrictive umask environment like 0077
-	chmod -R a+rX "$pdir"
-	# in case we build in a setuid/setgid directory
-	chmod -R ug-s "$pdir"
+	# a+rX in case we are in a restrictive umask environment like 0077
+	# ug-s in case we build in a setuid/setgid directory
+	chmod -R go-w,a+rX,ug-s "$pdir"

 	# Create the package
 	dpkg-gencontrol -p$pname -P"$pdir"
=2D-
2.29.1

