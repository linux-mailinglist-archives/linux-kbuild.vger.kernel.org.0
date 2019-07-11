Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75F7365285
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 09:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbfGKHdp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 03:33:45 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:19441 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKHdp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 03:33:45 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6B7XLLw018488;
        Thu, 11 Jul 2019 16:33:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6B7XLLw018488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562830401;
        bh=MZwpBJbLH3Ic2lOMoV20H/PdiklfdpBShYF4i0kx/jY=;
        h=From:To:Cc:Subject:Date:From;
        b=TxPpOXLvSm8MuBuO12dsz6WyNZhNuRu1ZNCwJvVMLbytDWVRfMccvOILi+80lmCO2
         u+cxOu/nnDO8iscotHKgqOuNgwmPargDzjCorEZ9g3d1A0TzmaiP7QpkHx6eQgxHSO
         teqYoGKcxZHNOUSPlWTSVqjQ8vduuaszTDUZasdcDPfUfGui74yhbOMMCsrB67Rle0
         HTc3A6HaGpGjIAowXaef9BiWrSPbYTlENLmoeYnbiWfInHouC9AgweRgEGMeCYdkqc
         sqshB1FtKtZ2yu9pKnr5Xv462ed4U9nAjw9mWM34LrKTNwwV5/r/ZUgi5+heuGROiu
         Hzn4FSEjbWeYQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: remove meaningless if-conditional in conf_read()
Date:   Thu, 11 Jul 2019 16:33:17 +0900
Message-Id: <20190711073317.27248-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

sym_is_choice(sym) has already been checked by previous if-block:

    if (sym_is_choice(sym) || (sym->flags & SYMBOL_NO_WRITE))
            continue;

Hence, the following code is redundant, and the comment is misleading:

    if (!sym_is_choice(sym))
            continue;
    /* fall through */

It always takes 'continue', never falls though.

Clean up the dead code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 18e8051d89d7..cbb6efa4a5a6 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -534,11 +534,9 @@ int conf_read(const char *name)
 			switch (sym->type) {
 			case S_BOOLEAN:
 			case S_TRISTATE:
-				if (sym->def[S_DEF_USER].tri != sym_get_tristate_value(sym))
-					break;
-				if (!sym_is_choice(sym))
+				if (sym->def[S_DEF_USER].tri == sym_get_tristate_value(sym))
 					continue;
-				/* fall through */
+				break;
 			default:
 				if (!strcmp(sym->curr.val, sym->def[S_DEF_USER].val))
 					continue;
-- 
2.17.1

