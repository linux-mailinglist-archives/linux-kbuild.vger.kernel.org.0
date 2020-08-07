Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916D723EA27
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgHGJVE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:21:04 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41482 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgHGJTg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:36 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQ6032147;
        Fri, 7 Aug 2020 18:19:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQ6032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791960;
        bh=OJZVNA6euqkx7rsPqqxzydbAOptXcAX7qWXilCkQ26g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O4+whdfdrb1C0o7yjIV0cZWuIa01a2tZa+F2O/HuYEvh1N8ApMHqvqRt8GGmLktJh
         anumilIRAwaAajJ7HQigmUR47T7Lg3h14L70uugs1JKsNYbRGySoRDRecd6rBIyvpO
         oTw9Z6fgbrJYYJ9uCkK/qsNrOUigvTE9v08HJFa+PZq4cBsurqOD+HlPgS/CQWZ7wF
         hltjlmCvxuqZGU6brOnlOD47UTDl2F0ArMeYbLSxkRt1Y9uXe50e2KRiCKK19xnolZ
         7V176TfdmGjrM6haU1hluXScXEj2Haj/vS0rjP0duTghOh2cFGNTZl0zF7LQ9VoYQu
         219a1uXppzOFg==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/19] kconfig: qconf: remove unused argument from ConfigView::updateList()
Date:   Fri,  7 Aug 2020 18:19:00 +0900
Message-Id: <20200807091909.2985787-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that ConfigList::updateList() takes no argument, the 'item' argument
ConfigView::updateList() is no longer used.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/qconf.cc | 8 ++++----
 scripts/kconfig/qconf.h  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 8455f81e101f..808bc311e335 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -280,7 +280,7 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 	case Qt::Key_Return:
 	case Qt::Key_Enter:
 		sym_set_string_value(item->menu->sym, text().toLatin1());
-		parent()->updateList(item);
+		parent()->updateList();
 		break;
 	default:
 		Parent::keyPressEvent(e);
@@ -471,7 +471,7 @@ void ConfigList::setValue(ConfigItem* item, tristate val)
 			return;
 		if (oldval == no && item->menu->list)
 			item->setExpanded(true);
-		parent()->updateList(item);
+		parent()->updateList();
 		break;
 	}
 }
@@ -505,7 +505,7 @@ void ConfigList::changeValue(ConfigItem* item)
 				item->setExpanded(true);
 		}
 		if (oldexpr != newexpr)
-			parent()->updateList(item);
+			parent()->updateList();
 		break;
 	case S_INT:
 	case S_HEX:
@@ -984,7 +984,7 @@ void ConfigList::setAllOpen(bool open)
 	}
 }
 
-void ConfigView::updateList(ConfigItem* item)
+void ConfigView::updateList()
 {
 	ConfigView* v;
 
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 4dc5d34a6bca..6d06ec399ff0 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -210,7 +210,7 @@ class ConfigView : public QWidget {
 public:
 	ConfigView(QWidget* parent, const char *name = 0);
 	~ConfigView(void);
-	static void updateList(ConfigItem* item);
+	static void updateList();
 	static void updateListAll(void);
 
 	bool showName(void) const { return list->showName; }
-- 
2.25.1

