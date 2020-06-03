Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C06A1ED0E1
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2020 15:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgFCNeH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jun 2020 09:34:07 -0400
Received: from mail.talpidae.net ([176.9.32.230]:47889 "EHLO
        node0.talpidae.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgFCNeG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 09:34:06 -0400
Received: by node0.talpidae.net (mail.talpidae.net, from userid 33)
        id 59E6D92D28C; Wed,  3 Jun 2020 13:34:05 +0000 (UTC)
To:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2] Makefile: install modules.builtin even if CONFIG_MODULES=n
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Jun 2020 15:34:05 +0200
From:   Jonas Zeiger <jonas.zeiger@talpidae.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Organization: talpidae.net
In-Reply-To: <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
 <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
Message-ID: <3cd1a050fe692425352745672295033c@talpidae.net>
X-Sender: jonas.zeiger@talpidae.net
User-Agent: Roundcube Webmail/1.2.3
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Many applications check for available kernel features via:

  - /proc/modules (loaded modules, present if CONFIG_MODULES=y)
  - $(MODLIB)/modules.builtin (builtin modules)

They fail to detect features if the kernel was built with 
CONFIG_MODULES=n
and modules.builtin isn't installed.

Therefore, add the target "_builtin_inst_" and make "install" and
"modules_install" depend on it.

Tests results:

  - make install: kernel image is copied as before, modules.builtin 
copied
  - make modules_install: (CONFIG_MODULES=n) nothing is copied, exit 1

Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>
---
  Makefile | 14 +++++++++++---
  1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index a7bc91cbac8f..a160efd62897 100644
--- a/Makefile
+++ b/Makefile
@@ -1315,6 +1315,16 @@ dt_binding_check: scripts_dtc
  # 
---------------------------------------------------------------------------
  # Modules

+# install modules.builtin regardless of CONFIG_MODULES
+PHONY += _builtin_inst_
+_builtin_inst_:
+	@mkdir -p $(MODLIB)/
+	@cp -f modules.builtin $(MODLIB)/
+	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
+
+PHONY += install
+install: _builtin_inst_
+
  ifdef CONFIG_MODULES

  # By default, build modules as well
@@ -1344,7 +1354,7 @@ PHONY += modules_install
  modules_install: _modinst_ _modinst_post

  PHONY += _modinst_
-_modinst_:
+_modinst_: _builtin_inst_
  	@rm -rf $(MODLIB)/kernel
  	@rm -f $(MODLIB)/source
  	@mkdir -p $(MODLIB)/kernel
@@ -1354,8 +1364,6 @@ _modinst_:
  		ln -s $(CURDIR) $(MODLIB)/build ; \
  	fi
  	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
-	@cp -f modules.builtin $(MODLIB)/
-	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst

  # This depmod is only for convenience to give the initial
-- 
2.26.2

