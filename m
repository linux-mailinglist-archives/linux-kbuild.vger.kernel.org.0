Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD2B679601
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 12:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbjAXLCv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 06:02:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjAXLC0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 06:02:26 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE3C2DE6F;
        Tue, 24 Jan 2023 03:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558142; x=1706094142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oGiyXaJNmANxjg8Vq0a8jTPt9MvSMy2CNwFRW9y3uL0=;
  b=gweuw/rCco6/5p40E43qymCL0Tk9Sp+Trj3+oufaN7MHm0vS94wh2khG
   YeLrpzkzu0OygiQzISMQTSfT8R+Jbp/e4wX03knQTZXqbm1hJMO8Lt92h
   r3M2XXk4pJKV2jK/2kdHKY3zUm27L+zf+vbdearDf74dregU78S4t6BTN
   mvk+B7hrCRzksMgFM+uHzpd1DSdgIgsnMpWVkUIJPqn6Luf3NV5LAuV1P
   e1zkN5XiMbdkyL93JSGHrKlDDLEILfaTQrSE5Cp1wC+Y7z6aAjkYVoXBw
   rSZPku28z8MwfCorBvM8UWrFO9QzQWqU96+DWHy8Nd8Arn1KsazQaSK66
   A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616618"
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
  bh=oGiyXaJNmANxjg8Vq0a8jTPt9MvSMy2CNwFRW9y3uL0=;
  b=e6Helcs0DnyPeB9+z9ui/6kuNvZBfXPv0S4dj94k7wMxN9+EvI7riSwZ
   O3WuLRoJb531XKL/bMbPi//MWlfVWqKRaQPD6GFBMMmOGiVedgmguAEm7
   +PxiktEoUKkdd+t6bDkyPuRPRJXyUbCuwzbr/ERA/xEsiJCaxSHa+z/vO
   BkaeTIvA+bfe6lBJM+9XeB3SeSv1huYYgRTz7Ozu7tNFB5W3KkTwI74b5
   FyXZfHJk7yarO7FWn+MSjYi/98N7ep3Wb4T48ViWuhx4/DiMnElhgO9KC
   exFZ65V/7invCg6dkep6S3jTc9S7+mV4ZH37lvb6THjxAoNG5jaFaM8WR
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616616"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:17 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 79AE9280056;
        Tue, 24 Jan 2023 12:02:17 +0100 (CET)
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
Subject: [PATCH v3 04/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS TM070JVHG33 overlay
Date:   Tue, 24 Jan 2023 12:02:07 +0100
Message-Id: <20230124110213.3221264-5-alexander.stein@ew.tq-group.com>
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

 arch/arm/boot/dts/Makefile                    |  5 ++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 56 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 758b6f2f14e7d..626f7172c74e9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -805,6 +805,11 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tqmls1021a-mbls1021a.dtb \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
+
+ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
+
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
+
 dtb-$(CONFIG_SOC_VF610) += \
 	vf500-colibri-eval-v3.dtb \
 	vf610-bk4.dtb \
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..252ef982dd862
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
@@ -0,0 +1,56 @@
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
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+
+		dcu_out: endpoint {
+			remote-endpoint = <&lvds_encoder_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&lvds_encoder_out>;
+		};
+	};
+};
+
+&lvds_encoder {
+	status = "okay";
+
+	ports {
+		port@0 {
+			lvds_encoder_in: endpoint {
+				remote-endpoint = <&dcu_out>;
+			};
+		};
+
+		port@1 {
+			lvds_encoder_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.34.1

