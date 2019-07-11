Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B49B06519B
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfGKFpy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:45:54 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59468 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfGKFpx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:53 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8U031345;
        Thu, 11 Jul 2019 14:44:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8U031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823899;
        bh=Ns+sXHJZbzo/hYCT2LP+L4TcrC5zi8mC7e+kBaXavh4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dl2hS4bC47jOuAJKxFYhxgx3/mkDJGp+FB6ejQdwkgRoovkUEhE77ghFexiCV2vT5
         vBqiBj5ksQJ3d5oP8rj84I3y6UD90fpM+LXgCjiaHzzQ/cVpbULJdtRZ0rS4u9alla
         Ss/kfRge6YJqs/ZHn2xR+FCDGxcotVTP4Ctu8lHLKgEG8XIZmZEr/hvg+pP078mSiY
         Ecbpm6nCsIxKRRxzvQ1ZwBMoelhFBzyXAR+fxKxECBAl1roq8sYso2vcJoE3Khngvh
         CMgCTAMLzMmw8VXUcPgApuV/V7kUFCU6/L/zQHFPpIEZB495HVHumyXjkRTbgYRgyh
         O6NDviHp/qF6g==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] kbuild: remove 'prepare1' target
Date:   Thu, 11 Jul 2019 14:44:33 +0900
Message-Id: <20190711054434.1177-11-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that there is no rule for 'prepare1', it can go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 4243b6daffcf..8de893e41149 100644
--- a/Makefile
+++ b/Makefile
@@ -1093,7 +1093,7 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare1 prepare3
+PHONY += prepare archprepare prepare3
 
 # prepare3 is used to check if we are building in a separate output directory,
 # and if so do:
@@ -1110,10 +1110,8 @@ ifneq ($(srctree),.)
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

