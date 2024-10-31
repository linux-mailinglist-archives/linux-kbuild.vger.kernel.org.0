Return-Path: <linux-kbuild+bounces-4434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C906C9B71CC
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 02:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74EE91F23D25
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 01:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7845A4C1;
	Thu, 31 Oct 2024 01:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC9vdMG3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EAF4D8CF;
	Thu, 31 Oct 2024 01:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730337675; cv=none; b=FRgfSfNETrZwjaiC7DYC1V7hnwTfOgPOWSG5oHei1zgB0Lr+PDBLARLnfxqalGE3DjvI+a6aC4PjpqP23y/gItP494yG19TBzFU7pG7tKDjc40qyPX+LVbWbD1B9gqgLMvXXVU4TBfyYKGjTHoALmUrmK/B1lCSEW3NsQYEzcnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730337675; c=relaxed/simple;
	bh=a9776ARAo44st96MhjZjzQy8NP/+rbnZDlPc7vdC7FI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qytVodvusdv4p4PkFi5Zx8Lbz5SeFQaXjykquxAkM6V8xiO3SQc9hSWLXhv1qdYeJGeBrU+H4S/+2di0WJf0Ukc77BUA1kIPVLRMkJzhTjwgGdEdVfEy6ZEUyHO+S1XIPPAandCuOMHFh2Z0VvFY1UtImmUAlndilbCttQkwHIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC9vdMG3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA63C4CECE;
	Thu, 31 Oct 2024 01:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730337674;
	bh=a9776ARAo44st96MhjZjzQy8NP/+rbnZDlPc7vdC7FI=;
	h=From:To:Cc:Subject:Date:From;
	b=ZC9vdMG3as3Ga9HKirUw8ZCFP4qkWmawJH4WWBpwBtR9LBcaRjMhDI1W2tkQ8yEfi
	 6WoYJNyzeV1NUapqpkXbhEqqFCVyKBI45WwAMo9krQlSD6i4wW5UOzKeSBg2MuwMqP
	 1OOnpIrh92hEAiA0ukw1IcU+c+d9lRhNcyCznQTUKS3/Q2/LuafAk6JNnuU6SprWOP
	 9ncc8LkEwe/Ybqha8JUGHb/Rc7xNgKMgsFiKPEyyLgZ+/BdlU0fBZDV/iLnKgsxu4S
	 c3jxtDvwL2lp/w8VsgM9KuA7Mu+8RESSDXT8pVWi0tHr6f4wyqYM93ablbm0ffXhIk
	 879C2k56rXGsQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] setlocalversion: Add workaround for "git describe" performance issue
Date: Wed, 30 Oct 2024 18:20:21 -0700
Message-ID: <309549cafdcfe50c4fceac3263220cc3d8b109b2.1730337435.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If HEAD isn't associated with an annotated tag, a bug (or feature?) in
"git describe --match" causes it to search every commit in the entire
repository looking for additional match candidates.  Instead of it
taking a fraction of a second, it adds 10-15 seconds to the beginning of
every kernel build.

Fix it by adding an additional dummy match which is slightly further
away from the most recent one, along with setting the max candidate
count to 1 (not 2, apparently another bug).

Before:

  $ git checkout c1e939a21eb1
  $ time make kernel/fork.o -s

  real	0m12.403s
  user	0m11.591s
  sys	0m0.967s

After:

  $ time make kernel/fork.o -s

  real	0m1.119s
  user	0m0.658s
  sys	0m0.659s

Link: https://lore.kernel.org/git/20241030044322.b5n3ji2n6gaeo5u6@treble.attlocal.net/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/setlocalversion | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 38b96c6797f4..bb8c0bcb7368 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -57,6 +57,8 @@ scm_version()
 		return
 	fi
 
+	githack=" --match=v6.11 --candidates=1"
+
 	# mainline kernel:  6.2.0-rc5  ->  v6.2-rc5
 	# stable kernel:    6.1.7      ->  v6.1.7
 	version_tag=v$(echo "${KERNELVERSION}" | sed -E 's/^([0-9]+\.[0-9]+)\.0(.*)$/\1\2/')
@@ -67,7 +69,7 @@ scm_version()
 	tag=${file_localversion#-}
 	desc=
 	if [ -n "${tag}" ]; then
-		desc=$(git describe --match=$tag 2>/dev/null)
+		desc=$(git describe --match=$tag $githack 2>/dev/null)
 	fi
 
 	# Otherwise, if a localversion* file exists, and the tag
@@ -76,13 +78,13 @@ scm_version()
 	# it. This is e.g. the case in linux-rt.
 	if [ -z "${desc}" ] && [ -n "${file_localversion}" ]; then
 		tag="${version_tag}${file_localversion}"
-		desc=$(git describe --match=$tag 2>/dev/null)
+		desc=$(git describe --match=$tag $githack 2>/dev/null)
 	fi
 
 	# Otherwise, default to the annotated tag derived from KERNELVERSION.
 	if [ -z "${desc}" ]; then
 		tag="${version_tag}"
-		desc=$(git describe --match=$tag 2>/dev/null)
+		desc=$(git describe --match=$tag $githack 2>/dev/null)
 	fi
 
 	# If we are at the tagged commit, we ignore it because the version is
-- 
2.47.0


