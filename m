Return-Path: <linux-kbuild+bounces-8198-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A76B12B14
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 17:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A8583B92B7
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 15:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C41223DF6;
	Sat, 26 Jul 2025 15:10:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA6A1DBB2E;
	Sat, 26 Jul 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753542658; cv=none; b=D0ov1uO/nyn7Ee1fzF95WDztXvH7vUKGo+Xr+lEJnfY0xylQQCxxO/XC85fnpYy9hAPUg2QE1MPLuz6lTs2ffUpBHho1eQtn1W+HIlRMixb7/7GkzRKZyW/tyuHki6VVwVWUIev3jz3W0jTC86zSdnCl1qnIs3BezO4Qo/huhIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753542658; c=relaxed/simple;
	bh=VuF3iwFNCJc1dhUDx5eheQI14CKmMz0Sb7ok2diS9xM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W9hdG4jCVUupEMHe6lZf/1chZ7uh6qsIEv/+CgHIJlNeUfoJM1nXyuWSgwl+kLYG1Gkzwye213pIWeVBPol0SltzLzCI/EJUlGHAKVKe2ahv5YMmO+y8w0URVvOSHvFAc37jH3SadwE3XCpN0b6l2i2GsY/9HPxRQIkn+1hujos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from pomiot (c144-156.icpnet.pl [85.221.144.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 032A5340CEA;
	Sat, 26 Jul 2025 15:10:54 +0000 (UTC)
From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Sam James <sam@gentoo.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
Subject: [PATCH v3 kbuild-rebased] kheaders: make it possible to override TAR
Date: Sat, 26 Jul 2025 17:10:30 +0200
Message-ID: <20250726151030.142548-1-mgorny@gentoo.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226 ("kheaders: make headers
archive reproducible") introduced a number of options specific to GNU
tar to the `tar` invocation in `gen_kheaders.sh` script.  This causes
the script to fail to work on systems where `tar` is not GNU tar.  This
can occur e.g. on recent Gentoo Linux installations that support using
bsdtar from libarchive instead.

Add a `TAR` make variable to make it possible to override the tar
executable used, e.g. by specifying:

  make TAR=gtar

Link: https://bugs.gentoo.org/884061
Reported-by: Sam James <sam@gentoo.org>
Tested-by: Sam James <sam@gentoo.org>
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Michał Górny <mgorny@gentoo.org>
Signed-off-by: Sam James <sam@gentoo.org>
---
 Makefile               | 3 ++-
 kernel/gen_kheaders.sh | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index ba0827a1fccd..081d494d037a 100644
--- a/Makefile
+++ b/Makefile
@@ -543,6 +543,7 @@ LZMA		= lzma
 LZ4		= lz4
 XZ		= xz
 ZSTD		= zstd
+TAR		= tar
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -622,7 +623,7 @@ export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
 export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
-export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
+export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD TAR
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS KBUILD_PROCMACROLDFLAGS LDFLAGS_MODULE
 export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS
 
diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index c64e5a00a3d9..59ec52f62c52 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -31,7 +31,7 @@ mkdir "${tmpdir}"
 
 # shellcheck disable=SC2154 # srctree is passed as an env variable
 sed "s:^${srctree}/::" "${srclist}" | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${tmpdir}"
-tar -c -f - -T "${objlist}" | tar -xf - -C "${tmpdir}"
+${TAR:-tar} -c -f - -T "${objlist}" | tar -xf - -C "${tmpdir}"
 
 # Remove comments except SDPX lines
 # Use a temporary file to store directory contents to prevent find/xargs from
@@ -43,7 +43,7 @@ xargs -0 -P8 -n1 \
 rm -f "${tmpdir}.contents.txt"
 
 # Create archive and try to normalize metadata for reproducibility.
-tar "${timestamp:+--mtime=$timestamp}" \
+${TAR:-tar} "${timestamp:+--mtime=$timestamp}" \
     --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
     -I "${XZ}" -cf "${tarfile}" -C "${tmpdir}/" . > /dev/null
 

