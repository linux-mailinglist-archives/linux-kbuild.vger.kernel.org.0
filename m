Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D8C6B687
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 08:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbfGQGTH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 02:19:07 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:62962 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfGQGS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:26 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6H6I5Of009435;
        Wed, 17 Jul 2019 15:18:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6H6I5Of009435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563344288;
        bh=2G2F1io/a1Cyo3RLgFQtLEcw7nkwBeLTzPQ6b0qTYgw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0+8YVbrztAoSBFqkGzUPZ8kZKGT1V69CbSed8SLuaCMh1al9n/CsHQJkRVsEuL9f0
         Roitzljx5PR6tv3Jg4S2KH2udpdY8BU4CmSmsCogSuBJ8PA2oYbDRHTRRlHYz2hUZd
         WnAnLNXphpTL1iMItElC+97PRshKMZF5OTTzKvlEStrDc+Pha5mMr9Ew8UiSCISV3n
         QXJjxgu5IWypy87/z73HVWtooH73btg8B0w/TYnCT+JwYg/HFG41/YaTQy3b28lTz0
         6cIJi9O0ePaACVQJAtRM9F8WOWemIaC7LxqhFJAtYieO9Wslvd80P7Rput734rXOuP
         4V6pc4mf8O42Q==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/12] kbuild: remove duplication from modules.order in sub-directories
Date:   Wed, 17 Jul 2019 15:17:51 +0900
Message-Id: <20190717061800.10018-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
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

Changes in v3: None
Changes in v2: None

 scripts/Makefile.build | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 10e92a27ec20..be32a3752de4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -423,13 +423,10 @@ endif # builtin-target
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

