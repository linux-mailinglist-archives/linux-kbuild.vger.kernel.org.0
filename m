Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E3FD39E1
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 09:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfJKHQH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 03:16:07 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40401 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfJKHQH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 03:16:07 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so5525248pfb.7
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Oct 2019 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V2YeVd0ZQDnILsHdTo7UizlzxsyScrZO6AxEn8H8xl4=;
        b=pYxr2R1+zti17xvAKqQhe7JNlHgQHSJcJRpz4cWvMQXtNphBU9jGA7UU5I7KbnoWOJ
         85VDAk1zYJkT224yndmTQez3GW1evPuwZZG8GmZF9pKAF902onvdeZw5JfjDFYKo3GTQ
         VhDQUTo/SBW7pnbk06KpFUAnQPsfmBlGdX8ZHGlzEnnz6/kN2SKuWwIIONW3ynBC1eA8
         ZdOCxPE0UHgmpUoGNrILiIdsw1CzNnXT95UyEOzoqZwrxaOWv2TnBu02WYdFjHl/IghV
         43qFY5sJc7xSyUZ+d7ANr2iOe7GbQPDuVaNpb+HmKegztsb0PWoK8Okb7EoK5ghWPyYS
         JoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V2YeVd0ZQDnILsHdTo7UizlzxsyScrZO6AxEn8H8xl4=;
        b=DdUHlGMW357TaYRYiaNtAG7A64/4ie1desIdV1MXgkOisYETq7dMe/6lybjShAJ/+6
         lKRPG59EGmA8FBq9NGsf6EsFhWr+SyF7nhPaEncf+Ws8ZHei0T2VbLROFZ8iApnLBcRp
         YAbb31IDBP4/8US/MJWNVIfaBsHluadQyB48twIsQQ2tEG9KiNl0kiSOPptvkm5lxS9C
         Qz+/yblhw5WOky427M4JAJHljTYpEXU1wNcvbNShj/QfERNhWHXkLyeyIyBKPLemYidx
         KaL4COP1pxuimW+JrY24ouPqGQDwYZ1cfpqnvwZ03VEYKaIOeQZhBJzA7R0S9l08BRxl
         LhLA==
X-Gm-Message-State: APjAAAVwCQ+imJvmay8NvcCrd6yrdfv5wD0QKGhqe7ITKVQqs8wLz1GF
        gIK2Ve4D0zupCbmQUCNaZ9XvADP3iMOTEA==
X-Google-Smtp-Source: APXvYqwhGapWCrOYvu7HSsIgeuTYePQx4stQ7RqwIgyBJPiAK0WC5XuTgenY/kcZofEr1kRNH8BYhg==
X-Received: by 2002:a62:8305:: with SMTP id h5mr14945204pfe.176.1570778166168;
        Fri, 11 Oct 2019 00:16:06 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.91.69])
        by smtp.gmail.com with ESMTPSA id j16sm6892442pje.6.2019.10.11.00.16.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 00:16:05 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] fix shell syntax
Date:   Fri, 11 Oct 2019 12:35:40 +0530
Message-Id: <20191011070539.25908-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <linux-kbuild@vger.kernel.org , yamada.masahiro@socionext.com , michal.lkml@markovi.net>
References: <linux-kbuild@vger.kernel.org , yamada.masahiro@socionext.com , michal.lkml@markovi.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/setlocalversion | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 220dae0db3f1..b82a29bfc78a 100755
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
-		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
-			id=`hg log -r . --template '{latesttag}'`
+		if [ "$(hg log -r . --template '{latesttagdistance}')" == "1" ]; then
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
2.21.0

