Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20646350169
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235883AbhCaNiz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:38:55 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38964 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235864AbhCaNid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:38:33 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFea003995;
        Wed, 31 Mar 2021 22:38:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFea003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197896;
        bh=a7ITAPZiNOwb3mrWNfDLksGvppaUK2nb1flnwHlLEWU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jh6M9nY6XuQJv8wr1mNt7MjmpH02BrYt8x2wZmB/th/fz7levArdfkOS+MEHPa97q
         h73x8ysabgT2TDynWMjEcfN30FxYYplmhXx10xLMaJjwxOEsEow9Etf6J6An4t7+WF
         ZpvzFc55zrxTo2hgUMJfCq5laVBGMdpeTi8LAOO3RMCWkRq/pxtlKMcMjKvkrQFumN
         g4IWjkBpOMG80e2D6wVZ5nwwmFuxsCirwZIbL9Fh4P6XZxhk2g7zXA2w3eu4EXT5Y2
         Vnz7SZ3tydDAwVbPsctt+fve8WCYQEWbR+iUFb7qj+tvAJOVsQxJUv58TtpAOVHfui
         rOcv66+32heQg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 3/9] kbuild: show the target directory for depmod log
Date:   Wed, 31 Mar 2021 22:38:04 +0900
Message-Id: <20210331133811.3221540-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is clearer to show the directory which depmod will work on.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 99a2bd51c02d..a6f73335757d 100644
--- a/Makefile
+++ b/Makefile
@@ -1778,7 +1778,7 @@ ifdef CONFIG_MODULES
 modules: $(MODORDER)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
-quiet_cmd_depmod = DEPMOD  $(KERNELRELEASE)
+quiet_cmd_depmod = DEPMOD  $(MODLIB)
       cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
                    $(KERNELRELEASE)
 
-- 
2.27.0

