Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1CCF1CD080
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2020 05:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbgEKDub (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 May 2020 23:50:31 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:43402 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbgEKDub (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 23:50:31 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04B3oFtr022396;
        Mon, 11 May 2020 12:50:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04B3oFtr022396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589169016;
        bh=ynltv6m6rrglNcqnS2A++z6WnYqXoMB6E93POpjic5s=;
        h=From:To:Cc:Subject:Date:From;
        b=KGezrf8qzm08ZMBV96NesQomBm/dI8jB2tJ/KaEdUhYxKpf6wsx+LsQPWBLyTvlHu
         5C0qq95D3HZEu1GaPJ0Vj5czUnUkdXVIOlD8SpNoN1i2Jube2yDTz9Do8ZmDuAkqdc
         wU4d7ZZdNuBnC/z1+vtJpF4erAFIcfl9gAGh/1gNtAX02POU7l7pLmL1D4gU+ODiSc
         pTSem9yXxeGCeG16AaNaPRs8n2vYpCO8o2Qb9EwuU1Zue4AT8t7YANDH2GKMU/LxyC
         oLYwb06o1xPnrAd9wgwUWx6ycQs7nQPwvezlieRmHh7YB31LhaxmC9gdkQducbIzDC
         50GnOEI1teKFA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: add this-makefile as a shorthand for $(lastword $(MAKEFILE_LIST))
Date:   Mon, 11 May 2020 12:50:12 +0900
Message-Id: <20200511035013.1629672-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make it clearer, and self-documenting.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 119a08c90abb..1a4977ad7cd9 100644
--- a/Makefile
+++ b/Makefile
@@ -157,12 +157,14 @@ MAKEFLAGS += --include-dir=$(abs_srctree)
 need-sub-make := 1
 endif
 
+this-makefile := $(lastword $(MAKEFILE_LIST))
+
 ifneq ($(filter 3.%,$(MAKE_VERSION)),)
 # 'MAKEFLAGS += -rR' does not immediately become effective for GNU Make 3.x
 # We need to invoke sub-make to avoid implicit rules in the top Makefile.
 need-sub-make := 1
 # Cancel implicit rules for this Makefile.
-$(lastword $(MAKEFILE_LIST)): ;
+$(this-makefile): ;
 endif
 
 export abs_srctree abs_objtree
@@ -172,7 +174,7 @@ ifeq ($(need-sub-make),1)
 
 PHONY += $(MAKECMDGOALS) sub-make
 
-$(filter-out _all sub-make $(lastword $(MAKEFILE_LIST)), $(MAKECMDGOALS)) _all: sub-make
+$(filter-out _all sub-make $(this-makefile), $(MAKECMDGOALS)) _all: sub-make
 	@:
 
 # Invoke a second make in the output directory, passing relevant variables
-- 
2.25.1

