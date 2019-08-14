Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 075C68D195
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 12:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbfHNKyf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Aug 2019 06:54:35 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:52502 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfHNKyf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 06:54:35 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x7EAs34Z024567;
        Wed, 14 Aug 2019 19:54:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x7EAs34Z024567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565780045;
        bh=Hfj4V/SBxgMk8U6X1oeV3V2ByVnCtLeD3aXokuYTB1c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BUATFTtS5AvC8UcDPz6n9Zj9WT0D6gRgAi+/ewDBpRFbUUu08HiVa0LeFInEI4ylJ
         FR4qubC6Z2NH08PWOPzRKylDm+VaZS1qgpkO2PwPrPG6Zzyjry/vvyUi/dowm+0G/C
         Jy3o5wQWqOnJlNmC5B8gXJNn4gHgtzTfY51QYvV7EBpE8cOysywhvLLnUMEIxdSTbl
         HTID/JZomIaSP7c+lhSztnQSRWv6ngVNn/8jV9ZR4B7/o2E7Trh2/3z/MfF0sdy4hu
         bnle3vHXyJTPDu5Rfu4L2PEQEKl5hCMgPhalgJk6y4pEqumiEUPWPJ46Y/+a5e068n
         1lhb9Sv0xLdgA==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] docs: kbuild: remove cc-ldoption from document again
Date:   Wed, 14 Aug 2019 19:54:00 +0900
Message-Id: <20190814105400.1339-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814105400.1339-1-yamada.masahiro@socionext.com>
References: <20190814105400.1339-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 055efab3120b ("kbuild: drop support for cc-ldoption") correctly
removed the cc-ldoption from Documentation/kbuild/makefiles.txt, but
commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename
to *.rst") revived it. I guess it was a rebase mistake.

Remove it again.

Fixes: cd238effefa2 ("docs: kbuild: convert docs to ReST and rename to *.rst")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index b4c28c543d72..7971729d1fd4 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -471,21 +471,6 @@ more details, with real examples.
 	The second argument is optional, and if supplied will be used
 	if first argument is not supported.
 
-    cc-ldoption
-	cc-ldoption is used to check if $(CC) when used to link object files
-	supports the given option.  An optional second option may be
-	specified if first option are not supported.
-
-	Example::
-
-		#arch/x86/kernel/Makefile
-		vsyscall-flags += $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
-
-	In the above example, vsyscall-flags will be assigned the option
-	-Wl$(comma)--hash-style=sysv if it is supported by $(CC).
-	The second argument is optional, and if supplied will be used
-	if first argument is not supported.
-
     as-instr
 	as-instr checks if the assembler reports a specific instruction
 	and then outputs either option1 or option2
-- 
2.17.1

