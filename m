Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B69A6EFFD
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2019 18:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfGTQ1v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Jul 2019 12:27:51 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:52415 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfGTQ1u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Jul 2019 12:27:50 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x6KGRfOr009136;
        Sun, 21 Jul 2019 01:27:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x6KGRfOr009136
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563640062;
        bh=YWYhkhyNQMCU9Geqh6mdxj3ov/tBxwsPizahvUIX/a0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BEEnwqfbXR19pOuh8SGXJnppQecZhxjLGO7rcueaPNBJMBeHmFhXoV2yuVP5nSa3F
         rhRmz/hTIAG7AacdWnf5hnkBuuvHsSJ3Je8hdQ9+nYsAbC9TdHtIYt7iNbqaGCdjuw
         nIZrRjFbpOheuDQeWBJ/tqq9dVnKmm8UGdgH9ONM3KhK4RaXZcRk+ny39u8xnloylD
         5PQJxrykWKviZioQq32/JNXDM5vgZV1wTifngvAe3BIrLQmh5/aeVyd2qoNAS2jPuc
         tmAU1qDvakt0y1OQ9DmomwmywpeOdnRgajPxo7S0enjqmHSUvBssY4GOEDKvmMVN+8
         GllZ+WwU8+BYg==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kbuild: make bison create C file and header in a single pattern rule
Date:   Sun, 21 Jul 2019 01:27:39 +0900
Message-Id: <20190720162740.4292-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190720162740.4292-1-yamada.masahiro@socionext.com>
References: <20190720162740.4292-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We generally expect bison to create not only a C file, but also a
header, which will be included from the lexer.

Currently, Kbuild generates them in separate rules. So, for instance,
when building Kconfig, you will notice bison is invoked twice:

  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.h
  HOSTCC  scripts/kconfig/lexer.lex.o
  YACC    scripts/kconfig/parser.tab.c
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf

Make handles such cases nicely in pattern rules [1]. Merge the two
rules so that one invokcation of bison can generate both of them.

  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf

[1] Pattern rule

GNU Make manual says:
"Pattern rules may have more than one target. Unlike normal rules,
this does not act as many different rules with the same prerequisites
and recipe. If a pattern rule has multiple targets, make knows that
the rule's recipe is responsible for making all of the targets. The
recipe is executed only once to make all the targets. When searching
for a pattern rule to match a target, the target patterns of a rule
other than the one that matches the target in need of a rule are
incidental: make worries only about giving a recipe and prerequisites
to the file presently in question. However, when this file's recipe is
run, the other targets are marked as having been updated themselves."

https://www.gnu.org/software/make/manual/html_node/Pattern-Intro.html

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 8625e9b4572c..6c4a2332f6d6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -199,18 +199,12 @@ $(obj)/%.lex.c: $(src)/%.l FORCE
 
 # YACC
 # ---------------------------------------------------------------------------
-quiet_cmd_bison = YACC    $@
-      cmd_bison = $(YACC) -o$@ -t -l $<
+quiet_cmd_bison = YACC    $(basename $@).[ch]
+      cmd_bison = $(YACC) -o $(basename $@).c --defines=$(basename $@).h -t -l $<
 
-$(obj)/%.tab.c: $(src)/%.y FORCE
+$(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
 	$(call if_changed,bison)
 
-quiet_cmd_bison_h = YACC    $@
-      cmd_bison_h = $(YACC) -o/dev/null --defines=$@ -t -l $<
-
-$(obj)/%.tab.h: $(src)/%.y FORCE
-	$(call if_changed,bison_h)
-
 # Shipped files
 # ===========================================================================
 
-- 
2.17.1

