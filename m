Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E298D7A1
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 18:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfHNQGq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Aug 2019 12:06:46 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:30776 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfHNQGq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 12:06:46 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x7EG6O97024737;
        Thu, 15 Aug 2019 01:06:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x7EG6O97024737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565798787;
        bh=gRWmtsYFUwXEvYPaQ9AZkEAa91zIEUkH9nocubkMAYU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nAJ9ybkgY+C3zCEzj6r2GGRwDO2LVm4pcNEx8uWfBtie9iRwptgDvbLn6WDk7MfOP
         uBp89VLOTveKi0MZlr3K9ZFBYlJHlKSma/cX/u3pKqFHnyuS4FE/AHSyYURIesMizt
         4Bbj+s9iuu0DN/0roA7X8UaaDW/l2wWRqpk/Wmb2QMjv3Ch+awyI78UzBMW0cQtpoO
         FsxdHWRXYZOR/zJ/tV+SIiN+bb7kXhVQZfCj8nEkNUM0V4XSqXdcuqlTDe9JwiuKxF
         YX+hqPcjUySmU3+cbw2jZSqQE+G9aa61rxF2reNil+lVvzw4VYvNyreeQYj+o0baHr
         yFkgUb4OO6moA==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kbuild: split final module linking out into Makefile.modfinal
Date:   Thu, 15 Aug 2019 01:06:23 +0900
Message-Id: <20190814160623.24802-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814160623.24802-1-yamada.masahiro@socionext.com>
References: <20190814160623.24802-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I think splitting the modpost and linking modules into separate
Makefiles will be useful especially when more complex build steps
come in. The main motivation of this patch is to integrate the
proposed klp-convert feature cleanly.

I moved the logging 'Building modules, stage 2.' to Makefile.modpost
to avoid the code duplication although I do not know whether or not
this message is needed in the first place.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                  |  2 --
 scripts/Makefile.modfinal | 60 +++++++++++++++++++++++++++++++
 scripts/Makefile.modpost  | 76 +++++----------------------------------
 3 files changed, 69 insertions(+), 69 deletions(-)
 create mode 100644 scripts/Makefile.modfinal

diff --git a/Makefile b/Makefile
index af808837a1f2..bc55f366677d 100644
--- a/Makefile
+++ b/Makefile
@@ -1307,7 +1307,6 @@ all: modules
 
 PHONY += modules
 modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order modules.builtin
-	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
 
@@ -1627,7 +1626,6 @@ $(objtree)/Module.symvers:
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
 modules: descend $(objtree)/Module.symvers
-	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 PHONY += modules_install
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
new file mode 100644
index 000000000000..2e49d536a9b3
--- /dev/null
+++ b/scripts/Makefile.modfinal
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# ===========================================================================
+# Module final link
+# ===========================================================================
+
+PHONY := __modfinal
+__modfinal:
+
+include scripts/Kbuild.include
+
+# for c_flags
+include scripts/Makefile.lib
+
+# find all modules listed in modules.order
+modules := $(sort $(shell cat $(MODORDER)))
+
+__modfinal: $(modules)
+	@:
+
+# modname is set to make c_flags define KBUILD_MODNAME
+modname = $(notdir $(@:.mod.o=))
+
+quiet_cmd_cc_o_c = CC [M]  $@
+      cmd_cc_o_c = $(CC) $(c_flags) $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE) \
+		   -c -o $@ $<
+
+%.mod.o: %.mod.c FORCE
+	$(call if_changed_dep,cc_o_c)
+
+ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
+
+quiet_cmd_ld_ko_o = LD [M]  $@
+      cmd_ld_ko_o =                                                     \
+	$(LD) -r $(KBUILD_LDFLAGS)					\
+		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
+		$(addprefix -T , $(KBUILD_LDS_MODULE))			\
+		-o $@ $(filter %.o, $^);				\
+	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+
+$(modules): %.ko: %.o %.mod.o $(KBUILD_LDS_MODULE) FORCE
+	+$(call if_changed,ld_ko_o)
+
+targets += $(modules) $(modules:.ko=.mod.o)
+
+# Add FORCE to the prequisites of a target to force it to be always rebuilt.
+# ---------------------------------------------------------------------------
+
+PHONY += FORCE
+FORCE:
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+.PHONY: $(PHONY)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 905db30d6622..673f68e5f15d 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -15,8 +15,6 @@
 # 2) modpost is then used to
 # 3)  create one <module>.mod.c file pr. module
 # 4)  create one Module.symvers file with CRC for all exported symbols
-# 5) compile all <module>.mod.c files
-# 6) final link of the module to a <module.ko> file
 
 # Step 3 is used to place certain information in the module's ELF
 # section, including information such as:
@@ -60,13 +58,10 @@ MODPOST = scripts/mod/modpost						\
 
 ifdef MODPOST_VMLINUX
 
-__modpost: vmlinux.o
+quiet_cmd_modpost = MODPOST vmlinux.o
+      cmd_modpost = $(MODPOST) vmlinux.o
 
-quiet_cmd_modpost = MODPOST $@
-      cmd_modpost = $(MODPOST) $@
-
-PHONY += vmlinux.o
-vmlinux.o:
+__modpost:
 	$(call cmd,modpost)
 
 else
@@ -83,74 +78,21 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
 endif
 
-include scripts/Makefile.lib
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - $(wildcard vmlinux)
 
 # find all modules listed in modules.order
 modules := $(sort $(shell cat $(MODORDER)))
 
-# Stop after building .o files if NOFINAL is set. Makes compile tests quicker
-__modpost: $(if $(KBUILD_MODPOST_NOFINAL), $(modules:.ko:.o),$(modules))
-	@:
-
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - $(wildcard vmlinux)
-
 # We can go over command line length here, so be careful.
 quiet_cmd_modpost = MODPOST $(words $(modules)) modules
       cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST)
 
-PHONY += modules-modpost
-modules-modpost:
+__modpost:
+	@$(kecho) '  Building modules, stage 2.'
 	$(call cmd,modpost)
-
-# Declare generated files as targets for modpost
-$(modules:.ko=.mod.c): modules-modpost
-
-# Step 5), compile all *.mod.c files
-
-# modname is set to make c_flags define KBUILD_MODNAME
-modname = $(notdir $(@:.mod.o=))
-
-quiet_cmd_cc_o_c = CC [M]  $@
-      cmd_cc_o_c = $(CC) $(c_flags) $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE) \
-		   -c -o $@ $<
-
-$(modules:.ko=.mod.o): %.mod.o: %.mod.c FORCE
-	$(call if_changed_dep,cc_o_c)
-
-targets += $(modules:.ko=.mod.o)
-
-ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
-
-# Step 6), final link of the modules with optional arch pass after final link
-quiet_cmd_ld_ko_o = LD [M]  $@
-      cmd_ld_ko_o =                                                     \
-	$(LD) -r $(KBUILD_LDFLAGS)                                      \
-                 $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)             \
-                 $(addprefix -T , $(KBUILD_LDS_MODULE))                 \
-                 -o $@ $(filter %.o, $^);                               \
-	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
-
-$(modules): %.ko :%.o %.mod.o $(KBUILD_LDS_MODULE) FORCE
-	+$(call if_changed,ld_ko_o)
-
-targets += $(modules)
-
-
-# Add FORCE to the prequisites of a target to force it to be always rebuilt.
-# ---------------------------------------------------------------------------
-
-PHONY += FORCE
-
-FORCE:
-
-# Read all saved command lines and dependencies for the $(targets) we
-# may be building above, using $(if_changed{,_dep}). As an
-# optimization, we don't need to read them if the target does not
-# exist, we will rebuild anyway in that case.
-
-existing-targets := $(wildcard $(sort $(targets)))
-
--include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+ifneq ($(KBUILD_MODPOST_NOFINAL),1)
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
+endif
 
 endif
 
-- 
2.17.1

