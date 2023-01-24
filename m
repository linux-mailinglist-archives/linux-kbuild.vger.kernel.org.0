Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88A0B67960E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 12:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbjAXLDA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 06:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233202AbjAXLC3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 06:02:29 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B330237B7E;
        Tue, 24 Jan 2023 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558145; x=1706094145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UhEGKPQYZuc8JeUYJQypaDn3DGwfkkMbp6gpJXkidK4=;
  b=lCHzglszR2zTth1c4Fhs2G6YIbmXphu33dKtsNqq8uSVNhUb1oIusWi/
   rzfu+NMqCvhQEnNyUZQkwflc5jB0Z/Mc5hpsKlHahoLPnr59ohPw53F9t
   qtLfjG1lssKUChjfeSiKsFaLrMf0kCbdfQVsyQ5TyohakxKVicYvrO6jf
   w8Xgb2txdiI/hX/6U6jHC9OwuGwuJla2ZxjP0hBKY6nwyFU3YKC3ZMzKx
   lxP8WRRhk0lUBcxDY1E0CItiw7rOpInJUiO4GdFvzum9AoBtN0hAqcTry
   g6LSCkdJzw4mXXPghTrlD2cOa5q+tPUrMYLtVWSvEcIYUan8dnYMWz9ZR
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616625"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:18 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:18 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558138; x=1706094138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UhEGKPQYZuc8JeUYJQypaDn3DGwfkkMbp6gpJXkidK4=;
  b=l5c6s4chmhCkC4xd3c7PYqgRsDrDp2L4qAu9wReiAixi96pbY2poT0+R
   gBAKkAKo/F5psBQmqdxfrAEjlRkqPc03lp3ciezsdsDBeUEyYS0jSIDX9
   JRUQo1V0GnU1jylrjtFUwigqw4+snRWQzJoO8og15zCoH6+UaJSVoLABm
   m8TbLiGLRKz3yIKq6bV2lbOz3Dt+9v+pmhzz/thJoYPmAsFi8Os7koQTy
   qyA6epufweOg7A+3ZQT+Hp6u0fvof9EgGJjIRWzrp8VIjW5K0cqEGXPrm
   K25BSZZ+VAHihpWDFTtRFOKbHBo8eLA/cymKRp5lzYfDgnyDcSzswY30R
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616624"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:18 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 45E3F280074;
        Tue, 24 Jan 2023 12:02:18 +0100 (CET)
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
Subject: [PATCH v3 06/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH DC44 overlay
Date:   Tue, 24 Jan 2023 12:02:09 +0100
Message-Id: <20230124110213.3221264-7-alexander.stein@ew.tq-group.com>
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

Add device tree overlay for LVDS display usage.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

Changes in v2:
* None

 arch/arm/boot/dts/Makefile                    |  2 +
 ...1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts | 55 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f9f75c5325808..64cc0f3f6efb0 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -806,9 +806,11 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
 
+ls1021a-tqmls1021a-mbls1021a-cdtech-dc44-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dtbo
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
 
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
 
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts
new file mode 100644
index 0000000000000..ddc71bc597295
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts
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
+	compatible = "cdtech,s070swv29hg-dc44";
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
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+	};
+};
-- 
2.34.1

