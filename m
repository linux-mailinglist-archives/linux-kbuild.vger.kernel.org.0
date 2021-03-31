Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B590350167
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbhCaNiy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:38:54 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38966 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbhCaNid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:38:33 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFeZ003995;
        Wed, 31 Mar 2021 22:38:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFeZ003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197896;
        bh=gRUT51AU4p255I4cNjY1DaJbtyk6brMPDK+FMwMQ8Q8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FRy42q6WyAh7zA5ZlsmsyJJMyLtsbKlHvALi9oGyewxqdR2P2zJFvh1LjAP/d7s60
         8bnFPiFUYQDVq9Uly31PFkuVlrIZV9HPbOv120OnEye3WV+54fwCzayF9x2fBSB6JX
         gz57DHPgDQUIACtTs0Hb5Q/55VMxCrhi/xK6dthClRZAwlJpVTlvzSQs8Sqrv6izhe
         Bv95shlb2mmpmdQP23scwBFdMQIpXXqs2nwH95DRxSPnzBntjGcZ+JiZxd3bxHQVLh
         BCqe3gl4f0UvfJ9+YxX6VUUONqmKJmQI4FOsY5uJqgD+2gn9dSFFaAwuFg+5dn2HtH
         89rcode/GlPIw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/9] kbuild: unify modules(_install) for in-tree and external modules
Date:   Wed, 31 Mar 2021 22:38:03 +0900
Message-Id: <20210331133811.3221540-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If you attempt to build/install modules ('make modules(_install)' with
CONFIG_MODULES disabled, you will get a clear error message, but nothing
for external module builds.

Factor out the modules and modules_install rules into the common part,
then you will get the same error message when you try to build external
modules with CONFIG_MODULES=n.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 85 ++++++++++++++++++++++++--------------------------------
 1 file changed, 36 insertions(+), 49 deletions(-)

diff --git a/Makefile b/Makefile
index 0e06db5ed9d8..99a2bd51c02d 100644
--- a/Makefile
+++ b/Makefile
@@ -1458,7 +1458,6 @@ endif
 
 PHONY += modules
 modules: $(if $(KBUILD_BUILTIN),vmlinux) modules_check modules_prepare
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 PHONY += modules_check
 modules_check: modules.order
@@ -1476,12 +1475,9 @@ PHONY += modules_prepare
 modules_prepare: prepare
 	$(Q)$(MAKE) $(build)=scripts scripts/module.lds
 
-# Target to install modules
-PHONY += modules_install
-modules_install: _modinst_ _modinst_post
-
-PHONY += _modinst_
-_modinst_:
+modules_install: __modinst_pre
+PHONY += __modinst_pre
+__modinst_pre:
 	@rm -rf $(MODLIB)/kernel
 	@rm -f $(MODLIB)/source
 	@mkdir -p $(MODLIB)/kernel
@@ -1493,14 +1489,6 @@ _modinst_:
 	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
 	@cp -f modules.builtin $(MODLIB)/
 	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
-
-# This depmod is only for convenience to give the initial
-# boot a modules.dep even before / is mounted read-write.  However the
-# boot script depmod is the master version.
-PHONY += _modinst_post
-_modinst_post: _modinst_
-	$(call cmd,depmod)
 
 ifeq ($(CONFIG_MODULE_SIG), y)
 PHONY += modules_sign
@@ -1508,20 +1496,6 @@ modules_sign:
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modsign
 endif
 
-else # CONFIG_MODULES
-
-# Modules not configured
-# ---------------------------------------------------------------------------
-
-PHONY += modules modules_install
-modules modules_install:
-	@echo >&2
-	@echo >&2 "The present kernel configuration has modules disabled."
-	@echo >&2 "Type 'make config' and enable loadable module support."
-	@echo >&2 "Then build a kernel with module support enabled."
-	@echo >&2
-	@exit 1
-
 endif # CONFIG_MODULES
 
 ###
@@ -1769,24 +1743,9 @@ KBUILD_BUILTIN :=
 KBUILD_MODULES := 1
 
 build-dirs := $(KBUILD_EXTMOD)
-PHONY += modules
-modules: $(MODORDER)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-
 $(MODORDER): descend
 	@:
 
-PHONY += modules_install
-modules_install: _emodinst_ _emodinst_post
-
-PHONY += _emodinst_
-_emodinst_:
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
-
-PHONY += _emodinst_post
-_emodinst_post: _emodinst_
-	$(call cmd,depmod)
-
 compile_commands.json: $(extmod-prefix)compile_commands.json
 PHONY += compile_commands.json
 
@@ -1809,6 +1768,39 @@ PHONY += prepare modules_prepare
 
 endif # KBUILD_EXTMOD
 
+# ---------------------------------------------------------------------------
+# Modules
+
+PHONY += modules modules_install
+
+ifdef CONFIG_MODULES
+
+modules: $(MODORDER)
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+
+quiet_cmd_depmod = DEPMOD  $(KERNELRELEASE)
+      cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
+                   $(KERNELRELEASE)
+
+modules_install:
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
+	$(call cmd,depmod)
+
+else # CONFIG_MODULES
+
+# Modules not configured
+# ---------------------------------------------------------------------------
+
+modules modules_install:
+	@echo >&2 '***'
+	@echo >&2 '*** The present kernel configuration has modules disabled.'
+	@echo >&2 '*** To use the module feature, please run "make menuconfig" etc.'
+	@echo >&2 '*** to enable CONFIG_MODULES.'
+	@echo >&2 '***'
+	@exit 1
+
+endif # CONFIG_MODULES
+
 # Single targets
 # ---------------------------------------------------------------------------
 # To build individual files in subdirectories, you can do like this:
@@ -1997,11 +1989,6 @@ tools/%: FORCE
 quiet_cmd_rmfiles = $(if $(wildcard $(rm-files)),CLEAN   $(wildcard $(rm-files)))
       cmd_rmfiles = rm -rf $(rm-files)
 
-# Run depmod only if we have System.map and depmod is executable
-quiet_cmd_depmod = DEPMOD  $(KERNELRELEASE)
-      cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
-                   $(KERNELRELEASE)
-
 # read saved command lines for existing targets
 existing-targets := $(wildcard $(sort $(targets)))
 
-- 
2.27.0

