Return-Path: <linux-kbuild+bounces-5172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329B9F6348
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 11:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5902188238C
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 10:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72D119D087;
	Wed, 18 Dec 2024 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CD0TVQr5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870BE19D080;
	Wed, 18 Dec 2024 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518246; cv=none; b=BVjXPUyQCrlYnPhWadCuFKoXJHxgjwlQ/lA+lUswiAKR7BcMK9W2rlEBfH5lGmArDIJtAslvhnEG7InYlAKTeF2BDZt/NkTcVngHEOkWERhczzDCbKpeIrvkwaNj5+uaFujIG+TBxW64THbjfCyaM/DfWVUB1ZdBtwvZYOacPHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518246; c=relaxed/simple;
	bh=9stzBnrUIf1cL09+/GQ5VxyuG/aOORWUlbvpH5pqI+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/4ZbDkb42n2EWsH6hveAWJ7kVs3GAzq5kHmcHo3lKt/6OSvkT0vM0jpVwz3z0l+4z5rBi1Tnp/Zx4OKB/YJ8+wnH+Su0cXSQ2H3MoR34D5aIGdgiIeBeDKapmhUJxBc5s3OcEztC3Tr+IwcXgUtSJvSn40FRE1oEXF993dKVco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CD0TVQr5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB980C4CECE;
	Wed, 18 Dec 2024 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734518246;
	bh=9stzBnrUIf1cL09+/GQ5VxyuG/aOORWUlbvpH5pqI+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CD0TVQr57oOlfv9gA/Vw78SyhJBwizgO3St5V0oyuGrhZ95gdvk8ujLT/rMkk/JA/
	 ztLhiuucbjGzOpdDLJddE93Igzz2cAD7qcQ7Kwg6JbCUsu3PctHoq/9sR2QPTBZjaS
	 MQOJS4HSxoLr07TYt7TAmxynHuhmFcqrs2bzYkRnjcbyPUx9h2FmLerY1gg8wPTd1V
	 j09hbqkYMvElFHSCpr8ApP9nonypqLzNuYLw1oBhLZOFVtAf57PxFvc8dSWvF/wZru
	 ouc2b+8V6GZR7CQ4pMTtwf01uvp2rkXhJnZq41fQ/A8O350hJXR+k0dpfq7CmdN5+F
	 5stvATtLkOcXw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Christian Heusel <christian@heusel.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH 4/4] kheaders: use 'tar' instead of 'cpio' for copying files
Date: Wed, 18 Dec 2024 19:37:08 +0900
Message-ID: <20241218103716.137489-4-masahiroy@kernel.org>
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

The 'cpio' command is used solely for copying header files to the
temporary directory. However, there is no strong reason to use 'cpio'
for this purpose. For example, scripts/package/install-extmod-build
uses the 'tar' command to copy files.

This commit replaces the use of 'cpio' with 'tar' because 'tar' is
already used in this script to generate kheaders_data.tar.xz anyway.

Performance-wide, there is no significant difference between 'cpio'
and 'tar'.

[Before]

  $ rm -fr kheaders; mkdir kheaders
  $ time sh -c '
  for f in include arch/x86/include
  do
          find "$f" -name "*.h"
  done | cpio --quiet -pd kheaders
  '
  real    0m0.148s
  user    0m0.021s
  sys     0m0.140s

[After]

  $ rm -fr kheaders; mkdir kheaders
  $ time sh -c '
  for f in include arch/x86/include
  do
          find "$f" -name "*.h"
  done | tar -c -f - -T - | tar -xf - -C kheaders
  '
  real    0m0.098s
  user    0m0.024s
  sys     0m0.131s

Revert commit 69ef0920bdd3 ("Docs: Add cpio requirement to changes.rst")
because 'cpio' is not used anywhere else during the kernel build. Please
note that the built-in initramfs is created by usr/gen_init_cpio, so it
does not rely on the external 'cpio' command at all.

Remove 'cpio' from the package build dependencies as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/process/changes.rst |  6 ------
 kernel/gen_kheaders.sh            | 13 ++-----------
 scripts/package/PKGBUILD          |  1 -
 scripts/package/mkdebian          |  2 +-
 4 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 82b5e378eebf..a0beca805362 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -59,7 +59,6 @@ iptables               1.4.2            iptables -V
 openssl & libcrypto    1.0.0            openssl version
 bc                     1.06.95          bc --version
 Sphinx\ [#f1]_         2.4.4            sphinx-build --version
-cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
@@ -536,11 +535,6 @@ mcelog
 
 - <https://www.mcelog.org/>
 
-cpio
-----
-
-- <https://www.gnu.org/software/cpio/>
-
 Networking
 **********
 
diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index ddfd1177567f..55f493d83b8f 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -14,13 +14,6 @@ include/
 arch/$SRCARCH/include/
 "
 
-if ! command -v cpio >/dev/null; then
-	echo >&2 "***"
-	echo >&2 "*** 'cpio' could not be found."
-	echo >&2 "***"
-	exit 1
-fi
-
 # Support incremental builds by skipping archive generation
 # if timestamps of files being archived are not changed.
 
@@ -73,15 +66,13 @@ if [ "$building_out_of_srctree" ]; then
 		cd $srctree
 		for f in $dir_list
 			do find "$f" -name "*.h";
-		done | cpio --quiet -pd "${tmpdir}"
+		done | tar -c -f - -T - | tar -xf - -C "${tmpdir}"
 	)
 fi
 
-# The second CPIO can complain if files already exist which can happen with out
-# of tree builds having stale headers in srctree. Just silence CPIO for now.
 for f in $dir_list;
 	do find "$f" -name "*.h";
-done | cpio --quiet -pdu "${tmpdir}" >/dev/null 2>&1
+done | tar -c -f - -T - | tar -xf - -C "${tmpdir}"
 
 # Always exclude include/generated/utsversion.h
 # Otherwise, the contents of the tarball may vary depending on the build steps.
diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index f83493838cf9..b4e474c05a0a 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -22,7 +22,6 @@ license=(GPL-2.0-only)
 makedepends=(
 	bc
 	bison
-	cpio
 	flex
 	gettext
 	kmod
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index b038a1380b8a..b6dd98ca860b 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -205,7 +205,7 @@ Priority: optional
 Maintainer: $maintainer
 Rules-Requires-Root: no
 Build-Depends: debhelper-compat (= 12)
-Build-Depends-Arch: bc, bison, cpio, flex,
+Build-Depends-Arch: bc, bison, flex,
  gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
  kmod, libelf-dev:native,
  libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
-- 
2.43.0


