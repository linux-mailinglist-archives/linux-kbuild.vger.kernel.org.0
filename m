Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD2C107F2E
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfKWQFB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49444 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5J019106;
        Sun, 24 Nov 2019 01:04:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5J019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525088;
        bh=WZZFA6dol6oYL7xPQCp9izlpiyCZuwW4132+Q9wwKac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gp4THjHFa0mPASPXe10mzi1lw1vjiNOyzebQLbBxg6WwQ0kO7VHCfoqqbGMIBZ2bu
         ogDa4JhABiSWOBlP+etmaJ9AohyLKDBDrRp8otdiZYPFKwWTf9mhlpg5rw5mVW3uVr
         Sxf/26CmgGYt9CEmrqvYZSCN2TWjMr7BzN0XF4Fvl6uEWRQeQMmVZ2fvFwWcI5o4co
         8dpDv2r1GXrNk0PlCLB83+75aX+UoeVyTxcO80XO7c0ob7t2C82GQ7Pmsb/Ed29XIU
         jEqGT6qVp3PcbryuBq1vnV/vd/N3UoIkCd0F7037ct8HA+v6gRTMUSpErkG7pRkpLK
         FINV9xO1FxSUw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/16] scripts/kallsyms: fix definitely-lost memory leak
Date:   Sun, 24 Nov 2019 01:04:30 +0900
Message-Id: <20191123160444.11251-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

build_initial_tok_table() overwrites unused sym_entry to shrink the
table size. Before the entry is overwritten, table[i].sym must be freed
since it is malloc'ed data.

This fixes the 'definitely lost' report from valgrind. I ran valgrind
against x86_64_defconfig of v5.4-rc8 kernel, and here is the summary:

[Before the fix]

  LEAK SUMMARY:
     definitely lost: 53,184 bytes in 2,874 blocks

[After the fix]

  LEAK SUMMARY:
     definitely lost: 0 bytes in 0 blocks

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 918c2ba071b5..79641874d860 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -487,6 +487,8 @@ static void build_initial_tok_table(void)
 				table[pos] = table[i];
 			learn_symbol(table[pos].sym, table[pos].len);
 			pos++;
+		} else {
+			free(table[i].sym);
 		}
 	}
 	table_cnt = pos;
-- 
2.17.1

