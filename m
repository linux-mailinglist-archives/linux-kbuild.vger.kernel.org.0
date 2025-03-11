Return-Path: <linux-kbuild+bounces-6066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF1A5CEC9
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F46A3B32D3
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C810C266B5D;
	Tue, 11 Mar 2025 19:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsu0BfO8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B90266B59;
	Tue, 11 Mar 2025 19:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719763; cv=none; b=PNMal+058igwesex1ngpy/VvYu+hr6SJIaTlme0XklZwChyWa+lZKtGtE4fql0/CNo2zgKzeVXZ9jIg4+41uefwOE+jiO7TNIDoVc7An5Rv1T6fQVD8ewT311HqnYhPEFYdKBWQm09rjpDGL7ajsZBgHf04ogJdDYGaJuUyhoYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719763; c=relaxed/simple;
	bh=8bj9ZDMyTlueUZDlB2buhvlSJIb+8KSxh35El9mE13Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cG+l8BG3LSsERo7w/PbF+RIxzRTWWXmaDuc8bp9qDylR+Eas88ibvM3sc3YxQY8mv38yKmMOmdZyuYM6a46CnzebZUVFZGRQKNd15R72tzAvBkUP8nD9GMRpcSfojG/em0gUYKjsjn5dZRIZmBlVwGYljiq8TMev850OUkN/IEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsu0BfO8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ECCC4CEEA;
	Tue, 11 Mar 2025 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719763;
	bh=8bj9ZDMyTlueUZDlB2buhvlSJIb+8KSxh35El9mE13Y=;
	h=From:To:Cc:Subject:Date:From;
	b=qsu0BfO85CvLqrGgn42hjojunM6DBWau6GgtdT4DK+5ReIuMXvIVsyXw/ie3LU8n7
	 oMHA3LoIzcB4Z8qhDXByOB/aWcu9e1RhZLUIM8OhEa7m0Opw9pH57ysGp2lgRurh55
	 X51qAtEdKyHSNJrmml7hCmFVW8b2L76cwR+wUyAU+eg3aRwLjSWyDbRc9thkmKj9xH
	 Y/+AsTZRgmwFkS7DZlBl8owZhZMt7pQCcmBvXviYR6t1CdNodgZkbneiXFZHjkJK2j
	 wXRp2K3gFicMLcXYKC0I8Oc6JSTynfcnqwxDB7TFQ00+r++aKfCzvxPMJ04QrMGm9S
	 92F4Of8NrOk1g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: deb-pkg: remove "version" variable in mkdebian
Date: Wed, 12 Mar 2025 04:02:24 +0900
Message-ID: <20250311190238.634226-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

${version} and ${KERNELRELEASE} are the same.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/mkdebian | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 80ed96561993..6685d13737c1 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -163,7 +163,6 @@ while [ $# -gt 0 ]; do
 done
 
 # Some variables and settings used throughout the script
-version=$KERNELRELEASE
 if [ "${KDEB_PKGVERSION:+set}" ]; then
 	packageversion=$KDEB_PKGVERSION
 else
@@ -222,11 +221,11 @@ Build-Depends-Arch: bc, bison, flex,
  python3:native, rsync
 Homepage: https://www.kernel.org/
 
-Package: $packagename-$version
+Package: $packagename-${KERNELRELEASE}
 Architecture: $debarch
-Description: Linux kernel, version $version
+Description: Linux kernel, version ${KERNELRELEASE}
  This package contains the Linux kernel, modules and corresponding other
- files, version: $version.
+ files, version: ${KERNELRELEASE}.
 EOF
 
 if [ "${SRCARCH}" != um ]; then
@@ -245,11 +244,11 @@ EOF
 if is_enabled CONFIG_MODULES; then
 cat <<EOF >> debian/control
 
-Package: linux-headers-$version
+Package: linux-headers-${KERNELRELEASE}
 Architecture: $debarch
 Build-Profiles: <!pkg.${sourcename}.nokernelheaders>
-Description: Linux kernel headers for $version on $debarch
- This package provides kernel header files for $version on $debarch
+Description: Linux kernel headers for ${KERNELRELEASE} on $debarch
+ This package provides kernel header files for ${KERNELRELEASE} on $debarch
  .
  This is useful for people who need to build external modules
 EOF
@@ -259,11 +258,11 @@ fi
 if is_enabled CONFIG_DEBUG_INFO; then
 cat <<EOF >> debian/control
 
-Package: linux-image-$version-dbg
+Package: linux-image-${KERNELRELEASE}-dbg
 Section: debug
 Architecture: $debarch
 Build-Profiles: <!pkg.${sourcename}.nokerneldbg>
-Description: Linux kernel debugging symbols for $version
+Description: Linux kernel debugging symbols for ${KERNELRELEASE}
  This package will come in handy if you need to debug the kernel. It provides
  all the necessary debug symbols for the kernel and its modules.
 EOF
-- 
2.43.0


