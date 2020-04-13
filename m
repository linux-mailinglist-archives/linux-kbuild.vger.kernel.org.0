Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AEE1A68E7
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2020 17:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730430AbgDMPdr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Apr 2020 11:33:47 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:50089 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgDMPdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 11:33:47 -0400
Received: from oscar.flets-west.jp (softbank060142179096.bbtec.net [60.142.179.96]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 03DFXOer018085;
        Tue, 14 Apr 2020 00:33:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 03DFXOer018085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586792005;
        bh=ObaGuAuzO6cDBYoRVHkzqtWvKhTOMojAsNV1yOmywIs=;
        h=From:To:Cc:Subject:Date:From;
        b=diZL7LDx7thW41Drm2kSo97QwCABGDIg/6vwiYiIhua1b40FAAFt6qhFfj0eE4+sZ
         1BFsKxx0z9dQfpgBMLjYXQOWVu/8hMNtnErmt+aSG6fcuSz9u37O42Ouxq1JOolQFN
         ZElzhSlPQZchm+cDoYaFG8VdARbJCjng3cgaokgMz+1D8Y0HWu/mbNMNRo4NhK052A
         81jy3x5CDGYn2/jk0V9loK6TEfrodaXZ4WuCxt0Dnx4UyC4K9hdjO7LCrwne+8k8Bz
         EwdnNB4edL8bbXSZUg+mP5Ln1NvNk4/P6LOechnrFWpxYicIFwK35CFgLnNKQ3aUNU
         CixcO/f3qfmAA==
X-Nifty-SrcIP: [60.142.179.96]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: do not use OR-assignment for zero-cleared structure
Date:   Tue, 14 Apr 2020 00:33:20 +0900
Message-Id: <20200413153320.93316-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The simple assignment is enough because memset() three lines above
has zero-cleared the structure.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 3dc81397d003..9363e37b8870 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -831,7 +831,7 @@ struct symbol *sym_lookup(const char *name, int flags)
 	memset(symbol, 0, sizeof(*symbol));
 	symbol->name = new_name;
 	symbol->type = S_UNKNOWN;
-	symbol->flags |= flags;
+	symbol->flags = flags;
 
 	symbol->next = symbol_hash[hash];
 	symbol_hash[hash] = symbol;
-- 
2.25.1

