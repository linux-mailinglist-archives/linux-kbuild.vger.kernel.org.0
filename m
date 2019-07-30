Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81E437AD11
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 17:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730337AbfG3P7O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 11:59:14 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:60070 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbfG3P7N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 11:59:13 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6UFx3Ra014915;
        Wed, 31 Jul 2019 00:59:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6UFx3Ra014915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564502345;
        bh=+WKRGvIah6n1cheWyt6d9fXDQQMt7RydACk7ei/74P4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J/mwep+hCpVwNoCzgllncZ02A7L96qj1nskRO3h4bPoVxK3gXgGyI0pQiLZLsnud9
         tOmvFm7HHyJQvyUDPLMTA9TyWPJQW8cbHVTN52dNSNe5ViYVjYVgCTVWLVE9qrIFjb
         /iD4UX3bIolA1tlz6Ur8bZyz0pgCFcP24E9idQ7XvAuHbb8B2tcPKz260hjtRWgT1p
         c3/FbtF9J6MP/r12JCbUCoNBt8hSiTeq4hswqo6of3sFs23/39QTaxj9kdKxd7dlUB
         NqE16egg6lD1WmBf8iQecNIWbWmEMo4SG3tEnqnUX+QsNYypCTRHPnc9oYQw8ys8ar
         o9T5VWE3YpRgA==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 3/4] kbuild: modpost: remove unnecessary dependency for __modpost
Date:   Wed, 31 Jul 2019 00:59:01 +0900
Message-Id: <20190730155902.5557-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155902.5557-1-yamada.masahiro@socionext.com>
References: <20190730155902.5557-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

__modpost is a phony target. The dependency on FORCE is pointless.
All the objects have been built in the previous stage, so the
dependency on the objects are not necessary either.

Count the number of modules in a more straightforward way.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index c856512349cd..fdab32d6f552 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -86,11 +86,11 @@ modpost = scripts/mod/modpost                    \
 MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
 
 # We can go over command line length here, so be careful.
-quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
+quiet_cmd_modpost = MODPOST $(words $(modules)) modules
       cmd_modpost = sed 's/ko$$/o/' $(modorder) | $(modpost) $(MODPOST_OPT) -s -T -
 
 PHONY += __modpost
-__modpost: $(modules:.ko=.o) FORCE
+__modpost:
 	$(call cmd,modpost) $(wildcard vmlinux)
 
 quiet_cmd_kernel-mod = MODPOST $@
-- 
2.17.1

