Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E454194AB
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Sep 2021 14:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhI0M5h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Sep 2021 08:57:37 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41363 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbhI0M5g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Sep 2021 08:57:36 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 18RCt8TG023197;
        Mon, 27 Sep 2021 21:55:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 18RCt8TG023197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632747338;
        bh=bigzbXu0L332ubAdRCsgigHj9DxBvQaZOIfvn8Lvoxc=;
        h=From:To:Cc:Subject:Date:From;
        b=Ns5zwKqtP+OabPMER9kfxBut4mj5Y6gSWYpcsKQ8E3y0fYU7zEncKNY6mFLud68t7
         MmiVjZVRA0L4YpoSVpZP6lRFypOheWayQw+h0sfqr0wT2ItPDLaYV/8JtmmNXl9Lxh
         MdySQo/bPL1LKNAz9dV/6IOJmtafAl7cFC7uPW7nvhCtvAuJqP7h9BGf9aDRwKFNkl
         4Dw4uxUOZQSzXGq/Q0HwOrM6QJrTFT5bDyAOFKIAjr/I9j9ejSooo1ydbMx1+KalLC
         ilMl2op6ECH0Q4BNOTn/RjpXHw2uefSfX4yLMFaJ4nb/Z8/oib+ZenxZIWDJvU+u+s
         wBNIqyX45J+xQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kconfig: narrow the scope of variables in the lexer
Date:   Mon, 27 Sep 2021 21:54:36 +0900
Message-Id: <20210927125437.818092-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The variables, "ts" and "i", are used locally in the action of
the [ \t]+ pattern in the <HELP> start state.

Define them where they are used.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lexer.l | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 312cbad2d34d..efe487859308 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -85,7 +85,6 @@ n	[A-Za-z0-9_-]
 
 %%
 	int str = 0;
-	int ts, i;
 
 #.*			/* ignore comment */
 [ \t]*			/* whitespaces */
@@ -196,6 +195,8 @@ n	[A-Za-z0-9_-]
 
 <HELP>{
 	[ \t]+	{
+		int ts, i;
+
 		ts = 0;
 		for (i = 0; i < yyleng; i++) {
 			if (yytext[i] == '\t')
-- 
2.30.2

