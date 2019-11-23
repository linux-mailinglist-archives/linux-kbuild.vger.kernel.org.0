Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E18107E95
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 14:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfKWN2d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 08:28:33 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39547 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xANDRbkn000733;
        Sat, 23 Nov 2019 22:27:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xANDRbkn000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574515665;
        bh=nDLRImXyMlZ9Sa0C3TUQcIOX+p9zCip3EBLry72jMm4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NyXRf2mr61YPIKX/D1c5VdBLre5GK/iwkCt/CzSlA9jOkVNB+Y6ic0XuFR2KR17yr
         f+9dQuPGW5CiPdHgZfp2KJykooh8fWlgdA4o65ICk+wKjMJ7d9XOCuQIk6JoDO2ba7
         3slvx8/uwMbimUgTO1HNFXZPxm6BAtx2O40WiI2MxQ29z26+KRFaaubLNt1KWlCLD5
         raUEPQP8krxcqenzLnDA6V3kA2T5m8BPSuYv97Cv0ZR1/IauVqUOxZ7PIh4mPCL4TZ
         J0LtmJ2O5j4xvVxxgTjGQoJ8pPMkzhr1Z5+2GAL91hZtd/wT4MzHf55zR2mtnjshH+
         s3yLvNsFAwJ1Q==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] scripts/kallsyms: check no valid symbol earlier
Date:   Sat, 23 Nov 2019 22:27:25 +0900
Message-Id: <20191123132727.30151-15-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

insert_real_symbols_in_table() does not touch table_cnt, so the
no valid symbol check can be moved before it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 144f43363c4d..919cb45ce9db 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -608,14 +608,14 @@ static void optimize_token_table(void)
 {
 	build_initial_tok_table();
 
-	insert_real_symbols_in_table();
-
 	/* When valid symbol is not registered, exit to error */
 	if (!table_cnt) {
 		fprintf(stderr, "No valid symbol.\n");
 		exit(1);
 	}
 
+	insert_real_symbols_in_table();
+
 	optimize_result();
 }
 
-- 
2.17.1

