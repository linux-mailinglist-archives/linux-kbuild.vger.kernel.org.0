Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B95062379
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2019 17:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730976AbfGHPfn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jul 2019 11:35:43 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:58865 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390899AbfGHPfK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 11:35:10 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45j8f36xqgz1rGhT;
        Mon,  8 Jul 2019 17:35:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45j8f36bjGz1qqkx;
        Mon,  8 Jul 2019 17:35:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id uihS2Yd0ZjLH; Mon,  8 Jul 2019 17:35:07 +0200 (CEST)
X-Auth-Info: HtB8UZfXMptej1QPnSy9di66ZGtUGMWEWqPzfA1gAHg=
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  8 Jul 2019 17:35:06 +0200 (CEST)
From:   Harald Seiler <hws@denx.de>
To:     linux-kbuild@vger.kernel.org
Cc:     Harald Seiler <hws@denx.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: fix compression errors getting ignored
Date:   Mon,  8 Jul 2019 17:34:36 +0200
Message-Id: <20190708153436.19260-1-hws@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

A missing compression utility or other errors were not picked up by make
and an empty kernel image was produced.  With the added "|| exit $?",
the error is propagated outwards and will make the build fail.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Signed-off-by: Harald Seiler <hws@denx.de>
---
 scripts/Makefile.lib | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f1f38c8cdc74..4b374da065a3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -331,19 +331,19 @@ printf "%08x\n" $$dec_size |						\
 )
 
 quiet_cmd_bzip2 = BZIP2   $@
-      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 && $(size_append); } > $@
+      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 || exit $$? && $(size_append); } > $@
 
 # Lzma
 # ---------------------------------------------------------------------------
 
 quiet_cmd_lzma = LZMA    $@
-      cmd_lzma = { cat $(real-prereqs) | lzma -9 && $(size_append); } > $@
+      cmd_lzma = { cat $(real-prereqs) | lzma -9 || exit $$? && $(size_append); } > $@
 
 quiet_cmd_lzo = LZO     $@
-      cmd_lzo = { cat $(real-prereqs) | lzop -9 && $(size_append); } > $@
+      cmd_lzo = { cat $(real-prereqs) | lzop -9 || exit $$? && $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout && \
+      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout || exit $$? && \
                   $(size_append); } > $@
 
 # U-Boot mkimage
@@ -386,8 +386,8 @@ quiet_cmd_uimage = UIMAGE  $@
 # big dictionary would increase the memory usage too much in the multi-call
 # decompression mode. A BCJ filter isn't used either.
 quiet_cmd_xzkern = XZKERN  $@
-      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh && \
-                     $(size_append); } > $@
+      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh || \
+                     exit $$? && $(size_append); } > $@
 
 quiet_cmd_xzmisc = XZMISC  $@
       cmd_xzmisc = cat $(real-prereqs) | xz --check=crc32 --lzma2=dict=1MiB > $@
-- 
2.20.1

