Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786FE6755EC
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jan 2023 14:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjATNfQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Jan 2023 08:35:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjATNfN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jan 2023 08:35:13 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C9FC4584;
        Fri, 20 Jan 2023 05:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221712; x=1705757712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UK9in/6pk+cr3TnMOT93DY7cqB9Lku8ZTtDleVDrgtc=;
  b=JJlZ6N8z7BqXoAIsjPdVYsPfb/RgD9W8vEKm5kSd2oTgpdZJuEyB1Tp5
   jJT8tPZ4c8gciZWCfe5ONQotWEoLMwiWyRWxaqLwxZwpL+zaHiMMAEtBy
   uiSQr2LrVye8GwmwJqInikwyEcIk3RkrOtIPZNzTp23vuIRwF6porzNCr
   caepBQ+95RWv3+mhpRinPgCDJyZxy9Ed8MHxpfCQ8C23s0ltJOUJXw2d7
   P3KnVgYobbIBLwJprdCrvLGkgPv4yprocozkZw8UZnt4q1UDLJMk6JkXn
   DrL/GR2hpXv9qhnpOe2/am1KuSSYpohFCufNDeO/p/D8twZyv9UGytATs
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561593"
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
  bh=UK9in/6pk+cr3TnMOT93DY7cqB9Lku8ZTtDleVDrgtc=;
  b=BTcLKl2xHZAJI46pdlQpnyUoeXJGB5vvghfy6DvSWczPmnhpvTq3KHhf
   FS+VA0cCgRPyMOKe22E4juIsD9DEcNnplumKpyZfzoEOAGLeF0qhROIWz
   FEPSaTzqsoOgPn2Nd8j474AhEQQlbmMiMTNUFFYTrWq23WNAhqKKfHv0d
   vb2GcNmFrRphU3wxvR8Om5G/paWw6dqAkxdPWQG2WHokE1VgrSSqSax4o
   kodh/XAZ3vM4XdWAz9ng195o1k50K9OdhiKBCLVcBSqwB4siuy8ivGg0O
   uehXPJbRCKcMeiCg+4JqN/c/bgQ9x2nIQXw4o11CXD6RIinkZrxJFEkWn
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561592"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:06 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 425DC28007F;
        Fri, 20 Jan 2023 14:35:06 +0100 (CET)
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
Subject: [PATCH v2 10/10] ARM: add multi_v7_lpae_defconfig
Date:   Fri, 20 Jan 2023 14:34:55 +0100
Message-Id: <20230120133455.3962413-11-alexander.stein@ew.tq-group.com>
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
Directly applied from https://lore.kernel.org/linux-arm-kernel/20200203184820.4433-2-nsaenzjulienne@suse.de/T/#m96968dd45c0aaa88e0a7387024b5ac13b002363d
Although I had to apply manually

 arch/arm/Makefile            | 4 ++++
 arch/arm/configs/lpae.config | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 arch/arm/configs/lpae.config

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 506dbc72323bc..80d9eaf3dc06a 100644
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
diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
new file mode 100644
index 0000000000000..19bab134e014b
--- /dev/null
+++ b/arch/arm/configs/lpae.config
@@ -0,0 +1 @@
+CONFIG_ARM_LPAE=y
-- 
2.34.1

