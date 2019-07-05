Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83C20608EB
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2019 17:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbfGEPOw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Jul 2019 11:14:52 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:45678 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfGEPOu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jul 2019 11:14:50 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x65FEYof003506;
        Sat, 6 Jul 2019 00:14:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x65FEYof003506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562339676;
        bh=j1X2qsh6YtfDSqime3qySV5hLLz1eF8cUUX82OnMgDs=;
        h=From:To:Cc:Subject:Date:From;
        b=rm6csqc1Tk9DadRlazYBhRDKDg4cDmtlXOrmKWA0fRDAOdNVvYRQrxKRTvQCk2ufr
         02bG5KER/FYeJCNrem0hPapgW5RO7YnI1Y4gRTOiT3zVZgmQ3exZmfChAEVSPUl8dY
         UEWy5T9beoVNcZkKljuE6SnG5Gp+rc2M50p9pCUjYa2caY5TGwW9HBSCAuN+VIJUpf
         +pjgTwlV+vmPHGec+S4nlV2StzcxXpg36UnFinsh8w/dnOTQQAZZfOvqt0khgBxvW0
         rpssVZ/DdWsyeJ3taxJ7dr1zwvEso5jUeAaWxEsMlh01yhAaDvsSE32xQvyvmM344k
         Oy5RMqP4HMF5Q==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] scripts/tags.sh: drop SUBARCH support for ARM
Date:   Sat,  6 Jul 2019 00:14:30 +0900
Message-Id: <20190705151431.29122-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Our goal is to have more and more sub-architectures to join the
ARM multi-platform, and support them in a single configuration.

Remove the ARM SUBARCH support because it is ugly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/tags.sh | 36 ++----------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index cc991e18f4d1..f56edeb08739 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -41,15 +41,13 @@ find_arch_sources()
 	for i in $archincludedir; do
 		prune="$prune -wholename $i -prune -o"
 	done
-	find ${tree}arch/$1 $ignore $subarchprune $prune -name "$2" \
-		-not -type l -print;
+	find ${tree}arch/$1 $ignore $prune -name "$2" -not -type l -print;
 }
 
 # find sources in arch/$1/include
 find_arch_include_sources()
 {
-	include=$(find ${tree}arch/$1/ $subarchprune \
-					-name include -type d -print);
+	include=$(find ${tree}arch/$1/ -name include -type d -print);
 	if [ -n "$include" ]; then
 		archincludedir="$archincludedir $include"
 		find $include $ignore -name "$2" -not -type l -print;
@@ -305,36 +303,6 @@ if [ "${ARCH}" = "um" ]; then
 	else
 		archinclude=${SUBARCH}
 	fi
-elif [ "${SRCARCH}" = "arm" -a "${SUBARCH}" != "" ]; then
-	subarchdir=$(find ${tree}arch/$SRCARCH/ -name "mach-*" -type d -o \
-							-name "plat-*" -type d);
-	mach_suffix=$SUBARCH
-	plat_suffix=$SUBARCH
-
-	# Special cases when $plat_suffix != $mach_suffix
-	case $mach_suffix in
-		"omap1" | "omap2")
-			plat_suffix="omap"
-			;;
-	esac
-
-	if [ ! -d ${tree}arch/$SRCARCH/mach-$mach_suffix ]; then
-		echo "Warning: arch/arm/mach-$mach_suffix/ not found." >&2
-		echo "         Fix your \$SUBARCH appropriately" >&2
-	fi
-
-	for i in $subarchdir; do
-		case "$i" in
-			*"mach-"${mach_suffix})
-				;;
-			*"plat-"${plat_suffix})
-				;;
-			*)
-				subarchprune="$subarchprune \
-						-wholename $i -prune -o"
-				;;
-		esac
-	done
 fi
 
 remove_structs=
-- 
2.17.1

