Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E911326502
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Feb 2021 16:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhBZPws (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Feb 2021 10:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhBZPwj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Feb 2021 10:52:39 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB42C06178B
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Feb 2021 07:51:47 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:15af:edeb:8b51:79e0])
        by andre.telenet-ops.be with bizsmtp
        id Zrrj2400Q16s2Gb01rrj26; Fri, 26 Feb 2021 16:51:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lFfP5-0025aW-8K; Fri, 26 Feb 2021 16:51:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lFfP4-00CCuu-SQ; Fri, 26 Feb 2021 16:51:42 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-f2fs-devel@lists.sourceforge.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3] f2fs: compress: Allow modular (de)compression algorithms
Date:   Fri, 26 Feb 2021 16:51:42 +0100
Message-Id: <20210226155142.2909545-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If F2FS_FS is modular, enabling the compressions options
F2FS_FS_{LZ4,LZ4HZ,LZO,LZORLE,ZSTD} will make the (de)compression
algorithms {LZ4,LZ4HC,LZO,ZSTD}_{,DE}COMPRESS builtin instead of
modular, as the former depend on an intermediate boolean
F2FS_FS_COMPRESSION, which in-turn depends on tristate F2FS_FS.

Indeed, if a boolean symbol A depends directly on a tristate symbol B
and selects another tristate symbol C:

    tristate B

    tristate C

    bool A
      depends on B
      select C

and B is modular, then C will also be modular.

However, if there is an intermediate boolean D in the dependency chain
between A and B:

    tristate B

    tristate C

    bool D
      depends on B

    bool A
      depends on D
      select C

then the modular state won't propagate from B to C, and C will be
builtin instead of modular.

As modular dependency propagation through intermediate symbols is
obscure, fix this in a robust way by moving the selection of tristate
(de)compression algorithms from the boolean compression options to the
tristate main F2FS_FS option.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Drop redundant selects (F2FS_FS_LZORLE depends on F2FS_FS_LZO),

v2:
  - Move the selects to F2FS_FS instead of adding direct dependencies
    on F2FS_FS.
---
 fs/f2fs/Kconfig | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 62e638a49bbf089a..7669de7b49cea189 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -7,6 +7,13 @@ config F2FS_FS
 	select CRYPTO_CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
+	select LZ4_COMPRESS if F2FS_FS_LZ4
+	select LZ4_DECOMPRESS if F2FS_FS_LZ4
+	select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
+	select LZO_COMPRESS if F2FS_FS_LZO
+	select LZO_DECOMPRESS if F2FS_FS_LZO
+	select ZSTD_COMPRESS if F2FS_FS_ZSTD
+	select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
 	help
 	  F2FS is based on Log-structured File System (LFS), which supports
 	  versatile "flash-friendly" features. The design has been focused on
@@ -94,8 +101,6 @@ config F2FS_FS_COMPRESSION
 config F2FS_FS_LZO
 	bool "LZO compression support"
 	depends on F2FS_FS_COMPRESSION
-	select LZO_COMPRESS
-	select LZO_DECOMPRESS
 	default y
 	help
 	  Support LZO compress algorithm, if unsure, say Y.
@@ -103,8 +108,6 @@ config F2FS_FS_LZO
 config F2FS_FS_LZ4
 	bool "LZ4 compression support"
 	depends on F2FS_FS_COMPRESSION
-	select LZ4_COMPRESS
-	select LZ4_DECOMPRESS
 	default y
 	help
 	  Support LZ4 compress algorithm, if unsure, say Y.
@@ -113,7 +116,6 @@ config F2FS_FS_LZ4HC
 	bool "LZ4HC compression support"
 	depends on F2FS_FS_COMPRESSION
 	depends on F2FS_FS_LZ4
-	select LZ4HC_COMPRESS
 	default y
 	help
 	  Support LZ4HC compress algorithm, LZ4HC has compatible on-disk
@@ -122,8 +124,6 @@ config F2FS_FS_LZ4HC
 config F2FS_FS_ZSTD
 	bool "ZSTD compression support"
 	depends on F2FS_FS_COMPRESSION
-	select ZSTD_COMPRESS
-	select ZSTD_DECOMPRESS
 	default y
 	help
 	  Support ZSTD compress algorithm, if unsure, say Y.
@@ -132,8 +132,6 @@ config F2FS_FS_LZORLE
 	bool "LZO-RLE compression support"
 	depends on F2FS_FS_COMPRESSION
 	depends on F2FS_FS_LZO
-	select LZO_COMPRESS
-	select LZO_DECOMPRESS
 	default y
 	help
 	  Support LZO-RLE compress algorithm, if unsure, say Y.
-- 
2.25.1

