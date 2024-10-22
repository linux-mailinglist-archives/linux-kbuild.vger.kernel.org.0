Return-Path: <linux-kbuild+bounces-4233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E349D9AB5E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 20:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6751B1F23D43
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 18:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849761C9DFE;
	Tue, 22 Oct 2024 18:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zuu2o6jo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772E1C9DF7;
	Tue, 22 Oct 2024 18:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729621035; cv=none; b=hZjv9ln5pPrGvxfTAGym6eCzFVKq0Fb9ZGMqFQ6Y9D9KecBjcVCtR2qn8cVjR7PYnQdOesuK7ctSna3o3lhr519FokRfro8v9u/eGvk7qNMhwMZ2z4Gu/5rFq/lDmncOg593+aB2uEAeKRU+qQKNur10A6heuJaCaI7vvWZo1OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729621035; c=relaxed/simple;
	bh=KFiqW/PK+TnSLdlqReYk2ROuLx7NKnxMPV0s5WlupcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhErXZWknTxtowr/p5yg9YZd2dgPpv6WhSvV1qUWwbhoATyk6bUEaNWSH/1/C1hB+VNc+xwDZV6SRXox9hjiInmWlT+UE4ZxHwPkaWl2bdRUW5AWQSnz4gmZB06Med0+eccPBni78QJpCilw5YwZJjof6MmA3O9B/RnKaWjn7zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zuu2o6jo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A9AC4CEE3;
	Tue, 22 Oct 2024 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729621034;
	bh=KFiqW/PK+TnSLdlqReYk2ROuLx7NKnxMPV0s5WlupcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zuu2o6joqh+8WWdvZrJ8g1VhuXdPILsiXpFWiWqdfp1Z9/HDluBGDkS+BHmLx47YI
	 PlfXaG9lznzdAcmznNoVPtt1wMoOXphRPwIznOzpb0FpsUMzBxQVRzkANXhQfQT0Np
	 VpMS0xXKb4sBTjRZYGkcSxGNhv4KJDxRYkBZsBOAsmpV12f/xXij8mi46wqEiFp1DN
	 fGQxJMlG7hEDj5snHjlHs7AasTQDOq6RmtVOLQnXrL+Wwoow8JHwOQVexv0KA+mEPW
	 WoafnEGebBfz9XM6NztQ89ApYP1o0hh1OOZ3zg5ieYqlYnqXxbGF0lySKQz+gCr8oO
	 Ep/Sk91gZgW/A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <benh@debian.org>,
	Ron Economos <re@w6rz.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/3] kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile
Date: Wed, 23 Oct 2024 03:16:58 +0900
Message-ID: <20241022181703.1710116-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022181703.1710116-1-masahiroy@kernel.org>
References: <20241022181703.1710116-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f1d87664b82a ("kbuild: cross-compile linux-headers package
when possible"), 'make bindeb-pkg' may attempt to cross-compile the
linux-headers package, but it fails under certain circumstances.

For example, when CONFIG_MODULE_SIG_FORMAT is enabled on Debian, the
following command fails:

  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
      [ snip ]
  Rebuilding host programs with aarch64-linux-gnu-gcc...
    HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/kallsyms
    HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/sorttable
    HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/asn1_compiler
    HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/sign-file
  In file included from /usr/include/openssl/opensslv.h:109,
                   from debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/sign-file.c:25:
  /usr/include/openssl/macros.h:14:10: fatal error: openssl/opensslconf.h: No such file or directory
     14 | #include <openssl/opensslconf.h>
        |          ^~~~~~~~~~~~~~~~~~~~~~~
  compilation terminated.

This commit adds a new profile, pkg.linux-upstream.nokernelheaders, to
guard the linux-headers package.

There are two options to fix the above issue.

[option 1] Set the pkg.linux-upstream.nokernelheaders build profile

  $ DEB_BUILD_PROFILES=pkg.linux-upstream.nokernelheaders \
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg

This skips the building of the linux-headers package.

[option 2] Install the necessary build dependencies

If you want to cross-compile the linux-headers package, you need to
install additional packages. This is a one-time installation step.

For example, on Debian, the packages necessary for cross-compiling it
to arm64 can be installed with the following commands:

  # dpkg --add-architecture arm64
  # apt update
  # apt install gcc-aarch64-linux-gnu libssl-dev:arm64

Fixes: f1d87664b82a ("kbuild: cross-compile linux-headers package when possible")
Reported-by: Ron Economos <re@w6rz.net>
Closes: https://lore.kernel.org/all/b3d4f49e-7ddb-29ba-0967-689232329b53@w6rz.net/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb             | 2 +-
 scripts/package/install-extmod-build | 6 ++----
 scripts/package/mkdebian             | 9 ++++++++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 404587fc71fe..441b0bb66e0d 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -123,7 +123,7 @@ install_kernel_headers () {
 	pdir=debian/$1
 	version=${1#linux-headers-}
 
-	"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
+	CC="${DEB_HOST_GNU_TYPE}-gcc" "${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
 
 	mkdir -p $pdir/lib/modules/$version/
 	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index d2c9cacecc0c..7ec1f061a519 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -44,13 +44,11 @@ mkdir -p "${destdir}"
 	fi
 } | tar -c -f - -T - | tar -xf - -C "${destdir}"
 
-# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebuild host
-# programs using ${CC}. This assumes CC=${CROSS_COMPILE}gcc, which is usually
-# the case for package building. It does not cross-compile when CC=clang.
+# When ${CC} and ${HOSTCC} differ, rebuild host programs using ${CC}.
 #
 # This caters to host programs that participate in Kbuild. objtool and
 # resolve_btfids are out of scope.
-if [ "${CC}" != "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
+if [ "${CC}" != "${HOSTCC}" ]; then
 	echo "Rebuilding host programs with ${CC}..."
 
 	cat <<-'EOF' >  "${destdir}/Kbuild"
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 10637d403777..93eb50356ddb 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -179,6 +179,8 @@ fi
 
 echo $debarch > debian/arch
 
+host_gnu=$(dpkg-architecture -a "${debarch}" -q DEB_HOST_GNU_TYPE | sed 's/_/-/g')
+
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
 $sourcename ($packageversion) $distribution; urgency=low
@@ -196,7 +198,11 @@ Priority: optional
 Maintainer: $maintainer
 Rules-Requires-Root: no
 Build-Depends: debhelper-compat (= 12)
-Build-Depends-Arch: bc, bison, cpio, flex, kmod, libelf-dev:native, libssl-dev:native, rsync
+Build-Depends-Arch: bc, bison, cpio, flex,
+ gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
+ kmod, libelf-dev:native,
+ libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
+ rsync
 Homepage: https://www.kernel.org/
 
 Package: $packagename-$version
@@ -224,6 +230,7 @@ cat <<EOF >> debian/control
 
 Package: linux-headers-$version
 Architecture: $debarch
+Build-Profiles: <!pkg.${sourcename}.nokernelheaders>
 Description: Linux kernel headers for $version on $debarch
  This package provides kernel header files for $version on $debarch
  .
-- 
2.43.0


