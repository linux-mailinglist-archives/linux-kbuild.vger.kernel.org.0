Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE311679609
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 12:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbjAXLC4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 06:02:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbjAXLC0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 06:02:26 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6FD16ACE;
        Tue, 24 Jan 2023 03:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558142; x=1706094142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bQWl+zEXqRlDMud2pT313tNSVupzo56fk4UhewuFOWI=;
  b=QX2H6H8QQ3glitXotR2vBrNjUu4IYzuPxRjDUlNTI8Zqsi0sBEbb9DsQ
   8JXbN6QkbBkWe7esiHhRS+nKwfMZz8FJ4EnWRMz+wz/fZ4r98O+GoPK1H
   V5ASRnx6wgJ0FiPaAaQC+sVcRh67oFFWXyPOp6Rdekl8zt/z/wEFuCPmj
   hoAdVP2+SytJMF9lO2PCuizBNobQNtaAAKm2d+MUuA1xoYeQG8+v89JQa
   lvnS8GDvCkDzJV8s0InYGjbqdrmRI27CGAEm1rPUvOnpasbooHLCCdDGE
   hAgsOJKQRSfnFsQwkRkpYHAKyxzohdphGCZi4Tqr3PCW1PddD0N8UG+cY
   g==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616612"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:17 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:17 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558137; x=1706094137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bQWl+zEXqRlDMud2pT313tNSVupzo56fk4UhewuFOWI=;
  b=UPsJk+QmNpsw9uUhIt7BzU8/UC19vP2rK/7RSbDo2rWe4D4K/O+aCkX/
   pz+RHs0X8aczuv/PcGkw+zs2CGN8iJozwxo4FlquKoMv5kXQJJZOQhEyP
   pQ1f2TXrIBTJxfZJujX2cPwHwpYsTR1qE9hdDPs0hM6HM0cHEGGstAyXX
   dulysBpTyzZMmu1JAbE/CUiVhv3sQUJnzV4hWy9GVKtFZfPj0xKdEQ55w
   tWoQz1RAvwb99XiCArPufu7KEYIl+X8asFlBLW93PT7Z11JGibY3hqT1A
   +IS9fzSwszhnc7yo8bGUggcFWmPQsdCoUlzHSQ00pIhm06NEoQQr8uI0O
   g==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616611"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:17 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CB836280056;
        Tue, 24 Jan 2023 12:02:16 +0100 (CET)
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
Subject: [PATCH v3 02/10] ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
Date:   Tue, 24 Jan 2023 12:02:05 +0100
Message-Id: <20230124110213.3221264-3-alexander.stein@ew.tq-group.com>
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

Add device tree for the MBLS102xA mainboard with TQMLS1021A SoM.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

Changes in v2:
* Remove unnecessary status = "okay"
* Remove underscore from node names
* Move reg direct below compatiblefor i2c devices
* Remove i2c device nodes without software support
  Add a comment about existance for the device though

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/ls1021a-tqmls1021a-mbls1021a.dts | 406 ++++++++++++++++++
 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi     |  81 ++++
 3 files changed, 488 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 53e9c96136519..758b6f2f14e7d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -802,6 +802,7 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-iot.dtb \
 	ls1021a-moxa-uc-8410a.dtb \
 	ls1021a-qds.dtb \
+	ls1021a-tqmls1021a-mbls1021a.dtb \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
 dtb-$(CONFIG_SOC_VF610) += \
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
new file mode 100644
index 0000000000000..aa8b605344655
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/leds/leds-pca9532.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "ls1021a-tqmls1021a.dtsi"
+
+/ {
+	model = "TQMLS102xA SOM on MBLS102xA";
+	compatible = "tq,ls1021a-tqmls1021a-mbls102xa", "tq,ls1021a-tqmls1021a", "fsl,ls1021a";
+
+	audio_mclk: audio-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	backlight_dcu: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pca9530 0 GPIO_ACTIVE_LOW>;
+		status = "disabled";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		switch-1 {
+			label = "S6";
+			linux,code = <BTN_0>;
+			gpios = <&pca9554_0 0 GPIO_ACTIVE_LOW>;
+		};
+
+		btn2: switch-2 {
+			label = "S7";
+			linux,code = <BTN_1>;
+			gpios = <&pca9554_0 1 GPIO_ACTIVE_LOW>;
+		};
+
+		switch-3 {
+			label = "S8";
+			linux,code = <BTN_2>;
+			gpios = <&pca9554_0 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio_leds: gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <0>;
+			gpios = <&pca9554_2 4 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&pca9554_2 5 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <2>;
+			gpios = <&pca9554_2 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			function-enumerator = <0>;
+			gpios = <&pca9554_2 7 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	lvds_encoder: lvds-encoder {
+		compatible = "ti,sn75lvds83", "lvds-encoder";
+		power-supply = <&reg_3p3v>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_encoder_in: endpoint {};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_encoder_out: endpoint {};
+			};
+		};
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		vin-supply = <&reg_3p3v>;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	hdmi_out: hdmi {
+		compatible = "hdmi-connector";
+		type = "a";
+		ddc-i2c-bus = <&i2c0>;
+		status = "disabled";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&sii9022a_out>;
+			};
+		};
+	};
+
+	display: panel {
+		backlight = <&backlight_dcu>;
+		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+
+		port {
+			panel_in: endpoint {};
+		};
+	};
+
+	sound {
+		compatible = "fsl,imx-audio-tlv320aic32x4";
+		model = "ls1021a-mbls1021a-tlv320aic32";
+		ssi-controller = <&sai1>;
+		audio-codec = <&tlv320aic32x4>;
+	};
+
+};
+
+&can0 {
+	status = "okay";
+	xceiver-supply = <&reg_3p3v>;
+};
+
+&can1 {
+	status = "okay";
+	xceiver-supply = <&reg_3p3v>;
+};
+
+&dspi0 {
+	bus-num = <0>;
+	status = "okay";
+};
+
+&enet0 {
+	phy-handle = <&rgmii_phy0c>;
+	phy-mode = "rgmii-id";
+	mac-address = [ 00 00 00 00 00 00 ];
+	status = "okay";
+};
+
+&enet1 {
+	tbi-handle = <&tbi1>;
+	phy-handle = <&sgmii_phy03>;
+	phy-mode = "sgmii";
+	mac-address = [ 00 00 00 00 00 00 ];
+	status = "okay";
+};
+
+&enet2 {
+	phy-handle = <&rgmii_phy04>;
+	phy-mode = "rgmii-id";
+	mac-address = [ 00 00 00 00 00 00 ];
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	tlv320aic32x4: audio-codec@18 {
+		compatible = "ti,tlv320aic32x4";
+		reg = <0x18>;
+		clocks = <&audio_mclk>;
+		clock-names = "mclk";
+		ldoin-supply = <&reg_3p3v>;
+		iov-supply = <&reg_3p3v>;
+	};
+
+	pca9554_0: gpio-expander@20 {
+		compatible = "nxp,pca9554";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		vcc-supply = <&reg_3p3v>;
+		gpio-line-names = "BUTTON0", "BUTTON1",
+				  "BUTTON2", "EMMC_SEL",
+				  "DIP2", "DIP3",
+				  "EXT_TOUCH_INT", "GPIO_1";
+	};
+
+	pca9554_1: gpio-expander@21 {
+		compatible = "nxp,pca9554";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		vcc-supply = <&reg_3p3v>;
+		gpio-line-names = "PCIE_PWR_EN", "MPCIE_DISABLE#",
+				  "MPCIE_WAKE#", "LCD_BLT_EN",
+				  "LCD_PWR_EN", "EC1_PHY_PWDN",
+				  "EC3_PHY_PWDN", "SGMII_PHY_PWDN";
+	};
+
+	pca9554_2: gpio-expander@22 {
+		compatible = "nxp,pca9554";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&extirq>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		vcc-supply = <&reg_3p3v>;
+		gpio-line-names = "MUX_SEL0", "MUX_SEL1",
+				  "MUX_SEL2", "MUX_SEL3",
+				  "V95", "V96", "V97", "V98";
+	};
+
+	sii9022a: hdmi-transmitter@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		iovcc-supply = <&reg_3p3v>;
+		cvcc12-supply = <&reg_1p2v>;
+		interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022a_in: endpoint {};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022a_out: endpoint {
+					remote-endpoint = <&hdmi_in>;
+				};
+			};
+		};
+	};
+
+	stmpe811: touchscreen@41 {
+		compatible = "st,stmpe811";
+		reg = <0x41>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&reg_3p3v>;
+		vio-supply = <&reg_3p3v>;
+
+		gpio {
+			compatible = "st,stmpe-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			/* GPIO 5-7 used for touch */
+			st,norequest-mask = <0xf0>;
+			gpio-line-names = "GPIO_ADC_I2C1_1",
+					  "GPIO_ADC_I2C1_2",
+					  "GPIO_ADC_I2C1_3",
+					  "GPIO_ADC_I2C1_4";
+		};
+
+		touchscreen {
+			compatible = "st,stmpe-ts";
+			status = "disabled";
+		};
+	};
+
+	pca9530: leds@60 {
+		compatible = "nxp,pca9530";
+		reg = <0x60>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "PWM_0", "PWM_1";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&lpuart0 {
+	status = "okay";
+	linux,rs485-enabled-at-boot-time;
+};
+
+&mdio0 {
+	sgmii_phy03: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x03>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		ti,dp83867-rxctrl-strap-quirk;
+	};
+
+	rgmii_phy04: ethernet-phy@4 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x04>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+	};
+
+	rgmii_phy0c: ethernet-phy@c {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0c>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+	};
+};
+
+&pwm6 {
+	status = "okay";
+};
+
+&pwm7 {
+	status = "okay";
+};
+
+&sai1 {
+	status = "okay";
+};
+
+&sata {
+	/delete-property/ dma-coherent;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb3 {
+	/*
+	 * Although DR connector, VBUS is always driven, so
+	 * restrict to host mode.
+	 */
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
new file mode 100644
index 0000000000000..24ad4a76fe597
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include "ls1021a.dtsi"
+
+/ {
+	model = "TQMLS102xA SOM";
+	compatible = "tq,ls1021a-tqmls1021a", "fsl,ls1021a";
+
+	reg_3p3v_som: regulator-3p3v-som {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V_SOM";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&esdhc {
+	compatible = "fsl,esdhc", "fsl,ls1021a-esdhc";
+	/* e-MMC over 8 data lines */
+	bus-width = <8>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	/* MC34VR500 DC/DC regulator at 0x8 */
+	/* On-board PMC at 0x11 */
+
+	sa56004: temperature-sensor@4c {
+		compatible = "nxp,sa56004";
+		reg = <0x4c>;
+		vcc-supply = <&reg_3p3v_som>;
+	};
+
+	rtc0: rtc@51 {
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
+	};
+
+	m24c64_54: eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+		pagesize = <32>;
+		read-only;
+		vcc-supply = <&reg_3p3v_som>;
+	};
+};
+
+&mdio0 {
+	tbi1: tbi-phy@8 {
+		reg = <0x8>;
+		device_type = "tbi-phy";
+	};
+};
+
+&scfg {
+	reg = <0x0 0x1570000 0x0 0x0e00>;
+};
+
+&qspi {
+	status = "okay";
+
+	qflash0: flash@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <0>;
+	};
+};
-- 
2.34.1

