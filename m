Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4722350E0
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Aug 2020 09:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgHAHJW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Aug 2020 03:09:22 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:56395 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgHAHJU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Aug 2020 03:09:20 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 07178rlD012084;
        Sat, 1 Aug 2020 16:08:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 07178rlD012084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596265734;
        bh=EixGanP6XR3XFr9BeJOupuwmppYAbIcEyHygqrmijpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xhJvHg2KVTp/4BStnKtzlFKJ+OcEv7l1dxIYA4B3ROslIbUmISJyXzM/RdwTXuacy
         9rMPmga+8ZmfebegcMnQyKevhKETjaA1pZkoA0uOZxwVSVei4tiPB8AHlQPiuztnf6
         bovjg494pOCuV8Dsq6svjQbFnGNchGe+2vARTfS+KVr1IxgvY7p0MzGbYd6VYoYkkr
         7DYYABhxQq+dZ/D8UVdGs1nwREd/2rgswnOi4pyT6ZRP5Sf4TTc+iwL5qmWr0XabgN
         OzbDFrMkjlXpHNnDKm4mPK/IAJ86iXEO/dbLHIpLh7NEcP9xevbWv6ahnjHhclTcY7
         ED26gQLz1Cv0Q==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: qconf: remove wrong ConfigList::firstChild()
Date:   Sat,  1 Aug 2020 16:08:50 +0900
Message-Id: <20200801070850.484106-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200801070850.484106-1-masahiroy@kernel.org>
References: <20200801070850.484106-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This function returns the first child object, but the returned pointer
is not compatible with (ConfigItem *).

Commit cc1c08edccaf ("kconfig: qconf: don't show goback button on
splitMode") uncovered this because using the pointer from this function
would make qconf crash. (https://lkml.org/lkml/2020/7/18/411)

This function does not work. Do not use it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 +-
 scripts/kconfig/qconf.h  | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 75c7b57fd7a9..80f042a337c2 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -443,7 +443,7 @@ void ConfigList::updateList(ConfigItem* item)
 	}
 	if ((mode == singleMode || (mode == symbolMode && !(rootEntry->flags & MENU_ROOT))) &&
 	    rootEntry->sym && rootEntry->prompt) {
-		item = last ? last->nextSibling() : firstChild();
+		item = last ? last->nextSibling() : nullptr;
 		if (!item)
 			item = new ConfigItem(this, last, rootEntry, true);
 		else
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index fb9e9729266f..5eeab4a8bb43 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -92,10 +92,6 @@ public slots:
 	{
 		return this;
 	}
-	ConfigItem* firstChild() const
-	{
-		return (ConfigItem *)children().first();
-	}
 	void addColumn(colIdx idx)
 	{
 		showColumn(idx);
-- 
2.25.1

