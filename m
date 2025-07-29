Return-Path: <linux-kbuild+bounces-8240-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B4FB14E51
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 15:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EED30189EFFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 13:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77A51ACEDD;
	Tue, 29 Jul 2025 13:25:17 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAD215573A;
	Tue, 29 Jul 2025 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753795517; cv=none; b=EZjhZdHiKebLvaeUepIKrbk79Tj/Rz5QnOHLzOesfytmGiBKD/szoA9YSrMCvrh2KOWYOcSnefvPbrotPFQ4z1lBrgvfnKtnOLEKDU06JemBmuwI2eM2Pa+u5c8UpFI3B/XbklbSEKNtDQ+pMuT8FmBAHjuBp2UM0jvBei7Ao9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753795517; c=relaxed/simple;
	bh=p9RaGBMR8u66X2tUCyNn2rT4pC2/rbWDHQ6ujxVhM94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVpmVnQSsnUqfcsZkhTRWIThiCew4JNPlBnNCvtk8WulIA16ElmRKBs8s+bll3MbjNwKM7J8kIX+716iz5KI8nADJjmQ38Yl2iOy6Lg2uN//XXqdYoHdMS+hBIS+DjmPurjulFDAJ9GiGK6WZ3878nLl7UNoeiS7aapuqhk4o2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from pomiot (c144-141.icpnet.pl [85.221.144.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F247D340D58;
	Tue, 29 Jul 2025 13:25:12 +0000 (UTC)
From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Sam James <sam@gentoo.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
Subject: [PATCH v4] kheaders: make it possible to override TAR
Date: Tue, 29 Jul 2025 15:24:55 +0200
Message-ID: <20250729132500.343778-1-mgorny@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAK7LNATotYMHVgNHkQcT33qQK+fdZAjoQpdJqtKKWT18uJcPXg@mail.gmail.com>
References: <CAK7LNATotYMHVgNHkQcT33qQK+fdZAjoQpdJqtKKWT18uJcPXg@mail.gmail.com>
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
 kernel/gen_kheaders.sh | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

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
index c64e5a00a3d9..896a503dfb29 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -30,8 +30,8 @@ rm -rf "${tmpdir}"
 mkdir "${tmpdir}"
 
 # shellcheck disable=SC2154 # srctree is passed as an env variable
-sed "s:^${srctree}/::" "${srclist}" | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${tmpdir}"
-tar -c -f - -T "${objlist}" | tar -xf - -C "${tmpdir}"
+sed "s:^${srctree}/::" "${srclist}" | ${TAR} -c -f - -C "${srctree}" -T - | ${TAR} -xf - -C "${tmpdir}"
+${TAR} -c -f - -T "${objlist}" | ${TAR} -xf - -C "${tmpdir}"
 
 # Remove comments except SDPX lines
 # Use a temporary file to store directory contents to prevent find/xargs from
@@ -43,7 +43,7 @@ xargs -0 -P8 -n1 \
 rm -f "${tmpdir}.contents.txt"
 
 # Create archive and try to normalize metadata for reproducibility.
-tar "${timestamp:+--mtime=$timestamp}" \
+${TAR} "${timestamp:+--mtime=$timestamp}" \
     --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
     -I "${XZ}" -cf "${tarfile}" -C "${tmpdir}/" . > /dev/null
 

