Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250D76755EE
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jan 2023 14:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjATNfR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Jan 2023 08:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjATNfN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jan 2023 08:35:13 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2F4C41EA;
        Fri, 20 Jan 2023 05:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221712; x=1705757712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jeLxjazrEih89VJNavAbz95sBkW/7H1uB/1gGqv3ROs=;
  b=QRwj+zY2BBXOTYJ717/onafB+uYing9XZwNf8uAw/LGY6/Nl1/zbcokb
   W5a5fwoInGy17o2LIBkoGIL94rGAwWLZdvkUCi4OVQKAuj0AHq/Yhj+VT
   EABplmelBtSQDm+vmJvhVSBDSMb6IQzZ/M/WM2VI5baeNzRL06FRG0HEd
   ARWMwF1mo8QOhEAhC63bFQTJCms9x9jPrzwPMbYFAIoazw9eR3yv1yT2g
   IjwpsBI1UE3qim6Xn1gzM0c0s6gCVZmA9KW3ML51+ywymR++Thc5s+11/
   wW2OH+Y38DeJiulGqWr1NwasTAw7LqqGo7spblm7PdvI4/DaoIvgaPrV4
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561591"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:06 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:06 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221706; x=1705757706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jeLxjazrEih89VJNavAbz95sBkW/7H1uB/1gGqv3ROs=;
  b=oJuRmyzBqL7aeSuf5iRIj9SBrXiLVpHa+9ELCuExiHd4+JRAnzLZ8+yD
   BDlJBssQiPDKIkLm3QxZF1ty5sAiVkE7K0zMrySdOfsBBc44VSCgkYukQ
   mE1PRH+HtmgpyLMKwAI5sxACLh2ZgY/KpB/S+wDxwtS6kIW4BNV3m8EHV
   0n4xX8+8ff5aGduJoKoLtyGQ1uOadCwL+RUBW0gsPQiJY3ICw3sY5SPrf
   3XibdPaZbaokhiZJS0OKX6atD4ZT82YyH0+DO7BR5IktZNlnAVT7jamh/
   vlIJqvC6HFObkkcsmylo87C7b+nUNFC0EjPXtamkRlM/dlQA/XNZt4b1O
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561590"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:06 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DF6B9280074;
        Fri, 20 Jan 2023 14:35:05 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Marek Vasut <marex@denx.de>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 09/10] kbuild: Add config fragment merge functionality
Date:   Fri, 20 Jan 2023 14:34:54 +0100
Message-Id: <20230120133455.3962413-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

So far this function was only used locally in powerpc, some other
architectures might benefit from it. Move it into
scripts/Makefile.defconf.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Directly applied from https://lore.kernel.org/linux-arm-kernel/20200203184820.4433-2-nsaenzjulienne@suse.de/T/#m96968dd45c0aaa88e0a7387024b5ac13b002363d

 arch/powerpc/Makefile    | 12 +-----------
 scripts/Makefile.defconf | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 11 deletions(-)
 create mode 100644 scripts/Makefile.defconf

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index dc4cbf0a5ca95..533457466ce25 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -253,17 +253,7 @@ PHONY += bootwrapper_install
 bootwrapper_install:
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
-# Used to create 'merged defconfigs'
-# To use it $(call) it with the first argument as the base defconfig
-# and the second argument as a space separated list of .config files to merge,
-# without the .config suffix.
-define merge_into_defconfig
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
-	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
-endef
-
+include $(srctree)/scripts/Makefile.defconf
 PHONY += pseries_le_defconfig
 pseries_le_defconfig:
 	$(call merge_into_defconfig,pseries_defconfig,le)
diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
new file mode 100644
index 0000000000000..ab332f7534f51
--- /dev/null
+++ b/scripts/Makefile.defconf
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+# Configuration heplers
+
+# Creates 'merged defconfigs'
+# ---------------------------------------------------------------------------
+# Usage:
+#   $(call merge_into_defconfig,base_config,config_fragment1 config_fragment2 ...)
+#
+# Input config fragments without '.config' suffix
+define merge_into_defconfig
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
+		-m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/$(1) \
+		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
+	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+endef
-- 
2.34.1

