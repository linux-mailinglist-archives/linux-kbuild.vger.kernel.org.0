Return-Path: <linux-kbuild+bounces-5171-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 289F99F6345
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 11:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2E718822D1
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 10:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA6019B5A7;
	Wed, 18 Dec 2024 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BX2mtyTB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E919AD87;
	Wed, 18 Dec 2024 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518243; cv=none; b=KQICHfcTPEmnP2Jog+Te4l9riuCE+EFq2W+W9SKc1wY0zhI15x/+DdlLijqdSOiTUwCSox1b0ra+RortTrj0cwZqv8xSlXaFv1CnRS2lr1nUz6rz9fhOr5y3Ll3YeNCBHqJnY7i98o+ihnFdfWfNCOi8HwC3QbarvL7pQk29bTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518243; c=relaxed/simple;
	bh=jaubFrgndVyh3y3qFbczlUUlLcDocMf5rKrIb9MfVFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0+OeZT8FoJDwOSYoGuhmLBN57MdlTFZoxM1XQPOiuFZzNm9aHYkJdvwYjLjLBYbbDzih4QimsCUXybgewKMww+7mOVoLLH+o50cGksTsKKbhUKRchC5X2oCDSbxX05Z0NqIvHCE4g015Q6dAX14hRbt7vrRN7w94/dPBVssIxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BX2mtyTB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FE7C4CEDE;
	Wed, 18 Dec 2024 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734518243;
	bh=jaubFrgndVyh3y3qFbczlUUlLcDocMf5rKrIb9MfVFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BX2mtyTByLJhnPAEHEebsMm1svrm7lmcQoyg345aAwjTe9jeaS6RLDf+e1C26UXGB
	 9TdVwqiBEUGP5aUnqfbOj9VReaTOPpsWpwX1GD6IFcwxGc+fmE379u9qkhTKwB1P+o
	 y7ZQ3J/4thWotsLf9+pbz3U+AfkEQRqAn7inlzQ9pXseE8IBQb8dYRxS68NPPjg9aU
	 gnioB5ZEkIkA24WQAH564J2Eu6yrMfbjs4LSkE0lFFCigt3Rvjza+5Z50a9aLoCtN3
	 lqlur2B4rDDHMegU7c7jksDufv5TQZ3SOZKJQcFhtsV5m6GS2a6wa1Atjiyb/X/4MG
	 6cCVOZcAomohA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/4] kheaders: rename the 'cpio_dir' variable to 'tmpdir'
Date: Wed, 18 Dec 2024 19:37:07 +0900
Message-ID: <20241218103716.137489-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218103716.137489-1-masahiroy@kernel.org>
References: <20241218103716.137489-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next commit will get rid of the use of 'cpio' command, as there is
no strong reason to use it just for copying files.

Before that, this commit renames the 'cpio_dir' variable to 'tmpdir'.

No functional changes are intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/gen_kheaders.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index c2eba1a0d772..ddfd1177567f 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -7,7 +7,7 @@ set -e
 sfile="$(readlink -f "$0")"
 outdir="$(pwd)"
 tarfile=$1
-cpio_dir=$outdir/${tarfile%/*}/.tmp_cpio_dir
+tmpdir=$outdir/${tarfile%/*}/.tmp_dir
 
 dir_list="
 include/
@@ -65,15 +65,15 @@ fi
 
 echo "  GEN     $tarfile"
 
-rm -rf $cpio_dir
-mkdir $cpio_dir
+rm -rf "${tmpdir}"
+mkdir "${tmpdir}"
 
 if [ "$building_out_of_srctree" ]; then
 	(
 		cd $srctree
 		for f in $dir_list
 			do find "$f" -name "*.h";
-		done | cpio --quiet -pd $cpio_dir
+		done | cpio --quiet -pd "${tmpdir}"
 	)
 fi
 
@@ -81,23 +81,23 @@ fi
 # of tree builds having stale headers in srctree. Just silence CPIO for now.
 for f in $dir_list;
 	do find "$f" -name "*.h";
-done | cpio --quiet -pdu $cpio_dir >/dev/null 2>&1
+done | cpio --quiet -pdu "${tmpdir}" >/dev/null 2>&1
 
 # Always exclude include/generated/utsversion.h
 # Otherwise, the contents of the tarball may vary depending on the build steps.
-rm -f "${cpio_dir}/include/generated/utsversion.h"
+rm -f "${tmpdir}/include/generated/utsversion.h"
 
 # Remove comments except SDPX lines
-find $cpio_dir -type f -print0 |
+find "${tmpdir}" -type f -print0 |
 	xargs -0 -P8 -n1 perl -pi -e 'BEGIN {undef $/;}; s/\/\*((?!SPDX).)*?\*\///smg;'
 
 # Create archive and try to normalize metadata for reproducibility.
 tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
     --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
-    -I $XZ -cf $tarfile -C $cpio_dir/ . > /dev/null
+    -I $XZ -cf $tarfile -C "${tmpdir}/" . > /dev/null
 
 echo $headers_md5 > kernel/kheaders.md5
 echo "$this_file_md5" >> kernel/kheaders.md5
 echo "$(md5sum $tarfile | cut -d ' ' -f1)" >> kernel/kheaders.md5
 
-rm -rf $cpio_dir
+rm -rf "${tmpdir}"
-- 
2.43.0


