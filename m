Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0CDE71057
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2019 06:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbfGWELk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Jul 2019 00:11:40 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:41241 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfGWELk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jul 2019 00:11:40 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x6N4BSu3032209;
        Tue, 23 Jul 2019 13:11:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x6N4BSu3032209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563855089;
        bh=3+u4FXDZ3UkH/UUQynLowqWR3N2MZywkaH4WgsUBsbI=;
        h=From:To:Cc:Subject:Date:From;
        b=OW0O3Phg60HGiJcMcfKOl7Gb669EnyUE4xadbEYfTsTYVL080wgjIfhPej7u17Y+r
         m7xDlptVLKSutk5A1pWppZ5zJ3vkhm8Ed6sk8wowPX8mO4Kx9lUXUM27dMLPrL6edT
         1DkRwxPeKzNfwzw2iI8q4e7UEKh+amj7LJjzFu2tSmuByU4/k+VVKyX8HvTVUh8n7t
         uhv4ujTE5K1AK4HL5Lojc//scllXxiBRcT14tG0u8qMxXPhRq7nta/noPjmPXb1o5y
         ZWKvSwzR2OoAIQIYMVHokmN20CUdfM/wMDmNwZ98uAu2kQgdvTnEkmKU9ijwcvYhjJ
         6PETXZakbRjZg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove unused objectify macro
Date:   Tue, 23 Jul 2019 13:11:26 +0900
Message-Id: <20190723041126.19897-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 415008af3219 ("docs-rst: convert lsm from DocBook to ReST")
removed the last users of this macro.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 12666fc922ea..10ba926ae292 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -185,9 +185,6 @@ echo-cmd = $(if $($(quiet)cmd_$(1)),\
 # printing commands
 cmd = @set -e; $(echo-cmd) $(cmd_$(1))
 
-# Add $(obj)/ for paths that are not absolute
-objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
-
 ###
 # if_changed      - execute command if any prerequisite is newer than
 #                   target, or command line has changed
-- 
2.17.1

