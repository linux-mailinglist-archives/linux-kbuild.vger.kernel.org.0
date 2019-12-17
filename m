Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE014122983
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 12:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfLQLHU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 06:07:20 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:30524 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfLQLHU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 06:07:20 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBHB6l1c018451;
        Tue, 17 Dec 2019 20:06:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBHB6l1c018451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576580808;
        bh=6qvlDUrtWHR5iRY7MwCqOb/BgmSMacVut2XSBVbDiUA=;
        h=From:To:Cc:Subject:Date:From;
        b=EslFmkfoCiIQMSUBtsXkFDdCeJ07T0wN5jC+mCBYQU8B2JKNCFR5NiXaSuX/GHfCG
         VtnhxpEj8+PYEmfeZvSLys0G4AZhE/Q9gYb8QdSbhcpnpsXRolv9db1+AFirojsYz3
         nLML40t020ItjnYuWkAsFdFr7FGQgGpHTxcZ5ZKe1Qs5dbpvi5LQejuQv4HB9fgPVO
         A5hDSyG7xQunBIofLh1o/CFbX/TmOeMYZDFGX8QftCNZbq30iod6mPoGzkxf7MkoBe
         KLwBHO5UQkkiZ3tl0wkMVBMexB4Ji1uKrlEm8Ple7WCEAfeaLR/84/aLo1BTe8mhwY
         Tni3LK/HGPZwA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] tty: vt: move conmakehash to drivers/tty/vt/ from scripts/
Date:   Tue, 17 Dec 2019 20:06:33 +0900
Message-Id: <20191217110633.8796-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/conmakehash is only used for generating
drivers/tty/vt/consolemap_deftbl.c

Move it to the related directory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/tty/vt/.gitignore                 | 1 +
 drivers/tty/vt/Makefile                   | 6 ++++--
 {scripts => drivers/tty/vt}/conmakehash.c | 0
 scripts/.gitignore                        | 1 -
 scripts/Makefile                          | 3 ---
 5 files changed, 5 insertions(+), 6 deletions(-)
 rename {scripts => drivers/tty/vt}/conmakehash.c (100%)

diff --git a/drivers/tty/vt/.gitignore b/drivers/tty/vt/.gitignore
index 9b38b85f9d9a..3ecf42234d89 100644
--- a/drivers/tty/vt/.gitignore
+++ b/drivers/tty/vt/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+conmakehash
 consolemap_deftbl.c
 defkeymap.c
diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
index edbbe0ccdb83..329ca336b8ee 100644
--- a/drivers/tty/vt/Makefile
+++ b/drivers/tty/vt/Makefile
@@ -12,10 +12,12 @@ obj-$(CONFIG_HW_CONSOLE)		+= vt.o defkeymap.o
 # Files generated that shall be removed upon make clean
 clean-files := consolemap_deftbl.c defkeymap.c
 
+hostprogs-y += conmakehash
+
 quiet_cmd_conmk = CONMK   $@
-      cmd_conmk = scripts/conmakehash $< > $@
+      cmd_conmk = $(obj)/conmakehash $< > $@
 
-$(obj)/consolemap_deftbl.c: $(src)/$(FONTMAPFILE)
+$(obj)/consolemap_deftbl.c: $(src)/$(FONTMAPFILE) $(obj)/conmakehash
 	$(call cmd,conmk)
 
 $(obj)/defkeymap.o:  $(obj)/defkeymap.c
diff --git a/scripts/conmakehash.c b/drivers/tty/vt/conmakehash.c
similarity index 100%
rename from scripts/conmakehash.c
rename to drivers/tty/vt/conmakehash.c
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 4aa1806c59c2..fcbc81f7c3d4 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -2,7 +2,6 @@
 # Generated files
 #
 bin2c
-conmakehash
 kallsyms
 unifdef
 recordmcount
diff --git a/scripts/Makefile b/scripts/Makefile
index 00c47901cb06..96f155b582dd 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -4,14 +4,11 @@
 # the kernel for the build process.
 # ---------------------------------------------------------------------------
 # kallsyms:      Find all symbols in vmlinux
-# conmakehash:   Create chartable
-# conmakehash:	 Create arrays for initializing the kernel console tables
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
 
 hostprogs-$(CONFIG_BUILD_BIN2C)  += bin2c
 hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
-hostprogs-$(CONFIG_VT)           += conmakehash
 hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
 hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
 hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
-- 
2.17.1

