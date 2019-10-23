Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBBD9E0FD4
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2019 03:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730121AbfJWB4U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Oct 2019 21:56:20 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43096 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbfJWB4U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Oct 2019 21:56:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id l24so6193338pgh.10
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 18:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nQNpXYtEEs98WRZmV+IJQ5q/RqSZVR1h7BdT3TQOlVQ=;
        b=d2zwv738z7UhbHqceN2ILi457nULlrcdfO6QrxX/xeb8QvpP0ltS78T3y6x/ei5dDD
         RgYk+dm0rBsNY6Of/ffpdb0eTCDRv6uuYMUG7B6fqBw0HUHGms8EC/cWwT5rkHDgSHmn
         JyKzvbfxFGk26KqLYofUOLcXMhfu8UmIw0D9AKYxJaXeDIyBK8H+F+L8DX43jT8A6LKo
         8iv5/zd5YVokNXt3m72NoyByD9YDLSv6evy95x6uWhTCkffgDyRWr/4JtiIJgrVKa/lm
         /l1kUGlo/BpSUEQn2opvibDNGFBYbkjksPd8B38Tj8cBIn8Ztsrs7zjZOqwtYWRE05Ew
         UhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nQNpXYtEEs98WRZmV+IJQ5q/RqSZVR1h7BdT3TQOlVQ=;
        b=m+GdbfYOwSo6w45LBrzwz35Sy2GnF92NT6yL6eN9mkxV9oADYFOtxh85k2q6+YpqOq
         Tf2fMKDvL5g05bMv2Qw5SwMhRFrt3yif1N2HLu+CFuZTdiCgc0f//LEE2+9gUGK9x746
         0YP84Eh7wU0jwXyJeFKEodES3B1q11/I/4AoiyHqoll3HM+vjKVC2Nq5nei+W74ulDUj
         QUqhkwRvbAVDqqy28QJRIMrmmYW3tUuljOtnTELuk3FyIfqLqz4QmkUhB6rpkxG8g+Kh
         Nq22ZQIc1mCg0cGvV599+z4fvi4AGL2fSxnL02sDS3H8BJE7L991fRf1nFHx4U3NoDm4
         vfBg==
X-Gm-Message-State: APjAAAXyAt3hDAtvnDDdOGD9eRZBYN2IDz4lfbLeUsW/xR+I1B4NYUG+
        e+47hdAAH/QLftCWq12rqzs=
X-Google-Smtp-Source: APXvYqx/mjDdelrrQ6p3IN6Ob9RlmBaHeDDLkhvAf0b781vUXaGMHHRiL8Iduc04kAnR8nb9G04U/A==
X-Received: by 2002:a63:715d:: with SMTP id b29mr243426pgn.369.1571795779483;
        Tue, 22 Oct 2019 18:56:19 -0700 (PDT)
Received: from localhost.localdomain ([223.191.16.197])
        by smtp.gmail.com with ESMTPSA id j128sm22649056pfg.51.2019.10.22.18.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 18:56:18 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     nico-linuxsetlocalversion@schottelius.org, rdunlap@infradead.org,
        linux-kbuild@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH RESEND] scripts: setlocalversion: replace backquote to dollar parenthesis 
Date:   Wed, 23 Oct 2019 07:24:27 +0530
Message-Id: <20191023015426.31169-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch replace backquote to dollar parenthesis syntax for better
readability.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
     Acked-by: Randy Dunlap <rdunlap@infradead.org>
     Acked-by: Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>
---
 scripts/setlocalversion | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index a2998b118ef9..d3f93de0d046 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -45,11 +45,11 @@ scm_version()

 	# Check for git and a git repo.
 	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
-	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
+		head=$(git rev-parse --verify --short HEAD 2>/dev/null); then

 		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
 		# it, because this version is defined in the top level Makefile.
-		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
+		if [ -z "$(git describe --exact-match 2>/dev/null)" ]; then

 			# If only the short version is requested, don't bother
 			# running further git commands
@@ -59,7 +59,7 @@ scm_version()
 			fi
 			# If we are past a tagged commit (like
 			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
-			if atag="`git describe 2>/dev/null`"; then
+			if atag="$(git describe 2>/dev/null)"; then
 				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'

 			# If we don't have a tag at all we print -g{commitish}.
@@ -70,7 +70,7 @@ scm_version()

 		# Is this git on svn?
 		if git config --get svn-remote.svn.url >/dev/null; then
-			printf -- '-svn%s' "`git svn find-rev $head`"
+			printf -- '-svn%s' "$(git svn find-rev $head)"
 		fi

 		# Check for uncommitted changes.
@@ -91,15 +91,15 @@ scm_version()
 	fi

 	# Check for mercurial and a mercurial repo.
-	if test -d .hg && hgid=`hg id 2>/dev/null`; then
+	if test -d .hg && hgid=$(hg id 2>/dev/null); then
 		# Do we have an tagged version?  If so, latesttagdistance == 1
-		if [ "`hg log -r . --template '{latesttagdistance}'`" = "1" ]; then
-			id=`hg log -r . --template '{latesttag}'`
+		if [ "$(hg log -r . --template '{latesttagdistance}')" = "1" ]; then
+			id=$(hg log -r . --template '{latesttag}')
 			printf '%s%s' -hg "$id"
 		else
-			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
+			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
 			if [ -z "$tag" -o "$tag" = tip ]; then
-				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
+				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
 				printf '%s%s' -hg "$id"
 			fi
 		fi
@@ -115,8 +115,8 @@ scm_version()
 	fi

 	# Check for svn and a svn repo.
-	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
-		rev=`echo $rev | awk '{print $NF}'`
+	if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
+		rev=$(echo $rev | awk '{print $NF}')
 		printf -- '-svn%s' "$rev"

 		# All done with svn
--
2.20.1

