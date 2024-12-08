Return-Path: <linux-kbuild+bounces-5033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFB9E842E
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 08:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2268B165705
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 07:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B7A56446;
	Sun,  8 Dec 2024 07:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvnR1h0x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A184EEB2;
	Sun,  8 Dec 2024 07:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733644620; cv=none; b=t3WM3+KYccejFGWAU4FWGE7GBs5mascmDfGpjpwOZjnErg7gq4eJQBjO8D+O9kyAD9Aamcbo/JQCCIDEn1neY6Fg2isiwHSAkpoE5nvHYZsA6rCtzUH5lSl3PjLgAnUlHFfP8uoDJO0UwEDZn186YgLHiB/iOjaLQj7QyVEhfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733644620; c=relaxed/simple;
	bh=uQ3LxUN3CNwAsMocdDYPazy4x5hP/uieQV+GfKxtuZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LaAB9oMJqyKy6giTx6L/UueGatuIKlET+9cbwkp8HBRzEBsnkMWj3UV4XV6hND2an3WnlQ6LM4Kx0FgJugRi+nKoTvH+4vjuBFMIYkG7UgdKu13Vsuh2yqU2SUZVLajr5GKVGfzErvDvqi79TnKVGVy9IwRbDue0Ngv02i4R4U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvnR1h0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5490CC4CED2;
	Sun,  8 Dec 2024 07:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733644619;
	bh=uQ3LxUN3CNwAsMocdDYPazy4x5hP/uieQV+GfKxtuZc=;
	h=From:To:Cc:Subject:Date:From;
	b=QvnR1h0xXenu347MXaJiazblP8baUfTkSH6hCZm+vgeS3m8mQIs0WwkpQMm4/zq2m
	 nSXlae4sKPWPJcOq4e97+AnaEOsExGCSbRSVOxrX5Kd1QnWz5nP6Yc6i5ZekINqhTw
	 W+jpdl5d/yIRblfyVQwrU6FETyhIrWnSFz3zTnyk2CR0YuuC4oE1/QCwWw/rIVXwWy
	 vewV6IwzTAt4sekL4HddxWLgAFpVS/k2OWgaug6KCJtWJysgu1RWtp6SAKwst/5V3L
	 sxLHdyYBCjsA0hPBtEzwVhV9COHiKoy1qvAeQeWrfDxh5chrJJze3/0CcGXm8DM28S
	 pm0hfPBIJUxig==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: deb-pkg: fix build error with O=
Date: Sun,  8 Dec 2024 16:56:45 +0900
Message-ID: <20241208075653.542535-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 13b25489b6f8 ("kbuild: change working directory to external
module directory with M="), the Debian package build fails if a relative
path is specified with the O= option.

  $ make O=build bindeb-pkg
    [ snip ]
  dpkg-deb: building package 'linux-image-6.13.0-rc1' in '../linux-image-6.13.0-rc1_6.13.0-rc1-6_amd64.deb'.
  Rebuilding host programs with x86_64-linux-gnu-gcc...
  make[6]: Entering directory '/home/masahiro/linux/build'
  /home/masahiro/linux/Makefile:190: *** specified kernel directory "build" does not exist.  Stop.

This occurs because the sub_make_done flag is cleared, even though the
working directory is already in the output directory.

Passing KBUILD_OUTPUT=. resolves the issue.

Fixes: 13b25489b6f8 ("kbuild: change working directory to external module directory with M=")
Reported-by: Charlie Jenkins <charlie@rivosinc.com>
Closes: https://lore.kernel.org/all/Z1DnP-GJcfseyrM3@ghost/
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/install-extmod-build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 64d958ee45f3..d3c5b104c063 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -69,7 +69,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	#
 	# Use the single-target build to avoid the modpost invocation, which
 	# would overwrite Module.symvers.
-	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
+	"${MAKE}" HOSTCC="${CC}" KBUILD_OUTPUT=. KBUILD_EXTMOD="${destdir}" scripts/
 
 	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
 	subdir-y := basic
@@ -78,7 +78,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	EOF
 
 	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
-	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
+	"${MAKE}" HOSTCC="${CC}" KBUILD_OUTPUT=. KBUILD_EXTMOD="${destdir}" scripts/
 
 	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
 fi
-- 
2.43.0


