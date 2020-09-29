Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0FB27D921
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 22:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgI2UmN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 16:42:13 -0400
Received: from services.gouders.net ([141.101.32.176]:39666 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbgI2UmM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 16:42:12 -0400
X-Greylist: delayed 2082 seconds by postgrey-1.27 at vger.kernel.org; Tue, 29 Sep 2020 16:42:11 EDT
Received: from localhost (ltea-047-066-024-155.pools.arcor-ip.net [47.66.24.155])
        (authenticated bits=0)
        by services.gouders.net (8.14.8/8.14.8) with ESMTP id 08TK56Lj013849
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Sep 2020 22:05:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
        t=1601409906; bh=TprX+n1QBRqLlrxv922nLwYrqOO6Zfd16P1PDgRhyuo=;
        h=From:To:Cc:Subject:Date;
        b=g1AdLApNW3WPfloHCsRewA8GREKk6LRFSabbhTuKkXH1OggMzQGkxx1lJa/nR8nI9
         ZkHWQP/YMR5d89VwxfdKf8Mklt7R6dqC5FuelYqYdbfB159OvHgsxbv0eI7AypWyaN
         jFhz4K9YX73exCexMRQtrmKSjwlHLgzQgISY40ok=
From:   Dirk Gouders <dirk@gouders.net>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ./Makefile: consider PAGER for `make help'
Message-ID: <gh3630mk2o.fsf@gouders.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date:   Tue, 29 Sep 2020 22:05:01 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

`make help' outputs more than a screenfull of lines.

In case a user has PAGER defined in his environment, she most likely
wants it to be used in such situations.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 992d24467ca0..ce1b7e83a4c8 100644
--- a/Makefile
+++ b/Makefile
@@ -1531,7 +1531,14 @@ board-dirs := $(dir $(wildcard $(srctree)/arch/$(SRCARCH)/configs/*/*_defconfig)
 board-dirs := $(sort $(notdir $(board-dirs:/=)))
 
 PHONY += help
+ifdef PAGER
+PHONY += _help
 help:
+	$(Q)$(MAKE) _help | $(PAGER)
+_help:
+else
+help:
+endif
 	@echo  'Cleaning targets:'
 	@echo  '  clean		  - Remove most generated files but keep the config and'
 	@echo  '                    enough build support to build external modules'
