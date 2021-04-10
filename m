Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9FF35B02D
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 21:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbhDJTqG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 15:46:06 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41079 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbhDJTqF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 15:46:05 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13AJjaXW021927;
        Sun, 11 Apr 2021 04:45:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13AJjaXW021927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618083937;
        bh=yOtxP+xbdkBMa/6+0d1xC/vh2sycPQAjsh8vJtZmpUc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jDfTUgPQO43S80hF3v3hCEeJ/2pkpZEnbWNWtwb/lmuABRXEDceoRW8CeoxjSHVbm
         lAIOmP8Ih4Li/sxig36WTkYQaCY8hq/iugnSkA6M5tXo+grIcusjMiR0oM/F+A5fs7
         FR4gjy/pZuq7eEgThW4JMzpDwgBS0CuKe5/XCewndfl6qgnQM76gb30dviBd4r29BC
         YBC6LkUmV7c1mODohc/CSj5O3/SgGSgvocvU2md2ubJ8ddgamLJ3gUw98hCPpGeJE5
         nuLeHia1RR/1yJ1AUvP9fY49uC4saXt8uGhcmpsSBoXK7kUwzkbmHR14aG7E1g6dCW
         WcetvhpbO+zaA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] kconfig: nconf: fix NORMAL attributes
Date:   Sun, 11 Apr 2021 04:45:31 +0900
Message-Id: <20210410194534.187588-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210410194534.187588-1-masahiroy@kernel.org>
References: <20210410194534.187588-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The lower 8-bit of attributes should be 0, but this code wrongly
sets it to NORMAL (=1). The correct one is A_NORMAL.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/nconf.gui.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 77f525a8617c..a914f81092d7 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -70,7 +70,7 @@ static void normal_color_theme(void)
 	/* automatically add color... */
 #define mkattr(name, attr) do { \
 attributes[name] = attr | COLOR_PAIR(name); } while (0)
-	mkattr(NORMAL, NORMAL);
+	mkattr(NORMAL, A_NORMAL);
 	mkattr(MAIN_HEADING, A_BOLD | A_UNDERLINE);
 
 	mkattr(MAIN_MENU_FORE, A_REVERSE);
@@ -102,7 +102,7 @@ static void no_colors_theme(void)
 	/* automatically add highlight, no color */
 #define mkattrn(name, attr) { attributes[name] = attr; }
 
-	mkattrn(NORMAL, NORMAL);
+	mkattrn(NORMAL, A_NORMAL);
 	mkattrn(MAIN_HEADING, A_BOLD | A_UNDERLINE);
 
 	mkattrn(MAIN_MENU_FORE, A_STANDOUT);
-- 
2.27.0

