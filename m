Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB8333A0A1
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbhCMTtL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:11 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39826 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef5018162;
        Sun, 14 Mar 2021 04:48:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef5018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664923;
        bh=MGYlzY1GkRGJk4K6IXw77CNt1mJL/7ouqybHgT6bNkk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y9IaPadaPRbfg+5RAhoiGmgxJT8PBRuXIqxf9+/6i0yb9/Ts9stMxolA/U7ClOz2Z
         qmE0b+/bNQN4HaOzjcl5qeRxZrFHsd9tVzoEhaxoU24D/rG+Moef82AYepIyTgQaR8
         Ms6RaJp37GPnnsGqJ24KOKSIwpSwZqwRhMsFKYLb5sCXue+rA0cDTe5GTkp1HLITEM
         d0skhZM0bmfu7q9mOhIrLq9VKXHXnQKs1Ujcjvx1cFgLchFLKTm3YZ00YpyQ9mcVdP
         FczmNn0lFce8WlhLc+A3UXsKi6iB7SQqBLaX7r1xq85B9z/Pn+AI5mvNfE/oov6yQb
         YyYwZx2xSjmdw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] kconfig: move conf_rewrite_mod_or_yes() to conf.c
Date:   Sun, 14 Mar 2021 04:48:29 +0900
Message-Id: <20210313194836.372585-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This function is only used in conf.c.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c     | 15 +++++++++++++++
 scripts/kconfig/confdata.c | 15 ---------------
 scripts/kconfig/lkc.h      |  1 -
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 42d35da86604..89c9ba83f9e7 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -112,6 +112,21 @@ static void set_randconfig_seed(void)
 	srand(seed);
 }
 
+static void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
+{
+	struct symbol *sym;
+	int i;
+	tristate old_val = (mode == def_y2m) ? yes : mod;
+	tristate new_val = (mode == def_y2m) ? mod : yes;
+
+	for_all_symbols(i, sym) {
+		if (sym_get_type(sym) == S_TRISTATE &&
+		    sym->def[S_DEF_USER].tri == old_val)
+			sym->def[S_DEF_USER].tri = new_val;
+	}
+	sym_clear_all_valid();
+}
+
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
 	if (!sym_has_value(sym))
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 2568dbe16ed6..a828622cb2d0 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1322,18 +1322,3 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	return has_changed;
 }
-
-void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
-{
-	struct symbol *sym;
-	int i;
-	tristate old_val = (mode == def_y2m) ? yes : mod;
-	tristate new_val = (mode == def_y2m) ? mod : yes;
-
-	for_all_symbols(i, sym) {
-		if (sym_get_type(sym) == S_TRISTATE &&
-		    sym->def[S_DEF_USER].tri == old_val)
-			sym->def[S_DEF_USER].tri = new_val;
-	}
-	sym_clear_all_valid();
-}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index bee2413bda63..f946ab49ef50 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -58,7 +58,6 @@ const char *conf_get_configname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
 bool conf_set_all_new_symbols(enum conf_def_mode mode);
-void conf_rewrite_mod_or_yes(enum conf_def_mode mode);
 void set_all_choice_values(struct symbol *csym);
 
 /* confdata.c and expr.c */
-- 
2.27.0

