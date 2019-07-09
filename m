Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB596348C
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 12:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfGIKwP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 06:52:15 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:50152 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfGIKwP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 06:52:15 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45jfK85GRDz1rKJ5;
        Tue,  9 Jul 2019 12:52:12 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45jfK84yG4z1qql8;
        Tue,  9 Jul 2019 12:52:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id w6u9X2MFjKBc; Tue,  9 Jul 2019 12:52:11 +0200 (CEST)
X-Auth-Info: wVHyIi/bScW3+WUG95+UdQau147Z6oqI/YIh7qGDN1k=
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue,  9 Jul 2019 12:52:11 +0200 (CEST)
From:   Harald Seiler <hws@denx.de>
To:     linux-kbuild@vger.kernel.org
Cc:     Harald Seiler <hws@denx.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2] kbuild: fix compression errors getting ignored
Date:   Tue,  9 Jul 2019 12:50:50 +0200
Message-Id: <20190709105048.4608-1-hws@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

A missing compression utility or other errors were not picked up by make
and an empty kernel image was produced.  By removing the &&, errors will
no longer be ignored.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Signed-off-by: Harald Seiler <hws@denx.de>
---

Changes in v2:
  - Use a much simpler fix for this problem

Thanks!  Somehow I totally missed doing it this way ...

 scripts/Makefile.lib | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f1f38c8cdc74..768e697df304 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -331,19 +331,19 @@ printf "%08x\n" $$dec_size |						\
 )
 
 quiet_cmd_bzip2 = BZIP2   $@
-      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 && $(size_append); } > $@
+      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9; $(size_append); } > $@
 
 # Lzma
 # ---------------------------------------------------------------------------
 
 quiet_cmd_lzma = LZMA    $@
-      cmd_lzma = { cat $(real-prereqs) | lzma -9 && $(size_append); } > $@
+      cmd_lzma = { cat $(real-prereqs) | lzma -9; $(size_append); } > $@
 
 quiet_cmd_lzo = LZO     $@
-      cmd_lzo = { cat $(real-prereqs) | lzop -9 && $(size_append); } > $@
+      cmd_lzo = { cat $(real-prereqs) | lzop -9; $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout && \
+      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
                   $(size_append); } > $@
 
 # U-Boot mkimage
@@ -386,7 +386,7 @@ quiet_cmd_uimage = UIMAGE  $@
 # big dictionary would increase the memory usage too much in the multi-call
 # decompression mode. A BCJ filter isn't used either.
 quiet_cmd_xzkern = XZKERN  $@
-      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh && \
+      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh; \
                      $(size_append); } > $@
 
 quiet_cmd_xzmisc = XZMISC  $@
-- 
2.20.1

