Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDC438D875
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 May 2021 05:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhEWDR1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 May 2021 23:17:27 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:31528 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhEWDR0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 May 2021 23:17:26 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14N3EZer018750;
        Sun, 23 May 2021 12:14:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14N3EZer018750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621739679;
        bh=9gXQt/5pTlSD9vvZYhBVMZM8dS16BCrwnst1ZaKNMV0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mt416BDTDXVoAbak7mwWloUp/dXtt+nAFbqRq6eZKWgMTdaVFZuuGvr0eeXiRz1V6
         iuhCwhyTm2NEql3GxH0og8I48grjp8v6MlczhIT6i3cOWO7E1B4otv5iF6qdsdtSPz
         Y+UTyUhHAauiOtPXe52O2xGlirIST/u6Wmh+47eGyA0Car18qo+tXzoHXMwFUb9HUW
         I16q46TUMyky+ekMjZ9GC3hBQDlvO2CusaBCUov4GSV3f1o0doXGDv2JJUxqKWpqtO
         SbhF25CZ7pq7qLTD+mBlBm0LpA3Uh+y6Nj3V6f2u+UsVlyXuroF1ehhPqVwPIITSdH
         MrOXTaNkujJMA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] scripts/setlocalversion: simplify the short version part
Date:   Sun, 23 May 2021 12:14:28 +0900
Message-Id: <20210523031428.164186-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210523031428.164186-1-masahiroy@kernel.org>
References: <20210523031428.164186-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Reduce the indentation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/setlocalversion | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 62c0bcce1575..151f04971faa 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -131,15 +131,13 @@ res="${res}${CONFIG_LOCALVERSION}${LOCALVERSION}"
 if test "$CONFIG_LOCALVERSION_AUTO" = "y"; then
 	# full scm version string
 	res="$res$(scm_version)"
-else
+elif [ -z "${LOCALVERSION}" ]; then
 	# append a plus sign if the repository is not in a clean
 	# annotated or signed tagged state (as git describe only
 	# looks at signed or annotated tags - git tag -a/-s) and
 	# LOCALVERSION= is not specified
-	if test "${LOCALVERSION+set}" != "set"; then
-		scm=$(scm_version --short)
-		res="$res${scm:++}"
-	fi
+	scm=$(scm_version --short)
+	res="$res${scm:++}"
 fi
 
 echo "$res"
-- 
2.27.0

