Return-Path: <linux-kbuild+bounces-4962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083939E1B06
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 12:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10108B3F6B8
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCCE1E5718;
	Tue,  3 Dec 2024 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S49ISk3b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4961E5712;
	Tue,  3 Dec 2024 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224422; cv=none; b=IjFxSsk2cZI13EuM49lrCq8fnMJG638Z7LRfOycV7Ma2CNrpxnePBGk6gGDLGNQZFuw+olKNazn3v7cxzktYOhMs200v52pC3UIvaJUlnO3mXhmTm2Z0mTq/K+2WnR1AKUSYzJn5LcpoZXPL7xr7gBKqUSZJjlCShpkGf0zJyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224422; c=relaxed/simple;
	bh=rOeCeaD8RbHOy2EdA1lamNP0ZONIbYQ5vVg8n94CjVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=keKvNL0RBZ4mw3/vTGheAnNZVdMlvE5W9uYgDyx1HXB0LJB71BnafKe0JzXbB4b8BQ3nxOcYjyWpsPKte0gOuL53C/BVXiKEmZT1tsOi/KKEDzBw6eMIwBcAdURHmKQ7LBVBi0iQaDEnSpXdcYwQPQPq0t3VEZ7XQIYbIWxqd9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S49ISk3b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABE3C4CECF;
	Tue,  3 Dec 2024 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733224421;
	bh=rOeCeaD8RbHOy2EdA1lamNP0ZONIbYQ5vVg8n94CjVw=;
	h=From:To:Cc:Subject:Date:From;
	b=S49ISk3b4HD+MdRR22+C5enP3QTno5+6m8rEu1Id0Dsg1EDzIkMmSBdU0Ro1KbZHe
	 T8FXCXlwBepWuT0fMd+9Oj0dFFBDj8wbzQ1uI8kVmq4/z3Rqxs5xn0fjaRTeU0r7xe
	 CKdI0g1NcBMV+Zclo/qcRg58NIp5nF0l0IGPj8Qvav5s051AWaxdE54vHSxNbuJsRr
	 bAWgU0Aeg0JnUeniO1gFHP9ST/PW5134iuqxR94nZjXCw6atqyZll8LikXnvvAfnLp
	 C8wVIJ2U3Xqa/jhuq3nPqdAc98t/st7XOjF3cfGCZvtGw1V1H79Kkal8o+//4IqvMV
	 +y97hqYpwi76A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: refactor cross-compiling linux-headers package
Date: Tue,  3 Dec 2024 20:13:31 +0900
Message-ID: <20241203111334.3331231-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 13b25489b6f8 ("kbuild: change working directory to external
module directory with M="), when cross-building host programs for the
linux-headers package, the "Entering directory" and "Leaving directory"
messages appear multiple times, and each object path shown is relative
to the working directory. This makes it difficult to track which objects
are being rebuilt.

In hindsight, using the external module build (M=) was not a good idea.

This commit simplifies the code by leveraging the run-command target,
resulting in a cleaner build log again.

[Before]

  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
    [ snip ]
  Rebuilding host programs with aarch64-linux-gnu-gcc...
  make[5]: Entering directory '/home/masahiro/linux'
  make[6]: Entering directory '/home/masahiro/linux/debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+'
    HOSTCC  scripts/kallsyms
    HOSTCC  scripts/sorttable
    HOSTCC  scripts/asn1_compiler
  make[6]: Leaving directory '/home/masahiro/linux/debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+'
  make[5]: Leaving directory '/home/masahiro/linux'
  make[5]: Entering directory '/home/masahiro/linux'
  make[6]: Entering directory '/home/masahiro/linux/debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+'
    HOSTCC  scripts/basic/fixdep
    HOSTCC  scripts/mod/modpost.o
    HOSTCC  scripts/mod/file2alias.o
    HOSTCC  scripts/mod/sumversion.o
    HOSTCC  scripts/mod/symsearch.o
    HOSTLD  scripts/mod/modpost
  make[6]: Leaving directory '/home/masahiro/linux/debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+'
  make[5]: Leaving directory '/home/masahiro/linux'

[After]

  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
    [ snip ]
    HOSTCC  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/basic/fixdep
    HOSTCC  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/kallsyms
    HOSTCC  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/sorttable
    HOSTCC  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/asn1_compiler
    HOSTCC  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/mod/modpost.o
    HOSTCC  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/mod/file2alias.o
    HOSTCC  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/mod/sumversion.o
    HOSTCC  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/mod/symsearch.o
    HOSTLD  debian/linux-headers-6.13.0-rc1+/usr/src/linux-headers-6.13.0-rc1+/scripts/mod/modpost

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/install-extmod-build | 31 ++++++----------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 64d958ee45f3..47d752249547 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -49,38 +49,19 @@ mkdir -p "${destdir}"
 # This caters to host programs that participate in Kbuild. objtool and
 # resolve_btfids are out of scope.
 if [ "${CC}" != "${HOSTCC}" ]; then
-	echo "Rebuilding host programs with ${CC}..."
-
-	# This leverages external module building.
-	# - Clear sub_make_done to allow the top-level Makefile to redo sub-make.
-	# - Filter out --no-print-directory to print "Entering directory" logs
-	#   when Make changes the working directory.
-	unset sub_make_done
-	MAKEFLAGS=$(echo "${MAKEFLAGS}" | sed s/--no-print-directory//)
-
-	cat <<-'EOF' >  "${destdir}/Kbuild"
-	subdir-y := scripts
+	cat "${destdir}/scripts/Makefile" - <<-'EOF' > "${destdir}/scripts/Kbuild"
+	subdir-y += basic
+	hostprogs-always-y += mod/modpost
+	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
 	EOF
 
 	# HOSTCXX is not overridden. The C++ compiler is used to build:
 	# - scripts/kconfig/qconf, which is unneeded for external module builds
 	# - GCC plugins, which will not work on the installed system even after
 	#   being rebuilt.
-	#
-	# Use the single-target build to avoid the modpost invocation, which
-	# would overwrite Module.symvers.
-	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC=$(CC) $(build)='"${destdir}"/scripts
 
-	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
-	subdir-y := basic
-	hostprogs-always-y := mod/modpost
-	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
-	EOF
-
-	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
-	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
-
-	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
+	rm -f "${destdir}/scripts/Kbuild"
 fi
 
 find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
-- 
2.43.0


