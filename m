Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E325960E95
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 05:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfGFDIF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Jul 2019 23:08:05 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:48638 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfGFDIF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jul 2019 23:08:05 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x6637E3M030660;
        Sat, 6 Jul 2019 12:07:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x6637E3M030660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562382435;
        bh=NVx1Ga77bNYYYlQkkNzV5nPWpsmBD+I7gojwThxsH2o=;
        h=From:To:Cc:Subject:Date:From;
        b=Xupetkh3p7qOZRG+fNWqqwNgT5BxHZxn+A6FsJIQgTBZgseca0NY4fomzPQrExsxv
         TS31swD0wzKw3tmzyQIG8DQNKbOq5x3cVv0C1zDA7Vul4XJukIQuP8c2Wh576tJzV+
         6Q3ULwK/o5XIE1rSZgnU70peMJrlfTKbYHpMSNXUFotPMlfObDO/I2t1HI3y59jH0k
         lKfEY5AF+PsgXh1YnFSJ5yeAuXmnm6cscyjPUq75f6Fy/OoWPdqXF0xPIDblhKH7v4
         P4WMITUr5HzEBd9VAXTZTDskdaYiKDTFvw5+OfGt5CE37024inINZzYOe7GoFF51jB
         pzJ86LfoJybpg==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: remove obj and src from the top Makefile
Date:   Sat,  6 Jul 2019 12:07:11 +0900
Message-Id: <20190706030713.6221-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

$(obj) is not used in the top Makefile at all. $(src) is used in
3 sites, but they can be replaced with $(srctree).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 014390e32b0e..a5615edf2196 100644
--- a/Makefile
+++ b/Makefile
@@ -248,9 +248,6 @@ endif
 export KBUILD_CHECKSRC KBUILD_EXTMOD KBUILD_SRC
 
 objtree		:= .
-src		:= $(srctree)
-obj		:= $(objtree)
-
 VPATH		:= $(srctree)
 
 export srctree objtree VPATH
@@ -1705,7 +1702,7 @@ CHECKSTACK_ARCH := $(ARCH)
 endif
 checkstack:
 	$(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
-	$(PERL) $(src)/scripts/checkstack.pl $(CHECKSTACK_ARCH)
+	$(PERL) $(srctree)/scripts/checkstack.pl $(CHECKSTACK_ARCH)
 
 kernelrelease:
 	@echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
@@ -1724,11 +1721,11 @@ endif
 
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
 
 # Single targets
 # ---------------------------------------------------------------------------
-- 
2.17.1

