Return-Path: <linux-kbuild+bounces-8070-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E17DCB0B099
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 17:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2566189BDAD
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 15:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B63C2874EA;
	Sat, 19 Jul 2025 15:24:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A424438B;
	Sat, 19 Jul 2025 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752938674; cv=none; b=a9Li6YOyCVncm4By2dltpW04GPyhrASXiMSv+76w0wvgJ2Fm2JtmYQHbMMKEDe+TJuybUJtHC6qp2KR7cgGgy4yTIo8pEKPeVuiXHBpbteVlW29WBbOH3QkM/7U8cu20Wcj3ZUj0px2qb5XVJps1Z8BKTjZSP6NeGew+qplvTWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752938674; c=relaxed/simple;
	bh=jkHsgEJILU/Qbv8DEUBcwA3kkM6X16M2Txy15MRCo+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utdruCGzvhjOp+u/m5tPvOiVVeEpTJUMVWUoivUJLxcCAZb3o6eqHdioP4ABqWYRZfJa2f5b/+prpvFSbkADZqKMn6YA7kbMrxxHRvJF0/7FDaYzzullBfW/oQF6Fs+zFJIfdsqfnVlVYxlr+rUFnYt9+w5oNY3ozhv5EEuegaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam@gentoo.org)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8ADBD340BD3;
	Sat, 19 Jul 2025 15:24:31 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>,
	Sam James <sam@gentoo.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] kheaders: make it possible to override TAR
Date: Sat, 19 Jul 2025 16:24:05 +0100
Message-ID: <277557da458c5fa07eba7d785b4f527cc37a023f.1752938644.git.sam@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20230412082743.350699-1-mgorny@gentoo.org>
References: <20230412082743.350699-1-mgorny@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Górny <mgorny@gentoo.org>

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
v3: Rebase, cover more tar instances.

 Makefile               | 3 ++-
 kernel/gen_kheaders.sh | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c09766beb7eff..22d6037d738fe 100644
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
index c9e5dc068e854..bb609a9ed72b4 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -66,13 +66,13 @@ if [ "$building_out_of_srctree" ]; then
 		cd $srctree
 		for f in $dir_list
 			do find "$f" -name "*.h";
-		done | tar -c -f - -T - | tar -xf - -C "${tmpdir}"
+		done | ${TAR:-tar} -c -f - -T - | ${TAR:-tar} -xf - -C "${tmpdir}"
 	)
 fi
 
 for f in $dir_list;
 	do find "$f" -name "*.h";
-done | tar -c -f - -T - | tar -xf - -C "${tmpdir}"
+done | ${TAR:-tar} -c -f - -T - | ${TAR:-tar} -xf - -C "${tmpdir}"
 
 # Always exclude include/generated/utsversion.h
 # Otherwise, the contents of the tarball may vary depending on the build steps.
@@ -88,7 +88,7 @@ xargs -0 -P8 -n1 \
 rm -f "${tmpdir}.contents.txt"
 
 # Create archive and try to normalize metadata for reproducibility.
-tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
+${TAR:-tar} "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
     --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
     -I $XZ -cf $tarfile -C "${tmpdir}/" . > /dev/null
 
-- 
2.50.1


