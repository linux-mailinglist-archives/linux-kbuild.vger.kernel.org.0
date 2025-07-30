Return-Path: <linux-kbuild+bounces-8253-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1632B16085
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 14:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 953003AD8A6
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 12:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A83293C41;
	Wed, 30 Jul 2025 12:44:57 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D19D277036;
	Wed, 30 Jul 2025 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753879497; cv=none; b=EKXVzpoI3WptrM/OIesZgQkz2W+Da0T/k2Oz2b9K1wmpLvWJfj4K1T1wbV6tPqIveKQ6vwWadQq/ygxnYEMrxZdN4UytgsNPYfD4Fb5HtgMcky0aGFc37ZOFtVWjDLa/M5IRWgl+uI0r4OEWeqxU6IvWsP7ko+vP7A52nw7wzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753879497; c=relaxed/simple;
	bh=lFRAr90NMgpAIDK0Ith2G3EuBCRB5q28p2q0r8Kxo1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L2xp1vWEjXrPah1HUBE9WTpDToYmwECYmyvtPNdrVbRjd/8hy1APvzSZGTBAdO8srZUj3mRgW4NDiWKAZzRSKFQ4Uj+i88aMIrymBnDodoAUm9cLHzszQ5GlgB7rtRsod63FU3lp2ojXUjIUfLtXOPSefy7/bZY6b29a9ayjdkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FDCC4CEE7;
	Wed, 30 Jul 2025 12:44:54 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Bo Liu <liubo03@inspur.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] erofs: Do not select tristate symbols from bool symbols
Date: Wed, 30 Jul 2025 14:44:49 +0200
Message-ID: <da1b899e511145dd43fd2d398f64b2e03c6a39e7.1753879351.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EROFS filesystem has many configurable options, controlled through
boolean Kconfig symbols.  When enabled, these options may need to enable
additional library functionality elsewhere.  Currently this is done by
selecting the symbol for the additional functionality.  However, if
EROFS_FS itself is modular, and the target symbol is a tristate symbol,
the additional functionality is always forced built-in.

Selecting tristate symbols from a tristate symbol does keep modular
transitivity.  Hence fix this by moving selects of tristate symbols to
the main EROFS_FS symbol.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Triggered by noticing that commit 5e0bf36fd156b8d9 ("erofs: fix build
error with CONFIG_EROFS_FS_ZIP_ACCEL=y") caused CONFIG_CRYPTO_DEFLATE
and CONFIG_ZLIB_DEFLATE to change from m to y in m68k/allmodconfig.

Unfortunately Kconfig cannot be changed easily to detect this
automatically, as it cannot distinguish between a "bool" symbol
representing a configurable option in a module, and a driver that cannot
be a module.
---
 fs/erofs/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
index 7b26efc271eec733..d81f3318417dff7c 100644
--- a/fs/erofs/Kconfig
+++ b/fs/erofs/Kconfig
@@ -3,8 +3,18 @@
 config EROFS_FS
 	tristate "EROFS filesystem support"
 	depends on BLOCK
+	select CACHEFILES if EROFS_FS_ONDEMAND
 	select CRC32
+	select CRYPTO if EROFS_FS_ZIP_ACCEL
+	select CRYPTO_DEFLATE if EROFS_FS_ZIP_ACCEL
 	select FS_IOMAP
+	select LZ4_DECOMPRESS if EROFS_FS_ZIP
+	select NETFS_SUPPORT if EROFS_FS_ONDEMAND
+	select XXHASH if EROFS_FS_XATTR
+	select XZ_DEC if EROFS_FS_ZIP_LZMA
+	select XZ_DEC_MICROLZMA if EROFS_FS_ZIP_LZMA
+	select ZLIB_INFLATE if EROFS_FS_ZIP_DEFLATE
+	select ZSTD_DECOMPRESS if EROFS_FS_ZIP_ZSTD
 	help
 	  EROFS (Enhanced Read-Only File System) is a lightweight read-only
 	  file system with modern designs (e.g. no buffer heads, inline
@@ -38,7 +48,6 @@ config EROFS_FS_DEBUG
 config EROFS_FS_XATTR
 	bool "EROFS extended attributes"
 	depends on EROFS_FS
-	select XXHASH
 	default y
 	help
 	  Extended attributes are name:value pairs associated with inodes by
@@ -94,7 +103,6 @@ config EROFS_FS_BACKED_BY_FILE
 config EROFS_FS_ZIP
 	bool "EROFS Data Compression Support"
 	depends on EROFS_FS
-	select LZ4_DECOMPRESS
 	default y
 	help
 	  Enable transparent compression support for EROFS file systems.
@@ -104,8 +112,6 @@ config EROFS_FS_ZIP
 config EROFS_FS_ZIP_LZMA
 	bool "EROFS LZMA compressed data support"
 	depends on EROFS_FS_ZIP
-	select XZ_DEC
-	select XZ_DEC_MICROLZMA
 	help
 	  Saying Y here includes support for reading EROFS file systems
 	  containing LZMA compressed data, specifically called microLZMA. It
@@ -117,7 +123,6 @@ config EROFS_FS_ZIP_LZMA
 config EROFS_FS_ZIP_DEFLATE
 	bool "EROFS DEFLATE compressed data support"
 	depends on EROFS_FS_ZIP
-	select ZLIB_INFLATE
 	help
 	  Saying Y here includes support for reading EROFS file systems
 	  containing DEFLATE compressed data.  It gives better compression
@@ -132,7 +137,6 @@ config EROFS_FS_ZIP_DEFLATE
 config EROFS_FS_ZIP_ZSTD
 	bool "EROFS Zstandard compressed data support"
 	depends on EROFS_FS_ZIP
-	select ZSTD_DECOMPRESS
 	help
 	  Saying Y here includes support for reading EROFS file systems
 	  containing Zstandard compressed data.  It gives better compression
@@ -147,8 +151,6 @@ config EROFS_FS_ZIP_ZSTD
 config EROFS_FS_ZIP_ACCEL
 	bool "EROFS hardware decompression support"
 	depends on EROFS_FS_ZIP
-	select CRYPTO
-	select CRYPTO_DEFLATE
 	help
 	  Saying Y here includes hardware accelerator support for reading
 	  EROFS file systems containing compressed data.  It gives better
@@ -163,9 +165,7 @@ config EROFS_FS_ZIP_ACCEL
 config EROFS_FS_ONDEMAND
 	bool "EROFS fscache-based on-demand read support (deprecated)"
 	depends on EROFS_FS
-	select NETFS_SUPPORT
 	select FSCACHE
-	select CACHEFILES
 	select CACHEFILES_ONDEMAND
 	help
 	  This permits EROFS to use fscache-backed data blobs with on-demand
-- 
2.43.0


