Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE7FE2B7B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 May 2019 16:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfE0OjU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 May 2019 10:39:20 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:43269 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbfE0OjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 10:39:19 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x4REc8hq015915;
        Mon, 27 May 2019 23:38:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x4REc8hq015915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558967892;
        bh=6bglQw1o0+227H4JjdFxK5L+4gQ5kdmgdzv31/MURZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2sJXweNIRR4f+KtxL9FuNZntt+7ccU2SYjSqdqCWNjiJ/CR18XNsC/u/6N68rxHxc
         K2jblZO8e7Je5mD7l0TmxOjxw/wIu1T36uHB1M7KYo7nx9+v4aWMAn9/zI2Lv46HR0
         09ciS8LqbnKZQD6uvb8X40Wu/wNUAjPKcXqjIn6Kwg/Fi3p5yrxZnvZRkY14WQClXA
         J1nhXY1BxTiraxxYY/bIm1hR1/kBHxXMG6u5DFXJV2ujZRjBFQuQ6D5zZtMPf7qAro
         dR1OJt6q3eXF7ztQKVgYrTVnmZSTlUtMRwHip5z6442nGXIscIgG/nGmL3QUWNtYzT
         bDfUWDDJKX25Q==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>,
        Paul Burton <paul.burton@mips.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 5/5] unicore32: rename unicore32_defconfig to defconfig
Date:   Mon, 27 May 2019 23:37:25 +0900
Message-Id: <20190527143725.12542-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527143725.12542-1-yamada.masahiro@socionext.com>
References: <20190527143725.12542-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since the initial support of unicore32, it has always had a single
defconfig. Rename it to 'defconfig', which is now the standard name
when arch has just a single defconfig file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/unicore32/Makefile                                   | 3 +--
 arch/unicore32/configs/{unicore32_defconfig => defconfig} | 0
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename arch/unicore32/configs/{unicore32_defconfig => defconfig} (100%)

diff --git a/arch/unicore32/Makefile b/arch/unicore32/Makefile
index 98a5ca43ae87..390819947c37 100644
--- a/arch/unicore32/Makefile
+++ b/arch/unicore32/Makefile
@@ -41,8 +41,7 @@ libs-y			+= arch/unicore32/lib/
 
 boot			:= arch/unicore32/boot
 
-# Default defconfig and target when executing plain make
-KBUILD_DEFCONFIG	:= $(ARCH)_defconfig
+# Default target when executing plain make
 KBUILD_IMAGE		:= $(boot)/zImage
 
 all:	zImage
diff --git a/arch/unicore32/configs/unicore32_defconfig b/arch/unicore32/configs/defconfig
similarity index 100%
rename from arch/unicore32/configs/unicore32_defconfig
rename to arch/unicore32/configs/defconfig
-- 
2.17.1

