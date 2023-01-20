Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA7F6755D9
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jan 2023 14:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjATNfH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Jan 2023 08:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjATNfG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jan 2023 08:35:06 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9DBAED88;
        Fri, 20 Jan 2023 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221705; x=1705757705;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m1YkW/D/aj3GzfQPMLoPMshLV3DxdOqxzw3Aa3dO5+I=;
  b=c+S9uXtuQkqKAKzkh7E3Ou3JY96kmqPF6ShrzcmTh2pBkTukxiR/IDIu
   0h5u36cAfoUt9DKAWdR8ABIAvutoW3eNIw4ADPrSW0JvnpFrff/sEadFp
   wTgLN1aPR9oeoFdrQYvsMWwGgAWPr4hSiL/p+4l3agRFnstTEUOaTMOM1
   Xfiw4AXoWH3ODT/6JLdeFtL7HVAEwgCudLBhgzsMXc8aqmkuBEBdWC2bF
   XBLPVV8v0k327i5E3nvaDJImBLWXP0DviMppgCQVSCUdvjSmz4FA3A8Re
   WXFTE/Tp5yfmcCAhL1KAAHonWon0p2wZD7fg5Ec9zB8PplIMfxl+GpPmD
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561570"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:02 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:02 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221702; x=1705757702;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m1YkW/D/aj3GzfQPMLoPMshLV3DxdOqxzw3Aa3dO5+I=;
  b=OWUkDRRIIHMQnr9dT5WrGSvGaP3GHoUsBSLH9MJ/+pBhTHOSx7QL2gA/
   R+eAqHY7or8ZJu+N9GiXZy8yVY8c9YX5MakwPhiKZh3RRX3vPT75LKWFC
   upGxtQ0LJn3Z5VDYrz/82HkHVc50GzjQhlG6aZxMt0Jq8JgjGhdng6x1M
   KoSEQqd5I80ybDJS8CrTEqmAki15OZhlB7czgUsb4QQW0vjzKO9wELFJT
   Yz9rM5TZGrJ5J103wHVbewCRnY9iRf04niKsXDYcle5v6ueLQ2Ji74TcH
   iM4ZmZWZxhFA/+kqvwFQGMQVPE2+El0sXwcQVstPV9A1VWOG0MX3XXLzW
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561567"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:02 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 32FD4280056;
        Fri, 20 Jan 2023 14:35:02 +0100 (CET)
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
Subject: [PATCH v2 00/10] TQMLS1021A support
Date:   Fri, 20 Jan 2023 14:34:45 +0100
Message-Id: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

this is the second round of this series to add support for the TQMLS1021A
using the MBLS1021A mainboard.
The changelog is included in the individual patches but the most notable
one is picking up the old patch series for adding lpae config snippet
support.

Best regards,
Alexander

Alexander Stein (7):
  ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
  ARM: dts: ls1021a: add TQMLS1021A flash partition layout
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS TM070JVHG33 overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH DC44 overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH FC21 overlay
  ARM: multi_v7_defconfig: Add options to support TQMLS102xA series

Matthias Schiffer (1):
  dt-bindings: arm: fsl: add TQ-Systems LS1021A board

Nicolas Saenz Julienne (2):
  kbuild: Add config fragment merge functionality
  ARM: add multi_v7_lpae_defconfig

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 arch/arm/Makefile                             |   4 +
 arch/arm/boot/dts/Makefile                    |  12 +
 ...1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts |  55 +++
 ...1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts |  55 +++
 .../ls1021a-tqmls1021a-mbls1021a-hdmi.dtso    |  36 ++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso |  56 +++
 .../boot/dts/ls1021a-tqmls1021a-mbls1021a.dts | 406 ++++++++++++++++++
 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi     | 112 +++++
 arch/arm/configs/lpae.config                  |   1 +
 arch/arm/configs/multi_v7_defconfig           |  13 +
 arch/powerpc/Makefile                         |  12 +-
 scripts/Makefile.defconf                      |  15 +
 13 files changed, 776 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
 create mode 100644 arch/arm/configs/lpae.config
 create mode 100644 scripts/Makefile.defconf

-- 
2.34.1

