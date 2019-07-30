Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D317AE31
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 18:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfG3Qkr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 12:40:47 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:46189 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfG3Qkr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 12:40:47 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x6UGeiKe027856;
        Wed, 31 Jul 2019 01:40:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x6UGeiKe027856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564504845;
        bh=5pyHzdfmyGH/cRqaNQinrJDuh/jCPE5pxhd6kJmjsHs=;
        h=From:To:Cc:Subject:Date:From;
        b=N1oKq68H6wAu0Q0UpUYSAM/8g6YZutLs3kM86O/nPJL0MLWAEtAzuNSw9Zqz8sYUa
         twMMgGdm/oAuuPT4R6hHjtgzBYdkSPQTtwwn+a/yE5tV2cA7ht8WYJrrTk9at2krbl
         HRR2wmxRNPtKmR2ggYH93rH7d/01eqmfSaOt+y0u0AFkUkcQViDv+UoP8bJPfdvIxM
         0XevXgx48+8hbZoNht4p4Rq0BmdJrzvQP5MQJ8zGLcVflntCloYeRo7L3n23mqaUH+
         LTuPzfn8boEN48Ibg67Mp+reBgiolQSdrxV5YXFbgGFiCQUOj2nC4lsXZLQxTVzlYK
         WfMqpdHuoiRHg==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] lib/raid6: fix unnecessary rebuild of vpermxor*.c
Date:   Wed, 31 Jul 2019 01:40:42 +0900
Message-Id: <20190730164042.2631-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The following four files are every time rebuilt:

  UNROLL  lib/raid6/vpermxor1.c
  UNROLL  lib/raid6/vpermxor2.c
  UNROLL  lib/raid6/vpermxor4.c
  UNROLL  lib/raid6/vpermxor8.c

I made a mistake in the Makefile refactoring.

Fixes: 72ad21075df8 ("lib/raid6: refactor unroll rules with pattern rules")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/raid6/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 42695bc8d451..0083b5cc646c 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -66,7 +66,7 @@ CFLAGS_vpermxor1.o += $(altivec_flags)
 CFLAGS_vpermxor2.o += $(altivec_flags)
 CFLAGS_vpermxor4.o += $(altivec_flags)
 CFLAGS_vpermxor8.o += $(altivec_flags)
-targets += vpermxor1.o vpermxor2.o vpermxor4.o vpermxor8.o
+targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
 $(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
-- 
2.17.1

