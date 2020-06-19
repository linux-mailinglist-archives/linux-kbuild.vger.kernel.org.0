Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD4520016A
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2020 06:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgFSEtY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jun 2020 00:49:24 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:32689 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgFSEtY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 00:49:24 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 05J4mTiI004103;
        Fri, 19 Jun 2020 13:48:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 05J4mTiI004103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592542109;
        bh=4rA0auD5UHtK39rgTINnfk8iRh3kcMgz0E+K3tWV1bs=;
        h=From:To:Cc:Subject:Date:From;
        b=t4wrpDkn0sGbFNPqcvU2nw/3SooDaTwIeBuD3QIRo0qK6wE8TkBkIenkPkD6F1I4D
         VMqAlsS23fcB+h/qch+pzMu09HWIKVXTaoGFwaqtGyF+4Bptyb2xe+xZF0EpdrW3nL
         Ga8BlMvo1MPU/m5PRKcoD5uICObYaLaIA7xPtcQxzLExFpADePvE2Mi8Gfh2v5nKUl
         LQXSSl6rkb5IAxL3bgxGdU0zY8OzWGp8CC8oXKf0VfPTokvQgGN8ewUoPnyeKIQyGS
         5d1kApNdW/hl7IVtJ+gbqL72LkBZrqWJ6pTotVCJR9Y1ytGN3jhQscdTQwAH9T2Haq
         J/tAeeRPaBoNg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "Makefile: install modules.builtin even if CONFIG_MODULES=n"
Date:   Fri, 19 Jun 2020 13:48:23 +0900
Message-Id: <20200619044823.863461-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit e0b250b57dcf403529081e5898a9de717f96b76b.

Now that "make install" copies modules.builtin to $(INSTALL_MOD_PATH),
it breaks systems that do not set INSTALL_MOD_PATH for "make install".

While modules.builtin is useful for CONFIG_MODULES=n, this way gives
unexpected impact to existing systems. Maybe "make modules_install"
can install modules.builtin irrespective of CONFIG_MODULES as Jonas
originally suggested. Anyway, this commit should be reverted ASAP.

Reported-by: Douglas Anderson <dianders@chromium.org>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Cc: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 29abe44ada91..9880e911afe3 100644
--- a/Makefile
+++ b/Makefile
@@ -1336,16 +1336,6 @@ dt_binding_check: scripts_dtc
 # ---------------------------------------------------------------------------
 # Modules
 
-# install modules.builtin regardless of CONFIG_MODULES
-PHONY += _builtin_inst_
-_builtin_inst_:
-	@mkdir -p $(MODLIB)/
-	@cp -f modules.builtin $(MODLIB)/
-	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
-
-PHONY += install
-install: _builtin_inst_
-
 ifdef CONFIG_MODULES
 
 # By default, build modules as well
@@ -1389,7 +1379,7 @@ PHONY += modules_install
 modules_install: _modinst_ _modinst_post
 
 PHONY += _modinst_
-_modinst_: _builtin_inst_
+_modinst_:
 	@rm -rf $(MODLIB)/kernel
 	@rm -f $(MODLIB)/source
 	@mkdir -p $(MODLIB)/kernel
@@ -1399,6 +1389,8 @@ _modinst_: _builtin_inst_
 		ln -s $(CURDIR) $(MODLIB)/build ; \
 	fi
 	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
+	@cp -f modules.builtin $(MODLIB)/
+	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
 # This depmod is only for convenience to give the initial
-- 
2.25.1

