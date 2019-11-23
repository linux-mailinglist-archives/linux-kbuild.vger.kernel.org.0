Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A653107F41
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfKWQFC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:02 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49453 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5X019106;
        Sun, 24 Nov 2019 01:04:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5X019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525095;
        bh=bQe/3Y9Yl+Kq9fBfAZOWGkCZwUqZVs1ZvuNfALS8C3M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cjUQ/FkK+GKaB9FQDS2oQmQIFqTtwvMn+XU1w5kuJ6vuHntQh4WviKuCipgVTOF6q
         NzeW7B9KsE0GmU8xIkFvUv7XNpcbQjMUsYsSfZrjwBqQDhXsoltaIx3fE8NjBUvQCB
         sas9D0BQCiU/9W9yDBKqbz3tRMJJB8aQQ787SEfNd7jHDKAkSKQeamVl3eg9vyhgVh
         EXrv+fluli/i+h6ys9DnIzcLUfEriwp/nsqUP0Au24yHYt+ywR05MPfG1yB0JbDXqd
         bzpFWevKawuhs8VpksT8PQ19fCGK3G7WWQ9RyaYaYwnpo7oSaH3mLUD3o3eP5pBL+L
         hmKdJHq1iwlSA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/16] scripts/kallsyms: remove redundant initializers
Date:   Sun, 24 Nov 2019 01:04:44 +0900
Message-Id: <20191123160444.11251-17-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These are set to zero without the explicit initializers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index b9b1a4cf1c65..fb55f262f42d 100644
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

