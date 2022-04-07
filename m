Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03D54F7D7D
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Apr 2022 13:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiDGLIS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Apr 2022 07:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236456AbiDGLHi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Apr 2022 07:07:38 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400401A392
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Apr 2022 04:05:37 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9F68F83515;
        Thu,  7 Apr 2022 13:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1649329535;
        bh=8C7PAMjAVLXORQO89qd1AmpwvIjkU1CDrI8EKtR18xo=;
        h=From:To:Cc:Subject:Date:From;
        b=g7qtj5z9l4MXdyArXB5A3OXJ3cCZ9fkZPt8TJkpISitTL/v+Woj5PV5pWXhDfH5Zs
         vDoVThkcC2RGdklbgfIGM0qyzElo4plRYKijcoWCx/KNEtyhsXRE5Aj8Jl5kJ+yqjL
         RWFgoVqFk+Luh+ThU/EQC5QWBen/wChmCcHV2MToaMOjGL+NaLOxzHSfMxfPgTLN6O
         FeYmMPh8tplqUZkdqhe87VNN1qAz2QyiqBTGhfPP8R2i8VU63yt8W3aq+GGD00/wuy
         LWtiFL5a63qYwBdeMInNjxkNp/DDYMb8LM/SjJ9/uPtvPcq64h5jwcJ67eK0Ry53kp
         LPtBq56EmxRQA==
From:   Marek Vasut <marex@denx.de>
To:     linux-kbuild@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Masahiro Yamada <masahiroy@kernel.org>
Subject: [RFC][PATCH] kbuild: Generate symbols for DTO application in DTBs
Date:   Thu,  7 Apr 2022 13:05:22 +0200
Message-Id: <20220407110522.122393-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Emit symbols section in DTBs to permit symbol resolution when applying DTOs.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
---
NOTE: I am sending this as RFC, because I suspect there is a better way how
      to pass extra flags to DTC during kernel build ?
      Maybe from shell environment somehow ?
      Or maybe b7e70391a5451 ("arm64: tegra: Enable device-tree overlay support")
      is the way to go about this ?
---
 arch/arm/boot/dts/Makefile   | 3 +++
 arch/arm64/boot/dts/Makefile | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 252353fb4e3b3..2d50302d077dd 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+DTC_FLAGS += -@
+
 dtb-$(CONFIG_ARCH_ALPINE) += \
 	alpine-db.dtb
 dtb-$(CONFIG_MACH_ARTPEC6) += \
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 1ba04e31a4387..f7b3c86517a0e 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+DTC_FLAGS += -@
+
 subdir-y += actions
 subdir-y += allwinner
 subdir-y += altera
-- 
2.35.1

