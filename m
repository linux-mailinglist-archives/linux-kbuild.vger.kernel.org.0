Return-Path: <linux-kbuild+bounces-2321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1247E9246ED
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 20:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC6C81F22DAB
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 18:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31FB1CE089;
	Tue,  2 Jul 2024 18:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADbFIJ2M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDDF1C2308;
	Tue,  2 Jul 2024 18:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943420; cv=none; b=Naa7ewa3T0g/NjhgAK3UfR7D/JfqtU2JZG/g9fe0c1FOtOAVSAIQ+jlNr4OJW/+ZKsyIVVV9s4nL8jQe2h8NVFN6oDD7Ir4BjMi/o0185yJT9EVNgBlzge6midCzqPbKOVVIHrX/Mn7WZDtD9JtkalrduPXa68jU+pTMIV7Igzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943420; c=relaxed/simple;
	bh=zzOU2P/2RX733uvIXhmTJk0qMFVBXzpz0F9MYY9P1CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9v9rY8gIwRVBa59SlxurqRWfA377D3/C/DVvycC8x8RSuOi4k/xLHeZ1W1NGTPVMx8udhwOKimbmRtgINBBmM3oiwM6C1KtKZSK/6aaxQYbcI22W+UUu2AWD0t9sDa6blmUhTKK0v8Gx6ajjQQPgDnffj8nKIbo9kduQ7btM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADbFIJ2M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80A3C116B1;
	Tue,  2 Jul 2024 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943420;
	bh=zzOU2P/2RX733uvIXhmTJk0qMFVBXzpz0F9MYY9P1CM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ADbFIJ2MkWPBlb9McLjo7MSiCu7ike6JJjdsCmooB4q45vqRUAs9xx3XIsP7Zxe+p
	 14iKFcAkLm2rtTmDsxBJ5gIlad5ooTKr7DEbG72Jw7gdNiliIbqNM13maU6aRq9dWl
	 xTWqMAlmgYvMyAGLYWDmMRtqb/Lf5tZ6bIH2kmUnEqTRqxNk2u1c+Y/hj5Gd+yXpkJ
	 cptlyycnyi44LfnSeGWLNkforWSB24F1XVhwSfbWr4gFs/M/q+eusG2ANrhUSaHmOd
	 j/mwa1qXVVtoD42vIwiG9lROM/nLWW4wsL3yhIE3n1aRq/g3BXOizuZaBpv/eeZ8P3
	 vCDXI1vAEOQJA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 3/3] kbuild: package: add -e and -u options to some shell scripts
Date: Wed,  3 Jul 2024 03:02:42 +0900
Message-ID: <20240702180332.398978-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702180332.398978-1-masahiroy@kernel.org>
References: <20240702180332.398978-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set -e to make these scripts fail on the first error.

Set -u because these scripts are invoked by Makefile, and do not work
properly without necessary variables defined.

I tweaked mkdebian to cope with optional environment variables.

Remove the explicit "test -n ..." from install-extmod-build.

Both options are described in POSIX. [1]

[1]: https://pubs.opengroup.org/onlinepubs/009604499/utilities/set.html

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

Changes in v2:
 - Fix build errors from scripts/package/mkdebian

 scripts/package/builddeb             | 2 +-
 scripts/package/buildtar             | 2 +-
 scripts/package/gen-diff-patch       | 2 ++
 scripts/package/install-extmod-build | 5 +----
 scripts/package/mkdebian             | 8 ++++----
 scripts/package/mkspec               | 2 ++
 6 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index e797ad360f7a..c1757db6aa8a 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -10,7 +10,7 @@
 # specified in KDEB_HOOKDIR) that will be called on package install and
 # removal.
 
-set -e
+set -eu
 
 is_enabled() {
 	grep -q "^$1=y" include/config/auto.conf
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index eb67787f8673..cc87a473c01f 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -11,7 +11,7 @@
 # Wichert Akkerman <wichert@wiggy.net>.
 #
 
-set -e
+set -eu
 
 #
 # Some variables and settings used throughout the script
diff --git a/scripts/package/gen-diff-patch b/scripts/package/gen-diff-patch
index 8a98b7bb78a0..f272f7770ea3 100755
--- a/scripts/package/gen-diff-patch
+++ b/scripts/package/gen-diff-patch
@@ -1,6 +1,8 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 
+set -eu
+
 diff_patch=$1
 
 mkdir -p "$(dirname "${diff_patch}")"
diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 76e0765dfcd6..8cc9e13403ae 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -1,13 +1,10 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 
-set -e
+set -eu
 
 destdir=${1}
 
-test -n "${srctree}"
-test -n "${SRCARCH}"
-
 is_enabled() {
 	grep -q "^$1=y" include/config/auto.conf
 }
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 83c6636fadb8..0cc1913aad30 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -4,7 +4,7 @@
 #
 # Simple script to generate a debian/ directory for a Linux kernel.
 
-set -e
+set -eu
 
 is_enabled() {
 	grep -q "^$1=y" include/config/auto.conf
@@ -19,7 +19,7 @@ if_enabled_echo() {
 }
 
 set_debarch() {
-	if [ -n "$KBUILD_DEBARCH" ] ; then
+	if [ "${KBUILD_DEBARCH:+set}" ]; then
 		debarch="$KBUILD_DEBARCH"
 		return
 	fi
@@ -141,7 +141,7 @@ fi
 
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
-if [ -n "$KDEB_PKGVERSION" ]; then
+if [ "${KDEB_PKGVERSION:+set}" ]; then
 	packageversion=$KDEB_PKGVERSION
 else
 	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/scripts/build-version)
@@ -158,7 +158,7 @@ debarch=
 set_debarch
 
 # Try to determine distribution
-if [ -n "$KDEB_CHANGELOG_DIST" ]; then
+if [ "${KDEB_CHANGELOG_DIST:+set}" ]; then
         distribution=$KDEB_CHANGELOG_DIST
 # In some cases lsb_release returns the codename as n/a, which breaks dpkg-parsechangelog
 elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n "$distribution" ] && [ "$distribution" != "n/a" ]; then
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index cffc2567bef2..77d25dda37e3 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -9,6 +9,8 @@
 #	Patched for non-x86 by Opencon (L) 2002 <opencon@rio.skydome.net>
 #
 
+set -eu
+
 output=$1
 
 mkdir -p "$(dirname "${output}")"
-- 
2.43.0


