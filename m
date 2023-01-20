Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC466755E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jan 2023 14:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjATNfN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Jan 2023 08:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjATNfL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jan 2023 08:35:11 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9DDC41F2;
        Fri, 20 Jan 2023 05:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221709; x=1705757709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eT6/OtP4icPtU7cLMmIEL9r+vCRpPz4LoUKbCrTEVm4=;
  b=V81VMSHNN0pk5X4LlEXHl3dw5AdKlhbAWXlafFFNOly7zQZlLH4O6b8C
   hhjL+BbCYhls/dg7d7TTdNfETXjc41eRKLlLWD0CmLtMpugmx4JjdKOn6
   4iNKabCSEruvCAY+k3rTpn6LUkvbSZ4zdCUMPMZWkC4mk0UYRTyDF/zqa
   Iq9MO1Wy3JLHIhGX3V8ZsZWswmN2KfVLcU15lb3AuJJ16LgTmspNnqX2o
   qViMO2kxTVZg7YHeAA+V7/WEiGwH1eWJgS6JgkUBvhc1izpw/D2PeW4RP
   8StfRTKunVwnrZ68lspSUHlLQ3tJDOmKsqwktSa2mRKTHO/uKAypc99Jp
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561587"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:05 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221705; x=1705757705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eT6/OtP4icPtU7cLMmIEL9r+vCRpPz4LoUKbCrTEVm4=;
  b=gTmW7JIg3TYL0ndYOMIx9CBpbjj8/pMbfYq95Gt6AKGWa7QnXyJ3ANlY
   gHvfKAoSSceLvyivuMDwn81Dh0CvJvX9zjzZm68Yx3GjQFvdT+6AxY+qT
   QPNNf4o9WrIORl7ypGIEX3UHFhVNBGLCsIJ5pHPEQYQs7JLhfzxAYlYuF
   c4E2yFIszMl0KcDN7GIHSvIqlZZd5q4xoS/aEIwcTfpDzi87Nw0PUuqWY
   bINzRnhiwDe+w12gZqGVBeVTxuw7no3lcnzJ7mS2G6w/YhJt5je+WsR/a
   8HlDjTZjDfvOr8AiFeaLdkt334uJECWvKs1Bz3VgwpeclH4vESNv5uMoU
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561585"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:05 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3FA8B28007F;
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
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2 07/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH FC21 overlay
Date:   Fri, 20 Jan 2023 14:34:52 +0100
Message-Id: <20230120133455.3962413-8-alexander.stein@ew.tq-group.com>
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

Add device tree overlay for LVDS display usage.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm/boot/dts/Makefile                    |  2 +
 ...1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts | 55 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 774cc57274e20..bc51a5b868c10 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -806,10 +806,12 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
 
+ls1021a-tqmls1021a-mbls1021a-cdtech-fc21-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dtbo
 ls1021a-tqmls1021a-mbls1021a-cdtech-dc44-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dtbo
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
 
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts
new file mode 100644
index 0000000000000..4bd10d0e17b90
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "cdtech,s070pws19hp-fc21";
+	status = "okay";
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&dcu_out>;
+		};
+	};
+};
+
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	polytouch: touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&pca9554_0>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		/* LCD_PWR_EN -> TSC_WAKE */
+		wake-gpios = <&pca9554_1 4 GPIO_ACTIVE_HIGH>;
+		gain = <20>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+	};
+};
-- 
2.34.1

