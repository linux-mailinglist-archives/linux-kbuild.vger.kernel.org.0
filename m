Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C78B67960B
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 12:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbjAXLC5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 06:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233810AbjAXLCZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 06:02:25 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB86B17153;
        Tue, 24 Jan 2023 03:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558142; x=1706094142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3O/hcxsf8awVeb5swPJncgu6itPwN+2RWGdGMMGB5rY=;
  b=Kk75FdMQfx4vwmMdbe7mF4R5OxUofB2gEWxn/oFSvznJ75lZZONJUmee
   GYQJIcCmtt8CCxSk43sbaGQwOJZ/TPTzMoNaXryJq+JLlpwxBDc1MMP25
   87liSaC3qGu7nVB1Zb5auY3kE/wM4PIQztI2PoWD5XCcdXPK5SolykhCV
   CH/sn8nb27vr2XyZ4pn5q/kSA5FAfiQE6fynmMOiHMMY4NkrCCySOQqXL
   NmrD9Ln1N0oXv592rj6jDkB0mIO7FTN4chJdP/ud+wIiYoE4KdsCsojXV
   1ajb+jjVsKBttMeXyfEL2qY7MhML7ulmp9Cfdu+f4EBgsWUohp5qPyBuP
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616614"
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
  bh=3O/hcxsf8awVeb5swPJncgu6itPwN+2RWGdGMMGB5rY=;
  b=ZjP66V4mx5r2NY7vShHKtjjSSmVYcKH3yIIPjJf9/SN9odY2npYXyBCY
   Jf62ru45YJsuu+kxWrPiIneYpD4TNr/Ey3Z+mKs22N6qdpEzig83FNsZ/
   dMeSwCKNdlnTJa/M06NlWb2NMn/ZwDNbIWzJ+ssvOY+FeHsNYWRfLqO/N
   OjSrhZ/l7SVFdQq5FXHtuj1OKPq5IdcXFPCjBB1nP+ZzdRx9Qr1YwPYPT
   B0miyl3rlwFtTdVsWFAQis9Xd2BAuNtGe72rRM1b9yCWtQ7d58USVLz5I
   FPiM/0U5c7yj3oxXtwGZdzXZLpVn/DG1DzJGy+lXyi/aVTZ3O0DqcKgJa
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616613"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:17 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2E3C4280073;
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
Subject: [PATCH v3 03/10] ARM: dts: ls1021a: add TQMLS1021A flash partition layout
Date:   Tue, 24 Jan 2023 12:02:06 +0100
Message-Id: <20230124110213.3221264-4-alexander.stein@ew.tq-group.com>
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

The bootloader does not add the partitions into DT, so add them manually
here.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

Changes in v2:
* None

 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
index 24ad4a76fe597..ea6734253ba88 100644
--- a/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
@@ -77,5 +77,36 @@ qflash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			uboot@0 {
+				label = "U-Boot-PBL";
+				reg = <0x0 0xe0000>;
+			};
+
+			env@e0000 {
+				label = "U-Boot Environment";
+				reg = <0xe0000 0x10000>;
+			};
+
+			dtb@f0000 {
+				label = "DTB";
+				reg = <0xf0000 0x10000>;
+			};
+
+			linux@100000 {
+				label = "Linux";
+				reg = <0x100000 0x700000>;
+			};
+
+			rootfs@800000 {
+				label = "RootFS";
+				reg = <0x800000 0x3800000>;
+			};
+		};
 	};
 };
-- 
2.34.1

