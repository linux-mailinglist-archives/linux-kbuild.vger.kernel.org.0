Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E092565DC
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgH2IOz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:14:55 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47524 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgH2IOz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:14:55 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfj014307;
        Sat, 29 Aug 2020 17:14:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfj014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688862;
        bh=5Y8va6v9Vkf0rKYqbjXOJvX5NgHpMaTUd+vQU6FBxB8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rtr7QzyrKnHMcA4KgUpSH7wI0otUG2SItMIpBjK3LAeIzUqV8TMNLVoSkhnqZOore
         CVteMo9EPvh/kllQ/H7naPzU6xiCox5syCXre/t6jBg/3AUMByyk7CO4e4pw2iIDAX
         vK+S6XnvMJU+nQFMICXujClbp5xzDPP7ifXpNcLwG9zfNIMN88P257WnUezYLiI7mb
         GxF/ngw1ZnU/d5/EX8esRVpaiDbc+zYnkyC5VjGz9UuoMElH8f5THeW9QBdM/3JqKR
         jZvXpO5Qb3mpNITvxwde5iFL+QgfOF5dK6by11G3r2kCNUdgOAvKn6S4El4f+55BUB
         NZyMfQ0MiDrNQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] kconfig: qconf: remove unused ConfigItem::okRename()
Date:   Sat, 29 Aug 2020 17:14:09 +0900
Message-Id: <20200829081417.725978-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
References: <20200829081417.725978-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 76538660fb08 ("Port xconfig to Qt5 - Remove custom
ListView classes.") removed the original implementation, where
ConfigItem::okRename() overrode Q3ListViewItem::okRename().

Commit 59e564408f88 ("Port xconfig to Qt5 - Put back some of the
old implementation.") restored the empty stub, but it seems
useless.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 8 --------
 scripts/kconfig/qconf.h  | 1 -
 2 files changed, 9 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 30a58aa6507a..278c04de11ec 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -82,14 +82,6 @@ QIcon ConfigItem::choiceNoIcon;
 QIcon ConfigItem::menuIcon;
 QIcon ConfigItem::menubackIcon;
 
-/*
- * set the new data
- * TODO check the value
- */
-void ConfigItem::okRename(int col)
-{
-}
-
 /*
  * update the displayed of a menu entry
  */
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index f97376a8123f..d41670f322b3 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -131,7 +131,6 @@ class ConfigItem : public QTreeWidgetItem {
 	}
 	~ConfigItem(void);
 	void init(void);
-	void okRename(int col);
 	void updateMenu(void);
 	void testUpdateMenu(bool v);
 	ConfigList* listView() const
-- 
2.25.1

