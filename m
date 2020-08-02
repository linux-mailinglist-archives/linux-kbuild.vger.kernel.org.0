Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504BF235866
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgHBQSd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:33 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48909 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOan003720;
        Mon, 3 Aug 2020 01:17:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOan003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385051;
        bh=1QwsYPX/TRZCCEnjbvN03XB9oaYZ36pUlFuofsrgnTo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WupozzFfskp/G//KCA4Rb+9BC2a8z28/W9jGmyZ4oW8GZLNs/pTndSguwyyEJHpHA
         QEXsoZ9XohiW6bzBJx5PAjKlPBz2gBGrt6r2iIZkwPI0kGloQNdXOVWfmBQHSYRuHp
         M9AJB1RtzMrB5vGFhE9UEeL7nPwbxEDMjACi4eZME5e/f5XoJxS9oIhY0M7Q3wXB6c
         96Jl+a66930LeP1BIld2ezFst4EDUXOL26D6Cio/WBMKMDrQTzk5/5pRjWNmzvtYdC
         d3gemRwz1kEQO779y6esFmBve2WXa5zaE8fcgQiiVZtxtwId/n1Z9OV/qCof3dyBj6
         umML8E8O+pZ5Q==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] kconfig: qconf: remove ConfigItem::pixmap/setPixmap
Date:   Mon,  3 Aug 2020 01:17:17 +0900
Message-Id: <20200802161721.921721-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use QTreeWidgetItem::icon/setIcon directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 22 +++++++++++-----------
 scripts/kconfig/qconf.h  |  8 --------
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index de46a2fc3f98..94ffb64d3eca 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -97,7 +97,7 @@ void ConfigItem::updateMenu(void)
 
 	list = listView();
 	if (goParent) {
-		setPixmap(promptColIdx, list->menuBackPix);
+		setIcon(promptColIdx, list->menuBackPix);
 		prompt = "..";
 		goto set_prompt;
 	}
@@ -114,15 +114,15 @@ void ConfigItem::updateMenu(void)
 			 */
 			if (sym && list->rootEntry == menu)
 				break;
-			setPixmap(promptColIdx, list->menuPix);
+			setIcon(promptColIdx, list->menuPix);
 		} else {
 			if (sym)
 				break;
-			setPixmap(promptColIdx, QIcon());
+			setIcon(promptColIdx, QIcon());
 		}
 		goto set_prompt;
 	case P_COMMENT:
-		setPixmap(promptColIdx, QIcon());
+		setIcon(promptColIdx, QIcon());
 		goto set_prompt;
 	default:
 		;
@@ -139,7 +139,7 @@ void ConfigItem::updateMenu(void)
 		char ch;
 
 		if (!sym_is_changeable(sym) && list->optMode == normalOpt) {
-			setPixmap(promptColIdx, QIcon());
+			setIcon(promptColIdx, QIcon());
 			setText(noColIdx, QString());
 			setText(modColIdx, QString());
 			setText(yesColIdx, QString());
@@ -149,22 +149,22 @@ void ConfigItem::updateMenu(void)
 		switch (expr) {
 		case yes:
 			if (sym_is_choice_value(sym) && type == S_BOOLEAN)
-				setPixmap(promptColIdx, list->choiceYesPix);
+				setIcon(promptColIdx, list->choiceYesPix);
 			else
-				setPixmap(promptColIdx, list->symbolYesPix);
+				setIcon(promptColIdx, list->symbolYesPix);
 			setText(yesColIdx, "Y");
 			ch = 'Y';
 			break;
 		case mod:
-			setPixmap(promptColIdx, list->symbolModPix);
+			setIcon(promptColIdx, list->symbolModPix);
 			setText(modColIdx, "M");
 			ch = 'M';
 			break;
 		default:
 			if (sym_is_choice_value(sym) && type == S_BOOLEAN)
-				setPixmap(promptColIdx, list->choiceNoPix);
+				setIcon(promptColIdx, list->choiceNoPix);
 			else
-				setPixmap(promptColIdx, list->symbolNoPix);
+				setIcon(promptColIdx, list->symbolNoPix);
 			setText(noColIdx, "N");
 			ch = 'N';
 			break;
@@ -769,7 +769,7 @@ void ConfigList::mouseReleaseEvent(QMouseEvent* e)
 	idx = header()->logicalIndexAt(x);
 	switch (idx) {
 	case promptColIdx:
-		icon = item->pixmap(promptColIdx);
+		icon = item->icon(promptColIdx);
 		if (!icon.isNull()) {
 			int off = header()->sectionPosition(0) + visualRect(indexAt(p)).x() + 4; // 4 is Hardcoded image offset. There might be a way to do it properly.
 			if (x >= off && x < off + icon.availableSizes().first().width()) {
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 952bd98d7912..5cda89a51740 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -172,14 +172,6 @@ class ConfigItem : public QTreeWidgetItem {
 	{
 		return Parent::text(idx);
 	}
-	void setPixmap(colIdx idx, const QIcon &icon)
-	{
-		Parent::setIcon(idx, icon);
-	}
-	const QIcon pixmap(colIdx idx) const
-	{
-		return icon(idx);
-	}
 	// TODO: Implement paintCell
 
 	ConfigItem* nextItem;
-- 
2.25.1

