Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1FA2996DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Oct 2020 20:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784888AbgJZTcw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 15:32:52 -0400
Received: from mout.gmx.net ([212.227.17.21]:59685 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1784784AbgJZTcw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 15:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603740765;
        bh=CZCsGaqX+45NNOYzXFKIkh4B51ifkFDZAdb/wH6esZY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=L0byklSnqI9OVDheqrpE35/Z9sNKTHqU/UmoyY2HwwQqn5nauwuRp8jGedoM79DcD
         tkbykd7RKO/ytn8W1G+g0mS1ZOAEtihDITgX0N8KFWakmwZmnIFO91hEdPYhA+aUEt
         nYhoLYT2BlfMBtu0qOlnc6ouWLk1lN4zJxS9mjWg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.223.32.86]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MCsUC-1kftfw45LM-008s1A; Mon, 26 Oct 2020 20:32:45 +0100
Received: by localhost.localdomain (Postfix, from userid 1000)
        id 546ED800D9; Mon, 26 Oct 2020 20:32:44 +0100 (CET)
From:   Sven Joachim <svenjoac@gmx.de>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>
Subject: [PATCH 2/2] builddeb: Consolidate consecutive chmod calls into one
Date:   Mon, 26 Oct 2020 20:32:17 +0100
Message-Id: <20201026193217.402412-2-svenjoac@gmx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026193217.402412-1-svenjoac@gmx.de>
References: <20201026193217.402412-1-svenjoac@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HPUyY7qSnCfueopvEerzEZHdTsL9dwjTDbT+OxmyjzpjeSqntXG
 C3nqTJtDZUpEH+GaVSLo//900D+86Q/elvHDuFUtdNe8DPGFEDFMY/TUpX1BdF6ngY/PD2S
 HuSIxS/8xVDTKXu7yYfn1S5bXEiNVl4O+MRWOlewIVgpU3SxxseRnMPhK+0Tn3aP3trmaW6
 RjQBobuk29x2vDp4g0jVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lUdz68dIrvA=:Fke7mghXiCg9irhS+jM0+P
 g+KEN0vPb4l6+YiZPln11bW48kI/RKDo2cZc3smMVx+F1zpfUwFBF5cPWKaS5XzU4TV3zq1IK
 JdI4WBdEk8ZahxKr1s/NQd+XRQDPnIPXJD1fmo8XDadS072hJn2kUaKmAg7Rrg2GPNKvgqXwX
 c1zkLUaeCdWWGyxe+bsgdaFWUP/cUWtgn6pk1mq/waoh6H3mS4HE9f18GChvSbHQYwF60TCuV
 JqwIvHaixd3yEaBwi/KiqS2NZ5nYYEBnRHfonMOLCL7R15aK6ewRasygpTQpj5FvregqYOzof
 PPJadSrlRn7HPU/VVEj40kGwaW3XBwdPRkLkrE8iJaoL1Q3LZa8N0Q+U86qS/FZT8UpRKmKJ7
 pVMwNAtJloRbdt6Mx8K4Q0YjtY0YFFIyqS5HGAF/3L2vR637xt8RTCnzshBQriUhdBGv8rY0q
 S11z6YY0z5g+/OuO/9iZ+flwoe5Tm2xonfbhineq3Zb2FD1A/xSStCKi0N68smYYSsuYlJJV2
 uCG8O5m95c7HXzBYURB2iGL1wBO5SB2XstXyFC6CN44gfQS5zAGI5LHxOeuIG3yv65x/b9El4
 gfcUe+IXPKJ/14AP6JRihMLD0aBRLyJeLRCv6CbVLCauY8gRIPSpFkXohiv/eZli72d4Etppz
 9oDuNbIsh9ZL5F4JWkDnKKbxJJX3FFX1k3FjhIVinOrjuFgA5DerpuDgHhdvIXuxk/HW/NrxS
 K8z3wTFATregi+03UivRSJUJIhiYCKuhcubZNgSknJwRC/2M7H9ACdrbDvBYjWS707p63fRrj
 CTJlWeGOrE3ww0M4+DpQDU0ohvm17npACM0KPLXNW45tK4Eg3igJXJF1W4Pwp0gzTyeEBeLSu
 HEjCKlj+Aq0ShonbQf/Q==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

No need to call chmod three times when it can do everything at once.

Signed-off-by: Sven Joachim <svenjoac@gmx.de>
=2D--
 scripts/package/builddeb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 91a502bb97e8..81ec6414726c 100755
=2D-- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -42,11 +42,7 @@ create_package() {
 	else
 		chown -R root:root "$pdir"
 	fi
-	chmod -R go-w "$pdir"
-	# in case we are in a restrictive umask environment like 0077
-	chmod -R a+rX "$pdir"
-	# in case we build in a setuid/setgid directory
-	chmod -R ug-s "$pdir"
+	chmod -R go-w,a+rX,ug-s "$pdir"

 	# Create the package
 	dpkg-gencontrol -p$pname -P"$pdir"
=2D-
2.28.0

