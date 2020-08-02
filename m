Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE88235870
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgHBQSv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:51 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48898 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOag003720;
        Mon, 3 Aug 2020 01:17:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOag003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385047;
        bh=VYR6SHz+m2VPEa2TZmAxDgYUIVGzNeKSGROTaBC77oM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GIKNAeUx6AC+rMG+irVlMJS7DPgAe/3Te94a0r8KI6wTWIpYvt+As81yVnrfwoNj7
         bcvMKdODzAdqRRQINQkxpKxopwX2NUnTXP0tpDXgP9ckeq1oqAaF5dBeotzPH4buNu
         YrOB7fstV5tVmexegy7R14nk7otmdfC0BbpwM3MhXCENpwZc93cDS1bkKo4iTQuqem
         kXTbbZ4d/Eo9qM5fk251/Iyr5s5WB2JmXkajUrgTpyiAGOc2EDa6ok9bKCnUv/8ubp
         9Mjni48e55smVaSx9nQwjkL/oQa5mBnBsJWlpqRw7OT4mpeXQ5zcFSdOTfT+dgnOPP
         h9jLUHrFgP66Q==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/16] kconfig: qconf: remove unused ConfigList::listView()
Date:   Mon,  3 Aug 2020 01:17:10 +0900
Message-Id: <20200802161721.921721-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I do not know how this function can be useful. In fact, it is unsed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index b80683998635..6e6bb0a96348 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -88,10 +88,6 @@ public slots:
 		updateList(NULL);
 		updateAll = false;
 	}
-	ConfigList* listView()
-	{
-		return this;
-	}
 	void addColumn(colIdx idx)
 	{
 		showColumn(idx);
-- 
2.25.1

