Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2016107E82
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 14:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfKWN17 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 08:27:59 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39541 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbfKWN17 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:27:59 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xANDRbkp000733;
        Sat, 23 Nov 2019 22:27:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xANDRbkp000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574515666;
        bh=luGOrRAMG4Y9tsglVetzZHHjl9Wj2M3UbgJuHFlQLIw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jMRMBPFrPMoV8uQ78+xnQ35IvxVtduNrPhP2JftuIYO2wGY19bLTLM8/BXv6Kitjj
         W8x8Q80hpb4vGpG3kIkjQcZ2hop9KiCCKDk+JF0ALU3C+YOG9B3cp3+ZTTNv9LSMFk
         jQqfBwdJgzMZCz6IUzVjp99fJQxIAWw4J21QSOlCDHdABx6tXus5NlkTbKfFAq6WPy
         I4ubZdVGYezT1WzhxXHFmoF+EIXRem6Yz6cesRgwkZn+8QI3xYGLtEle9EhtrQnVXq
         WvKg1JZIZM8L2u1TLCOY6AMhaw7g8+GM8HjPCllzCx4D+pXUDCwnKeGN41P9jJSnum
         OAw6nhJ4E7RvA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/16] scripts/kallsyms: remove redundant initializers
Date:   Sat, 23 Nov 2019 22:27:27 +0900
Message-Id: <20191123132727.30151-17-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These are set to zero without the explicit initializers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 22ff206e2533..803df71e5069 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -57,9 +57,9 @@ static struct addr_range percpu_range = {
 
 static struct sym_entry *table;
 static unsigned int table_size, table_cnt;
-static int all_symbols = 0;
-static int absolute_percpu = 0;
-static int base_relative = 0;
+static int all_symbols;
+static int absolute_percpu;
+static int base_relative;
 
 static int token_profit[0x10000];
 
-- 
2.17.1

