Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623E438D86F
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 May 2021 05:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbhEWDRO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 May 2021 23:17:14 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:31288 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbhEWDRN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 May 2021 23:17:13 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14N3EZen018750;
        Sun, 23 May 2021 12:14:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14N3EZen018750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621739676;
        bh=g1onYEGMkfRjd8QsgCOU60uMAbt4fLk/I9gkUJ//b8g=;
        h=From:To:Cc:Subject:Date:From;
        b=q638dZLxiz8YZ+z2ogGizFntECNmgduYMoVcE21g6NDJc7nxaXAfI5jdaRZTNfXT8
         IL3z+CG1fTwbILvoF/yU1v8I/KVrrUOXUsVkkAkW3u9H4jMzeg1FDfkgz3sAgC/DXD
         enq3K71xtgZ13dYuM60UjJmsW6e91GsgC2gxk35lg2YWnBFq7ib3gJ4KlUSrnx3nuG
         zLKXLtWCrd1/t9qpYedtpNHrMQSwKc+Q6uKmSgkWDUY5EajbyBM5aoVWcazbRMPXBG
         RZePtBW6blaDHR5Fv5GTeDpjwKL1AZPVFr37tcTdegnl4S5VAb+pEusiyMVgaeSZFB
         U3DxnGhR59zaw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Maennich <maennich@google.com>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] scripts/setlocalversion: remove mercurial, svn and git-svn supports
Date:   Sun, 23 May 2021 12:14:24 +0900
Message-Id: <20210523031428.164186-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The mercurial, svn, git-svn supports were added by the following commits
without explaining why they are useful for the kernel source tree.

 - 3dce174cfcba ("kbuild: support mercurial in setlocalversion")

 - ba3d05fb6369 ("kbuild: add svn revision information to setlocalversion")

 - ff80aa97c9b4 ("setlocalversion: add git-svn support")

Let's revert all of them, and see if somebody will complain about it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/setlocalversion | 41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index db941f6d9591..879cba956e60 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -79,11 +79,6 @@ scm_version()
 			fi
 		fi
 
-		# Is this git on svn?
-		if git config --get svn-remote.svn.url >/dev/null; then
-			printf -- '-svn%s' "$(git svn find-rev $head)"
-		fi
-
 		# Check for uncommitted changes.
 		# First, with git-status, but --no-optional-locks is only
 		# supported in git >= 2.14, so fall back to git-diff-index if
@@ -96,42 +91,6 @@ scm_version()
 		} | grep -qvE '^(.. )?scripts/package'; then
 			printf '%s' -dirty
 		fi
-
-		# All done with git
-		return
-	fi
-
-	# Check for mercurial and a mercurial repo.
-	if test -d .hg && hgid=$(hg id 2>/dev/null); then
-		# Do we have an tagged version?  If so, latesttagdistance == 1
-		if [ "$(hg log -r . --template '{latesttagdistance}')" = "1" ]; then
-			id=$(hg log -r . --template '{latesttag}')
-			printf '%s%s' -hg "$id"
-		else
-			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
-			if [ -z "$tag" -o "$tag" = tip ]; then
-				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
-				printf '%s%s' -hg "$id"
-			fi
-		fi
-
-		# Are there uncommitted changes?
-		# These are represented by + after the changeset id.
-		case "$hgid" in
-			*+|*+\ *) printf '%s' -dirty ;;
-		esac
-
-		# All done with mercurial
-		return
-	fi
-
-	# Check for svn and a svn repo.
-	if rev=$(LC_ALL=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
-		rev=$(echo $rev | awk '{print $NF}')
-		printf -- '-svn%s' "$rev"
-
-		# All done with svn
-		return
 	fi
 }
 
-- 
2.27.0

