Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB78F88C06
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfHJPyq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:54:46 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:34527 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfHJPyo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:44 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7AFrG8x009713;
        Sun, 11 Aug 2019 00:53:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7AFrG8x009713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565452401;
        bh=l1ycP8oGkQD/aCe4zNqlB/biCW5yxV6/RDGMWKdUx8M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cpOqqVK4Hq+425fN3Q07m/br7bt9+bAgD4HL+2spwQAKxOu5IZPc4I295meOH5vky
         G7Ew8aK4DiJmLMw6/PPUDkNdD8NdCgQqi3vjQhZfF2qb1VwofRC7uDUYRFHPgq7T/S
         0Bn1SkabQ3EaqUqDy8WusfrmaJIVNmRbU+kFM+ffpY3yztYW/n0gG35JkBAg2Q0CKR
         nSZNxdJ17QWmjSEs5YYbyGMhflZtmlQCItqEJ7ZrsoS5LoqEMn7uidgst9Vo94bziH
         ivcVJsA394d3TlNRClwQ6Mef234qwG9mWlQ98SLPIl0RQhZuRUX5+2K+5KGmh/tknk
         8JdL6zSEyhRSg==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] kbuild: remove 'make /' support
Date:   Sun, 11 Aug 2019 00:53:00 +0900
Message-Id: <20190810155307.29322-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make /' is just an alias for 'make ./'; this builds all objects of an
external module, but skips the modpost stage.

I am not a big fan of 'make /' since it looks as if it were touching
the root directory of the system. I like 'make ./' better.

I do not know how many people are using it, but let's show a hint if
it is used. Also, move it close to the external module rules since
this only makes sense for external modules.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 24c9ed272b5f..86afce391582 100644
--- a/Makefile
+++ b/Makefile
@@ -1648,6 +1648,10 @@ $(clean-dirs):
 
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
 
+PHONY += /
+/:
+	@echo >&2 '"$(MAKE) /" is no longer supported. Please use "$(MAKE) ./" instead.'
+
 PHONY += help
 help:
 	@echo  '  Building external modules.'
@@ -1783,11 +1787,6 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target:.ko=.mod)
 	$(Q)echo $(build-target) > $(MODORDER)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-
-# Modules
-PHONY += /
-/: ./
-
 %/: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir) need-modorder=1
 
-- 
2.17.1

