Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE1D3217D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Feb 2021 14:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhBVNBJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Feb 2021 08:01:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhBVNAF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Feb 2021 08:00:05 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB9AC061574
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Feb 2021 04:59:24 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:254f:253d:debc:790b])
        by albert.telenet-ops.be with bizsmtp
        id YCzP240011v7dkx06CzP0Y; Mon, 22 Feb 2021 13:59:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lEAo6-000kYH-My; Mon, 22 Feb 2021 13:59:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lEAo6-00HUVX-8I; Mon, 22 Feb 2021 13:59:22 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-f2fs-devel@lists.sourceforge.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] f2fs: compress: Allow modular (de)compression algorithms
Date:   Mon, 22 Feb 2021 13:59:16 +0100
Message-Id: <20210222125916.4168804-1-geert@linux-m68k.org>
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

Fix this by making the various compression options depend directly on
F2FS_FS using a big if/endif block.  Drop the now superfluous
dependencies on F2FS_FS from individual symbols.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Perhaps the propagation logic in Kconfig should be fixed instead?
Else people may reintroduce this issue when removing seemingly-unneeded
dependencies.
---
 fs/f2fs/Kconfig | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 62e638a49bbf089a..20a82ecb72b42f84 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -20,9 +20,10 @@ config F2FS_FS
 
 	  If unsure, say N.
 
+if F2FS_FS
+
 config F2FS_STAT_FS
 	bool "F2FS Status Information"
-	depends on F2FS_FS
 	default y
 	help
 	  /sys/kernel/debug/f2fs/ contains information about all the partitions
@@ -35,7 +36,6 @@ config F2FS_STAT_FS
 
 config F2FS_FS_XATTR
 	bool "F2FS extended attributes"
-	depends on F2FS_FS
 	default y
 	help
 	  Extended attributes are name:value pairs associated with inodes by
@@ -70,7 +70,6 @@ config F2FS_FS_SECURITY
 
 config F2FS_CHECK_FS
 	bool "F2FS consistency checking feature"
-	depends on F2FS_FS
 	help
 	  Enables BUG_ONs which check the filesystem consistency in runtime.
 
@@ -78,7 +77,6 @@ config F2FS_CHECK_FS
 
 config F2FS_FAULT_INJECTION
 	bool "F2FS fault injection facility"
-	depends on F2FS_FS
 	help
 	  Test F2FS to inject faults such as ENOMEM, ENOSPC, and so on.
 
@@ -86,7 +84,6 @@ config F2FS_FAULT_INJECTION
 
 config F2FS_FS_COMPRESSION
 	bool "F2FS compression feature"
-	depends on F2FS_FS
 	help
 	  Enable filesystem-level compression on f2fs regular files,
 	  multiple back-end compression algorithms are supported.
@@ -137,3 +134,5 @@ config F2FS_FS_LZORLE
 	default y
 	help
 	  Support LZO-RLE compress algorithm, if unsure, say Y.
+
+endif
-- 
2.25.1

