Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0FA107F43
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfKWQFg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:36 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49450 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5L019106;
        Sun, 24 Nov 2019 01:04:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5L019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525089;
        bh=jnfvjcB5kg6ke5illdITerqCOO0i1ll9kEjlHRPbqGY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FV5lkNildmiiTubSxu06HhEHVwMSCweueZUvG39cNL4RC+2Y06tdbNeQ+n+4gIaOg
         mz8MvphMJNMQaJ77fuMEifS//aXw4yo9HUy9PjOK82SF5/FeffaWpAEqSIioZyKuh0
         SoT0F1o60PUaujqnJDfQzyD5tLAVkUiJZycvr0+EieuQSf3oV4PUUYx1cGCNrl1bRN
         eryi/OfaiFCnoN0acxhAdZaF1H/VIl10EbSswtRhbbZZTi9aYciQdPd20LgXXIguiu
         Eh+B3GeDep7xVK/CPK2XKiNMlqnp520LumaCkvxPLZLcXnmCmjjN1+FY52EYIy2b2U
         8vhLr9bI/+LkQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/16] scripts/kallsyms: set relative_base more effectively
Date:   Sun, 24 Nov 2019 01:04:32 +0900
Message-Id: <20191123160444.11251-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, record_relative_base() iterates over the entire table to
find the minimum address, but it is not efficient because we sort
the table anyway.

After sort_symbol(), the table is sorted by address. (kallsyms parses
the 'nm -n' output, so the data is already sorted by address, but this
commit does not rely on it.)

Move record_relative_base() after sort_symbols(), and take the first
non-absolute symbol value.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index de986eda41a6..c9efb67c6ecb 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -739,11 +739,15 @@ static void record_relative_base(void)
 {
 	unsigned int i;
 
-	relative_base = -1ULL;
 	for (i = 0; i < table_cnt; i++)
-		if (!symbol_absolute(&table[i]) &&
-		    table[i].addr < relative_base)
+		if (!symbol_absolute(&table[i])) {
+			/*
+			 * The table is sorted by address.
+			 * Take the first non-absolute symbol value.
+			 */
 			relative_base = table[i].addr;
+			return;
+		}
 }
 
 int main(int argc, char **argv)
@@ -767,9 +771,9 @@ int main(int argc, char **argv)
 	shrink_table();
 	if (absolute_percpu)
 		make_percpus_absolute();
+	sort_symbols();
 	if (base_relative)
 		record_relative_base();
-	sort_symbols();
 	optimize_token_table();
 	write_src();
 
-- 
2.17.1

