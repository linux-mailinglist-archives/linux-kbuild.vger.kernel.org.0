Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D14107E9F
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 14:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfKWN2v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 08:28:51 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39535 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xANDRbkh000733;
        Sat, 23 Nov 2019 22:27:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xANDRbkh000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574515662;
        bh=yRF2y3vF9C7Zci91xsHHxMzbjmKu+VkByjExrmElrLw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IBzj/6q7RtiAFwtZwDOxwgbmWOQJxTLhfJ/YpLZW8YexI1LOIFB8mmvB17aYxaoLf
         XEinzqXo9GkOUyfQmjUPSSj8PgbjlS9pt8GuXQdl02fsGxZATqidDHd+B6nTBxTKfH
         3f2iTj/f4GPfMfvUi5YnurpMNdsriOPx830y+Hysphf19Z1LcTL6UO19y+IAmPXA5C
         zFNdcDVFspXn9IrR7KLIuukkRjf9FGYNj0WmN5vupnviOFnaNZUho5tVDRrMIk0Bfy
         2mqdQ2Htlvsn542ufSmpmYeSHRiZ1MBbYhA82VJvwJHM0UUJlmiRKSIaNQUvgxJTPp
         qM1oejpG0s14A==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/16] scripts/kallsyms: make find_token() return (unsigned char *)
Date:   Sat, 23 Nov 2019 22:27:19 +0900
Message-Id: <20191123132727.30151-9-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The callers of this function expect (unsigned char *). I do not see
a good reason to make this function return (void *).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index a007d901c3a5..c4f7f20ecfb7 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -489,7 +489,8 @@ static void build_initial_tok_table(void)
 	table_cnt = pos;
 }
 
-static void *find_token(unsigned char *str, int len, unsigned char *token)
+static unsigned char *find_token(unsigned char *str, int len,
+				 unsigned char *token)
 {
 	int i;
 
-- 
2.17.1

