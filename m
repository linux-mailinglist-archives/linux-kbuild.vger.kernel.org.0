Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59C1320A62
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 14:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhBUNEl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 08:04:41 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:58318 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhBUNEh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 08:04:37 -0500
Received: from grover.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 11LD3L9l011207;
        Sun, 21 Feb 2021 22:03:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 11LD3L9l011207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613912603;
        bh=hmQ6YdR7C31Qdx1RburqnKJnpwAcnPXGJ1yRVTrR3sU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qjwFzgXSvRTYitEJyphRVb4/6Fj2GW2uxzZ/MQwPN9lJDOUmLO7H7YEbLNtdrOdef
         KBF0XDbksTNecWS3vcfM+yd4x0boiCf0arWuqRb0SyAp+tjaRG0KacN9ERXF1kMHCN
         W9z2DX4fFuXE19ReeSECNvvp4e95XFpaJFRnsCtrOtbLRsouK9VI86ZgXmKvghel/n
         IhtiwWwMgI5eaQ0oku0AwiD7nmQz/XIdsP7etBMCR92s5tpRNnDPS8Zk9NdXKHGAqY
         Yzq1ofhVHNEIA+ZvFxjZIc6qoOqelkE/OjKCYEuUrpSKCUYplilxcYdzE2blCjNYuk
         UntElwBp03M9g==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kconfig: unify rule of config, menuconfig, nconfig, gconfig, xconfig
Date:   Sun, 21 Feb 2021 22:03:18 +0900
Message-Id: <20210221130318.160327-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221130318.160327-1-masahiroy@kernel.org>
References: <20210221130318.160327-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Unify the similar build rules.

This supports 'make build_config', which builds scripts/kconfig/conf
but does not invoke it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 5180a71c931f..5187639f9da5 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -3,9 +3,6 @@
 # Kernel configuration targets
 # These targets are used from top-level makefile
 
-PHONY += xconfig gconfig menuconfig config localmodconfig localyesconfig \
-	build_menuconfig build_nconfig build_gconfig build_xconfig
-
 ifdef KBUILD_KCONFIG
 Kconfig := $(KBUILD_KCONFIG)
 else
@@ -19,29 +16,23 @@ endif
 # We need this, in case the user has it in its environment
 unexport CONFIG_
 
-xconfig: $(obj)/qconf
-	$(Q)$< $(silent) $(Kconfig)
-
-gconfig: $(obj)/gconf
-	$(Q)$< $(silent) $(Kconfig)
-
-menuconfig: $(obj)/mconf
-	$(Q)$< $(silent) $(Kconfig)
-
-config: $(obj)/conf
-	$(Q)$< $(silent) $(Kconfig)
-
-nconfig: $(obj)/nconf
-	$(Q)$< $(silent) $(Kconfig)
-
-build_menuconfig: $(obj)/mconf
+config-prog	:= conf
+menuconfig-prog	:= mconf
+nconfig-prog	:= nconf
+gconfig-prog	:= gconf
+xconfig-prog	:= qconf
 
-build_nconfig: $(obj)/nconf
+define config_rule
+PHONY += $(1) build_$(1)
+$(1): $(obj)/$($(1)-prog)
+	$(Q)$$< $(silent) $(Kconfig)
 
-build_gconfig: $(obj)/gconf
+build_$(1): $(obj)/$($(1)-prog)
+endef
 
-build_xconfig: $(obj)/qconf
+$(foreach c, config menuconfig nconfig gconfig xconfig, $(eval $(call config_rule,$(c))))
 
+PHONY += localmodconfig localyesconfig
 localyesconfig localmodconfig: $(obj)/conf
 	$(Q)$(PERL) $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 				\
-- 
2.27.0

