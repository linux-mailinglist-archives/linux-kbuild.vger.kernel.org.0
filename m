Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23A637B745
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 09:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhELH70 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 03:59:26 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42592 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhELH7Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 03:59:25 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 14C7vbPw028192;
        Wed, 12 May 2021 16:57:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 14C7vbPw028192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620806264;
        bh=bChIpXSfR+kCBzLwyD4niwOhoAcgIJg4n39mkjxXwJw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SX+SA69zityA1bM1vTUJR/0j8WkzUNNRg3kwf/+jGkC/L5sbJ4U/5+mIny0Oj87/s
         c1qZSVHJXkRTyvlpgqUQ1vn9gER2nWtIIOKfVxshWAhS3yE/UxuiGX9dnzKNVLIm81
         dXxFn1FcNsuP4dW8QefujxB5m3Q6XBRmT49+2+d9dOnzaI9rMCAAUv2vgIvYo8hxjY
         g1fqmSZPiQIiSCCGindN9ZbTnDxya/LKR4VnrDjY/xzktUPSVRwNMssFXA3wneWzaj
         2nr+UXFag5cRSsSglZjbAtaetN1iQghajDNdzESrgVwCSHvV6uAw3g08F2epLJrez8
         38FR2E1b1NxqQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Subject: [PATCH 5/5] sh: move core-y in arch/sh/Makefile to arch/sh/Kbuild
Date:   Wed, 12 May 2021 16:57:29 +0900
Message-Id: <20210512075729.60291-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512075729.60291-1-masahiroy@kernel.org>
References: <20210512075729.60291-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use obj-y to clean up Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sh/Kbuild   | 3 +++
 arch/sh/Makefile | 5 -----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/sh/Kbuild b/arch/sh/Kbuild
index a4e40e534e6a..48c2a091a072 100644
--- a/arch/sh/Kbuild
+++ b/arch/sh/Kbuild
@@ -1 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-y				+= kernel/ mm/ boards/
+obj-$(CONFIG_SH_FPU_EMU)	+= math-emu/
+obj-$(CONFIG_USE_BUILTIN_DTB)	+= boot/dts/
diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 44bcb80e791a..88ddb6f1c75b 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -116,11 +116,6 @@ export ld-bfd
 
 head-y	:= arch/sh/kernel/head_32.o
 
-core-y				+= arch/sh/kernel/ arch/sh/mm/ arch/sh/boards/
-core-$(CONFIG_SH_FPU_EMU)	+= arch/sh/math-emu/
-
-core-$(CONFIG_USE_BUILTIN_DTB)	+= arch/sh/boot/dts/
-
 # Mach groups
 machdir-$(CONFIG_SOLUTION_ENGINE)		+= mach-se
 machdir-$(CONFIG_SH_HP6XX)			+= mach-hp6xx
-- 
2.27.0

