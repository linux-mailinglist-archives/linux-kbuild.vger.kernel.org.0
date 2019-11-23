Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC037107E8F
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 14:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfKWN2Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 08:28:25 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39587 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbfKWN2B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xANDRbko000733;
        Sat, 23 Nov 2019 22:27:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xANDRbko000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574515666;
        bh=ABZMLzbkwxvv1sZSUxQf78l1xgdh6waH3ITd4vzDgwo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F2YKCV/1k0N+2w6nTOzMUtwwF5td+ZQanVC8b8+iw8Xi6oJE/NwrybKQsoEvhj2lb
         pDaQSJFcTQyxe82MOF+em5Fr2oNejhAMkd2Byz9KLi4U/CcOaw5UBYsGx2JPvN5I5M
         5ofi/bsZgFyhXWpoujJX3xvVfnmd8bPS6Blq3YiJs2yAaqG3sWsUx8cmhHcqQrcHBF
         MyH0a8KonGI3VHMnzA4QPWcB+xK+Z5GyJXaGMERIlbSutwPgAz6HVhBm+0sgotEcBz
         dKHnqs6rbPm2M5ysJgioER7gM6afNFDdAoHHl4EdJ/+ZRsEOrNUN4FpDFxhJWVAGxO
         /VAC3METJmIdQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] scripts/kallsyms: put check_symbol_range() calls close together
Date:   Sat, 23 Nov 2019 22:27:26 +0900
Message-Id: <20191123132727.30151-16-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Put the relevant code close together.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 919cb45ce9db..22ff206e2533 100644
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

