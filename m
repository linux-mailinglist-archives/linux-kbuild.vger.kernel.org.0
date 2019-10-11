Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0C0D3776
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 04:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbfJKCUl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Oct 2019 22:20:41 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44797 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbfJKCUl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Oct 2019 22:20:41 -0400
Received: by mail-pl1-f193.google.com with SMTP id q15so3709475pll.11
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2019 19:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loxMCeFc1Im/5JB1T4NFelfcg9Da9FCw06HFDLxSsv0=;
        b=X5bwM1VpFLEg1fdKHZqtPC1K5ogLW3r26nZb+rRRao+FJbQqATuGy4cHLTCK7WOD02
         yHCZfu3EJ8oNUgOyrh+ynPvgwQHXiCPL8q3+fzRD98bCGZEls1SjcmsjppUR3WtG9mLi
         Zv7fnRarRXrbKG7LRPls96YBMePA8esnfHbRfvOnJidhQwyvFubUVyBmDu+TT3ot8mId
         VOPra/hgxFwsjLUUUqQmP4UVh5DznJ9f7rQx8y2ShL+qwXrR5blwPTBR0m92wBzHKizf
         mmBa4+DawxHrb73K1TG2K0qiSStqVAIGgppK5/EFMbcXeicJH7YED2Vn8mkc4Uas5eFX
         VrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loxMCeFc1Im/5JB1T4NFelfcg9Da9FCw06HFDLxSsv0=;
        b=PfTmBIUvMRGhIgd+LRFAykSDj65AjotS+VvWATmGwKC6l4QsiluH4BbSPeSMygKpCz
         rDaNl4LxnZ4fNtroHqSpLVO7w/I1X7E5CVtsLkQ1gMKZWxDMbA4n2Jlfii3mDsLcFHRR
         yCIa+vuv6zo4iPyEmebDJjcGB6vhqXRO42wE7Bya7ejpIghPkbyk+aE9o/dh4kws/quD
         kbGszeX8wYJjTN9q/02DiCoaQv8g2O6eoXkh+tbwp0Cb3AMI4QG+SQNcpvpsY1WlOQ4J
         2jSu9CEKdiptpAvXP+frybz8qclRVKuNV4V7xPD20P3bi+PDH2uySE2CTU9Z2CzYQg1S
         op0w==
X-Gm-Message-State: APjAAAXtyb23ujSrngbRgsm8pW5KdAmO2oTkhWON3iGpwr+zRu4D0bLM
        qqbUungIQRxd7IxahCYSRO48VTWobvCg4w==
X-Google-Smtp-Source: APXvYqxdzo8dAS4gDkSsqR/rY/VHRnm2NIQNqUog4rOPfFORLy2zVYZFEEXL0WHMAWK8iM7qwCy8QA==
X-Received: by 2002:a17:902:a610:: with SMTP id u16mr12773920plq.200.1570760439306;
        Thu, 10 Oct 2019 19:20:39 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.90.173])
        by smtp.gmail.com with ESMTPSA id v28sm7644384pgn.17.2019.10.10.19.20.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 19:20:38 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Modern Bash syntax, replace backquote to dollar parenthesis
Date:   Fri, 11 Oct 2019 07:47:59 +0530
Message-Id: <20191011021759.28960-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <yamada.masahiro@socionext.com,michal.lkml@markovi.net,linux-kbuild@vger.kernel.org>
References: <yamada.masahiro@socionext.com,michal.lkml@markovi.net,linux-kbuild@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 setlocalversion | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)
 create mode 100755 setlocalversion

diff --git a/setlocalversion b/setlocalversion
new file mode 100755
index 000000000000..220dae0db3f1
--- /dev/null
+++ b/setlocalversion
@@ -0,0 +1,183 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# This scripts adds local version information from the version
+# control systems git, mercurial (hg) and subversion (svn).
+#
+# If something goes wrong, send a mail the kernel build mailinglist
+# (see MAINTAINERS) and CC Nico Schottelius
+# <nico-linuxsetlocalversion -at- schottelius.org>.
+#
+#
+
+usage() {
+	echo "Usage: $0 [--save-scmversion] [srctree]" >&2
+	exit 1
+}
+
+scm_only=false
+srctree=.
+if test "$1" = "--save-scmversion"; then
+	scm_only=true
+	shift
+fi
+if test $# -gt 0; then
+	srctree=$1
+	shift
+fi
+if test $# -gt 0 -o ! -d "$srctree"; then
+	usage
+fi
+
+scm_version()
+{
+	local short
+	short=false
+
+	cd "$srctree"
+	if test -e .scmversion; then
+		cat .scmversion
+		return
+	fi
+	if test "$1" = "--short"; then
+		short=true
+	fi
+
+	# Check for git and a git repo.
+	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
+	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
+
+		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
+		# it, because this version is defined in the top level Makefile.
+		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
+
+			# If only the short version is requested, don't bother
+			# running further git commands
+			if $short; then
+				echo "+"
+				return
+			fi
+			# If we are past a tagged commit (like
+			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
+			if atag="`git describe 2>/dev/null`"; then
+				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+
+			# If we don't have a tag at all we print -g{commitish}.
+			else
+				printf '%s%s' -g $head
+			fi
+		fi
+
+		# Is this git on svn?
+		if git config --get svn-remote.svn.url >/dev/null; then
+			printf -- '-svn%s' "`git svn find-rev $head`"
+		fi
+
+		# Check for uncommitted changes.
+		# First, with git-status, but --no-optional-locks is only
+		# supported in git >= 2.14, so fall back to git-diff-index if
+		# it fails. Note that git-diff-index does not refresh the
+		# index, so it may give misleading results. See
+		# git-update-index(1), git-diff-index(1), and git-status(1).
+		if {
+			git --no-optional-locks status -uno --porcelain 2>/dev/null ||
+			git diff-index --name-only HEAD
+		} | grep -qvE '^(.. )?scripts/package'; then
+			printf '%s' -dirty
+		fi
+
+		# All done with git
+		return
+	fi
+
+	# Check for mercurial and a mercurial repo.
+	if test -d .hg && hgid=`hg id 2>/dev/null`; then
+		# Do we have an tagged version?  If so, latesttagdistance == 1
+		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
+			id=`hg log -r . --template '{latesttag}'`
+			printf '%s%s' -hg "$id"
+		else
+			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
+			if [ -z "$tag" -o "$tag" = tip ]; then
+				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
+				printf '%s%s' -hg "$id"
+			fi
+		fi
+
+		# Are there uncommitted changes?
+		# These are represented by + after the changeset id.
+		case "$hgid" in
+			*+|*+\ *) printf '%s' -dirty ;;
+		esac
+
+		# All done with mercurial
+		return
+	fi
+
+	# Check for svn and a svn repo.
+	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
+		rev=`echo $rev | awk '{print $NF}'`
+		printf -- '-svn%s' "$rev"
+
+		# All done with svn
+		return
+	fi
+}
+
+collect_files()
+{
+	local file res=
+
+	for file; do
+		case "$file" in
+		*\~*)
+			continue
+			;;
+		esac
+		if test -e "$file"; then
+			res="$res$(cat "$file")"
+		fi
+	done
+	echo "$res"
+}
+
+if $scm_only; then
+	if test ! -e .scmversion; then
+		res=$(scm_version)
+		echo "$res" >.scmversion
+	fi
+	exit
+fi
+
+if test -e include/config/auto.conf; then
+	. include/config/auto.conf
+else
+	echo "Error: kernelrelease not valid - run 'make prepare' to update it" >&2
+	exit 1
+fi
+
+# localversion* files in the build and source directory
+res="$(collect_files localversion*)"
+if test ! "$srctree" -ef .; then
+	res="$res$(collect_files "$srctree"/localversion*)"
+fi
+
+# CONFIG_LOCALVERSION and LOCALVERSION (if set)
+res="${res}${CONFIG_LOCALVERSION}${LOCALVERSION}"
+
+# scm version string if not at a tagged commit
+if test "$CONFIG_LOCALVERSION_AUTO" = "y"; then
+	# full scm version string
+	res="$res$(scm_version)"
+else
+	# append a plus sign if the repository is not in a clean
+	# annotated or signed tagged state (as git describe only
+	# looks at signed or annotated tags - git tag -a/-s) and
+	# LOCALVERSION= is not specified
+	if test "${LOCALVERSION+set}" != "set"; then
+		scm=$(scm_version --short)
+		res="$res${scm:++}"
+	fi
+fi
+
+echo "$res"
-- 
2.21.0

