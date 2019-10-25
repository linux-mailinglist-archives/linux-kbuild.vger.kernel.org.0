Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858F8E4476
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2019 09:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405321AbfJYHbh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Oct 2019 03:31:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39189 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403890AbfJYHbg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 03:31:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id p12so970164pgn.6;
        Fri, 25 Oct 2019 00:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2N+MJXhRREUEbo0WZe6XYT3rSaV4YhCnP6qLL0FGS8=;
        b=AXsrzo3I092Y+LE6biYcv8FyzQ4fX8QsV+U2vz82UpvgcFIwHIZQnJFEI4dhB+iIiL
         hmz4mAFCVyx8n4wMKPznzBVJvwDF00mBMy06K8L5OxLSj9YmmpwlGt5+bwhYGAZ96ALN
         e5DPtBaK7Hv+s9weHnEvY5r4MWX5lsA1dyDNc/mihZXXTO3NN/OfaWsFTszx4gz/QYWe
         eL5wiCgh1DNXAaIzgUSo0LQzu/vjiW6V1RVqFksSsrq8mbzTcvHQQ5rr1ZkpsZbmu/iX
         MeYYM0c83IBIp+4rCwpcg3+ifDvyUrWwxK6mT3QGcXTLmWpx6dkRsdesRq4pmrlEp5D3
         cJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2N+MJXhRREUEbo0WZe6XYT3rSaV4YhCnP6qLL0FGS8=;
        b=aHfQpZJVVI6uOdjWiBXfVOTI946pmgLUFWOXVkUSiRY11B0Uy4Plsdv9rJjOOLRogC
         mVujaevfc7KcUNUd1nzHrj/Y83g8Zbg022cs6OkiM4X0iNkUedvv6ZLupqzENsZEo5i4
         Ujz9xvuGRnXYb5mDMRrmOQLorR0W7Iu11QSFjgRLhbLk4r/smcWs1tgj3SZkfANMY1ww
         uGE202s7CQqXGQ5b04YIAugKInLi3B/xreJPp34h9cp/2JfYl9yGMclDXyQ0SZDNZ58v
         Q2wbxGzn36HKGIsBX01GCPbbF0TxVsLYevi/Ru/ZdSPytMRwClbyZlgXOpNBKSV9wp7Y
         /T/A==
X-Gm-Message-State: APjAAAXpVxdwvjPNbHP4Yb6/f7MtLyiyzK8wCe6gStm5V8xKEY+YMAHz
        ZP5sPeqDaQeyBAx61J/g5d8=
X-Google-Smtp-Source: APXvYqxmnZ8QV+Ivae6fUHJ98I73necM49LU2eHLmv2RYZMlhl/4p9p7L8eDApXo77Be+4/Lbtbo4w==
X-Received: by 2002:a63:7448:: with SMTP id e8mr2665978pgn.268.1571988696197;
        Fri, 25 Oct 2019 00:31:36 -0700 (PDT)
Received: from localhost.localdomain ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id y8sm1299823pgs.34.2019.10.25.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 00:31:35 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     torvalds@linux-foundation.org, rdunlap@infradead.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:patch-kernel:bash syntax replace
Date:   Fri, 25 Oct 2019 12:58:53 +0530
Message-Id: <20191025072852.356-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch will replace backquote with dollar parenthesis
for better realdibility.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/patch-kernel | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/patch-kernel b/scripts/patch-kernel
index 033d5916797d..d864bbd67940 100755
--- a/scripts/patch-kernel
+++ b/scripts/patch-kernel
@@ -153,7 +153,7 @@ applyPatch () {
     echo "failed.  Clean up yourself."
     return 1;
   fi
-  if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ]
+  if [ "$(find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print)" ]
   then
     echo "Aborting.  Reject files found."
     return 1;
@@ -175,7 +175,7 @@ reversePatch () {
 		echo "failed.  Clean it up."
 		exit 1
 	fi
-	if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ]
+	if [ "$(find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print)" ]
 	then
 		echo "Aborting.  Reject files found."
 		return 1
@@ -189,7 +189,7 @@ reversePatch () {
 # set current VERSION, PATCHLEVEL, SUBLEVEL, EXTRAVERSION
 # force $TMPFILEs below to be in local directory: a slash character prevents
 # the dot command from using the search path.
-TMPFILE=`mktemp ./.tmpver.XXXXXX` || { echo "cannot make temp file" ; exit 1; }
+TMPFILE=$(mktemp ./.tmpver.XXXXXX$( || { echo "cannot make temp file" ; exit 1; }
 grep -E "^(VERSION|PATCHLEVEL|SUBLEVEL|EXTRAVERSION)" $sourcedir/Makefile > $TMPFILE
 tr -d [:blank:] < $TMPFILE > $TMPFILE.1
 . $TMPFILE.1
@@ -200,7 +200,7 @@ then
     exit 1
 fi

-NAME=`grep ^NAME $sourcedir/Makefile`
+NAME=$(grep ^NAME $sourcedir/Makefile)
 NAME=${NAME##*=}

 echo "Current kernel version is $VERSION.$PATCHLEVEL.$SUBLEVEL${EXTRAVERSION} ($NAME)"
@@ -216,8 +216,8 @@ fi

 #echo "stopvers=$stopvers"
 if [ $stopvers != "default" ]; then
-	STOPSUBLEVEL=`echo $stopvers | cut -d. -f3`
-	STOPEXTRA=`echo $stopvers | cut -d. -f4`
+	STOPSUBLEVEL=$(echo $stopvers | cut -d. -f3)
+	STOPEXTRA=$(echo $stopvers | cut -d. -f4)
 	STOPFULLVERSION=${stopvers%%.$STOPEXTRA}
 	#echo "#___STOPSUBLEVEL=/$STOPSUBLEVEL/, STOPEXTRA=/$STOPEXTRA/"
 else
@@ -306,7 +306,7 @@ if [ x$gotac != x ]; then
 		HIGHESTPATCH=0
 		for PATCHNAMES in $patchdir/patch-${CURRENTFULLVERSION}-ac*\.*
 		do
-			ACVALUE=`echo $PATCHNAMES | sed -e 's/^.*patch-[0-9.]*-ac\([0-9]*\).*/\1/'`
+			ACVALUE=$(echo $PATCHNAMES | sed -e 's/^.*patch-[0-9.]*-ac\([0-9]*\).*/\1/')
 			# Check it is actually a recognised patch type
 			findFile $patchdir/patch-${CURRENTFULLVERSION}-ac${ACVALUE} || break

--
2.20.1

