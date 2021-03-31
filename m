Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2EF35016F
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235930AbhCaNjY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:39:24 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:39444 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235796AbhCaNiy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:38:54 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFef003995;
        Wed, 31 Mar 2021 22:38:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFef003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197899;
        bh=ccm2gxQ8Sn16uNujvVd9jIDoZhLzk5TpvhT0PuS96OY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pnYzAZ2u7wtZfqjlP41GlFl4JdrN40tH5B+EBRK/Qm35ZRX5eLXZ10XBouoHpE8m8
         c3/ZL25fM5u40PLyf86mPE9lE81wBlIJ1S6lsfWpE593Dc6LmGOIzK8+B6MDmdk4LG
         dQT2wTQl07ed2ODhslyQqO7s2C+3uxxItpSwwhZsolU9Z3dzFkVqdI+xaXmBHamllU
         3VDQ9/9MShPLH6HhibIwY5E0WoKZYCdIbly2q+r0F2TRCVcKsX3bAHVHluyIcPe/R9
         gq/L3OtPELBmXH2xms4bogNKQHcagg3CcUczNAjqMsL1Ck/GSD3rCnsSc5jIZ7T96d
         8LviLPGSMOdzw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 8/9] kbuild: merge scripts/Makefile.modsign to scripts/Makefile.modinst
Date:   Wed, 31 Mar 2021 22:38:09 +0900
Message-Id: <20210331133811.3221540-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/Makefile.modsign is a subset of scripts/Makefile.modinst,
and duplicates the code. Let's merge them.

By the way, you do not need to run 'make modules_sign' explicitly
because modules are signed as a part of 'make modules_install' when
CONFIG_MODULE_SIG_ALL=y. If CONFIG_MODULE_SIG_ALL=n, mod_sign_cmd is
set to 'true', so 'make modules_sign' is not functional.

In my understanding, the reason of still keeping this is to handle
corner cases like commit 64178cb62c32 ("builddeb: fix stripped module
signatures if CONFIG_DEBUG_INFO and CONFIG_MODULE_SIG_ALL are set").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 36 ++++++++++++++++++++----------------
 scripts/Makefile.modinst |  9 +++++++++
 scripts/Makefile.modsign | 29 -----------------------------
 3 files changed, 29 insertions(+), 45 deletions(-)
 delete mode 100644 scripts/Makefile.modsign

diff --git a/Makefile b/Makefile
index f96ae09d111b..b14483742a67 100644
--- a/Makefile
+++ b/Makefile
@@ -1063,15 +1063,6 @@ export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)
 MODLIB	= $(INSTALL_MOD_PATH)/lib/modules/$(KERNELRELEASE)
 export MODLIB
 
-ifdef CONFIG_MODULE_SIG_ALL
-$(eval $(call config_filename,MODULE_SIG_KEY))
-
-mod_sign_cmd = scripts/sign-file $(CONFIG_MODULE_SIG_HASH) $(MODULE_SIG_KEY_SRCPREFIX)$(CONFIG_MODULE_SIG_KEY) certs/signing_key.x509
-else
-mod_sign_cmd = true
-endif
-export mod_sign_cmd
-
 HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
 
 has_libelf = $(call try-run,\
@@ -1439,7 +1430,26 @@ PHONY += modules_prepare
 modules_prepare: prepare
 	$(Q)$(MAKE) $(build)=scripts scripts/module.lds
 
-modules_install: __modinst_pre
+export modules_sign_only :=
+
+ifeq ($(CONFIG_MODULE_SIG),y)
+PHONY += modules_sign
+modules_sign: modules_install
+	@:
+
+# modules_sign is a subset of modules_install.
+# 'make modules_install modules_sign' is equivalent to 'make modules_install'.
+ifeq ($(filter modules_install,$(MAKECMDGOALS)),)
+modules_sign_only := y
+endif
+endif
+
+modinst_pre :=
+ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
+modinst_pre := __modinst_pre
+endif
+
+modules_install: $(modinst_pre)
 PHONY += __modinst_pre
 __modinst_pre:
 	@rm -rf $(MODLIB)/kernel
@@ -1454,12 +1464,6 @@ __modinst_pre:
 	@cp -f modules.builtin $(MODLIB)/
 	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 
-ifeq ($(CONFIG_MODULE_SIG), y)
-PHONY += modules_sign
-modules_sign:
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modsign
-endif
-
 endif # CONFIG_MODULES
 
 ###
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 943806b0abb5..156eb8239abc 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -76,11 +76,20 @@ quiet_cmd_sign :=
       cmd_sign := :
 endif
 
+ifeq ($(modules_sign_only),)
+
 $(dst)/%.ko: $(extmod_prefix)%.ko FORCE
 	$(call cmd,install)
 	$(call cmd,strip)
 	$(call cmd,sign)
 
+else
+
+$(dst)/%.ko: FORCE
+	$(call cmd,sign)
+
+endif
+
 #
 # Compression
 #
diff --git a/scripts/Makefile.modsign b/scripts/Makefile.modsign
deleted file mode 100644
index ddf9b5ca77d7..000000000000
--- a/scripts/Makefile.modsign
+++ /dev/null
@@ -1,29 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# ==========================================================================
-# Signing modules
-# ==========================================================================
-
-PHONY := __modsign
-__modsign:
-
-include $(srctree)/scripts/Kbuild.include
-
-modules := $(sort $(shell cat modules.order))
-
-PHONY += $(modules)
-__modsign: $(modules)
-	@:
-
-quiet_cmd_sign_ko = SIGN [M] $(2)/$(notdir $@)
-        cmd_sign_ko = $(mod_sign_cmd) $(2)/$(notdir $@)
-
-# Modules built outside the kernel source tree go into extra by default
-INSTALL_MOD_DIR ?= extra
-ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst %/,%,$(KBUILD_EXTMOD)),,$(@D))
-
-modinst_dir = $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
-
-$(modules):
-	$(call cmd,sign_ko,$(MODLIB)/$(modinst_dir))
-
-.PHONY: $(PHONY)
-- 
2.27.0

