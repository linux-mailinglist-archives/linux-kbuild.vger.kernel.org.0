Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B76321D103
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2020 09:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgGMH6S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jul 2020 03:58:18 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:30557 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgGMH6S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jul 2020 03:58:18 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 06D7uYDf027924;
        Mon, 13 Jul 2020 16:56:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 06D7uYDf027924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1594626994;
        bh=cXlkKx6N8NEBTpVkCbg0vvb9KuVX9FkcLVkdaw2RUnI=;
        h=From:To:Cc:Subject:Date:From;
        b=VxbmIPJHOtRVfhwgqKN6w6NJ8TXawOqUOTra0G1P/+X/zrUHkBDBAWuQodWCYtdp7
         SXSoEyOtVuaU/77su2m2eiQiNAJBgPHZv+JPW1werHuEJHjqbnNbGIwxr/qrYfJJ0K
         5c5DPpftzYdxU9Zqbg6udkSrNHvfCDm0MP7M3s65ilclRV8phPAmjRvISI8lA6ydCP
         czfYb1AIzxUGZ/sLcrmkymN3H5OXwFxIdt7Fj+7G4NK5Y+xTfHBdn4QwVihyf1BmGU
         XHcPPEBLRO5GcqZwX0D9ERw1oERgaRViXWVkeTZWJyQ7IW5CwN09MxU1bDdYv4FpBC
         uGE9TMfj1FaGQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Mackerras <paulus@samba.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/boot: add DTB to 'targets'
Date:   Mon, 13 Jul 2020 16:56:28 +0900
Message-Id: <20200713075629.5948-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

PowerPC always re-builds DTB even if nothing has been changed.

As for other architectures, arch/*/boot/dts/Makefile builds DTB by
using the dtb-y syntax.

In contrast, arch/powerpc/boot/dts/(fsl/)Makefile does nothing unless
CONFIG_OF_ALL_DTBS is defined. Instead, arch/powerpc/boot/Makefile
builds DTB on demand. You need to add DTB to 'targets' explicitly
so .*.cmd files are included.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

I want to apply this to kbuild tree because this is needed
to fix the build error caused by another kbuild patch:

https://lkml.org/lkml/2020/7/7/134


 arch/powerpc/boot/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 63d7456b9518..8792323707fd 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -366,6 +366,8 @@ initrd-y := $(patsubst zImage%, zImage.initrd%, \
 		$(patsubst treeImage%, treeImage.initrd%, $(image-y)))))
 initrd-y := $(filter-out $(image-y), $(initrd-y))
 targets	+= $(image-y) $(initrd-y)
+targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
+		$(patsubst $(x).%, dts/%.dtb, $(filter $(x).%, $(image-y))))
 
 $(addprefix $(obj)/, $(initrd-y)): $(obj)/ramdisk.image.gz
 
-- 
2.25.1

