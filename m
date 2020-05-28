Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1721E5530
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2020 06:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbgE1EuC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 May 2020 00:50:02 -0400
Received: from mail.talpidae.net ([176.9.32.230]:60567 "EHLO
        node0.talpidae.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgE1EuC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 May 2020 00:50:02 -0400
X-Greylist: delayed 626 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 May 2020 00:50:00 EDT
Received: by node0.talpidae.net (mail.talpidae.net, from userid 33)
        id 6896490A225; Thu, 28 May 2020 04:39:33 +0000 (UTC)
To:     linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: allow modules_install if CONFIG_MODULES=n
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 28 May 2020 06:39:33 +0200
From:   Jonas Zeiger <jonas.zeiger@talpidae.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Organization: talpidae.net
Message-ID: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
X-Sender: jonas.zeiger@talpidae.net
User-Agent: Roundcube Webmail/1.2.3
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Many applications check for available kernel features via:

  * /proc/modules (loaded modules, present if CONFIG_MODULES=y)
  * $(MODLIB)/modules.builtin (builtin modules)

They fail to detect features if the kernel was built with 
CONFIG_MODULES=n
and modules.builtin isn't installed.

Therefore, allow the Makefile's modules_install target to be used 
always.

Tested Makefile targets with different CONFIG_MODULES states:

  * (CONFIG_MODULES=n) modules_install: install modules.builtin etc.
  * (CONFIG_MODULES=y) modules_install: produce same result as before
  * (CONFIG_MODULES=y) modules_install: still fail if no modules.order
  * (CONFIG_MODULES=y) modules: build modules, as before
  * (CONFIG_MODULES=n) modules: still fail and warn

Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>
---

  Makefile |   60 
++++++++++++++++++++++++++++++++----------------------------
  1 file changed, 32 insertions(+), 28 deletions(-)

diff -up linux/Makefile{.orig,}
--- linux/Makefile.orig	2020-05-28 04:27:34.341394622 +0200
+++ linux/Makefile	2020-05-28 05:18:00.540108227 +0200
@@ -1309,31 +1309,7 @@ dt_binding_check: scripts_dtc
  # 
---------------------------------------------------------------------------
  # Modules

-ifdef CONFIG_MODULES
-
-# By default, build modules as well
-
-all: modules
-
-# Build modules
-#
-# A module can be listed more than once in obj-m resulting in
-# duplicate lines in modules.order files.  Those are removed
-# using awk while concatenating to the final file.
-
-PHONY += modules
-modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
-
-modules.order: descend
-	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
-
-# Target to prepare building external modules
-PHONY += modules_prepare
-modules_prepare: prepare
-
-# Target to install modules
+# Target to install modules and accompanying files
  PHONY += modules_install
  modules_install: _modinst_ _modinst_post

@@ -1347,10 +1323,14 @@ _modinst_:
  		rm -f $(MODLIB)/build ; \
  		ln -s $(CURDIR) $(MODLIB)/build ; \
  	fi
-	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
  	@cp -f modules.builtin $(MODLIB)/
  	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
+ifdef CONFIG_MODULES
+	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
+else
+	@touch $(MODLIB)/modules.order
+endif

  # This depmod is only for convenience to give the initial
  # boot a modules.dep even before / is mounted read-write.  However the
@@ -1359,6 +1339,30 @@ PHONY += _modinst_post
  _modinst_post: _modinst_
  	$(call cmd,depmod)

+ifdef CONFIG_MODULES
+
+# By default, build modules as well
+
+all: modules
+
+# Build modules
+#
+# A module can be listed more than once in obj-m resulting in
+# duplicate lines in modules.order files.  Those are removed
+# using awk while concatenating to the final file.
+
+PHONY += modules
+modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
+
+modules.order: descend
+	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
+
+# Target to prepare building external modules
+PHONY += modules_prepare
+modules_prepare: prepare
+
  ifeq ($(CONFIG_MODULE_SIG), y)
  PHONY += modules_sign
  modules_sign:
@@ -1370,8 +1374,8 @@ else # CONFIG_MODULES
  # Modules not configured
  # 
---------------------------------------------------------------------------

-PHONY += modules modules_install
-modules modules_install:
+PHONY += modules
+modules:
  	@echo >&2
  	@echo >&2 "The present kernel configuration has modules disabled."
  	@echo >&2 "Type 'make config' and enable loadable module support."

