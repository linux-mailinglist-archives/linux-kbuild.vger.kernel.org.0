Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 070F5D8C8E
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 11:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388455AbfJPJdl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 05:33:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40586 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388426AbfJPJdl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 05:33:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so14347471pfb.7
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B5x4poEMUJzzXYvSwoGa8hbTY4sRmkrGTYpqcYzgK+g=;
        b=qLQKPjDAfSmkAAEG8z5mVq1jh79MGVy+Wo2XvIHzeELwnI7V9EmWTWGZN2yLcCPtX9
         YvCmeG0LYMimOGHDstLA2Gh0WpvRL7z1zwCSwPUJFttq2KdYccZFgRiV+dXLEU+fvxfm
         KVlCrUlEueGENxZ5uJ3tRVHRYtsNuMo4fHCechwH40cphyba0iN1dPAhiMVAdoYriTIb
         RcDOvj0B+A8OVIYTuM2Jc/pVYEwXwUEWy3isDpaCT6B1PZ0iflZem/lcjvJ0iOOf0ZGV
         tamH9rIve8OcbfwtYwtbVmWzAGnyOwAprU6R4dD2Ftk2lbriN6/AUd8pdK06duzTYlSP
         QX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B5x4poEMUJzzXYvSwoGa8hbTY4sRmkrGTYpqcYzgK+g=;
        b=pi3YyRPblUHjKj7gZVlRAB0JU7x2U93KtIKDMw0mam6hcObMbIiV29pGEWWZMk1X7K
         JOAtWbs9XpIujRgafW40HYR7/2Qf9x9tkO2azNTF4QrW51Q/QpdkPz8aQX3ouD5HSrKG
         UnqKm/iAJKkIK9BZbmkRMU0vRPU47MsLPETqPcuuS5VTK6vypchIyrJ/5qrd4PTwj8eS
         DmOS3YrKgbIFLRBzyQ4bRjuK8wT74VBk3yDbYuPtFemAc90b0iCPsk+NS4jJ20JivoLd
         i2n6JpoUn+y7wA8iTvlG3udYrVq0Et0ai+TjqdqRxyuZRmSyg10nUsak8BGDwAtjp4PT
         7Nqg==
X-Gm-Message-State: APjAAAUu3m0mEnVALXJZIPPbfaOBV02nSfekOK3G2cHZMK+v0DSmZqt5
        C2+Es+zhJqio74DzorDprXE=
X-Google-Smtp-Source: APXvYqw8osSZhRUPynhFYenXweUWbFk7NcJPMeMGiMJ40qwbE8FauIpP66ydl3iPz3fAwoa5JPJIWw==
X-Received: by 2002:a63:778f:: with SMTP id s137mr24145264pgc.147.1571218420560;
        Wed, 16 Oct 2019 02:33:40 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.90.170])
        by smtp.gmail.com with ESMTPSA id s18sm1874667pji.30.2019.10.16.02.33.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 02:33:39 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org,
        nico-linuxsetlocalversion@schottelius.org, rdunlap@infradead.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts: setlocalversion: replace backquote to dollar parenthesis 
Date:   Wed, 16 Oct 2019 15:02:46 +0530
Message-Id: <20191016093246.20000-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch replace backquote to dollar parenthesis syntax for better
readability.

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

