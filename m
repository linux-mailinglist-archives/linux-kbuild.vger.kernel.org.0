Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FF1350166
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhCaNiy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:38:54 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38974 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235869AbhCaNid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:38:33 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFee003995;
        Wed, 31 Mar 2021 22:38:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFee003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197898;
        bh=8oTCa3v8DZ4xlhzPxR/jkxGqLlQbn611U3PZhikh6nE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2aZcdHmMbUcmj6BXCtkqXGOQTVwYlVpvBsFn0BGORoQefNocOIcOT7GMR0P6F5ZeS
         aMgcPbCkmJ1/CeUb69gH/XMNqfWhUfBE6L5YPqnp6wWML0TBeBKzKKz19ISekNRkv7
         q5j6Gw9VxxZw9mbXuQhmMdg0phYHEoREBo/iSfka01MwOzNpVswsUoRH92LEd3P7VM
         JENfQXEHEQbxGg5KXJP/yCGGlCB/NGS93hW4jrBANyS260hOemD3qqv8r4c+LwroYJ
         vmAzoCNDz54OQtOKvpYMMw7l8qOALWIRsgeDCtmFthse1Ccgrvo/Wlm1K271PV4YjL
         rekPA4Sshx6KQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 7/9] kbuild: move module strip/compression code into scripts/Makefile.modinst
Date:   Wed, 31 Mar 2021 22:38:08 +0900
Message-Id: <20210331133811.3221540-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Both mod_strip_cmd and mod_compress_cmd are only used in
scripts/Makefile.modinst, hence there is no good reason to define them
in the top Makefile. Move the relevant code to scripts/Makefile.modinst.

Also, show separate log messages for each of install, strip, sign, and
compress.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 32 -----------------
 scripts/Makefile.modinst | 76 +++++++++++++++++++++++++++++++++++-----
 2 files changed, 68 insertions(+), 40 deletions(-)

diff --git a/Makefile b/Makefile
index 88e5c15e1186..f96ae09d111b 100644
--- a/Makefile
+++ b/Makefile
@@ -1063,38 +1063,6 @@ export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)
 MODLIB	= $(INSTALL_MOD_PATH)/lib/modules/$(KERNELRELEASE)
 export MODLIB
 
-#
-# INSTALL_MOD_STRIP, if defined, will cause modules to be
-# stripped after they are installed.  If INSTALL_MOD_STRIP is '1', then
-# the default option --strip-debug will be used.  Otherwise,
-# INSTALL_MOD_STRIP value will be used as the options to the strip command.
-
-ifdef INSTALL_MOD_STRIP
-ifeq ($(INSTALL_MOD_STRIP),1)
-mod_strip_cmd = $(STRIP) --strip-debug
-else
-mod_strip_cmd = $(STRIP) $(INSTALL_MOD_STRIP)
-endif # INSTALL_MOD_STRIP=1
-else
-mod_strip_cmd = true
-endif # INSTALL_MOD_STRIP
-export mod_strip_cmd
-
-# CONFIG_MODULE_COMPRESS, if defined, will cause module to be compressed
-# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP
-# or CONFIG_MODULE_COMPRESS_XZ.
-
-mod_compress_cmd = true
-ifdef CONFIG_MODULE_COMPRESS
-  ifdef CONFIG_MODULE_COMPRESS_GZIP
-    mod_compress_cmd = $(KGZIP) -n -f
-  endif # CONFIG_MODULE_COMPRESS_GZIP
-  ifdef CONFIG_MODULE_COMPRESS_XZ
-    mod_compress_cmd = $(XZ) --lzma2=dict=2MiB -f
-  endif # CONFIG_MODULE_COMPRESS_XZ
-endif # CONFIG_MODULE_COMPRESS
-export mod_compress_cmd
-
 ifdef CONFIG_MODULE_SIG_ALL
 $(eval $(call config_filename,MODULE_SIG_KEY))
 
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 3b2d0380504d..943806b0abb5 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -6,6 +6,7 @@
 PHONY := __modinst
 __modinst:
 
+include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
 modules := $(sort $(shell cat $(MODORDER)))
@@ -19,21 +20,80 @@ endif
 
 dst := $(MODLIB)/$(subdir)
 
-modules := $(patsubst $(extmod_prefix)%, $(dst)/%, $(modules))
+suffix-y				:=
+suffix-$(CONFIG_MODULE_COMPRESS_GZIP)	:= .gz
+suffix-$(CONFIG_MODULE_COMPRESS_XZ)	:= .xz
+
+modules := $(patsubst $(extmod_prefix)%, $(dst)/%$(suffix-y), $(modules))
 
 __modinst: $(modules)
 	@:
 
-# Don't stop modules_install if we can't sign external modules.
+quiet_cmd_none =
+      cmd_none = :
+
+#
+# Installation
+#
 quiet_cmd_install = INSTALL $@
-      cmd_install = \
-    mkdir -p $(dir $@); cp $< $@; \
-    $(mod_strip_cmd) $@; \
-    $(mod_sign_cmd) $@ $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
-    $(mod_compress_cmd) $@
+      cmd_install = mkdir -p $(dir $@); cp $< $@
+
+# Strip
+#
+# INSTALL_MOD_STRIP, if defined, will cause modules to be stripped after they
+# are installed. If INSTALL_MOD_STRIP is '1', then the default option
+# --strip-debug will be used. Otherwise, INSTALL_MOD_STRIP value will be used
+# as the options to the strip command.
+ifdef INSTALL_MOD_STRIP
+
+ifeq ($(INSTALL_MOD_STRIP),1)
+strip-option := --strip-debug
+else
+strip-option := $(INSTALL_MOD_STRIP)
+endif
+
+quiet_cmd_strip = STRIP   $@
+      cmd_strip = $(STRIP) $(strip-option) $@
+
+else
 
-$(modules): $(dst)/%: $(extmod_prefix)% FORCE
+quiet_cmd_strip =
+      cmd_strip = :
+
+endif
+
+#
+# Signing
+# Don't stop modules_install even if we can't sign external modules.
+#
+ifeq ($(CONFIG_MODULE_SIG_ALL),y)
+quiet_cmd_sign = SIGN    $@
+$(eval $(call config_filename,MODULE_SIG_KEY))
+      cmd_sign = scripts/sign-file $(CONFIG_MODULE_SIG_HASH) $(MODULE_SIG_KEY_SRCPREFIX)$(CONFIG_MODULE_SIG_KEY) certs/signing_key.x509 $@ \
+                 $(if $(KBUILD_EXTMOD),|| true)
+else
+quiet_cmd_sign :=
+      cmd_sign := :
+endif
+
+$(dst)/%.ko: $(extmod_prefix)%.ko FORCE
 	$(call cmd,install)
+	$(call cmd,strip)
+	$(call cmd,sign)
+
+#
+# Compression
+#
+quiet_cmd_gzip = GZIP    $@
+      cmd_gzip = $(KGZIP) -n -f $<
+quiet_cmd_xz = XZ      $@
+      cmd_xz = $(XZ) --lzma2=dict=2MiB -f $<
+
+$(dst)/%.ko.gz: $(dst)/%.ko FORCE
+	$(call cmd,gzip)
+
+$(dst)/%.ko.xz: $(dst)/%.ko FORCE
+	$(call cmd,xz)
 
 PHONY += FORCE
 FORCE:
-- 
2.27.0

