Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C469D87F8
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 07:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbfJPFRI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 01:17:08 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:16530 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbfJPFRI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 01:17:08 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x9G5FoQ4015921;
        Wed, 16 Oct 2019 14:15:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x9G5FoQ4015921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571202952;
        bh=QtgpQ/my2rTeLEaCijY9xyHVCu56r8/Xe5J3OP0ouag=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JN8HLDv6MMIPtYbJAW3nPi19uX8f0i4WrIiXmjuNROywzjsZkPG82oWq5MjXyzscO
         3tMNft3xUxDy4AI8xybNsSSR8fSYhaJdh0nEEE78PbnhucETCLe5+CLeCrWh116/h4
         QFgEc8JflOgn3ouaBEMWHcyGTDYZRrSybiQkSDavavyw5TojECZ3FSGVra8p+Y2J7w
         burxT3QWsh8axh8KZIb6bPRWC9HSuquNGc4WYUUlYyKThrBHJfzAfPnFZkWu6bbEXd
         PoiK8PX9w/cDMaT6b5Q4Mu7Hu+/5yxIb60+bn4XykG3+PmRc2P4nEO0kewA41hVqU8
         WQNxNgd7x/CHw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Julia Lawall <julia.lawall@lip6.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: make target builds much faster
Date:   Wed, 16 Oct 2019 14:15:47 +0900
Message-Id: <20191016051547.11399-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016051547.11399-1-yamada.masahiro@socionext.com>
References: <20191016051547.11399-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 394053f4a4b3 ("kbuild: make single targets work more
correctly"), building single targets is really slow.

Speed it up by not descending into unrelated directories.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index dcbb0124dac4..7eabbb66a65c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -479,7 +479,10 @@ curdir-single := $(sort $(foreach x, $(KBUILD_SINGLE_TARGETS), \
 unknown-single := $(filter-out $(addsuffix /%, $(subdir-ym)), \
 			$(filter-out $(curdir-single), $(KBUILD_SINGLE_TARGETS)))
 
-__build: $(curdir-single) $(subdir-ym)
+single-subdirs := $(foreach d, $(subdir-ym), \
+			$(if $(filter $(d)/%, $(KBUILD_SINGLE_TARGETS)), $(d)))
+
+__build: $(curdir-single) $(single-subdirs)
 ifneq ($(unknown-single),)
 	$(Q)$(MAKE) -f /dev/null $(unknown-single)
 endif
-- 
2.17.1

