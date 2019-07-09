Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF44162F9B
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfGIE0V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:26:21 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42158 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfGIEZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:42 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVq009969;
        Tue, 9 Jul 2019 13:24:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVq009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646299;
        bh=65qATP3r4DXqcauZnw/DiveAPOtcG5uX+EGbDl+x5RQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dxO7Tl84MEUcbZZOPxR6MrDUMh+K9tBQYUbUVWDakXdcZMK8U2fxyVmNIS4rLjN05
         Q3h6Orm4aVEf89XwvMBbCieP2prZQ99bc4gp/CU8sdyNa1Xl1ro3b2HHPXZJevi7DT
         SuvWn3dY0zZ7/6h059uSng0gbQdauW0Ci8FmUezKBIIphWRBLcn9YYoluolpyf2jJ3
         uLTMXPSR++z0EXTCrwglQ+9KlG0+JGnI30bWsvlGz0ALNc5jHe102DDJmBIRSH0pu0
         SqYk7CSeK/KkTf0ErPIf8bZ+P8hojYS6FyXqt0kYLTny0hXQfoMJNSSaEddsrxknLY
         cfT2mIVZZEppQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
Date:   Tue,  9 Jul 2019 13:24:11 +0900
Message-Id: <20190709042416.27554-8-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Towards the goal of removing MODVERDIR, read out modules.order to get
the list of modules to be processed. This is simpler than parsing *.mod
files in $(MODVERDIR).

For external modules, $(KBUILD_EXTMOD)/modules.order should be read.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index fec6ec2ffa47..2ab1694a7df3 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -8,9 +8,10 @@
 # b) A <module>.o file which is the .o files above linked together
 # c) A <module>.mod file in $(MODVERDIR)/, listing the name of the
 #    the preliminary <module>.o file, plus all .o files
+# d) modules.order, which lists all the modules
 
 # Stage 2 is handled by this file and does the following
-# 1) Find all modules from the files listed in $(MODVERDIR)/
+# 1) Find all modules listed in modules.order
 # 2) modpost is then used to
 # 3)  create one <module>.mod.c file pr. module
 # 4)  create one Module.symvers file with CRC for all exported symbols
@@ -60,10 +61,10 @@ include scripts/Makefile.lib
 kernelsymfile := $(objtree)/Module.symvers
 modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
 
-# Step 1), find all modules listed in $(MODVERDIR)/
-MODLISTCMD := find $(MODVERDIR) -name '*.mod' | xargs -r grep -h '\.ko$$' | sort -u
-__modules := $(shell $(MODLISTCMD))
-modules   := $(patsubst %.o,%.ko, $(wildcard $(__modules:.ko=.o)))
+modorder := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
+
+# Step 1), find all modules listed in modules.order
+modules := $(sort $(shell cat $(modorder)))
 
 # Stop after building .o files if NOFINAL is set. Makes compile tests quicker
 _modpost: $(if $(KBUILD_MODPOST_NOFINAL), $(modules:.ko:.o),$(modules))
@@ -84,7 +85,7 @@ MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
 
 # We can go over command line length here, so be careful.
 quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
-      cmd_modpost = $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MODPOST_OPT) -s -T -
+      cmd_modpost = sed 's/ko$$/o/' $(modorder) | $(modpost) $(MODPOST_OPT) -s -T -
 
 PHONY += __modpost
 __modpost: $(modules:.ko=.o) FORCE
-- 
2.17.1

