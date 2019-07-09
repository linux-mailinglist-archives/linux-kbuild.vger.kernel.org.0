Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39A1162F82
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfGIEZl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:25:41 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42170 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbfGIEZl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:41 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVt009969;
        Tue, 9 Jul 2019 13:25:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVt009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646301;
        bh=Ni4y2oebNHOHQ5sXkMzZTKtYKdCesevpzK3HSQMxIEc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cmv6j/7fPBFB7YD9rBBeFwZRTZeF/9VDKux1wUFNDuzsd83v8LKHMuAxhZAtTIEjB
         O+rpw8gF7flTZ5Ov7UaQhAnAgt4TxFQPeTJ3IiMC1wg8Tg3B0x0MYwMHuZPd2sZAil
         i38VnjIH1AHpLxr8MYWLwEYy1RFApWLiVNg/QY8BBuBWSk0Dww7IVZTS0IH1dk25HX
         ZgDcb2awzx7zDZE+DfEvOMNCThSrFrwMo/eAhEZGEMv/lQIG0r7nLSx/43jcTDN5A0
         2xJ3KFo0yqyVNmqmsODr54vinDz7VOVHdz+Wxm0Qf65j71iMlDVkt9iC8ydAt0HBzn
         RLxFJagwtdWxQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] kbuild: remove 'prepare1' target
Date:   Tue,  9 Jul 2019 13:24:14 +0900
Message-Id: <20190709042416.27554-11-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that there is no rule for 'prepare1', it can go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 958fafa605b9..b284863e7ea0 100644
--- a/Makefile
+++ b/Makefile
@@ -1094,7 +1094,7 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare1 prepare3
+PHONY += prepare archprepare prepare3
 
 # prepare3 is used to check if we are building in a separate output directory,
 # and if so do:
@@ -1111,10 +1111,8 @@ ifneq ($(srctree),.)
 	fi;
 endif
 
-prepare1: prepare3 outputmakefile asm-generic $(version_h) $(autoksyms_h) \
-						include/generated/utsrelease.h
-
-archprepare: archheaders archscripts prepare1 scripts
+archprepare: archheaders archscripts scripts prepare3 outputmakefile \
+	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 
 prepare0: archprepare
 	$(Q)$(MAKE) $(build)=scripts/mod
-- 
2.17.1

