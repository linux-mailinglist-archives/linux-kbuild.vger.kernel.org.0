Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3FC68F08
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2019 16:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388720AbfGOOLY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jul 2019 10:11:24 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:62962 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388773AbfGOOLX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 10:11:23 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6FEB56R023840;
        Mon, 15 Jul 2019 23:11:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6FEB56R023840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563199866;
        bh=6ahhx3PJmA/BwoDm6PuFYIOPIG5ur1Y4DX5ZBBhGcl8=;
        h=From:To:Cc:Subject:Date:From;
        b=vGTwxi5yDwmMpe3N3VaawBXJoFH1huFqGXTg5YFvHNDG+Ppr5uqjyDbCGqyJHQQV/
         osB2EqOXty7jCfprPUe56VPxI6Z52oUV/zLZpR7b9VpwG2exNUvnmHVC4/tTvdUZKW
         LJ5+J9nj9FikYy3e+p0BPOGx1HC4S2j3hNMeZKaRggJUnqh69afYxxXebQVrKJw4wT
         i6HO21PRK2PsBrE7KWtZMD1qnsOO89Klam0LdU+7aHTDl/ltBIU0Fl+9cB1MtpZOJj
         rBNv9U/4Z8R8eBIgzLUQ42+usSGnHlq9dh6bTZ74VDN1konx7S/1t5A6jPOVNPvdRi
         J5XX5l0nPUSeA==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove unused hostcc-option
Date:   Mon, 15 Jul 2019 23:11:03 +0900
Message-Id: <20190715141103.22278-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We can re-add this whenever it is needed. At this moment, it is unused.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 73e80b917f12..77c742fa4fb1 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -125,11 +125,6 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 cc-option = $(call __cc-option, $(CC),\
 	$(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
 
-# hostcc-option
-# Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
-hostcc-option = $(call __cc-option, $(HOSTCC),\
-	$(KBUILD_HOSTCFLAGS) $(HOST_EXTRACFLAGS),$(1),$(2))
-
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
-- 
2.17.1

