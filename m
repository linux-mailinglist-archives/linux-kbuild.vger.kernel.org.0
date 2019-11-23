Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EABA8107F4F
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfKWQFu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:50 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49449 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5W019106;
        Sun, 24 Nov 2019 01:04:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5W019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525095;
        bh=jA3oyA+zBfgpdI/EjevUAFgNYlad6/34++q2OdZf31k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ls8Ej6lzwh4m25ICQmLvpNEmvovUsuCJ4C3qbnAgD1chP/UidRNAzql0uxWy25+7p
         8DqN7YSD3JMYFEfaEC/ah4vFxymxc4YKfGp5g4j5ofQU0Te2JJpl0NBb7Yo1rgqrAS
         aiZ2iOhmO7JoFZtTxbc5UNgfvyuPpCly4OY/VUK6JcwQEatCPj5McFCYorIzht0tzM
         QbzLq9AvWdPo4ePLfSH5OvmtQeFhUjBPOOBwge0TWp8x7/dPMxwsv/12xsyZvZI9xz
         OaDsaYQe+dAX8ySAUxAV1k8Q9OxQepfEcYzj/hZCY3tpXiqlA5tVOHZcgButhqtA5F
         jPc6R7aUvjYMw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/16] scripts/kallsyms: put check_symbol_range() calls close together
Date:   Sun, 24 Nov 2019 01:04:43 +0900
Message-Id: <20191123160444.11251-16-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Put the relevant code close together.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index f4d5f131556d..b9b1a4cf1c65 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -200,6 +200,7 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 		_text = s->addr;
 
 	check_symbol_range(sym, s->addr, text_ranges, ARRAY_SIZE(text_ranges));
+	check_symbol_range(sym, s->addr, &percpu_range, 1);
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
@@ -215,9 +216,6 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 
 	s->percpu_absolute = 0;
 
-	/* Record if we've found __per_cpu_start/end. */
-	check_symbol_range(sym, s->addr, &percpu_range, 1);
-
 	return 0;
 }
 
-- 
2.17.1

