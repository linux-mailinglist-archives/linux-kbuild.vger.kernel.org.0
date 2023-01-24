Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E29679608
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 12:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbjAXLCz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 06:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233892AbjAXLCh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 06:02:37 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C41144BD;
        Tue, 24 Jan 2023 03:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558150; x=1706094150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xz/vRD3dolKFyEebpOql6jJYuQ0Wvwmw1Ox1BdnhLHg=;
  b=ZZCeP11oUC0Do7rDS+tdIf0P5cBoZJiv4URq8HTTx4/GCdDi8bSnL/5h
   lpsZFUGERwyqAMdnq2R+8sCStA4AfQHps4+76fxkFQAWNBpRnOppoyJH2
   lx1ZAaFbhnCEJOjRDXfFqb+GmyG+G53mtsjGE6LNDwicmDYTx0U/C3fqf
   xQh1/Q1zwYR/modP2/BNFVUe9SsZNL47tNAZ8FFl/0lcbAcsBsnmPLoae
   xCpFLyvCExB4TtlwkSgy5paQ0fLs1DferlBxLShAmCUVh93dBLbvlGvnB
   v+YUmj+nFOZHQJqi4Q8+YDMGUvJCHvmGTuPVoIm9rri8pl2taL9OWX6Cu
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616635"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:20 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558140; x=1706094140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xz/vRD3dolKFyEebpOql6jJYuQ0Wvwmw1Ox1BdnhLHg=;
  b=eMup3qfn4lFtLO7j8ckfrOw8PImobHyBd9qVInP+6ZzxcKCVJ58dqHWo
   4fy7SAcrHB0aiLY7NIf7chdhBivtGxL5ZnGIsKSr5CFNEfSQCJqXMOzC4
   BmGU2mEESNDkqVCXaECiiWAkiamjebSWY/RLQjY6paHaACda0VrMAhbvH
   7NYR+59jk87bYGmBTXuP82kxgSP62HItuvEp+BljBXsQNSv16yHMXg0QH
   Ib66RmGgg96G8lQbxnILTNoeVvWdOp1vqzqC+w54APXaiMf6ZBsoa9ILu
   iME9haXJJNrvaT+zNCwgnFeC5nlGdHn8nvPgqzGCkGNorbQrgVoCwbw+B
   A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616633"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:19 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8AA25280073;
        Tue, 24 Jan 2023 12:02:19 +0100 (CET)
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
Subject: [PATCH v3 10/10] ARM: add multi_v7_lpae_defconfig
Date:   Tue, 24 Jan 2023 12:02:13 +0100
Message-Id: <20230124110213.3221264-11-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
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

The only missing configuration option preventing us from using
multi_v7_defconfig with the Raspberry Pi 4 is ARM_LPAE. It's needed as
the PCIe controller found on the SoC depends on 64bit addressing, yet
can't be included as not all v7 boards support LPAE.

Introduce multi_v7_lpae_defconfig, built off multi_v7_defconfig, which will
avoid us having to duplicate and maintain multiple similar configurations.

Needless to say the Raspberry Pi 4 is not the only platform that can
benefit from this new configuration.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* As per Arnd's suggestion add CONFIG_VMSPLIT_2G to lpae.config fragment
* List multi_v7_lpae_defconfig target in 'make help' as well

Unfortunately the list of defconfigs is autogenerated, so this new
(explicit) target doesn't fit into this list. Therefore it's added to
'archhelp' instead.

 arch/arm/Makefile            | 6 ++++++
 arch/arm/configs/lpae.config | 2 ++
 2 files changed, 8 insertions(+)
 create mode 100644 arch/arm/configs/lpae.config

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a353b92641f36..485a439e22ca8 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -314,6 +314,10 @@ endif
 # My testing targets (bypasses dependencies)
 bp:;	$(Q)$(MAKE) $(build)=$(boot) $(boot)/bootpImage
 
+include $(srctree)/scripts/Makefile.defconf
+PHONY += multi_v7_lpae_defconfig
+multi_v7_lpae_defconfig:
+	$(call merge_into_defconfig,multi_v7_defconfig,lpae)
 
 define archhelp
   echo  '* zImage        - Compressed kernel image (arch/$(ARCH)/boot/zImage)'
@@ -329,4 +333,6 @@ define archhelp
   echo  '                  (distribution) /sbin/$(INSTALLKERNEL) or'
   echo  '                  install to $$(INSTALL_PATH) and run lilo'
   echo  '  vdso_install  - Install unstripped vdso.so to $$(INSTALL_MOD_PATH)/vdso'
+  echo
+  echo  '  multi_v7_lpae_defconfig     - multi_v7_defconfig with CONFIG_ARM_LPAE enabled'
 endef
diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
new file mode 100644
index 0000000000000..a6d6f7ab3c01a
--- /dev/null
+++ b/arch/arm/configs/lpae.config
@@ -0,0 +1,2 @@
+CONFIG_ARM_LPAE=y
+CONFIG_VMSPLIT_2G=y
-- 
2.34.1

