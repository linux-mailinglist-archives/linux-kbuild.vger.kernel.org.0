Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263CF23EA26
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgHGJU6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:20:58 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41594 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbgHGJTk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:40 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQ8032147;
        Fri, 7 Aug 2020 18:19:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQ8032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791962;
        bh=4uKyPxqgpR7kYRHZT9Kv76QwzC1/t5RlOrA5ow9oRUo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MbAtpUCKwwX8Quug095DvEZBNhJuh65aWZzHVxTvgYYI0ldnI1KWbUUL/JffouoOK
         x7ASvoNe8ef/OVvQOxSv+D1hsNOWhzqLPcn8MRwY3rXVUkSlLnfaoTZmZjnd5fiBwA
         y550SKz0eTZwNPsFJNLzMwqbzPDLFQA1n0MAvzuio5iyHf8e1hjqtWwOcpHwCP6HDz
         +YJHo3RsJvv2OGoJ896xJzK0VCEuACWbNtM/85mL49hTRSrSlWct4+0PHrfCIk7Afj
         nwik3e/XOQ6FYdawxF26RTMNyYcpIylQ09FhyQCc2ebXKv0oj70iWzAewSETwTbiY9
         iDJoO1Yy9u98g==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/19] kconfig: qconf: drop more localization code
Date:   Fri,  7 Aug 2020 18:19:02 +0900
Message-Id: <20200807091909.2985787-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
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

(no changes since v1)

 scripts/kconfig/qconf.cc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 604f7855b070..230ce621d85b 100644
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

