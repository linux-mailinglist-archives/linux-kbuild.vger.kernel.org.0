Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5FA122308
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfLQERb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:17:31 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:50927 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfLQERa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:17:30 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id xBH4GfU4015071;
        Tue, 17 Dec 2019 13:16:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com xBH4GfU4015071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556202;
        bh=Rv8WC9dqDe37ICSXxuXsuqUKzxAsugVrlJDEH6dRoJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ISQctXteuF7JV8kNwP0Mki+VFdTCmwSRuLZo3K3FTddZTCz67wlx4FKevNn/Yrq9b
         Us7N+5G1TmpWvnb3hlLLNIMJo7d+4dDwU5WtgyiuvjrhHlsGAI+VZpvrHH5IroopQE
         7ia4Grvmqx3ew914b1YIav8zi3Vuzu6NDMUOBWLcJII88r+0mC1ffmQJxq6o5FUNQ2
         Lcbjy+5TiS1walATcb+Oqx6ajeVVuKOCYJ2h9iAvw0HE2qqBUNw1MQVCT67Ekhd5Bc
         XFTXIp8RCLeISydKXo3ThEs94dJHD/UCYf57013+Swf3H1IQE4ull/n4GwurmjfaOC
         xCuDTrYBKEOhg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: localmodconfig: fix indentation for closing brace
Date:   Tue, 17 Dec 2019 13:16:37 +0900
Message-Id: <20191217041637.29558-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217041637.29558-1-masahiroy@kernel.org>
References: <20191217041637.29558-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is the closing brace for the foreach loop. Fix the misleading
indentation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index bbaa1e11a4e9..e2f8504f5a2d 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -372,7 +372,7 @@ if (defined($lsmod_file)) {
 	    $lsmod = "$dir/lsmod";
 	    last;
 	}
-}
+    }
     if (!defined($lsmod)) {
 	# try just the path
 	$lsmod = "lsmod";
-- 
2.17.1

