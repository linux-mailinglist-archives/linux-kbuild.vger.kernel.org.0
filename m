Return-Path: <linux-kbuild+bounces-2062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B89040E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 18:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BECB4282FC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4433BB25;
	Tue, 11 Jun 2024 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzJrUbQ5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF53B2BB;
	Tue, 11 Jun 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718122192; cv=none; b=aKgjuC0lIkt8HBDOzHMOcGDBYylqpKKUK54XymBQu3VGgPXwruZUMFL7aQhspgal0CXuNx3D9zDmFlCq1q10KT6ozAkQoyo0w1p0CzmKuuAYCm3cXjA/+fXlSRXHWKlSJvAPElfu654Wer2vq5Y74xXRkQLf5fTZ0dJjGnDb6Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718122192; c=relaxed/simple;
	bh=InHUCCrWIUFRcGWCm879kdeKx2xK0njLx4xo0yJaoQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POUA5jRmemYgI8h0VsMdEhMpEgXps3jJC2x+x9DP8deytLfO9jeetkMvWvoeQaMiK9wllvgK22YoS5eqgSp/x7r5MHjBMJPGAEuQsXFpwAijRUw+d8/tjoCv3KRdpBKtasfQvDtzw4KXu0sQC/31tMFQUF3mdjayRbLxaKTfy1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzJrUbQ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562F0C32789;
	Tue, 11 Jun 2024 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718122192;
	bh=InHUCCrWIUFRcGWCm879kdeKx2xK0njLx4xo0yJaoQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tzJrUbQ5TMbgNT7M5J6uGoCkl8Ei+pA4auRmkVgjK+gDyllQf1DkuJyaaa5xtEMhR
	 o87/m7tAx+MK0pefrWAzZnbw4YgmqpqNbH+69pBvajQaeXXrVjwoGacNCSmaf6+LTH
	 ISLhGL2TvgEcnzYGitq2+SVgvyqJxvUnrdUxZ35Tiwf2gCTzR++qHulvzviXTAXt7U
	 cb8Y/Hz0qqWj888rHLO5q9yQr62j9Aai8Dn2wcEEHcU8bI+3CApP4Ugq8ptzzgVBIX
	 61ssk0zu4Zg/TqUL3xki/BgvsogN2lTwyMhBk7ubCF/ab1LKzDkj00Oo2qNMjdOR5p
	 Jh57qTNwWTH2Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/2] kbuild: package: add -e and -u options to shell scripts
Date: Wed, 12 Jun 2024 01:08:06 +0900
Message-ID: <20240611160938.3511096-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611160938.3511096-1-masahiroy@kernel.org>
References: <20240611160938.3511096-1-masahiroy@kernel.org>
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

Remove the explicit "test -n ..." from scripts/package/install-extmod-build.

Both options are described in POSIX. [1]

[1]: https://pubs.opengroup.org/onlinepubs/009604499/utilities/set.html

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb             | 2 +-
 scripts/package/buildtar             | 2 +-
 scripts/package/gen-diff-patch       | 2 ++
 scripts/package/install-extmod-build | 5 +----
 scripts/package/mkdebian             | 2 +-
 scripts/package/mkspec               | 2 ++
 6 files changed, 8 insertions(+), 7 deletions(-)

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
index 070149c985fe..ecfeb34b99aa 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -4,7 +4,7 @@
 #
 # Simple script to generate a debian/ directory for a Linux kernel.
 
-set -e
+set -eu
 
 is_enabled() {
 	grep -q "^$1=y" include/config/auto.conf
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index ce201bfa8377..cc046ac74bf9 100755
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


