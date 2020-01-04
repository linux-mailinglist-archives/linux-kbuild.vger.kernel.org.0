Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D40D11302C9
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgADPDC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:03:02 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:53558 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgADPDB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 004F2gcV018492;
        Sun, 5 Jan 2020 00:02:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 004F2gcV018492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578150166;
        bh=m+QNw9lJ1lLT2KZMs68ll6UoAC70qCeAUczCTb6/mWA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DGH3kX4WJdQwfpbNa4BApSJsWxpSuB/GaVrQ0YrCsnW6BDjoH8vbbySP1ctZf3hmV
         xAuSU6YrwMjH/fxhRl8F+AJLs4uPr1zH29ofqi6/Im9LXG2bhBSHNREGssSH+feuZV
         DlPabRXo3OSX1yof1Zj0kQZiuJsX5W/ZHlAi3WJJ9bo7bzc+tgY656dRwxv1CAtejt
         +s6jDpaQ0Edsm1Luq+xvXR4fXRZsgigfs9JWMXRlVuKtIdnyi+lj42EWbsGhAyu/a6
         K2rtm7yY2qKhi+KO0HGieTUUNkBG8HU5/ZgS5IzSpzlKzgafvvDGrYdAkEKOQaqUsm
         9foIxN/3AZbSQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] initramfs: remove redundant dependency on BLK_DEV_INITRD
Date:   Sun,  5 Jan 2020 00:02:30 +0900
Message-Id: <20200104150238.19834-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

init/Kconfig includes usr/Kconfig inside the "if BLK_DEV_INITRD" ...
"endif" block:

    if BLK_DEV_INITRD

    source "usr/Kconfig"

    endif

Hence, all the defines in usr/Kconfig depend on BLK_DEV_INITRD.

Remove the redundant "depends on BLK_DEV_INITRD".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 usr/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/usr/Kconfig b/usr/Kconfig
index a6b68503d177..72f50a21c051 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -54,7 +54,6 @@ config INITRAMFS_ROOT_GID
 
 config RD_GZIP
 	bool "Support initial ramdisk/ramfs compressed using gzip"
-	depends on BLK_DEV_INITRD
 	default y
 	select DECOMPRESS_GZIP
 	help
@@ -64,7 +63,6 @@ config RD_GZIP
 config RD_BZIP2
 	bool "Support initial ramdisk/ramfs compressed using bzip2"
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_BZIP2
 	help
 	  Support loading of a bzip2 encoded initial ramdisk or cpio buffer
@@ -73,7 +71,6 @@ config RD_BZIP2
 config RD_LZMA
 	bool "Support initial ramdisk/ramfs compressed using LZMA"
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_LZMA
 	help
 	  Support loading of a LZMA encoded initial ramdisk or cpio buffer
@@ -81,7 +78,6 @@ config RD_LZMA
 
 config RD_XZ
 	bool "Support initial ramdisk/ramfs compressed using XZ"
-	depends on BLK_DEV_INITRD
 	default y
 	select DECOMPRESS_XZ
 	help
@@ -91,7 +87,6 @@ config RD_XZ
 config RD_LZO
 	bool "Support initial ramdisk/ramfs compressed using LZO"
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_LZO
 	help
 	  Support loading of a LZO encoded initial ramdisk or cpio buffer
@@ -100,7 +95,6 @@ config RD_LZO
 config RD_LZ4
 	bool "Support initial ramdisk/ramfs compressed using LZ4"
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_LZ4
 	help
 	  Support loading of a LZ4 encoded initial ramdisk or cpio buffer
-- 
2.17.1

