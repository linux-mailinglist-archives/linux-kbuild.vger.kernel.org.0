Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521F3107F4A
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfKWQFu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:50 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49451 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5N019106;
        Sun, 24 Nov 2019 01:04:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5N019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525090;
        bh=lxCDJ/TzRamerzIHNtq7hRwp1rjH2y4uMZMCuV7ILJg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vIz5p4JABWr2ukQchXCPsHDjkp9lot5DP65ulXNWDBNpkGwr6lpe3sbq6Wq6h4yUI
         CTPa8hO/pnYsxUW3L8QgPtlW9oPaihXyL0Gyu/M+fwXVTWl+KLNf2L6nkLWQSQvnca
         MRU4S7CXku89X7hLsHUgk4eyDKmlJw2c011IZ2EHIMKrSgoolLDKHb+B4LqhxYC62V
         znZ4YrKLWyyp0UEoJXzZHMoMBEyNxQx76fFp+X1gCzi1bHwQABbJjyNZZ/1bvIh002
         I6SA7YmkDoKKqLoqCL2L2Uurq/XlPmQXHbR4DAygejWWjInPiAO4yvoJXfV4KbL4Zy
         HI8R+OWSJ+hJQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/16] scripts/kallsyms: remove unneeded length check for prefix matching
Date:   Sun, 24 Nov 2019 01:04:34 +0900
Message-Id: <20191123160444.11251-7-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

l <= strlen(sym_name) is unnecessary for prefix matching.
strncmp() will do.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 14a50c8d3f34..a57636c6f84f 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -246,8 +246,7 @@ static int symbol_valid(struct sym_entry *s)
 	for (i = 0; special_prefixes[i]; i++) {
 		int l = strlen(special_prefixes[i]);
 
-		if (l <= strlen(sym_name) &&
-		    strncmp(sym_name, special_prefixes[i], l) == 0)
+		if (strncmp(sym_name, special_prefixes[i], l) == 0)
 			return 0;
 	}
 
-- 
2.17.1

