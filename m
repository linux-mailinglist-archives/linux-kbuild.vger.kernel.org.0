Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0202A7AD12
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 17:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbfG3P7O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 11:59:14 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:60069 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbfG3P7N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 11:59:13 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6UFx3RZ014915;
        Wed, 31 Jul 2019 00:59:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6UFx3RZ014915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564502344;
        bh=uiroaNh4rM6/ZQ/tf4rAH6ElNB+2ooit+Zk/cSJmCvU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vKOSn1C5rnpJBZOh6f5NCTL6evFD9dqrFRd2typ8BPWX34gSbSp3d5Nobzs3DLHNb
         PiyvmsEd0iSBgezaxtqQJklpi02KoVu0LUFiMJjESfZUkDou0PG0GseUssMTc9rMx+
         H2Ad8PZV/1WrNdpDoT07DQYRAzx6SsOUKU9WSOCLdM1b9OAkkzEwmY9l6168SpUHHQ
         MPc8k/qb8IS2zTwiG00lh4DWZjj2U2NpS+opfv3wiLuL1/FKZp3jM3/dfvec5t2P7D
         pE+FNuDz7ddo3Yw6xS2MFxqeJ2IE6jMhpHYhqd3Dx58DDWsUzZ63NxCeTunFg1Yhyw
         iF0V/i7/Ovf3Q==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/4] kbuild: modpost: handle KBUILD_EXTRA_SYMBOLS only for external modules
Date:   Wed, 31 Jul 2019 00:59:00 +0900
Message-Id: <20190730155902.5557-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155902.5557-1-yamada.masahiro@socionext.com>
References: <20190730155902.5557-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

KBUILD_EXTRA_SYMBOLS makes sense only when building external modules.
Moreover, the modpost sets 'external_module' if the -e option is given.

I replaced $(patsubst %, -e %,...) with simpler $(addprefix -e,...)
while I was here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index ad4b9829a456..c856512349cd 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -78,7 +78,7 @@ modpost = scripts/mod/modpost                    \
  $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a,)       \
  $(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)   \
  $(if $(KBUILD_EXTMOD),-I $(modulesymfile))      \
- $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(KBUILD_EXTRA_SYMBOLS))) \
+ $(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS))) \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
  $(if $(KBUILD_MODPOST_WARN),-w)
-- 
2.17.1

