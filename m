Return-Path: <linux-kbuild+bounces-2684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8993DDB8
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 09:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28138283E54
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 07:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C10B52F9B;
	Sat, 27 Jul 2024 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlF5tbpj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CF4DA00;
	Sat, 27 Jul 2024 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722066343; cv=none; b=S3ynIYAeRBwY92RTRm5O4QVnwdZ+nPvKLLly9jsbtBzm5DzTPDlor8nmlxRjAiYjYln9e30CM+P5+DkAQKNwLoKyZg9bRVqJ1Ub/dl+6tLtwMKqo1yeCdujBduv0hqQ0yKyE5dc5M6d7Aq7yFkb3QmNxQeaLH27sooYjTH4yIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722066343; c=relaxed/simple;
	bh=bOu4ELquTW2+a3AqqRn9H85xVK64vtAr4KgLuMen9ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMllQz+F+UibXci0zbVmEkxW+9TngU94cLoePyuT105wk+DHjhs1ZkSRowRTJxtE+ODPf6egxFq1a41Gb4DYPH/IXcMpJcGPqf+bPWZhI2QmRuty8oK8j1Vgz7z4+2Wjz0hTg5UmjHQyEJZ15RzmzLxzB4P9OAMrftbuZ/EzeD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlF5tbpj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F01C4AF09;
	Sat, 27 Jul 2024 07:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722066342;
	bh=bOu4ELquTW2+a3AqqRn9H85xVK64vtAr4KgLuMen9ts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qlF5tbpjaG/qXOTD5qhOi+TX0+J8rTnbqVros8ZlP+yo5OhY2m9IaJv+d9l8c8E1R
	 WvrwgnzoWH/vqjQVY+8Fjgxz/Vrf/Q/IOvpsFfcOiZiPKpcGtJNP3bczaAOP57sUJ6
	 PZnc+ajo3dAInygYLIzxDZHvecJoG9DIgF/tsUeuL7Qkio9I4e3mnSNWImjPNVAo/q
	 yos60Ti/602Gw6AdiNT6ds7KQ4ir/uToQcNjG/+mD+ko6MuzJ7ZPP2Jsa6Gc8d7iKs
	 aHurmPeA1dQ7dQRIBMYHvJwllCBp3kSmR8rG9fLu5k54QdUKibjj4qVyrvPt1ABZmG
	 HZ3EBqiPfNcFQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/4] kbuild: cross-compile linux-headers package when possible
Date: Sat, 27 Jul 2024 16:42:04 +0900
Message-ID: <20240727074526.1771247-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727074526.1771247-1-masahiroy@kernel.org>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A long standing issue in the upstream kernel packaging is that the
linux-headers package is not cross-compiled.

For example, you can cross-build Debian packages for arm64 by running
the following command:

  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg

However, the generated linux-headers-*_arm64.deb is useless because the
host programs in it were built for your build machine architecture
(likely x86), not arm64.

The Debian kernel maintains its own Makefiles to cross-compile host
tools without relying on Kbuild. [1]

Instead of adding such full custom Makefiles, this commit adds a small
piece of code to cross-compile host programs located under the scripts/
directory.

A straightforward solution is to pass HOSTCC=${CROSS_COMPILE}gcc, but it
would also cross-compile scripts/basic/fixdep, which needs to be native
to process the if_changed_dep macro. (This approach may work under some
circumstances; you can execute foreign architecture programs with the
help of binfmt_misc because Debian systems enable CONFIG_BINFMT_MISC,
but it would require installing QEMU and libc for that architecture.)

A trick is to use the external module build (KBUILD_EXTMOD=), which
does not rebuild scripts/basic/fixdep. ${CC} needs to be able to link
userspace programs (CONFIG_CC_CAN_LINK=y).

There are known limitations:

 - GCC plugins

   It would possible to rebuild GCC plugins for the target architecture
   by passing HOSTCXX=${CROSS_COMPILE}g++ with necessary packages
   installed, but gcc on the installed system emits
   "cc1: error: incompatible gcc/plugin versions". I did not find a
   solution for this because 'gcc' on a foreign architecture is a
   different compiler after all.

 - objtool and resolve_btfids

   These are built by the tools build system. They are not covered by
   the current solution.

I only tested this with Debian, but it should work for other package
systems as well.

[1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/rules.real#L586

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/install-extmod-build | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index cc335945dfbc..0b56d3d7b48f 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -43,4 +43,38 @@ mkdir -p "${destdir}"
 	fi
 } | tar -c -f - -T - | tar -xf - -C "${destdir}"
 
+# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebuild host
+# programs using ${CC}. This assumes CC=${CROSS_COMPILE}gcc, which is usually
+# the case for package building. It does not cross-compile when CC=clang.
+#
+# This caters to host programs that participate in Kbuild. objtool and
+# resolve_btfids are out of scope.
+if [ "${CC}" != "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
+	echo "Rebuilding host programs with ${CC}..."
+
+	cat <<-'EOF' >  "${destdir}/Kbuild"
+	subdir-y := scripts
+	EOF
+
+	# HOSTCXX is not overridden. The C++ compiler is used to build:
+	# - scripts/kconfig/qconf, which is unneeded for external module builds
+	# - GCC plugins, which will not work on the installed system even with
+	#   being rebuilt.
+	#
+	# Use the single-target build to avoid the modpost invocation, which
+	# would overwrite Module.symvers.
+	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
+
+	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
+	subdir-y := basic
+	hostprogs-always-y := mod/modpost
+	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
+	EOF
+
+	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
+	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
+
+	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
+fi
+
 find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
-- 
2.43.0


