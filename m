Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7655B970D7
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2019 06:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfHUENZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Aug 2019 00:13:25 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:47151 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfHUENY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 00:13:24 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7L4CeQE002060;
        Wed, 21 Aug 2019 13:12:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L4CeQE002060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566360764;
        bh=06l9SB7v5ILNMn5J9bc9p5rJeGZsTfbhbNdQ8XoOG0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yWW1+L8I1XCIs628NU6dXbN1JpXVgGa9lCVYdjp/ScCfzZQSUxPV0PwRnETmrqy/y
         BByYlO59aDg0VprgA2PGszaeFB58MGpOeyIt6qeiSNz8wWeIaNtwR9bm4NotQe5T8a
         VXsus2w8/O/cqkMWzXWxe7g7nC+JR9AD7Lq9Gt1R8c4gJ2E+ekNKEzc3/IWtsnOkEs
         0F4qBsvJ5hQTI81EQ/uwCDzwidqFahybRK+sQfLkS/XT4QZ5rGlsux+0sLhbd8C03Q
         G6doNGfHAlto9L9vULFcwFjle5XABXdhtM+V2/NEUA8nyoiH/T7BdQtkePHOjLmhHO
         xtJg5XBwEqr7w==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] video/logo: move pnmtologo tool to drivers/video/logo/ from scripts/
Date:   Wed, 21 Aug 2019 13:12:37 +0900
Message-Id: <20190821041237.23197-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821041237.23197-1-yamada.masahiro@socionext.com>
References: <20190821041237.23197-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This tool is only used by drivers/video/logo/Makefile. No reason to
keep it in scripts/.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/video/logo/.gitignore               |  1 +
 drivers/video/logo/Makefile                 | 10 +++++-----
 {scripts => drivers/video/logo}/pnmtologo.c |  0
 scripts/.gitignore                          |  1 -
 scripts/Makefile                            |  2 --
 5 files changed, 6 insertions(+), 8 deletions(-)
 rename {scripts => drivers/video/logo}/pnmtologo.c (100%)

diff --git a/drivers/video/logo/.gitignore b/drivers/video/logo/.gitignore
index e48355f538fa..9dda1b26b2e4 100644
--- a/drivers/video/logo/.gitignore
+++ b/drivers/video/logo/.gitignore
@@ -5,3 +5,4 @@
 *_vga16.c
 *_clut224.c
 *_gray256.c
+pnmtologo
diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
index 7d672d40bf01..bcda657493a4 100644
--- a/drivers/video/logo/Makefile
+++ b/drivers/video/logo/Makefile
@@ -18,19 +18,19 @@ obj-$(CONFIG_SPU_BASE)			+= logo_spe_clut224.o
 
 # How to generate logo's
 
-pnmtologo := scripts/pnmtologo
+hostprogs-y := pnmtologo
 
 # Create commands like "pnmtologo -t mono -n logo_mac_mono -o ..."
 quiet_cmd_logo = LOGO    $@
-      cmd_logo = $(pnmtologo) -t $(lastword $(subst _, ,$*)) -n $* -o $@ $<
+      cmd_logo = $(obj)/pnmtologo -t $(lastword $(subst _, ,$*)) -n $* -o $@ $<
 
-$(obj)/%.c: $(src)/%.pbm $(pnmtologo) FORCE
+$(obj)/%.c: $(src)/%.pbm $(obj)/pnmtologo FORCE
 	$(call if_changed,logo)
 
-$(obj)/%.c: $(src)/%.ppm $(pnmtologo) FORCE
+$(obj)/%.c: $(src)/%.ppm $(obj)/pnmtologo FORCE
 	$(call if_changed,logo)
 
-$(obj)/%.c: $(src)/%.pgm $(pnmtologo) FORCE
+$(obj)/%.c: $(src)/%.pgm $(obj)/pnmtologo FORCE
 	$(call if_changed,logo)
 
 # generated C files
diff --git a/scripts/pnmtologo.c b/drivers/video/logo/pnmtologo.c
similarity index 100%
rename from scripts/pnmtologo.c
rename to drivers/video/logo/pnmtologo.c
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 17f8cef88fa8..4aa1806c59c2 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -4,7 +4,6 @@
 bin2c
 conmakehash
 kallsyms
-pnmtologo
 unifdef
 recordmcount
 sortextable
diff --git a/scripts/Makefile b/scripts/Makefile
index 16bcb8087899..709df809f892 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -4,7 +4,6 @@
 # the kernel for the build process.
 # ---------------------------------------------------------------------------
 # kallsyms:      Find all symbols in vmlinux
-# pnmttologo:    Convert pnm files to logo files
 # conmakehash:   Create chartable
 # conmakehash:	 Create arrays for initializing the kernel console tables
 
@@ -12,7 +11,6 @@ HOST_EXTRACFLAGS += -I$(srctree)/tools/include
 
 hostprogs-$(CONFIG_BUILD_BIN2C)  += bin2c
 hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
-hostprogs-$(CONFIG_LOGO)         += pnmtologo
 hostprogs-$(CONFIG_VT)           += conmakehash
 hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
 hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
-- 
2.17.1

