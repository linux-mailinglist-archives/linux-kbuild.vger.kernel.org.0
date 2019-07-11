Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC8765194
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbfGKFpy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:45:54 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59469 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbfGKFpx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:53 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8R031345;
        Thu, 11 Jul 2019 14:44:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8R031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823897;
        bh=3stWZci9Q+1wdEeQ+22mZim0UiOILKQPDAUatPWkXUI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zzCfgYA12HxNWflkTTSLjdaoGUyyLL9M/njlyZm5txsFXwvgJ74ShigkKw5imyZss
         kj8ERkblQ7mqx44PHmO/10pfcCrbHP5C/I9wot+jrNFccigeDUKEnwI04V+fgBncmL
         RFD4T5FPwZVADdTjjOw5g4GNWzpH+f6O7a5KIby/9/DHMvVBZ1t5CXpuE1bcFvCDv1
         B9COiiUpEIyfHCm4A1D3SVkjPGegRCEiJiDVrbEW8klESO24PwaNQyujT+yJyhVqVj
         b1pEjy1iPZmi52NbIXi0UIkMjHpL/b8CmEV9dE8qeFlVDFMl+/sWdQm/YPGlzlVjSR
         OwrXibzngaTQQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
Date:   Thu, 11 Jul 2019 14:44:30 +0900
Message-Id: <20190711054434.1177-8-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
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

Changes in v2: None

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

