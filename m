Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1EE0E4536
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2019 10:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389803AbfJYIGJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Oct 2019 04:06:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46032 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389796AbfJYIGJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 04:06:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id x28so1034726pfi.12;
        Fri, 25 Oct 2019 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aH4FpP3+O7A7FAjL6sYS5ga4odKu3fpRwwmiEGqplJo=;
        b=Kc5kmswwM5yMpbl7csxfJef+N8nwBYUCEAM4mEDJCGTYHWU71SVC2Vy2+G0k8xKkqi
         uRedZaCOQm0XN8i3g7rl+VG2Q4Cz4YGYoCkVzvQ88Ot3pwrBuK3LHbeNqZWU5gHz3Xcz
         1RyX0N1zR0jidB3GUt0NUkueZ815PMGK5oTYRUo+ESitvWo3z52cBkg2lfQmgJ3v2C8K
         Ke3RmER27603x/iwMV3yI2ZxOWty1uS/AjFPySr8vaptvnC+tflwJ1gzhpURC6IwBHjH
         Exz8X1crv8QHCCBsof0EBvL3qi2vs/8uKwxPDpctAT6t+x+DDDgET2qZ8NquVhC8gGnf
         SarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aH4FpP3+O7A7FAjL6sYS5ga4odKu3fpRwwmiEGqplJo=;
        b=MybpCovnJ5CtmXXXK1W1Jm+STN5FQD0Fzt5R0b14Vv1HPeBCtPob4ct4Vgqc8ODFG8
         urZl49/0FeRv4fVS7AqXiT0fCEPrtzAgpkT18SUIHviobPeXrU/ftI5W2JyZf2eU+diF
         YKkwIcxWptBuCWjMzz036JfEX0CmMc19Qzl636WyeXv9e8wC9XMT2M7XyCd+z430q9wK
         UE89fvJZnciheEno6cwcdhiao29f2hmz74VJm8qbSMrxpFUtFtYb6kbFWEBK//HhQA32
         rQNlF7CDS28mFjfzf2Wpb5QIeST80Ia2zrP92tzEoPKt4PFlWv9Dy5u3HOCo3jdgrVqH
         A3Zg==
X-Gm-Message-State: APjAAAXiRAp3RGGcmrmSbWC1jDHJGQLveTNG8ZEyp9EvSf1EBloAy4Ro
        GX2gjEUG7TVOLdSBjnxdPbo=
X-Google-Smtp-Source: APXvYqyXspeiMm/KPqISsJzoBkExWYP1CCqy+pHRX5vL3QxAjc657ALcm952Hdz55/xsjZm7lZAkRw==
X-Received: by 2002:a63:5022:: with SMTP id e34mr2593191pgb.400.1571990768488;
        Fri, 25 Oct 2019 01:06:08 -0700 (PDT)
Received: from localhost.localdomain ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id v1sm2425694pfg.26.2019.10.25.01.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 01:06:07 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     torvalds@linux-foundation.org, rdunlap@infradead.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:patch-kernel:bash syntax replace,correct one
Date:   Fri, 25 Oct 2019 13:35:44 +0530
Message-Id: <20191025080544.7209-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch will replace backquote to dollar parenthesis syntax
for better readability.Corrected one.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/patch-kernel | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/patch-kernel b/scripts/patch-kernel
index 033d5916797d..6f9443336f9a 100755
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
+TMPFILE=$(mktemp ./.tmpver.XXXXXX) || { echo "cannot make temp file" ; exit 1; }
 grep -E "^(VERSION|PATCHLEVEL|SUBLEVEL|EXTRAVERSION)" $sourcedir/Makefile > $TMPFILE
 tr -d [:blank:] < $TMPFILE > $TMPFILE.1
 . $TMPFILE.1
@@ -200,7 +200,7 @@ then
     exit 1
 fi

-NAME=`grep ^NAME $sourcedir/Makefile`
+NAME=$(grep ^NAME $sourcedir/Makefil)
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

