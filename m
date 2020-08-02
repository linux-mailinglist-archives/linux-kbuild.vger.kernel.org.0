Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011C623585F
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgHBQSX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:23 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48904 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOam003720;
        Mon, 3 Aug 2020 01:17:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOam003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385049;
        bh=rxIR7xmDbgwILNsGth0BdqXszWzbdWYmbGkGpyVmV1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tdBzI/TyyJdQ5b5Bfxv1PJHmHdhlSUaFQAJKZA/gBQWZLSMjmcPSTK+MyoKtuPOxS
         E350UMAndXjLrZakLXXJ/tk0YJ3iW+yAgdwUgCa/jRJqxNXkJ8hcaKZUbLY1gVwP/K
         qzIsFPeg9TCpLrL8uKvf2/xw80zcQxCMob5otvkYdpG66yrEtV14vDjw2QSE1qMPfW
         Q6+umNouC5SV1EK06onCGRfEb2VKHC7b6/WtEw/1lG+ho7NTsNvcX2ztg0PzHuZRMv
         E1zzulub4MYBKSvBW3o188EUmLiO+Ppe5bJBIre6/ctvnFM7bOWvCXx8PHOY1j8gCg
         2ELS1FVxtYzLA==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/16] kconfig: qconf: drop more localization code
Date:   Mon,  3 Aug 2020 01:17:16 +0900
Message-Id: <20200802161721.921721-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a remnant of commit 694c49a7c01c ("kconfig: drop localization
support").

Get it back to the code prior to commit 3b9fa0931dd8 ("[PATCH] Kconfig
i18n support").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 7f7164c71163..de46a2fc3f98 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -31,11 +31,6 @@ static ConfigSettings *configSettings;
 
 QAction *ConfigMainWindow::saveAction;
 
-static inline QString qgettext(const char* str)
-{
-	return QString::fromLocal8Bit(str);
-}
-
 ConfigSettings::ConfigSettings()
 	: QSettings("kernel.org", "qconf")
 {
@@ -109,7 +104,7 @@ void ConfigItem::updateMenu(void)
 
 	sym = menu->sym;
 	prop = menu->prompt;
-	prompt = qgettext(menu_get_prompt(menu));
+	prompt = menu_get_prompt(menu);
 
 	if (prop) switch (prop->type) {
 	case P_MENU:
@@ -135,7 +130,7 @@ void ConfigItem::updateMenu(void)
 	if (!sym)
 		goto set_prompt;
 
-	setText(nameColIdx, QString::fromLocal8Bit(sym->name));
+	setText(nameColIdx, sym->name);
 
 	type = sym_get_type(sym);
 	switch (type) {
@@ -265,7 +260,7 @@ void ConfigLineEdit::show(ConfigItem* i)
 {
 	item = i;
 	if (sym_get_string_value(item->menu->sym))
-		setText(QString::fromLocal8Bit(sym_get_string_value(item->menu->sym)));
+		setText(sym_get_string_value(item->menu->sym));
 	else
 		setText(QString());
 	Parent::show();
-- 
2.25.1

