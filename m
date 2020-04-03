Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A2319E047
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2020 23:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgDCV0T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 17:26:19 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:42404 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgDCV0T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 17:26:19 -0400
Received: from grover.flets-west.jp (softbank126093124033.bbtec.net [126.93.124.33]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 033LP536011098;
        Sat, 4 Apr 2020 06:25:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 033LP536011098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585949107;
        bh=itiQkkf048F6kCh4pcS/naHcdFnBaw1elbH1EPVVg1U=;
        h=From:To:Cc:Subject:Date:From;
        b=h6foS4CJXpAZEodoGqHX1CstzNsnmlzlclJEt/JW0nHe1anWa+ZmggaUMMAXb4uyj
         naVcGgfLLjdpcfy/eGPEs3bnLQ/kvLV1zqxgJwpukFsnI5wdXW1xHipNBtgtB/nxDO
         BoHv0/K0Zqp7iLDqCjBrJ34QDMvTGrl1Q3w+UzQCBMrJzXwe8/oyrrcLB7fgAY+bo/
         nHKpSlfEDnXuZcRkL7HRe+mEGIbFR6qmywii3yeT3BkDkXSvOf4Gdrc6JB4Kl2doTo
         kuvlvP9glwwC9CXZ73oDDFujQEDKW6YSQA2fW9MX+mlWUxbGwCqMkwZsjFf0g3dD/o
         mu/gnuxCDdo8g==
X-Nifty-SrcIP: [126.93.124.33]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h
Date:   Sat,  4 Apr 2020 06:24:59 +0900
Message-Id: <20200403212459.13914-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/mkcompile_h uses $(CC) only for getting the version string.

I suspected there was a specific reason why the additional flags were
needed, and dug the commit history. This code dates back to at least
2002 [1], but I could not get any more clue.

Just get rid of it.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=29f3df7eba8ddf91a55183f9967f76fbcc3ab742

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Makefile b/init/Makefile
index 30aa8ab11120..d45e967483b2 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
 	@$($(quiet)chk_compile.h)
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
-	"$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)" "$(LD)"
+	"$(CONFIG_PREEMPT_RT)" "$(CC)" "$(LD)"
-- 
2.17.1

