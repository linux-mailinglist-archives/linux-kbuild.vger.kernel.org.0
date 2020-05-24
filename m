Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1114A1DFFFC
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgEXPn2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:43:28 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19691 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUs017561;
        Mon, 25 May 2020 00:42:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUs017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334963;
        bh=2i0oB1lRvNAyuaOZEymlGqm+mH33LQP16aGL75EsgEU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P/OqifHSQRAAXPxFDd3sqBv8MksqEtPJ/UKQ5fUd+nha9AhuSR/am0g1OmKhBgcGO
         pO4lLzJjDFsDzMMBXDovn7UUUDkyuIVqa8eAwedMWs2VxH99Ar6Vim8IvOGhW91brf
         Nqanszpkb76vuVqst4/FqkVKJ2uv0lMeSahuxCuNoYQQxvvAlrNTCRpB/3ubFGN41V
         ydrKeOhqh5WRqZj1iRmFpwNjiKoovLzEeUf5iVaWk3V0nx2lwOkC5hCM4bc7Pk0WWZ
         SuSBG5S7lWZVj1qYBr8VKCgAM0G+ciCKmeq6wstKRJ2oMprf2BaDrGZZuEixPvgMaN
         C2sEnaFqILZTw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
Date:   Mon, 25 May 2020 00:42:15 +0900
Message-Id: <20200524154235.380482-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

$(firstword ...) in scripts/Makefile.modpost was added by commit
3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
to build multiple external module directories.

It was a solution to resolve symbol dependencies when an external
module depends on another external module.

Commit 0d96fb20b7ed ("kbuild: Add new Kbuild variable
KBUILD_EXTRA_SYMBOLS") introduced another solution by passing symbol
info via KBUILD_EXTRA_SYMBOLS, then broke the multi-word M= support.

  include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
               $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)

... does not work if KBUILD_EXTMOD contains multiple words.

This feature has been broken for more than a decade. Remove the
bitrotten code, and stop parsing if M or KBUILD_EXTMOD contains
multiple words.

As Documentation/kbuild/modules.rst explains, if your module depends
on another one, there are two solutions:
  - add a common top-level Kbuild file
  - use KBUILD_EXTRA_SYMBOLS

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Add more commit log

 Makefile                 | 3 +++
 scripts/Makefile.modpost | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 72eb55a36545..48a2dfaf3bf3 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,9 @@ ifeq ("$(origin M)", "command line")
   KBUILD_EXTMOD := $(M)
 endif
 
+$(if $(word 2, $(KBUILD_EXTMOD)), \
+	$(error building multiple external modules is not supported))
+
 export KBUILD_CHECKSRC KBUILD_EXTMOD
 
 extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 957eed6a17a5..b79bf0e30d32 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -44,7 +44,7 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 
 kernelsymfile := $(objtree)/Module.symvers
-modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
+modulesymfile := $(KBUILD_EXTMOD)/Module.symvers
 
 MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
-- 
2.25.1

