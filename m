Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D341A62F91
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbfGIE0D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:26:03 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42171 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfGIEZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:42 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVm009969;
        Tue, 9 Jul 2019 13:24:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVm009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646295;
        bh=66C6WSUar+9fCnRwYJ6reDlsM+3fNuxKvxVBSvN7M4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q46wm6djBsOMl+UO7ZtYGgKPKq/5uWI1+EejrxIb6jgSgMFQ75kuiq914nMu/wkox
         UWaJOaXFTlI5UhkkLDUw5QQuPkYP8GjokqLebrW67zJHWz0kyhMvyRX49SqaXWWfn1
         5RaasWQ5LjZz8w/Y4fT/31ZmXAHnseqIBx/ca06Ykr/fzMTffYKvlgqd7UFZ+serXT
         jjgFvGFxeVK7+c7kDsUZLRxNkEt7puygIvDtSYROgA20ui1qdp+fue7Zao5DT2g1n0
         Qq7eJnIjoFVv3Bow8jCqqUiIm6AU9unVIBnewsUY87vlr6oNdqb1cMNSHYTnvjJraF
         xBdJgoF5+M7FA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] kbuild: remove duplication from modules.order in sub-directories
Date:   Tue,  9 Jul 2019 13:24:07 +0900
Message-Id: <20190709042416.27554-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, only the top-level modules.order drops duplicated entries.

The modules.order files in sub-directories potentially contain
duplication. To list out the paths of all modules, I want to use
modules.order instead of parsing *.mod files in $(MODVERDIR).

To achieve this, I want to rip off duplication from modules.order
of external modules too.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d827b7a36892..1492e37c3927 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -425,13 +425,10 @@ endif # builtin-target
 #
 # Create commands to either record .ko file or cat modules.order from
 # a subdirectory
-modorder-cmds =						\
-	$(foreach m, $(modorder),			\
-		$(if $(filter %/modules.order, $m),	\
-			cat $m;, echo $m;))
-
 $(modorder-target): $(subdir-ym) FORCE
-	$(Q)(cat /dev/null; $(modorder-cmds)) > $@
+	$(Q){ $(foreach m, $(modorder), \
+	$(if $(filter %/modules.order, $m), cat $m, echo $m);) :; } \
+	| $(AWK) '!x[$$0]++' - > $@
 
 #
 # Rule to compile a set of .o files into one .a file (with symbol table)
-- 
2.17.1

