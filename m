Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788CD23EA0A
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgHGJT6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:19:58 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41595 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbgHGJTk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:40 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQ9032147;
        Fri, 7 Aug 2020 18:19:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQ9032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791962;
        bh=ruoGdXxpfuF5Ao/NO55rH8BOT8e4cequmOPosNxZzGU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xEykM3Vk05LeOIFlZwX75FtlFzlVlGVDp4rp+9ASdgfPzYYG4+SsB8XclztLZY0dm
         lEMbZhQ1w56gL9SwPe5vA7lofMKYbH408lswWHq8AvC+hzkt+Yqv7CiHDWRBj5yvEL
         bSEAHutI/0L7N9wEcjV9ij7OhOb7Td6o5/Z8NuijV+N03HMpCJL3ieiZRrNniuGdgY
         R0MPP+2WremIDmN7SbgEFjoilF7zNd2SE4HlMi2/Q+vPyrcCpLdDKao3wZ0YJD4bId
         bfEzg/OPLHKTyt7zwlTFyklvHG3rDh2oWeBBWzetJ0UwLgF60i5nGdFOpOXDYP/mMv
         0bbiTY1Q5iwgw==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/19] kconfig: qconf: remove ConfigItem::pixmap/setPixmap
Date:   Fri,  7 Aug 2020 18:19:03 +0900
Message-Id: <20200807091909.2985787-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use QTreeWidgetItem::icon/setIcon directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/qconf.cc | 22 +++++++++++-----------
 scripts/kconfig/qconf.h  |  8 --------
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 230ce621d85b..56b5cdd8b1c9 100644
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

