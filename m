Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F318118582
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 08:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfEIGqt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 02:46:49 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:38135 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfEIGqt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 02:46:49 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x496k1w2011062;
        Thu, 9 May 2019 15:46:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x496k1w2011062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557384363;
        bh=yvvTvwV0Tq4SfdZCXnDg+V5rwwtcrTFnobkhSLEwtFI=;
        h=From:To:Cc:Subject:Date:From;
        b=HP06V32v2HYSug7mt4D42elbvKd4c5IlYYu9Na61IXnowNhnw6wD3Aa25u0NTi/yg
         10bDDONVCyEDGtKS3sHP/369sBL2U4xkBNE6JXtKlg159qUO2fF3uafqraM2oJysjn
         lxlOZMYh3bHpDypxmCVL9JcME/qyx8BhuwBlqGEK/2GauqG2oj1YZyquqjXO3jmq+o
         mLhmNtzN+bKLzPzgflPox2wDRHN9p4eAAdrFnNQEyjMCcLXYSc/H98WlrssgHOlcqE
         7VQhAzCHOrrc2I5f9sQ19o6EyGOTPrvOtUV5Ti/55XJAcC3b5I8R0jgyBGhYuycXyl
         1sQdInYtfQ/gQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add -Wvla flag unconditionally
Date:   Thu,  9 May 2019 15:45:49 +0900
Message-Id: <20190509064549.1302-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This flag is documented in the GCC 4.6 manual, and recognized by
Clang as well. Let's rip off the cc-option switch.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c71ffb6f55b5..3f5e8a0f4561 100644
--- a/Makefile
+++ b/Makefile
@@ -841,7 +841,7 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
-KBUILD_CFLAGS += $(call cc-option,-Wvla)
+KBUILD_CFLAGS += -Wvla
 
 # disable pointer signed / unsigned warnings in gcc 4.0
 KBUILD_CFLAGS += -Wno-pointer-sign
-- 
2.17.1

