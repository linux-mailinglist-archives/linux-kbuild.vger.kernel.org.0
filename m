Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9AA23586F
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgHBQSu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:50 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48901 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOap003720;
        Mon, 3 Aug 2020 01:17:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOap003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385052;
        bh=V5J5sm6nLIl/m9xpCzrGnEere1jzBD0dqwZAtD550+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rq7aBXp3ly9FQFch8StWv+KZDAlnPaTp/hOC8JZC8zc6ZpQ6CkjNIu6KpvO5Nye7Q
         mQLhL5/yvtLyF+Xja7T81hXUmYPGIDosEC3U+8fY+Aku8odTpdn1cqOgrwPProvpcw
         mrVDVhMJW+qFquvO0QmVsCAH1C2phUSx23Nn0L/kYTVWAELMVNMfuWqXuXmaxqDtfD
         sI7zr8ziXb5t1f/cYJy1PIula6ZzIkqzvwibhRLVNMtCRcXx4m9zjPrcDNn8G7xJu5
         hAKfYlxJxDCbS6ro65yzXl0A+9VbI/p3xPH7TQLa3RGJUozPphFum65RmYzGmoyp4t
         NHc+8+XyWFfeg==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] kconfig: qconf: remove ConfigItem::text/setText
Date:   Mon,  3 Aug 2020 01:17:19 +0900
Message-Id: <20200802161721.921721-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use QTreeWidgetItem::text/setText directly

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index daa180bdb9b4..012414dcdee5 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -156,14 +156,6 @@ class ConfigItem : public QTreeWidgetItem {
 
 		return ret;
 	}
-	void setText(colIdx idx, const QString& text)
-	{
-		Parent::setText(idx, text);
-	}
-	QString text(colIdx idx) const
-	{
-		return Parent::text(idx);
-	}
 	// TODO: Implement paintCell
 
 	ConfigItem* nextItem;
-- 
2.25.1

