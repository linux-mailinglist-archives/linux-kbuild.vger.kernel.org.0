Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F981B86BC
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Apr 2020 15:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgDYNSk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 Apr 2020 09:18:40 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:65507 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDYNSk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 09:18:40 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 03PDIDvH012736;
        Sat, 25 Apr 2020 22:18:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 03PDIDvH012736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587820694;
        bh=4wJMY/yVTi4OrEzrVB0KyV0x5odpNOOIs5tMD7YU73I=;
        h=From:To:Cc:Subject:Date:From;
        b=cju21PMn5X7EMslYU0iOp1Mg4VGuvlYQ2z0pBe8h0aykXIX/S88l/xFg9KckL3wU5
         tB70tBfguHZ6tey42fYn1k7ci3KB1VWhekA1TEXrM6wbKxYTevZl28C73KxYLdOsGp
         IhqhMc9CjBc0oTDdf83NQryOD9+tQLaiJR7Bo9gh8YTF5KdgvtanEQJ9CsjD7oWwQ1
         5ezT2Uq3HdoKymgfiBeULd0EibvN2QklxwgV8VdxZ9s+w1e7jA2IvW1MIm6s3fbfiQ
         KhTj78UBewyaAsxMS+w+yGiZ91PTYmgtA4MSlw4L/holz3UwrDdnkGbwInE52NRj6W
         UC7nepl5GfjEQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove '/' target
Date:   Sat, 25 Apr 2020 22:18:10 +0900
Message-Id: <20200425131810.991717-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This notice has been here for a while. Remove it entirely now.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 49b2709ff44e..95c2d8c2dfe8 100644
--- a/Makefile
+++ b/Makefile
@@ -1650,10 +1650,6 @@ _emodinst_post: _emodinst_
 clean-dirs := $(KBUILD_EXTMOD)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps
 
-PHONY += /
-/:
-	@echo >&2 '"$(MAKE) /" is no longer supported. Please use "$(MAKE) ./" instead.'
-
 PHONY += help
 help:
 	@echo  '  Building external modules.'
-- 
2.25.1

