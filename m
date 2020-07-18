Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF78F224944
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Jul 2020 08:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgGRGjO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 Jul 2020 02:39:14 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:60943 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgGRGjO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Jul 2020 02:39:14 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 06I6cod9015918;
        Sat, 18 Jul 2020 15:38:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 06I6cod9015918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595054331;
        bh=XE6IhH9B+MTAazbdPx+nUYPzcg3JfBLMiZA4IYkdxLE=;
        h=From:To:Cc:Subject:Date:From;
        b=ZyhUBpb7n26FFVNS1u8ymXCZapJ//JWl9qPSkizaFBISCvGu2wLriLdiz5nbCmf4k
         BI8FCI22qMvPC5+fyEnLtrWarwUOxhseg2u6z6LQEdCfSOp7USAalp1jeVko2+7dNn
         QRw5qVFfbPCX4oeEUfQaTLMluGulFeS4/zL1E7BWxfeaAJ7XNOcP9gWx1FKO6dJBFQ
         Ng63q+aSQwTa0VRF8jbzTLnWOO/hOkGPby2Bdp5cOj9+sHkJ1cJIuZ7gamHWXO1JSS
         cl4DCvcAWq8J6+EyYcazniNXDdqfKIiWBwTuhEY3avwllg80Bp2OiIaWIqnXQdUfKb
         XbQ1Dtim/cTbg==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: constify XPM data
Date:   Sat, 18 Jul 2020 15:38:47 +0900
Message-Id: <20200718063847.919599-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Constify arrays as well as strings.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/images.c | 30 +++++++++++++++---------------
 scripts/kconfig/images.h | 30 +++++++++++++++---------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/scripts/kconfig/images.c b/scripts/kconfig/images.c
index b4fa0e4a63a5..2f9afffa5d79 100644
--- a/scripts/kconfig/images.c
+++ b/scripts/kconfig/images.c
@@ -5,7 +5,7 @@
 
 #include "images.h"
 
-const char *xpm_load[] = {
+const char * const xpm_load[] = {
 "22 22 5 1",
 ". c None",
 "# c #000000",
@@ -35,7 +35,7 @@ const char *xpm_load[] = {
 "###############.......",
 "......................"};
 
-const char *xpm_save[] = {
+const char * const xpm_save[] = {
 "22 22 5 1",
 ". c None",
 "# c #000000",
@@ -65,7 +65,7 @@ const char *xpm_save[] = {
 "..##################..",
 "......................"};
 
-const char *xpm_back[] = {
+const char * const xpm_back[] = {
 "22 22 3 1",
 ". c None",
 "# c #000083",
@@ -93,7 +93,7 @@ const char *xpm_back[] = {
 "......................",
 "......................"};
 
-const char *xpm_tree_view[] = {
+const char * const xpm_tree_view[] = {
 "22 22 2 1",
 ". c None",
 "# c #000000",
@@ -120,7 +120,7 @@ const char *xpm_tree_view[] = {
 "......................",
 "......................"};
 
-const char *xpm_single_view[] = {
+const char * const xpm_single_view[] = {
 "22 22 2 1",
 ". c None",
 "# c #000000",
@@ -147,7 +147,7 @@ const char *xpm_single_view[] = {
 "......................",
 "......................"};
 
-const char *xpm_split_view[] = {
+const char * const xpm_split_view[] = {
 "22 22 2 1",
 ". c None",
 "# c #000000",
@@ -174,7 +174,7 @@ const char *xpm_split_view[] = {
 "......................",
 "......................"};
 
-const char *xpm_symbol_no[] = {
+const char * const xpm_symbol_no[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -191,7 +191,7 @@ const char *xpm_symbol_no[] = {
 " .......... ",
 "            "};
 
-const char *xpm_symbol_mod[] = {
+const char * const xpm_symbol_mod[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -208,7 +208,7 @@ const char *xpm_symbol_mod[] = {
 " .......... ",
 "            "};
 
-const char *xpm_symbol_yes[] = {
+const char * const xpm_symbol_yes[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -225,7 +225,7 @@ const char *xpm_symbol_yes[] = {
 " .......... ",
 "            "};
 
-const char *xpm_choice_no[] = {
+const char * const xpm_choice_no[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -242,7 +242,7 @@ const char *xpm_choice_no[] = {
 "    ....    ",
 "            "};
 
-const char *xpm_choice_yes[] = {
+const char * const xpm_choice_yes[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -259,7 +259,7 @@ const char *xpm_choice_yes[] = {
 "    ....    ",
 "            "};
 
-const char *xpm_menu[] = {
+const char * const xpm_menu[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -276,7 +276,7 @@ const char *xpm_menu[] = {
 " .......... ",
 "            "};
 
-const char *xpm_menu_inv[] = {
+const char * const xpm_menu_inv[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -293,7 +293,7 @@ const char *xpm_menu_inv[] = {
 " .......... ",
 "            "};
 
-const char *xpm_menuback[] = {
+const char * const xpm_menuback[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -310,7 +310,7 @@ const char *xpm_menuback[] = {
 " .......... ",
 "            "};
 
-const char *xpm_void[] = {
+const char * const xpm_void[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
diff --git a/scripts/kconfig/images.h b/scripts/kconfig/images.h
index d8ff614bd087..7212dec2006c 100644
--- a/scripts/kconfig/images.h
+++ b/scripts/kconfig/images.h
@@ -10,21 +10,21 @@
 extern "C" {
 #endif
 
-extern const char *xpm_load[];
-extern const char *xpm_save[];
-extern const char *xpm_back[];
-extern const char *xpm_tree_view[];
-extern const char *xpm_single_view[];
-extern const char *xpm_split_view[];
-extern const char *xpm_symbol_no[];
-extern const char *xpm_symbol_mod[];
-extern const char *xpm_symbol_yes[];
-extern const char *xpm_choice_no[];
-extern const char *xpm_choice_yes[];
-extern const char *xpm_menu[];
-extern const char *xpm_menu_inv[];
-extern const char *xpm_menuback[];
-extern const char *xpm_void[];
+extern const char * const xpm_load[];
+extern const char * const xpm_save[];
+extern const char * const xpm_back[];
+extern const char * const xpm_tree_view[];
+extern const char * const xpm_single_view[];
+extern const char * const xpm_split_view[];
+extern const char * const xpm_symbol_no[];
+extern const char * const xpm_symbol_mod[];
+extern const char * const xpm_symbol_yes[];
+extern const char * const xpm_choice_no[];
+extern const char * const xpm_choice_yes[];
+extern const char * const xpm_menu[];
+extern const char * const xpm_menu_inv[];
+extern const char * const xpm_menuback[];
+extern const char * const xpm_void[];
 
 #ifdef __cplusplus
 }
-- 
2.25.1

