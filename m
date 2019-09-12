Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6526BB098B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 09:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbfILHds (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Sep 2019 03:33:48 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:43160 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfILHdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 03:33:47 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x8C7Xbg9018895;
        Thu, 12 Sep 2019 16:33:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x8C7Xbg9018895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568273619;
        bh=G45NEfuMGe0ysBOraG5cU6KIy3gv/xwEFarEE/1Azn4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nYZi0y5Z0dJ+Wz9a0/lEP2LGcyWK4k8zCXSa3YBUTLoEOIcpXhE6OZnb1TEYGDMls
         I6797JLQDUDiBeaI/5C/SN+hxqQsPSjEtecK2LMwxz/ihNk0JVapSBsaCPxFlFXKuB
         AR+Eejw+0aUwu+hLPhEWQID67d1+E/d9wyQNCOigNR9unRDU22oniGucgR2+/g7mCF
         8qcyPKhdTFI40W+9c6aCAZUAv5aW33fgmDGxxRhaKD61BKtnoigWiEg94mISV4ivlY
         jS5fo5IvmFXvjBxx+pgJ/cz3msXVmjWnsAumeZRkgrVhYIwC6oPE+XnhYUEotAjYD1
         QH1pnP3A7kj+w==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kbuild: warn orphan obj-y objects
Date:   Thu, 12 Sep 2019 16:33:34 +0900
Message-Id: <20190912073336.7036-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912073336.7036-1-yamada.masahiro@socionext.com>
References: <20190912073336.7036-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

obj-y specifies objects linked into vmlinux, but they are actually
linked if and only if that sub-directory is visited by the chain of
obj-y. If you have an orphan obj-y object, it is a bug, but may not
easy to notice. This commit provides build-time warning.

I tested allmodconfig based on v5.3-rc4, and I saw one warning:

scripts/Makefile.build:57: 'sound/soc/sprd/sprd-mcdt.o' will not be linked to vmlinux even though obj-y is specified.

This is a proper warning. sound/soc/sprd/sprd-mcdt.o is compiled as
built-in since CONFIG_SND_SOC_SPRD_MCDT is boolean. However, CONFIG_SND
and CONFIG_SND_SOC are tristate, and set to m by allmodconfig.
So, Kbuild descends into sound/soc/, then sound/soc/sprd/ by obj-m.
sound/soc/sprd/sprd-mcdt.o is not linked to vmlinux.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build  | 6 ++++++
 scripts/link-vmlinux.sh | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 54fc68168686..d30b04707fec 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -52,6 +52,12 @@ ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
 
+ifeq ($(need-builtin),)
+ifneq ($(real-obj-y),)
+$(warning '$(real-obj-y)' will not be linked to vmlinux even though obj-y is specified.)
+endif
+endif
+
 ifeq ($(need-modorder),)
 ifneq ($(obj-m),)
 $(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 2438a9faf3f1..8961d999b86b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -216,7 +216,7 @@ else
 fi;
 
 # final build of init/
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
+${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
 
 #link vmlinux.o
 info LD vmlinux.o
-- 
2.17.1

