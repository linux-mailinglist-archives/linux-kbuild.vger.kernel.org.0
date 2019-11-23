Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5F8A107F40
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfKWQFB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49445 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5P019106;
        Sun, 24 Nov 2019 01:04:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5P019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525091;
        bh=5lggXg5IEg7tnVaBbwPVhFClDCwiRJJs4nnaP/eGSlc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VwmXuzPhD1uessmiV+Ruu8F6Y+D7MZ687YsdNBGIvHKg70mg4Cx3SfLSORXOhsTJv
         Xt6pGQ9lYlHZ0xdSJx03kM/pNj/PFozWAbmMrXm9S+lnwRAsDv4jHBoFj1YFjeCbto
         i/1MPAf1c4xLkNrE+HzM78xumNwG+c3Fo5UjVLZkTojpicyMZ5nZ9P/bGCknI05A6H
         qPkuQ6oNJTO0J6Q6kXy2/5IVMwM0Uai2H6LxNdL4D2WsQm6MdCgEqN4D3rV2uCRH3w
         N1MEH7SSDC7WI+BqjqZ7c49dYRM9Eevk3iPhm+V28EWvBQjbIVzBTEo0FcMOsHntDI
         dUS9rNz6/YCdw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] scripts/kallsyms: replace prefix_underscores_count() with strspn()
Date:   Sun, 24 Nov 2019 01:04:36 +0900
Message-Id: <20191123160444.11251-9-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

You can do equivalent things with strspn(). I do not see noticeable
performance difference.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index baa2fa5692b0..89cc7c098c51 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -661,16 +661,6 @@ static int may_be_linker_script_provide_symbol(const struct sym_entry *se)
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
@@ -699,8 +689,8 @@ static int compare_symbols(const void *a, const void *b)
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

