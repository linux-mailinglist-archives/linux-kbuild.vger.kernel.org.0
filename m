Return-Path: <linux-kbuild+bounces-4708-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C469D1BC2
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 00:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DDA81F225F0
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 23:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344A2194A49;
	Mon, 18 Nov 2024 23:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4bELM7p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE4C14F102;
	Mon, 18 Nov 2024 23:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731971744; cv=none; b=bn/ullFraYIPbDfD1y2AD3UxiDormPq1ekklY/G3XsCEbtc7aTQ0SNfCN9bJrgc0s+kTsH+EhmXiuqcmB8+smW/RB/bH8z0OgECLqpyTmCffNDHhr5AFCrxOexAgqwfZ+bH/XBf2SUld5bwQq01nRcBjGjz79DkTCebA/vv8NV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731971744; c=relaxed/simple;
	bh=QtJ+4nINPLpfPkViaGJ+dnTYaDn2hqDhQ0bOhnKRTjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kP+6c+NxPcETxz8Eonsr2HSF8gw/a8JFJownEYe03QoQ+pTRbvngJiKGc8tyHBPYcr84+lqzeYIw/R2WZE9WJqDAQZpdZ8svFiP/ey1rdsdfvAPudIzSVT0csxcyW5ZwDpqgt7o+SkjvoQbLIQ4IHtQ2agMOg5hRFzIUwn3nEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4bELM7p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92715C4CECC;
	Mon, 18 Nov 2024 23:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731971743;
	bh=QtJ+4nINPLpfPkViaGJ+dnTYaDn2hqDhQ0bOhnKRTjk=;
	h=From:To:Cc:Subject:Date:From;
	b=e4bELM7plqa4C38m3W0cYVTTjSjv3W+4SeDS4gYgEJZt1x6p/QyMrlcu6iOlSE+oR
	 yYJOIOrQ4QmYVNwdCT2J8KeyDZSxOO91eo4jid/YbC3xNpqMbezxKqp6md2EGeGI2J
	 Q//PToBLOTedLo+GR/Jb15ygJPBgm4B5kls1b7WjFVnB4TmFw9+cfBBoFPQDJo4mLH
	 ut12QQ8LShBUCtqrqzpi1JMZAAb+3VgVQA7FFpxSEFsfrHr095r5bf5+Y597hNQ3MK
	 sVXMh5Y5yUr3Pktnfm6P3bVP8etJPBhYjhQ58uj1lNenxEY8W1yFHvkGV5I96OCqcc
	 8pVJ3chj8n0+Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] setlocalversion: add -e option
Date: Tue, 19 Nov 2024 08:09:06 +0900
Message-ID: <20241118231534.1351938-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the -e option to ensure this script fails on any unexpected errors.

Without this change, the kernel build may continue running with an
incorrect string in include/config/kernel.release.

Currently, try_tag() returns 1 when the expected tag is not found as an
ancestor, but this is a case where the script should continue.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

After '[PATCH v3] setlocalversion: work around "git describe" performance',
I need to remove "|| return 1" statements anyway, as it is not suitable
for the -e option.

  if []; then
      ...
  fi

is more consistent with the existing code.



 scripts/setlocalversion | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 5818465abba9..28169d7e143b 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -10,6 +10,8 @@
 #
 #
 
+set -e
+
 usage() {
 	echo "Usage: $0 [--no-local] [srctree]" >&2
 	exit 1
@@ -34,7 +36,9 @@ try_tag() {
 	tag="$1"
 
 	# Is $tag an annotated tag?
-	[ "$(git cat-file -t "$tag" 2> /dev/null)" = tag ] || return 1
+	if [ "$(git cat-file -t "$tag" 2> /dev/null)" != tag ]; then
+		 return
+	fi
 
 	# Is it an ancestor of HEAD, and if so, how many commits are in $tag..HEAD?
 	# shellcheck disable=SC2046 # word splitting is the point here
@@ -43,12 +47,12 @@ try_tag() {
 	# $1 is 0 if and only if $tag is an ancestor of HEAD. Use
 	# string comparison, because $1 is empty if the 'git rev-list'
 	# command somehow failed.
-	[ "$1" = 0 ] || return 1
+	if [ "$1" != 0 ]; then
+		return
+	fi
 
 	# $2 is the number of commits in the range $tag..HEAD, possibly 0.
 	count="$2"
-
-	return 0
 }
 
 scm_version()
-- 
2.43.0


