Return-Path: <linux-kbuild+bounces-5054-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D34CE9EAD96
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A3611881697
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 10:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D5F23DE8C;
	Tue, 10 Dec 2024 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bass0+DD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCD823DE88;
	Tue, 10 Dec 2024 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825220; cv=none; b=EUB/ypdYvNsyMqdA2Sd1KoZ//Zy1paxoxlp+9y/x4GcIq2jTeM+VDK7Juxc7x3UQ1Mmf/gwhWxz5La3tMAJOTT8dWsj4k6hVi1lfVcWXmbVsZfJhUgFpm+Gm8npEQsxGqlR5hteVoMS/N2vUkxvbJRc4fz3tBzf36nRUn2bye10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825220; c=relaxed/simple;
	bh=S3XEXUDmkBmOooWN6DOpebqOCKHrXOqvVezVsx4571s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fpEuLj7T2NToQi0/1qmuuzdupq+byQFfBuZp9Y0QW+iOc2I8xBX/XMMfEc/dxCHvl6SjcB66Eixl3pnBlF9ZiLAWTZGFO42qjdbVvvaGmIS6/hgyjxWcY7IdIW80v6rfu/OAB1dPakyrvz1FtabqMYXfbDFMElS2FDdSDiGprM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bass0+DD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0317C4CED6;
	Tue, 10 Dec 2024 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733825219;
	bh=S3XEXUDmkBmOooWN6DOpebqOCKHrXOqvVezVsx4571s=;
	h=From:To:Cc:Subject:Date:From;
	b=Bass0+DDxUgnKfDdCBiQj/BmWQ1ADeoqp5E+e0nqJ8OhpTbxW6YnOEcOMXkaLL1Bv
	 tt8DIE5BnbeW/ibUveGb6siHc+u3pq5KZ5n6l3OR4iKAx8w66U7dEjBCzrFo0Lg8Kr
	 71aBnpC8y2vw04AmpeZv7VdalHibT4JJgP6NNRf+c/6DtD8ksCf1uj+RMQwqxOHA2+
	 p1B5+9Tb0CaCC/obPELqNiIKxJoDnZ7g40rTZt6J0pQqSernLULeIi0aoOOw1ziVrw
	 B/1DJjGJXcU+BE8UwaMHDDKldo2xjmVWghhVojiX5fBBAneCvAw7v+dNI57uouI2+X
	 KnyaPEMGojF6A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2] kbuild: refactor cross-compiling linux-headers package
Date: Tue, 10 Dec 2024 19:06:17 +0900
Message-ID: <20241210100626.3384260-1-masahiroy@kernel.org>
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

This commit simplifies the script by leveraging the run-command target,
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

Changes in v2:
  - Fix build error with O=

 scripts/package/install-extmod-build | 32 +++++++---------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index d3c5b104c063..81f5b24b09a3 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -49,17 +49,10 @@ mkdir -p "${destdir}"
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
@@ -67,20 +60,11 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	# - GCC plugins, which will not work on the installed system even after
 	#   being rebuilt.
 	#
-	# Use the single-target build to avoid the modpost invocation, which
-	# would overwrite Module.symvers.
-	"${MAKE}" HOSTCC="${CC}" KBUILD_OUTPUT=. KBUILD_EXTMOD="${destdir}" scripts/
+	# Clear VPATH and srcroot because the source files reside in the output
+	# directory
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC=$(CC) VPATH= srcroot=. $(build)='"${destdir}"/scripts
 
-	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
-	subdir-y := basic
-	hostprogs-always-y := mod/modpost
-	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
-	EOF
-
-	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
-	"${MAKE}" HOSTCC="${CC}" KBUILD_OUTPUT=. KBUILD_EXTMOD="${destdir}" scripts/
-
-	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
+	rm -f "${destdir}/scripts/Kbuild"
 fi
 
 find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
-- 
2.43.0


