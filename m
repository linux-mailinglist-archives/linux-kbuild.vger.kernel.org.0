Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9512996E1
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Oct 2020 20:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1793132AbgJZTcw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 15:32:52 -0400
Received: from mout.gmx.net ([212.227.15.15]:47575 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1774601AbgJZTcw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 15:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603740762;
        bh=ShOLs+1ibLkPYeUmuVBwiL4vszUxvK6A7Wzsv+zGpb0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=XTjL2vfmgIIUV9kRtiPnOr91rMYcF9ngHLMBhLjChk9MeV7qrS0Ll8TKz3fbV1neo
         feolNLXGogknO+mHdGDExyUu1czCrTJ8wFpv6cy4YjQWyp7SPQnqN6osE0X591qsFi
         BmBSZg6dYwiQU3xohd1e8ZCe4zqQdPSiHQGJsfc4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.223.32.86]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mq2j2-1k1uHr3x7i-00nD20; Mon, 26 Oct 2020 20:32:42 +0100
Received: by localhost.localdomain (Postfix, from userid 1000)
        id 2308E800D9; Mon, 26 Oct 2020 20:32:40 +0100 (CET)
From:   Sven Joachim <svenjoac@gmx.de>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>,
        Guillem Jover <guillem@hadrons.org>
Subject: [PATCH 1/2] builddeb: Fix rootless build in setuid/setgid directory
Date:   Mon, 26 Oct 2020 20:32:16 +0100
Message-Id: <20201026193217.402412-1-svenjoac@gmx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NSkC1V+EbxMe4Ro6SpvBMwqjXxOwK3NSvGMR3Vn1wpVnkGDT/Lm
 VmkbiG7eU1D4YY3t2OtQwpqwHsASITg9b8K39HnkQIDeKQ0F12pz1mSrJB11kvsBgRNtZ5y
 yVN3lmoPSzIszu4P6n2PQsYCB2c1CNWabo2ycHjXYVWQqsVYSDDN55nBoxxN5dTZBQoCLNj
 pOvpqJzh/TNFuzAsdgVvw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fYpsOkBFTJE=:PiYfed4IIhy38hNPcCA5iD
 5gY84Gx4kYXaQxHQ96hX479iy0JLRLu9WK7dvJsH2VoVgyYfG3Wpt0BQax08aHd3WkPHWk1l0
 2lR0Pe6V0Xh/xl90CKm9naGPBkuVsgXXe/gPvpMoQwMy3VfDALfQylgBR6Rvd/r4u/R/5XTOH
 GUXBlraveRguYngwgMTyyA3S8CDPSvVQ9+CZXLotF2qhH4F1qXsBg5tuJVe2AJrONSBCa7XVc
 Kakof23K0CaGSRHIdTeGJO9xtcmo2VXyYxMaNs4LpzFD6gnwDzd8xXKr7PLvnOyyU+hTatWOc
 02UERviFhyO4qy3TqWcBZiZ0rKXcwHqgHYprF5wWwaSWDf+pbdNSTvFQb4EIeupfi1iN9qznI
 Ux3gEBhXNXpGY/irSVv8UnO3yUcvo3JgQWbnLGQH9h4OcZtNpclZL6EEQA3Qk/cs4cVHe4P2/
 1NYS9/SG6gC7pzVBJ9rrputQB2oQL+muW7yp7PitzMh+FyznWQEu6vrpqLmfJCP0ScUximTbt
 qtAt+pTjptdKqmVyLLsQEF0G1FEcJ7OVe79WFz7/x29inCl8wnBIbXenxTNsjY+CbsBVmRh7K
 f2C+0QvAp8yfszLuCQe5hF6g7kLJrN4dVi+5Bem0s7Q7H2u+ZnqnkMvvfY7HNNqBPeGNNidoy
 8Q6P+98eqpZOW0bDdIzP2EpKPj64W6lrcsDzeXPlZ/O8CDis7gK86cG7RuNun23ihOdE3nUg1
 gKo6QNV7kzehVvdTrIArLuZDBoO04Ofgb4uhChIz84ehgPlrxs1NMfYyw+DwJBI8JTMg4h+LC
 FAdHlvqCI2jcVjKv/e+LRxffRkWapgaCYXbZp//q78en2l4yLKSVTEq2gv3DM+ujZJ+9Mo3Mq
 qmfY+EPef3dSwTBlwuwA==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Building 5.10-rc1 in a setgid directory failed with the following
error:

dpkg-deb: error: control directory has bad permissions 2755 (must be
>=3D0755 and <=3D0775)

When building with fakeroot, the earlier chown call would have removed
the setgid bits, but in a rootless build they remain.

Fixes: 3e8541803624 ("builddeb: Enable rootless builds")
Cc: Guillem Jover <guillem@hadrons.org>
Signed-off-by: Sven Joachim <svenjoac@gmx.de>
=2D--
 scripts/package/builddeb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 1b11f8993629..91a502bb97e8 100755
=2D-- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -45,6 +45,8 @@ create_package() {
 	chmod -R go-w "$pdir"
 	# in case we are in a restrictive umask environment like 0077
 	chmod -R a+rX "$pdir"
+	# in case we build in a setuid/setgid directory
+	chmod -R ug-s "$pdir"

 	# Create the package
 	dpkg-gencontrol -p$pname -P"$pdir"
=2D-
2.28.0

