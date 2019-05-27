Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF932B7B0
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 May 2019 16:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfE0OiN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 May 2019 10:38:13 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:41822 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfE0OiN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 10:38:13 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x4REc8hm015915;
        Mon, 27 May 2019 23:38:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x4REc8hm015915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558967888;
        bh=siBtBPA2ikbJePyRuVksa8fbeB8c7TRUnog6oqyvTUk=;
        h=From:To:Cc:Subject:Date:From;
        b=LgGId6hC386B3nnyyD6agXYnQ8QvaSLtSOiToLsm96nRrtFstP2tFADwPp9ZBATHV
         9EG2tQ9SvgTVwE6+fxGapNk2VQUb1hc0oKsboG5zOiyEk5sypMsVPBdOZGK1GZYSjL
         vRFMIdC2jEu/06326/n0G6PPE956Zy+TaCqG1dm4NZ5zjR+nWtaspab0nNRSpzkX59
         V6pUqHi7dv339oSdsJ1vgpwIyXrZJCRykIG73b9tLN5AuAgUOKn70+lQm8Qwp1ireI
         n7MiH+D8GqElKLCca0j6J02aEVbCu49/4iwydOjq4TEJqdHC6m7myeVPEIYHenmf5Z
         7WHOFw4dy0jVg==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] kconfig: remove always false ifeq ($(KBUILD_DEFCONFIG,) conditional
Date:   Mon, 27 May 2019 23:37:21 +0900
Message-Id: <20190527143725.12542-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With the following two commits applied, all the arch Makefiles
define KBUILD_DEFCONFIG.

- Commit f3e20ad67b4c ("s390: move arch/s390/defconfig to
  arch/s390/configs/defconfig")

- Commit 986a13769c4b ("alpha: move arch/alpha/defconfig to
  arch/alpha/configs/defconfig")

The first conditional in the defconfig rule is always false.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 3f327e21f60e..059642bd6584 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -74,9 +74,7 @@ savedefconfig: $(obj)/conf
 	$< $(silent) --$@=defconfig $(Kconfig)
 
 defconfig: $(obj)/conf
-ifeq ($(KBUILD_DEFCONFIG),)
-	$< $(silent) --defconfig $(Kconfig)
-else ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
+ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
 	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 else
-- 
2.17.1

