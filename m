Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE49F6B674
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 08:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfGQGSp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 02:18:45 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:62972 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfGQGS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:26 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6H6I5Oj009435;
        Wed, 17 Jul 2019 15:18:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6H6I5Oj009435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563344291;
        bh=a5q8HeaGgVOWSLah04ZIlj93TeQsneob5gv011FKr5g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ViwK+RhhxDTAPBewxfuYJk5gYFRwRsxaX+ne1sXhrIpqEBY5xtAMlK5o+dKAE/kAu
         62KtJxo1W4RM9sWKO9jbR2pX83+0BOX888DO7L/GTXSAMU/JApQIFrasegAlWEj47V
         4/HSTg2LdJpQbo410Pp4NZSY9fgW9qk2MTLMiV+jFV1nxvOqbPMabEU+c7dwXlYoa2
         Tn2cNr9V7xJddQtOyGUW2FWeNrHFUHG4sJAPSAW98JAQhjwiSTsuyx9lD7OFyij1m4
         nm8W+kkMiJN9AadWMW8Ov6MsLALK6O69RFvEUTmDA/0oFqpDokqC3I8DplRBMIu6Rl
         og4VELHdOGC7A==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/12] kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
Date:   Wed, 17 Jul 2019 15:17:55 +0900
Message-Id: <20190717061800.10018-8-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
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

Changes in v3:
  - Add ifdef CONFIG_MODULES to avoid warning

Changes in v2: None

 scripts/Makefile.modpost | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index fec6ec2ffa47..5841508ffca9 100644
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
@@ -60,10 +61,12 @@ include scripts/Makefile.lib
 kernelsymfile := $(objtree)/Module.symvers
 modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
 
-# Step 1), find all modules listed in $(MODVERDIR)/
-MODLISTCMD := find $(MODVERDIR) -name '*.mod' | xargs -r grep -h '\.ko$$' | sort -u
-__modules := $(shell $(MODLISTCMD))
-modules   := $(patsubst %.o,%.ko, $(wildcard $(__modules:.ko=.o)))
+modorder := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
+
+# Step 1), find all modules listed in modules.order
+ifdef CONFIG_MODULES
+modules := $(sort $(shell cat $(modorder)))
+endif
 
 # Stop after building .o files if NOFINAL is set. Makes compile tests quicker
 _modpost: $(if $(KBUILD_MODPOST_NOFINAL), $(modules:.ko:.o),$(modules))
@@ -84,7 +87,7 @@ MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
 
 # We can go over command line length here, so be careful.
 quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
-      cmd_modpost = $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MODPOST_OPT) -s -T -
+      cmd_modpost = sed 's/ko$$/o/' $(modorder) | $(modpost) $(MODPOST_OPT) -s -T -
 
 PHONY += __modpost
 __modpost: $(modules:.ko=.o) FORCE
-- 
2.17.1

