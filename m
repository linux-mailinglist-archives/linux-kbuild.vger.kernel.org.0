Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8BEB34FAC
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 20:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfFDSPO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 14:15:14 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:59891 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfFDSPN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 14:15:13 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x54IEtCn015344;
        Wed, 5 Jun 2019 03:14:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x54IEtCn015344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559672096;
        bh=UkjpE05YGdVjDouZz82H3d7NOQIDOOjgrISZmqsAXKQ=;
        h=From:To:Cc:Subject:Date:From;
        b=EUkmuaDmj5Paeqh1k+GL2JdRBZweEH1wGkdujdATHV4befwQOUAV4zDDgF2ZF2hKr
         JcLjUn2w0ySOs+eLl4KfrvEfGz170z1b+tCFia1gJfki2tPtQu49Zg5cn/SJ5joWe7
         3wimEJzrZ+mwCJaIxSy/wtky2biVUJyK03ThO4gG7l0jwMN1B3XZrJzn/Jip5xEjSV
         SQkmTHAOXVz8r0nGBz6BlCqoOZIq6JeFhuFaANqButIbWEcJD5b56jrinoXP0y2p1/
         iIo3tL3hWumkAdBS1+dYMpjcQ9I+5sH27ydZZWQZF2UiNSGWXEW4OJlHCWJy1GkUyC
         9vMmfyg1UvV1Q==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: run olddefconfig instead of oldconfig after merging fragments
Date:   Wed,  5 Jun 2019 03:14:53 +0900
Message-Id: <20190604181453.30422-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make olddefconfig' is non-interactive, so we can drop 'yes'.
The behavior is equivalent.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ab30fe724c43..7656e1137b6b 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -94,7 +94,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 %.config: $(obj)/conf
 	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
-	+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
+	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 PHONY += kvmconfig
 kvmconfig: kvm_guest.config
-- 
2.17.1

