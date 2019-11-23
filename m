Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16ED7107EA0
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 14:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfKWN2v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 08:28:51 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39536 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xANDRbkg000733;
        Sat, 23 Nov 2019 22:27:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xANDRbkg000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574515662;
        bh=YReDcxfG08+KN/ys3qrGQn3f4QFwxWEt7XHh/6OsNjk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hiCg3yvwtEG/PzPVSGTTU1RZvNrR30Q1AprIKE9IONc8dSnD4iIYhvVJKaj5F6ZiF
         /YThI0c9Vo12j5gg4J1+nnxnHq/AxZyU8ptViG4eQJKrCfSo6Vn9x4MVPndxNYT/u7
         rCsjOiR+98C6dMaNDtFAcCxY8up1TwoY3ktDLGoHenMMreco65ClIQJqxnukZmlpdI
         LX2mF+33j4FicRkzKIL/dXcijupEkxsJrfdl1z7NyES+CVNYHPE7B/eN+sMVxJQsue
         2/svM7js9DjmpU3VIV2WiJpT2zi+naJ6qS6o9OhMZ/a1qX4dY9u8/Rct657kkaMSff
         GykvGVGEB7KZA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/16] scripts/kallsyms: replace prefix_underscores_count() with strspn()
Date:   Sat, 23 Nov 2019 22:27:18 +0900
Message-Id: <20191123132727.30151-8-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

You can do equivalent with strspn(). I do not see noticeable performance
difference.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 7b00b4030be4..a007d901c3a5 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -653,16 +653,6 @@ static int may_be_linker_script_provide_symbol(const struct sym_entry *se)
 	return 0;
 }
 
-static int prefix_underscores_count(const char *str)
-{
-	const char *tail = str;
-
-	while (*tail == '_')
-		tail++;
-
-	return tail - str;
-}
-
 static int compare_symbols(const void *a, const void *b)
 {
 	const struct sym_entry *sa;
@@ -691,8 +681,8 @@ static int compare_symbols(const void *a, const void *b)
 		return wa - wb;
 
 	/* sort by the number of prefix underscores */
-	wa = prefix_underscores_count(sym_name(sa));
-	wb = prefix_underscores_count(sym_name(sb));
+	wa = strspn(sym_name(sa), "_");
+	wb = strspn(sym_name(sb), "_");
 	if (wa != wb)
 		return wa - wb;
 
-- 
2.17.1

