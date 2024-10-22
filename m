Return-Path: <linux-kbuild+bounces-4232-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 315D69AB5E0
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 20:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D279A1F23BD4
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 18:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B4813AD26;
	Tue, 22 Oct 2024 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBRu9kRa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005347E0E4;
	Tue, 22 Oct 2024 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729621033; cv=none; b=pJm6Zi/2MNm1QEeQohrdbW7Q3iEgRfo6qOS/2Af+eEei4Rh206PSfSIXzA1bHfsbdpCfCQ/y06MClXHg8ExbdQPmBbmEwsZEldedwuClfwy5iu3dI3qvSZzjWc6oRzIc28MQ6Nz/yf8chLWLXLKPgNkGLuvEO+nh9WTg8lHI3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729621033; c=relaxed/simple;
	bh=JMgdeQnGRehG99SRHtxuoUhtRAJRg6fbbjqiwoh9kEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HwGR6YIGbl++16PdHBYZd3w59xQIMcpOfxr30slpaJRPGF8ptngge8ZL0QwJ7xJHQqUuYlDEk8UoeI8mQspP/WbhkF8VqWsDyUCZ1X9k97AH+6dMsJSpsS93vPhqK0KNVWUZGdjM32vgpGBflA1qSAWrmZEZY9WviRiuWXkeqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBRu9kRa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E625C4CEC3;
	Tue, 22 Oct 2024 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729621032;
	bh=JMgdeQnGRehG99SRHtxuoUhtRAJRg6fbbjqiwoh9kEs=;
	h=From:To:Cc:Subject:Date:From;
	b=nBRu9kRake9fewgSVPXm+8NtGEFhgLvPKAlPCrofyzhzgKBCj2ifwBf8ZxlFf+hgO
	 TGZPQQ0qjQ+YfMSan1TfIeyULdEQKgaortO0i5eL1nuucRtL8GQPHXAQ4L8CWA/AHs
	 1bgBfQE1FnycSlh+5jOWzzFlnYCXdmFFt0ozdOxGa3HNzsWZpBYWw4TBTNyfRviSiB
	 YVFvCIDr2BXIWG0C9mnb4G6T6rQuTD1eErQefB0c0YUDg6kkmlx/WylBqvy+Pq5uA3
	 UYh1PfbZr9MyPjA66xgkdfziuN09delxLSekX8MeIo1mGbqBdfknBtu+Jq+kCFcrs+
	 ZpdBd1gWG1rIQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <benh@debian.org>,
	Ron Economos <re@w6rz.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: rpm-pkg: disable kernel-devel package when cross-compiling
Date: Wed, 23 Oct 2024 03:16:57 +0900
Message-ID: <20241022181703.1710116-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f1d87664b82a ("kbuild: cross-compile linux-headers package
when possible"), 'make binrpm-pkg' may attempt to cross-compile the
kernel-devel package, but it fails under certain circumstances.

For example, when CONFIG_MODULE_SIG_FORMAT is enabled on openSUSE
Tumbleweed, the following command fails:

  $ make ARCH=arm64 CROSS_COMPILE=aarch64-suse-linux- binrpm-pkg
      [ snip ]
  Rebuilding host programs with aarch64-suse-linux-gcc...
    HOSTCC  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/kallsyms
    HOSTCC  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/sorttable
    HOSTCC  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/asn1_compiler
    HOSTCC  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/sign-file
  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/sign-file.c:25:10: fatal error: openssl/opensslv.h: No such file or directory
     25 | #include <openssl/opensslv.h>
        |          ^~~~~~~~~~~~~~~~~~~~
  compilation terminated.

I believe this issue is less common on Fedora because cross-compiling
user-space programs is not possible, even if the gcc-aarch64-linux-gnu
package is installed. In other words, CONFIG_CC_CAN_LINK is unset.

On Fedora 40, the package information explains this limitation clearly:

  $ dnf info gcc-aarch64-linux-gnu
      [ snip ]
  Description  : Cross-build GNU C compiler.
               :
               : Only building kernels is currently supported.  Support for cross-building
               : user space programs is not currently provided as that would massively multiply
               : the number of packages.

This commit disables the kernel-devel package when cross-compiling
because cross-compiling RPM packages is somewhat challenging, and I
did not come up with a better solution.

Fixes: f1d87664b82a ("kbuild: cross-compile linux-headers package when possible")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.package | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 11d53f240a2b..b9a4b0c8b8a0 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -72,7 +72,8 @@ rpm-pkg srcrpm-pkg binrpm-pkg: rpmbuild/SPECS/kernel.spec
 	--define='_topdir $(abspath rpmbuild)' \
 	$(if $(filter a b, $(build-type)), \
 		--target $(UTS_MACHINE)-linux --build-in-place --noprep --define='_smp_mflags %{nil}' \
-		$$(rpm -q rpm >/dev/null 2>&1 || echo --nodeps)) \
+		$$(rpm -q rpm >/dev/null 2>&1 || echo --nodeps) \
+		$(if $(cross_compiling), --without=devel)) \
 	$(RPMOPTS))
 
 # deb-pkg srcdeb-pkg bindeb-pkg
-- 
2.43.0


