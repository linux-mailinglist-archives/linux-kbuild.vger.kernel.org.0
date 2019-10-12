Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9277D4D0F
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2019 06:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfJLEyd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Oct 2019 00:54:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38917 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfJLEyd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Oct 2019 00:54:33 -0400
Received: by mail-pf1-f196.google.com with SMTP id v4so7256730pff.6
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Oct 2019 21:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6g+J6tg3PNsjGKl1XF37sMp3xv14tzdfnfnOQlqr0O0=;
        b=iCmKpoaIuQMLFcUWNp6/UfxOgKOOmgX63RHK7fGq6wLpgfVgyTgyDM3hPBYQYIRi6E
         Rym6jQOLcQUqHZhuPzjUqkCTTXopFZ4WeiE38g7EyMLnSIHmLSrursv5sCIhqiLix1QB
         lHvUmQFu+xh4gRB6bU85kMpVjz9jUKgiNFHig+o3tJ+7/7Lz3v0v5IdDmC7z2ZJic04M
         gU0CYCXlT3Q3iDtJxJiuBZ6qc1vi+mBz/q3VYXV3Jh3zix58ssOqM0jFwbhnckuCr92z
         4FQcCD2hsV6CZFKfrqBL88/QNS1OEmRYEV7TKmtKjXRLSBn++Umgp3NtSvhGA/ud8QVq
         gRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6g+J6tg3PNsjGKl1XF37sMp3xv14tzdfnfnOQlqr0O0=;
        b=Nq4bWB+z8PpL+tpFYq9s1uCvQBZtF0QxEJKgnBtxeAs623YFsjThPSl9y71XRhOnXN
         eFkSE4aEYSNYEQhgdyF0GN1F3yIFzhWzc3woReUNOnMPak1oCcG/FNULGmR0mlhubJzi
         WAmb/w+x3HtP6Lw7+MqhvM8TE7gxNorgjT26FlyW0AF76HI2G0yUsQYUm33vamkPB7SG
         4ySDh/urxOxY6T7SwCgDzTMPAFscv6hDbUiHyukLY3MT5hb0PW1OHto+TZ9Ilpa4lg9c
         bWiEVx4Xo/ZPDkkqVtCm+lOY4TcmIMnUQ2e2G5JDv0FL3QyXiOwbHScgd+oODhRxyQct
         Qqyg==
X-Gm-Message-State: APjAAAX/f5MYFED+cve+2D3kPCZ4nkFE6l07Ny4fWleSZLllo3ivGglT
        EauQu0I7RPUb8MY+f6k45OA=
X-Google-Smtp-Source: APXvYqw1cEfsbje/ndnAsbrH5brFZzGO22nMAA6Fya4k9jOZmSZKqS6M9oWNvluj3glHhpJbac6yMQ==
X-Received: by 2002:aa7:8691:: with SMTP id d17mr20668322pfo.152.1570856072911;
        Fri, 11 Oct 2019 21:54:32 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.91.68])
        by smtp.gmail.com with ESMTPSA id cx22sm11047970pjb.19.2019.10.11.21.54.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 21:54:31 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org,
        nico-linuxsetlocalversion@schottelius.org, rdunlap@infradead.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts: setlocalversion: fix shell syntax
Date:   Sat, 12 Oct 2019 10:23:28 +0530
Message-Id: <20191012045328.24443-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch replace backquote to dollar parenthesis.

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

